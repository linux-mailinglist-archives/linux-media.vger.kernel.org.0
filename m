Return-Path: <linux-media+bounces-14668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43636928125
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 06:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65E2B1C22A50
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 04:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870F661FD6;
	Fri,  5 Jul 2024 04:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikRxYSp4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0872B9A4;
	Fri,  5 Jul 2024 04:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720152167; cv=none; b=XT6aiJA2Jmp3zIUPre5kCTHs43kUlcPRqst+gfVzf0NaMnbp8qWFfwZP7/Un9qPLPzMRsYDCAAec3hsyQsJhSs23TLLzevqnIAIDv/AW8ZLA314qQStAk3nrzhBsXa/GaSb/mgG0HMXr9khW02oTMj0uuTlFVX0h7mysNrO8IJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720152167; c=relaxed/simple;
	bh=m8sDXWQhdLx8qYunvy9FkDtGiNW3BOgMl38gttLfKhU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bT1vIT3tfmF2uGxEtg2g6yQzUhsiPTDOV0xl0JDyDtP32dMmk/anTdJcL8wu5UMeuclB/bNIW8T5L0mnJAH4rBKyp1N9KYAmXUZdTcEDhGurmR43xIaXcHYHH20+eV3d+pP7M/gZTArJ+YjdBfVGVIKQzjGZhK2Kb7JWTl6ECkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikRxYSp4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720152166; x=1751688166;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=m8sDXWQhdLx8qYunvy9FkDtGiNW3BOgMl38gttLfKhU=;
  b=ikRxYSp47gpDoisSCS6ixHP/fdfCWr7vxl2H7VLV8ZYxWHh+FbKzljTe
   hbirmqiamEN3Cio+0zC169JbG33qgKiSUD8p3ejTRQqolbkzXemdvb+gm
   BgeU2ZgEL0zYXSlP038ahEKjWhTGJ9SCcAHQZ59Xb7YF2SraC4MGLBRZ6
   IzG83vtdP+euNtEcdTFCm1JJJQlTk49/CYCg8hfrK7q6ln65BdRvrY7ZC
   RXm1NlL9idmBfsG9hWx+ilZM/KCV1PplSIGPK4KC1CFwH2mBCC+FN10JD
   L1ZgIi+mU2k3bYFoMZq+npdgrUZFyBbID9fjYHGBV8cLO9J+8t9O9fXR/
   Q==;
X-CSE-ConnectionGUID: FVDKWwtnQ02APWxuQaEbRQ==
X-CSE-MsgGUID: glZwV+HORXWtFjbZmYtreg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17567860"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17567860"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 21:02:45 -0700
X-CSE-ConnectionGUID: dKAQETkESJ+ZNXas/UCzgA==
X-CSE-MsgGUID: ad3sMxfnRYWhvYIkJkKiLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46779530"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jul 2024 21:02:42 -0700
Subject: Re: [PATCH v1 3/3] staging: media: ipu3: Stop streaming in inverse
 order of starting
To: Max Staudt <mstaudt@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20240620145820.3910239-1-mstaudt@chromium.org>
 <20240620145820.3910239-4-mstaudt@chromium.org>
 <e6ff8ad5-933d-fbbb-0c4b-ae19c65e8439@linux.intel.com>
 <4e01aa78-497e-477e-a5c1-951cfb1df907@chromium.org>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <594c28e3-67f6-bb80-4751-ae6dc9f34c7c@linux.intel.com>
Date: Fri, 5 Jul 2024 12:03:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <4e01aa78-497e-477e-a5c1-951cfb1df907@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Max,

