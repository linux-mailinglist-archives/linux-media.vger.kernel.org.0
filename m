Return-Path: <linux-media+bounces-44985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 64700BEFB0C
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A9A8D4EDE21
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 07:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C5E2DC782;
	Mon, 20 Oct 2025 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tojZOb/f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AE32DC779
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760945792; cv=none; b=ccYYdiTtwrxUu3uIDW58zjU+gz8MiLqi03wFUv4UreHAW3/wbFgxgQQtTMccJUTvt/hUGvJdA1UrUp3br9uwzVJh/W1gV12uKsQKahGjk+gyPAzwOn15co/AQCV/6klkJNn3WNcTIgn8H1G8pDpaBEYfbmvx0dbhn+kN+bZWLGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760945792; c=relaxed/simple;
	bh=b11bQ+Qj1whQWDpwGwS9k0+B+CuDzVOinFaebT7fgzQ=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=oKyQn0gHpUgxhgYHHy9dt0Oy/M9c8QNOr8rexzghI/HWo2wUHqc+p7udTGrCPFg+MJgL9DvizoiHGlaw0xbLGuovntOs4gNqT9llTNp3vF9gboZQCZFv4cEcxol1Rn6toiIHr9r5UFIMUle0kp1bSVjGY+3k0R5OkHB3xQLNrVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tojZOb/f; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ece1102998so3579347f8f.2
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 00:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760945789; x=1761550589; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oDYfOX+N7HH44LsB2mcq8gtdqCHa+XRbe2BqCcoo8I=;
        b=tojZOb/fO0Lx8nr4JNo1SO65ZvXE+OW8hD4qIiCTyDNBaf7SHE3Nny31OpD5eU85M+
         DDsJSGd0Us1qBQt/b78ubllLOeDHEXDAPhJf09IouYP1C9hm3les1FE78aJrlpAHSfma
         tqaoHkrOhGGANEHw/HOlQ0/EyIuGlJnuY5gXGwreAGFtMtX7ZUspP2lzfpDoa41Ccktk
         H4p5aFu//FTCrOd522md7eATcuY1kFuj7DHv9+TX5+mJ+RXWFF1PTd7xvch0bh3xHW/R
         jGNMgLt9BglGULau2JHNz79BBUCPfVIZyoteS9e7EmlyDMt3EDanbdQpGSBClbc6hGc9
         QKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760945789; x=1761550589;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0oDYfOX+N7HH44LsB2mcq8gtdqCHa+XRbe2BqCcoo8I=;
        b=nfmlU1eNGXsDUaJjgYbJWzYGBu3+59SeP2M3OuvsVKJRmZTN/WQmLs4jk/AV+4MUGG
         Neoz9ih7FJ7X0pRvqU0CMsBUbpQsClTUq5vIn8gycN/wnAU3mSN57lBSLXJOnn92nwzH
         EA2zICGTcieIVHzVQIAetsrnW8WCApyxShppvbpqa9edRgxxApIOn8cVpFp1AebdJ9aj
         fpEdhZfWn6B9LRbB/LnYaNSPabsoQr5Xto5Y4+Kfr0wSDKhfWsTLqXBgnZp1vjpmkliC
         RTjqpM+1dR98nrbaXvvG+1kCib9wk2c5WWXip0h9stFr44QlZo2618pElOUZdfbRg3Gy
         LEFA==
X-Forwarded-Encrypted: i=1; AJvYcCX4jQ5rYPreXZhpGRnrTXrvSBHu8EDmP314hhT91Z8BoprYoP2oJAQxvR85QS4lvecfwvZdQ5qN/YydxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAvix6HzhyS35lljn9O0sY8oPhMTfSPUynqxmC5S1BIGtGBlea
	EPc1mL3aCm+FSbw0uji9mfgvV+Z+UN6wawyK3y1er43soZLYF35QYRGM33AJ4eC8jOA=
X-Gm-Gg: ASbGncvVKXeNSiKxe28Q7x5nr40LvpWAwtWgfWY4yTCfS654FrmOTj2jTDW8RwRo0hU
	M7dP6J/4tjnXeeErN1asUZPZHqcsDgbkrPtznXBOE0KLeIoODhgsv6qARsw2huHkxXwWZ2+J4gT
	Ycoast6cJLRZoKlO/ed+s2a1m1loGg+hAajMA4s9+05ZczAde4LxcPQdOWJkAYyPoSCCODD5Ajm
	bkGPgZbmj/gPnCzzrVDeJKEceBq6TKuq0Rd2/kj1YR8oCCMOvee7jDn0IG9lf2lrFvlKoizUppF
	92wAu7ogvYG751xA+XM+vOYUKvgze32pDDjCTBX13QgeLlTr2DQtXwEEui1CtzB3/K/5lRaR+Cg
	kGWx5rhwZ9azWjpEA7uWBNLVGfgPIhuZLO454O/KxTkDgX3maSJxYsJ0l5aYjkuPFCP3FfI5WQu
	003w8PL1iDF1ilWN/AMmFIiB1L9fhCQ8PagTDjc/o=
X-Google-Smtp-Source: AGHT+IERhCkWb2T8/kf7U8Ss+HEyA6U3w9LwAXgkSkLo9V0JBNvsfWwwmeD6ZTNYpKJEan7F9UxYZg==
X-Received: by 2002:a05:600c:5287:b0:471:1337:7220 with SMTP id 5b1f17b1804b1-47117874810mr84039525e9.3.1760945788718;
        Mon, 20 Oct 2025 00:36:28 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47154d3843csm129725335e9.11.2025.10.20.00.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:36:28 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 08:36:26 +0100
Message-Id: <DDMZ6MKWSPB6.6HDN3XAY8RIP@linaro.com>
Cc: "Purism Kernel Team" <kernel@puri.sm>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/3] media: imx-mipi-csis: drop unused module alias
To: "Johan Hovold" <johan@kernel.org>, "Rui Miguel Silva"
 <rmfrfs@gmail.com>, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Martin Kepplinger" <martink@posteo.de>
References: <20251017060051.8204-1-johan@kernel.org>
In-Reply-To: <20251017060051.8204-1-johan@kernel.org>

Hey Johan,
Thanks for the patch.

On Fri Oct 17, 2025 at 7:00 AM WEST, Johan Hovold wrote:

> The driver does not support anything but OF probe since commit
> f0e7cfbb43f1 ("media: imx: imx7_mipi_csis: Add i.MX8MM support") so
> drop the unused platform module alias.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Acked-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index d5de7854f579..fd399af56e0c 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1634,4 +1634,3 @@ module_platform_driver(mipi_csis_driver);
> =20
>  MODULE_DESCRIPTION("i.MX7 & i.MX8 MIPI CSI-2 receiver driver");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:imx-mipi-csi2");
> --=20
> 2.49.1




