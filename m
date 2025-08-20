Return-Path: <linux-media+bounces-40328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E8B2D098
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 02:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3689723E0A
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 00:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7727028E0F;
	Wed, 20 Aug 2025 00:14:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ring0.de (ring0.de [152.53.19.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0F24A32;
	Wed, 20 Aug 2025 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.19.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755648843; cv=none; b=NlN/rl+02zK9NBZT60Wum0jAaMBQlIz2ua0EX/Zh2cmvFhMh8OIRATOVlmku04HfGZuTRx8ufFKmQsd43C6qquSuw4AET2UklWIpcj7gm+T1ZZrjKYoyyfQfgp+q5fWUsDFd8aJeXq5oFli9FODItqoenFZsIyqPaaYxeyHyZLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755648843; c=relaxed/simple;
	bh=KCY7Qq4+JICG9df4WUnLRlAsQad19ixemPvFLVyQn48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HD5T9XYFcXs4hhlzIuRosBdFLHndcHI5dOCFRDQX/9Lyt3y4vTzsiFko+6U0Zc/KYwBZr0RSbisriuKNYJdA81m9oVOEvskM9xLAAfGgSjloq9y0aQ58seDgdOd0yg63rlMD9lXrdcZ2fGlRMWc6290KouQhaDmDjpT0dIlKUhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=ring0.de; arc=none smtp.client-ip=152.53.19.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ring0.de
From: Sebastian Reichel <sre@kernel.org>
Authentication-Results: ring0.de;
	auth=pass smtp.mailfrom=sre@ring0.de
Date: Wed, 20 Aug 2025 02:13:20 +0200
Subject: [PATCH 2/2] media: ov02c10: Support hflip and vflip
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-ov02c10-fix-v1-2-3fcca2cfbfbf@kernel.org>
References: <20250820-ov02c10-fix-v1-0-3fcca2cfbfbf@kernel.org>
In-Reply-To: <20250820-ov02c10-fix-v1-0-3fcca2cfbfbf@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Frederic Stuyk <fstuyk@runbox.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304; i=sre@kernel.org;
 h=from:subject:message-id; bh=KCY7Qq4+JICG9df4WUnLRlAsQad19ixemPvFLVyQn48=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBopRM4RLhi0GrEULs2NRB83omMvHzp6rV8xTyML
 30HcNsyAVmJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaKUTOAAKCRDY7tfzyDv6
 mjMsD/9x8sK+x4Mfya5Boj1JlrU1UfhxkdG3+0Xp8qtB5LWv97IIS5M02+DsE99PNDjPdaaHjhc
 QG/syvpgVxwmPy/AecNC2HeSSVrl+iRICT49v9OmgqxPmeFI0KXab80ITiwFKpqGQeNWmaO4g+R
 gi+9kL1rfKqh6n4DlQ6OvF8ADRsEsfbn4rhkM7a02rqbGPTyc21l72dJgS6jXZ8dwK4DkU0xw9y
 0hDrj+dIX6jZF3fxPk93cnisqttMEiCSTZQS/GeBghlx+hu3NlkM2XBqMEs/bHFUYv7uUjskSL/
 tL5HqCfxZfWtGzs18LgBeiH8pI5P5BdGn6+N0TFEuVnTHqBv1OepJ0/DEHPOorcDm0D9gqtsS6k
 2I4pP+HPtEWldoyWpBv3ipp/MX/4sMxweJ9oT2+A+Vu7FBJ+++WAJKj95p83zVwXHXdKs4qEoo2
 NYH30qscDencKTM3Ls1+arsKzl4IGjRJ+J3ORfTnaUVz69SSVoLAdeybpEX3LKfE6HXj/i87+O8
 t8aEKI6H3J5ZYEaTcloFMY2KXXK6ovvrg3VVklj+sQGr4R92kZKFi1eTG/RQcifpGlmSH1BDG5Z
 snt+sOcO9hYl9ZUGMOa+Dc3Pw8iaypFXK4p6UD1L6CUGVcTENVAyn+qMLxBdZ6yulbFr8NcWMMc
 NSuYWkiZpv1LO1w==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-Rspamd-Server: antispam
X-Rspamd-Queue-Id: B0148E31FA
X-Spamd-Result: default: False [-1.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	FORGED_SENDER(0.30)[sre@kernel.org,sre@ring0.de];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:39351, ipnet:193.32.248.0/24, country:SE];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[runbox.com,vger.kernel.org,kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	IS_LOCAL_DOMAIN_E(0.00)[ring0.de];
	FROM_NEQ_ENVFROM(0.00)[sre@kernel.org,sre@ring0.de];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,runbox.com]
X-Rspamd-Action: no action
X-Spamd-Bar: -

Support horizontal and vertical flip, which is necessary to handle
upside-down mounted sensors.

Suggested-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/media/i2c/ov02c10.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 3a02fce0a9bc0ca3ab87defe3eefd04efb4012e7..103d007415348a8bd31a09e518de23f5fd77c618 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -384,6 +384,8 @@ struct ov02c10 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *hflip;
+	struct v4l2_ctrl *vflip;
 
 	struct clk *img_clk;
 	struct gpio_desc *reset;
@@ -462,6 +464,16 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov02c10_test_pattern(ov02c10, ctrl->val);
 		break;
 
+	case V4L2_CID_HFLIP:
+		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
+				BIT(3), ov02c10->hflip->val << 3, &ret);
+		break;
+
+	case V4L2_CID_VFLIP:
+		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
+				BIT(4), ov02c10->vflip->val << 4, &ret);
+		break;
+
 	default:
 		ret = -EINVAL;
 		break;
@@ -486,7 +498,7 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 	s64 exposure_max, h_blank, pixel_rate;
 	int ret;
 
-	v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
 	ov02c10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						    &ov02c10_ctrl_ops,
@@ -537,6 +549,17 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 					      exposure_max,
 					      OV02C10_EXPOSURE_STEP,
 					      exposure_max);
+
+	ov02c10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (ov02c10->hflip)
+		ov02c10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	ov02c10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (ov02c10->vflip)
+		ov02c10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov02c10_test_pattern_menu) - 1,

-- 
2.50.1


