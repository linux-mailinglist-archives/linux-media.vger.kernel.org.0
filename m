Return-Path: <linux-media+bounces-26648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88445A40352
	for <lists+linux-media@lfdr.de>; Sat, 22 Feb 2025 00:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1464B19E193F
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 23:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBD720B217;
	Fri, 21 Feb 2025 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="tRBzhASU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TSCJ1WBG"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA91FBC99;
	Fri, 21 Feb 2025 23:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740179403; cv=none; b=hbLEGaHpFFhF2sI5PHUrHCMSBmPRLI5EV+UTfW7nJ7SpN/O5rWM2Rrkktcgp24r5j6KF5Jmk+T61IAxi1dVfk7PmJawoRQ7997GRYj4M9aNF/Gkj/7zm0qWEb1bKNlt6WkPWNiamiPoWG7PSnvb46sUzSCuCCE4ftz7l3P2S3pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740179403; c=relaxed/simple;
	bh=vbqJ66iPOY4HMmmZu2PAdjxMYVHcXRO/K/AzaECIOag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CDOnNl1THUoXyuH7D+46IPO0v6elJzcb12TPH/ANsGB+DIKzb7b0Xz4Sujpynpplgo7Z2HbFu9rI05hB5YW8b/RAcXULOknvYD55N7srS/3oHnR1jQ5G079l7MCRnzJI/6i2/4PCUjVhKKs6cLFI2x1Ms3mhx2qii4i1e5+BVHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=tRBzhASU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TSCJ1WBG; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 4061713808C0;
	Fri, 21 Feb 2025 18:09:59 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 21 Feb 2025 18:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1740179399; x=1740265799; bh=lx
	nLHkzmGyLmSTwo51/hcdlDn0L2XDsgf6rhjURMffg=; b=tRBzhASUSvmDiL52mh
	zDYImhbGLH0n3axjt+Pm6MqYLws5i/ki1eGyHUSmGhF91RqsTOOBVf9VMio7Xy9b
	hgkb6R7zAWxBSICO1kD4HiBgRJi9IuUkStr0wjJIO0YrnjkqzQQGnsh4M5MtitOS
	yiUz4gWNGGN+VDrVNHxwIRKI8ne9aZS8+7W9Fs7YqMKz5HgClVV5RX5cyXZvstNh
	jXr/LU0EKyynpwR9OJFZkXl/u2iPclQy7h1lEQQu+unBymFVF4YKu5CqLgVVCdIZ
	dk1Y/1wG6Ac1jbnx1QnYbnWwsK6eVw/yohJcZJZ+PTrZ9N2Kt7c+y5ksjV+QP0K7
	ebKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1740179399; x=1740265799; bh=lxnLHkzmGyLmSTwo51/hcdlDn0L2
	XDsgf6rhjURMffg=; b=TSCJ1WBGTbI7zHGuDlhZElO0I59C70FhnDX8VrLNLtcS
	IcxkIkLb0y+UJX2qmseeHhzsMVFj6QonvjSru/ZxdKD0MYEoVi22dOXQfscoAUMy
	XDwoNCfFju7p/tL+zoUcqGf5VVplaFGusV3w2UVe558N8yN1A/nATmycbiY8pWIi
	nrvTk1HQVbg4vQIAEVTxDPBtk5YpKnTulSA7l5bDUm41m1ND3Ru2KdNMrd7sy/w0
	/T0s+bJcfueS51XKwKpS15zFs1+M1mFdsm2buLruAMJmpWK0SF51XaE3SOrnRn2x
	VstXhIc34DqPFsm4e8Qo6S7YvY7J89a0CosGW+Jy0w==
X-ME-Sender: <xms:xwe5Z_nIteQ7AZpsHhWhOZ6TsdYKtr0cnHlSUZgnBAHODnQsawanEQ>
    <xme:xwe5Zy1keC8JGk3gQAzJ15Dqh-haH6EKpzemWhPCgEQ_E49E-rRqYefIKGmx99X55
    VaDE_USgsuRTvaO664>
X-ME-Received: <xmr:xwe5Z1ptH7e54BuU6-TMDTERb_BTGyJxlImtORLcJ-NJOpHVjVXNkFCokkGtkc3ZdIRFnUuHyCi80tRxUrfOX7KrsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghf
    ohhordguvgdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhig
    qdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgv
