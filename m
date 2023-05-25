Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB013710E76
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 16:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbjEYOij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 10:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbjEYOii (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 10:38:38 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3942139
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 07:38:37 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-75afeacb5e4so117289185a.3
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1685025517; x=1687617517;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0f9zosjqMlsKxrwPxbLObDGRgCG2pdSvt+egeV9ZTpI=;
        b=zEYcmpTPQQMbgKC0O74lib28sf6Gp5zZZDMnZA8Atgecy6o+YBV9WrThB6qJ/MQRmo
         b9L2481fIU5KiSbGXItrTGKzfC1nNQ/sOK/l2L66rU8mi1l0kITP4xcHpxlDW5Tcwk7w
         E0IyYAZjKGLrIbzkWr4WtIl4VEuoNl9afNV1s3t2XNg6xoIty4AAr69kNBCThJ6NpGcK
         JlyEO5Drgl6aISoM/Hn1mMv1j+QtvIZF2FFc4tYdE4TX7orn6vW5pd1rgwgWAFFgCqB/
         jAbhKHzsZfQqTcm7UShXAq34s/MP4bi991IGwM1hP3b4vnXg6y9GCSVGTmkKUI1lT+av
         dEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685025517; x=1687617517;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0f9zosjqMlsKxrwPxbLObDGRgCG2pdSvt+egeV9ZTpI=;
        b=Zeh2gtCm7/PJiIk2IXbDSt2hefYZuaHQgcGNhi7Dk3Av3QDHf8np0I39VgWOVfMkfY
         YWbWdHtz8SBNyA6QmDqcQommz6ZmMkJSwfiSUCHUEoTyfDpZ1+gMzouGHmelHcNljvld
         1CgZxcjnJliFZo/hpfjvMqzBt2M5PPoJveT5p436z5hokt0O5fy2RdOislKKzPhLwkdV
         1Xdoa7O29V45uZrVuWIIIPzMjpnc7JQm7C+/QIidz72plN5xy9wFCgu4jI1lOcsvx1Ac
         lLO+8jd5H+4cOvljYtcjAhI/HYBhwy2nhVLxBxPalcTYEWOG3YyIL6vM6z/KDLTKrxA6
         EQ6g==
X-Gm-Message-State: AC+VfDzMGdPF7ZgPgqMfUHbkYSSvhCxw7Xs0s1IKoqnulpzorE33C45N
        Q8eY7+UAWbvIZ2BkXXxtZydYIIJbJvPTlOJcBVo=
X-Google-Smtp-Source: ACHHUZ5uKkem4rzpORqlmAvVksTmQLXSZqaJg4eis1lSTWquItQD7Q7SiUkmQinD3BkzoNsMVAGL2g==
X-Received: by 2002:a05:622a:4d:b0:3f4:427:dbb8 with SMTP id y13-20020a05622a004d00b003f40427dbb8mr32435955qtw.2.1685025516934;
        Thu, 25 May 2023 07:38:36 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:6c0::7a9])
        by smtp.gmail.com with ESMTPSA id a3-20020ac87203000000b003f6be5256d5sm447863qtp.19.2023.05.25.07.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 07:38:36 -0700 (PDT)
Message-ID: <118d51d7734d6673ed1d90b09533fab50ece4b78.camel@ndufresne.ca>
Subject: Re: [PATCH] media: verisilicon: Fix null pointer dereference in
 try_fmt
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        benjamin.gaignard@collabora.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel@pengutronix.de
Date:   Thu, 25 May 2023 10:38:35 -0400
In-Reply-To: <20230516091209.3098262-1-m.tretter@pengutronix.de>
References: <20230516091209.3098262-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 16 mai 2023 =C3=A0 11:12 +0200, Michael Tretter a =C3=A9crit=C2=A0=
:
> Since commit db6f68b51e5c ("media: verisilicon: Do not set context
> src/dst formats in reset functions"), vpu_src_fmt is not set in the
> reset function, but only set in hantro_set_fmt_out, which calls
> hantro_try_fmt before setting the format. Therefore, hantro_try_fmt
> might be called with vpu_src_fmt still being null.
>=20
> Add a test if the format is actually set before checking the format.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Fixes: db6f68b51e5c ("media: verisilicon: Do not set context src/dst form=
ats in reset functions")

This patch highlights yet more issues in the driver default format handling=
, but
the remaining bug is extremely minor (too small sizeimage before S_FMT is
called, rather then kernel oops.). Considering how long this has been going=
,
please consider merging this.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index 835518534e3b..ec37d2646fde 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -313,17 +313,20 @@ static int hantro_try_fmt(const struct hantro_ctx *=
ctx,
>  		/* Fill remaining fields */
>  		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
>  				    pix_mp->height);
> -		if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_H264_SLICE &&
> +		if (ctx->vpu_src_fmt &&
> +		    ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_H264_SLICE &&
>  		    !hantro_needs_postproc(ctx, fmt))
>  			pix_mp->plane_fmt[0].sizeimage +=3D
>  				hantro_h264_mv_size(pix_mp->width,
>  						    pix_mp->height);
> -		else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_VP9_FRAME &&
> +		else if (ctx->vpu_src_fmt &&
> +			 ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_VP9_FRAME &&
>  			 !hantro_needs_postproc(ctx, fmt))
>  			pix_mp->plane_fmt[0].sizeimage +=3D
>  				hantro_vp9_mv_size(pix_mp->width,
>  						   pix_mp->height);
> -		else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_HEVC_SLICE &&
> +		else if (ctx->vpu_src_fmt &&
> +			 ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_HEVC_SLICE &&
>  			 !hantro_needs_postproc(ctx, fmt))
>  			pix_mp->plane_fmt[0].sizeimage +=3D
>  				hantro_hevc_mv_size(pix_mp->width,

