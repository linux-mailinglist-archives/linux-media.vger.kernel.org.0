Return-Path: <linux-media+bounces-44345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8250CBD7CE2
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419B53AE75F
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 07:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BA43093CA;
	Tue, 14 Oct 2025 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="qs/anXn2"
X-Original-To: linux-media@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476142D3233
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 07:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760425631; cv=none; b=PW/RydXv0Ll521006R+PLrycBXr0OSSCvlEzvme9jUk1aK1lJ4JlbdO+PyCAoTKVpLu51eobXuaC/LAryGSbFKIU08Jjscna8WVfAwn1wgLNGCTjnQ45VrihlVAnHmrkCrQJoSFBcDtGu67B+S0QyJ48virkmdkfZPMVs47e1sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760425631; c=relaxed/simple;
	bh=AE6o9rBchXM9ButRAfqsiHwvFzmlHsuVVU5dxOZZtd8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MtZr5Hu2dg0WBPcrcaeaSgYt5q6tnBHFFKtAzhs7x//ddU2DSHl3P9knJs/uz421gghWJYCAfaE256eCYA5j6AqI+gNEf5lLSYq8Hs9n2nnGPS47VXDyvog51EMZE+VQnJ6PxIXFcYTw5XmqZqFOPJJ7c99sLBZthA5liqGtcLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=qs/anXn2; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 56350240101
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 09:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760425627; bh=m2ao7yOlmXtTR+gAWOXEYdjwi7rdtHCkxzZCJ5XFR9E=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=qs/anXn2TVnJ3gfmAMlt/gZ6fHeZdmw8nlor261Uc6AaFBIEbGJq4MC7QA5reFK0w
	 0/PJKEyhUqqbCtiyOMuFuopxx0xkpGCfrUsi0RtgLsMTpGKpkkmIc5xTD1b3ZZozXO
	 IxdgnISemS2GtLR1dbxwe5PSfug/pF+yzodMP8MImM7aIJAwZgpis5h48v6PNA9ti8
	 ML+17oz4AzLX/16JGZiUQrkqTmUqxcr0GvmHM+qDCwxzO3hxCnv4WAEavaC2RU5W2I
	 GWdSCeK7fMSy/OHfVFz7/E76HREqG687Nkt2HYjZqhcPW+h7juEPOAhhJjtMPxTiVz
	 TywBmW4HlmzbA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cm4yp6z2Tz9rxR;
	Tue, 14 Oct 2025 09:06:58 +0200 (CEST)
Message-ID: <f30b137685be9148e69f18065d811d011bfe3409.camel@posteo.de>
Subject: Re: [PATCH 25/32] media: imx8mq-mipi-csi2: Use %pe format specifier
From: Martin Kepplinger-Novakovic <martink@posteo.de>
To: Ricardo Ribalda <ribalda@chromium.org>, Linus Walleij	
 <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@kernel.org>, Sakari Ailus	 <sakari.ailus@linux.intel.com>,
 Krzysztof =?UTF-8?Q?Ha=C5=82asa?=	 <khalasa@piap.pl>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Leon Luo	 <leonl@leopardimaging.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,  Jacopo Mondi
 <jacopo+renesas@jmondi.org>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,  Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund+renesas@ragnatech.se>,
 Julien Massot	 <julien.massot@collabora.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Daniel Scally	 <djrscally@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>,  Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Sylvain Petinot
 <sylvain.petinot@foss.st.com>, Yong Zhi	 <yong.zhi@intel.com>, Bingbu Cao
 <bingbu.cao@intel.com>, Tianshu Qiu	 <tian.shu.qiu@intel.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Rui Miguel Silva
 <rmfrfs@gmail.com>,  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Purism Kernel Team <kernel@puri.sm>, Shawn Guo	 <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Dafna
 Hirschfeld	 <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Sylwester Nawrocki	 <s.nawrocki@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Yemike Abhilash
 Chandra <y-abhilashchandra@ti.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Date: Tue, 14 Oct 2025 07:07:05 +0000
In-Reply-To: <20251013-ptr_err-v1-25-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
	 <20251013-ptr_err-v1-25-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Am Montag, dem 13.10.2025 um 14:15 +0000 schrieb Ricardo Ribalda:
> The %pe format specifier is designed to print error pointers. It
> prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
>=20
> This patch fixes this cocci report:
> ./platform/nxp/imx8mq-mipi-csi2.c:422:23-30: WARNING: Consider using
> %pe to print PTR_ERR()
>=20
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> =C2=A0drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index
> 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..d333ff43539f061b8b9cf88af2c
> da8c44b3ec2a9 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -418,8 +418,8 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct
> csi_state *state,
> =C2=A0
> =C2=A0	src_pad =3D media_entity_remote_source_pad_unique(&sd_state-
> >sd->entity);
> =C2=A0	if (IS_ERR(src_pad)) {
> -		dev_err(state->dev, "can't get source pad of %s
> (%ld)\n",
> -			sd_state->sd->name, PTR_ERR(src_pad));
> +		dev_err(state->dev, "can't get source pad of %s
> (%pe)\n",
> +			sd_state->sd->name, src_pad);
> =C2=A0		return PTR_ERR(src_pad);
> =C2=A0	}
> =C2=A0

Reviewed-by: Martin Kepplinger-Novakovic <martink@posteo.de>

thanks you,

                             martin

