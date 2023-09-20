Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE8D7A7611
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 10:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbjITIks (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 04:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbjITIkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 04:40:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EB593
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 01:40:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7967CC433C8;
        Wed, 20 Sep 2023 08:40:37 +0000 (UTC)
Message-ID: <48c845f8-6ba1-448f-ac72-f9b3b2c173ca@xs4all.nl>
Date:   Wed, 20 Sep 2023 10:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] v4l2-compliance: Add a test for DELETE_BUF ioctl
Content-Language: en-US, nl
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, kernel@collabora.com
References: <20230914133615.199122-1-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133615.199122-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On 14/09/2023 15:36, Benjamin Gaignard wrote:
> Add new test for DELETE_BUFS ioctl.
> It create buffers and check if they could be removed from queue.
> It also check that removing non existing buffer or a queued
> buffer failed.

The DELETE_BUFS patch series really adds two different features:

1) Allow for more than 32 buffers,
2) Allow deleting buffers.

That means that I actually would like to see two v4l2-compliance patches:
one for each item. This is especially important since I would like to see
the first feature being merged first.

One of the interesting things about writing compliance tests is how to
know what the driver supports. And right now there is no way to detect
the maximum number of buffers without actually allocating them.

There are a number of ways of doing this. One is to use the top 16 bits
of the capabilities field in v4l2_requestbuffers and v4l2_create_buffers
to store the max number of buffers that can be used.

But that takes away 16 bits of that 32 bit field.

Another option is to use the reserved fields to store this, but for
v4l2_requestbuffers that's awkward since it would end up looking like this:

	__u8 flags;
	__u8 reserved[1];
	__u16 max_buffers;

(i.e. a reserved field in the middle of a struct)

Another option is to only report this in v4l2_create_buffers by using one
of the __u32 reserved fields.

This might be the best option, but it requires that the driver supports
this ioctl. But that is something that can be checked, certainly in
v4l2-compliance and likely in the kernel itself.

My proposal would be to add a new buffer capability:

	#define V4L2_BUF_CAP_SUPPORTS_OVER_32_BUFS 0x00000080

This signals that the driver supports more than 32 buffers. And in
v4l2_create_buffers take one of the reserved fields and change it to

	__u32 max_buffers;

Note that I really, really believe we need a replacement for both
VIDIOC_REQBUFS and VIDIOC_CREATE_BUFFERS. Something for later, though.

This will require some extra work in the kernel patch series, but
you don't want userspace to have to guess.

The v4l2-ctl and v4l2-compliance utils need to be adapted to support these
extra fields/flags and v4l2-compliance needs to test this. Note that there
are no tests at the moment checking support for more than 32 buffers.
It is so hardwired into the kernel that I never bothered implementing tests
for this.

The v4l2-ctl/compliance utilities use VIDEO_MAX_FRAME in several places, that
should be modified in a separate first patch; utils/common/v4l-helpers.h
is probably trickiest: there are some fixed arrays in v4l2_queue that need
to become dynamically allocated.

To detect if DELETE_BUFS is present you can just try to call the ioctl,
but I always think that that is a poor-man's option. Adding another
capability would be a much better approach:

	#define V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS 0x00000100

