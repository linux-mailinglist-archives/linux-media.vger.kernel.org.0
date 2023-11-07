Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0F77E39F4
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 11:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbjKGKgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 05:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233796AbjKGKgh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 05:36:37 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1303A122
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 02:36:33 -0800 (PST)
Received: from [100.98.136.55] (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EFB5C66073D5;
        Tue,  7 Nov 2023 10:36:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1699353391;
        bh=n/LDhkjTcZts8rbHpQkjZYPzgCptu1gaDUwmg95Dpo0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hJhy7I6oaWgoRyO4CQkQ+Wq/g75t6H+77k5ZLdWvLH7GrIm8LqxgkdRPNbM6KtD9M
         iFekq9Cx8ey35SpMNuERaiEeenSBD4DG7Neh+e5WVZtae54/L/bNNLHFggoVOpXlGJ
         k7SrkQV9Oi1nLFvLrzXJtj4smPPVsl0ed62qhmTpTVWL4vSsgIA6z6SXKrpzhVtMeV
         ve7ucpiXS03A601DAw9d/QyzSkCZoZ6bLq4MhhFRA/kQql08Vr6TCOyeJXXMdD8P1E
         5fltAdDCeuJTEhoXQPtFX/Bh3kGKVIlbGjfwTJ2SQYo+5eSGY+HjfXy4U/iQwTQRxh
         K8xdP04uukPMQ==
Message-ID: <c542bd16-6d2d-4c35-bf8d-945b3ae8a391@collabora.com>
Date:   Tue, 7 Nov 2023 11:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] v4l2-compliance: Test queue maximum buffers
 allocation
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        nicolas.dufresne@collabora.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@collabora.com
References: <20231031152722.84444-1-benjamin.gaignard@collabora.com>
 <20231031152722.84444-3-benjamin.gaignard@collabora.com>
 <f25c5bd5-7839-4325-8f05-1e4d7e0b7d3e@xs4all.nl>
