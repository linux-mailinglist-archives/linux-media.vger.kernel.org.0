Return-Path: <linux-media+bounces-5797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEE1861394
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 15:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69AFE2835E4
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 14:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAC581AD4;
	Fri, 23 Feb 2024 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Vmr8WArW";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GNe9c9Ll"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EF481ABE;
	Fri, 23 Feb 2024 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708697109; cv=none; b=LEsKaIk4JPp9fAa/MXZK4r1Y4F6b/jmvK67CSxor9voW2KWJxIFC5xzlhUqkVEvA8OWzpN4hP5kgCDwx4VTlp/6vXPk3PnxQ1go/gtIs0XieTp1mO1KHt6qgKgYEZ1GUGuCR8ENQyLvLOd1/LTNzRcX+F7a6yrFtz+g2K5QXCbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708697109; c=relaxed/simple;
	bh=fB5PeXc5CexeB7CHecymkgDsEYNaEC13WDmWaXmLjA4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rggHkR/0AS6GyOytGMWsGuJMFjJ7chhbyBTqxHWyAMgSg2NLRI19BtATAxqJVk6euVYIfaM1YUAZsLQTojNAc2mAoz954C+n3GVsriO31ZF91KpFWKQQyaSms+fhalz2pZSJuLfMFJqzB+IKM/0x5QroXUt3gQooUK7Rx0UlsZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Vmr8WArW; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GNe9c9Ll reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1708697106; x=1740233106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jfF0hT55fFDC+MjpOYahMnUfStGgXDfxb6tDpyqW6ZA=;
  b=Vmr8WArWw3euDE4rqCDK1SdVhw5nXRNVM619E1R2guvCsScV1XEF5Jbz
   pwMZUKwQPR/uGhJwCWSwo9W+6YvXPlDYU1dcRydKPKp7w9O5MMzLUvmv4
   VCFw3qWhAJ7OSwz9V4aU75ftJISt34ClZJPbqtkyDeQ2HUuLM8gaZHngo
   daMF/tBbKcakVe7rI3enHuIdTwB8PiBOLvke09kccC92+rxJlMBzk4NFp
   ik15nNmWBNLOvBCrLGy+ptwCj6qGCZF8sGblvjJmuVFy4aJshTta+vFge
   8pj24VyUY5LWDSst8qzCrvNBnY8DpHGMDff1kj0yP2i6P6LUC9n7XvxKs
   w==;
X-IronPort-AV: E=Sophos;i="6.06,180,1705359600"; 
   d="scan'208";a="35569651"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 23 Feb 2024 15:05:03 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD616170698;
	Fri, 23 Feb 2024 15:04:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1708697099; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jfF0hT55fFDC+MjpOYahMnUfStGgXDfxb6tDpyqW6ZA=;
	b=GNe9c9LlAarwk9ItXqB1LM7/csf6gT8sK7wVp59YJasNsXd+bPlfOnQzzoob7JtJVtJ3ta
	1igDkEWW8vd2vgba3r6ogTDfDdIh2QZOII+lNRh760lnwl1uTpZlHCC9eUrHPGFqsokJPT
	qfZaVS+LqlM3IbGtyVltwRayiatbNHO+L8NK/3uI/OuNGkl3YIobRg15rzxPH+LZMVh7li
	4FVK31E0BnfNWO3GMY8dEWRWonmIJ57kCSx+vjLRA5rHKK+kXN6GOwhORtO4iVZWAdmXE1
	t+vHiaSrszP4dnKeusSjuJQF8jc0PN1EYBArM75vQQpF8xAjI1YYW6f2V7B7rQ==
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
Subject: [PATCH 1/3] media: dt-bindings: nxp,imx8-isi: Refuse port@1 for single pipeline models
Date: Fri, 23 Feb 2024 15:04:43 +0100
Message-Id: <20240223140445.1885083-2-alexander.stein@ew.tq-group.com>
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

In case the hardware only supports just one pipeline, explicitly refuse
port@1 in ports node.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index e4665469a86c3..4d5348d456a1f 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -84,6 +84,7 @@ allOf:
           properties:
             port@0:
               description: MIPI CSI-2 RX
+            port@1: false
           required:
             - port@0
 
-- 
2.34.1


