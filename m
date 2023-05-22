Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7805770C017
	for <lists+linux-media@lfdr.de>; Mon, 22 May 2023 15:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233887AbjEVNvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 May 2023 09:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbjEVNve (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 May 2023 09:51:34 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D883E5F
        for <linux-media@vger.kernel.org>; Mon, 22 May 2023 06:51:07 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso10973422a12.2
        for <linux-media@vger.kernel.org>; Mon, 22 May 2023 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684763466; x=1687355466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wFrTzk6Qk244b5yNgIKxU8qzgRj1p3sZQVYSiF0Mu2Q=;
        b=hEq7DUhClXrffI4NqUZ4RFxruWpENS8+m7Et1rPO2B8V+1DYE7GPzqV2nBp8q+T+C2
         UsiSftguDHAOjjYSJqb2Ak6ifxDNgnoKmyhBtiRMV+CQkKCLsoCaw75t5S5QP9kIkO1d
         tGgDBiPY4gKRSRmAcpyXeC5S71zv1ryaaI7cKyYEQCjVWQrBiwK9lHwgN5ikGGeaj+bM
         /8zSGj+7drxWVwmrsk80GNvAuFne6GU1+Uo7Ceuqus5AXZ/CcD3V/7O8U2HidueoRMdL
         2REepNe6DGaSI6qEfK3V0MnxnXkwE6EvhHZc5+sEhac042zQawRFq3+RdQiT2r5ARuAn
         y0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684763466; x=1687355466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wFrTzk6Qk244b5yNgIKxU8qzgRj1p3sZQVYSiF0Mu2Q=;
        b=hYaIJH9Ze9M01qeur6xADRAYW/vvjI3b01RUYZunb1PunmzbDp96vkinmIKEXsUkLO
         /QmFWG2d5UkoI2tiyOlG0vrlIo2nVsnDlG2kvAfc1tkt8R9UTA5VJWDxhYACFs/I63oV
         bSpqmggupeQasbidpRh9KQ1M+W2WF7I4/tPQ1r6QWfAeKniBpbCmK6w+d1JS+HrYPtkQ
         5kXDsXDgEK76Ol8dIC3TU9FdBWALvHFSitP+vFZQ18nGjpGr4EKI5DpMuN2NtA0vN2Xf
         K/b9nCfypn9EWzMtxacFI1hbYX3hUAESymA4c/TNastfQgXWUsQXv2dYcfA3miNBqGcs
         cHBA==
X-Gm-Message-State: AC+VfDz5kvGRVq50eFLPqx/82YC6x0wYUfSNptjagkte6G+Y7PivQVR0
        I8ZjRfPw6P3nVp46ynUjmSPAyw==
X-Google-Smtp-Source: ACHHUZ7SBW11U9JaGmBWb4RzDwE2m8LKV7W/4I5ggeX6Ei8/htduji6WB5PzkJxWVAgTfjFYptlC1g==
X-Received: by 2002:aa7:ca48:0:b0:50d:bd25:3704 with SMTP id j8-20020aa7ca48000000b0050dbd253704mr9864421edt.14.1684763465802;
        Mon, 22 May 2023 06:51:05 -0700 (PDT)
Received: from [192.168.118.20] ([87.116.165.186])
        by smtp.gmail.com with ESMTPSA id g16-20020aa7d1d0000000b005068fe6f3d8sm2997486edp.87.2023.05.22.06.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 06:51:05 -0700 (PDT)
Message-ID: <9db2ff70-d513-9e63-834c-64e448f9babb@linaro.org>
Date:   Mon, 22 May 2023 16:51:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] media: camss: camss-video: Don't zero subdev format again
 after initialization
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230503075340.45755-1-y.oudjana@protonmail.com>
Content-Language: en-US
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
In-Reply-To: <20230503075340.45755-1-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 03.05.2023 10:53, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> In an earlier commit, setting the which field of the subdev format struct
> in video_get_subdev_format was moved to a designated initializer that also
> zeroes all other fields. However, the memset call that was zeroing the
> fields earlier was left in place, causing the which field to be cleared
> after being set in the initializer.
> 
> Remove the memset call from video_get_subdev_format to avoid clearing the
> initialized which field.
> 
> Fixes: ecefa105cc44 ("media: Zero-initialize all structures passed to subdev pad operations")
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 898f32177b12..8640db306026 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -353,7 +353,6 @@ static int video_get_subdev_format(struct camss_video *video,
>   	if (subdev == NULL)
>   		return -EPIPE;
>   
> -	memset(&fmt, 0, sizeof(fmt));
>   	fmt.pad = pad;
>   
>   	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);

Have verified that this fix does work on RB3 and RB5 boards and is 
necessary for the capture to work.

Thanks!

Tested-by: Andrey Konovalov <andrey.konovalov@linaro.org>
