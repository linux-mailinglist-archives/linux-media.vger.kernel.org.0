Return-Path: <linux-media+bounces-36497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C70AAF0A75
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 07:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4BBD7B26A1
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 05:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0BC225A3E;
	Wed,  2 Jul 2025 05:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="TOKXt0Wh";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cF618pGX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457F8219A7A;
	Wed,  2 Jul 2025 05:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433357; cv=none; b=OdKJpbNfklvBtW4EsRi1tBXUxC4hXc7DANk5D0YhxrWV6wuP2EXukKein2gHEvZnf1O2GM8onjEEafLkZVjkNrD7wk12VSyLTcfNA6KfxoOM4qgLcE6VpviTI/prt8AvfJENiJh2em+k8OBNw5pKyII+E55JHC/IgLTeJu1MBzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433357; c=relaxed/simple;
	bh=609em8duwn1TuR7A8MeBu753B5OAPg1aWBaZfiCHuf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WRVXZear+8Y2dfP2hwYZyegbBv3RMgMeB/ZVmfwm96jERSOPm67Seh/V7SuI+zNvbtgGWauoqhDxlQ7z4/XIwxUK4zQTW4mdTrodEz94lXXJQKSFXFQTOcg/nFEX269OE9DiQPKi9n5LXZcDJ/p4dZ7mVu3qV4Gr1eYTGa1yk1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=TOKXt0Wh; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cF618pGX reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751433354; x=1782969354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yEbAI3opm4LnixMNPD4CJAcS1fuxSWr4Pdo00xuzpFY=;
  b=TOKXt0WhGRqtccPEOjmPu7X14LaQsk0a1aoTnFSijVkhf5Zysb12MyMU
   Bzqfac/hxcr1jS4IW9CyTkJYourAOEyAwKvQcAn2JxWNDaUv3YsUc21f6
   HvqvQJhvsRuk8txaVVyZkl06stxK+f8shuukHv3H67ueGnX5/efHwscwA
   a4EAVcSkjaE7mKIM8aCBmcqJgn/LyzZmrbHbgy6gLjCA+DvNt/SirOfTF
   X5kjKANfDgH9QHViZY/BGm5wP2iLiZXJ6tmfHwp8yG3BWv/gL7qtsaXkM
   B7knFm4nkHHAD4tvZ8pQcGy3thxrz+UOtlaerScRPGeVmag9h28S+CmgV
   A==;
X-CSE-ConnectionGUID: eIs4CnGHQlWPEHsu6qr5AA==
X-CSE-MsgGUID: ERVeFJYmQfG8spIkNsSiLA==
X-IronPort-AV: E=Sophos;i="6.16,281,1744063200"; 
   d="scan'208";a="44969913"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 02 Jul 2025 07:15:50 +0200
X-CheckPoint: {6864C085-39-B6FA1C9B-ED1A9D03}
X-MAIL-CPID: 7C0C64754A18A0C5244284046CA090FF_2
X-Control-Analysis: str=0001.0A006371.6864C09E.0036,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B95DA1609FC;
	Wed,  2 Jul 2025 07:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751433345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yEbAI3opm4LnixMNPD4CJAcS1fuxSWr4Pdo00xuzpFY=;
	b=cF618pGXKLBuYLWJzcG6yKxN6HvPJZ3OnzuLEmANIX9+PK+VYRbMI4jhxz1Vp9MpJjcL4q
	DP/tq6zlyoJctpFzYH6DACLXA9gX9E4ETE1oCbnLP+OdSd0ldDYS7s5U91NVaRVj8YmGhD
	mi0e/RFIx3A+oxWRWYME+JgWfucWZeAmbB3vgaJTZwofsXB6zLTxPbYoWiMdk4LLFPN6Rv
	BimCqaXrReERUtViTT11VULX6JSEgaScb7ZQnJ2+QgOQtVwTVrv4uI3VVOiPNEak+PfBtO
	xwmC5iDg3mkguCVlmoDwq96bJgvsvhTiIScf1lrG5gGikyChpuTjvkDGXsvlhg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 3/7] pmdomain: imx93-blk-ctrl: populate child devices
Date: Wed, 02 Jul 2025 07:15:41 +0200
Message-ID: <2232630.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250701-95_cam-v1-3-c5172bab387b@nxp.com>
References:
 <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
 <20250701-95_cam-v1-3-c5172bab387b@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

thanks for the patch.

Am Mittwoch, 2. Juli 2025, 00:06:08 CEST schrieb Frank Li:
> imx93-blk-ctrl is miscellaneous devices, which include reset, clock, MIPI
> CSI2 PHY and DSI's miscellaneous logic. Call of_platform_populate() to
> probe child nodes.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx=
/imx93-blk-ctrl.c
> index 0e2ba8ec55d75..ba2dd8bd143d1 100644
> --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> @@ -7,6 +7,7 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -297,7 +298,7 @@ static int imx93_blk_ctrl_probe(struct platform_devic=
e *pdev)
> =20
>  	dev_set_drvdata(dev, bc);
> =20
> -	return 0;
> +	return of_platform_populate(dev->of_node, NULL, NULL, dev);

Please use devm_ same as in [1], which you Sob'ed as well.

[1] https://lore.kernel.org/all/20250304154929.1785200-4-alexander.stein@ew=
=2Etq-group.com/

> =20
>  cleanup_pds:
>  	for (i--; i >=3D 0; i--)
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



