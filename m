Return-Path: <linux-media+bounces-34386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E94AD2E6B
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0EDD188893D
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 07:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD3127AC45;
	Tue, 10 Jun 2025 07:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="RcjdXZcf";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LMsECaz/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0721FF25;
	Tue, 10 Jun 2025 07:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539564; cv=none; b=nKDwKPspvmFUiOv8wPX/dk52mUlB/LJw6Wh+fnYqxAy3qwFdEStqeo9eUr+y0lS3/5cjnmALh/ijVMnmFDY0m3ChfZuimlFH3iXt0rWpn6AaCDS7lkA+Eun+GHw5CYcIJBeWkBN1wBfZt4v/w9dh1AJZ+CPsoXhmk2Pc/TVHV+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539564; c=relaxed/simple;
	bh=DXw/aHoO9WgBP02VjUM0ndsg+Bzs/qIHJdOqcWLJZsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H6sYT6AZaWRRq1/QTO9GFNByMzB3RlKWV/sgr27gtBRErcBBIHWIlFCA96pe14bv70yP2seTiDGOqtrCQ8xnmq/i3b+ZjL+00RwbB05jVfR0vL+thrxgR4NL4ddMN1Nad3/dheyDFMjvPRclhW6CW+U2Ta8vbto36fRcsPZ+xfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=RcjdXZcf; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LMsECaz/ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749539561; x=1781075561;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IA7dsIXLKv7cmvpo+Mybfca1vUSev2LFZHY5ABbB46A=;
  b=RcjdXZcff6ko6oA2dSOA8hob2zSGnaQ3TbMyNX3lXPYuGVhA2v53T4no
   yQS7PnZyBvyNHjsek2PJPfit+um16GwV8g/HjDTiQVTV20lYC/GsxLdjY
   kcaqMC3swxuwZI/7URLNARarUgx/FFFIjqdRa+0XnqMVbednCLQ+UST/Y
   /ihCPV3U7LHgKnTXrCZ7blEQfTi31IAz9GmxmkRuzMPdL0Tu3xl5dsFwm
   u9PRI/72weJeFEM3cHecysdF6vDcjkd7gFqeqmCc5a4/uD3gaihfcOneh
   N6xNkfoEq0Y3x69f3Sx3G1PNnjssyzRr2Hmhoyl2lKDh123LYCwELQi3s
   A==;
X-CSE-ConnectionGUID: fA3TVHqiRBOxqf/Q+mGaRw==
X-CSE-MsgGUID: rGinyqaER6WoZUKPcnwIwg==
X-IronPort-AV: E=Sophos;i="6.16,224,1744063200"; 
   d="scan'208";a="44535023"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Jun 2025 09:12:32 +0200
X-CheckPoint: {6847DAE0-18-476CAA88-C60F6DCB}
X-MAIL-CPID: 1FD1400D779E047ACCE98C823177DC56_1
X-Control-Analysis: str=0001.0A00639C.6847DB01.000A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EBD51644F0;
	Tue, 10 Jun 2025 09:12:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749539548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IA7dsIXLKv7cmvpo+Mybfca1vUSev2LFZHY5ABbB46A=;
	b=LMsECaz/6WqFjW9c9hSzKZqdCwCDa7iRyEGktjb4aXxAdE5PcO/HeMC4dPHYHX7JQPA1El
	vXGolpoMVPdD7IQJnJ6KwBqcC4k45BGMW7vwqyQ/YmC67Uv4eRwEXUiGINXBn+Uy+4NMn2
	bPwnSoUdO8j+Xd/1/t2eGCBNBiEW1sCC8cA7ra3vAoRVQZlSZ0z20Zn7ebMuDCSEMhrxqD
	i9HSyP3CGV7a67V/4HtqEUdfrYbINCxTkuxz09QQBjiCqaVbClP/Sx6mWEIcLHEiNvzYyn
	Uju+GLjSwjvb33OwFT7TTbhiulKoA85W4XOkn3JVfHYfAqKi/CNvKCPPMEWLHA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH 2/8] media: imx-mipi-csis: Fix field alignment in register dump
Date: Tue, 10 Jun 2025 09:12:26 +0200
Message-ID: <12685072.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250608235840.23871-3-laurent.pinchart@ideasonboard.com>
References:
 <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Laurent,

thanks for the patch.

Am Montag, 9. Juni 2025, 01:58:34 CEST schrieb Laurent Pinchart:
> Commit 95a1379004cb ("media: staging: media: imx: imx7-mipi-csis: Dump
> MIPI_CSIS_FRAME_COUNTER_CH0 register") forgot to increase the maximum
> register name length, resulting in misalignment of names printed in the
> kernel log. Fix it.

Does this warrant a Fixes tag? Anyway
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index d59666ef7545..b652d59851c2 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -895,7 +895,7 @@ static int mipi_csis_dump_regs(struct mipi_csis_devic=
e *csis)
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(registers); i++) {
>  		cfg =3D mipi_csis_read(csis, registers[i].offset);
> -		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
> +		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
>  	}
> =20
>  	pm_runtime_put(csis->dev);
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