Content-Language: en-US
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <f25c5bd5-7839-4325-8f05-1e4d7e0b7d3e@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 07/11/2023 à 11:18, Hans Verkuil a écrit :
> On 31/10/2023 16:27, Benjamin Gaignard wrote:
>> If  V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS is set v4l2_create_buffers
>> 'max_num_buffers' field reports the maximum number of buffers supported
>> by the queue.
>> Add a test to allocate this maximum value and make sure that one
>> more allocation is failing.
>> Display the flag in v4l2-ctl.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> version 5:
>> - change g_max_buffers() to g_max_num_buffers().
>> - change v4l_queue_g_max_buffers() to v4l_queue_g_max_num_buffers().
>> - rename struct v4l_queue max_buffers field to max_num_buffers.
>> - fix V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS name in bufcap_def array.
>> - only test MMAP streaming mode.
>> - rework test code.
>>
>>   utils/common/cv4l-helpers.h                 |  1 +
>>   utils/common/v4l-helpers.h                  |  5 +++
>>   utils/common/v4l2-info.cpp                  |  1 +
>>   utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
>>   utils/v4l2-compliance/v4l2-compliance.h     |  1 +
>>   utils/v4l2-compliance/v4l2-test-buffers.cpp | 41 +++++++++++++++++++++
>>   6 files changed, 50 insertions(+)
>>
>> diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
>> index 91a04146..199aca36 100644
>> --- a/utils/common/cv4l-helpers.h
>> +++ b/utils/common/cv4l-helpers.h
>> @@ -743,6 +743,7 @@ public:
>>   	unsigned g_type() const { return v4l_queue_g_type(this); }
>>   	unsigned g_memory() const { return v4l_queue_g_memory(this); }
>>   	unsigned g_buffers() const { return v4l_queue_g_buffers(this); }
>> +	unsigned g_max_num_buffers() const { return v4l_queue_g_max_num_buffers(this); }
>>   	unsigned g_num_planes() const { return v4l_queue_g_num_planes(this); }
>>   	unsigned g_capabilities() const { return v4l_queue_g_capabilities(this); }
>>   	unsigned g_length(unsigned plane) const { return v4l_queue_g_length(this, plane); }
>> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
>> index f8e96d58..cf0e92df 100644
>> --- a/utils/common/v4l-helpers.h
>> +++ b/utils/common/v4l-helpers.h
>> @@ -1429,6 +1429,7 @@ struct v4l_queue {
>>   	unsigned mappings;
>>   	unsigned num_planes;
>>   	unsigned capabilities;
>> +	unsigned max_num_buffers;
>>   
>>   	__u32 lengths[VIDEO_MAX_PLANES];
>>   	__u32 mem_offsets[VIDEO_MAX_FRAME][VIDEO_MAX_PLANES];
>> @@ -1453,6 +1454,7 @@ static inline void v4l_queue_init(struct v4l_queue *q,
>>   static inline unsigned v4l_queue_g_type(const struct v4l_queue *q) { return q->type; }
>>   static inline unsigned v4l_queue_g_memory(const struct v4l_queue *q) { return q->memory; }
>>   static inline unsigned v4l_queue_g_buffers(const struct v4l_queue *q) { return q->buffers; }
>> +static inline unsigned v4l_queue_g_max_num_buffers(const struct v4l_queue *q) { return q->max_num_buffers; }
>>   static inline unsigned v4l_queue_g_mappings(const struct v4l_queue *q) { return q->mappings; }
>>   static inline unsigned v4l_queue_g_num_planes(const struct v4l_queue *q) { return q->num_planes; }
>>   static inline unsigned v4l_queue_g_capabilities(const struct v4l_queue *q) { return q->capabilities; }
>> @@ -1587,6 +1589,9 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
>>   	if (ret)
>>   		return ret;
>>   	q->capabilities = createbufs.capabilities;
>> +	q->max_num_buffers = 32;
>> +	if (q->capabilities & V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS)
>> +		q->max_num_buffers = createbufs.max_num_buffers;
>>   	q->buffers += createbufs.count;
>>   	return v4l_queue_querybufs(f, q, q->buffers - createbufs.count);
>>   }
>> diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
>> index 4f8c2aa7..5fc92005 100644
>> --- a/utils/common/v4l2-info.cpp
>> +++ b/utils/common/v4l2-info.cpp
>> @@ -206,6 +206,7 @@ static constexpr flag_def bufcap_def[] = {
>>   	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
>>   	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF, "m2m-hold-capture-buf" },
>>   	{ V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS, "mmap-cache-hints" },
>> +	{ V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS, "set-max-num-buffers" },
>>   	{ 0, nullptr }
>>   };
>>   
>> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
>> index ac6a8f80..a165ef5a 100644
>> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
>> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
>> @@ -1453,6 +1453,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>>   
>>   		printf("Buffer ioctls%s:\n", suffix);
>>   		printf("\ttest VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: %s\n", ok(testReqBufs(&node)));
>> +		printf("\ttest CREATE_BUFS maximum buffers: %s\n", ok(testCreateBufsMax(&node)));
>>   		// Reopen after each streaming test to reset the streaming state
>>   		// in case of any errors in the preceeding test.
>>   		node.reopen();
>> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
>> index 7e3860c8..4f9aa17e 100644
>> --- a/utils/v4l2-compliance/v4l2-compliance.h
>> +++ b/utils/v4l2-compliance/v4l2-compliance.h
>> @@ -383,6 +383,7 @@ int testReqBufs(struct node *node);
>>   int testReadWrite(struct node *node);
>>   int testExpBuf(struct node *node);
>>   int testBlockingWait(struct node *node);
>> +int testCreateBufsMax(struct node *node);
>>   
>>   // 32-bit architecture, 32/64-bit time_t tests
>>   int testTime32_64(struct node *node);
>> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> index 6d592c9b..e3c3db46 100644
>> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> @@ -761,6 +761,47 @@ int testReqBufs(struct node *node)
>>   	return 0;
>>   }
>>   
>> +int testCreateBufsMax(struct node *node)
>> +{
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	node->reopen();
>> +
>> +	cv4l_queue q(0, 0);
>> +
>> +	for (i = 1; i <= V4L2_BUF_TYPE_LAST; i++) {
>> +		if (!(node->valid_buftypes & (1 << i)))
>> +			continue;
>> +
>> +		q.init(i, V4L2_MEMORY_USERPTR);
>> +		ret = q.create_bufs(node, 1);
>> +		if (!ret && (q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS)) {
>> +			fail_on_test(q.create_bufs(node, q.g_max_buffers() - q.g_buffers()));
> You didn't compile this, did you?
>
> This should be g_max_num_buffers...

I have compile the whole v5 branch
and this is fixed on the last patch of the series.
I'm fixing that.

>
> Regards,
>
> 	Hans
>
>> +			ret = q.create_bufs(node, 1);
>> +			fail_on_test(ret != ENOBUFS && (q.g_max_buffers() == q.g_buffers()));
>> +		}
>> +
>> +		q.init(i, V4L2_MEMORY_MMAP);
>> +		ret = q.create_bufs(node, 1);
>> +		if (!ret && (q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS)) {
>> +			fail_on_test(q.create_bufs(node, q.g_max_buffers() - q.g_buffers()));
>> +			ret = q.create_bufs(node, 1);
>> +			fail_on_test(ret != ENOBUFS && (q.g_max_buffers() == q.g_buffers()));
>> +		}
>> +
>> +		q.init(i, V4L2_MEMORY_DMABUF);
>> +		ret = q.create_bufs(node, 1);
>> +		if (!ret && (q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS)) {
>> +			fail_on_test(q.create_bufs(node, q.g_max_buffers() - q.g_buffers()));
>> +			ret = q.create_bufs(node, 1);
>> +			fail_on_test(ret != ENOBUFS && (q.g_max_buffers() == q.g_buffers()));
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   int testExpBuf(struct node *node)
>>   {
>>   	bool have_expbuf = false;
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com
