Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CAB3AE87D
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 13:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhFUL7J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 07:59:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:34248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229695AbhFUL7H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 07:59:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A2EF61206;
        Mon, 21 Jun 2021 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624276613;
        bh=ANoabVaUzkB8uByqIYbl9sn5GX3seetBSDp7JoEwpi4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BCQFDbRPbo0454eQTUJ9Zpws8unRKPu8AQlSFcr1y13HQ2miRH7IyucBxiS/KgFOa
         kJK8EOt3eVF1405qY3OXSKG7D9DNh9HlsIpfMo5CnLYLQEybnQUyl8QCWsu8Ot/Uqj
         xDSzJtfN+nvQuUQ9Sw9Sx91xoOv0a0aRnUQFqYbmBwidXXAf9P78ls9Cxl29BxlVQA
         AxJydMCVtfoFhCdyNYG4es2UVlmAIrlqotxn0ECZGcYSicHGL6v3qwv4krbHiPU2e6
         D5LKVqjSTXNmvybfW73yySZyr4/vCoMx08Hk2XmW90BvDOZDIKsZif/O3PeiKNoxEY
         HBDJ6n8xx4sYw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lvIXq-000Hcg-S7; Mon, 21 Jun 2021 13:56:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 1/5] media: dib8000: rewrite the init prbs logic
Date:   Mon, 21 Jun 2021 13:56:45 +0200
Message-Id: <4727871dc9f255dbaed6f44799f9980d41e5f637.1624276137.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624276137.git.mchehab+huawei@kernel.org>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The logic at dib8000_get_init_prbs() has a few issues:

1. the tables used there has an extra unused value at the beginning;
2. the dprintk() message doesn't write the right value when
   transmission mode is not 8K;
3. the array overflow validation is done by the callers.

Rewrite the code to fix such issues.

This should also shut up those smatch warnings:

	drivers/media/dvb-frontends/dib8000.c:2125 dib8000_get_init_prbs() error: buffer overflow 'lut_prbs_8k' 14 <= 14
	drivers/media/dvb-frontends/dib8000.c:2129 dib8000_get_init_prbs() error: buffer overflow 'lut_prbs_2k' 14 <= 14
	drivers/media/dvb-frontends/dib8000.c:2131 dib8000_get_init_prbs() error: buffer overflow 'lut_prbs_4k' 14 <= 14
	drivers/media/dvb-frontends/dib8000.c:2134 dib8000_get_init_prbs() error: buffer overflow 'lut_prbs_8k' 14 <= 14

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/dib8000.c | 56 +++++++++++++++++++--------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/media/dvb-frontends/dib8000.c b/drivers/media/dvb-frontends/dib8000.c
index 082796534b0a..541f8b9f5f8a 100644
--- a/drivers/media/dvb-frontends/dib8000.c
+++ b/drivers/media/dvb-frontends/dib8000.c
@@ -2107,32 +2107,53 @@ static void dib8000_load_ana_fe_coefs(struct dib8000_state *state, const s16 *an
 			dib8000_write_word(state, 117 + mode, ana_fe[mode]);
 }
 
