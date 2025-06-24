Return-Path: <linux-media+bounces-35774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F4FAE6523
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70436163D13
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF76527A929;
	Tue, 24 Jun 2025 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lS1ysr4i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DC3291C17;
	Tue, 24 Jun 2025 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768575; cv=none; b=CQWZpbweG7wwNsMRHlxnYyz9unvgOlsZwsC3A1YsI96ydaBNTiAwqMiqQADWuNVudJYyWH5LNOS6n07sqC4mm3L+sN+AxSDCEomhdGfVzAijpAK837HUeX9ctCQ7l1asNnISA5gMMKUWnmZkcvfsrUyCA42bhDIlAFuYDSSqb9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768575; c=relaxed/simple;
	bh=eMFmOjsJtHMDEFaiUba8TJXjRl2kdhKtcEwnlhWU2Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IWPEdps8hOaW31PSmIShoGF4DCvjKYdDjrtak0/meKHHrxyoCyl03OrKXcFuAndc3IWdGIgIcuJzJvjMDbuZOptjlcISfttIOnx7OPWc8MHFi0BIx77Yv2a2o9dmsKB/DaVb1+bHwtdNNGLpU0/gfcffZabPjxVxWP/0XnLubL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lS1ysr4i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8A6C1752;
	Tue, 24 Jun 2025 14:35:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750768553;
	bh=eMFmOjsJtHMDEFaiUba8TJXjRl2kdhKtcEwnlhWU2Gg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lS1ysr4iG8cEK44KfUBQ6jBjJJ59f2avuyfzgRoV6KEaLjihhcQpNrUhjtaU/rYai
	 CDRsDTXrFDZo+xTPMEu3nJt1E2BbJTouGf8FoKQiQujBdfb8IT7ydsRUiDBQ2LpNVL
	 IK9eRsrFKAAsR4TLUkWUyxnOnwy6rLG/mMF3Zspk=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 13:36:00 +0100
Subject: [PATCH v2 3/3] MAINTAINERS: Add entry for rzv2h-ivc driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-ivc-v2-3-e4ecdddb0a96@ideasonboard.com>
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
In-Reply-To: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=eMFmOjsJtHMDEFaiUba8TJXjRl2kdhKtcEwnlhWU2Gg=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWpu3Nrkg6ieVPvJUWsiZNazh7lN5TYCiBAALR
 j3qO0y/agmJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFqbtwAKCRDISVd6bEV1
 MigGD/9N3byfFAkkR5IXLuAigfArigGdAkrgTCPC44O3GgKDp46zAB4SvMh1+75upATfZTISnwd
 yrxz2vfsDR/VG7bVaT4JzMJsNz8dUJC4hEYzvCN42DezRgxZ4oDwgf7WsiScpwPcPdU4p01CkIS
 g5RbmfLByierQEoQgaN3r/ZUgmRFiQQnhRtxQSITZAKAU8yB8lTzEujDWcp5e6nBx85o71jVawL
 DEMdg/znTQ7tKS44jRKm/oqN7pcrqz7TgK3dObhOOLdjRtemz6zvCS/GhYQhiv9YnaWsgXCLzaB
 6TKcs1NeZoTZMQtqA8j+K1pWa3KaljDDxxvAz0DtBeNGs+0NepoB98Ry3dN7gyWEzLt6a8F0jpW
 K5eOwLfl4asBOlSWiyFx/QdePHhpjt6YaS6dZOs3hzA4jqr7V5XkVXPEvGZ2Km3c526BCjM5cmp
 byX5mRNlJg740yzPXAAWnqGrwlQ1bVxD2Iv0+Xwgv7WRz+kFpVucNUmynfEtAGgML5zUTZsgRfx
 JnV9IJbqJNo1ayIA0J7b3/yzwmW36uI9RaKkzxELK0w5sAfHxxaXPMHMTZDg6hwsLpaOOCWuG8h
 SIMgfRfDOfD+udzuWxs9wpVdVRJkRGAGHHcd4dn5jBRNaf5HslTxhqf45nbPyv/OHtjA5GmuBOl
 HX/nCKrZ/DXcDrQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add an entry to the MAINTAINERS file for the rzv2h-ivc driver

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:

	- None
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163f9fe8fe3f04bf66426f9a894409..272255547287b5e87ebb1d1c9b7a656e905a92b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21165,6 +21165,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
 
+RENESAS RZ/V2H INPUT VIDEO CONTROL BLOCK DRIVER
+M:	Daniel Scally <dan.scally@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
+F:	drivers/media/platform/renesas/rzv2h-ivc/
+
 RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

-- 
2.34.1


