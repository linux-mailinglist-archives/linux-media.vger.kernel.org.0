Return-Path: <linux-media+bounces-51449-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JEJDVZ4dGmn5wAAu9opvQ
	(envelope-from <linux-media+bounces-51449-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:44:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3854E7CD66
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF3713002B4A
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 07:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128D427BF6C;
	Sat, 24 Jan 2026 07:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UROL2jhA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFC33EBF1E
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769240654; cv=none; b=Gww2ikSInN2b1N9adUi7MBvnmWTX/9FaMqARZLkAf446A0ITtDdJV6nukkcq46NFhiEgbBpQt9bwnI/YtNGRWbz2peBvjQOIMxvTTpUJpMdZ/DIVbNTQTPK/GZEzyB/l2WdHv3ToLLDwF0h1Qr6DFwOGkryXj5bTknkLOqSRYIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769240654; c=relaxed/simple;
	bh=MVWOlfgijHPkOcb4QaQfnouIclaSgcelMlsvCV2GKPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXaePz4LeSg/Bg9RErITVW7wehoARrDDuciSa9t3uXuWGm3PuQFTCPKPOL/lZf8TPmQ61Zv0RZj+CMWMHiXNxbLsnLmJHFO2GpQ8dFaEJcfDq/KmkQDnZbnCSOGffueJDP+bnjct7w0+QU0q8pmwsN/RS24q3hqnMMVkFcRn7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UROL2jhA; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34b75fba315so1755379a91.3
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 23:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769240652; x=1769845452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTuVzje+JSWmPQDj+Mm/AjilQFXf4pY+htb+endnqZQ=;
        b=UROL2jhA21YE7d7GviNhR7ak2OqmOWE7/qCVgkZE3Fu2qwfUlutxJStIwcKUXcr9qn
         Nvy1fwlRR8wd2n4b9sEiIMmyJod/L8TtQNysvqR7vsl1DVb+AlrvVrXi0iSFcaoedL3x
         Waulf4XYIIctkV+a77oTWN8su3EuFd8e/qrRXE4IaH10XM3HZs7buPzChZh7SWjldOp5
         +En2nlJmy1+wa5U+mRvrfwUTwTUN9mqWxe0p/qebimrYp0tZfCBCrJqbiIJXNg1JSHdI
         N7mwA9OPk4MeoycYm8GWo09WJAPJIR1sxnQauTkIQY0Q6pEHDgLdDFOTIfwq1ZXrCrrb
         O5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769240652; x=1769845452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zTuVzje+JSWmPQDj+Mm/AjilQFXf4pY+htb+endnqZQ=;
        b=hnJaiS1+t1hWrYn4+t5PuxrT7xzTPV8lJtsBKtLw3dphfjhhum5rF3xbsvYov1jcNG
         U8SNcnTDYC7VbMcavTWdX0OUF4FrLsz1S3z1Zj7swPzWnOWbL0vAavYczChZvLHMgI7g
         3z/JyAqKJyTo5X5084FnayyDkLuRNZXlXJ1AxPfnBE0SaFHSxanIb7c002uiv4OqN2hp
         8sykCrXPZsB0moO03aopnaUrgyMjLIDO8soROQ/6fUKIgAddYxQCPmGLUQRwMzKBDk3z
         1QBE5ucXNkRh9WKCdBAvR6j9XMd+VGXP6OuMGaQPjN9UG2yJANnIWgqndIafCww58W45
         RQIA==
X-Gm-Message-State: AOJu0YxBAwEAXpUEaBkjMVSzPv5Wb7tWp43ZFCQmIcoxFfgByKnFV8kl
	dJxpl4flzTZqD/joM6L0j1w677bSfBLU746mJJj258MB6Zohebka6LY79L+ztPoh
X-Gm-Gg: AZuq6aKKhNOEf/h0yKZMG9FlMvR4RCEt2scNCHneS4osaYW2GcrUxXvtKE0+UTJNIJX
	JjoV89H1Rd1Vwh6PJ/EEDXfn84UBy1S9j7IbGHvN5tC/xrTNws4PRaH59km1QEQOhvn/N0wk3c3
	3V2M08gzYuplquN/L0dVXUhvp6/mEcNrROKU0mz4WohPBs+r61u6DSj5y2/UhiWzGViwsSqhj9G
	mGPKoCFuFCSTX4gSFlPo2IUIksPh4075CFhoKiXLk1Jic2hANyzw/W1Ntd90fzW1rCezOpNHcxl
	i+roFfmZqDsSqVos2hRrY8DrvCM0dMG0pz2meZil+FT/Lxseond6bldz9wfl3azkrcHkLu87uAn
	YRS9t1cVJXh1oXaQA30gV9knfz0d6pLSL0Qhnv3lMuMIpr+22CFQY/BbfPdZZGun4Wd9lmby5D0
	KuPck2lXg+xdZPIp35efANAs3AqkEr3q6dS5c=
X-Received: by 2002:a17:90b:3f10:b0:34c:a015:9cb0 with SMTP id 98e67ed59e1d1-3537a8c85fbmr2850652a91.22.1769240652479;
        Fri, 23 Jan 2026 23:44:12 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:1ce:3fd2:e11e:72d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a42a626sm3653985a12.31.2026.01.23.23.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 23:44:12 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: hansg@kernel.org,
	bod@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] media: i2c: ov02c10: Fix incorrect Bayer pattern to SGRBG10
Date: Sat, 24 Jan 2026 13:13:39 +0530
Message-ID: <20260124074402.7165-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124074402.7165-1-bjsaikiran@gmail.com>
References: <20260124074402.7165-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-51449-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3854E7CD66
X-Rspamd-Action: no action

The OV02C10 driver incorrectly reports SBGGR10 Bayer pattern, but
the actual sensor hardware outputs SGRBG10 (Green-Red-Blue-Green).
This mismatch causes severe green color tint in all captured images.

The correct pattern was determined through:
1. Testing on Lenovo Yoga Slim 7x (Snapdragon X Elite)
2. Comparison of all four Bayer patterns (SBGGR10, SGBRG10, SGRBG10, SRGGB10)
3. Visual verification with libcamera/qcam showing natural colors with SGRBG10

Without this fix, the camera produces unusable images with overwhelming
green tint regardless of lighting conditions or camera application used.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index f156f647081f..cf93d36032e1 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -577,7 +577,7 @@ static void ov02c10_update_pad_format(const struct ov02c10_mode *mode,
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	fmt->field = V4L2_FIELD_NONE;
 }
 
@@ -732,7 +732,7 @@ static int ov02c10_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 
 	return 0;
 }
@@ -744,7 +744,7 @@ static int ov02c10_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
+	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.51.0