-static const u16 lut_prbs_2k[14] = {
-	0, 0x423, 0x009, 0x5C7, 0x7A6, 0x3D8, 0x527, 0x7FF, 0x79B, 0x3D6, 0x3A2, 0x53B, 0x2F4, 0x213
+static const u16 lut_prbs_2k[13] = {
+	0x423, 0x009, 0x5C7,
+	0x7A6, 0x3D8, 0x527,
+	0x7FF, 0x79B, 0x3D6,
+	0x3A2, 0x53B, 0x2F4,
+	0x213
 };
-static const u16 lut_prbs_4k[14] = {
-	0, 0x208, 0x0C3, 0x7B9, 0x423, 0x5C7, 0x3D8, 0x7FF, 0x3D6, 0x53B, 0x213, 0x029, 0x0D0, 0x48E
+static const u16 lut_prbs_4k[13] = {
+	0x208, 0x0C3, 0x7B9,
+	0x423, 0x5C7, 0x3D8,
+	0x7FF, 0x3D6, 0x53B,
+	0x213, 0x029, 0x0D0,
+	0x48E
 };
-static const u16 lut_prbs_8k[14] = {
-	0, 0x740, 0x069, 0x7DD, 0x208, 0x7B9, 0x5C7, 0x7FF, 0x53B, 0x029, 0x48E, 0x4C4, 0x367, 0x684
+static const u16 lut_prbs_8k[13] = {
+	0x740, 0x069, 0x7DD,
+	0x208, 0x7B9, 0x5C7,
+	0x7FF, 0x53B, 0x029,
+	0x48E, 0x4C4, 0x367,
+	0x684
 };
 
 static u16 dib8000_get_init_prbs(struct dib8000_state *state, u16 subchannel)
 {
 	int sub_channel_prbs_group = 0;
+	int prbs_group;
 
-	sub_channel_prbs_group = (subchannel / 3) + 1;
-	dprintk("sub_channel_prbs_group = %d , subchannel =%d prbs = 0x%04x\n", sub_channel_prbs_group, subchannel, lut_prbs_8k[sub_channel_prbs_group]);
+	sub_channel_prbs_group = subchannel / 3;
+	if (sub_channel_prbs_group >= ARRAY_SIZE(lut_prbs_2k))
+		return 0;
 
 	switch (state->fe[0]->dtv_property_cache.transmission_mode) {
 	case TRANSMISSION_MODE_2K:
-			return lut_prbs_2k[sub_channel_prbs_group];
+		prbs_group = lut_prbs_2k[sub_channel_prbs_group];
+		break;
 	case TRANSMISSION_MODE_4K:
-			return lut_prbs_4k[sub_channel_prbs_group];
+		prbs_group =  lut_prbs_4k[sub_channel_prbs_group];
+		break;
 	default:
 	case TRANSMISSION_MODE_8K:
-			return lut_prbs_8k[sub_channel_prbs_group];
+		prbs_group = lut_prbs_8k[sub_channel_prbs_group];
 	}
+
+	dprintk("sub_channel_prbs_group = %d , subchannel =%d prbs = 0x%04x\n",
+		sub_channel_prbs_group, subchannel, prbs_group);
+
+	return prbs_group;
 }
 
 static void dib8000_set_13seg_channel(struct dib8000_state *state)
@@ -2409,10 +2430,8 @@ static void dib8000_set_isdbt_common_channel(struct dib8000_state *state, u8 seq
 	/* TSB or ISDBT ? apply it now */
 	if (c->isdbt_sb_mode) {
 		dib8000_set_sb_channel(state);
-		if (c->isdbt_sb_subchannel < 14)
-			init_prbs = dib8000_get_init_prbs(state, c->isdbt_sb_subchannel);
-		else
-			init_prbs = 0;
+		init_prbs = dib8000_get_init_prbs(state,
+						  c->isdbt_sb_subchannel);
 	} else {
 		dib8000_set_13seg_channel(state);
 		init_prbs = 0xfff;
@@ -3004,6 +3023,7 @@ static int dib8000_tune(struct dvb_frontend *fe)
 
 	unsigned long *timeout = &state->timeout;
 	unsigned long now = jiffies;
+	u16 init_prbs;
 #ifdef DIB8000_AGC_FREEZE
 	u16 agc1, agc2;
 #endif
@@ -3302,8 +3322,10 @@ static int dib8000_tune(struct dvb_frontend *fe)
 		break;
 
 	case CT_DEMOD_STEP_11:  /* 41 : init prbs autosearch */
-		if (state->subchannel <= 41) {
-			dib8000_set_subchannel_prbs(state, dib8000_get_init_prbs(state, state->subchannel));
+		init_prbs = dib8000_get_init_prbs(state, state->subchannel);
+
+		if (init_prbs) {
+			dib8000_set_subchannel_prbs(state, init_prbs);
 			*tune_state = CT_DEMOD_STEP_9;
 		} else {
 			*tune_state = CT_DEMOD_STOP;
-- 
2.31.1

