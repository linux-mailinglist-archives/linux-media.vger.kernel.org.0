Return-Path: <linux-media+bounces-62908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB0hGwkDF2qz0wcAu9opvQ
	(envelope-from <linux-media+bounces-62908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:43:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F3E5E619A
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1B4A303ED06
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9CA42848B;
	Wed, 27 May 2026 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Uuyh7HR3"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D072B402B8A;
	Wed, 27 May 2026 14:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892901; cv=none; b=QRtZ6l+DPzim06IKPkmd3HyBX415nzDKxoqUeaY1ePxr3YaFvbD6XWDAW8jxOONn8nAcHv1Rv8bQITF9t7v5vt6MsHyHr1qZNkBlvQI3JAA0ufx+e5bWCndH+Ww+2LnCevwWKsn798pbBhsOscZV+aKEr3o6gR/jUIoRN1HgRUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892901; c=relaxed/simple;
	bh=1yf0UY0Ap0VuYT9Fb7dhFa0Rl/LF/JNp175GQkm5AiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pVTZYX56Z+E7N9/LEumrW3Y1fchpTYPfDo82/z2/UTVmNT0OGoLZOowMY2HMdEUKM0HJGT9sjHfd+E3z5x3u1B8ImR0P76mJTWpuGvTt7J52JmXtyOE0S1zzr3Zb37GHvVGmeROXjMUbWsMKIDu/85+nFhAoSePrDS6q02D4bZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Uuyh7HR3; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779892900; x=1811428900;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=1yf0UY0Ap0VuYT9Fb7dhFa0Rl/LF/JNp175GQkm5AiM=;
  b=Uuyh7HR3GjDeOq75LJHP5Ml6ABEUoWxGKmTDKprVrOwr038QYoizAOAJ
   v4lYyS2GFA0TiXE6biZy1Q7FqSkzWw0UVcyF0KJZX6P6gGyzRJDVuYjwO
   ojFDybAOyhUo0PS3Z0egzjx98oj8ayGxxhTJEw/JxTv7TM5rmtpoepLTm
   I/sJJeEcuUn4uPKDDCBOaw+pewtVUHogfwa8wGnAM6n4gaWKN8IyvEedh
   V/hURMZehwCg2HeLEWXrTW0CS/bz+jqOowsuwyEOHwW9DjpXnG+TCdZ4t
   H/jQXwxRD4NGynL9ypNoGWflKJNhT1MM748Oi2RilAkgTIGP98yTuHX+r
   w==;
X-CSE-ConnectionGUID: 3BotJfn9SoKWL3f5S53HqA==
X-CSE-MsgGUID: gjQ+AwKrT5Sgbv0o94ZhZw==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="289515140"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2026 07:41:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 27 May 2026 07:41:38 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 07:41:35 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 20:10:59 +0530
Subject: [PATCH 10/12] media: adv7604: use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-cleanup-string-choices-media-i2c-v1-10-e8f7d2284288@microchip.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62908-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Queue-Id: 10F3E5E619A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace open-coded boolean-to-string ternaries with the standard
helpers from <linux/string_choices.h>.

No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/i2c/adv7604.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index ac9c69ce4..3b06ddad8 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -23,6 +23,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/v4l2-dv-timings.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
@@ -2563,15 +2564,14 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 	};
 
 	v4l2_info(sd, "-----Chip status-----\n");
-	v4l2_info(sd, "Chip power: %s\n", no_power(sd) ? "off" : "on");
+	v4l2_info(sd, "Chip power: %s\n", str_off_on(no_power(sd)));
 	edid_enabled = rep_read(sd, info->edid_status_reg);
 	v4l2_info(sd, "EDID enabled port A: %s, B: %s, C: %s, D: %s\n",
 			((edid_enabled & 0x01) ? "Yes" : "No"),
 			((edid_enabled & 0x02) ? "Yes" : "No"),
 			((edid_enabled & 0x04) ? "Yes" : "No"),
 			((edid_enabled & 0x08) ? "Yes" : "No"));
