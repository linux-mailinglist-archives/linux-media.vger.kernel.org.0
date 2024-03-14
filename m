Return-Path: <linux-media+bounces-7069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BE187BD5E
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 14:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BDC5B21733
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 13:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED475B053;
	Thu, 14 Mar 2024 13:12:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099155C902
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710421938; cv=none; b=AbM2pDwnQE0y+M29iPUrpbqHNQ/k+MmkxYCDGJQfCKEjOdPZTYE4Ku26sbUcszsoGQmgCNtW68g1dJM6Z1EOSt0NKYRZMrVKYFRPTVQSBMe7T1R8MpBHHehxD0b0brRJBaavF/PrZPr6j8mfhZkHxnHDsL2PGaCwLUXc47QIfe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710421938; c=relaxed/simple;
	bh=fL31nOzx6hT/SAo+ShpY6eC7khlkdURB/TGtcpHf9iA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=q2vRL1cgctcBjWFZpo3xFyBtoIDFo5eOzFlKjmv113eTrpXQuTj/aFEdB9FN84p2EOIAddikvMXKQPsbkDp1VbNneo+88E6FN6wkb3wZ2WofowTIDmObyyVmzKUoKoy515DWrRkoXHOEwUG1CI8Kq6qpOS3wK/eXGbiYP5jCh/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08B4C433C7;
	Thu, 14 Mar 2024 13:12:16 +0000 (UTC)
Message-ID: <538b985e-3615-4197-bc33-ecba077fecc2@xs4all.nl>
Date: Thu, 14 Mar 2024 14:12:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] v4l2-compliance: Add a test for REMOVE_BUFS ioctl
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org
References: <20240221155551.100156-1-benjamin.gaignard@collabora.com>
 <20240221155551.100156-3-benjamin.gaignard@collabora.com>
 <f326b9f8-a3ff-4dfc-b6b5-2f19ebf47140@xs4all.nl>
