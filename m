Return-Path: <linux-media+bounces-43628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC60BB3A8B
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C4973C5A71
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B424F30B532;
	Thu,  2 Oct 2025 10:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="igPKtkkW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B312F27F16A;
	Thu,  2 Oct 2025 10:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401480; cv=none; b=hKoRgbYm5jwjIBvrH6K5/6VRF1U5Jkmaxsgdr2mzCBqo50vY49xs3uL08RoRUwrLHqy/6BzYVtR96C9kzeduzI83m3ai+89I5tdBk0++surKHQtRT9jFm9zsOxcbhC7zd7E8w5g0l2WUGaGDUS6Hf8ksorrcwmX2nzi7g5ZY7TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401480; c=relaxed/simple;
	bh=a+t3XtlKxGmzFFdpc3c7zJESuL1ip8qfua9sWSbps+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kEOM2PO3AcQFsEfI6lAux17b3CM4bsLIwCUtNAo4FM1d0hp9pC2sDWL5hCUoxd6exDxXDHuQz5rZTbiN8erjCQelF7L5r6+9DdgYz+Bdl7NSN2BcHR0R1vqZo0gybfL4/Sxtg/0ARfdNYRUerTW3GRbuCpB2f99bZOT3HY5HlIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=igPKtkkW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D4CC1E56;
	Thu,  2 Oct 2025 12:36:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759401383;
	bh=a+t3XtlKxGmzFFdpc3c7zJESuL1ip8qfua9sWSbps+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=igPKtkkWEPjx9F8P+pCUudCoDGnSKtyfVZeCZ66mwdlALBXaGOsFgXmKCob8y2nPh
	 ed0ldnrtPTxDhzssRzhi1T3iwvYyW8iPUV+NmMepACyDNH0QDoByMTJ6dkMG2lixja
	 FuT31v4tE2OYvLEWPOL/UZYYVpkaDU5dgP+uwl6o=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:37:02 +0100
Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for rzv2h-ivc driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-ivc-v5-3-192c663fa70b@ideasonboard.com>
References: <20251002-ivc-v5-0-192c663fa70b@ideasonboard.com>
In-Reply-To: <20251002-ivc-v5-0-192c663fa70b@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 laurent.pinchart@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=a+t3XtlKxGmzFFdpc3c7zJESuL1ip8qfua9sWSbps+M=;
 b=kA0DAAoByElXemxFdTIByyZiAGjeVf6iY1GJI4e09Tlsxido/3oriJy+aR4PZoeYq2LiuPPUI
 IkCMwQAAQoAHRYhBCrK7DIOdl1v6bGab8hJV3psRXUyBQJo3lX+AAoJEMhJV3psRXUyEvgQAIht
 bzgFLnHiy4oGnhWtTR20+j+zjrf5BgD9bbTWf3BBUUqrLrLHReuHCkVNwRwi4IjfG5V2cve2Q/1
 6rvAxsrc/qfXm5o01PQMoGK2Ax4U3WSDaFGFmsfonYcPkonow0Mh+TJDA9KTA0BelDblWwIexVf
 a1x6tVQbD1OgrbZc2BdoQjtpjmP4Al1mRH859THjrVmnoK7u4NAd57hhOI8uNW4o9YuSIBPF69S
 l2VWjYXf8z63HDO0hKWfBqCMsr5w7ZokTLnnmJUh+2kYCXSU+qkTr+oH7PR4qWBBRwLhKFYDXK0
 nzgG/WSqVKRAxxk0p9yxUwwr9nuCa4GtPHueIo72uQWBRsCo9b8QOcMnELio3OqTJ9X8owbMyzg
 qgqHSZ7hlMYByJVyFs+PPO8iiTIzO0cLQZ+4wS84xAgkBUjrf95nXVVF7spNtI/YWQtiazMM4nR
 fROXrfbKVM/P63fXXCfxjAfQes4BxtLtbnEHB47szRFgrZQLjbBkevFhlMKoPZs011CKjifJXAG
 aUdkd1ktHdUHyXzAbOs6tUGWbzdaben4D6XVJPVnLFIGFCP3t0J/ZyQuedoM1LDl9225jEumzJB
 7b+1K1JDaCq5m/KkK4mxVL/w7elcpwed800SHdvCdR2d+JWN2NLsTqbd5WtjcKtvaD90Wqi1Nkf
 KRxpP
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add an entry to the MAINTAINERS file for the rzv2h-ivc driver

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v6:

	- Fixed binding path to match new filename

Changes in v2:

	- None
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f16808feebd979e807ce36f4bd21379b6995f70..8627190599387cda220fe6024a8c7fa79b8ce6db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21538,6 +21538,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
 
+RENESAS RZ/V2H(P) INPUT VIDEO CONTROL BLOCK DRIVER
+M:	Daniel Scally <dan.scally@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
+F:	drivers/media/platform/renesas/rzv2h-ivc/
+
 RENESAS RZ/V2H(P) RSPI DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 L:	linux-spi@vger.kernel.org

-- 
2.43.0


