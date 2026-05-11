Return-Path: <linux-media+bounces-61062-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFmiKw+gAWpKgwEAu9opvQ
	(envelope-from <linux-media+bounces-61062-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:23:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B36E050AD05
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2649C300B8C8
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50157377019;
	Mon, 11 May 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn24wuQo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F4C3BFE33
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490704; cv=none; b=MnDL3XaZCUciPI4TM/Qv4xxJtpTY1Fm+J5Mn5wB6YeV+St4UZn5QPFZERxNyBMAT9baFauEYrNSUXqAmkAgaox/ikcA0g2zF0N51CqkrJfOO7+C1M/dX1uK1zna58kTElro+PaYsf0Chf2ekCnb7D2Imr84uYeev9toGq4qNL+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490704; c=relaxed/simple;
	bh=BmKgwW+huMEmoGPoLpy+I+GMFUXpf5lF+r7mZMlbwFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFVT2q/mkUee6eMnL0CZ9ji8MWEnFMTaGbuWGhwDAq9js3utAw3TaTNBFfnPc5CTeMPyJ7Q77WCv8UNvRX+my55a6ELbTSDfySa3zxPrMJm0d0MG4Tm8hZBd77rli3il8sW1C9VBmqDoYHpJrhqSgGIx7PaovPZE1IW+fXxygac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn24wuQo; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so360995b3a.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490703; x=1779095503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozLkte7ETpH86EHwtLlaK+Q8ddy25XuHUv04YnH5k94=;
        b=Gn24wuQoOj8rjYSpTaMU80gbJk/X//XiQce9OPwwuc3r9v+oUHLHOFkQNe76NXB/KZ
         QLceuBCGd2V/PeVmmD/9Fig6TsaPTFm9WNc0X4PK4gB+EjAHNJpKF6+a8LW120JkdLpB
         uIOtaAFc3GFoIo6CuEn9edIJtqiCuZ1vPMq4seBasyuM96Lq0PVuxZVRH+yyMwjSylRH
         lalYorpN0zVsPYowSIP0edE3ydvbDdsVlgj+vIrIpdkaik+DTGmzF4YuvnXUjXLACzc9
         zxHDjO4mbp/WXZJ8548ijayeJN1R89YXjCwlPc/NVWcZNzt5b9iUnKOgL7SzRIeTu+bi
         B39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490703; x=1779095503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ozLkte7ETpH86EHwtLlaK+Q8ddy25XuHUv04YnH5k94=;
        b=UFfTLuxEwOgsh6/PXJSDmX3CvLJlhtRHDnAH0RdZWSpRbOO3Sp1vPw2cw1crugOmPC
         M/R4aeoEY44PgLwF0b/Oqqbg5nh4CL7rrCfPdoCOrMAkA6+w+vSkicFBMtHItjXzQkd5
         vfqCPI0xYauLV5k+pB2zeWSeQtJAMUq++x3jRJGEgtnsDOs8Q2D95j3hB7rRPNh412qv
         WoNua16n44hAZL/5d0kir411Gbp3FtXzSXlj0+ZSBpSp/G8mUnd8xZNROIgN0GAyUzQO
         sa3QrGKzT7wdIWTME5XhnqsL0pxiZ9N7sg7716AJknDrL4ogD3beruwglt5LZvPlNvsT
         +TVg==
X-Forwarded-Encrypted: i=1; AFNElJ/CRLAPnV02ne2pxkhqLsw66km3Xhmk/R6qjITNDCcdm3QwFngGkjQofeQAVxZDB/cV1bJ0HAzCJSUOKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy3CYzuEF00ciLB1bKZ/lSSH2ttM2ydB+duXsWW2TobYjYLq6k
	e+bYcyfkXGcmYGTlG7+723goMRClQhQPGDNdkVVOtouH+Ph5912qfQ5C
X-Gm-Gg: Acq92OGhwSr4cpUH6LRcsrnMQlbqys0ZUcRDpaO8j4Z9XCjddcGcGzjMwip78pSZXK2
	Fkhp3iakUXZoJRN+O/sB2ieagQSPxym+xtocTeaEuhCP18Ls9TnBtbkatMszSD5qaXCGRlMwjSD
	glkgdoHa6NRJHd/2qAzxIGwX6TuC9rnZjd1L+B1KwlObD5MRU8lFlbtNZs/yhzUE7dpFjzeMgjy
	WawGANa9Q5oBWdvGlLQGWgeI1nhkx+GeECwM9YXGXQPR3Vj4tE5bXkQT/CExXOw0vkUowwvSad2
	Gz11XbVHof4kpwZIPS4DKwzMC3HUJcEbbjjCmgI3CNz/VDYmCDAfoVAomczXJ8o7f+QQbzQyHPs
	GUUEdhR0ng9Tox5z9wBaE1NZdO3A0mUP58ux1TZTvcmRpBnccO8rBUcw6nZMIdvJwwRVCA7IqgJ
	sCFkLXuoHGcvHKMs8oaWmGuVGHFXBdW/esvQ==
X-Received: by 2002:a05:6a00:914a:b0:83e:b22f:373a with SMTP id d2e1a72fcca58-83eb22f4300mr4998591b3a.11.1778490702569;
        Mon, 11 May 2026 02:11:42 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:42 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 3/5] media: hi846: fix modes handling for different lane cases
