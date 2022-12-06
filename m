Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC46644C59
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 20:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiLFTSY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 14:18:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiLFTSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 14:18:22 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BF73722D
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 11:18:20 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id j13so6771730qka.3
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 11:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p7OTI92HE3dIRLmGiEP5wVF6IPA48SqfwAtDwY11Wgk=;
        b=ShYERSnGwqK/Ft5xBnts+NxM0hnI/UYKhnm1TsT6tgsvvs1JWBrUE69yslSEEP/wlj
         if7n7kzrI24GO2j0pOF9tWDJywf0xhOl3T8oqle4CiaBfyhxtT5sSe+wpS3dFHyA3i62
         pwOhNilc/hRnQmm442EuYRjELxdfH/d7M6ws/mEYpP79O5V/K6T0MDJ2dvAwU+sfh924
         gHCxy0kInWY8xCTomvd8ATSKnZisqX8z5WCFLdS7+tuVaMtxg6euV4bEXitRdKZ1DRAW
         cAjLC7h+B5pG2IGWY3zr3lvLE6wnfbXVR7Q4YR8sk2iOfRnHQS1GCNkO9AXlxyXigiRJ
         uCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p7OTI92HE3dIRLmGiEP5wVF6IPA48SqfwAtDwY11Wgk=;
        b=w4DX8vXH+KMN1OY7rrUSyYCPTcMQKxZUK9DOtHal61LbqSNjZPFgPZWsl5OYEalbeF
         EMmWW043StB/FaTCIQu4hzUyuJuQ8x8N/Fk6sn5ZZCbp4hnoroOsm4bd8wilUOG0zi7y
         FxOVzxvoW/xcFLHi1imVTrO2mn34ua92OTVpTIuBiuUQhxlOZdzCttqGg16FyXeSbZas
         5U1heQt1ar9rXjjX6cIKWA09q496jfzvooPYoOhP4+nKcr8SmTRJeu9R93i7hyXtJfKc
         4gA2nU8v5JpfG1PGAeYYsLIbsAjudJSWzmYgo/7hjdFmyp0XPD0wdUv1ayYLd5prrupC
         WQ5A==
X-Gm-Message-State: ANoB5pkzx5PvqHTGaAAwOpJaMAZY6yJZlR2qmRYkpBb9mmiLBb5dLaXP
        qyGtjMQskefdSaCu2rS4SF7WQA==
X-Google-Smtp-Source: AA0mqf6b2bZ2lHgpIImzI3iDccC1JIlx3UQnq6m0rnLsKiZ6UK/8fUEzhWjXnS3xTat+egxGYNcg4g==
X-Received: by 2002:a37:5885:0:b0:6fa:1ef8:49dc with SMTP id m127-20020a375885000000b006fa1ef849dcmr77214507qkb.314.1670354299931;
        Tue, 06 Dec 2022 11:18:19 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id bp32-20020a05620a45a000b006fa2cc1b0fbsm15417234qkb.11.2022.12.06.11.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 11:18:15 -0800 (PST)
Message-ID: <d8cdc4c62f83161ee3239b92495fd9623fddfff1.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: remove redundant check of colorspace in
 venc_s_fmt
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        xiahong.bao@nxp.com, ming.zhou@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Date:   Tue, 06 Dec 2022 14:18:13 -0500
In-Reply-To: <20221129102217.30710-1-ming.qian@nxp.com>
References: <20221129102217.30710-1-ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 29 novembre 2022 =C3=A0 18:22 +0800, Ming Qian a =C3=A9crit=C2=A0:
> record the colorspace set by user.
> if it's not supported by h264 vui, then zero will be written to vui,
> but don't modify the user setting.
>=20
> Fixes: 0401e659c1f9 ("media: amphion: add v4l2 m2m vpu encoder stateful d=
river")
> Signed-off-by: Ming Qian <ming.qian@nxp.com>

This seems like the right approach to me. The only down side, is that users=
pace
will not be aware that the encoder could not store the colorimetry into the
bitstream. What I totally agree, is that this should not prevent encoding t=
he
stream, but the stream should also not lie about it (which this change fixe=
s).

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/amphion/venc.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platfo=
rm/amphion/venc.c
> index 3cbe8ce637e5..e6e8fe45fc7c 100644
> --- a/drivers/media/platform/amphion/venc.c
> +++ b/drivers/media/platform/amphion/venc.c
> @@ -250,19 +250,10 @@ static int venc_s_fmt(struct file *file, void *fh, =
struct v4l2_format *f)
>  	}
> =20
>  	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> -		if (!vpu_color_check_primaries(pix_mp->colorspace)) {
> -			venc->params.color.primaries =3D pix_mp->colorspace;
> -			vpu_color_get_default(venc->params.color.primaries,
> -					      &venc->params.color.transfer,
> -					      &venc->params.color.matrix,
> -					      &venc->params.color.full_range);
> -		}
> -		if (!vpu_color_check_transfers(pix_mp->xfer_func))
> -			venc->params.color.transfer =3D pix_mp->xfer_func;
> -		if (!vpu_color_check_matrix(pix_mp->ycbcr_enc))
> -			venc->params.color.matrix =3D pix_mp->ycbcr_enc;
> -		if (!vpu_color_check_full_range(pix_mp->quantization))
> -			venc->params.color.full_range =3D pix_mp->quantization;
> +		venc->params.color.primaries =3D pix_mp->colorspace;
> +		venc->params.color.transfer =3D pix_mp->xfer_func;
> +		venc->params.color.matrix =3D pix_mp->ycbcr_enc;
> +		venc->params.color.full_range =3D pix_mp->quantization;
>  	}
> =20
>  	pix_mp->colorspace =3D venc->params.color.primaries;
> @@ -1281,7 +1272,6 @@ static void venc_init(struct file *file)
>  	f.fmt.pix_mp.width =3D 1280;
>  	f.fmt.pix_mp.height =3D 720;
>  	f.fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> -	f.fmt.pix_mp.colorspace =3D V4L2_COLORSPACE_REC709;
>  	venc_s_fmt(file, &inst->fh, &f);
> =20
>  	memset(&f, 0, sizeof(f));

