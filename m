Return-Path: <linux-media+bounces-45032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D0DBF1028
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 14:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D76B54E25E5
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF86530506F;
	Mon, 20 Oct 2025 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=erick.setubal@gmx.de header.b="Pngf5yUv"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBA625FA0A;
	Mon, 20 Oct 2025 12:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962347; cv=none; b=IF3InIgzH2Oq6pd+jd6JCcVaxUbH5PUr3pzHQNvNbG3PRDTZRQNVGkVE5xvlWdCwN02g7zvm8ymhaOcC891pRZXgT+R0BaogxsBGfA/cG+zpLb1IVKJumu7vi/0KtbtLjK2hpV8Jg2vgy6kdj04s70/QmBDatnV9o8EI8otOXAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962347; c=relaxed/simple;
	bh=sRJE63HfLX8PFsK9yU+kQYMGEML2Dx1sORfe6+DgQI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T8J6Gpt5TyBjXwsp+Ou7jjBnB9+ISLjo9S6XWL3golE/9KY52hgzc5QU1wNFFMGNAH8yefFDlrTH+FA+QwLWLXFE8MYhndrnx7tS345JFshAlTOXYShY83lPB5v5kfRDAhJHGNM0PghmroiEqHYqqW1IzwwnhKounphA6k90P0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=erick.setubal@gmx.de header.b=Pngf5yUv; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1760962321; x=1761567121; i=erick.setubal@gmx.de;
	bh=xK9cZNOEO/GZXxOsWVqr+Cv29qsxOBBA2kPhT65U7Ck=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Pngf5yUvwEYHdpuDcf0XIjzifBASAWiyovQnntHxNYL09mVxb0mvee09bjxYjxz+
	 CAHWWBM8wfO+VDqWbAVhyojzev/MHPA5r4KSU9E9EZe2Cx2YMHYNPhRl7GJiWo29o
	 JcMeiM7wFXmiwg3mpT48omC3zXp9kSlt+MZIS/8v2z8pgPp8pnAi38lVtO9lObqrA
	 LpqK5iHuC19VcAB/3kN2UMZ/Y8HYOlefb9wTzLcR1qPcOVCNNuZjHvv0dIanBuLVu
	 372YXe3PWviyJnZi8w8x0AsE5Lap3/iprCw1qUpw3QYVhJfvnypAR0B94oE3656N3
	 lzWJCbpGUxjg4pguoQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from zolxn00301.speedport.ip ([84.145.119.168]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N1Obb-1uDKB93NZj-00wPEx; Mon, 20 Oct 2025 14:12:00 +0200
From: Erick Setubal Bacurau <erick.setubal@gmx.de>
To: mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Cc: Erick Setubal Bacurau <erick.setubal@gmx.de>
Subject: [PATCH] dt-bindings: fix redundant quotes on fsl,imx6q-vdoa.yaml
Date: Mon, 20 Oct 2025 14:11:45 +0200
Message-ID: <20251020121145.190020-1-erick.setubal@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ud0Ywg0PFxpV1uDULxVWXqq67gwg0KOWfiadAQBr3EmQdgUAtms
 zyUHQSmGxbjav9rIsicYZkVoId5t6GX3YooxLC9aBDJ2RSyDiszjNISppKM26OLja9cJ1NT
 3IJcjF6p8SR1MFRTGcLliQr0+E3UB3evopVL+Zu3/8tR4cFEgZe0PKzWwQdtzG4th5w85w+
 BTzGy810qJBsMua9OAxuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GMT/1JwuHGQ=;RjqVBilX3taRAv0Om5ToNnEWsog
 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
 FYoQA==

Fix a dt-schema error: `fsl,imx6q-vdoa.yaml:19:12: [error] string value is
redundantly quoted with any quotes (quoted-strings)`

Signed-off-by: Erick Setubal Bacurau <erick.setubal@gmx.de>
=2D--
 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml b=
/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
index 511ac0d67a7f..988a5b3a62bd 100644
=2D-- a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
+++ b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
@@ -16,7 +16,7 @@ maintainers:
=20
 properties:
   compatible:
-    const: "fsl,imx6q-vdoa"
+    const: fsl,imx6q-vdoa
=20
   reg:
     maxItems: 1
=2D-=20
2.43.0


