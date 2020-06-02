Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C301EBB95
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 14:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgFBMYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 08:24:49 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:51109 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725940AbgFBMYt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 08:24:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g5yFjjTQAnv5ng5yIjpM3S; Tue, 02 Jun 2020 14:24:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591100687; bh=QJyBxueTazKFkTqWF58Ggg0h2EATDIQfTVWKCSwHXGQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MZWMXgP1pYS9MYeGlQn34cZqx2Lpx9MjjE+RaChodLv+m/f+9/HkrlUgJwhFztlkg
         Q3aOanSfNPt5Ed9BGtvanGR8P53/JlaRgqSAhMK/nZEjSTMZ3E1KoA9hz9/UkuZjf/
         ggFCzTnJ8HC4LjkhmGrsGB76lugFNWD85CLhI2jLelWLYeVZwlfIst5Fp6vbFSB5qQ
         sl5IxPJZDkBSDDmYnyP1E48z8U4SEndBx4XLmKWKUbN6RdOZb5IAwBKGM5B2XzwIY2
         MVjwihqWpujnCZrOB2tXdDSbVRVze+MxboLl/qJF1hA496IGLqaOuX4qrF6qp1VaE6
         8S3bEQo9Ai27w==
Subject: Re: [PATCH v6 03/14] videobuf2: handle V4L2 buffer cache flags
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
 <20200514160153.3646-4-sergey.senozhatsky@gmail.com>
 <b34ae09b-7c20-7255-6adc-3370680555cd@xs4all.nl>
 <CAAFQd5Cu5ex=YcuVfmEC1uNA4DZBSAF04LYtrw3-q22ZMc7_DA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cfb54bb3-a7dd-fafd-6b33-5500d6728a8f@xs4all.nl>
Date:   Tue, 2 Jun 2020 14:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Cu5ex=YcuVfmEC1uNA4DZBSAF04LYtrw3-q22ZMc7_DA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEBfkBJht8YpQj63rNYopBeCmw9rfXwtK/dJdjGpdMJzx5R/vzwrQ+ttN9O5LlW+Na3PFMj+kz+JFK4t1tHjykFrHwc7yTOpFzBUkcdDCzv72VHLofT0
 137elGGTAJLAAFV02Q2S6RS1HZg7W61RUevimOA2gX0npzSegrMF8IU7GZPXXTyeT5Mw3XtRxGNJYdupAbvqywJGZv45MO4HywGYRoNQKczbN9igCFh07R4K
 JThMaFP+FFOCyav32RCK5ZI8VOi9UprfwZWWgckzHeC5Mg62AK8Blqr653V++r8/5qVLj4fF2tpG50CkxiMq0T+KthRBzpEmr6BngFu18/IsJzmQqVtUoZHf
 UHQKGkllDJxaptxu4xqaAIS8vnOAYgiWtFjZ1Xa2h7gvBrUQgm8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/06/2020 14:22, Tomasz Figa wrote:
