Return-Path: <linux-media+bounces-39639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12588B23AF6
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7624262444E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFA52DCF47;
	Tue, 12 Aug 2025 21:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gz1KIIX5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C37B2DBF46;
	Tue, 12 Aug 2025 21:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035209; cv=none; b=QttU6IncNIDikH9k7CDdHu8LzgrINv11HUXcAghkD1pVIb6pKyH7d6OwkQMKapm+Ny2QDsAPqef+KkffG/sTF5dqVKjcyZXhA4Ww942wSxeoJHQXl9RGcI3j0dEvuKAcFaIkse9WNFPT9sspbtOwluEwtWsoYwXp19a6VyoaO9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035209; c=relaxed/simple;
	bh=kG19OgtVLGbWqppNztqu8vOUFAK5zQeD3Vl0p4FpPVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=StsjIpYXlweoxIqXdT8ruR/+UZFjKcyXZXeGu2p+cwT9RVhACCPDoBKOid/zXFZQzPKQ4uBJhmBBU9bOFRsw7UTvxfmULGwPAOLk7nfPDLp1uvrJrHJOppAUJlKbDMecEuT0DCUgu0B8SW+igO36uGVBLZXxWarHcUTM1OfXORQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gz1KIIX5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9BF621123;
	Tue, 12 Aug 2025 23:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035150;
	bh=kG19OgtVLGbWqppNztqu8vOUFAK5zQeD3Vl0p4FpPVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gz1KIIX5hB9sU7fRPKIwPDYz6MMKKqwZ27Te6N6tw3gWEQYPeM2mCBQQRb8DipG03
	 f9ZYkw4SpO3l7jEIJinkiA21gj/bm0nRA4pbp1lM7cWIYXmDFu1Kn5LmYIcEPMPTRM
	 oNBQOOeL8Sa6j5HD0LDXAkp0hK8juCTqS5t0sT2o=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 03/72] dt-bindings: media: imx258: Make clocks property required
Date: Wed, 13 Aug 2025 00:45:11 +0300
Message-ID: <20250812214620.30425-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


