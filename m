Return-Path: <linux-media+bounces-65820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o/B6M/31QGpCjwkAu9opvQ
	(envelope-from <linux-media+bounces-65820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 12:22:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE066D3978
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 12:22:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=p+0kMGCB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65820-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65820-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E9CC30160EC
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 10:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243E23A1695;
	Sun, 28 Jun 2026 10:22:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2A33446CA;
	Sun, 28 Jun 2026 10:22:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782642155; cv=none; b=dwCFvA0N10BLN37XalzKFGLE4p4X9d8SX0kBp0WL+sU7Lb96ZpgB8W6uGcNiqB2GAoGWJYsrAsVZDg6YYUB70ontyvPnYkDWDi9L1q5kQ+soSXAPunXbRlqpgepVK8w0gmSYp4JIHFWu20gq/yV8SbKh5dppEme/Lj+nJjrZXSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782642155; c=relaxed/simple;
	bh=pSsloNoctZ8KZdtQMoBMTiphM6yVThkqQuPMFzEH2PI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=icfBhVIYSBzoi8MEyixIOJRDJhOry5Wm2tw0+i45GOl2MtyklmDKUJYGi6irlSjprQdsdnPxFzI32funoe9iedoY7a17IBnXOdCzHW3160WfkooXf6dagZuXy2xcnhz087sJiDjUiIKz1H0VO0MszHBUZBf2XWQZ3yEZUMYn8Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p+0kMGCB; arc=none smtp.client-ip=213.167.242.64
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 394B134;
	Sun, 28 Jun 2026 12:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782642098;
	bh=pSsloNoctZ8KZdtQMoBMTiphM6yVThkqQuPMFzEH2PI=;
	h=From:Subject:Date:To:Cc:From;
	b=p+0kMGCBDHSdrMRCTYhGwKrbD/lVOCLOVqbLnE/Z8+r4xy36LIXysHfmItF+k60Nu
	 grjX8hLayTsJT7xg1Tm+ykqzPWkvNDNSUz6SvkXezHR2t1L1Bl18OxNsCDb0DySnis
	 0aXBROKTASUubfqalaG1RQhwnEvUtpRe8sgYywvI=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 0/7] dt-bindings: Orientation defines
Date: Sun, 28 Jun 2026 11:22:15 +0100
Message-Id: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANf1QGoC/22NQQ6CMBBFr0JmbU0dsQVX3sOwaMsAE0Nr2oZoC
 He3Epcu30/e+yskikwJrtUKkRZOHHyB86ECNxk/kuC+MKBEJZVsxMOyHyczi1A8n00ugkBpBic
 Hq9qLhqI+Iw382rP3rvDEKYf43l8W/K6/IKr/wQWFFLU+6cZSi9rWN+7JpOBtMLE/ujBDt23bB
 4DwALO/AAAA
X-Change-ID: 20260608-kbingham-orientation-20afc0fb6957
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782642139; l=3899;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=pSsloNoctZ8KZdtQMoBMTiphM6yVThkqQuPMFzEH2PI=;
 b=0aU7sZbphb8cHLIWND7oWOf664qmdxaVArY7DgYx+/th2NpgB+11g+VRfyLA43pZiNPFZd0I0
 xjGy3mD/gx+AtmBrOqJFLbLyrMn835bR+0ScSwTXbvUDKlwj/UYe6H6
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65820-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux@ew.tq-group.com,m:imx@lis
 ts.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:conor.dooley@microchip.com,m:vladimir.zapolskiy@linaro.org,m:kieran.bingham@ideasonboard.com,m:konrad.dybcio@oss.qualcomm.com,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,ideasonboard.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de];
	FORGED_SENDER(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EE066D3978

Add a new dt-bindings/media/video-interface-devices.h header that
initially supports the Orientation types and convert existing users
throughout the code base.

v3 collects tags, and fixes the typo, but drops all hunks that do not
apply on the media-next tree so that these changes can be merged. Once
the core feature is accepted a second sweep will convert remaining (new)
additions of the orientation field.

v2:
 - Now expands from the original v1 "dt-bindings: media: Add macros for
   video interface devices" to update
   Documentation/devicetree/bindings/media/video-interface-devices.yaml
   and extend to actually change all users to the new types.
 - Link to v2: https://lore.kernel.org/r/20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com

v3:
 - Fix the arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi 
   MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
   - Though this patch is dropped from this series to post the main
     integration through the media tree.
 - Drop (temporarily) changes to:
    - arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
    - arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
    - arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
    - arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
 - Non applying changes will be re-posted after the core feature
   lands in linux-next, or after those changes appear in media-next.

---
Kieran Bingham (7):
      dt-bindings: media: Add macros for video interface devices
      media: dt-bindings: video-interface-devices: add video-interface-devices.h references
      dt-bindings: media: i2c: Utilise video-interface-devices enums
      arm64: dts: freescale: Convert to new media orientation definitions
      arm64: dts: qcom: Convert to new media orientation definitions
      arm64: dts: renesas: Convert to new media orientation definitions
      arm64: dts: rockchip: Convert to new media orientation definitions

 .../devicetree/bindings/media/i2c/hynix,hi846.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov08d10.yaml     |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov4689.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov5675.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov5693.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov64a40.yaml     |  3 ++-
 .../devicetree/bindings/media/i2c/sony,imx111.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/sony,imx355.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/sony,imx415.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/st,vd55g1.yaml        |  3 ++-
 .../devicetree/bindings/media/i2c/st,vd56g3.yaml        |  3 ++-
 .../devicetree/bindings/media/i2c/thine,thp7312.yaml    |  3 ++-
 .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
 .../imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso          |  3 ++-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi       |  3 ++-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts      |  3 ++-
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso |  3 ++-
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi           |  3 ++-
 .../dts/rockchip/px30-ringneck-haikou-video-demo.dtso   |  3 ++-
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts   |  5 +++--
 include/dt-bindings/media/video-interface-devices.h     | 13 +++++++++++++
 25 files changed, 71 insertions(+), 30 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260608-kbingham-orientation-20afc0fb6957

Best regards,
-- 
--
Kieran


