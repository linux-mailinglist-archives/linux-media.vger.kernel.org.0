Return-Path: <linux-media+bounces-44123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07538BC9E4C
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 17:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB95F4F972A
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69CE2F3C03;
	Thu,  9 Oct 2025 15:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="UQW5iOOY"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28D322D781;
	Thu,  9 Oct 2025 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025312; cv=none; b=Qtgsrn++Y1RD6LChNEoZ1sV6gEHqC7jSI3BlJIttixMBQCfSG9ggxNg3KLgzmZqnNHGDY1cOecxuC7r9ahxufQHsSM08kkGBQ17H+vmhW84tiFCt2UdRrPfHSGJTkbN/Bu5WecqTLJ3hs5adAf/imBAH6genap45GYVZTjjamdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025312; c=relaxed/simple;
	bh=2OQ78RzTvUpT3PPmqGoxYSCqgJDwbNTUAvYItTqop8U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WOpjsApt6WxV9EjTAubNmnRnWoIlxtjSFCgx/6Ok/3Fz5KfbRez3gUYOX25iQ4xdXfunK+FsbjM1ZuRWR9OSqAvl3yfTFIVf5jpKfyMw11CMQLz1IrTiKI4Vf3G117MnX1SLXhwTN+WJ3QXl1xSFS0acB8lCFQL+cxXhSaPGI/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=UQW5iOOY; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025311; x=1791561311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2OQ78RzTvUpT3PPmqGoxYSCqgJDwbNTUAvYItTqop8U=;
  b=UQW5iOOYHEYOL6Vjn5y3xcP93gftqZ66VS1AlAlLBX+aYrBC2wMazsMz
   9bt0frNfdW0EDyVTSlEJx4yaWt0ybEsMJqn6rpl1HSWL6R05V5CMIzhyG
   Zo9EeBk145O6REkk0sKPB2doV7EDBY4CqblY2m92/bAG/FHtAfIYYf/cl
   RSGHY3+ultXilOFKI6RTWDzGl8BVjinBPY5gZCi83a9Xo0GKELdxV7Jcs
   JU6CRtBR5hpu3sCr2YifOpKlQKn4m4oUkjJA6H1PxHih99ELDH8KqNQMV
   DdxVlsF/zkmN4SirEd9gn0M18SUQs9TXeUd6Vq3qtPBm7zYvsQhvYcpdD
   A==;
X-CSE-ConnectionGUID: BprCE2jSRKSS2v2IfjkHsw==
X-CSE-MsgGUID: jQG7AlzZQJ+bbtCotqDlLQ==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="278928750"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:10 -0700
Received: from chn-vm-ex3.mchp-main.com (10.10.87.32) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:54:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 9 Oct 2025 08:54:48 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:54:39 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
	<3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH 11/18] media: microchip-isc: expose hue and saturation as v4l2 controls
Date: Thu, 9 Oct 2025 21:22:44 +0530
Message-ID: <20251009155251.102472-12-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Expose hue and saturation as adjustable controls allowing users to modify
it. Write the user specified values to the hardware registers. Additionally
write the brightness and contrast values to the registers that were
missing.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c     | 17 +++++++++++++++++
 .../platform/microchip/microchip-isc-regs.h     |  3 +++
 .../media/platform/microchip/microchip-isc.h    |  2 ++
 3 files changed, 22 insertions(+)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index e6d7f59893ac..ce22b4789ebd 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1520,6 +1520,7 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct isc_device *isc = container_of(ctrl->handler,
 					     struct isc_device, ctrls.handler);
 	struct isc_ctrls *ctrls = &isc->ctrls;
+	struct regmap *regmap = isc->regmap;
 
 	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
 		return 0;
@@ -1527,9 +1528,19 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_BRIGHTNESS:
 		ctrls->brightness = ctrl->val & ISC_CBC_BRIGHT_MASK;
+		regmap_write(regmap, ISC_CBC_BRIGHT + isc->offsets.cbc, ctrls->brightness);
 		break;
 	case V4L2_CID_CONTRAST:
 		ctrls->contrast = ctrl->val & ISC_CBC_CONTRAST_MASK;
+		regmap_write(regmap, ISC_CBC_CONTRAST + isc->offsets.cbc, ctrls->contrast);
+		break;
+	case V4L2_CID_HUE:
+		ctrls->hue = ctrl->val & ISC_CBCHS_HUE_MASK;
+		regmap_write(regmap, ISC_CBCHS_HUE, ctrls->hue);
+		break;
+	case V4L2_CID_SATURATION:
+		ctrls->saturation = ctrl->val & ISC_CBCHS_SAT_MASK;
+		regmap_write(regmap, ISC_CBCHS_SAT, ctrls->saturation);
 		break;
 	case V4L2_CID_GAMMA:
 		ctrls->gamma_index = ctrl->val;
@@ -1538,6 +1549,10 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 		return -EINVAL;
 	}
 
+	mutex_lock(&isc->awb_mutex);
+	isc_update_profile(isc);
+	mutex_unlock(&isc->awb_mutex);
+
 	return 0;
 }
 
@@ -1714,6 +1729,8 @@ static int isc_ctrl_init(struct isc_device *isc)
 	ctrls->brightness = 0;
 
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HUE, -180, 180, 1, 0);
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION, 0, 100, 1, 16);
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1, 1);
 	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
 					  V4L2_CID_AUTO_WHITE_BALANCE,
diff --git a/drivers/media/platform/microchip/microchip-isc-regs.h b/drivers/media/platform/microchip/microchip-isc-regs.h
index e77e1d9a1db8..2593bd533cac 100644
--- a/drivers/media/platform/microchip/microchip-isc-regs.h
+++ b/drivers/media/platform/microchip/microchip-isc-regs.h
@@ -270,8 +270,11 @@
 
 /* Hue Register */
 #define ISC_CBCHS_HUE	0x4e0
+#define ISC_CBCHS_HUE_MASK	GENMASK(8, 0)
+
 /* Saturation Register */
 #define ISC_CBCHS_SAT	0x4e4
+#define ISC_CBCHS_SAT_MASK	GENMASK(11, 0)
 
 /* Offset for SUB422 register specific to sama5d2 product */
 #define ISC_SAMA5D2_SUB422_OFFSET	0
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index 5245e2790268..7afba3c04dfb 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -139,6 +139,8 @@ struct isc_ctrls {
 
 	u32 brightness;
 	u32 contrast;
+	u32 hue;
+	u32 saturation;
 	u8 gamma_index;
 #define ISC_WB_NONE	0
 #define ISC_WB_AUTO	1
-- 
2.34.1


