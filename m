Return-Path: <linux-media+bounces-37346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC21B00A62
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 365127BB998
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB1D2F1982;
	Thu, 10 Jul 2025 17:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eXv1n5Gu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEA02F0E4E;
	Thu, 10 Jul 2025 17:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169729; cv=none; b=IfjaIcT8MsUz04uxAM+xDX2VW5t/alrxUmglxywDBQzqJ/LBhFFR+xIutaOnuhHzT7yzHBIUK1ttNQtROPJt1ak4kBlxYWUE7+VCpEqYnkHCsTJmhpfyC/DlZuVcUn7txiS/lI9azLWDwWHSelMgn5ddfiaqdGNFChz0RXrL3K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169729; c=relaxed/simple;
	bh=8v1tv97UXRXCoHDyi0xPUsTkqBH9HgveE/nj/4t1KVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAP+rYkf8kVf9ZdBrhhYa+rQIRRpTuRGWiF16gJQdWXHdcSTKx3YvBld0TN8PmaSUcev4vwL33/9d3Z+yhLJJhQUSGtNDCkn7iNA2qh8G0Ex7xstQ84XLv2L4M7gN2l/nOMFXm+piSgKdvxf4ZejT1DogRskxoBtkrsXQwpa8KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eXv1n5Gu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 875D4111D;
	Thu, 10 Jul 2025 19:48:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169694;
	bh=8v1tv97UXRXCoHDyi0xPUsTkqBH9HgveE/nj/4t1KVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eXv1n5GukKFzcuUEPCmjZtCG5bIqh31GUdjo5B8tedE/wptm9++tZ0bkzopB5Ye3B
	 AE6rurMgyQSerSdd6jIXBVygT+FOugvLChrzuyleC3Tsg797Rg/6VVFJscjSlf5fu7
	 5gtIBHp7i94hTulpd/DMbCFREA9Sp4/P+bNVjzHs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 03/72] dt-bindings: media: imx258: Make clocks property required
Date: Thu, 10 Jul 2025 20:46:59 +0300
Message-ID: <20250710174808.5361-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sensor requires an external clock, and drivers need to access the
clock to retrieve its frequency in order to configure the sensor. This
makes usage of the clocks property mandatory for a system to work
properly. Mark the property as required.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index 421b935b52bc..d105bd357dbb 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -81,6 +81,7 @@ properties:
 required:
   - compatible
   - reg
+  - clocks
   - port
 
 unevaluatedProperties: false
-- 
Regards,

Laurent Pinchart


