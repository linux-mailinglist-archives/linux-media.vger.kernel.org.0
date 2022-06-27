Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 185D555C890
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236337AbiF0Tif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 15:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238494AbiF0Tie (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 15:38:34 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DDF2AC6
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 12:38:32 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id cs6so16415718qvb.6
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=J07ChIZX1doF0YuYfX9CRokCpU5tUAce5rZ9DPbQDnU=;
        b=vHslDbFiGHfnCNUIBmvsHbfCFTRoSLjHPzoystcMwpfMCJEngMW/r2jrlH7/jt2VNh
         L7uwVgC9l/wT7j0maFzCIIEQ3PukRzoR5uRsAMl3+MJxbEX7BQZ0o63o+iWtFJPFE3Pq
         ovVog7F4c4DiFrkmq9tfRXO8n3/tmX0qmAFX/Y500LSM1xxQkvDNDI1nSVr+iBnTLh1q
         vH5j8zQpWhz3K0U88X5ushwdrzSFgBvwb+zgse+YjjtDys/MK867E+PVYzLKfRdG1Se3
         purwPeTCPnbWaGIAXJwWavZwlwOQbmROp9QSEh03uQ1jHQtFpmFZseAKTXCU0pyxdZKj
         wF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=J07ChIZX1doF0YuYfX9CRokCpU5tUAce5rZ9DPbQDnU=;
        b=j27c5AtEahkqsjyory1UbRbLYanzZJPdGAXkeCp7++P+eongiPc95OSNoTRvhqLtio
         cSp7R+Mn3eDKsa1k7YPIbAK3v3c5RUL2n4NK77CFC8FDWD+RkIgH4CnD9IT2S1zESbv5
         qKO99Ebly28FHfovxU8Eg0OhJp7bS8swRNzXYYLGwV12G4+J5bUQin/4K45rVmaNe6XW
         F9QNilce3NLCH278J1EPe9TAJYNW4TD/UbQJ6YhPEI/P+oJoHWTt/SWc6CvtXwrDPjW3
         kON2h2nJqnY1TexhgXcHTjW0Nn2I7ncmJDW7GIMXNHRMRrQECTtcxw/ALy9M/3lEdSO4
         XpFg==
X-Gm-Message-State: AJIora+y82MLe1JtT6ReiLfRAy4WjuHShH1YmfOYkhcZ8V6lITC3XG6i
        21ZdU1o3ML+pg6/cPwYisWZF1hyenxXnnw==
X-Google-Smtp-Source: AGRyM1v1h/uwD0crQAfxEQp9KLeDE5WNoDB4Y1ASMX7M23IaUNFtZBPYlAbImJ3UeyfUVMm1ViZQmQ==
X-Received: by 2002:a05:6214:d84:b0:470:9f26:f8fa with SMTP id e4-20020a0562140d8400b004709f26f8famr996234qve.34.1656358711668;
        Mon, 27 Jun 2022 12:38:31 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id x8-20020a05620a258800b006a75a0ffc97sm9566802qko.3.2022.06.27.12.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:38:31 -0700 (PDT)
Message-ID: <66839e0c4b19eb4faba5fbed5cd0a4ec0c8415f8.camel@ndufresne.ca>
Subject: Re: [PATCH] hantro_v4l2: ignore enum_framesizes for non-coded
 formats without postproc
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, kernel@pengutronix.de
Date:   Mon, 27 Jun 2022 15:38:29 -0400
In-Reply-To: <20220620223150.3885812-1-m.grzeschik@pengutronix.de>
References: <20220620223150.3885812-1-m.grzeschik@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 21 juin 2022 =C3=A0 00:31 +0200, Michael Grzeschik a =C3=A9crit=C2=
=A0:
> When codec_mode is HANTRO_MODE_NONE, then vidioc_enum_framesizes should
> return with -EINVAL. At least when hantro_needs_postproc returns false.
> Which is the case for encoders. But with the latest postproc scaling
> patch this is not the case anymore. This patch is fixing this.
>=20
> Fixes: 79c987de8b35 ("media: hantro: Use post processor scaling capacitie=
s")
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/staging/media/hantro/hantro_v4l2.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging=
/media/hantro/hantro_v4l2.c
> index 22ad182ee972ca..0eb0873d383678 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -124,8 +124,11 @@ static int vidioc_enum_framesizes(struct file *file,=
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
> +			return -EINVAL;

Was already broken before (because no one uses that yet), but this EINVAL i=
s not
strictly correct. If there is no postproc, enum should return a single fram=
e
size or ENOTTY. Returning EINVAL means the driver supports not output forma=
t,
which is a lie. I personally think its saner to have a single framesize bei=
ng
returned, one that matches what G_FMT returns already.

>  	} else if (fsize->index !=3D 0) {
>  		vpu_debug(0, "invalid frame size index (expected 0, got %d)\n",
>  			  fsize->index);

