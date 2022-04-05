Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD734F4B2E
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1573959AbiDEWxw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 18:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446437AbiDEPog (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 11:44:36 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC1D4704A
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 07:16:01 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id i4so11195329qti.7
        for <linux-media@vger.kernel.org>; Tue, 05 Apr 2022 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=6zOglZ1v4meLFLOugAyrLlKmu5ZmNvVae5P9sIuOHQo=;
        b=bw/tgqYs2mkLU+8pHeikcqlHp5iFkRL3DI9DCR3Byib2gpGBvALOuysZgJdRXyMgyd
         /jlyvKz07o0j/UQcWU0FX/9qgH8HmPVOuD91JWjw4tP73jnU+n+QDKnJHMJjoaEM2hk1
         pE1G83E+nTSFSRSH9ucIq+3XEMDbWUdeSkZCvb8Uy88Di7hTR7gSLuDkAJvdjJauJuIr
         Bd5UIVfyCjkhyWSfv5TRCFfMRbnrnrE8F7gyY6iKDUpfLDc+7TUWTC4hWuQ2ej0cX2A3
         oH4Af/YIfozi74RAM1/dtNdodtREHCbJb3L4XOrGhbCMxZhbGSzJ0g9ek4Etd9TKr8i7
         D88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=6zOglZ1v4meLFLOugAyrLlKmu5ZmNvVae5P9sIuOHQo=;
        b=YBuU+qy62koJr73mrd/PRDCOpofznzH70RtdObiZoY6nVmKYJN82f4UaJ0zsKCVPNQ
         YCg57FxvpXCDCtS8fDBE5nr2WtZ1o9nmMk54gt/3ns/k65eMvXE1sQOKMPuugQHxhchL
         bpvg8daKlU9rUp7mE2XAXitLu+4GOPehK4gFeunyzZKKfOEM3qFPUkv6VTJU55QpWXYc
         OKXCh08i8765qMPoPTu4dgTpRS0k4PRtin15Cd11ldqbtOqtychqJ9ffC26A0viuwPcX
         1lOjp3+nsO6u5tCj9p6C1V6xRASgFoTQGlYgYjy86N2Rm2liaQE+1YhTKaeRQiQj8Q9L
         ukAw==
X-Gm-Message-State: AOAM533OcoJj2IZ7fR8jbeXLe8/FQgP/flSPV6M9SR5NX1T7unMB0rBr
        ORiutJJSCCqM/b46BXTII5NnJg==
X-Google-Smtp-Source: ABdhPJzk2UUV9x9ynaSwcDBFvONsS52bT8JfDo4LBR1DeJvAIKctJEfe84azevxk8+lIYLC6ZQol2Q==
X-Received: by 2002:a37:e116:0:b0:67b:34bc:9175 with SMTP id c22-20020a37e116000000b0067b34bc9175mr2326255qkm.543.1649168160352;
        Tue, 05 Apr 2022 07:16:00 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id a23-20020a05620a16d700b0067e98304705sm7657259qkn.89.2022.04.05.07.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 07:16:00 -0700 (PDT)
Message-ID: <4cb70616712bbb6a2c3360af36ad9597415905e1.camel@ndufresne.ca>
Subject: Re: [PATCH 5/7] media: coda: fix default JPEG colorimetry
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Tue, 05 Apr 2022 10:15:59 -0400
In-Reply-To: <20220404163533.707508-5-p.zabel@pengutronix.de>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <20220404163533.707508-5-p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 04 avril 2022 =C3=A0 18:35 +0200, Philipp Zabel a =C3=A9crit=C2=A0=
:
> Set default colorspace to SRGB for JPEG encoder and decoder devices,
> to fix the following v4l2-compliance test failure:
>=20
> 	test VIDIOC_TRY_FMT: OK
> 		fail: v4l2-test-formats.cpp(818): fmt_raw.g_colorspace() !=3D V4L2_COLO=
RSPACE_SRGB
>=20
> Also explicitly set transfer function, YCbCr encoding and quantization
> range, as required by v4l2-compliance for the JPEG encoded side.

Note that this will perhaps hit some GStreamer bugs that are being discusse=
d.
Documenting for the users:

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/1118
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1406

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../media/platform/chips-media/coda-common.c  | 36 +++++++++++++------
>  1 file changed, 25 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/m=
edia/platform/chips-media/coda-common.c
> index 4a7346ed771e..c068c16d1eb4 100644
> --- a/drivers/media/platform/chips-media/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda-common.c
> @@ -732,13 +732,22 @@ static int coda_try_fmt_vid_cap(struct file *file, =
void *priv,
>  	return 0;
>  }
> =20
> -static void coda_set_default_colorspace(struct v4l2_pix_format *fmt)
> +static void coda_set_default_colorspace(struct coda_ctx *ctx,
> +					struct v4l2_pix_format *fmt)
>  {
>  	enum v4l2_colorspace colorspace;
> =20
> -	if (fmt->pixelformat =3D=3D V4L2_PIX_FMT_JPEG)
> -		colorspace =3D V4L2_COLORSPACE_JPEG;
> -	else if (fmt->width <=3D 720 && fmt->height <=3D 576)
> +	if (ctx->cvd->src_formats[0] =3D=3D V4L2_PIX_FMT_JPEG ||
> +	    ctx->cvd->dst_formats[0] =3D=3D V4L2_PIX_FMT_JPEG ||
> +	    fmt->pixelformat =3D=3D V4L2_PIX_FMT_JPEG) {
> +		fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> +		fmt->xfer_func =3D V4L2_XFER_FUNC_SRGB;
> +		fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> +		fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +		return;
> +	}
> +
> +	if (fmt->width <=3D 720 && fmt->height <=3D 576)
>  		colorspace =3D V4L2_COLORSPACE_SMPTE170M;
>  	else
>  		colorspace =3D V4L2_COLORSPACE_REC709;
> @@ -763,7 +772,7 @@ static int coda_try_fmt_vid_out(struct file *file, vo=
id *priv,
>  		return ret;
> =20
>  	if (f->fmt.pix.colorspace =3D=3D V4L2_COLORSPACE_DEFAULT)
> -		coda_set_default_colorspace(&f->fmt.pix);
> +		coda_set_default_colorspace(ctx, &f->fmt.pix);
> =20
>  	q_data_dst =3D get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>  	codec =3D coda_find_codec(dev, f->fmt.pix.pixelformat, q_data_dst->four=
cc);
> @@ -1640,13 +1649,18 @@ static void set_default_params(struct coda_ctx *c=
tx)
>  	csize =3D coda_estimate_sizeimage(ctx, usize, max_w, max_h);
> =20
>  	ctx->params.codec_mode =3D ctx->codec->mode;
> -	if (ctx->cvd->src_formats[0] =3D=3D V4L2_PIX_FMT_JPEG)
> -		ctx->colorspace =3D V4L2_COLORSPACE_JPEG;
> -	else
> +	if (ctx->cvd->src_formats[0] =3D=3D V4L2_PIX_FMT_JPEG ||
> +	    ctx->cvd->dst_formats[0] =3D=3D V4L2_PIX_FMT_JPEG) {
> +		ctx->colorspace =3D V4L2_COLORSPACE_SRGB;
> +		ctx->xfer_func =3D V4L2_XFER_FUNC_SRGB;
> +		ctx->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> +		ctx->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +	} else {
>  		ctx->colorspace =3D V4L2_COLORSPACE_REC709;
> -	ctx->xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> -	ctx->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> -	ctx->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +		ctx->xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> +		ctx->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> +		ctx->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +	}
>  	ctx->params.framerate =3D 30;
> =20
>  	/* Default formats for output and input queues */

