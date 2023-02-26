Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A048B6A2F93
	for <lists+linux-media@lfdr.de>; Sun, 26 Feb 2023 14:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjBZNAb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Feb 2023 08:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjBZNAY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Feb 2023 08:00:24 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A015125A7
        for <linux-media@vger.kernel.org>; Sun, 26 Feb 2023 05:00:23 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id v17-20020a0568301bd100b0068dc615ee44so2153874ota.10
        for <linux-media@vger.kernel.org>; Sun, 26 Feb 2023 05:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lLGsk+gLJxcCRY4U0sKJyCu/BebhluGO1o8XNKetb1U=;
        b=hAzwHKJna3H3ETr470mU3Z5x24+loDNyEc9nPknLoLVwMIsBp3LaFheflZvhkCPELS
         z6YPthe9EQBpTvZWUBP0O5y12q8CAqh1E1lB7mMoDPXOnsCSwiqTjljJX/yHU6scPxM+
         mIaWHCKSe/PM5IU9wb9EAHI6VPsK4mcPVA6g87Hp9RMTArnarGeF3P6oiOvlCbHZ+/18
         PXKxQS9LwsUwa7FITcno/sTY/xfTnJt0hx8OMIvUelABzzVQu7D89bIieRlILEerrhw2
         523Gk3ohxrbT/CWarn82DlZqvH5QNFSjwYCl55Y8F/9QLvmGklJAo5iLCRDVX5085zAd
         X45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLGsk+gLJxcCRY4U0sKJyCu/BebhluGO1o8XNKetb1U=;
        b=8GSm0mJqHHiwgsnNsoUP4WLzTgKAUhFO9kJakn1cU6zpIiBv2yFDLmj4BllGo8F41X
         ZUlrtAQHfn4YFeRowvye34Qht8TEK3wpBfamRHNP9yQQMQPDbuV9jtkkYJDR5u5es+cb
         dLnoHVoVp5zYYcF/M2aAUO7kaKw6L4/e1PDL4tNAa2KvHi33LlHd1waOcRxgzREFF0vt
         CrN05XTcha9FcXXVsecrofbpkOXTp4I5P0Z3CwE60uODfHPEKtAWTXF4dZ4GKUnS1V8L
         cbTiAGfjNWAgrZMmfAWerbyZnO6lkpADjQSbdQYTUjVumUE9uumUuJcjNXV6uiPyR2zU
         yXtg==
X-Gm-Message-State: AO0yUKWnjJNC5sMz64WgKbCamBVJPPXf2iH4fRh8G6pkghOioVskva4e
        iWPObTgSyvcrHVQ3c7hFs3s5Sw==
X-Google-Smtp-Source: AK7set9V7t43YFTiwn5bhCTvhloWETeAoltvYJJMWDKxj/SdeWxdHqLtkJCEUVQ7uJ/+a0U7TJ4dig==
X-Received: by 2002:a05:6830:30a0:b0:68b:d092:e784 with SMTP id g32-20020a05683030a000b0068bd092e784mr11175389ots.1.1677416422716;
        Sun, 26 Feb 2023 05:00:22 -0800 (PST)
Received: from [192.168.10.175] ([190.106.125.26])
        by smtp.gmail.com with ESMTPSA id t12-20020a05683014cc00b0068bcc902b82sm1539924otq.71.2023.02.26.05.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 05:00:21 -0800 (PST)
Date:   Sun, 26 Feb 2023 10:00:11 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v9 6/6] media: verisilicon: VP9: Only propose 10 bits
 compatible pixels formats
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, hverkuil-cisco@xs4all.nl,
        nicolas.dufresne@collabora.co.uk, robert.mader@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@collabora.com
Message-Id: <BSUOQR.VGJZUEF5E1XC1@vanguardiasur.com.ar>
In-Reply-To: <20230220104849.398203-7-benjamin.gaignard@collabora.com>
References: <20230220104849.398203-1-benjamin.gaignard@collabora.com>
        <20230220104849.398203-7-benjamin.gaignard@collabora.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Mon, Feb 20 2023 at 11:48:49 AM +0100, Benjamin Gaignard 
<benjamin.gaignard@collabora.com> wrote:
> When decoding a 10bits bitstreams VP9 driver should only expose
> 10bits pixel formats.
> To fulfill this requirement it is needed to call 
> hantro_reset_raw_fmt()
> when bit depth change and to correctly set match_depth in pixel 
> formats
> enumeration.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
> version 9:
> - Fix brackets
> 
>  drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c 
> b/drivers/media/platform/verisilicon/hantro_drv.c
> index 7d452f1afaae..d20e62c025ae 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -307,9 +307,14 @@ static int hantro_vp9_s_ctrl(struct v4l2_ctrl 
> *ctrl)
>  			   struct hantro_ctx, ctrl_handler);
> 
>  	switch (ctrl->id) {
> -	case V4L2_CID_STATELESS_VP9_FRAME:
> -		ctx->bit_depth = ctrl->p_new.p_vp9_frame->bit_depth;
> -		break;
> +	case V4L2_CID_STATELESS_VP9_FRAME: {
> +		int bit_depth = ctrl->p_new.p_vp9_frame->bit_depth;
> +
> +		if (ctx->bit_depth == bit_depth)
> +			return 0;
> +
> +		return hantro_reset_raw_fmt(ctx, bit_depth);
> +	}
>  	default:
>  		return -EINVAL;
>  	}
> --
> 2.34.1
> 


