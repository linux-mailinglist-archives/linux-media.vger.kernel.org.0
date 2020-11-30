Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8AB92C7F5B
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 08:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbgK3H4S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 02:56:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbgK3H4P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 02:56:15 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743E8C0613CF
        for <linux-media@vger.kernel.org>; Sun, 29 Nov 2020 23:55:29 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id gj5so19817393ejb.8
        for <linux-media@vger.kernel.org>; Sun, 29 Nov 2020 23:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lLjwMaRlmFk8cdjb61byqEUPHvd5mHzz+PPVHsNni1U=;
        b=UDyYpxcPlLMlL1aNJW1x9AbN37aqd+AIG23FKB/f+lnfQ0qFsXhz0n5R899QDDTucz
         eqvrGTDaiYSV4tw8hpzB/zmYFgfnqjn2I6NdydMxXrS2OsdAKAHzq5Gr5TOORlBV90zC
         T9Zkn07E+KbPQ0Jj6TLrIOqsCYuBxr1ZbCZX7hg8ofhCmMDpGupMr/fgKHtPvAat56Xq
         hpX86eryIGBvmVnPELmXSL2QS4yDMKcQrYtK0IfgB4tTYPnGuwbGxNusDuqRRYoIKqcJ
         gr03oLSxJLPuurAsGBO72Tzk/SUn7PyYz9e2HrSRLXClT+RtjGAlITc88ixzV3iBd4n0
         WHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lLjwMaRlmFk8cdjb61byqEUPHvd5mHzz+PPVHsNni1U=;
        b=TebqwV0y6lyU0Tq7RiKFjGLRRgy2kpACAvXos5/CiNtCBVg7GV17QMf1t76C9qvO23
         TaVKbB165AB3BQ7ncMOxCnaB8DooAZrakPiT0pymGvjkAQl2VMfZ8JhF5JlGuKqYqa8J
         mHS4fLhqTUDfTwU3J7wZ3I2YMYb4H5PIOO2hWHc4zNrZMzF1hjcCdgckYtNcR8opDFHv
         wX3AkKUF+fJUlpIUI36/64Sc6u34LjjOr51r+9Gn/TkhyjMQQ9uc4GLsr5fEOJW2C1y7
         bvMACLcLUfPOsDkJ5c6GHDIN9PSWhlcHZXfh6/XQ014RxclC3ZBaIjEQxYz0dp4+E+Ue
         nTCQ==
X-Gm-Message-State: AOAM53109avAodiqDZgVpeDolq7E5q+MFtL3iMtrqGw46c8jRwB7CVfy
        NTSqB73IXZLjFT/niqEjDsgXK2Vr33E9yXdX
X-Google-Smtp-Source: ABdhPJzcj32N0IZjwASJ4Qy9YUq174cNRzne/2mX0AbEhr+sbor3LD60k6ZMpPOQFunFRPnEyjnrNw==
X-Received: by 2002:a17:906:af83:: with SMTP id mj3mr12580359ejb.243.1606722928131;
        Sun, 29 Nov 2020 23:55:28 -0800 (PST)
Received: from [192.168.0.3] (hst-221-70.medicom.bg. [84.238.221.70])
        by smtp.googlemail.com with ESMTPSA id b5sm549899edw.69.2020.11.29.23.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Nov 2020 23:55:27 -0800 (PST)
Subject: Re: [PATCH v2 0/8] Venus stateful encoder compliance
To:     Fritz Koenig <frkoenig@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
 <CAMfZQbxV4CuZ57kv1Nu=VTdd-eK2opMqnduxGGa+KvptaFL7=A@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d539ab91-da28-e8b3-6b39-d5564eb6f22a@linaro.org>
Date:   Mon, 30 Nov 2020 09:55:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMfZQbxV4CuZ57kv1Nu=VTdd-eK2opMqnduxGGa+KvptaFL7=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fritz,

On 11/29/20 9:17 PM, Fritz Koenig wrote:
> Since this patchset adds support for V4L2_ENC_CMD_STOP and
> VENUS_ENC_STATE_ENCODING it should also add support for
> VIDIOC_TRY_ENCODER_CMD so that those commands are discoverable.  I've

6/8 is adding it:

+	.vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,

> made an attempt at that here:
> https://www.spinics.net/lists/linux-media/msg182319.html
> 
> On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hello,
>>
>> Here is v2 of the subject patchset.
>>
>> The patchset starts with few small preparation and fix patches, 1/8 to 5/8.
>> 6/8 is redesigned Dikshita's patch and 7/8 add Reset encoder state handling.
>> The last 8/8 just delete not needed helper function.
>>
>> The major changes are:
>>  * An attempt to reuse m2m helpers for drain and reset state in 6/8 and 7/8.
>>  * Use null encoder buffer to signal end-of-stream in 6/8.
>>
>> Comments are welcome!
>>
>> regards,
>> Stan
>>
>> Dikshita Agarwal (1):
>>   venus: venc: add handling for VIDIOC_ENCODER_CMD
>>
>> Stanimir Varbanov (7):
>>   venus: hfi: Use correct state in unload resources
>>   venus: helpers: Add a new helper for buffer processing
>>   venus: hfi_cmds: Allow null buffer address on encoder input
>>   venus: helpers: Calculate properly compressed buffer size
>>   venus: pm_helpers: Check instance state when calculate instance
>>     frequency
>>   venus: venc: Handle reset encoder state
>>   venus: helpers: Delete unused stop streaming helper
>>
>>  drivers/media/platform/qcom/venus/helpers.c   |  65 ++---
>>  drivers/media/platform/qcom/venus/helpers.h   |   2 +-
>>  drivers/media/platform/qcom/venus/hfi.c       |   2 +-
>>  drivers/media/platform/qcom/venus/hfi.h       |   1 -
>>  drivers/media/platform/qcom/venus/hfi_cmds.c  |   2 +-
>>  .../media/platform/qcom/venus/pm_helpers.c    |   3 +
>>  drivers/media/platform/qcom/venus/venc.c      | 232 +++++++++++++++---
>>  7 files changed, 226 insertions(+), 81 deletions(-)
>>
>> --
>> 2.17.1
>>

-- 
regards,
Stan
