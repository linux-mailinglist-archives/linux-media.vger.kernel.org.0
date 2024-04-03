Return-Path: <linux-media+bounces-8542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB4C89739C
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 17:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95B551F28754
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 15:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B852152164;
	Wed,  3 Apr 2024 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="kA1ORBz6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta76.mxroute.com (mail-108-mta76.mxroute.com [136.175.108.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286D51509BD
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712156950; cv=none; b=f7o27eB2xJy+1cv6BUkm4k0FYlFgTPn1cROmNej9kmU6iuQoiGJcF+dr4bi0tWs8s/GnCMQIMFW4hD01RftQgvj7wWEXwQiLdPvB/p4Lrdg/zNuKeUi9LeRI6dlnoylKfMQXsgAxem8QiWJArrSMlbJ0L/sIydZStv4lo8PVuWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712156950; c=relaxed/simple;
	bh=wIpVOMNTepZOMW3UvbZH0rdRDmA+UQLMgr2GlfwRQGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMQghM9L8TFeEi63ZmNtWbLeoWwH4lqjUQSRY5wDXQcyp8Y/ihEKCT9B0IVmVSNIUeJZfaNE7b921IldHMNvstkBeJe5RHTnq4x2eMHbhpaYzs7g7kgdgQM/2ZV3w3a43rHVK9JgdGJtoknAU0/RWPxV66bAFZKiV90+WNcMq54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=kA1ORBz6; arc=none smtp.client-ip=136.175.108.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta76.mxroute.com (ZoneMTA) with ESMTPSA id 18ea480b8510003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:08:03 +0000
X-Zone-Loop: 30761c335d35c49764006793e97330f6b36b0c3e5ff1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+hno/NO5DLefJIOqoOH2kmnTpizyU8GDGwSxBdTiTxg=; b=kA1ORBz6pfHHAqSDL9oc6Bnp9o
	ektfpP8ACACEUehYTzqVKk5hoQ5s2j+4+K9osj+aBbYHGNfnAYZo+3MK9DoiyCBNDbXEp5GtFkM0f
	Iz/dgW5juy0V3OvJfzkwOriPQLHG5GazMSMcoJuxmsKrNoje3ChMBqlPerDNYhAGzIfDgyOE6iNyP
	3H3wvWhKEQ8LMQK3/P5dZLaoD48ZaKkJ4rmpMGd+xq+3AwCPylLEhaBAuKgN6UnAwtF1a95NoBhNx
	aXkhC+1upEF8WKoydrMT2JHjeLPYpepESAYT0tK/FOmAWM61zQjAj6XojaitK9ktHXMlYld53wAnf
	OmGrZV4A==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>,
	Ondrej Jirman <megi@xff.cz>
Subject: [PATCH v3 22/25] dt-bindings: media: imx258: Add binding for powerdown-gpio
Date: Wed,  3 Apr 2024 09:03:51 -0600
Message-ID: <20240403150355.189229-23-git@luigi311.com>
In-Reply-To: <20240403150355.189229-1-git@luigi311.com>
References: <20240403150355.189229-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Luis Garcia <git@luigi311.com>

Add powerdown-gpio binding as it is required for some boards

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index c978abc0cdb3..33338139e6e8 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -36,6 +36,10 @@ properties:
   reg:
     maxItems: 1
 
+  powerdown-gpios:
+    description:
+      Reference to the GPIO connected to the PWDN pin, if any.
+
   reset-gpios:
     description: |-
       Reference to the GPIO connected to the XCLR pin, if any.
-- 
2.42.0