X-ME-Proxy: <xmx:xwe5Z3nXe1TciZesaNIF_WfxTIrOd9ZVatUZ_MdLzZLi-717L3fiTw>
    <xmx:xwe5Z904IQrV5Zth5ID9kt4FpFRaZcXEYdyt8Uac8-HftNGpNKVCUg>
    <xmx:xwe5Z2tg3rt_JzEQKNJzM3dcMyoi5aG9zJNI6iOPw7GXZdl7CBF3oQ>
    <xmx:xwe5ZxXBkOd7ESDAZKoJ8j9nmTybX2rVsfxuWoPj8AjoXRdazcCBHA>
    <xmx:xwe5Z3pe-5k65pEgIkn_S0QSnkao6WoOduUAH-EflodixkmTftwLdnSe>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Feb 2025 18:09:58 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: adv7180: Disable test-pattern control on adv7180
Date: Sat, 22 Feb 2025 00:09:07 +0100
Message-ID: <20250221230907.1230076-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The register that enables selecting a test-pattern to be outputted in
free-run mode (FREE_RUN_PAT_SEL[2:0]) is only available on adv7280 based
devices, not the adv7180 based ones.

Add a flag to mark devices that are capable of generating test-patterns,
and those that are not. And only register the control on supported
devices.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index ff7dfa0278a7..6e50b14f888f 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -195,6 +195,7 @@ struct adv7180_state;
 #define ADV7180_FLAG_V2			BIT(1)
 #define ADV7180_FLAG_MIPI_CSI2		BIT(2)
 #define ADV7180_FLAG_I2P		BIT(3)
+#define ADV7180_FLAG_TEST_PATTERN	BIT(4)
 
 struct adv7180_chip_info {
 	unsigned int flags;
@@ -682,11 +683,15 @@ static int adv7180_init_controls(struct adv7180_state *state)
 			  ADV7180_HUE_MAX, 1, ADV7180_HUE_DEF);
 	v4l2_ctrl_new_custom(&state->ctrl_hdl, &adv7180_ctrl_fast_switch, NULL);
 
-	v4l2_ctrl_new_std_menu_items(&state->ctrl_hdl, &adv7180_ctrl_ops,
-				      V4L2_CID_TEST_PATTERN,
-				      ARRAY_SIZE(test_pattern_menu) - 1,
-				      0, ARRAY_SIZE(test_pattern_menu) - 1,
-				      test_pattern_menu);
+	if (state->chip_info->flags & ADV7180_FLAG_TEST_PATTERN) {
+		v4l2_ctrl_new_std_menu_items(&state->ctrl_hdl,
+					     &adv7180_ctrl_ops,
+					     V4L2_CID_TEST_PATTERN,
+					     ARRAY_SIZE(test_pattern_menu) - 1,
+					     0,
+					     ARRAY_SIZE(test_pattern_menu) - 1,
+					     test_pattern_menu);
+	}
 
 	state->sd.ctrl_handler = &state->ctrl_hdl;
 	if (state->ctrl_hdl.error) {
@@ -1221,7 +1226,7 @@ static const struct adv7180_chip_info adv7182_info = {
 };
 
 static const struct adv7180_chip_info adv7280_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P | ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1235,7 +1240,8 @@ static const struct adv7180_chip_info adv7280_info = {
 };
 
 static const struct adv7180_chip_info adv7280_m_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 | ADV7180_FLAG_I2P,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 | ADV7180_FLAG_I2P |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1256,7 +1262,8 @@ static const struct adv7180_chip_info adv7280_m_info = {
 };
 
 static const struct adv7180_chip_info adv7281_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN7) |
@@ -1271,7 +1278,8 @@ static const struct adv7180_chip_info adv7281_info = {
 };
 
 static const struct adv7180_chip_info adv7281_m_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1291,7 +1299,8 @@ static const struct adv7180_chip_info adv7281_m_info = {
 };
 
 static const struct adv7180_chip_info adv7281_ma_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
@@ -1316,7 +1325,7 @@ static const struct adv7180_chip_info adv7281_ma_info = {
 };
 
 static const struct adv7180_chip_info adv7282_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_I2P | ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN7) |
@@ -1331,7 +1340,8 @@ static const struct adv7180_chip_info adv7282_info = {
 };
 
 static const struct adv7180_chip_info adv7282_m_info = {
-	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 | ADV7180_FLAG_I2P,
+	.flags = ADV7180_FLAG_V2 | ADV7180_FLAG_MIPI_CSI2 | ADV7180_FLAG_I2P |
+		ADV7180_FLAG_TEST_PATTERN,
 	.valid_input_mask = BIT(ADV7182_INPUT_CVBS_AIN1) |
 		BIT(ADV7182_INPUT_CVBS_AIN2) |
 		BIT(ADV7182_INPUT_CVBS_AIN3) |
-- 
2.48.1


