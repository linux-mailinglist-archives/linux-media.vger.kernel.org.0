Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61AF04F4AA2
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345289AbiDEWuG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 18:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444954AbiDEPmR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 11:42:17 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8E218F200
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 07:07:10 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id z19so11167610qtw.2
        for <linux-media@vger.kernel.org>; Tue, 05 Apr 2022 07:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=oRDYeKU+64jhj0gYuFs9GBbEHACDr9Xl+2tp4JX786c=;
        b=W9rP/aLkunDOzzKaSRjXrC8OzKmlaIWuxplqvIHmONUUXgy8lHDvoO9hFTjH+cJfpA
         xfcmumC/3i8VcBsu4mziMA4CiME0S39MdNmPX4+Ie8GnZaZj/HlYQMDMdYK7CjN6i/cZ
         vNnJwClvRnjMSRL9RKILpoatYPVTHJKAvV2eIZf2Aw5E2mP1lY98SeSXqqtCE4ACqNG7
         pfFDR2yt+PMeZtglifwRvITX0Jx9nMtFTRKbZaIkLsIWrIQovtof/6BlVVYnZBBxRTdX
         +YKSYbY5alAP7Hu1F2ONJTOHxXAtkWf7U3Cqih6swS7Bdvf0zwkDnnxJ3uzGC4I72ljI
         i3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=oRDYeKU+64jhj0gYuFs9GBbEHACDr9Xl+2tp4JX786c=;
        b=C2FCc6cVHUG1DQOYqwXLT02bzPyOlyj673yzu/EmGc52ZMS5VXyvR5XYG4dH5weyS1
         92ZfHgSZzc/LNCBrwFfP/k25RL5BL/P5aLSbhE1JGQTL15FjvKBOE7d1qcnDn/cAj2j0
         R+hHeep32ETjMT1fxNaP7y7vCgLzG9fRcg3s+jcJNz5sG7WODEpySVVzugkB+hydA1+x
         3PJAt/Okqw6NUoAUDYYb5tcSQ26oiR3Jkz+ZUkUDgMjToZt9XXnHFJeccEBrIJKgJYht
         xuVG8q052vAhPTHTPcLdouNphzv9BrkDJNH79JTmBCiJ+FRFjZPJUfEkHrtavoo1nqdq
         cI2w==
X-Gm-Message-State: AOAM533EiNqRk58z787rF11vfLSCN0TPwqcuQNhvV8QHRXNnh5OaewaM
        FCLF173VAxMvO6ieJuNR7m6v1Q==
X-Google-Smtp-Source: ABdhPJyWN6nae6e9QyMmZG/cRXESXjuHE/W0ll5ploazXKv/E2zNJbIp9htXpgmPFkrN1txZildBnw==
X-Received: by 2002:a05:620a:4512:b0:67d:19c0:badb with SMTP id t18-20020a05620a451200b0067d19c0badbmr2357615qkp.34.1649167629571;
        Tue, 05 Apr 2022 07:07:09 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id w10-20020a05620a424a00b00680c0c0312dsm8202298qko.30.2022.04.05.07.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 07:07:09 -0700 (PDT)
