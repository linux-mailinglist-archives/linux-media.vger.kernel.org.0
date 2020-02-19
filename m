Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F619163E4F
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 08:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgBSH4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 02:56:32 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45567 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgBSH4b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 02:56:31 -0500
Received: by mail-ed1-f66.google.com with SMTP id v28so28012203edw.12
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2020 23:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q3+DgOutnfX7SsA3bKGScs4wmPyXe9VReVvuWS0M6eg=;
        b=B9VOqdReReZ1UeU791Rw1WlZRkQMxOMH6TE0rvZjCfwjN+5+ngZKvK/2vWeKPsgu1H
         WresiCidvXZl/lPZ3JAHrOVFjVeEVJgAg0DRYc5zt6o8PsAzA5tFX6WkErNRD2yX4SLB
         4uAaPOMgTexnB1rhFyLRX014eJi1auuXLhhMfMou7yd2UwKjZ6Uf1JVJiQJkm3HJD0HY
         A+v3aoFgp6011VlLTNW47C0ebBYxxZ90iLj86hn+EAGee2LEfaUMGIUlUnGeqnOAHEqs
         3nANbPVRpgxZokwGanYa2uaA8BX0zdb96rGRENEnAd0NpFcRNg9hRQbtLxCXcbjWvbnw
         EK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q3+DgOutnfX7SsA3bKGScs4wmPyXe9VReVvuWS0M6eg=;
        b=dlT0hlAGPgKeB6Uv7YaRwaOc4kLfgXDXLZzwFbgyfa+Bn+C9MyXHB9yFSLSy6W7pj8
         KlLOjLeRfP5JTAhExt/LwO4q1h58p9XgaV219b0qbhlXo2fKLMGtfuAINChC2xuqngll
         CW5XxXZYr4EFDt/9MayqxfnsBe+szs5OdbrilmRi9MMsTLtjUY6n44s3vxjh/wubzuEW
         IaAWQrObHiPQGLMS0NE5vBcymYC2YA+yUjKhfO2QxZBZnctHwSl7EFHc+vh+mZ0LIfgX
         Zc9NrX3iHiZKiYUlnmrXSs/IVf/t3ue23yWfJc/EdQGdk6DiU1DswIAGDWsKzNWSSTPd
         eEfw==
X-Gm-Message-State: APjAAAVT+c4qDJvglNhsKV000Z4VIHTqHuUI4+8u8JHWc5Aaav/sGepc
        QyNFqYDlc/znvMVJyiETMn7Tt5PuV9Q=
X-Google-Smtp-Source: APXvYqzY1Ka4YmzayW0U4GzuX30KYCpJuQ7CVEnrnpvxHGnfC9YVDEwp3qO0A8Qn44H3AwHFDmYMjQ==
X-Received: by 2002:a17:906:e296:: with SMTP id gg22mr23367427ejb.7.1582098989740;
        Tue, 18 Feb 2020 23:56:29 -0800 (PST)
Received: from [192.168.27.209] ([94.155.124.210])
        by smtp.googlemail.com with ESMTPSA id qh18sm35942ejb.23.2020.02.18.23.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2020 23:56:28 -0800 (PST)
Subject: Re: [PATCH] media: venus: support frame rate control
To:     Jeffrey Kardatzke <jkardatzke@google.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, Andy Gross <agross@kernel.org>,
        "Mauro Carvalho Chehab )" <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200213213007.17023-1-jkardatzke@google.com>
 <b471217a-1877-eaed-55c2-084f4b126bb4@linaro.org>
 <CA+ddPcPjtv_9s4+t_1jkoGSZihVu2cVLyW102WuoLMy-RGkKPw@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b0c8653a-314e-bab9-9dc8-8c33b8d1efc9@linaro.org>
Date:   Wed, 19 Feb 2020 09:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CA+ddPcPjtv_9s4+t_1jkoGSZihVu2cVLyW102WuoLMy-RGkKPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jeff,

On 2/18/20 9:09 PM, Jeffrey Kardatzke wrote:
> Sorry for the duplicate, accidentally used HTML format and it got
> bounced from the mailing lists so resending.
> 
> On Mon, Feb 17, 2020 at 2:15 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hi Jeff,
>>
>> Thanks for the patch!
>>
>> On 2/13/20 11:30 PM, Jeffrey Kardatzke wrote:
>>> Frame rate control is always enabled in this driver, so make it silently
>>> support the V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE.
>>>
>>> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/venc_ctrls.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
>>> index 877c0b3299e9..9ede692f77c5 100644
>>> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
>>> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
>>> @@ -199,6 +199,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>>>               }
>>>               mutex_unlock(&inst->lock);
>>>               break;
>>> +     case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
>>> +             // Silently ignore, it's always enabled.
>>
>> Please, use C comments and follow the kernel coding style.
> 
> OK, hopefully I've got that now. I didn't see any issues aside from
> the comment style though.
> I'll upload a new patch shortly.
>>
>>
>> I wonder shouldn't it be better to add rc_enable field in struct
>> venc_controls and give the user choice to disable the rate control? We
>> can keep the default to be "enabled".
>>
> That'd be fine. Is there a way to actually disable the rate control though?

The rate control property values are here [1], and [2] is where we set
the control.

-- 
regards,
Stan

[1]
https://elixir.bootlin.com/linux/v5.6-rc2/source/drivers/media/platform/qcom/venus/hfi_helper.h#L229
[2]
https://elixir.bootlin.com/linux/v5.6-rc2/source/drivers/media/platform/qcom/venus/venc.c#L734
