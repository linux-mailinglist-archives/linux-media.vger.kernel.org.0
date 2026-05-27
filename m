Return-Path: <linux-media+bounces-62910-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFE4OD8DF2qz0wcAu9opvQ
	(envelope-from <linux-media+bounces-62910-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:44:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EDF5E61D5
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DCF73072F87
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B6D42981C;
	Wed, 27 May 2026 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="cBtalCB6"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34D042885A;
	Wed, 27 May 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892909; cv=none; b=rcS/eBNQ1IhoitxVbnsPZq1j+YDsKJACH7Q4CYtlKCRdcSbuKR20jWRAKGDCQjX6hHUNeKkXHm73zy4N3t+GCGveoYM7Ch2Md07I4cQey2w3LiwmYGe8ftXp+hDIMlPnsryUlQIKfzdHNuTJUfxv7vxj00hUnkggGDH89NIar3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892909; c=relaxed/simple;
	bh=dzAsQe9dSQKP/KKmETVzvlpxhwS+UPSSjNHgL8CwdWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=b9f16VG2VgmGAJMCbb7tBEzyPcs2C1Y/l/UEPHfwP+3bOIUfXiCo1LjbCEiVJvkGDTYttpsB4pY+LrxWxI3B25nDuXpeI5zNUzgBh3rXx17EheMQ7viVdOwpTZHo4FXDP/Skij/UyKqyH4M9w9kqB7IUNgs1kohwCp8GzTMz3QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=cBtalCB6; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779892908; x=1811428908;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=dzAsQe9dSQKP/KKmETVzvlpxhwS+UPSSjNHgL8CwdWk=;
  b=cBtalCB62UvxMq4JhX5m7UTANc3ZlQW3OyHVMrCTpeO3zvnD/jjE98+J
   UohJfQlntRAvYrZGb3J6nyCHmlGwKF5KfNLkOOMzn2wTCrbPC24qPEsZD
   zsB5CMJxM0mPS2Rmim5pKWgSyLvuQiwxqDFGPA+u9OGZ1mYQwp/l4T1XR
   2MXp2sm1VzecphicUZhxd4tYTYirGvWwAgDUb4A+ivecaCHdOLqGZN0MQ
   5ma65TAfFFV92IqlCgYBqYHmaH7iumU8oCve5tyYhkOlihhvvkDfJm3Kq
   fWwfUupHZgx5IbQAv6nJDo7bkne+YWJ0tobi3hObWRNHCmbvhES9CkMRR
   A==;
X-CSE-ConnectionGUID: cxUHnWiKRT2tRCofX2HxKA==
X-CSE-MsgGUID: MGrItY/ASNuWyJCTMQANiA==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="58122906"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:41:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 07:41:47 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 07:41:43 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 20:11:01 +0530
Subject: [PATCH 12/12] media: adv7842: use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-cleanup-string-choices-media-i2c-v1-12-e8f7d2284288@microchip.com>
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
	TAGGED_FROM(0.00)[bounces-62910-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 89EDF5E61D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace open-coded boolean-to-string ternaries with the standard
helpers from <linux/string_choices.h>.

No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/i2c/adv7842.c | 44 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 3cfae89ce..3b68a6ad6 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <linux/v4l2-dv-timings.h>
@@ -2657,12 +2658,12 @@ static int adv7842_sdp_log_status(struct v4l2_subdev *sd)
 	/* SDP (Standard definition processor) block */
 	u8 sdp_signal_detected = sdp_read(sd, 0x5A) & 0x01;
 
-	v4l2_info(sd, "Chip powered %s\n", no_power(sd) ? "off" : "on");
+	v4l2_info(sd, "Chip powered %s\n", str_off_on(no_power(sd)));
 	v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x\n",
 		  io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f);
 
 	v4l2_info(sd, "SDP: free run: %s\n",
-		(sdp_read(sd, 0x56) & 0x01) ? "on" : "off");
+		str_on_off(sdp_read(sd, 0x56) & 0x01));
 	v4l2_info(sd, "SDP: %s\n", sdp_signal_detected ?
 		"valid SD/PR signal detected" : "invalid/no signal");
 	if (sdp_signal_detected) {
@@ -2687,7 +2688,7 @@ static int adv7842_sdp_log_status(struct v4l2_subdev *sd)
 		v4l2_info(sd, "SDP: %s\n",
 			(sdp_read(sd, 0x57) & 0x08) ? "Interlaced" : "Progressive");
 		v4l2_info(sd, "SDP: deinterlacer %s\n",
-			(sdp_read(sd, 0x12) & 0x08) ? "enabled" : "disabled");
+			str_enabled_disabled(sdp_read(sd, 0x12) & 0x08));
 		v4l2_info(sd, "SDP: csc %s mode\n",
 			(sdp_io_read(sd, 0xe0) & 0x40) ? "auto" : "manual");
 	}
