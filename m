Return-Path: <linux-media+bounces-51582-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGwsMR+bd2n0iwEAu9opvQ
	(envelope-from <linux-media+bounces-51582-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 17:49:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72F8AEAA
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 17:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21A33301E304
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 16:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A36349B0A;
	Mon, 26 Jan 2026 16:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gErd8LZp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804B334A786;
	Mon, 26 Jan 2026 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769446075; cv=none; b=s5tSNzTdhLf3uCUCeYIUyoMopBJpTAOcaNDJ7ZLt3cYjLwzuq1HRuxKhVoH3ldP80eXfuAdf6mJW8vZ3Zlp1LnM1tnIvy1Q9dO1fq4B1sGHswZE9twWfalLqA///puwtEWNrkr3bBN+GZJb/QJvs2eP8v/twCXJw4+n2tdsuWKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769446075; c=relaxed/simple;
	bh=OTgN+AOgoWAXyZjcPvOX/MFtQjNRVU5usZ1XNPxTrto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VbQoyHdpeWz9NIS/Mmy6gMj+MmI5IlvxIdZHo0F55WN4NYPGAtztEQmtcmEEs9YKE5Z6RzauUwUighrMdUHZrNPpIYyA+YqjQd2h+3UOaqU/MeHZqlfm/zY57mb6PLhYAfRHDm2w+SwT1ajbiAOUP08+q3peia/f14JqvkEasm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gErd8LZp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86717C116C6;
	Mon, 26 Jan 2026 16:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769446074;
	bh=OTgN+AOgoWAXyZjcPvOX/MFtQjNRVU5usZ1XNPxTrto=;
	h=From:To:Cc:Subject:Date:From;
	b=gErd8LZpO5mnHe4QTq3JaXLDMcIO0Qvh7d0yzXw2Vlt5xjkum5A8fqyAj8CeZ0p0S
	 S9pVAXmkr28yvW9DSiBNMFXULNCcW34EwKisF1i2F6rHUnyHDPjbz/J1GkVasmW8HQ
	 GxNn19iw7dXyWE/LkOiq+Y7uEdRyQCkPWiJJ5/yPduqz2196ely+CFRorga3Lw5LHh
	 e8e4iq/Dju5KBxWCFWEO7zuh9EdIM2vMGLnmzxowevpkhBy8PaOpyFUmaLZBukrJ2S
	 aq+MqhzXYi4F0rYtsLbuD850v8aoM9wNxsyjVf5V7uyscdH1+ePuzL0xcX+yVxYgy4
	 Fj2KTAmcpnB9w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christopher Ruehl <chris.ruehl@gtsys.com.hk>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Vincent Huang <vincent.huang@tw.synaptics.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH] dt-bindings: Fix emails with spaces or missing brackets
Date: Mon, 26 Jan 2026 10:47:22 -0600
Message-ID: <20260126164724.2832009-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_TO(0.00)[roeck-us.net,kernel.org,gmail.com,samsung.com,mobiveil.co.in,nxp.com,google.com,gtsys.com.hk,zx2c4.com,ew.tq-group.com,tw.synaptics.com];
	TAGGED_FROM(0.00)[bounces-51582-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,gtsys.com.hk:email,synaptics.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,zx2c4.com:email,devicetree.org:url,tq-group.com:email,nxp.com:email]
X-Rspamd-Queue-Id: 6A72F8AEAA
X-Rspamd-Action: no action

Fix email addresses with spaces or missing brackets. A pending
dtschema meta-schema change will check for these.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml    | 2 +-
 Documentation/devicetree/bindings/input/syna,rmi4.yaml          | 2 +-
 .../devicetree/bindings/media/samsung,exynos5250-gsc.yaml       | 2 +-
 Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
index 3d14d5fc96c5..7b38f2182ffa 100644
--- a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Sensirion SHTC1 Humidity and Temperature Sensor IC
 
 maintainers:
-  - Christopher Ruehl chris.ruehl@gtsys.com.hk
+  - Christopher Ruehl <chris.ruehl@gtsys.com.hk>
 
 description: |
   The SHTC1, SHTW1 and SHTC3 are digital humidity and temperature sensors
diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
index f369385ffaf0..8685ef4481f4 100644
--- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
+++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
@@ -8,7 +8,7 @@ title: Synaptics RMI4 compliant devices
 
 maintainers:
   - Jason A. Donenfeld <Jason@zx2c4.com>
-  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com
+  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
   - Vincent Huang <vincent.huang@tw.synaptics.com>
 
 description: |
diff --git a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
index 878397830a4d..9196cf5dac0f 100644
--- a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
@@ -9,7 +9,7 @@ title: Samsung Exynos SoC G-Scaler
 maintainers:
   - Inki Dae <inki.dae@samsung.com>
   - Krzysztof Kozlowski <krzk@kernel.org>
-  - Seung-Woo Kim <sw0312.kim@samsung.com
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
 
 description:
   G-Scaler is used for scaling and color space conversion on Samsung Exynos
diff --git a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
index d286b77921e0..8f5d33050348 100644
--- a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mobiveil AXI PCIe Host Bridge
 
 maintainers:
-  - Frank Li <Frank Li@nxp.com>
+  - Frank Li <Frank.Li@nxp.com>
 
 description:
   Mobiveil's GPEX 4.0 is a PCIe Gen4 host bridge IP. This configurable IP
-- 
2.51.0