> Hi Hans,
> 
> On Tue, Jun 2, 2020 at 11:51 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Sergey,
>>
>> While doing final testing for this patch series (together with the v4l-utils patch)
>> I found one remaining issue:
>>
>> On 14/05/2020 18:01, Sergey Senozhatsky wrote:
>>> From: Sergey Senozhatsky <senozhatsky@chromium.org>
>>>
>>> Set video buffer cache management flags corresponding to V4L2 cache
>>> flags.
>>>
>>> Both ->prepare() and ->finish() cache management hints should be
>>> passed during this stage (buffer preparation), because there is
>>> no other way for user-space to tell V4L2 to avoid ->finish() cache
>>> flush.
>>>
>>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>>> ---
>>>  .../media/common/videobuf2/videobuf2-v4l2.c   | 48 +++++++++++++++++++
>>>  include/media/videobuf2-core.h                | 11 +++++
>>>  2 files changed, 59 insertions(+)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> index eb5d5db96552..f13851212cc8 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> @@ -337,6 +337,53 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>>>       return 0;
>>>  }
>>>
>>> +static void set_buffer_cache_hints(struct vb2_queue *q,
>>> +                                struct vb2_buffer *vb,
>>> +                                struct v4l2_buffer *b)
>>> +{
>>> +     /*
>>> +      * DMA exporter should take care of cache syncs, so we can avoid
>>> +      * explicit ->prepare()/->finish() syncs. For other ->memory types
>>> +      * we always need ->prepare() or/and ->finish() cache sync.
>>> +      */
>>> +     if (q->memory == VB2_MEMORY_DMABUF) {
>>> +             vb->need_cache_sync_on_finish = 0;
>>> +             vb->need_cache_sync_on_prepare = 0;
>>> +             return;
>>> +     }
>>> +
>>> +     /*
>>> +      * Cache sync/invalidation flags are set by default in order to
>>> +      * preserve existing behaviour for old apps/drivers.
>>> +      */
>>> +     vb->need_cache_sync_on_prepare = 1;
>>> +     vb->need_cache_sync_on_finish = 1;
>>> +
>>> +     if (!vb2_queue_allows_cache_hints(q)) {
>>> +             /*
>>> +              * Clear buffer cache flags if queue does not support user
>>> +              * space hints. That's to indicate to userspace that these
>>> +              * flags won't work.
>>> +              */
>>> +             b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
>>> +             b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
>>> +             return;
>>> +     }
>>
>> These two flags need to be cleared for VB2_MEMORY_DMABUF as well in the test above.
>> This bug is causing v4l2-compliance failures (use the test-media script in contrib/test
>> in v4l-utils: 'sudo test-media vim2m').
> 
> Would you be able to paste the failures, so that we know that we
> reproduce the same problems? Thanks!

For vim2m (but looks the same for vivid/vimc/vicodec):

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture: Captured 8 buffers
        test MMAP (no poll): OK
        Video Capture: Captured 8 buffers
        test MMAP (select): OK
        Video Capture: Captured 8 buffers
        test MMAP (epoll): OK
        Video Capture: Captured 8 buffers
        test USERPTR (no poll): OK
        Video Capture: Captured 8 buffers
        test USERPTR (select): OK
                fail: v4l2-test-buffers.cpp(1874): flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
                fail: v4l2-test-buffers.cpp(1937): setupDmaBuf(expbuf_node, node, q, exp_q)
        test DMABUF (no poll): FAIL
                fail: v4l2-test-buffers.cpp(1874): flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
                fail: v4l2-test-buffers.cpp(1937): setupDmaBuf(expbuf_node, node, q, exp_q)
        test DMABUF (select): FAIL

Regards,

	Hans


> 
> Best regards,
> Tomasz
> 
>>
>> It's enough to post a v6.1 for this patch, everything else is fine.
>>
>> Regards,
>>
>>         Hans
>>
>>> +
>>> +     /*
>>> +      * ->finish() cache sync can be avoided when queue direction is
>>> +      * TO_DEVICE.
>>> +      */
>>> +     if (q->dma_dir == DMA_TO_DEVICE)
>>> +             vb->need_cache_sync_on_finish = 0;
>>> +
>>> +     if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
>>> +             vb->need_cache_sync_on_finish = 0;
>>> +
>>> +     if (b->flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
>>> +             vb->need_cache_sync_on_prepare = 0;
>>> +}
>>> +
>>>  static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
>>>                                   struct v4l2_buffer *b, bool is_prepare,
>>>                                   struct media_request **p_req)
>>> @@ -381,6 +428,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>>>       }
>>>
>>>       if (!vb->prepared) {
>>> +             set_buffer_cache_hints(q, vb, b);
>>>               /* Copy relevant information provided by the userspace */
>>>               memset(vbuf->planes, 0,
>>>                      sizeof(vbuf->planes[0]) * vb->num_planes);
>>> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
>>> index 7f39d9fffc8c..ccc5c498d3e3 100644
>>> --- a/include/media/videobuf2-core.h
>>> +++ b/include/media/videobuf2-core.h
>>> @@ -635,6 +635,17 @@ struct vb2_queue {
>>>  #endif
>>>  };
>>>
>>> +/**
>>> + * vb2_queue_allows_cache_hints() - Return true if the queue allows cache
>>> + * and memory consistency hints.
>>> + *
>>> + * @q:               pointer to &struct vb2_queue with videobuf2 queue
>>> + */
>>> +static inline bool vb2_queue_allows_cache_hints(struct vb2_queue *q)
>>> +{
>>> +     return q->allow_cache_hints && q->memory == VB2_MEMORY_MMAP;
>>> +}
>>> +
>>>  /**
>>>   * vb2_plane_vaddr() - Return a kernel virtual address of a given plane.
>>>   * @vb:              pointer to &struct vb2_buffer to which the plane in
>>>
>>