@@ -2735,19 +2736,16 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 	};
 
 	v4l2_info(sd, "-----Chip status-----\n");
-	v4l2_info(sd, "Chip power: %s\n", no_power(sd) ? "off" : "on");
+	v4l2_info(sd, "Chip power: %s\n", str_off_on(no_power(sd)));
 	v4l2_info(sd, "HDMI/DVI-D port selected: %s\n",
 			state->hdmi_port_a ? "A" : "B");
 	v4l2_info(sd, "EDID A %s, B %s\n",
-		  ((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)) ?
-		  "enabled" : "disabled",
-		  ((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)) ?
-		  "enabled" : "disabled");
+		  str_enabled_disabled((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)),
+		  str_enabled_disabled((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)));
 	v4l2_info(sd, "HPD A %s, B %s\n",
-		  reg_io_0x21 & 0x02 ? "enabled" : "disabled",
-		  reg_io_0x21 & 0x01 ? "enabled" : "disabled");
-	v4l2_info(sd, "CEC: %s\n", state->cec_enabled_adap ?
-			"enabled" : "disabled");
+		  str_enabled_disabled(reg_io_0x21 & 0x02),
+		  str_enabled_disabled(reg_io_0x21 & 0x01));
+	v4l2_info(sd, "CEC: %s\n", str_enabled_disabled(state->cec_enabled_adap));
 	if (state->cec_enabled_adap) {
 		int i;
 
@@ -2763,21 +2761,21 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "-----Signal status-----\n");
 	if (state->hdmi_port_a) {
 		v4l2_info(sd, "Cable detected (+5V power): %s\n",
-			  io_read(sd, 0x6f) & 0x02 ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6f) & 0x02));
 		v4l2_info(sd, "TMDS signal detected: %s\n",
-			  (io_read(sd, 0x6a) & 0x02) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x02));
 		v4l2_info(sd, "TMDS signal locked: %s\n",
-			  (io_read(sd, 0x6a) & 0x20) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x20));
 	} else {
 		v4l2_info(sd, "Cable detected (+5V power):%s\n",
-			  io_read(sd, 0x6f) & 0x01 ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6f) & 0x01));
 		v4l2_info(sd, "TMDS signal detected: %s\n",
-			  (io_read(sd, 0x6a) & 0x01) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x01));
 		v4l2_info(sd, "TMDS signal locked: %s\n",
-			  (io_read(sd, 0x6a) & 0x10) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x10));
 	}
 	v4l2_info(sd, "CP free run: %s\n",
-		  (!!(cp_read(sd, 0xff) & 0x10) ? "on" : "off"));
+		  (str_on_off(!!(cp_read(sd, 0xff) & 0x10))));
 	v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x, v_freq = 0x%x\n",
 		  io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
 		  (io_read(sd, 0x01) & 0x70) >> 4);
@@ -2821,7 +2819,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 		  (reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
 		  (((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
 			"(16-235)" : "(0-255)",
-		  (reg_io_0x02 & 0x08) ? "enabled" : "disabled");
+		  str_enabled_disabled(reg_io_0x02 & 0x08));
 	temp = cp_read(sd, 0xf4) >> 4;
 	v4l2_info(sd, "Color space conversion: %s\n",
 		  temp < 0 ? "" : csc_coeff_sel_rb[temp]);
@@ -2831,9 +2829,9 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
-			(hdmi_read(sd, 0x05) & 0x40) ? "true" : "false");
+			str_true_false(hdmi_read(sd, 0x05) & 0x40));
 	v4l2_info(sd, "HDCP keys read: %s%s\n",
-			(hdmi_read(sd, 0x04) & 0x20) ? "yes" : "no",
+			str_yes_no(hdmi_read(sd, 0x04) & 0x20),
 			(hdmi_read(sd, 0x04) & 0x10) ? "ERROR" : "");
 	if (!is_hdmi(sd))
 		return 0;
@@ -2853,7 +2851,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 			(hdmi_read(sd, 0x5e) << 8) +
 			hdmi_read(sd, 0x5f));
 	v4l2_info(sd, "AV Mute: %s\n",
-			(hdmi_read(sd, 0x04) & 0x40) ? "on" : "off");
+			str_on_off(hdmi_read(sd, 0x04) & 0x40));
 	temp = hdmi_read(sd, 0x0b) >> 6;
 	v4l2_info(sd, "Deep color mode: %s\n",
 			temp < 0 ? "" : deep_color_mode_txt[temp]);

-- 
2.34.1


