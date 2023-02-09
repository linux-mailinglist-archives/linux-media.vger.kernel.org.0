Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C525E690F82
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 18:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjBIRre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 12:47:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjBIRrb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 12:47:31 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14962656BE
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 09:47:23 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id 5so2834462qtp.9
        for <linux-media@vger.kernel.org>; Thu, 09 Feb 2023 09:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ieJo10b/dbDs8B/cVcLkj2PcvL/VL7KYhGk1Q05EpRU=;
        b=2C3iPdiJnQdWwc9+4i/b8tI7WwquJt1vX93Zn3ZpwV4dgtOrYqlyQAm9auKB1XRM13
         Qkc9EqYdw6dhaU19Vv8G4qDdHk6V8kjTYM/RbAsDXcVhtKfwY3s9symBp+YbKYX8ABOw
         WoJF5VtDW6Af3ESMueBPXylo1w5BUynKUGd1XWoLir/93WFOXTLLMONYVJwR9Wu2PDl6
         5W6vh4uipK1P+osWQLEKvGzptTeDfo7KFOPrTU6AiEJx+fSVgWtjXlNkEiRIczTGtQao
         sjtw/GkGy8OsS8qMbs04jw8/sG6vBokuy4X4nM/bOWTYPR3P4EwdURmvHCBNYGaKAkjD
         DNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ieJo10b/dbDs8B/cVcLkj2PcvL/VL7KYhGk1Q05EpRU=;
        b=4US9elAkoTIM1OIoACw40krdRf0/4OEISiL1k5OZYCOtwurOnqFdesypmZ9THrofZm
         0pujOvou6Hhe8rzs3kDCaWvtnpBNkfaBUxVkiIKXc0LEk7BS4SuBP1z4B7Yaz4Y58Nsw
         i01CPL71sGNzC0y7bw4Bj7N/qVIqPiqBU7RK4X4g0GUtHQeQ7cizS0pid0AftXgNWuch
         HsBBsiuMDL1Wbf9UUT3LTJSPTCPURPM3oeewSoIDTXvVaBSAWXTKxaMk6D2y+dJKBj1J
         zI0as5BfkhEEMN6BwARbWDu9i7QfHi+6xywNkZ7iu9PMVolzzHJBjuNadymavs9xWvS+
         wqmg==
X-Gm-Message-State: AO0yUKUA6GdB4BSD5LtbU4b8ekKN8S6GYgKk31uTAtv8ztI2BR3N6IUU
        gNcM4NRAtpcLNW4L2rxQ9msQwA==
X-Google-Smtp-Source: AK7set9s03KtYnaY7Xn+qL14NlN/aHlDCgwvGLcH6Z6806+XzyYRI1zMpOgAsm3wzHTlJcXr33ITUQ==
X-Received: by 2002:a05:622a:54e:b0:3b8:1d89:e01b with SMTP id m14-20020a05622a054e00b003b81d89e01bmr22643415qtx.23.1675964843082;
        Thu, 09 Feb 2023 09:47:23 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id a23-20020ac84d97000000b003ba20fd91a4sm1672357qtw.11.2023.02.09.09.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 09:47:22 -0800 (PST)
Message-ID: <b3797f33ab9a832ae6b8532402bdafde548a9b63.camel@ndufresne.ca>
Subject: Re: [PATCH v2] hantro: fix VIDIOC_ENUM_FRAMESIZES for non-coded
 formats without postproc
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        benjamin.gaignard@collabora.com, kernel@pengutronix.de
Date:   Thu, 09 Feb 2023 12:47:19 -0500
In-Reply-To: <20230126230219.3399415-1-m.grzeschik@pengutronix.de>
References: <20230126230219.3399415-1-m.grzeschik@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 27 janvier 2023 =C3=A0 00:02 +0100, Michael Grzeschik a =C3=A9c=
rit=C2=A0:
> The frmsize structure was left initialize to 0, as side effect, the
> driver was reporting an invalid frmsize.
>=20
>   Size: Stepwise 0x0 - 0x0 with step 0/0
>=20
> The frmsize structure in hantro_fmt is only valid for bitstream formats.
> So just adding frmsizes for non coded formats does not work to fix this.
>=20
> When codec_mode is HANTRO_MODE_NONE, then vidioc_enum_framesizes should
> return with -ENOTTY. At least when hantro_needs_postproc returns false.
> Which is the case for encoders. But with the latest postproc scaling
> patch this is not the case anymore. This patch is fixing this back to
> how it was but changing the EINVAL to ENOTTY since we touch this anyway.
>=20
> For now this is a good enough fix, but in the future enum_framesizes
> needs to obtain different constraints in framesizes in combination of
> coded to raw formats.
>=20
> Fixes: 79c987de8b35 ("media: hantro: Use post processor scaling capacitie=
s")
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> v1 -> v2: - changed EINVAL to ENOTTY as suggested by Nicolas
>           - updated the commit message to add more infos to the issue
>=20
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index 2c7a805289e7b8..30e650edaea8a3 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -161,8 +161,11 @@ static int vidioc_enum_framesizes(struct file *file,=
 void *priv,
>  	}
> =20
>  	/* For non-coded formats check if postprocessing scaling is possible */
> -	if (fmt->codec_mode =3D=3D HANTRO_MODE_NONE && hantro_needs_postproc(ct=
x, fmt)) {
> -		return hanto_postproc_enum_framesizes(ctx, fsize);
> +	if (fmt->codec_mode =3D=3D HANTRO_MODE_NONE) {
> +		if (hantro_needs_postproc(ctx, fmt))
> +			return hanto_postproc_enum_framesizes(ctx, fsize);
> +		else
> +			return -ENOTTY;
>  	} else if (fsize->index !=3D 0) {
>  		vpu_debug(0, "invalid frame size index (expected 0, got %d)\n",
>  			  fsize->index);

