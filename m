Return-Path: <linux-media+bounces-35887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3260AAE8922
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 18:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94CA53A9679
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 16:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AAE2BF00A;
	Wed, 25 Jun 2025 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsR3DsiW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6B51CEAD6;
	Wed, 25 Jun 2025 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867484; cv=none; b=In92Kp7249E7LST1lHoiVLIQ2Bda820yqDz97LQVYJ6OSO2xxbUKs0oZ95NF6Xx6upmjDT5dC5wEZ5AiI0HvcrjGXok5yQdg7uOJrxpLoSfLymfNWwKz9wgTtJpYkmvC/j53Jh4/A76vxkfw1Hy5gI92WIwnVVS8Uv3YTwgyAGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867484; c=relaxed/simple;
	bh=otHmhz9qKbneCAY/qZt+a5oqKkpxMdFANunIpnL3QQM=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=tjbgi5NmjVGcFfST61KTiMXECSzrgTBNS94s0FA3Y1IZaugv3JMqvTa+MW0TcuxokMNiBbZcKGukKh/sJO6ha7ab694QEQjC7LA8tdermtjSdjc6Y37o+eAIrPdm6bTaMxKCBoeWY3Xa49z75/4y5giIEI1qw/D+UMSS+TgMUYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsR3DsiW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso1257493f8f.2;
        Wed, 25 Jun 2025 09:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750867480; x=1751472280; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWKkFAFg9O1FS34EdKG7yTUZEGesEzF1QQfwKchWpik=;
        b=EsR3DsiW9naBMEhfFJFIRcbn65r7nmtu2c3WXhVzW70Ro6sfrrZEwze+IrTgmRTISc
         goXigzea1Xnm8lfHhEgxnrEJGUd+7YA2reRBV9bysHmFbVQPRSiZsoU9a2PfOP3nF8J8
         te3KAlxd2Omnz7fg1a0TES2BPv25M1QNknnoCukhHjzbRP4JhANY/pRGuCSIMCWombSu
         mA5pJ4ZjxXiIBRwEk+AU7TikGqmAwPHxkCHycF7gWMjMfheCsywcho3NTdYpWm4pxHuN
         JGvQ9L5ASlzMiWlxwblC+3bLsdGPpN5N09Kc/KpS/+/pVzgnew78oB6uaD1cOBkyyuw6
         CBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867480; x=1751472280;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWKkFAFg9O1FS34EdKG7yTUZEGesEzF1QQfwKchWpik=;
        b=CJB2n9qcz6KCg3yNUGOeY0M1sREOfo47Y4P+GX2eobSqaYz/WG7Bl6+82udIAJopxf
         lU3Dawl9929xueVtyhx3XpUDliRum3QLp6HkifhdamqllxRqeuDif6n1m7Ycn0dysb0e
         6oJlz1mQltlIt2qTSm3eSX7fWMeC18V6DcGJwEsO7x4uZ0dqmuk3kNBEgy4q/iEU9oMT
         4OGfR/5syslh7U5dB6K8ZEBTwRqM6B75pOXjNJ1KEzr93zt2H8RVi3Gw6rBHpyiTddK7
         da1gR4pkCf4GeCUQ6MjRUHTjhg7JMSaw0rxyRdCEEhUg7AFZpachjBLDSos9X8Wf1LAm
         pOoA==
X-Forwarded-Encrypted: i=1; AJvYcCUni5mJwYcRxS29anFPWr+jhwnwqDV9Dvkj9umQGXhCGou12Dmpkwfwa08wIaC4sVsS4tTw3jsP9mrEq/U=@vger.kernel.org, AJvYcCW18uxb84uDUyecFAny8rQjkraKcDzh9J7ryHRGwKyTUnP4YHl+OPJ2cusYgp6i3PJtMNlMwIFMPJ1WF0oc@vger.kernel.org, AJvYcCWcZ8T0SZK1RChyBCOmtEsXHr/bJOPDTAfalN2QV2hrvsE3NhdJy/p6pyy1OKTgf9KM0WREwBXVURugbtxpbgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/lTKr13iQfr1VJyGyeh1Z2giZ+oz5K0k0br+E2jSsjMiZFjjJ
	rrC8R2wX2iqYLwixWs4gDQzI5Ut/Uvqft4PhqbPRrmZ6Cet6WRPiLgvHQ7UT/OS0
X-Gm-Gg: ASbGncvmLV4UsVdX1VH9Nje8a2AgTg+X3CYOOkoUeQM36yVfJdLkn3yKbOlZJWDawjX
	O1MXCiM32x7+r2UCY/GhR9y8mbuIIi0l/SK0OobSdJrY//ldK/0MQ2Z+ChCRPOZcSywN7YWZ2NK
	dUxBmOaq13mqQfLf3DxnAaVBhPw2x9CL2l6gij3J4kgR/g4f2nZtNYfnuwmT31kE3i/5aCLMFBx
	qaxyoyKGKQIfNWfM1MUKDetyULqA41WHbqrXAz1nM5coXCo17ROij+a/GpsPJWVvacLz3XekMXk
	o2UR5gijOYf4e29/Vo1pXXy5PmcwxysriBgORPuHS7N/B2+ZC2/GrPnJ1NtBvr2iaFMLk33V+ND
	dSg8Sa2LfiPxp3S5NQu6r0Ip/
X-Google-Smtp-Source: AGHT+IGwdBKEOpjpvucseGnRqSYsFTVnLPoA4uCi0Dyrn7S/hacATqeX4eEhHO0U4z09yQRUY40vHQ==
X-Received: by 2002:a05:6000:230d:b0:3a4:dcb0:a5f with SMTP id ffacd0b85a97d-3a6f2e8e330mr249814f8f.16.1750867479407;
        Wed, 25 Jun 2025 09:04:39 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6e8109e1asm4934842f8f.84.2025.06.25.09.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:04:38 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 17:04:37 +0100
Message-Id: <DAVQPZC0K30N.308T7KKXHN7N1@linaro.com>
Cc: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Martin
 Kepplinger" <martink@posteo.de>, "Purism Kernel Team" <kernel@puri.sm>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Hans Verkuil" <hverkuil@xs4all.nl>,
 <linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
To: "Dan Carpenter" <dan.carpenter@linaro.org>, "Frank Li"
 <Frank.Li@nxp.com>, "Rui Miguel Silva" <rmfrfs@gmail.com>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
In-Reply-To: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>

Hey Dan,
Thanks for the patch.

On Wed Jun 25, 2025 at 4:22 PM WEST, Dan Carpenter wrote:

> This was returning IS_ERR() where PTR_ERR() was intended.
>
> Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/medi=
a/platform/nxp/imx8mq-mipi-csi2.c
> index 6501843ae72d..3a4645f59a44 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -966,7 +966,7 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state =
*state)
> =20
>  		base =3D devm_platform_ioremap_resource(to_platform_device(dev), 1);
>  		if (IS_ERR(base))
> -			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
> +			return dev_err_probe(dev, PTR_ERR(base), "Missing CSR register\n");
> =20
>  		state->phy_gpr =3D devm_regmap_init_mmio(dev, base, &regmap_config);
>  		if (IS_ERR(state->phy_gpr))
> --=20
> 2.47.2




