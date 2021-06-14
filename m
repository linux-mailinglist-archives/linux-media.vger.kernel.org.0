Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1A73A6622
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233339AbhFNL6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:58:09 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:44009 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbhFNL6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:58:08 -0400
Received: by mail-wm1-f42.google.com with SMTP id 3-20020a05600c0243b029019f2f9b2b8aso12626906wmj.2
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 04:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yO4bQv3rKZ65ZJRJ/lyl1Qcd2blU+mVdtVLes/zMW7s=;
        b=awICW+94hy4NRGpMkZ5TAOwo7443g11BQ6nOWcg76dvZXWc2p7Hk/0nAO9g4JNdYkf
         MwvBMpaYoSd8zQ0vDA8drAAk+ahvuAegi3a83dvDQwGidRLiaNzUZxB7XdzMtw3RzCmH
         iFHMR5zdNfmYrlCUMsSyg+PujxOpdkBnqAcqeQhfnlM2G+PGObTjjruifZNbCiim5DNW
         sH9HwxjfebRCqLqvjDPtHeRrpkdYgMWHIWvUxX2/5EbzPeeeijjj28MOJGO0SC6Nl/dv
         7MK6TNYfrTHEbHlHg04na1ckTL83QxyuixeCNXi2Pdw11yV++ZyTPOkFrwsAhkhudbLQ
         O7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yO4bQv3rKZ65ZJRJ/lyl1Qcd2blU+mVdtVLes/zMW7s=;
        b=mzhCYVjKWgJ3F1X/7N8hJi71r2HGWYoR2OLNn5XKjUQs58gmK2cCCl3vAJICQB+v7g
         9uZu7SGm0Zrt8BFWMvwfUJy4VPYTP6DCvr6sXQgtWwi/dK1gcaSt4eCP65fDVEXBD8fM
         rOq/0OfOme6Qb/o0opLG6j6NVjSKM+tjWYz0NXA/Cs9lXxtih1xJwZQTXSA+k3gCSSJp
         zykNL1osSvv+k1sI16Pot/Z+O6mv6TGV6vmJzzSEilCSFGRpEhDzAtFtq/0qi5F/7eFu
         vfc37jRWPxF6bLh9UAVuHm+GK41ZdMmlub7LiUncl/NQFZRc+ILTcuZrfIZe1/nUaH6i
         c3Kg==
X-Gm-Message-State: AOAM5311b//oAT+JzARONwS0SfyJryux5rb2yVVe4of2WG5eFhOsVWQV
        bti5ccRde5PW264SwowVvgirRg==
X-Google-Smtp-Source: ABdhPJxHKOW0w1lBJGYcvVFuYGzq87xRJP78nHKvtf1vYSTYapG2R0es7hemaCO+D6a6+ezpZ4TgVw==
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr32404919wmk.147.1623671705038;
        Mon, 14 Jun 2021 04:55:05 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b15sm18917776wrr.27.2021.06.14.04.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 04:55:04 -0700 (PDT)
Subject: Re: [PATCH] venus: helper: do not set constrained format for UBWC
To:     mansur@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        dikshita@codeaurora.org
References: <1622195288-18541-1-git-send-email-mansur@codeaurora.org>
 <a66e00f2-af3a-9550-0779-625152cc2719@nexus-software.ie>
 <17aaec56-bfad-63a6-b1c4-7562dedb3137@linaro.org>
 <b649a7ecb3feb1fdf6d0743135814840@codeaurora.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <28ab2706-2a0c-e9d6-c02c-8ede6fa01efb@linaro.org>
Date:   Mon, 14 Jun 2021 12:56:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b649a7ecb3feb1fdf6d0743135814840@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/06/2021 07:25, mansur@codeaurora.org wrote:
> On 2021-06-02 15:23, Stanimir Varbanov wrote:
>> Mansur, could you answer to Bryan's comments?
>>
>>> On 5/28/21 8:23 PM, Bryan O'Donoghue wrote:
>>>> On 28/05/2021 10:48, Mansur Alisha Shaik wrote:
>>>>> Do not set constrained format explicitly for UBWC
>>>>>
>>>>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>>>
>>>> Could you give a little bit more detail on why, what the side 
>>>> effects are ?
>>>>
>      Sorry for late response, by default for NV12_UBWC is 128x32
> 

Right so we have

pconstraint.plane_format[0].stride_multiples = 128;
pconstraint.plane_format[0].min_plane_buffer_height_multiple = 32;

and

pconstraint.plane_format[1].stride_multiples = 128;
pconstraint.plane_format[1].min_plane_buffer_height_multiple = 16;

and your patch says if opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC then the we 
shouldn't do hfi_session_set_property()

I'm sure that's a fix that works but, I wonder would it be possible to 
fix this routine to continue to do hfi_session_set_property() with 
updated parameters for opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC ?

Could you drill down into the detail in the commit log a little bit 
maybe giving a description of why returning for opb_fmt == 
HFI_COLOR_FORMAT_NV12_UBWC is the right thing to-do instead of adding a 
new case to the routine for HFI_COLOR_FORMAT_NV12_UBWC and calling 
hfi_session_set_property() ?

Its more for my own education on this topic :) but, also helps somebody 
else reading the log to understand what the fix is, why it is done this way.

>>>> Should this be a Fixes: ?
>>>>
>      without this fix on V6, firmware throws below SFR
>      qcom-venus aa00000.video-codec: SFR message from FW: 
> QC_IMAGE_VERSION_STRING=video-firmware.1.0-df9cb37cf8e507a4468265658702247652351a49 
> 
>      Err_Fatal - 
> /local/mnt/workspace/pkg/builds/dynamic_timely/tree2/vendor/qcom/proprietary/video-firmware-noship/venus_proc/venus/decoders/common/src/video_decoder.c:6644:2fef3 
> 
>      which result in playback happens through Software codec.
OK, I think I can answer my own question here.

Technically no since 6XX isn't in the long-term-support kernel but, I'd 
suggest adding a "Fixes" anyway, so that other users know to apply this 
patch to their trees.

Fixes: bc28936bbba9 ("media: venus: helpers, hfi, vdec: Set actual plane 
constraints to FW")

---
bod
