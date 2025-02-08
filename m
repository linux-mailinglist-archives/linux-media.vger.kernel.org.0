Return-Path: <linux-media+bounces-25834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6CDA2D866
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 20:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DBBA3A6E1F
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 19:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7494F1F3B98;
	Sat,  8 Feb 2025 19:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xy2mGjH9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE03241116;
	Sat,  8 Feb 2025 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739044672; cv=none; b=eOa41otUbU7ysDUtzW9mdry0saSgJR8suNULCFr5nY3zj4F1lnCuC+C1y5SYPUVnCVPHIob+SfN3037WMWT6lbKTHoSeCR8wMiiU62uYT8FCd/4ttbpQ5/oX8GLBYfG2Aek6poJ9Oeegfu35k7IQDUzIok9KwjVQ0C13lWIfEtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739044672; c=relaxed/simple;
	bh=PvwFpXaUnpO23SDgYEtwOOVBWmzeucI98/TjLKE0QAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MP15FTCMQmFdxc6cDM8IXSOe3K0Db6kwLcSPgxPdbiS6Gu3rixDTqBbyAgrMK4tF/bnlBPn9zMCDdu/cV3ol2S0/6Jj9VydBd111CGKySagQxSgkPVb1+MR2m79g7uEkrp4Gj/K5Xqe8l5VNF/HKj2pXllLD/YABTG5owDB/jBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xy2mGjH9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD67282A;
	Sat,  8 Feb 2025 20:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739044256;
	bh=PvwFpXaUnpO23SDgYEtwOOVBWmzeucI98/TjLKE0QAw=;
	h=From:To:Cc:Subject:Date:From;
	b=Xy2mGjH9oxsqA9Yvq1hAgYEize8+OE2aEIBburtDPwDvq/5YjRCr9cFMfu8sDUtzy
	 nfTojljM53MW+4yVYNPFr0uEJl0vf/8P7mQFFKND97AA7rP4g2tT4xzrpTFcE7qK7Z
	 12Tbg4MYIIi1Zdwdg8XN9Kwara7cBkZcT03h9YSY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: media: imx219: Rename binding file with vendor prefix
Date: Sat,  8 Feb 2025 21:52:02 +0200
Message-ID: <20250208195202.23164-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imx219.yaml file is the only DT binding for Sony sensors that
doesn't start with the vendor "sony," prefix. Rename it to
sony,imx219.yaml.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/media/i2c/{imx219.yaml => sony,imx219.yaml}        | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml => sony,imx219.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/media/i2c/imx219.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
index 07d088cf66e0..8b23e5fc6a24 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
+$id: http://devicetree.org/schemas/media/i2c/sony,imx219.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
diff --git a/MAINTAINERS b/MAINTAINERS
index 3b62cfc61203..58f193d1aaec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21994,7 +21994,7 @@ M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
 F:	drivers/media/i2c/imx219.c
 
 SONY IMX258 SENSOR DRIVER

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
Regards,

Laurent Pinchart


