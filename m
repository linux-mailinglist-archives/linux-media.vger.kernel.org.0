Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54EB92CBA93
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 11:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388414AbgLBK2x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 05:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388076AbgLBK2x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 05:28:53 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA88C0613D6
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 02:28:07 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id u19so3158642edx.2
        for <linux-media@vger.kernel.org>; Wed, 02 Dec 2020 02:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pOIFH2c7aUrVRRVYvlUc1syo0njMuyaej3dxXHicsn4=;
        b=ty5mGyimYDzNAdXwX4p0YYa/HTJwKSg39bxZcVdfLzO5uBXF7g9TAzd3ltuq7gSK57
         K6XqMTxW3lF+x5bN6nQzDY/rURK4j2m1C/B/9uYhnIcTDWTw2UZIREILi5FF70l4jRSf
         RVLsuwHSioHJJpwEBEeksk54zPu+K9N7FfpKw7FSizTGbP+ok45jdcyZQxk5FmT5Iwcv
         tT7JoKoCuOBEEHlkPo+GPSc1oVJSIBItWQDNyJho0YrUzsmWJi8qdQ/NuvUFrB0U8wsI
         Fos44l+j/d5kJR7oQaYPodtpXkEn1ze/wWbL73hIK4hv/ZiRZgcqaSd0nhuUN6i5E7UY
         khxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pOIFH2c7aUrVRRVYvlUc1syo0njMuyaej3dxXHicsn4=;
        b=QQ32Lz5xVO1coJ0PVQ6KgR6VzBc0J7DAJZiGjD46mNp+JD7nyis0NxHE6o8yMe2i/t
         W8ja30JZrwCr0pofE8RC/PO57aq4XAfneJnOYOCMS9qPP7vDdF9x+K2g5ZzApl7Iugkk
         4ABxjjeW6dgcV0Q48M93vtLDiF7Q/2a9ATz3C0cfRNy0XIxbmAqqg1LyWzSnZe2qLozU
         4nvwiCJfWEc9tZsyHT4qItdMA2tJZKBOY/FcNW8V0g16qnyCjktqOt9kLKnFxWx6eKC8
         TyUBflolTnu8DP8LB1jf5synAzXP+TqWJRNBWY9OjeCKhfsDuo63VW2JbmCo4P7Zj58e
         uPig==
X-Gm-Message-State: AOAM532X8WZWn/lqMMCM8GZXcSMK/kVd3ELsk0WUQUoBogemM5ZlVTGN
        LmrSlRtltLZ1vH+YAmehlIj2zeqLzu8Lrf9T
X-Google-Smtp-Source: ABdhPJzzpjIL5eskPImxD4ZAPuWyPJAyD6Vtl15araHbU4xgAdWPTaamVhoHl/cKP4dVI8Fl6aes+w==
X-Received: by 2002:a50:d8c8:: with SMTP id y8mr1878914edj.82.1606904885590;
        Wed, 02 Dec 2020 02:28:05 -0800 (PST)
Received: from [192.168.0.3] (hst-221-33.medicom.bg. [84.238.221.33])
        by smtp.googlemail.com with ESMTPSA id n17sm779483ejh.49.2020.12.02.02.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 02:28:05 -0800 (PST)
Subject: Re: [PATCH] media: venus: preserve DRC state across seeks
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20201202053424.3286774-1-acourbot@chromium.org>
 <CAPBb6MXt4uL+VgxQs6ynf5LKae657QXmrjw6XYnL0vg_zuuDsw@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <89086086-c0d9-62b0-2819-a537fe92782f@linaro.org>
Date:   Wed, 2 Dec 2020 12:28:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MXt4uL+VgxQs6ynf5LKae657QXmrjw6XYnL0vg_zuuDsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 12/2/20 12:24 PM, Alexandre Courbot wrote:
> On Wed, Dec 2, 2020 at 2:34 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>>
>> DRC events can happen virtually at anytime, including when we are
>> starting a seek. Should this happen, we must make sure to return to the
>> DRC state, otherwise the firmware will expect buffers of the new
>> resolution whereas userspace will still work with the old one.
>>
>> Returning to the DRC state upon resume for seeking makes sure that the
>> client will get the DRC event and will reallocate the buffers to fit the
>> firmware's expectations.
> 
> Oops, please ignore as this seems to depend on another patch... I will
> repost once I can figure out the correct dependency chain, unless
> Stanimir can find a better way to handle DRC during seek and flush.

This patch depends on [1] series which is still under review.

[1] https://www.spinics.net/lists/linux-media/msg177801.html

> 
>>
>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>> ---
>>  drivers/media/platform/qcom/venus/vdec.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>> index 8488411204c3..e3d0df7fd765 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -972,7 +972,10 @@ static int vdec_start_output(struct venus_inst *inst)
>>
>>         if (inst->codec_state == VENUS_DEC_STATE_SEEK) {
>>                 ret = venus_helper_process_initial_out_bufs(inst);
>> -               inst->codec_state = VENUS_DEC_STATE_DECODING;
>> +               if (inst->next_buf_last)
>> +                       inst->codec_state = VENUS_DEC_STATE_DRC;
>> +               else
>> +                       inst->codec_state = VENUS_DEC_STATE_DECODING;
>>                 goto done;
>>         }
>>
>> @@ -1077,8 +1080,10 @@ static int vdec_stop_capture(struct venus_inst *inst)
>>                 ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
>>                 fallthrough;
>>         case VENUS_DEC_STATE_DRAIN:
>> -               vdec_cancel_dst_buffers(inst);
>>                 inst->codec_state = VENUS_DEC_STATE_STOPPED;
>> +               fallthrough;
>> +       case VENUS_DEC_STATE_SEEK:
>> +               vdec_cancel_dst_buffers(inst);
>>                 break;
>>         case VENUS_DEC_STATE_DRC:
>>                 WARN_ON(1);
>> @@ -1102,6 +1107,7 @@ static int vdec_stop_output(struct venus_inst *inst)
>>         case VENUS_DEC_STATE_DECODING:
>>         case VENUS_DEC_STATE_DRAIN:
>>         case VENUS_DEC_STATE_STOPPED:
>> +       case VENUS_DEC_STATE_DRC:
>>                 ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
>>                 inst->codec_state = VENUS_DEC_STATE_SEEK;
>>                 break;
>> @@ -1371,6 +1377,7 @@ static void vdec_event_change(struct venus_inst *inst,
>>                         dev_dbg(dev, VDBGH "flush output error %d\n", ret);
>>         }
>>
>> +       inst->next_buf_last = true;
>>         inst->reconfig = true;
>>         v4l2_event_queue_fh(&inst->fh, &ev);
>>         wake_up(&inst->reconf_wait);
>> --
>> 2.29.2.454.gaff20da3a2-goog
>>

-- 
regards,
Stan
