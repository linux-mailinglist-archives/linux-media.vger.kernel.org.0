Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A960D43F7DB
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 09:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbhJ2Har (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 03:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbhJ2Har (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 03:30:47 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D5CC061570
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 00:28:18 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id m17so34263888edc.12
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 00:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xC4VRTMgJ/F3O8L0qgQ7Eq9Ov8ZMPtclP3voy0OZrfM=;
        b=jAF+5iopmQl8Ef3oz+yRRzTtq1kkSr08u3rtcdkjPFkILz+BQWb0lccgHdBM/KSirs
         cJ4tApAHF1ixSVveuySCl5ZQP+08r4n8+5Q3E7IUltNYGfwaI1KunvFU/8EvjcrrCK3h
         CYpkLM1eGtnGhiOsFpGhWlTRKMqZ3TB1Zp7X4/EnOGptcWJqPN6RqYSoWgxFY4R6b/mN
         dUZ9oJ9IQhzxxYn7YieS5tGG56qnU8+Ug8ZbcYBf1mf+W0eXK6BTlCbQ56n3dakmuy1h
         QeeYQorSCDvqb+0bVMWdYNoMP+fm8OJlGHHb7s/bXtrR6xwKkdazz2BsHEV20M0026fl
         xOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xC4VRTMgJ/F3O8L0qgQ7Eq9Ov8ZMPtclP3voy0OZrfM=;
        b=XlBuVdN9E4cOG9RHgRUGjQC5lsGECuaEl4DaGxT2hmVMP/iL6YIyKS/vOOttF4RpRb
         e+eWt/zFoK3wpDS+XaKwwZhYbud1nRS7VvijXFYFXChzp7JDbB56WdiMSoj8JyBgipra
         VpUskOksaxBc9ID0Gv9PVmv+hqeHO4uvxIA+DREUTzOzXxiDTSBm6yyHk4JLrO8Q0/ib
         AFD6ZrQpx6Jiqe6Lk1U2tNUFXk2j4MQ9zpuVtDAfi7bvXNP7IRJOUjf48XDtLj9ZbYd3
         e+/DMRPT5emdsla+lW1KqprXOv70prS9pLcw8v2jo1bWHjZL4ruX46k2pIAaUKHYEd4D
         uFnw==
X-Gm-Message-State: AOAM531l8p2R/pXvtXi/iTXdjUGErST2ecoyde8n3TDmaaI7xoZ4qyLg
        fxJwy+DXBs8v7G28cpfGbuSDjQ==
X-Google-Smtp-Source: ABdhPJx9NW2A4sjvWptgcbPjOKj3k+v9loPATMNy/Dqq0DmepF0LTiBIMGpMxMG4YoUHV+ftOWrSig==
X-Received: by 2002:a17:907:3eaa:: with SMTP id hs42mr11410508ejc.429.1635492497035;
        Fri, 29 Oct 2021 00:28:17 -0700 (PDT)
Received: from [192.168.1.15] (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.googlemail.com with ESMTPSA id e19sm3207231edz.53.2021.10.29.00.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 00:28:16 -0700 (PDT)
Subject: Re: [EXT] Re: [PATCH] media: docs: dev-decoder: add restrictions
 about CAPTURE buffers
To:     Ming Qian <ming.qian@nxp.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Alexandre Courbot <acourbot@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211018091427.88468-1-acourbot@chromium.org>
 <9cb4f64e2ec3959df44b71dd69ef95697920dc4b.camel@ndufresne.ca>
 <AM6PR04MB634130FEB433CCA352CE98FBE7879@AM6PR04MB6341.eurprd04.prod.outlook.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <dc7496db-9ba3-fa7b-8563-1157b63c9b0d@linaro.org>
Date:   Fri, 29 Oct 2021 10:28:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <AM6PR04MB634130FEB433CCA352CE98FBE7879@AM6PR04MB6341.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/29/21 5:10 AM, Ming Qian wrote:
>> -----Original Message-----
>> From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
>> Sent: Tuesday, October 26, 2021 10:12 PM
>> To: Alexandre Courbot <acourbot@chromium.org>; Mauro Carvalho Chehab
>> <mchehab@kernel.org>; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Tomasz Figa
>> <tfiga@chromium.org>
>> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
>> Subject: [EXT] Re: [PATCH] media: docs: dev-decoder: add restrictions about
>> CAPTURE buffers
>>
>> Caution: EXT Email
>>
>> Le lundi 18 octobre 2021 à 18:14 +0900, Alexandre Courbot a écrit :
>>> CAPTURE buffers might be read by the hardware after they are dequeued,
>>> which goes against the general idea that userspace has full control
>>> over dequeued buffers. Explain why and document the restrictions that
>>> this implies for userspace.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>>> ---
>>>  .../userspace-api/media/v4l/dev-decoder.rst     | 17
>> +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>> b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>> index 5b9b83feeceb..3cf2b496f2d0 100644
>>> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>> @@ -752,6 +752,23 @@ available to dequeue. Specifically:
>>>       buffers are out-of-order compared to the ``OUTPUT`` buffers):
>> ``CAPTURE``
>>>       timestamps will not retain the order of ``OUTPUT`` timestamps.
>>>
>>> +.. note::
>>> +
>>> +   The backing memory of ``CAPTURE`` buffers that are used as reference
>> frames
>>> +   by the stream may be read by the hardware even after they are
>> dequeued.
>>> +   Consequently, the client should avoid writing into this memory while the
>>> +   ``CAPTURE`` queue is streaming. Failure to observe this may result in
>>> +   corruption of decoded frames.
>>> +
>>> +   Similarly, when using a memory type other than
>> ``V4L2_MEMORY_MMAP``, the
>>> +   client should make sure that each ``CAPTURE`` buffer is always queued
>> with
>>> +   the same backing memory for as long as the ``CAPTURE`` queue is
>> streaming.
>>> +   The reason for this is that V4L2 buffer indices can be used by drivers to
>>> +   identify frames. Thus, if the backing memory of a reference frame is
>>> +   submitted under a different buffer ID, the driver may misidentify it and
>>> +   decode a new frame into it while it is still in use, resulting in corruption
>>> +   of the following frames.
>>> +
>>
>> I think this is nice addition, but insufficient. We should extend the API with a
>> flags that let application know if the buffers are reference or secondary. For the
>> context, we have a mix of CODEC that will output usable reference frames and
>> needs careful manipulation and many other drivers where the buffers *maybe*
>> secondary, meaning they may have been post-processed and modifying these
>> in- place may have no impact.
>>
>> The problem is the "may", that will depends on the chosen CAPTURE format. I
>> believe we should flag this, this flag should be set by the driver, on CAPTURE
>> queue. The information is known after S_FMT, so Format Flag, Reqbufs
>> capabilities or querybuf flags are candidates. I think the buffer flags are the
>> best named flag, though we don't expect this to differ per buffer. Though,
>> userspace needs to call querybuf for all buf in order to export or map them.
>>
>> What userspace can do with this is to export the DMABuf as read-only, and
>> signal this internally in its own context. This is great to avoid any unwanted
>> side effect described here.
> 
> I think a flag should be add to tell a buffer is reference or secondary.
> But for some codec, it's hard to determine the buffer flag when reqbufs.
> The buffer flag should be dynamically updated by driver.
> User can check the flag after dqbuf every time.

+1

I'm not familiar with stateless decoders where on the reqbuf time it
could work, debut for stateful coders it should be a dynamic flag on
every capture buffer.

> 
>>
>>>  During the decoding, the decoder may initiate one of the special
>>> sequences, as  listed below. The sequences will result in the decoder
>>> returning all the  ``CAPTURE`` buffers that originated from all the
>>> ``OUTPUT`` buffers processed
>>
> 

-- 
regards,
Stan
