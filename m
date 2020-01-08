Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43826134842
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 17:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729295AbgAHQne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 11:43:34 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41671 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729289AbgAHQnd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 11:43:33 -0500
Received: by mail-ed1-f67.google.com with SMTP id c26so3093164eds.8
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 08:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z/DDsWY474Xa+zjcBfFKboi75muYRoVjaBuY1De3KlQ=;
        b=d0PY+8gs+HppL0imKZQf9JDw/zoiES1fhKiECfj7S/QbLBKu0w/7ps+rKWud6Y/PBA
         8kOmrptJp4r94SNEW8rIXv//t/ucQ8L+YxYUh7Dc3POsVKpY0jYfjWh144b837vdBKYT
         pWB6xf3875XlMzVKIZfVsm0+VJ0Ay8CSUIfgnwMXK8y/yYajD7jvLpQRvxFpaTT/DHDF
         wUeKmf4Bpy0wSt88XBR1eEOeVlfqW6ng1DVAqiPIqTwycBrkQ92MrlrLSCD6IHQK82qJ
         WMW3okyIvXD9vV2Fo27Fl9DsplLhxb9wh+fc5OpCKrhqFAP+31wT7FHpMwfqGiAvl0AU
         /M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z/DDsWY474Xa+zjcBfFKboi75muYRoVjaBuY1De3KlQ=;
        b=SH7TFPW4KjPqofipkPTrn4UUAjqh2hiSrhIoh1z0h6+y0Yluqu/A1G7MiuLG9mkQgd
         /IQkgthFRJs8As7OBWm7mEaAxbT69C8xGigKrZR9dE2KoObAsV/MSNF+6NfMEFtyGHka
         oMy/9gDsnxDcHYlcTrxwbzzQMq1/Ff85WdYgwiRQeDkNz9C2MUjn9EEf5rWcHkFsLaPX
         8V2BClOSh36XApX5bc0RcvSwvgWiIUzozyqE8bHxrhnK5Lv3DpjK1q5U6sG7nSugUKNi
         OjieCX+0jBnNLbH5pf+gtt9TZUFtoEYvVo3PMkDyUnYRlMol2Qktz8kW/3uAg3Qg4Y2i
         inIw==
X-Gm-Message-State: APjAAAX9W7SfY/OyVJKnEUCzZD2RRUBnyrk8/A8Xz/yk3Gd8QJU2o0wG
        e8XNN1BikLqezkWdvCR+MIe2hQ==
X-Google-Smtp-Source: APXvYqxr0RdezdAcqeIeYXVWxfETnNalCciJvWAc/XKAhpVVfT5KGkf5rLQqPjO9CLHl27QGEhPhVQ==
X-Received: by 2002:a05:6402:3132:: with SMTP id dd18mr6394995edb.118.1578501812283;
        Wed, 08 Jan 2020 08:43:32 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id d22sm81627edp.28.2020.01.08.08.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 08:43:31 -0800 (PST)
Subject: Re: [PATCH v4 04/12] v4l: Add source event change for bit-depth
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-5-stanimir.varbanov@linaro.org>
 <c3b02589-1d7a-a476-7d33-7e555fbe276d@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <da434e7b-ffc6-2d59-76a7-a2ddeaf54657@linaro.org>
Date:   Wed, 8 Jan 2020 18:43:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <c3b02589-1d7a-a476-7d33-7e555fbe276d@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/8/20 6:09 PM, Hans Verkuil wrote:
> On 1/6/20 4:49 PM, Stanimir Varbanov wrote:
>> This event indicate that the source color bit-depth is changed
>> during run-time. The client must get the new format and re-allocate
>> buffers for it. This can usually happens with video decoder (encoders)
>> when the bit-stream color bit-depth is changed from 8 to 10bits
>> or vice versa.
>>
>> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  Documentation/media/uapi/v4l/vidioc-dqevent.rst | 8 +++++++-
>>  Documentation/media/videodev2.h.rst.exceptions  | 1 +
>>  include/uapi/linux/videodev2.h                  | 1 +
>>  3 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>> index 42659a3d1705..fad853d440cf 100644
>> --- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>> +++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>> @@ -402,7 +402,13 @@ call.
>>  	that many Video Capture devices are not able to recover from a temporary
>>  	loss of signal and so restarting streaming I/O is required in order for
>>  	the hardware to synchronize to the video signal.
>> -
>> +    * - ``V4L2_EVENT_SRC_CH_COLOR_DEPTH``
>> +      - 0x0002
>> +      - This event gets triggered when color bit-depth change is detected
>> +	from a video decoder. Applications will have to query the new pixel
>> +	format and re-negotiate the queue. In most cases the streaming must be
>> +	stopped and restarted (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
>> +	followed by :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).
> 
> I think this is too specific for decoders. Something similar to the
> CH_RESOLUTION description would be more appropriate:
> 
>       - This event gets triggered when a color bit-depth change (but not a
> 	resolution change!) is detected	at an input. This can come from an
> 	input connector or from a video decoder. Applications will have to query
> 	the new pixel format and re-negotiate the queue.
> 
> 	For stateful decoders follow the guidelines in :ref:`decoder`.
> 	Video capture devices will in most cases have to stop and restart
> 	streaming (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` followed by
> 	:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).
> 
> And update dev-decoder.rst where needed with this new event flag.
> 
> As to your question on irc: once I've acked this patch it can be merged
> via a venus PR.

Sounds good, thank you.

-- 
regards,
Stan
