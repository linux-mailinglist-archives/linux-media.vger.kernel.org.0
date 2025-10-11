Return-Path: <linux-media+bounces-44197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA6DBCFAD2
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 20:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82FC44E4045
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 18:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99BF27FD48;
	Sat, 11 Oct 2025 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tvieORiU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QBi/+FcS"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EBD42A96
	for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 18:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760207626; cv=none; b=rA+GggoH4RNDliBzt4oavHw9/EQ02tDq7GgmOQs9ILfrdCurkSg48p2FYuJMAcy6+S8JPwrz4Pg1rDGO1Z77vN8EqJQV+gsaLVFicPgzRWSat0omyXOOJ5qVobUh1p8zrVb4ckqTuRE54lMCUAeyHy6ZYBBkbvy8mkJMdj3qsZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760207626; c=relaxed/simple;
	bh=+9TgcGthCUhP7ja9L6QYBgnd98cSNOQvu5TnoRonK8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzlFMNpnifF/a/xm+/J6jqY9U4WRu2h2buEykYMMk7f29cdt+sk/dBbY72+/q3Gbwvk+uhnNfvyddeK8Y4S6OsaoWecdpqEy5eBpLDab/FH9ORdejAzKfIAM9ESzM7REcMe3MW2BzZgKNZjIwPxJnaR1FCFa5F9bZhwF5bgRP8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tvieORiU; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QBi/+FcS; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ckXLY5pVpz9stX;
	Sat, 11 Oct 2025 20:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760207621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vdgUFtkm94mHMBHalEL+1YJRTb25XyzuTOkQ6dZPhg0=;
	b=tvieORiUSpm+Ij/BMeA1PDJxzh9FRbKW4uZQKQkqMh7ZEGiLU+LqEw39F02RO9zeWjc0Og
	GOXipSQ3M5UMIqxVePTTKGMY2KbYSEKXSegulyMejZ3yfe7TB0fBn3Y0YfPq8QD3N+JdO3
	6VM486SZI9folujOv1fLvpjxsTG8xs8rQO6e6a1uzcd8BYOXjpyx+e1wo3KSzimfHckUhv
	Rp5VBYY97WvJPr1t4KByyhQeXnBcKZ+FRkgTiMJnBTi+vcB97Xkv/f2emuDnl6JFzUHarC
	MDPxOvilfdm+qWScvCl7qiuZqEWrpK0OoaZj1nPdmEIN00I5sCvqDkPWU5G0rA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760207620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vdgUFtkm94mHMBHalEL+1YJRTb25XyzuTOkQ6dZPhg0=;
	b=QBi/+FcS8hxT72VHRf+1mvhqm0ZKUlL0BLSASB8vkTCHXSOoS5+wa18l8jctHiWDTsYSv+
	lT5PQTGmyzJHyme8ksiBgN0aQ/mxelnXw+91JLvpO8RMsMWLp8hjrPVXrTBkXWtGddgTKm
	n4aQ45mkIuXBEioFJ2vOEGIu2NlkYDsGXYZg8K8dvLPPKKh8ZTt01P/KseRomdJWDIR3Xg
	j5HP8IppXQ2TTsJ9nS/adjStX8VLYjU91bd88nBPcoBiCtRSRiQCnfmACVkoLzRioza7sE
	YMTxbofk8MKP4Qii+dEp9k2APyfXkR8NnBGdOBmezuxPxbIFUIz+axSyl4LkaQ==
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] media: dt-bindings: nxp,imx8-jpeg: Document optional SRAM support
Date: Sat, 11 Oct 2025 20:32:25 +0200
Message-ID: <20251011183306.163564-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gcxiegt8bjoymzjuz9h7zp6547zejcc5
X-MBO-RS-ID: 44f7b4e555e363a6778

Document optional phandle to mmio-sram, which can describe an SRAM
region used for descriptor storage instead of regular DRAM region.
Use of SRAM instead of DRAM for descriptor storage may improve bus
access pattern and performance.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ming Qian <ming.qian@oss.nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
---
V2: - New patch
---
 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
index 4cba42ba7cf72..e3170647f44db 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -55,6 +55,12 @@ properties:
     minItems: 1               # Wrapper and all slots
     maxItems: 5               # Wrapper and 4 slots
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Optional phandle to a reserved on-chip SRAM regions. The SRAM can
+      be used for descriptor storage, which may improve bus utilization.
+
 required:
   - compatible
   - reg
-- 
2.51.0


