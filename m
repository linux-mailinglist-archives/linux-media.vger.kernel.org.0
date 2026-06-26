Return-Path: <linux-media+bounces-65708-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bi9oCgZsPmpeFwkAu9opvQ
	(envelope-from <linux-media+bounces-65708-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:09:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E16CCD71
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:09:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=OJS5w84e;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65708-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65708-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33C12305AA43
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B4D3F5BED;
	Fri, 26 Jun 2026 12:08:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED9F3F4824;
	Fri, 26 Jun 2026 12:08:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475701; cv=none; b=dewA5tinV1vCMoK4P65/f+feAfAStIQYlXmGiIiPwInuf1+enn3vNHKX6jhHPGSNN7TeartMmEXdnXrZvcP1zgpV6TzkP4Yd4ym5iWRpSCvB5qXepE+KWDxEiAXu14t6OL10qkp5kHZWCxyYigCdz7GDXcoLAOXLtNb6/zKRZuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475701; c=relaxed/simple;
	bh=RcX8vwnJzooOlmy2OhVFVi8CeSxoAK4FBT1/5Pz8DIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfzos2WCc/Gn+FesH00+1nHTPom9fieJoj0zydKCSVutARx4JiQO2NUhZix+CdDbcpsvFsDLAJYmcX7rECR1zA7jV8OvcFZH7s/3xXHBGswMVkO/8wM5kHt9+aUhSimVJCDzcnTGhDGACZCa3eT95ai+JT6Ha+ZPpi6gecLPEmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OJS5w84e; arc=none smtp.client-ip=213.167.242.64
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB7371AED;
	Fri, 26 Jun 2026 14:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782475647;
	bh=RcX8vwnJzooOlmy2OhVFVi8CeSxoAK4FBT1/5Pz8DIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OJS5w84eOPPiqOiyysiX/Bk/LyCciNLpR2xHBJqDfV5PycDob2nJNeMHN63zLU70S
	 s6nvOxbYIWxmTk/uVbIM1gjFMHhovzoHkIaMCgKrRosFR/4BKsp5/RHdVXB4OajJ0A
	 Qi/ycolkWYX9x26dwvExmGsyYlWi6utRhDeudxDo=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 26 Jun 2026 13:07:57 +0100
Subject: [PATCH v2 5/8] arm64: dts: freescale: Convert to new media
 orientation definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-kbingham-orientation-v2-5-47178be927b4@ideasonboard.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
In-Reply-To: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
 Matthias Fend <matthias.fend@emfend.at>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782475679; l=2134;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=RcX8vwnJzooOlmy2OhVFVi8CeSxoAK4FBT1/5Pz8DIs=;
 b=veyj1mNZFp7L8yHeQ7h2FeR/jkWGLEXTaYAYqZn+YtC+z7BBjqnV+bCkA6FxPq7mtY6rrRtFh
 FKNDAI4f8dmCMyozp2urajMZaHKv2oMh+IhBZi8F7KHpJiEuMTxFxjJ
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65708-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,ideasonboard.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de];
	FORGED_SENDER(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux@ew.tq-group.com,m:imx@lis
 ts.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kieran.bingham@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC6E16CCD71

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the freescale/NXP device trees to use the new
definitions.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso      | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                      | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
index e5a2b3780215..7b44ae0f19b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 
 #include "imx8mp-pinfunc.h"
 
@@ -47,7 +48,7 @@ camera@10 {
 		VANA-supply = <&reg_cam>;
 		VDIG-supply = <&reg_cam>;
 		VDDL-supply = <&reg_cam>;
-		orientation = <2>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		rotation = <0>;
 
 		port {
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..178cfad93483 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -8,6 +8,7 @@
 #include "dt-bindings/input/input.h"
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include "dt-bindings/pwm/pwm.h"
 #include "dt-bindings/usb/pd.h"
 #include "imx8mq.dtsi"
@@ -1116,7 +1117,7 @@ camera_front: camera@20 {
 		vddd-supply = <&reg_vcam_1v2>;
 		vddio-supply = <&reg_csi_1v8>;
 		rotation = <90>;
-		orientation = <0>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 
 		port {
 			camera1_ep: endpoint {

-- 
2.52.0


