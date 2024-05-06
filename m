Return-Path: <linux-media+bounces-10825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C58BC79A
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 08:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E8EC1C21144
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 06:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3F57D06E;
	Mon,  6 May 2024 06:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lf2eOVXC"
X-Original-To: linux-media@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B831A5A0E1;
	Mon,  6 May 2024 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714976999; cv=none; b=FKxC94m69V8Z43WN2Hhj5x+y1twmI516bLFY4qA7e1iL4B2SwdToEbg/1ZSDXmv50QvJ1gyHR5ASGBNyaIwIaNOl3eQBYE7Iwl7l40a1L15FSezJB1GtdhSDSoQZeRlnudEv/rypaGPNz/No/UqQWqjUEFPMlvmwliKVmNSsDC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714976999; c=relaxed/simple;
	bh=d3zpG5d2aKMzHVzOuJy2YRE8ggKCK8yhQidc0N7TgSI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=latdCZHvi5810fgaTnHStUxdIZUr3vdKgPOXb+Pf72H0az1VRHj2fDRJ5Uyb5eKE/O5cMlsVoJ7xFCUqK4X41+HPqg0A+dvXMk/ZhecDgnEafGmtT9azuFPX6D6ijcgz5RCGIBXkR2NiWf52XFFaLIATHST4jZ3WSJmmO6VYl1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lf2eOVXC; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3029520009;
	Mon,  6 May 2024 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714976994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mbe52SsrGtFjVUxzVcPXdTIv8tO7ZFSm6CXXG49YCtU=;
	b=lf2eOVXCHOhCPhhLOG49d0BOL9BLWcSYcvXKv5WGS6MxkZYPTV1WCz2/vSgrPiuSGv0X6t
	YxzGe+i6bC0lFh3mTeaWoLOL763zqt464WKjyX5ghxGjqKglarQfnko5zcBCdPOl4WiScu
	l/XbZpiKtujeQPAeWAPOSgACNmE/LCeJo3841n0TZ86qnPBO381HH3sGeORvAfmC6jUmrS
	fQTNrMTqmolY9dOnzYVweBrFr62CLpFXt+RGfPoR4w7kmxBzTXTMzDKwNe/qPutTvptb2C
	ryYQznj22a4alrjorblL/g19t1sun8H+oH8fCavHvBM2pQepsgY+nrXg/02UyQ==
Date: Mon, 6 May 2024 08:29:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ming Qian <ming.qian@nxp.com>, Zhou Peng
 <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jeff
 LaBundy <jeff@labundy.com>, Shijie Qin <shijie.qin@nxp.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Use full path to other schemas
Message-ID: <20240506082952.6715fc8d@xps-13>
In-Reply-To: <20240505084618.135705-1-krzysztof.kozlowski@linaro.org>
References: <20240505084618.135705-1-krzysztof.kozlowski@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Krzysztof,

krzysztof.kozlowski@linaro.org wrote on Sun,  5 May 2024 10:46:18 +0200:

> When referencing other schema, it is preferred to use an absolute path
> (/schemas/....), which allows also an seamless move of particular schema
> out of Linux kernel to dtschema.

I didn't know about this. You probably want to add a check over uses of
relative paths in the tooling now :-)

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Rob, maybe you can take it directly? Should apply cleanly on your tree.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