Date: Mon, 11 May 2026 17:09:22 +0800
Message-ID: <20260511090924.269106-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B36E050AD05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61062-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de,puri.sm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.941];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,puri.sm:email]
X-Rspamd-Action: no action

When using 4-lane, v4l2_find_nearest_size may return an unsupported
mode, 640x480 mode, and it is set to the default mode.

To fix it, specifying the supported modes for different lane cases,
once the lane count is determined.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm/
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index befd54553df2..9decfda74787 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1130,6 +1130,8 @@ static const struct hi846_mode supported_modes[] = {
 		},
 	}
 };
+#define NUM_MODES_2LANE		ARRAY_SIZE(supported_modes)
+#define NUM_MODES_4LANE		(ARRAY_SIZE(supported_modes) - 1)
 
 struct hi846_datafmt {
 	u32 code;
@@ -1162,6 +1164,8 @@ struct hi846 {
 
 	struct mutex mutex; /* protect cur_mode, streaming and chip access */
 	const struct hi846_mode *cur_mode;
+	const struct hi846_mode *supported_modes;
+	int num_modes;
 	bool streaming;
 };
 
@@ -1736,8 +1740,8 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
+		v4l2_find_nearest_size(hi846->supported_modes,
+				       hi846->num_modes,
 				       width, height, mf->width, mf->height);
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
@@ -1821,8 +1825,11 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	const struct hi846_mode *supported_modes = hi846->supported_modes;
+
 
-	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
+	if (fse->pad || fse->index >= hi846->num_modes)
 		return -EINVAL;
 
 	if (fse->code != HI846_MEDIA_BUS_FORMAT) {
@@ -1950,12 +1957,12 @@ static int hi846_identify_module(struct hi846 *hi846)
 static s64 hi846_check_link_freqs(struct hi846 *hi846,
 				  struct v4l2_fwnode_endpoint *ep)
 {
-	int freqs_count = ARRAY_SIZE(supported_modes);
+	int freqs_count = hi846->num_modes;
 	u64 link_freq;
 	int i, j;
 
 	for (i = 0; i < freqs_count; i++) {
-		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
+		link_freq = hi846_get_link_freq(hi846, &hi846->supported_modes[i]);
 		for (j = 0; j < ep->nr_of_link_frequencies; j++)
 			if (link_freq == ep->link_frequencies[j])
 				break;
@@ -1999,6 +2006,13 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
 
 	hi846->nr_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 
+	hi846->supported_modes = supported_modes;
+	hi846->num_modes = NUM_MODES_2LANE;
+	if (hi846->nr_lanes == 4) {
+		hi846->supported_modes = supported_modes + 1;
+		hi846->num_modes = NUM_MODES_4LANE;
+	}
+
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_err(dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
@@ -2088,7 +2102,7 @@ static int hi846_probe(struct i2c_client *client)
 	if (ret)
 		goto err_power_off;
 
-	hi846->cur_mode = &supported_modes[0];
+	hi846->cur_mode = &hi846->supported_modes[0];
 
 	ret = hi846_init_controls(hi846);
 	if (ret) {
-- 
2.54.0


