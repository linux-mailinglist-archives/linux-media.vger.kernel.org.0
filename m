Return-Path: <linux-media+bounces-22385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D81C9DF15D
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 15:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3269A281501
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 14:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6942F19F11E;
	Sat, 30 Nov 2024 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="kNP1i5Wx"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14F3198E99;
	Sat, 30 Nov 2024 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732978719; cv=none; b=MyghkJGGUCLAhP0L0MuOb9Cahs9Qc6NCju4FhVYRUB0XbpFQOXph9GGXZImGW+KwqFgvNo/HtJC4uJ0HHTwcZjGOzv5/cJQlRvlBsnD640YmsAhAnAhFq/YpnGBnvgvR9VL3mJg83ElPdWB5G2GZOWyJJJsm8b54CfcxpbQ7hHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732978719; c=relaxed/simple;
	bh=hRHt1lKznXLvZ2Cm50+cd/mXkEiynz1ejTZcgSUzC8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M5ZzQ9dq34+ylBnCKn+tbd/gYwbj+qOJS2w7Md4C2FU/0fZNLm4MjNI4MpJL/dG+g3AuOLCaG9eO/yKJTgqL32mjlVH3JD63dazJ1sNmr0OvrJQN74aeLFaq4wdOY7gn3wWL5MHoNhxXttRHuRnv9c3bFUNy3GSQwroxUQWN/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=kNP1i5Wx; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LBqtIkKqqs3bjj0mz+CKgjkWz2efBS8qbc1Tcg5LZaI=; b=kNP1i5WxNv3Jj6oqGm67tOKT0M
	l5b9i72VFafsO6LBqtqglQeA86VHYbMYweAc3y9BwvGmFiUSzlpKjuV4P17YMkin613UYI0i025eK
	AJz6v67LBD4E8pezHQeOa5s9dau+oat8Pu7wb8/EcA2g5HPRgpUfzxbXo+S4fp40tk8E=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:61203 helo=localhost.localdomain)
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1tHOHn-008ZQH-VJ; Sat, 30 Nov 2024 15:17:28 +0100
From: Matthias Fend <matthias.fend@emfend.at>
To: Michael Riesch <michael.riesch@wolfvision.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dt-bindings: sony,imx415: add required clock-names property
Date: Sat, 30 Nov 2024 15:17:15 +0100
Message-Id: <20241130141716.1007115-1-matthias.fend@emfend.at>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

The imx415 driver expects a clock with the name "inck".
Document this in the bindings.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 .../devicetree/bindings/media/i2c/sony,imx415.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
index 34962c5c7006..e110b39bb391 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
@@ -31,6 +31,10 @@ properties:
     description: Input clock (24 MHz, 27 MHz, 37.125 MHz, 72 MHz or 74.25 MHz)
     maxItems: 1
 
+  clock-names:
+    items:
+      - const: inck
+
   avdd-supply:
     description: Analog power supply (2.9 V)
 
@@ -76,6 +80,7 @@ required:
   - compatible
   - reg
   - clocks
+  - clock-names
   - avdd-supply
   - dvdd-supply
   - ovdd-supply
@@ -96,6 +101,7 @@ examples:
             reg = <0x1a>;
             avdd-supply = <&vcc2v9_cam>;
             clocks = <&clock_cam>;
+            clock-names = "inck";
             dvdd-supply = <&vcc1v1_cam>;
             lens-focus = <&vcm>;
             orientation = <2>;
-- 
2.34.1


