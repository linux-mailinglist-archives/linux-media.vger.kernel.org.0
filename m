Return-Path: <linux-media+bounces-23543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFD39F4492
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 07:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABF1F16E6D7
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 06:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4981DD879;
	Tue, 17 Dec 2024 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g9fCuMyp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D451DD55A;
	Tue, 17 Dec 2024 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734418404; cv=none; b=ZxNvzlc+pirOIat54femQ4oKHIok/OPvEzgBPKTnGVATDtcpoRFiFK+r6A2IZjEE8PB+0SHceGtPlvd2ON+MYGyURO+uTHyi4EpGyyU/CvcT1aL6iV3DSCOIFa87cOe1JNwKxPID3R/uniGW4gGEZFtUG3bOjyrC2YLxoBCbf1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734418404; c=relaxed/simple;
	bh=V5v0lNkKk40IY3Gj/m4+uJf5hLK5Tg98NdjWvK4g80w=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VRr+YVYmz1TnRu997H67qv4WDx5GWjrqO46V4500L+wbzc8PnLDK/mNGM/9FoGsZp6sMyfSfkGltU/9nOQi4u5vtR4KyPCOZHk6ILBOw7PtJyU3jB/OdQvSaDB+a7lBoYNpwM6sxjGDLevxZ5ZTUc6c+AzOWpdULE2JVJnMlZbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g9fCuMyp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63E9C59D;
	Tue, 17 Dec 2024 07:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734418364;
	bh=V5v0lNkKk40IY3Gj/m4+uJf5hLK5Tg98NdjWvK4g80w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=g9fCuMypy6JIfUqCZbRSUybDYo3BHTvj2P8c7ZXWnuSKJj2M/DZFhva5EY2QvSHeP
	 PBv+49c0VSirMFSg14kjsRpoMzev3V8wrAJ9RyVMsanxh/+uSSDdPyVlZ/82xOPXwP
	 I/a3EBQ+TMgKpKj4sREqzaRSH1wX09EJ6zYKcsM0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241217032821.1712916-1-david@ixit.cz>
References: <20241217032821.1712916-1-david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: media: imx283: Describe sensor address using the reg property
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Umang Jain <umang.jain@ideasonboard.com>
Date: Tue, 17 Dec 2024 06:53:18 +0000
Message-ID: <173441839809.2983864.13556053856142193864@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting David Heidelberg (2024-12-17 03:28:17)
> Use the reg property instead of text in the description.
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/i2c/sony,imx283.yaml         | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml=
 ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
> index e4f49f1435a5..f4ee991c89a3 100644
> --- ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
> +++ ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
> @@ -13,16 +13,15 @@ maintainers:
> =20
>  description:
>    IMX283 sensor is a Sony CMOS active pixel digital image sensor with an=
 active
> -  array size of 5472H x 3648V. It is programmable through I2C interface.=
 The
> -  I2C client address is fixed to 0x1a as per sensor data sheet. Image da=
ta is
> -  sent through MIPI CSI-2.
> +  array size of 5472H x 3648V. It is programmable through I2C interface.
> +  Image data is sent through MIPI CSI-2.
> =20
>  properties:
>    compatible:
>      const: sony,imx283
> =20
>    reg:
> -    maxItems: 1
> +    const: 0x1a
> =20
>    clocks:
>      description: Clock frequency from 6 to 24 MHz.
> --=20
> 2.45.2
>