On 7/5/24 9:54 AM, Max Staudt wrote:
> Hi Bingbu,
> 
> Thanks for your review! Replies inline...
> 
> 
> On 7/4/24 4:03 PM, Bingbu Cao wrote:
>>> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
>>> index 3ff390b04e1a..e7aee7e3db5b 100644
>>> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
>>> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
>>> @@ -535,29 +535,51 @@ static void imgu_vb2_stop_streaming(struct vb2_queue *vq)
>>>           container_of(vq, struct imgu_video_device, vbq);
>>>       int r;
>>>       unsigned int pipe;
>>> +    bool stop_streaming = false;
>>>   +    /* Verify that the node had been setup with imgu_v4l2_node_setup() */
>>>       WARN_ON(!node->enabled);
>>>         pipe = node->pipe;
>>>       dev_dbg(dev, "Try to stream off node [%u][%u]", pipe, node->id);
>>> -    imgu_pipe = &imgu->imgu_pipe[pipe];
>>> -    r = v4l2_subdev_call(&imgu_pipe->imgu_sd.subdev, video, s_stream, 0);
>>> -    if (r)
>>> -        dev_err(&imgu->pci_dev->dev,
>>> -            "failed to stop subdev streaming\n");
>>
>> I guess the subdev streams API can help us on this, but current fix
>> looks fine for me.
> 
> I don't understand what you're referring to, since your comment is in relation to a block of existing code that I have merely shuffled around. Could you please elaborate?

I guess the real problem is the subdev s_stream cannot be called multiple
times, please correct me if I am wrong as I have not touch IPU3 for long
time. :)

You can ignore my previous comment - 's_stream' is fine here.

> 
> 
>>>   +    /*
>>> +     * When the first node of a streaming setup is stopped, the entire
>>> +     * pipeline needs to stop before individual nodes are disabled.
>>> +     * Perform the inverse of the initial setup.
>>> +     *
>>> +     * Part 1 - s_stream on the entire pipeline
>>
>> stream on or off? it is a little confusing.
> 
> I meant that s_stream(off) is called "on the entire pipeline".
> 
> Thanks, I'll rephrase this in v2 :)

:)

> 
> 
>>> +     */
>>>       mutex_lock(&imgu->streaming_lock);
>>> -    /* Was this the first node with streaming disabled? */
>>>       if (imgu->streaming) {
>>>           /* Yes, really stop streaming now */
>>>           dev_dbg(dev, "IMGU streaming is ready to stop");
>>>           r = imgu_s_stream(imgu, false);
>>>           if (!r)
>>>               imgu->streaming = false;
>>> +        stop_streaming = true;
>>>       }
>>> -
>>>       mutex_unlock(&imgu->streaming_lock);
>>>   +    /* Part 2 - s_stream on subdevs
>>> +     *
>>> +     * If we call s_stream multiple times, Linux v6.7's call_s_stream()
>>> +     * WARNs and aborts. Thus, disable all pipes at once, and only once.
>>> +     */
>>> +    if (stop_streaming) {
>>
>>> +        for_each_set_bit(pipe, imgu->css.enabled_pipes,
>>> +                 IMGU_MAX_PIPE_NUM) {
>>> +            imgu_pipe = &imgu->imgu_pipe[pipe];
>>> +
>>> +            r = v4l2_subdev_call(&imgu_pipe->imgu_sd.subdev,
>>> +                         video, s_stream, 0);
>>> +            if (r)
>>> +                dev_err(&imgu->pci_dev->dev,
>>> +                    "failed to stop subdev streaming\n");
>>> +        }
>>
>> Is it possible to move this loop into 'if (imgu->streaming)' above?
> 
> The point of separating the loop from 'if (imgu->streaming)', and why the stop_streaming variable exists, is to keep the loop out of the mutex's hot path. This follows the code in imgu_vb2_start_streaming(), as mentioned in the commit message.
> 
> Is it safe to do this work with the mutex taken?
> 
> Is there any need to do this work with the mutex taken?
> 
> Should the streamoff path really be different from the streamon path?
> 
> Does this mean that the streamon path should also have this happen with the mutex taken?

Just a nit, stop_stream and s_stream only happen after imgu_s_stream(), so I
think they can be together and no need 'stop_streaming'. I think the mutex
is mainly for imgu_s_stream, subdev stream on/off should work without it.
It depends on you. :)

It'll be better that others who is still working on IPU3 devices can review.

Besides,
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> 
> 
> 
> Thanks,
> 
> Max
> 
> 

-- 
Best regards,
Bingbu Cao

