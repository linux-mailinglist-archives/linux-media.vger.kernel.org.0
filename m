Return-Path: <linux-media+bounces-62909-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DiIIy0DF2qz0wcAu9opvQ
	(envelope-from <linux-media+bounces-62909-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:43:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE725E61C0
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92D83304AB33
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E99426EAB;
	Wed, 27 May 2026 14:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="titjY1KU"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1EA42882B;
	Wed, 27 May 2026 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892905; cv=none; b=PQlpO+DXgRXDzL37i6iIBkq9ghV2POmlmlNvK1QqdctIduyCHXu6X1AXaEth6zK+WWHRS+6p2cGNgmNvyzUcbv0SK2LJKPZTIPLE/yEhp3DaQlgI1IeLMJScIveGZnNtq5WGpyodJ5fW8E4I8wfT1eqlTdHCu+MI0MJubAeZDz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892905; c=relaxed/simple;
	bh=uBSKdqLZP6Jmy0x9HDnccItPG/Ikh98WNY28qCku4n4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BJyiOLZiqxc5SawvFfKHECtow/MndPcWAL4dhJPjcJJR0N34yFTXRjQS1iXpf/NbtI0/kqCdjw9aI3ErvYSwiQe9P+tr1jkfTAZvmkaI8+kWAeeiTApSgFJujrk/0u3cixSGySowc1dNLiWqi7/9DcPDwh7BEdo7il6wjcNgdSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=titjY1KU; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779892904; x=1811428904;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=uBSKdqLZP6Jmy0x9HDnccItPG/Ikh98WNY28qCku4n4=;
  b=titjY1KUpQ0ufvlxQri4O19Lor075fTkoJ1RqJBpZmKRIALmxDjsZTLG
   GdVyvRBjbMHn1Ghr+3A6cSw8YII2wllllo01WjGR0tvvbh2QFbz3ncLuQ
   ONSc5ym3r/kG54Xaf2jJWLxc7ydEzEXXokwDfbPT2m4/TYCee5H4RGIUD
   K3BSJK8Yg5efEAr0u+9b6dywTVDNz+Ny5WrL0P4AQIF5tok7XbIPbuyLf
   5kE7U4sfQx59Hr5WGh8m0IrGuLtgiY6Dlouv0CHvNYy5hF+e4EEa83Ofp
   Rd4srn0moNwyoDvJKfCYH8KAXUbBfvkSOOLOQpBhdv9LV+TTbJIiF94Ew
   w==;
X-CSE-ConnectionGUID: ZBZWZdEiQKO5N6QPoYMTJw==
X-CSE-MsgGUID: +vNeos2QQf+TdieNbxDGXA==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="289515143"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:41:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 07:41:42 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 07:41:39 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 20:11:00 +0530
Subject: [PATCH 11/12] media: tc358743: use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-cleanup-string-choices-media-i2c-v1-11-e8f7d2284288@microchip.com>
References: <20260527-cleanup-string-choices-media-i2c-v1-0-e8f7d2284288@microchip.com>
In-Reply-To: <20260527-cleanup-string-choices-media-i2c-v1-0-e8f7d2284288@microchip.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tim Harvey
	<tharvey@gateworks.com>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Balakrishnan Sambath <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62909-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Queue-Id: 3EE725E61C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace open-coded boolean-to-string ternaries with the standard
helpers from <linux/string_choices.h>.

No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/i2c/tc358743.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index fbd38bbfe..57d2808ba 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -20,6 +20,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
+#include <linux/string_choices.h>
 #include <linux/timer.h>
 #include <linux/of_graph.h>
 #include <linux/videodev2.h>
@@ -1308,7 +1309,7 @@ static void tc358743_hdmi_sys_int_handler(struct v4l2_subdev *sd, bool *handled)
 		bool tx_5v = tx_5v_power_present(sd);
 
 		v4l2_dbg(1, debug, sd, "%s: Tx 5V power present: %s\n",
-				__func__, tx_5v ?  "yes" : "no");
+				__func__, str_yes_no(tx_5v));
 
 		if (tx_5v) {
 			tc358743_enable_edid(sd);
@@ -1385,26 +1386,24 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 			!!(sysctl & MASK_CECRST),
 			!!(sysctl & MASK_CTXRST),
 			!!(sysctl & MASK_HDMIRST));
