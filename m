Return-Path: <linux-media+bounces-18832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE69B98A1E2
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86D92281ADA
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A791A2652;
	Mon, 30 Sep 2024 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n5prRqv4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462CA18FC81
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697932; cv=none; b=An9G/Rp4q5eOUQRzf/5XI0JvfE87ePG5iag9Xj45eQNr9p2QRYYzrbDJZhDlMvY7vF0GXt5GVbO28dxdl66U569okOGkqtXXMmECzOAN4oaVlJYScqtSFD8mS5WIvNx6wh2YGorJ4bePuq6YOBH80lAAlXSuEEtFGD1jrz1P9Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697932; c=relaxed/simple;
	bh=LEyRnQlk/VvUqFfADZuaXZpU9psw9Z1DNm9sbFANuMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nS2ZZgYuGbybFct6jIQ6p3dCUWjOI4vOJWUhJZKJyzF2B1SaR4pHvcNgNnKn3N746vLf+XbBLqotbTdQbaSk031EW5pihwDJUzckv7KnNbVL5odYMiz0ENfc63N75DRJj9Ij1Gp8FzzelKVce2f9h+s/kx3Z39foVIsTYfkuaM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n5prRqv4; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6c548eb3354so35741096d6.2
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697929; x=1728302729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEpH3GW+zX127Rx2gWkJapzmZ8AtweIcRQ6dozRhT1Y=;
        b=n5prRqv4xl8dq7AE6sC1kbMYo2z+vkf4gtn1VKi7jzmuGEyV9ZRfK4e1NaKXqg/3PD
         dO5MPn/nij/TrQhnCN4t8BM1IljBJDkeq+tqza/l5AXMsJ2kyFgX5qREGFKBQQP8Srku
         DggeKialP9rkGTkaQBcZiTBqcoLl5On6+9/yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697929; x=1728302729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEpH3GW+zX127Rx2gWkJapzmZ8AtweIcRQ6dozRhT1Y=;
        b=NVn2Q3CJa/HU+DEJGCD0A/ySzvqem4LRKPunXVWnCaHf40jD5T+RlUok/MHnjTxSsS
         88xTplFuRNjAnjwmSu04aVHo0RSLWZAvqX9ntiiBHLfiVXLoQjal2rwCgGldo3rMLyFv
         YisuSnLP6z03/1P3TCb8hqlVrduGs6E7nLDkftE8g8nozN8IcosCZHaHw7Hf6UVLV8zT
         Ub6a4Z9cKxEw4wf54WPk+TJ0OJxBfVSeiuV9UM515qnQuY9uyV8qVB3+a67bl6GgppBo
         nOn1CBcsXoVTUg07M2q0ylTQtAwpBoErm0KuK6fx+59Y4lUNExy/9W+ZmpF4mvfKa3xP
         dX7w==
X-Gm-Message-State: AOJu0YwQBrlJ9CU1dO9JlLSqyawGHZdKBHd4qm5t+hSlRorEe7lyvuMm
	OhHgYBPS/3P4sbkoBl30IQzn+F9+xvRm1LyOR+fDwWgbKs9tvdZfazo1mDq2/Q==
X-Google-Smtp-Source: AGHT+IFPaIZM1NSUWS2N20Z229u6ehVGSu/pXbG6WOauy86M5vVJLdj9bB3eMmf2b81ROre6rRHWmQ==
X-Received: by 2002:a05:6214:3207:b0:6c5:7446:4fdf with SMTP id 6a1803df08f44-6cb3b5e283dmr198571366d6.24.1727697929145;
        Mon, 30 Sep 2024 05:05:29 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:39 +0000
Subject: [PATCH 44/45] media: i2c: adv76xx: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-44-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warnings are fixed:
drivers/media/i2c/adv7604.c:2641:3-31: opportunity for str_true_false(( hdmi_read ( sd , 0x05 ) & 0x40 ))
drivers/media/i2c/adv7604.c:2595:34-48: opportunity for str_false_true(no_lock_cp ( sd ))
drivers/media/i2c/adv7604.c:2593:36-52: opportunity for str_false_true(no_lock_sspd ( sd ))
drivers/media/i2c/adv7604.c:2594:36-52: opportunity for str_false_true(no_lock_stdi ( sd ))
drivers/media/i2c/adv7604.c:2592:3-19: opportunity for str_false_true(no_lock_tmds ( sd ))
drivers/media/i2c/adv7604.c:2590:3-21: opportunity for str_false_true(no_signal_tmds ( sd ))
drivers/media/i2c/adv7604.c:2568:28-51: opportunity for str_enabled_disabled(state -> cec_enabled_adap)
drivers/media/i2c/adv7604.c:2630:3-23: opportunity for str_enabled_disabled(( reg_io_0x02 & 0x08 ))
drivers/media/i2c/adv7604.c:2597:3-20: opportunity for str_on_off(( in_free_run ( sd ) ))
drivers/media/i2c/adv7604.c:2664:33-61: opportunity for str_on_off(( hdmi_read ( sd , 0x04 ) & 0x40 ))
drivers/media/i2c/adv7604.c:2643:3-31: opportunity for str_yes_no(( hdmi_read ( sd , 0x04 ) & 0x20 ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7604.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 48230d5109f0..fb74f2947413 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -2565,8 +2565,8 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 			((edid_enabled & 0x02) ? "Yes" : "No"),
 			((edid_enabled & 0x04) ? "Yes" : "No"),
 			((edid_enabled & 0x08) ? "Yes" : "No"));
-	v4l2_info(sd, "CEC: %s\n", state->cec_enabled_adap ?
-			"enabled" : "disabled");
+	v4l2_info(sd, "CEC: %s\n",
+		  str_enabled_disabled(state->cec_enabled_adap));
 	if (state->cec_enabled_adap) {
 		int i;
 
@@ -2587,14 +2587,14 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
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
@@ -2627,7 +2627,7 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 			(reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
 			(((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
 				"(16-235)" : "(0-255)",
-			(reg_io_0x02 & 0x08) ? "enabled" : "disabled");
+			str_enabled_disabled(reg_io_0x02 & 0x08));
 	v4l2_info(sd, "Color space conversion: %s\n",
 			csc_coeff_sel_rb[cp_read(sd, info->cp_csc) >> 4]);
 
@@ -2638,9 +2638,9 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
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
@@ -2661,7 +2661,8 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 		v4l2_info(sd, "Audio N: %u\n", ((hdmi_read(sd, 0x5d) & 0x0f) << 16) +
 				(hdmi_read(sd, 0x5e) << 8) +
 				hdmi_read(sd, 0x5f));
-		v4l2_info(sd, "AV Mute: %s\n", (hdmi_read(sd, 0x04) & 0x40) ? "on" : "off");
+		v4l2_info(sd, "AV Mute: %s\n",
+			  str_on_off(hdmi_read(sd, 0x04) & 0x40));
 
 		v4l2_info(sd, "Deep color mode: %s\n", deep_color_mode_txt[(hdmi_read(sd, 0x0b) & 0x60) >> 5]);
 		v4l2_info(sd, "HDMI colorspace: %s\n", hdmi_color_space_txt[hdmi_read(sd, 0x53) & 0xf]);

-- 
2.46.1.824.gd892dcdcdd-goog


