Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B6D70DF20
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 16:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236702AbjEWOXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 10:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236641AbjEWOXL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 10:23:11 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CFF0DD
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 07:23:09 -0700 (PDT)
Received: (Authenticated sender: didi.debian@cknow.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 694AAFF804;
        Tue, 23 May 2023 14:23:05 +0000 (UTC)
From:   Diederik de Haas <didi.debian@cknow.org>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        benjamin.gaignard@collabora.com, linux-rockchip@lists.infradead.org
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel@pengutronix.de, m.tretter@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Subject: Re: [PATCH] media: verisilicon: Fix null pointer dereference in try_fmt
Date:   Tue, 23 May 2023 16:22:56 +0200
Message-ID: <6444204.lOV4Wx5bFT@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20230516091209.3098262-1-m.tretter@pengutronix.de>
References: <20230516091209.3098262-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5339283.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--nextPart5339283.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Date: Tue, 23 May 2023 16:22:56 +0200
Message-ID: <6444204.lOV4Wx5bFT@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20230516091209.3098262-1-m.tretter@pengutronix.de>
References: <20230516091209.3098262-1-m.tretter@pengutronix.de>
MIME-Version: 1.0

On Tuesday, 16 May 2023 11:12:09 CEST Michael Tretter wrote:
> Since commit db6f68b51e5c ("media: verisilicon: Do not set context
> src/dst formats in reset functions"), vpu_src_fmt is not set in the
> reset function, but only set in hantro_set_fmt_out, which calls
> hantro_try_fmt before setting the format. Therefore, hantro_try_fmt
> might be called with vpu_src_fmt still being null.
> 
> Add a test if the format is actually set before checking the format.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Fixes: db6f68b51e5c ("media: verisilicon: Do not set context src/dst formats
> in reset functions") ---
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> b/drivers/media/platform/verisilicon/hantro_v4l2.c index
> 835518534e3b..ec37d2646fde 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -313,17 +313,20 @@ static int hantro_try_fmt(const struct hantro_ctx
> *ctx, /* Fill remaining fields */
>  		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
>  				    pix_mp->height);
> -		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE 
&&
> +		if (ctx->vpu_src_fmt &&
> +		    ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE 
&&
>  		    !hantro_needs_postproc(ctx, fmt))
>  			pix_mp->plane_fmt[0].sizeimage +=
>  				hantro_h264_mv_size(pix_mp-
>width,
>  						    pix_mp-
>height);
> -		else if (ctx->vpu_src_fmt->fourcc == 
V4L2_PIX_FMT_VP9_FRAME &&
> +		else if (ctx->vpu_src_fmt &&
> +			 ctx->vpu_src_fmt->fourcc == 
V4L2_PIX_FMT_VP9_FRAME &&
>  			 !hantro_needs_postproc(ctx, fmt))
>  			pix_mp->plane_fmt[0].sizeimage +=
>  				hantro_vp9_mv_size(pix_mp->width,
>  						   pix_mp-
>height);
> -		else if (ctx->vpu_src_fmt->fourcc == 
V4L2_PIX_FMT_HEVC_SLICE &&
> +		else if (ctx->vpu_src_fmt &&
> +			 ctx->vpu_src_fmt->fourcc == 
V4L2_PIX_FMT_HEVC_SLICE &&
>  			 !hantro_needs_postproc(ctx, fmt))
>  			pix_mp->plane_fmt[0].sizeimage +=
>  				hantro_hevc_mv_size(pix_mp-
>width,

I have verified that this patch fixes the crash I was seeing since 6.4.
https://lore.kernel.org/linux-media/12724349.O9o76ZdvQC@bagend/ is a/the other 
patch which also fixed the crash.
--nextPart5339283.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZGzMQAAKCRDXblvOeH7b
bg3/AP9bb4nQhPomMdHZPBe37sKDTz5e6cBfiIHTHYSOwuMcpAD+IudI0INZj2SA
hjbDfu5ZCXl6VQhv7vl5yeKD4nes9QE=
=k7yc
-----END PGP SIGNATURE-----

--nextPart5339283.31r3eYUQgx--