In-Reply-To: <f326b9f8-a3ff-4dfc-b6b5-2f19ebf47140@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/2024 12:38 pm, Hans Verkuil wrote:
> On 21/02/2024 4:55 pm, Benjamin Gaignard wrote:
>> Add new test for REMOVE_BUFS ioctl.
>> It create buffers and check if they could be removed from queue.
>> It also check that removing non existing buffer or a queued
>> buffer failed.
>> Since using REMOVE_BUFS can create "holes" v4l_queue_querybufs()
>> function needs to be modify to do a range check between [from..from+count-1].
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>  utils/common/cv4l-helpers.h                 |  4 +
>>  utils/common/v4l-helpers.h                  | 27 ++++--
>>  utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
>>  utils/v4l2-compliance/v4l2-compliance.h     |  1 +
>>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 99 +++++++++++++++++++++
>>  5 files changed, 127 insertions(+), 5 deletions(-)
>>
>> diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
>> index 77c6517a..afe8d469 100644
>> --- a/utils/common/cv4l-helpers.h
>> +++ b/utils/common/cv4l-helpers.h
>> @@ -764,6 +764,10 @@ public:
>>  	{
>>  		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count, flags);
>>  	}
>> +	int remove_bufs(cv4l_fd *fd, unsigned index = 0, unsigned count = 0)
>> +	{
>> +		return v4l_queue_remove_bufs(fd->g_v4l_fd(), this, index, count);
>> +	}
>>  	bool has_create_bufs(cv4l_fd *fd) const
>>  	{
>>  		return v4l_queue_has_create_bufs(fd->g_v4l_fd(), this);
>> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
>> index 7387b621..1240c23f 100644
>> --- a/utils/common/v4l-helpers.h
>> +++ b/utils/common/v4l-helpers.h
>> @@ -1513,12 +1513,29 @@ static inline void *v4l_queue_g_dataptr(const struct v4l_queue *q, unsigned inde
>>  	return v4l_queue_g_mmapping(q, index, plane);
>>  }
>>  
>> -static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, unsigned from)
>> +static inline int v4l_queue_remove_bufs(struct v4l_fd *f, struct v4l_queue *q, unsigned index, unsigned count)
>>  {
>> -	unsigned b, p;
>> +	struct v4l2_remove_buffers removebufs;
>>  	int ret;
>>  
>> -	for (b = from; b < v4l_queue_g_buffers(q); b++) {
>> +	memset(&removebufs, 0, sizeof(removebufs));
>> +	removebufs.type = q->type;
>> +	removebufs.index = index;
>> +	removebufs.count = count;
>> +
>> +	ret = v4l_ioctl(f, VIDIOC_REMOVE_BUFS, &removebufs);
>> +	if (!ret)
>> +		q->buffers -= removebufs.count;
>> +
>> +	return ret;
>> +}
>> +
>> +static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, unsigned from, unsigned count)
>> +{
>> +	unsigned b, p, max = from + count;
>> +	int ret;
>> +
>> +	for (b = from; b < max; b++) {
>>  		struct v4l_buffer buf;
>>  
>>  		v4l_buffer_init(&buf, v4l_queue_g_type(q), v4l_queue_g_memory(q), b);
>> @@ -1556,7 +1573,7 @@ static inline int v4l_queue_reqbufs(struct v4l_fd *f,
>>  		return ret;
>>  	q->buffers = reqbufs.count;
>>  	q->capabilities = reqbufs.capabilities;
>> -	return v4l_queue_querybufs(f, q, 0);
>> +	return v4l_queue_querybufs(f, q, 0, reqbufs.count);
>>  }
>>  
>>  static inline bool v4l_queue_has_create_bufs(struct v4l_fd *f, const struct v4l_queue *q)
>> @@ -1596,7 +1613,7 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
>>  	if (q->capabilities & V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS)
>>  		q->max_num_buffers = createbufs.max_num_buffers;
>>  	q->buffers += createbufs.count;
>> -	return v4l_queue_querybufs(f, q, q->buffers - createbufs.count);
>> +	return v4l_queue_querybufs(f, q, createbufs.index, createbufs.count);
>>  }
>>  
>>  static inline int v4l_queue_mmap_bufs(struct v4l_fd *f,
>> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
>> index 2f7a5058..c6a685eb 100644
>> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
>> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
>> @@ -1466,6 +1466,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>>  		printf("Buffer ioctls%s:\n", suffix);
>>  		printf("\ttest VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: %s\n", ok(testReqBufs(&node)));
>>  		printf("\ttest CREATE_BUFS maximum buffers: %s\n", ok(testCreateBufsMax(&node)));
>> +		printf("\ttest VIDIOC_REMOVE_BUFS: %s\n", ok(testRemoveBufs(&node)));
>>  		// Reopen after each streaming test to reset the streaming state
>>  		// in case of any errors in the preceeding test.
>>  		node.reopen();
>> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
>> index 0cfc9a37..b6e342f3 100644
>> --- a/utils/v4l2-compliance/v4l2-compliance.h
>> +++ b/utils/v4l2-compliance/v4l2-compliance.h
>> @@ -385,6 +385,7 @@ int testReadWrite(struct node *node);
>>  int testExpBuf(struct node *node);
>>  int testBlockingWait(struct node *node);
>>  int testCreateBufsMax(struct node *node);
>> +int testRemoveBufs(struct node *node);
>>  
>>  // 32-bit architecture, 32/64-bit time_t tests
>>  int testTime32_64(struct node *node);
>> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> index 922b99b5..f71a3c0e 100644
>> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> @@ -529,6 +529,105 @@ static int testCanSetSameTimings(struct node *node)
>>  	return 0;
>>  }
>>  
>> +int testRemoveBufs(struct node *node)
>> +{
>> +	int ret;
>> +	unsigned i;
>> +
>> +	node->reopen();
>> +
>> +	for (i = 1; i <= V4L2_BUF_TYPE_LAST; i++) {
>> +		struct v4l2_remove_buffers removebufs = { };
>> +
>> +		if (!(node->valid_buftypes & (1 << i)))
>> +			continue;
>> +
>> +		cv4l_queue q(i, V4L2_MEMORY_MMAP);
>> +
>> +		if (testSetupVbi(node, i))
>> +			continue;
>> +		ret = q.remove_bufs(node, 0, 0);
>> +		if (ret == ENOTTY) {
>> +			warn("VIDIOC_REMOVE_BUFS not supported\n");
>> +			continue;
>> +		}
>> +
>> +		q.init(i, V4L2_MEMORY_MMAP);
>> +		ret = q.create_bufs(node, 0);
>> +		fail_on_test_val(ret && ret != EINVAL, ret);
> 
> Why the EINVAL check? If q.remove_bufs is present, then q.create_bufs must
> also be present. And creating '0' buffers should always work.
> 
>> +
>> +		memset(&removebufs, 0xff, sizeof(removebufs));
>> +		removebufs.index = 0;
>> +		removebufs.count = 0;
>> +		removebufs.type = q.g_type();
>> +		fail_on_test(doioctl(node, VIDIOC_REMOVE_BUFS, &removebufs));
>> +		fail_on_test(check_0(removebufs.reserved, sizeof(removebufs.reserved)));
>> +
>> +		if (!ret) {
> 
> With the above in mind, this 'if' can just be dropped and everything below
> has one less TAB indentation.
> 
>> +			unsigned buffers;
>> +			buffer buf(i);
>> +
>> +			/* Create only 1 buffer */
>> +			fail_on_test(q.create_bufs(node, 1));
>> +			buffers = q.g_buffers();
>> +			fail_on_test(buffers == 0);
> 
> Why not 'fail_on_test(buffers != 1);'?
> 
>> +			/* Removing buffer index 1 must fail */
>> +			fail_on_test(q.remove_bufs(node, 1, buffers) != EINVAL);
>> +			/* Removing buffer index 0 is valid */
>> +			fail_on_test(q.remove_bufs(node, 0, buffers));
>> +			/* Removing buffer index 0 again must fail */
>> +			fail_on_test(q.remove_bufs(node, 0, 1) != EINVAL);
>> +			/* Create 3 buffers indexes 0 to 2 */
>> +			fail_on_test(q.create_bufs(node, 3));
>> +			/* Remove them one by one */
>> +			fail_on_test(q.remove_bufs(node, 2, 1));
>> +			fail_on_test(q.remove_bufs(node, 0, 1));
>> +			fail_on_test(q.remove_bufs(node, 1, 1));
>> +			/* Removing buffer index 0 again must fail */
>> +			fail_on_test(q.remove_bufs(node, 0, 1) != EINVAL);
>> +
>> +			/* for the next test the queue needs to be able to allocate 7 buffers */
>> +			if (q.g_max_num_buffers() < 7)
> 
> Can g_max_num_buffers ever be < 32? Do we allow that? If so, does that work?
> I think we shouldn't allow that as it can potentially cause problems with
> existing applications that expect up to 32 buffers.
> 
> Looking at the current vb2 code I think it is allowed, but I think we
> should forbid it, at least for now. So an attempt by a driver to set
> q->max_num_buffers to a non-zero value < 32 should be rejected with
> a WARN_ON().
> 
>> +				continue;
>> +
>> +			/* Create 4 buffers indexes 0 to 3 */
>> +			fail_on_test(q.create_bufs(node, 4));
>> +			/* Remove buffers index 1 and 2 */
>> +			fail_on_test(q.remove_bufs(node, 1, 2));
>> +			/* Add 3 more buffers should be indexes 4 to 6 */
>> +			fail_on_test(q.create_bufs(node, 3));
>> +			/* Query buffers:
>> +			 * 1 and 2 have been removed they must fail
>> +			 * 0 and 4 to 6 must exist*/
> 
> Shouldn't that be '3 to 6' instead of '4 to 6'?
> 
>> +			fail_on_test(buf.querybuf(node, 0));
>> +			fail_on_test(buf.querybuf(node, 1) != EINVAL);
>> +			fail_on_test(buf.querybuf(node, 2) != EINVAL);
> 
> Missing test for buffer index 3.
> 
>> +			fail_on_test(buf.querybuf(node, 4));
>> +			fail_on_test(buf.querybuf(node, 5));
>> +			fail_on_test(buf.querybuf(node, 6));
> 
> Add checks to verify that remove_bufs works if count == 0 and index is
> 0, 1, 6, 7 or 0xffffffff. I.e. regardless of the buffer index, if count == 0
> remove_bufs should just return 0.
> 
>> +			/* Remove existing buffer index 6 with bad type must fail */
>> +			memset(&removebufs, 0xff, sizeof(removebufs));
>> +			removebufs.index = 6;
>> +			removebufs.count = 1;
>> +			removebufs.type = 0;
>> +			fail_on_test(doioctl(node, VIDIOC_REMOVE_BUFS, &removebufs) != EINVAL);
> 
> If count == 0, should this also fail or not? We certainly need a test for that,
> but I'm not sure what it should do.
> 
> I'll reply to patch v20 7/9 as well about this.
> 
>> +
>> +			/* Remove crossing max allowed buffers boundary must fail */
>> +			fail_on_test(q.remove_bufs(node, q.g_max_num_buffers() - 2, 7) != EINVAL);
>> +
>> +			/* Remove overflow must fail */
>> +			fail_on_test(q.remove_bufs(node, 3, 0xfffffff) != EINVAL);
> 
> I'd like to see a test removing 2 buffers from index 2: that should fail.
> Ditto for removing 2 buffers from index 0.
> 
>> +
>> +			/* Create 2 buffers, that must fill the hole */
>> +			fail_on_test(q.create_bufs(node, 2));
>> +			/* Remove all buffers */
>> +			fail_on_test(q.remove_bufs(node, 0, 7));

You need to end with this:

			fail_on_test(q.reqbufs(node, 0));

Otherwise the queue will remain marked as busy and v4l2-compliance will
fail on /dev/vbiX devices.

The reason it fails on vbi devices is that those can be opened with two
different buffer types: VBI_CAPTURE and SLICED_VBI_CAPTURE. The vivid
driver supports both types, and running this test for VBI_CAPTURE is fine,
but running it for the next type fails because the queue is still in
use for type VBI_CAPTURE.

Regards,

	Hans

>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  int testReqBufs(struct node *node)
>>  {
>>  	struct v4l2_create_buffers crbufs = { };
> 
> Regards,
> 
> 	Hans
> 


