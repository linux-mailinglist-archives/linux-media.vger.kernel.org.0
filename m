Return-Path: <linux-media+bounces-61277-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKIwMh9CA2pV2QEAu9opvQ
	(envelope-from <linux-media+bounces-61277-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:07:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E84E523493
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 959D030CAAD4
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100E6397338;
	Tue, 12 May 2026 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="c3Oa7xST"
X-Original-To: linux-media@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F0C38D40C;
	Tue, 12 May 2026 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598176; cv=none; b=uWkY/FbE8UipGDHssxdZq8SCUTjLZv4/lUPRaCl3HRdI5M0z5Sg54Rz61nTv3mdMug0BD+ZOse5Vm8vtbZTao1BjmQA4FAZFmDYvgrunQ4NZTbiktn4n0meyEyNZ0HTB55MAFXgxeMwCRZUleBuLU1VlmQxHeC3DFv7ZLgA58T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598176; c=relaxed/simple;
	bh=JNM723QFrH+SyHff3gQSXzHFwJQEEcwLK+Vt7bc6kEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bh2yfkEqPoh3eESQE52Ta6MalUx4NX2cLHqAWt2wiN+8AshaAO+qNQYDiFOz9kjldXA42g5c7ENmrsyQEpKqc0MbsD0YZF3fRxrB1T4ntRVhCRJXHdsgblTAAAXEyj/X0Ih4TYoy7UPOg++UGIPiqdK8x/4HapfRJJ9c3XbXmyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=c3Oa7xST; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=8p2kpdkft2Ua1doPk30sxoaxUJf132dfboWLlXI3eXE=; b=c3Oa7xSTaKbW8yfu2Yp976W2ju
	xsglxIIyqsElVUGscyMaw/USnpJ8XbS8gIb8NaJSfJPjIlW7ncFLPYpMXkIOEMUiVV1noObcnuchK
	FtrGIV58i+QrjXdbnhs8vduyPznPwkE5aRa+nuGsL7/MYAdDWFqmbkvUL3gqgZn+zBV9Qo/AHrHHv
	7cIB6WdullGWwrfaoPJsnpFZvmYqNToSQhISSyk9W4GPl/Og0NX3+V4vy/XhtRDICnnwS+AeoKni0
	Hvtr0klEluHYdr+jPjuX2tacnh47+5z+1yquJQ66/iX0YuaRZOySYS7MJ0ADtBn5fLbHoWAM67FwZ
	3kGUJIpA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wModA-000N4T-29;
	Tue, 12 May 2026 17:02:44 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wModA-000E7A-2F;
	Tue, 12 May 2026 17:02:44 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Michael Riesch <michael.riesch@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] media: synopsys: Add imx93 support
Date: Tue, 12 May 2026 17:02:42 +0200
Message-ID: <5993213.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27998/Tue May 12 08:24:57 2026)
X-Rspamd-Queue-Id: 3E84E523493
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61277-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tq-group.com:url]
X-Rspamd-Action: no action

Hi Frank,

Am Montag, 16. Februar 2026, 20:18:38 CEST schrieb Frank Li:
> This 3rd time try to support DW CSI2RX support for imx93.
>=20
> 1st: Create new dw csi2 driver
> https://lore.kernel.org/all/20250701-95_cam-v1-5-c5172bab387b@nxp.com/
>=20
> 2nd: Based on legacy imx6's DW CSI2 constroller.
> https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/
>=20
> Now rockchip create a common DW CSI2RX driver at
> drivers/media/platform/synopsys/dw-mipi-csi2rx.c
>=20
> This time base on rockchip's implement.
>=20
> i.MX93's version is newer than rockchip one. i.MX6's is more similar with
> rockchips.
>=20
> But i.MX6 is too old. So start at i.MX93 firstly even it has bigger
> difference.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I'm trying to give this a try. Did you actually manage to run a CSI pipelin=
e?
What did you do for the D-PHY driver? (please refer to csi2->phy =3D devm_p=
hy_get(dev, NULL);)

Best regards,
Alexander

> ---
> Changes in v3:
> - use dw_mipi_csi2rx_has_reg().
> - detail change see each patches's change log
> - Link to v2: https://lore.kernel.org/r/20260213-imx93-dw-csi2-v2-0-8be60=
39f44c6@nxp.com
>=20
> Changes in v2:
> - use enum and array map to real register offset.
> - Please keep the order:
>  - #includes
>  - #defines
>  - enum and struct definitions
>  - the rest
> - detail change see each patches's change log
> - Link to v1: https://lore.kernel.org/r/20260210-imx93-dw-csi2-v1-0-69667=
bb86bfa@nxp.com
>=20
> ---
> Frank Li (6):
>       media: synopsys: csi2rx: use devm_reset_control_get_optional_exclus=
ive()
>       media: synopsys: csi2rx: only check errors from devm_clk_bulk_get_a=
ll()
>       media: synopsys: csi2rx: implement .get_frame_desc() callback
>       media: synopsys: csi2rx: Use enum and u32 array for register offsets
>       media: dt-bindings: add NXP i.MX93 compatible string
>       media: synopsys: csi2rx: add i.MX93 support
>=20
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  47 +++-
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 278 +++++++++++++++=
++++--
>  2 files changed, 303 insertions(+), 22 deletions(-)
> ---
> base-commit: ada3fa02f7a95623b724dfe300fce6f49cc2d75a
> change-id: 20260128-imx93-dw-csi2-b472ddcb176a
>=20
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



