Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28611E7A55
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 12:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgE2KRG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 06:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2KRF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 06:17:05 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23405C03E969
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 03:17:05 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j10so2874857wrw.8
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 03:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ltn7ByRQjTEdKsKznmB6+AIsc7zWZ8yNwAx8X9Zi3QI=;
        b=XhOFndTBCMGXa67OA+oPN4+vJcYHegw00ByQZChbr0EHduihKuwnDIBVez5X+vGzti
         UvGwr1pHZ/mNZrylJ+roRwYSYaBAkvYUMnu0wJc/VqPbXWxkCyQb0ytbDnwtqAx/sbvW
         6dTi7SO+ba4Hy3hvZg/YcB6n2JixqdxBDjok5v3ccIzPUkbgJPR+Ytc/dcvfXV9/0YmT
         /v7kULDdOob/dsYTcxagGxCX118wyp8K+OWZUMFjYHGNJvNe9ur13qQOi+/sZ/7lM8Ix
         CAGI2ahR4DrKqnrwIAZDcXEQp+LLNMVbO8TdCsN17MH+LGkvh19TbLD7+LSI9gZd3bOi
         XSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ltn7ByRQjTEdKsKznmB6+AIsc7zWZ8yNwAx8X9Zi3QI=;
        b=DncTKWe8BtvvNgckypoF1MCBQMoKpNR3TdZ0thuVqN5Zl7/l1zjio5q5Iw0x/xt43Z
         lGdlmeNYaTdSPlJzwh4HjZD6tLoMwkQFcmCDrTmk7LDWgR9OoRmcUADbSiTNJqgYlaXK
         tb8iRwyag4rw4O7WlKPI5Gk4FqlxbHNDORLoydXdF/2EPH5AXYc6b6pdz2s+JgO8Tdvi
         byAu1fUS79OnUyDqFHZYs/zpwW6cuB0yyOz3nGKqdQBwoDodsRDgr2juOhfBXPgjbcVy
         ygOVxbmeAojydqc1qrXmJBGp+RAVbmedIvmctrIAwGP8qZQwKwdar49NjkBcYxpzFtq/
         xHGQ==
X-Gm-Message-State: AOAM531kWo4OWVCC0nGt/hkOBcJRRwbj5T6vnvrgNhljQKRxbw3s4/UZ
        XjXe4fmN4iz1RdOHfLUL3G+5Gg==
X-Google-Smtp-Source: ABdhPJyDqrR+4BiqPmYaJZc+0tCmtXuqjBjHAKPrKOqm1jEvq5mS6rob7Iqwimcnt8li0BaXIgPp0g==
X-Received: by 2002:adf:f5c2:: with SMTP id k2mr7810891wrp.111.1590747423817;
        Fri, 29 May 2020 03:17:03 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-42.ip.btc-net.bg. [212.5.158.42])
        by smtp.googlemail.com with ESMTPSA id z132sm11861546wmc.29.2020.05.29.03.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 03:17:03 -0700 (PDT)
Subject: Re: [PATCHv3 1/5] media: docs-rst: Document memory-to-memory video
 encoder interface
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Michael Tretter <m.tretter@pengutronix.de>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
 <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl>
 <15e979fa-f782-a8af-5bf3-d39e6c245b36@linaro.org>
Message-ID: <7e86a915-1ff0-0d2a-e82c-8bf204b1cc82@linaro.org>
Date:   Fri, 29 May 2020 13:17:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <15e979fa-f782-a8af-5bf3-d39e6c245b36@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/29/20 12:57 PM, Stanimir Varbanov wrote:
> 
> 
> On 5/26/20 1:09 PM, Hans Verkuil wrote:
>> From: Tomasz Figa <tfiga@chromium.org>
>>
>> Due to complexity of the video encoding process, the V4L2 drivers of
>> stateful encoder hardware require specific sequences of V4L2 API calls
>> to be followed. These include capability enumeration, initialization,
>> encoding, encode parameters change, drain and reset.
>>
>> Specifics of the above have been discussed during Media Workshops at
>> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
>> Conference Europe 2014 in Düsseldorf. The de facto Codec API that
>> originated at those events was later implemented by the drivers we already
>> have merged in mainline, such as s5p-mfc or coda.
>>
>> The only thing missing was the real specification included as a part of
>> Linux Media documentation. Fix it now and document the encoder part of
>> the Codec API.
>>
>> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../userspace-api/media/v4l/dev-encoder.rst   | 728 ++++++++++++++++++
>>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
>>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
>>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
>>  5 files changed, 767 insertions(+), 20 deletions(-)
>>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
>>
> 
> <cut>
> 
>> +
>> +Reset
>> +=====
>> +
>> +The client may want to request the encoder to reinitialize the encoding, so
>> +that the following stream data becomes independent from the stream data
>> +generated before. Depending on the coded format, that may imply that:
>> +
>> +* encoded frames produced after the restart must not reference any frames
>> +  produced before the stop, e.g. no long term references for H.264/HEVC,
>> +
>> +* any headers that must be included in a standalone stream must be produced
>> +  again, e.g. SPS and PPS for H.264/HEVC.
>> +
>> +This can be achieved by performing the reset sequence.
>> +
>> +1. Perform the `Drain` sequence to ensure all the in-flight encoding finishes
>> +   and respective buffers are dequeued.
>> +
>> +2. Stop streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAMOFF`. This
>> +   will return all currently queued ``CAPTURE`` buffers to the client, without
>> +   valid frame data.
>> +
>> +3. Start streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAMON` and
>> +   continue with regular encoding sequence. The encoded frames produced into
>> +   ``CAPTURE`` buffers from now on will contain a standalone stream that can be
>> +   decoded without the need for frames encoded before the reset sequence,
>> +   starting at the first ``OUTPUT`` buffer queued after issuing the
>> +   `V4L2_ENC_CMD_STOP` of the `Drain` sequence.
>> +
>> +This sequence may be also used to change encoding parameters for encoders
>> +without the ability to change the parameters on the fly.
> 
> How the v4l2 client knows which parameters could be changed on the fly
> and which cannot? Controls should return -EBUSY?

Sorry, I re-read "Encoding Parameter Changes" paragraph.

> 
> Also could that Reset be used to change the pixel format and probably
> colorspace?
> 

-- 
regards,
Stan
