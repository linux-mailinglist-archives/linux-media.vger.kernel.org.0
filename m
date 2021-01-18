Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6832FAAEC
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 21:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388250AbhARKpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 05:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388596AbhARJVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 04:21:12 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149B6C061573
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 01:20:32 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id s11so9427159edd.5
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nWwUvnxm6cFMUMsyK2REaR6ASGoMuBGGZ9JavqL//w4=;
        b=IsxNjrjqUFOd3RJMycZUTd/74CrPYXCA1rwY6o8n9iYZFY3Q79GsF63WDwM4iTo+EK
         VzQAENcyPtRqLg/POO0/bk4QTOIP0d3L3HR/Epzderpzk8FOi+bC/c34FkJSOnBdVzhv
         crBG7o1zUUorAfBWER0YTeswXDVMp4tPEzyqH4TacvxamKOQzDsQY9cLG4uDLroPm9Cf
         e7MN8wgvBBL2eyhTvJHrprtsBZiyoj8QwYnFU7e4zokBXhebSp6+Y7H2OEd4qYFdO+Lv
         bTZTEv7xMxmdkNpG3QqBR/TqWSx2pZ3oV9TjsVKQ1XCZR6BRwGVH0iFgIP30S+U1wv9Q
         Q8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nWwUvnxm6cFMUMsyK2REaR6ASGoMuBGGZ9JavqL//w4=;
        b=F+29ZRjJmgtygw5s3YRSFVEJt9ghuVX5ys8Ob/JfrF6xxo8zHUN99MThsB3gyZqz+s
         g9tnf4BIizzJtL9Zv8aDvFI9yVzDg6vppwZT4tnNZ1e5OwJl4KoH0DlHuiX0FSFfy8JS
         W/fZdWUBfRKFrA32YsImRmGoINYIubs8Sag38+INWbBtj0ai0gvA7CS4KLjYGhGsaAmd
         Z7/U7pu6XfdD3BKvRBjehu6Jd5CPtunjXbNsNEZdXAual2slFrj1bX+FHw7VaNZUOx7R
         hxEujyHopOEbz7Pe9Y9u5VrwoXMN5jJ4wrQW0soxsyOUaBssVHcU5zd++csP53Y/pZm/
         Nrww==
X-Gm-Message-State: AOAM532EH04XEZVXNUYwW5X8BR8LrAAtdEfq0QUULLXUUMAG0HwlxHAU
        mFWK2j+opLAmwKPLl+IU76knIMb0CgLm0mJT
X-Google-Smtp-Source: ABdhPJwPa49hq9EFj0Fqi4nYmNdK6gmH/6OLEaDLMVGoc/4IVEOjzZY8Bg7rmvldqK0fk7f4A9Vc9w==
X-Received: by 2002:aa7:d98a:: with SMTP id u10mr469709eds.275.1610961630618;
        Mon, 18 Jan 2021 01:20:30 -0800 (PST)
Received: from [192.168.0.3] (hst-221-28.medicom.bg. [84.238.221.28])
        by smtp.googlemail.com with ESMTPSA id g14sm7476538edm.31.2021.01.18.01.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 01:20:30 -0800 (PST)
Subject: Re: [PATCH v2 1/4] media: v4l2-ctrls: Add intra-refresh period
 control
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>
References: <20201206102717.19000-1-stanimir.varbanov@linaro.org>
 <20201206102717.19000-2-stanimir.varbanov@linaro.org>
 <6eb7ea37-e460-2884-9e07-6ff6f9a15414@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <38417ba8-02af-8fef-9e28-8605dca41921@linaro.org>
Date:   Mon, 18 Jan 2021 11:20:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <6eb7ea37-e460-2884-9e07-6ff6f9a15414@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/12/21 12:05 PM, Hans Verkuil wrote:
> On 06/12/2020 11:27, Stanimir Varbanov wrote:
>> Add a control to set intra-refresh period.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 11 +++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls.c                  |  2 ++
>>  include/uapi/linux/v4l2-controls.h                    |  1 +
>>  3 files changed, 14 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 454ecd9a0f83..d65d7c1381b7 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1104,6 +1104,17 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>>      macroblocks is refreshed until the cycle completes and starts from
>>      the top of the frame. Applicable to H264, H263 and MPEG4 encoder.
>>  
>> +``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
>> +    Intra macroblock refresh period. This sets the period to refresh
>> +    the whole frame. With other words, this defines the number of frames
> 
> With -> In
> 
>> +    for which the whole frame will be intra-refreshed.  An example:
>> +    setting period to 1 means that the whole frame will be refreshed,
>> +    setting period to 2 means that the half of macroblocks will be
>> +    intra-refreshed on frameX and the other half of macroblocks
>> +    will be refreshed in frameX + 1 and so on. Setting period to zero
>> +    means no period is specified.
>> +    Applicable to H264 and HEVC encoders.
> 
> I'm confused. Isn't this the same as V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB?
> Except that here you don't give the number of macroblocks but instead the number
> of frames it will take to fully refresh a frame and leave it to the driver to
> calculate the number of macroblocks?

Yes, correct. The periodic control looks more generic because it doesn't
limit the type of intra-refresh (cyclic vs random vs adaptive) but
instead set the number of frames to fully refresh the whole frame and is
also taken from Android mediacodec [1], where the user doesn't care too
much what intra-refresh type will be used but instead how much frames
are needed to fully refresh.

> 
> If I am right, then you need to clearly document the relationship between the
> two controls, and what happens if you set them both.

Yep, I can add such description.

One note here; the CYCLIC_INTRA_REFRESH_MB and INTRA_REFRESH_PERIOD are
not interchangeable because intra-refresh period could use different
type of inter-refresh, eg. random vs cyclic.

> 
> It seems the venus driver already supports V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB,
> so why add this control as well?

The cyclic intra-refresh control in Venus driver is just enumerable but
ignored when set, in other words it does nothing.

> 
> Regards,
> 
> 	Hans
> 

[1]
https://developer.android.com/reference/android/media/MediaFormat#KEY_INTRA_REFRESH_PERIOD

-- 
regards,
Stan
