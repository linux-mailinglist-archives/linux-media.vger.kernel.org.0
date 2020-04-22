Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0643A1B436F
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 13:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgDVLnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 07:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726426AbgDVLnP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 07:43:15 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385DFC03C1A8
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2020 04:43:15 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x18so2015219wrq.2
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2020 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TqyD0J3YK2+KhjhxDqI7aoojqAM5A+2KhBmH6duYJVU=;
        b=TaKz7DRfPleQN1GNWjaSEPCEVy5b7+FSHxeK8WYqfHMVq6rRD15apHmqSrCVqwLXKC
         jzBUz5Qunr/4jaD7/i+gHWbNunqBiL/7Sw+b1AOVt4AIOiUb6Rcg8lEqC9DK55QZ/SAh
         mAOtycNJWvQAqoVPU8WpVznes/qEun6YMbupD67Fz61z/tr+ui+DXfHfqq4ADJZKf7ID
         qEt35I71SsmDLHJ/kcT2QwecxYG1lx+BppvRBA4iXL5nICu/s+99MR08SjxHsrbXfrin
         P1PR1eXW8JP+IlPWNsOEX3tBmR+54eCagakYq9zVhufz91hEwn2ebpVnKYVPS1wkkil1
         aQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TqyD0J3YK2+KhjhxDqI7aoojqAM5A+2KhBmH6duYJVU=;
        b=EDWsv1DGqhbliqknsio5A99PcLbsox8SiXnge+qNWtqwTVBox2oALU1jOflAN57t+n
         0Z4VhhA3g3k7DItpLYTDeiJG4NbZGx/CjQoX5EZ+9m4v+silTW1YsBkGwA3yXIO5pgyt
         C3MknY/eTHbtDiSIv9JuWN5FYJtuzvSXMf8k6LZwDUS25fZDiw3herplh0IdeAO6B3ej
         R0WsUsVljKfKlohDwh/Ce+yQbsultm6CyC4sh3yjH8cUx0BK0fW+lc16vpywc/4m+/DK
         Bm3tB9+cH7es4iBQpz54NM1y5yOTEmHdpEuI7RD3iibcinAJzSI1HMdZvPnZjsjKSHQb
         1qMw==
X-Gm-Message-State: AGi0PubWDmYmYI9v2uv7CnEnjEoapb7Qa/1AhmM+13QMSqKgxYUMy4lU
        7jnZk5xdq9qgTb8CaNXKBCBIZA==
X-Google-Smtp-Source: APiQypIet52zBota+cj4/KsJs9rGOHvv0n9N4JoefVszbyFekaWMhxT4hkOOia51671XqtCrN2RHIg==
X-Received: by 2002:a5d:4748:: with SMTP id o8mr28812592wrs.422.1587555793395;
        Wed, 22 Apr 2020 04:43:13 -0700 (PDT)
Received: from [192.168.1.2] (212-5-158-120.ip.btc-net.bg. [212.5.158.120])
        by smtp.googlemail.com with ESMTPSA id l19sm7557503wmj.14.2020.04.22.04.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 04:43:12 -0700 (PDT)
Subject: Re: decode sync frames only
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <9a58a501-8348-2230-2ab5-534471d866ca@linaro.org>
 <e0d850725c11e420dd0952bc07a857495bf37fa4.camel@ndufresne.ca>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <06340f1f-0ff1-2407-2f9f-144452b34aa8@linaro.org>
Date:   Wed, 22 Apr 2020 14:43:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e0d850725c11e420dd0952bc07a857495bf37fa4.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On 4/21/20 1:09 AM, Nicolas Dufresne wrote:
> Hi Stanimir,
> 
> Le lundi 20 avril 2020 à 17:38 +0300, Stanimir Varbanov a écrit :
>> Hi,
>>
>> I need to port a decoder v4l2 control in mainline Venus driver which
>> instructs the decoder to decode sync frames only (I frame/ IDR frame).
>> In practice the usage of such control is to generate thumbnails for
>> particular video.
>>
>> To do that I researched what we have currently in v4l2-controls.h and
>> found something similar but for encoders:
>>
>> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME
>> "Force a key frame for the next queued buffer. Applicable to encoders.
>> This is a general, codec-agnostic keyframe control."
>>
>> I think I have two options:
>>
>> 1. reuse V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME for the decoder and document it
>>
>> 2. create a new v4l control V4L2_CID_MPEG_VIDC_VIDEO_SYNC_FRAME_DECODE
> 
> Seems analogue to GStreamer flag GST_SEEK_FLAG_TRICKMODE_KEY_UNIT, if that helps
> your inspiration. It's used to speed up fast-forward (ore thumbnails
> generation). What the decoder will effectively do is to skip the P and the B
> frames. Some decoder offers fine grain control on that.
> 
> That being said, in GStreamer (and probably most framework) frames are skipped
> in userspace. But decoder tend to wait for the next key frame to output the
> first one, so we endup having to do more work to force the frame out (like
> CMD_STOP/START cycle, or crafts an early AUD). Would be nice to document if that
> mode will help in this regard (or not). 
> 
> For protocols like DASH, when doing fast-forward we don't even download the non-
> key-frames from the server, so the skipping behaviour does not provide any gain
> any way.
> 
>>
>> Any suggestions?
>>
> 
> Could be as Hans suggested, or something less generic but that covers more
> trickmodes ?
> 
> V4L2_CID_MPEG_VIDEO_DECODER_H264_TRICKMODE
>   - No skip
>   - Skip B Frames
>   - I frame only
> 
> Or maybe try and construct something base on what other do ?
> 
> FFMPEG software decoder has the following:
>   (0): Skip nothing     - 0
>   (1): Skip B-frames    - 1
>   (2): Skip IDCT/Dequantization - 2
>   (5): Skip everything  - 5
> 
> CODA from Chips&Media is fancier, and propose some variants that have
> implication how muchs state is maintained, hence allowing or not the transition
> back to non-skipping outside IRAP boundary.
>   NORMAL
>   THUMBNAIL
>   Skip nonIRAP
>   Skip nonREF-PIC
>   Skip Temporal Layer
> 
> I didn't find such feature for Samsung MFC, but Amlogic is likely one candidate
> having this type of skipping feature (as it also has HW demuxers). Hope this
> helps getting the big picture, hence proposing uAPI that isn't too limited.
> 
> regards,
> Nicolas
> 

I like your idea to have more generic one and codec-agnostic. I guess
something like below menu control:

V4L2_CID_MPEG_VIDEO_DECODER_DECODE_PICTURE_TYPE
"Normal"	- decode everything applicable to the codec (default)
"Thumbnail"	- decode sync frames (pictures?) with low memory usage
"Sync frames"	- decode sync frames without memory constraints
"Skip B frames"	- decode sync frames and unidirectional frames
"Skip Temporal layer(s)" - decode everything but skip temporal layers
above base layer

-- 
regards,
Stan
