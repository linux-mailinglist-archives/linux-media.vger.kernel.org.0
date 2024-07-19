Return-Path: <linux-media+bounces-15153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEB39377EE
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 14:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F8D4B21AAC
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 12:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA4513BC3F;
	Fri, 19 Jul 2024 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pXi0Wi7k"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ADD39FF3;
	Fri, 19 Jul 2024 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721393283; cv=none; b=MFJMYwg6539F9GOa+A9gdfiVknspGtHWOxPH9TfeR0aIeDzt8bXxRAGb8AgTFBlhb+vhRPOnkMZV0K+h3/qsROd2nR6mEzh/CD066voAqtR+QSOmnQ82msNAUmbClUie67nHik+JtvuJf9D1vhI5R+gPALERZ9vl9Yohf01PZFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721393283; c=relaxed/simple;
	bh=lS5+DXt/Ha+/JI2+xDkk3DujgnGSvw8WsiTRVQu7cac=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TnNLck4rzTXowhMG2+c8ePagtxAs8RmDGZlC3vKOLRfLNofFOvUsFqCoYVYydRGQ5uMgOaBJKa1RpCMbcslfLGq0ucsYVnfb/liDhoD/e/otItUJHZV6GvUX8aDV+m5cXgjfkH5s8c61EFh+iK/UZgnEtMBfPEt/Po4aUUmySQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pXi0Wi7k; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721393280;
	bh=lS5+DXt/Ha+/JI2+xDkk3DujgnGSvw8WsiTRVQu7cac=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pXi0Wi7kLk7pYItYTR/Iootaqw+OWGomCJC6fR296SD1F0G2qMQDSWkvJlyhTNlju
	 AMvVVWFSTXr2k1YmDkiaEf8+0ka/IqnVojEISGLiuGY/+JMF8bRPuUj0nqw+xXHOYg
	 z//ASEHHleuAFiQiSMB47YNO3ePmN00eNIGwCaDUvboD0e5VvZmH5tL6nxhmNgfjmb
	 AatVrDI668/lLOvJ41W9hE4jTR4u5GXoDmmRz78Fu7PTxEaz2udxkf1Cdy7VlCw6+S
	 +guZdS8HIxOnuZ/spebVjPkSCzDYZAgH52WI07G8vddLTcNgbxwmV3d3SQ5g57oJZw
	 WAZx9OTjpS4qg==
Received: from [100.77.12.232] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: obbardc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3DA2F37821DE;
	Fri, 19 Jul 2024 12:47:59 +0000 (UTC)
Message-ID: <b1013e9a833cf0fc6ce0bf7d0b69daeaf2938f83.camel@collabora.com>
Subject: Re: [PATCH v4 1/4] MAINTAINERS: Add entry for Synopsys DesignWare
 HDMI RX Driver
From: Christopher Obbard <chris.obbard@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de, 
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,  mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de,  jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com, 
 nicolas.dufresne@collabora.com, hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Fri, 19 Jul 2024 13:47:58 +0100
In-Reply-To: <20240719124032.26852-2-shreeya.patel@collabora.com>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
	 <20240719124032.26852-2-shreeya.patel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Shreeya,

On Fri, 2024-07-19 at 18:10 +0530, Shreeya Patel wrote:
> Add an entry for Synopsys DesignWare HDMI Receiver Controller
> Driver.
>=20
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> ---
>=20
> Changes in v4 :-
> =C2=A0 - No change
>=20
> Changes in v3 :-
> =C2=A0 - No change
>=20
> Changes in v2 :-
> =C2=A0 - Add a patch for MAINTAINERS file changes
>=20
> =C2=A0MAINTAINERS | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1c87b471941c..0f0e1d58abff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22138,6 +22138,14 @@ F:	drivers/net/pcs/pcs-xpcs.c
> =C2=A0F:	drivers/net/pcs/pcs-xpcs.h
> =C2=A0F:	include/linux/pcs/pcs-xpcs.h
> =C2=A0
> +SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER

Perhaps a more descriptive name could be "SYNOPSYS DESIGNWARE HDMI RECEIVER
DRIVER" to better match the IP name:
https://www.synopsys.com/dw/ipdir.php?ds=3Ddwc_hdmi_20_csds_rx


> +M:	Shreeya Patel <shreeya.patel@collabora.com
Should this not be:
 Shreeya Patel <shreeya.patel@collabora.com>

You seem to be missing the final > at the end of the line ?


With the above fixed:
Reviewed-by: Christopher Obbard <chris.obbard@collabora.com>

> +L:	linux-media@vger.kernel.org
> +L:	kernel@collabora.com
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> +F:	drivers/media/platform/synopsys/hdmirx/*
> +
> =C2=A0SYNOPSYS DESIGNWARE I2C DRIVER
> =C2=A0M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
> =C2=A0R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>