-	v4l2_info(sd, "CEC: %s\n", state->cec_enabled_adap ?
-			"enabled" : "disabled");
+	v4l2_info(sd, "CEC: %s\n", str_enabled_disabled(state->cec_enabled_adap));
 	if (state->cec_enabled_adap) {
 		int i;
 
@@ -2592,14 +2592,14 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 			((cable_det & 0x04) ? "Yes" : "No"),
 			((cable_det & 0x08) ? "Yes" : "No"));
 	v4l2_info(sd, "TMDS signal detected: %s\n",
-			no_signal_tmds(sd) ? "false" : "true");
+			str_false_true(no_signal_tmds(sd)));
 	v4l2_info(sd, "TMDS signal locked: %s\n",
-			no_lock_tmds(sd) ? "false" : "true");
-	v4l2_info(sd, "SSPD locked: %s\n", no_lock_sspd(sd) ? "false" : "true");
-	v4l2_info(sd, "STDI locked: %s\n", no_lock_stdi(sd) ? "false" : "true");
-	v4l2_info(sd, "CP locked: %s\n", no_lock_cp(sd) ? "false" : "true");
+			str_false_true(no_lock_tmds(sd)));
+	v4l2_info(sd, "SSPD locked: %s\n", str_false_true(no_lock_sspd(sd)));
+	v4l2_info(sd, "STDI locked: %s\n", str_false_true(no_lock_stdi(sd)));
+	v4l2_info(sd, "CP locked: %s\n", str_false_true(no_lock_cp(sd)));
 	v4l2_info(sd, "CP free run: %s\n",
-			(in_free_run(sd)) ? "on" : "off");
+			str_on_off(in_free_run(sd)));
 	v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x, v_freq = 0x%x\n",
 			io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
 			(io_read(sd, 0x01) & 0x70) >> 4);
@@ -2639,7 +2639,7 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 				(reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
 				(((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
 					"(16-235)" : "(0-255)",
-				(reg_io_0x02 & 0x08) ? "enabled" : "disabled");
+				str_enabled_disabled(reg_io_0x02 & 0x08));
 	}
 	v4l2_info(sd, "Color space conversion: %s\n",
 			csc_coeff_sel_rb[cp_read(sd, info->cp_csc) >> 4]);
@@ -2651,9 +2651,9 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "Digital video port selected: %c\n",
 			(hdmi_read(sd, 0x00) & 0x03) + 'A');
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
-			(hdmi_read(sd, 0x05) & 0x40) ? "true" : "false");
+			str_true_false(hdmi_read(sd, 0x05) & 0x40));
 	v4l2_info(sd, "HDCP keys read: %s%s\n",
-			(hdmi_read(sd, 0x04) & 0x20) ? "yes" : "no",
+			str_yes_no(hdmi_read(sd, 0x04) & 0x20),
 			(hdmi_read(sd, 0x04) & 0x10) ? "ERROR" : "");
 	if (is_hdmi(sd)) {
 		bool audio_pll_locked = hdmi_read(sd, 0x04) & 0x01;
@@ -2674,7 +2674,7 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 		v4l2_info(sd, "Audio N: %u\n", ((hdmi_read(sd, 0x5d) & 0x0f) << 16) +
 				(hdmi_read(sd, 0x5e) << 8) +
 				hdmi_read(sd, 0x5f));
-		v4l2_info(sd, "AV Mute: %s\n", (hdmi_read(sd, 0x04) & 0x40) ? "on" : "off");
+		v4l2_info(sd, "AV Mute: %s\n", str_on_off(hdmi_read(sd, 0x04) & 0x40));
 
 		v4l2_info(sd, "Deep color mode: %s\n", deep_color_mode_txt[(hdmi_read(sd, 0x0b) & 0x60) >> 5]);
 		v4l2_info(sd, "HDMI colorspace: %s\n", hdmi_color_space_txt[hdmi_read(sd, 0x53) & 0xf]);

-- 
2.34.1


