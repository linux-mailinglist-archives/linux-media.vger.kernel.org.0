Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C95177A67E2
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 17:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233144AbjISPUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 11:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233052AbjISPUH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 11:20:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D269BE
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 08:20:01 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDF3C433C7;
        Tue, 19 Sep 2023 15:19:59 +0000 (UTC)
Message-ID: <ceac5f47-c1d4-48da-8c58-203b94ea45bb@xs4all.nl>
Date:   Tue, 19 Sep 2023 17:19:58 +0200
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
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2023 15:36, Benjamin Gaignard wrote:
> Add new test for DELETE_BUFS ioctl.
> It create buffers and check if they could be removed from queue.
> It also check that removing non existing buffer or a queued
> buffer failed.
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

Just assign to {}, so: deletebufs = {};

> +	int ret;
> +
> +	memset(&deletebufs, 0, sizeof(deletebufs));

Then this can be dropped.

> +	deletebufs.type = q->type;
> +	deletebufs.index = index;
> +	deletebufs.count = count;
> +
> +	ret = v4l_ioctl(f, VIDIOC_DELETE_BUFS, &deletebufs);
> +	if (!ret)
> +		q->buffers -= deletebufs.count;

This going to be a problem: q->buffers is currently used in a lot of places
as the max buffer index, which is no longer true.

But my brain is fried after reviewing this series for most of the day :-)

I've finished reviewing the kernel series, but I will take another look at this
v4l2-compliance patch tomorrow.

Regards,

	Hans

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
> +	}
> +
> +	return 0;
> +}
> +
>  int testReqBufs(struct node *node)
>  {
>  	struct v4l2_create_buffers crbufs = { };