Message-ID: <4f17ea686b1919c15d5c4a2c63d22f180a0813fb.camel@ndufresne.ca>
Subject: Re: [PATCH 2/7] media: coda: disable encoder cmd ioctl on decoder
 and vice versa
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Tue, 05 Apr 2022 10:07:08 -0400
In-Reply-To: <20220404163533.707508-2-p.zabel@pengutronix.de>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <20220404163533.707508-2-p.zabel@pengutronix.de>
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
> Use v4l2_disable_ioctl() to disable the VIDIOC_TRY_ENCODER_CMD and
> VIDIOC_ENCODER_CMD ioctls on decoder video devices and the
> VIDIOC_TRY_DECODER_CMD and VIDIOC_DECODER_CMD ioctls on encoder
> video devices.
>=20
> This allows to drop the coda_try_encoder/decoder_cmd() functions
> and to use v4l2_m2m_ioctl_try_encoder/decoder_cmd() directly.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Nice cleanup.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/chips-media/coda-common.c  | 38 ++++++-------------
>  1 file changed, 12 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/m=
edia/platform/chips-media/coda-common.c
> index 6d2989504b33..dc75133b0ead 100644
> --- a/drivers/media/platform/chips-media/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda-common.c
> @@ -1091,17 +1091,6 @@ static int coda_s_selection(struct file *file, voi=
d *fh,
>  	}
>  }
> =20
> -static int coda_try_encoder_cmd(struct file *file, void *fh,
> -				struct v4l2_encoder_cmd *ec)
> -{
> -	struct coda_ctx *ctx =3D fh_to_ctx(fh);
> -
> -	if (ctx->inst_type !=3D CODA_INST_ENCODER)
> -		return -ENOTTY;
> -
> -	return v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
> -}
> -
>  static void coda_wake_up_capture_queue(struct coda_ctx *ctx)
>  {
>  	struct vb2_queue *dst_vq;
> @@ -1120,7 +1109,7 @@ static int coda_encoder_cmd(struct file *file, void=
 *fh,
>  	struct vb2_v4l2_buffer *buf;
>  	int ret;
> =20
> -	ret =3D coda_try_encoder_cmd(file, fh, ec);
> +	ret =3D v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -1149,17 +1138,6 @@ static int coda_encoder_cmd(struct file *file, voi=
d *fh,
>  	return 0;
>  }
> =20
> -static int coda_try_decoder_cmd(struct file *file, void *fh,
> -				struct v4l2_decoder_cmd *dc)
> -{
> -	struct coda_ctx *ctx =3D fh_to_ctx(fh);
> -
> -	if (ctx->inst_type !=3D CODA_INST_DECODER)
> -		return -ENOTTY;
> -
> -	return v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
> -}
> -
>  static bool coda_mark_last_meta(struct coda_ctx *ctx)
>  {
>  	struct coda_buffer_meta *meta;
> @@ -1216,7 +1194,7 @@ static int coda_decoder_cmd(struct file *file, void=
 *fh,
>  	bool wakeup;
>  	int ret;
> =20
> -	ret =3D coda_try_decoder_cmd(file, fh, dc);
> +	ret =3D v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -1498,9 +1476,9 @@ static const struct v4l2_ioctl_ops coda_ioctl_ops =
=3D {
>  	.vidioc_g_selection	=3D coda_g_selection,
>  	.vidioc_s_selection	=3D coda_s_selection,
> =20
> -	.vidioc_try_encoder_cmd	=3D coda_try_encoder_cmd,
> +	.vidioc_try_encoder_cmd	=3D v4l2_m2m_ioctl_try_encoder_cmd,
>  	.vidioc_encoder_cmd	=3D coda_encoder_cmd,
> -	.vidioc_try_decoder_cmd	=3D coda_try_decoder_cmd,
> +	.vidioc_try_decoder_cmd	=3D v4l2_m2m_ioctl_try_decoder_cmd,
>  	.vidioc_decoder_cmd	=3D coda_decoder_cmd,
> =20
>  	.vidioc_g_parm		=3D coda_g_parm,
> @@ -2904,6 +2882,14 @@ static int coda_register_device(struct coda_dev *d=
ev, int i)
>  	v4l2_disable_ioctl(vfd, VIDIOC_G_CROP);
>  	v4l2_disable_ioctl(vfd, VIDIOC_S_CROP);
> =20
> +	if (dev->devtype->vdevs[i]->type =3D=3D CODA_INST_ENCODER) {
> +		v4l2_disable_ioctl(vfd, VIDIOC_DECODER_CMD);
> +		v4l2_disable_ioctl(vfd, VIDIOC_TRY_DECODER_CMD);
> +	} else {
> +		v4l2_disable_ioctl(vfd, VIDIOC_ENCODER_CMD);
> +		v4l2_disable_ioctl(vfd, VIDIOC_TRY_ENCODER_CMD);
> +	}
> +
>  	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, 0);
>  	if (!ret)
>  		v4l2_info(&dev->v4l2_dev, "%s registered as %s\n",

