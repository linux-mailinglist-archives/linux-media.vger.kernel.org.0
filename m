Return-Path: <linux-media+bounces-5798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AAD861396
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 15:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F54FB2425E
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 14:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABC3823C1;
	Fri, 23 Feb 2024 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="APtMvge+";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qqSFXuap"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7C08061F;
	Fri, 23 Feb 2024 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708697111; cv=none; b=bdEQhmmzB11LG2Sh/ZUKE3g529clnNGorjmIdU4CvQQSfetQLYnb1Q66Wd2iFVi3xrihn1e02Y4PtRguLrYSMNqFm0x18HV/zpTLcj7kb6r5QamgjrRjzBW7NBJnQJKYBur/ktkLK3U7fbEkbK8vWpQAdu7pkK0RB2XZyTdjAts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708697111; c=relaxed/simple;
	bh=7rEBM2FQFnUKy/TDBhxlTwDH88dsOPrsEvCCdkhvIHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m/GBIVtUctmhHy6Ti8aVZl3h5KZ/HjQGNhynRMVE54oyocyS0bDFsyCNvGwryfYUk7vVsBwtNgkrqqZKE1j2YNlu7pmX/76d9WfBuCqUU4UdXqXMbqSu5Ej7rnSRrMTlVfCSWh4yuq+fw/YkbXVhH1bjmG2MIc2bcSBzTynyY2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=APtMvge+; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qqSFXuap reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1708697109; x=1740233109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PJgk8HeX9ew6QDHmHWj6tm8vQGJ/FpFyILM7zofm9nE=;
  b=APtMvge+UaLJuuvPEs8FFn10/zdn6QwFz/BzwGGBPm/arU6yYJBeD3NO
   LPUio2RZ847IMKwZ+q47Yg/SbiJBpy95yIMuTQUtnpZuu82z+dRvu+zhK
   UxtD9NKyl6eo03sA7dSJtHdBcQb+jxCtzx24rdN2YvKCjhJHV/1K8ll77
   6GZXWJ2JsNLpU9HTiuV1ovjBIcVMss1FqehZW3KDUzSIO2hwRWG+SWBfY
   8HXlF56iRpRvjh23NdUla52cupDUeoXFY6u886RUK3EkhM9oZnqlKumU1
   hv4y9pWhxnc5WI0ruFGmzLpNifsXm/radTYDL7auOBHLnnCDB77fBozIK
   w==;
X-IronPort-AV: E=Sophos;i="6.06,180,1705359600"; 
   d="scan'208";a="35569654"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 23 Feb 2024 15:05:08 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E9E3170276;
	Fri, 23 Feb 2024 15:05:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1708697104; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PJgk8HeX9ew6QDHmHWj6tm8vQGJ/FpFyILM7zofm9nE=;
	b=qqSFXuapY/mZwGEUJwoA/wzYaLAtD05jbZ6mh6ZoP8oRkW7dOFcH8/hDM+8zoV5L4esmkK
	FjcydTHPIc4yVqesIaeFjXbTLJqc5Twa55bib+SoFfvtbZvqqJL2URZ53txQzWCMi9gl1m
	S8E3oIaG4egwI92ivfgt/dyNyY/meY7KblcjwCUcqno5Yw4RFoMIsRNUIGya/BVrFuqcZE
	G3xMIUtCz7B6DObTsrmUyhTBPlh1iykZMBr+2oyjVF/5/pD0tK28a5rNnxAF0QeWCLxUo/
	C1r37zhEVuXbQOH3J2Cm4OwuI7+nGMmgdOL9DfqM2h19OUDFqvV0bahH2Hi+ug==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] media: dt-bindings: nxp,imx8-isi: Allow single port for single pipeline models
Date: Fri, 23 Feb 2024 15:04:44 +0100
Message-Id: <20240223140445.1885083-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223140445.1885083-1-alexander.stein@ew.tq-group.com>
References: <20240223140445.1885083-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In case the hardware only supports just one pipeline, allow using a
single port node as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index 4d5348d456a1f..f855f3cc91fea 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -53,6 +53,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: |
+      Port representing the Pixel Link input to the ISI. Used for
+      single-pipeline models. The port shall have a single endpoint.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
@@ -66,7 +72,6 @@ required:
   - clocks
   - clock-names
   - fsl,blk-ctrl
-  - ports
 
 allOf:
   - if:
@@ -87,6 +92,11 @@ allOf:
             port@1: false
           required:
             - port@0
+      oneOf:
+        - required:
+            - port
+        - required:
+            - ports
 
   - if:
       properties:
@@ -106,6 +116,8 @@ allOf:
           required:
             - port@0
             - port@1
+      required:
+        - ports
 
 additionalProperties: false
 
-- 
2.34.1