-	v4l2_info(sd, "Sleep mode: %s\n", sysctl & MASK_SLEEP ? "on" : "off");
+	v4l2_info(sd, "Sleep mode: %s\n", str_on_off(sysctl & MASK_SLEEP));
 	v4l2_info(sd, "Cable detected (+5V power): %s\n",
-			hdmi_sys_status & MASK_S_DDC5V ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_DDC5V));
 	v4l2_info(sd, "DDC lines enabled: %s\n",
-			(i2c_rd8(sd, EDID_MODE) & MASK_EDID_MODE_E_DDC) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd8(sd, EDID_MODE) & MASK_EDID_MODE_E_DDC));
 	v4l2_info(sd, "Hotplug enabled: %s\n",
-			(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0));
 	v4l2_info(sd, "CEC enabled: %s\n",
-			(i2c_rd16(sd, CECEN) & MASK_CECEN) ?  "yes" : "no");
+			str_yes_no(i2c_rd16(sd, CECEN) & MASK_CECEN));
 	v4l2_info(sd, "-----Signal status-----\n");
 	v4l2_info(sd, "TMDS signal detected: %s\n",
-			hdmi_sys_status & MASK_S_TMDS ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_TMDS));
 	v4l2_info(sd, "Stable sync signal: %s\n",
-			hdmi_sys_status & MASK_S_SYNC ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_SYNC));
 	v4l2_info(sd, "PHY PLL locked: %s\n",
-			hdmi_sys_status & MASK_S_PHY_PLL ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_PHY_PLL));
 	v4l2_info(sd, "PHY DE detected: %s\n",
-			hdmi_sys_status & MASK_S_PHY_SCDT ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_PHY_SCDT));
 
 	if (tc358743_get_detected_timings(sd, &timings)) {
 		v4l2_info(sd, "No video detected\n");
@@ -1421,17 +1420,13 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "Lanes in use: %d\n",
 			state->csi_lanes_in_use);
 	v4l2_info(sd, "Waiting for particular sync signal: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_WSYNC) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_WSYNC));
 	v4l2_info(sd, "Transmit mode: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_TXACT) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_TXACT));
 	v4l2_info(sd, "Receive mode: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_RXACT) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_RXACT));
 	v4l2_info(sd, "Stopped: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT));
 	v4l2_info(sd, "Color space: %s\n",
 			state->mbus_fmt_code == MEDIA_BUS_FMT_UYVY8_1X16 ?
 			"YCbCr 422 16-bit" :
@@ -1440,14 +1435,13 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
-			hdmi_sys_status & MASK_S_HDCP ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_HDCP));
 	v4l2_info(sd, "Input color space: %s %s range\n",
 			input_color_space[(vi_status3 & MASK_S_V_COLOR) >> 1],
 			(vi_status3 & MASK_LIMITED) ? "limited" : "full");
 	if (!is_hdmi(sd))
 		return 0;
-	v4l2_info(sd, "AV Mute: %s\n", hdmi_sys_status & MASK_S_AVMUTE ? "on" :
-			"off");
+	v4l2_info(sd, "AV Mute: %s\n", str_on_off(hdmi_sys_status & MASK_S_AVMUTE));
 	v4l2_info(sd, "Deep color mode: %d-bits per channel\n",
 			deep_color_mode[(i2c_rd8(sd, VI_STATUS1) &
 				MASK_S_DEEPCOLOR) >> 2]);

-- 
2.34.1


