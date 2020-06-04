Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C8E1EE071
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbgFDJCr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728116AbgFDJCq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:02:46 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F09EC03E96D
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 02:02:46 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id l27so5252503ejc.1
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 02:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hHof+p3C9Md136JQ7k0tl8hMmspaaFCEsQhKQBHmNxA=;
        b=p1RLJkFHX+/HAaWtEy3jwsTfPtsNiJliZpFxTrV1XyeKjW6c+81N5TFAVnh6b9eAUz
         1jWiOzZBl9rVUsnqfcwlgM80fjmLjwZLhpOMjlH8Xwr+lIx4p8FvCKMk7EMGSiBE1ZTu
         A/1zi/2qERY0KAaorMMvNhuDbklge4kwZ1/mrDweImSwz9dFh9KTjtNMJh7UlIicpjhm
         G7viBE1GVTYYXxOz5KFnKImb03jUw45EXUrtQwO18cQ7C70e+BiXsjBXL065BXKh8mhs
         7Qu51pm3knq8tG30mIZjKZtSMOMGlGYqIxd9WeAdOYJN2qShg9dZ0QETGacpX92pOqQG
         g6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hHof+p3C9Md136JQ7k0tl8hMmspaaFCEsQhKQBHmNxA=;
        b=r5Lo7HRHKeoGSwIXC+fnELrLhj207fDJGt+4uNxM4oQfhDDI9LeQhVLVQxxrDTSDT2
         /agpXBO4CW9GXEAoN6DW/3uitniKKpGXSMtru4S0ATWLNby8VhymikpNZezhFHENsHqz
         AmpETOrb/ZRqluXmCceVQDDt5zQeuCVMV80oFzJsbm2dS/dBY2x8+mKwl1G3LIATbYtb
         5qfkcFVeE5hdtx63C2s83Z1xuCRVmzV3YCZZI9h290yY7upNuQ28y6EhjPoRHlTI3Wyx
         3/HeaB36efra/oRSCUxPCbsGJ3Ye+8N4jPH3a46t8suZ8HpHFg1OMxJ404HB16aQeGHG
         wQqg==
X-Gm-Message-State: AOAM531CVpnet5yhmgFeXOm6x2Ep1P3Zp+5UtKh8Y6JGj5khchvZwvPY
        wjHoX/R7XGvO+YCW0oOC5C3jog==
X-Google-Smtp-Source: ABdhPJw5awrswXBB9T1X5H66YVQsV9+7Luv3jbVtzXFoUYhvXcs3GavJwgAMyZ94YIO/oW7JPztvmQ==
X-Received: by 2002:a17:906:69d1:: with SMTP id g17mr2840858ejs.521.1591261365181;
        Thu, 04 Jun 2020 02:02:45 -0700 (PDT)
Received: from [192.168.1.4] (212-5-158-209.ip.btc-net.bg. [212.5.158.209])
        by smtp.googlemail.com with ESMTPSA id gt26sm1592670ejb.107.2020.06.04.02.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 02:02:44 -0700 (PDT)
Subject: Re: [PATCH] v4l2-ctrl: add control for thumnails
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>
References: <20200526085446.30956-1-stanimir.varbanov@linaro.org>
 <65ac9697-a43f-7025-e6fe-69c4a44c6d9a@xs4all.nl>
 <ce28a840-a763-6700-16dd-d708e570d55c@linaro.org>
Message-ID: <d02c6cd0-a502-dc52-519e-54b6328d5373@linaro.org>
Date:   Thu, 4 Jun 2020 12:02:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ce28a840-a763-6700-16dd-d708e570d55c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 5/27/20 12:53 AM, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 5/26/20 3:04 PM, Hans Verkuil wrote:
>> On 26/05/2020 10:54, Stanimir Varbanov wrote:
>>> Add v4l2 control for decoder thumbnail.
>>>
>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>> ---
>>>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
>>>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
>>>  include/uapi/linux/v4l2-controls.h                        | 2 ++
>>>  3 files changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> index d0d506a444b1..e838e410651b 100644
>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> @@ -3726,6 +3726,13 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>>      disables generating SPS and PPS at every IDR. Setting it to one enables
>>>      generating SPS and PPS at every IDR.
>>>  
>>> +``V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL (button)``
>>> +    Instructs the decoder to produce immediate output. The decoder should
>>> +    consume first input buffer for progressive stream (or first two buffers
>>> +    for interlace). Decoder should not allocate more output buffers that it
>>> +    is required to consume one input frame. Usually the decoder input
>>> +    buffers will contain only I/IDR frames but it is not mandatory.
>>
>> This is very vague. It doesn't explain why the control is called 'THUMBNAIL',
>> but more importantly it doesn't explain how this relates to normal decoding.
> 
> If in the normal decode the capture queue buffers are 5, in the
> thumbnail mode the number of buffers will be only 1 (if the bitstream is
> progressive) and this will guarantee low memory usage. The other
> difference is that the decoder will produce decoded frames (without
> errors) only for I/IDR (sync frames).
> 
>>
>> I.e. if you are decoding and 'press' this control, what happens then?
> 
> Might be the button type wasn't great idea. In fact the control should
> be set before streamon so that the driver returns min_capture_bufs 1.
> 
>>
>> What exactly is the use-case?
> 
> It could be used to generate thumbnails of all video clips in a folder
> or when you open a Gallery application on your phone.
> 

What is your opinion on that control? I could consider to make it Venus
custom control but from the use-case it looks other drivers also can
benefit of it.

I tried to make more generic one [1] but it looks it will be too difficult.

-- 
regards,
Stan

[1] https://www.spinics.net/lists/linux-media/msg167794.html
