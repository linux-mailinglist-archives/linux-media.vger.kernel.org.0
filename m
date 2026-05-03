Return-Path: <linux-media+bounces-60201-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMM+OwJ892kpiQIAu9opvQ
	(envelope-from <linux-media+bounces-60201-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 18:46:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06A4B6927
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 18:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 491B03026F0E
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 16:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F001D363C77;
	Sun,  3 May 2026 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOQJq025"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944083CF68E
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826705; cv=none; b=XJzmI+LNzjiQRr9ziE8vbIP6uS7zqNNwIJRPnj96qKdOZAtjmOetm5gsXLMCahvkUnmy8Nc3UJgI0NjSnZ6dqe0AbKgOHGM15q9UX9hnN1nHJ5SqAxz3gzmZOVu1AMbUip2XRFuAWMSa7DNstA9FARdUe08CuPbyOmRi6I0dry8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826705; c=relaxed/simple;
	bh=LRXlNS9x02z8g+CGxmATU/6gvHvDK0YuBVqtECCU2ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7LLWLCrcNWt0Gmo5aY/LCnTmABx6ZlJfDPgNvnSCvI8EIYL21jZqxbiGJ8h4/8JS1UekMkyeJ66Ni8xS/DVOIgK9Cm+OhemmO318W2lBfCqg+4746hPDXQL7luqzuhJ2z3Epzlx+b067kMZXd5sQAMZB/sIu5//e+/LXAm9bQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOQJq025; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6794b8699b8so4252404a12.1
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826701; x=1778431501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=OOQJq025zP22Fc7s20qoPylJWHgRBwlbxBySVpn+FzjwdqMH9bk+vq83xwjYbvImtj
         mNmil/SjoqdgCv97K7ZMWVAXQ9fPYeaDB3BlnfGyQ5DD7ZIqdGnSAdIKaIfp3azyUj7u
         MnVMArB9a6mDhiCeI/R+oGjfROe6bFO85HQNtyHxhn6bTXId+DAFqGY605ql63tJko0L
         tRKeECTiPBFEOZPtfg1Gz4Sw6SxN+f3P9eRu/2rbT/Mq8J1uoTbPiOOEjNyzfRw+km+s
         J7PS518sm+INx4jcAfPAB5mwVjaiO3Pl+IKT8jDwcAuDWvfTa/GS22b1Sg2l9CGBzFst
         BINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826701; x=1778431501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=MhcMUh3TbiONYbzWpNr8I0f9zXohdyXZ9NVo8Hng4Sr0KdzLY/SH+89OMNZHJS3IqN
         3mCLp4snqFL220XFqrgfRZAW7XHDt2z1LhSXU6GyTUDta12VUOLKgXD3wYkBfko60WUZ
         ZOKuMtCW9M9ETKnuiAou2BWBEyNkLhj+JUprhy3U4fMSNFi1SIgynnsVUYWdGBWTPMFD
         bG/Xt6D4fFeJwkqUogkjiAhjCgYqtEbcF/u2t5BjhwMMT/vnNfstl9riWs3mirugQMPq
         ih9MaqXsmjnPTOK2hX1sYz3RT+l/gGmeH+/sp9uv5rWDvlB99ERnjFKWY3QOpCh6CYdx
         A/Gg==
X-Forwarded-Encrypted: i=1; AFNElJ8Grs5PeYiePJcvNhgkArK0xYOhxOSdEtIO1xjEfDOohMCJ6qijHJM78TqmgAmqVtrn+ME82w4kvwgtFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+/jeXeIeqvXNi5IWyVoClOR06OvNUo4Hub68Sz5npo06RCQwb
	YnndSobD23+tKs6AnGKVxw7csK+V76flaCFl7EILcKaNOKKrK1kKpdBe
X-Gm-Gg: AeBDiesqI0d3wkxealZ77YZz/ZmDKHImlNZACJmoP7DbROv2lcLSyLMcDikvZSrNB/e
	bsAknfScT/aUiHZtaiWSIddh9KTVpMBer1pJHkupdP+oRvn9+h1sG1DCi5eqQ/MHAyvmu5OAbJP
	DB9waqknLx3Tth8SUnvDs2aTFidBmsm2GHmBbaelMF4hw+jrsEQp+PtY3CKPu/tIxhUBhcqKvPk
	GbWMicUWW7AUTQWB1I+fkXAueZMhYNU5PQo/WA5Y4RWjWFN2HtQIUw4pY0YwoGztM4n49JC44E1
	/SiDkh2xlzzUz97ZfYJ9Y3bOf5B6UGa4Qmfo0l+F9mW5tI206ItCqeCFsrlKGrePjH6qrMupE8D
	sBFOlIQCKFPgXD6Gqf2jzHvnxa2U/FYIo0+klTAgOtZY1CRCRntx36Xln76D/KhpHLQHFKARxNt
	BJC1FUrVnfHZm++J+sPoS38QM=
X-Received: by 2002:a17:906:2083:b0:ba9:559:10c8 with SMTP id a640c23a62f3a-bbffbf85acdmr212670666b.41.1777826700933;
        Sun, 03 May 2026 09:45:00 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc237ef8297sm27430566b.57.2026.05.03.09.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:45:00 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v5 3/6] media: i2c: lm3560: Optimize mutex lock usage
Date: Sun,  3 May 2026 19:44:42 +0300
Message-ID: <20260503164445.215540-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503164445.215540-1-clamor95@gmail.com>
References: <20260503164445.215540-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7A06A4B6927
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60201-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Pass the device's own mutex lock to the control handler so that the media
framework can handle control access instead of managing it manually. The
lock must be common to both sub-devices since they share same hardware,
so the individual sub-device locks will not work here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index edfb07587cab..5b568ed9536b 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -162,14 +162,12 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	if (ctrl->id == V4L2_CID_FLASH_FAULT) {
 		s32 fault = 0;
 		unsigned int reg_val;
 		rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
 		if (rval < 0)
-			goto out;
+			return rval;
 		if (reg_val & FAULT_SHORT_CIRCUIT)
 			fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
 		if (reg_val & FAULT_OVERTEMP)
@@ -179,8 +177,6 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		ctrl->cur.val = fault;
 	}
 
-out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -190,8 +186,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	u8 tout_bits;
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
 		flash->led_mode = ctrl->val;
@@ -202,14 +196,12 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_SOURCE:
 		rval = regmap_update_bits(flash->regmap,
 					  REG_CONFIG1, 0x04, (ctrl->val) << 2);
-		if (rval < 0)
-			goto err_out;
 		break;
 
 	case V4L2_CID_FLASH_STROBE:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_FLASH;
 		rval = lm3560_mode_ctrl(flash);
@@ -218,7 +210,7 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_STOP:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_NONE;
 		rval = lm3560_mode_ctrl(flash);
@@ -239,8 +231,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		break;
 	}
 
-err_out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -328,6 +318,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 	if (fault != NULL)
 		fault->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
+	hdl->lock = &flash->lock;
+
 	if (hdl->error)
 		return hdl->error;
 
@@ -363,6 +355,7 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 	if (rval < 0)
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
+	flash->subdev_led[led_no].state_lock = &flash->lock;
 
 	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
 	if (rval < 0) {
-- 
2.51.0


