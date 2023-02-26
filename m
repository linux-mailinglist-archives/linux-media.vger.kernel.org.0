Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D0D6A2F90
	for <lists+linux-media@lfdr.de>; Sun, 26 Feb 2023 14:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjBZNAT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Feb 2023 08:00:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjBZNAS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Feb 2023 08:00:18 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F370611EA4
        for <linux-media@vger.kernel.org>; Sun, 26 Feb 2023 05:00:06 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id v17-20020a0568301bd100b0068dc615ee44so2153601ota.10
        for <linux-media@vger.kernel.org>; Sun, 26 Feb 2023 05:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112; t=1677416406;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgwAft76MVKJ3JIww+0YZ/avvsUKs+QoEtHd96JJENw=;
        b=l2QADTu+ttG1Fi4+KkCEtnfdL+mLfOO5txaNhNMXVC1i5x4mIaw8jhCGoqM5T9kSoP
         MKNlEG3gs7XzGB8yFAESPpvs0nBY1fKQ4u+MTuEIcXIm1sMsaJMM69FobbpCcPtA0Aie
         /Ks0fyO5TJySE3k+sMOugkCi7ByQ92+WZScFZFVefHRIwUKsae7Vdyf0KjKmEDk8vSec
         Z8bmjWXM+7pa6JdbQLAYkUE+LY9XyapR7+LjylLsSv5m/ShHjSy1fqiplV7ltG6NomOJ
         wFJLTuR8gcZBfiKZu2C9Vcy4L1aUTvmc3WwyJ+Ncwc13EkUvA/Qp2Y8mCrUG8b2bcEe4
         a69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677416406;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgwAft76MVKJ3JIww+0YZ/avvsUKs+QoEtHd96JJENw=;
        b=ILV5bE6J7mb4BBC6T6jaTBOfwFtHg+L9US2Fi/wl4BeD0znbTc8JEtI4avvX9AjV0t
         JLeOTffKsJrzyzR0l1XCRyLCGt1rKNe0AoesdnkjXKpvzytU/9TQN7TnqDLA59yFAMYy
         iKArJi4oeq3Zg5we7k5NGCEqkf6CMC7HwYpgaXay9Kfv9OBEn2w7M26GIJMYmiwgDlSD
         +mahOx/+YlAlqcDHxYvz+DFzuduPIZeR8SwuoKPa/s3kJULpfVmxhJ563AmEX6TqKFdk
         HYXmsnRyaGO7XGEUF+2ccR+opNLq5sP5Zchrn3ZYpuYDoWP3ZhxdBZp8/xvBAm7Vw+/R
         8WUQ==
X-Gm-Message-State: AO0yUKXL/5NjQth7PNXHoN2uCxaPZ8AuY2xUcpl1Z6dGw+ZGxPa5id35
        0Xub1AXG1LBLD13h6qYvTnCheA==
X-Google-Smtp-Source: AK7set/1fWvGNlxMxr9og7qWJd450CA2axI6QC3mjPLsW6OkHhpMtz/40zz7xsgNfnHcxHpPbqypHQ==
X-Received: by 2002:a05:6830:104a:b0:68b:df1f:7713 with SMTP id b10-20020a056830104a00b0068bdf1f7713mr9813989otp.0.1677416406310;
        Sun, 26 Feb 2023 05:00:06 -0800 (PST)
Received: from [192.168.10.175] ([190.106.125.26])
        by smtp.gmail.com with ESMTPSA id e23-20020a9d5617000000b00693c9f984b4sm1539780oti.70.2023.02.26.05.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 05:00:05 -0800 (PST)
Date:   Sun, 26 Feb 2023 09:59:54 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v9 5/6] media: verisilicon: HEVC: Only propose 10 bits
 compatible pixels formats
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, hverkuil-cisco@xs4all.nl,
        nicolas.dufresne@collabora.co.uk, robert.mader@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Message-Id: <URUOQR.DFWFJPPFZKJS3@vanguardiasur.com.ar>
In-Reply-To: <20230220104849.398203-6-benjamin.gaignard@collabora.com>
References: <20230220104849.398203-1-benjamin.gaignard@collabora.com>
        <20230220104849.398203-6-benjamin.gaignard@collabora.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Mon, Feb 20 2023 at 11:48:48 AM +0100, Benjamin Gaignard 
<benjamin.gaignard@collabora.com> wrote:
> When decoding a 10bits bitstreams HEVC driver should only expose
> 10bits pixel formats.
> To fulfill this requirement it is needed to call 
> hantro_reset_raw_fmt()
> when bit depth change and to correctly set match_depth in pixel 
> formats
> enumeration.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
> version 9:
> - Fix brackets
> 
>  drivers/media/platform/verisilicon/hantro_drv.c   | 12 +++++++++---
>  drivers/media/platform/verisilicon/imx8m_vpu_hw.c |  2 ++
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c 
> b/drivers/media/platform/verisilicon/hantro_drv.c
> index c237253803f4..7d452f1afaae 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -325,9 +325,15 @@ static int hantro_hevc_s_ctrl(struct v4l2_ctrl 
> *ctrl)
>  			   struct hantro_ctx, ctrl_handler);
> 
>  	switch (ctrl->id) {
> -	case V4L2_CID_STATELESS_HEVC_SPS:
> -		ctx->bit_depth = ctrl->p_new.p_hevc_sps->bit_depth_luma_minus8 + 8;
> -		break;
> +	case V4L2_CID_STATELESS_HEVC_SPS: {
> +		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
> +		int bit_depth = sps->bit_depth_luma_minus8 + 8;
> +
> +		if (ctx->bit_depth == bit_depth)
> +			return 0;
> +
> +		return hantro_reset_raw_fmt(ctx, bit_depth);
> +	}
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c 
> b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> index b390228fd3b4..f850d8bddef6 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -152,6 +152,7 @@ static const struct hantro_fmt 
> imx8m_vpu_g2_postproc_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV12,
>  		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
>  		.postprocessed = true,
>  		.frmsize = {
>  			.min_width = FMT_MIN_WIDTH,
> @@ -165,6 +166,7 @@ static const struct hantro_fmt 
> imx8m_vpu_g2_postproc_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_P010,
>  		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
>  		.postprocessed = true,
>  		.frmsize = {
>  			.min_width = FMT_MIN_WIDTH,
> --
> 2.34.1
> 