But supporting DELETE_BUFS in the utilities is a lot harder: the (c)v4l-helpers.h
headers rely on all buffers having contiguous indices, so you see a lot of
loops like:

	for (b = from; b < v4l_queue_g_buffers(q); b++) {

I think that the only realistic way for these utilities to handle this
cleanly is if they keep track of the valid buffer indices. Basically they
need a bufs_bitmap as well. It is probably helpful as well to keep track
of the max allocated index. Then they can so something like:

	for (b = from; b < v4l_queue_g_max_buf_index(q); b++) {
		if (unused_idx(q, b))
			continue;

It is certainly a non-trivial amount of work, but this will also help
detect any corner cases in the DELETE_BUFS ioctl.

More comments follow below in the code...

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  include/linux/videodev2.h                   | 16 ++++
>  utils/common/cv4l-helpers.h                 |  4 +
>  utils/common/v4l-helpers.h                  | 17 ++++
>  utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
>  utils/v4l2-compliance/v4l2-compliance.h     |  1 +
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 92 +++++++++++++++++++++
>  6 files changed, 131 insertions(+)
> 
> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> index c19441a1..9cea9900 100644
> --- a/include/linux/videodev2.h
> +++ b/include/linux/videodev2.h
> @@ -2543,6 +2543,21 @@ struct v4l2_create_buffers {
>  	__u32			reserved[6];
>  };
>  
> +/**
> + * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
> + * @index:	the first buffer to be deleted
> + * @count:	number of buffers to delete
> + * @type:	enum v4l2_buf_type; buffer type (type == *_MPLANE for
> + *		multiplanar buffers);
> + * @reserved:	futur extensions
> + */
> +struct v4l2_delete_buffers {
> +	__u32			index;
> +	__u32			count;
> +	__u32			type;
> +	__u32			reserved[13];
> +};
> +
>  /*
>   *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
>   *
> @@ -2642,6 +2657,7 @@ struct v4l2_create_buffers {
>  #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
>  
>  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
> +#define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_buffers)
>  
>  /* Reminder: when adding new ioctls please add support for them to
>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
> index 91a04146..c15c6658 100644
> --- a/utils/common/cv4l-helpers.h
> +++ b/utils/common/cv4l-helpers.h
> @@ -759,6 +759,10 @@ public:
>  	{
>  		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count, flags);
>  	}
> +	int delete_bufs(cv4l_fd *fd, unsigned index = 0, unsigned count = 0)
> +	{
> +		return v4l_queue_delete_bufs(fd->g_v4l_fd(), this, index, count);
> +	}
>  	bool has_create_bufs(cv4l_fd *fd) const
>  	{
>  		return v4l_queue_has_create_bufs(fd->g_v4l_fd(), this);
> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
> index f8e96d58..dcb2a58a 100644
> --- a/utils/common/v4l-helpers.h
> +++ b/utils/common/v4l-helpers.h
> @@ -1508,6 +1508,23 @@ static inline void *v4l_queue_g_dataptr(const struct v4l_queue *q, unsigned inde
>  	return v4l_queue_g_mmapping(q, index, plane);
>  }
>  
> +static inline int v4l_queue_delete_bufs(struct v4l_fd *f, struct v4l_queue *q, unsigned index, unsigned count)
> +{
> +	struct v4l2_delete_buffers deletebufs;
> +	int ret;
> +
> +	memset(&deletebufs, 0, sizeof(deletebufs));
> +	deletebufs.type = q->type;
> +	deletebufs.index = index;
> +	deletebufs.count = count;
> +
> +	ret = v4l_ioctl(f, VIDIOC_DELETE_BUFS, &deletebufs);
> +	if (!ret)
> +		q->buffers -= deletebufs.count;
> +
> +	return ret;
> +}
> +
>  static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, unsigned from)
>  {
>  	unsigned b, p;
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index f62016e5..1abd16b5 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1448,6 +1448,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  
>  		printf("Buffer ioctls%s:\n", suffix);
>  		printf("\ttest VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: %s\n", ok(testReqBufs(&node)));
> +		printf("\ttest VIDIOC_DELETE_BUFS: %s\n", ok(testDeleteBufs(&node)));
>  		// Reopen after each streaming test to reset the streaming state
>  		// in case of any errors in the preceeding test.
>  		node.reopen();
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index 7caf254b..99553d94 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -383,6 +383,7 @@ int testReqBufs(struct node *node);
>  int testReadWrite(struct node *node);
>  int testExpBuf(struct node *node);
>  int testBlockingWait(struct node *node);
> +int testDeleteBufs(struct node *node);
>  
>  // 32-bit architecture, 32/64-bit time_t tests
>  int testTime32_64(struct node *node);
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index 6d592c9b..d66e090d 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -529,6 +529,98 @@ static int testCanSetSameTimings(struct node *node)
>  	return 0;
>  }
>  
> +int testDeleteBufs(struct node *node)
> +{
> +	bool can_stream = node->g_caps() & V4L2_CAP_STREAMING;
> +	int ret;
> +	unsigned i;
> +
> +	node->reopen();
> +
> +	cv4l_queue q(0, 0);
> +
> +	ret = q.reqbufs(node, 0);
> +	if (ret == ENOTTY) {
> +		fail_on_test(can_stream);
> +		return ret;
> +	}
> +
> +	ret = q.delete_bufs(node, 0, 0);
> +	if (ret == ENOTTY)
> +		return ret;

When we have a new V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS capability, that should be used
to check that it is consistent with whether or not this ioctl works.

You should also test here that the reserved field is zeroed, and all other
fields are set to sane values. Search for check_0 in the source code where I do
that for other ioctls.

> +
> +	for (i = 1; i <= V4L2_BUF_TYPE_LAST; i++) {
> +		if (!(node->valid_buftypes & (1 << i)))
> +			continue;
> +
> +		if (testSetupVbi(node, i))
> +			continue;
> +
> +		info("test buftype %s\n", buftype2s(i).c_str());
> +		if (node->valid_buftype == 0)
> +			node->valid_buftype = i;
> +
> +		q.init(i, V4L2_MEMORY_MMAP);
> +		ret = q.create_bufs(node, 0);
> +		fail_on_test_val(ret && ret != EINVAL, ret);
> +		if (!ret) {
> +			unsigned buffers;
> +			fail_on_test(q.create_bufs(node, 1));
> +			buffers = q.g_buffers();
> +			fail_on_test(buffers == 0);
> +			fail_on_test(q.g_type() != i);

No need to test this, it's tested elsewhere.

> +			fail_on_test(q.delete_bufs(node, 1, buffers) != EINVAL);
> +			fail_on_test(q.delete_bufs(node, 0, buffers));
> +			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
> +			fail_on_test(q.create_bufs(node, 3));
> +			fail_on_test(q.delete_bufs(node, 2, 1));
> +			fail_on_test(q.delete_bufs(node, 0, 1));
> +			fail_on_test(q.delete_bufs(node, 1, 1));
> +			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);

You need to test delete_bufs with invalid values: e.g. index + count > max_allowed_buffers,
also for corner cases where index + count would overflow (e.g. index = 3, count = 0xffffffff).

Also test allocating 5 buffers, deleting 2 buffers from index 1,
call create_bufs to allocate 3 buffers, then check that it will allocate
the new buffers from the highest index. Next call create_bufs to allocate
2 buffers: that should allocate them from index 1.

Also test that after deleting a buffer, calling querybuf for that index
will fail.

Check that using an invalid buffer type will result in EINVAL.

Note that for some of these tests you have to call the ioctl directly
without going through the helpers, since those helpers sanitize the
struct. Great when writing normal code, but for writing compliance tests
it won't do.

> +		}
> +
> +		q.init(i, V4L2_MEMORY_USERPTR);
> +		ret = q.reqbufs(node, 0);
> +		fail_on_test_val(ret && ret != EINVAL, ret);
> +		if (!ret) {
> +			unsigned buffers;
> +			fail_on_test(q.create_bufs(node, 1));
> +			buffers = q.g_buffers();
> +			fail_on_test(buffers == 0);
> +			fail_on_test(q.g_type() != i);
> +			fail_on_test(q.delete_bufs(node, 1, buffers) != EINVAL);
> +			fail_on_test(q.delete_bufs(node, 0, buffers));
> +			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
> +			fail_on_test(q.create_bufs(node, 3));
> +			fail_on_test(q.delete_bufs(node, 2, 1));
> +			fail_on_test(q.delete_bufs(node, 0, 1));
> +			fail_on_test(q.delete_bufs(node, 1, 1));
> +			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
> +		}
> +
> +		q.init(i, V4L2_MEMORY_DMABUF);
> +		ret = q.reqbufs(node, 0);
> +		fail_on_test_val(ret && ret != EINVAL, ret);
> +		if (!ret) {
> +			unsigned buffers;
> +			fail_on_test(q.create_bufs(node, 1));
> +			buffers = q.g_buffers();
> +			fail_on_test(buffers == 0);
> +			fail_on_test(q.g_type() != i);
> +			fail_on_test(q.delete_bufs(node, 1, buffers) != EINVAL);
> +			fail_on_test(q.delete_bufs(node, 0, buffers));
> +			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
> +			fail_on_test(q.create_bufs(node, 3));
> +			fail_on_test(q.delete_bufs(node, 2, 1));
> +			fail_on_test(q.delete_bufs(node, 0, 1));
> +			fail_on_test(q.delete_bufs(node, 1, 1));
> +			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
> +		}

I think it is sufficient to test with MEMORY_MMAP only, that is always
present if the driver can do streaming I/O. Testing for other memory models
doesn't add anything in this specific case.

> +	}
> +
> +	return 0;
> +}
> +
>  int testReqBufs(struct node *node)
>  {
>  	struct v4l2_create_buffers crbufs = { };

Regards,

	Hans
