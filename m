Return-Path: <linux-media+bounces-51587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHzOJOmld2lrjwEAu9opvQ
	(envelope-from <linux-media+bounces-51587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 18:35:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 374DB8B8C7
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 18:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 827F63045229
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 17:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCC334D4E9;
	Mon, 26 Jan 2026 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wj53pFdo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D205633A9FA
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 17:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448908; cv=none; b=UNH+GckpE418WABm4naX3i5cCOMPIcm8HrZIfKCOv9Noixy+QNqEBzkeeaSQHFT+ahfP6LsJ06fu7ai2Ehaghtv6w9G0v75kpyGV6/cvh/av9arv/6TGE3Rs20UJ6sTieTy2tE4N/Q9/k6MyQCs5pPUKiKFoEA4V5smxZkRewB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448908; c=relaxed/simple;
	bh=05r0N/P1sH0YTipwKMxBYm438Ju3s7xaIh6VOJ1yiys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FvUBhdc25evg1GdknsH7pzw6OsDj70v7r4E7CqtEmjIM2dMvfs1451ZmNtbZvgoclvHB0rY9ch5f+3zbrmnQxlR8BKQbhqBM6NCfOV2THOXru6InxauRHcaP/1l3DPIODq7DYm7pI+Jil13NXmnMVRAbFKQsONuKVMfSnIKAch4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wj53pFdo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so35262525ad.3
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 09:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769448906; x=1770053706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8RKPcwVeGZdKkCxqhj/W0dUP9zEkcKV20nHAwN/Abc=;
        b=Wj53pFdouH2W34UYnfK3JjUwXTprQzj2Geo9SyQTayRbw06oCwNCD61QPgqAIddi2m
         HvCvBrtwq/YuC9OqdSd7Ff8Gu8l7xS6AgUJ2CNr/P9gr8gVJqDnx4YeNcbIu9hiS4eV6
         hTZOt7BmVh0OKBAFwjRZUb8yGHG8XVom1R7tKxyxsVU2yMWrm0Net+PdBkyDpwwpY4GC
         zhuMrQO83baAnNWT7VjsteRai7kwpORq0KuPlVT/V6xCKrN0TX4nmPMUbvghyaMzW+jk
         ChK28HXwVDA/7BPiV0dhhmxJ1gnlfVALUnhBSiefQuHzFCUhRIbzgKaaYRShDn8mP2cT
         KxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448906; x=1770053706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H8RKPcwVeGZdKkCxqhj/W0dUP9zEkcKV20nHAwN/Abc=;
        b=SZ2/A9cf9ps4RaOcnMKl+kRhBEY7qt6bbVQ1uFGi8OuRbd9jvY3Fb3jL+q4lPxr2qX
         oF0wo8DEQdt1FCuJ/TgUmMUYtEPfhPgTpon+QgA89adp1fsgXP8u9Ge7nOC2uf/KxK68
         yvZFYUPnuKbyml7qEsJoiGW3HLrukyooV+83+rdGSeM1dg0V4bfqegHjY+pRf951Dnbz
         wLps4c8SaiMJ6GSRmnBwf941NtR5e0LDf19xfFAUGIN+04/ZubgJaY9+iFCzVoYHZehe
         xbaGI0DA+PszWFYlWgVzNv3bBJqDxlqZSSmMNl+7zzZIwdgDNVJCnhzi5MMMKq8ZF6SC
         S5hA==
X-Gm-Message-State: AOJu0YyxyelEGD5QlzUeBqgtSPjbIMerFq+foYwUdMOd8K8zRrFRxBiB
	QLpvCzPjcjZYegEXCvUAotH0E1fbeG9yprHioZ9oPPSXRHGQlVMDvneFQpPPZ2RW
X-Gm-Gg: AZuq6aKr7HO79IK6Yiu3dhxRrKkjq13SsBUg90yaMGEdjK7Tb0oZbVjzBwp3pMnOn19
	/SEHnyzLU1hnoDvkD2O7h46CPGiqSUJHjzsDySBto0i/dJCWEzQPkwsy6Nuj+hOEVqgTbYXlkcz
	2DNccPKyA/qFg8N1/XrkTIZVehZzc4JiIy/qyV7N6+lACpBtZoAfrXCWQuBkb1ZoKR53h87tx1N
	qquxrB9i3CkJmyPbPemTNM5jx4fIjqSK11Ya4iwL1Gef/qmMq72ZDuKASnUR3AcLpdNZgour8L0
	9rTvDgXkhTZYaV2vtgkL1wTxS2iXrnEWOvPvAW7pKZlrdP0+vvdPFgj9nH3f1Dh6PuXcXeXEU/C
	MH44vMRjKT4D2Xbj90UucAevP3YoE0CJnjRiBAJWahB5IypV2fDikuaSygKuKhf590FRgp+ChV2
	Eg87k5YL6DeCSdI8T17SQwP3ZbY7mLztrTI+y+
X-Received: by 2002:a17:903:1a43:b0:2a0:86cd:1e3a with SMTP id d9443c01a7336-2a845325626mr44571925ad.44.1769448905944;
        Mon, 26 Jan 2026 09:35:05 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:e23f:af76:8280:9d84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61292bdsm86787a91.6.2026.01.26.09.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:35:05 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	stable@vger.kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v3 3/3] media: i2c: ov02c10: Use runtime PM autosuspend to avoid brownouts
Date: Mon, 26 Jan 2026 23:04:44 +0530
Message-ID: <20260126173444.10228-4-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126173444.10228-1-bjsaikiran@gmail.com>
References: <20260126173444.10228-1-bjsaikiran@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-51587-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 374DB8B8C7
X-Rspamd-Action: no action

On Qualcomm X1E80100 platforms, the OV02C10 sensor experiences brownouts
if power-cycled too quickly (< 2.3s) due to slow passive discharge of
regulator rails.

Implement Runtime PM Autosuspend with a delay of 1000ms. This keeps the
regulators enabled for a short duration after the device is closed,
preventing costly power-off/power-on cycles during rapid user
interactions (e.g., browser permission checks).

This aligns the driver with standard power management practices used in
other sensor drivers (e.g., ov2680) to handle platform latency
constraints.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Fixes: 44f8901 ("media: i2c: add OmniVision OV02C10 sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index ba8bbb4f433a..9f6c4e8b06cc 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -628,7 +628,7 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
 out:
 	if (ret)
-		pm_runtime_put(ov02c10->dev);
+		pm_runtime_put_autosuspend(ov02c10->dev);
 
 	return ret;
 }
@@ -640,7 +640,7 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
 	cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
-	pm_runtime_put(ov02c10->dev);
+	pm_runtime_put_autosuspend(ov02c10->dev);
 
 	return 0;
 }
@@ -900,6 +900,7 @@ static void ov02c10_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(sd);
 	pm_runtime_disable(ov02c10->dev);
+	pm_runtime_dont_use_autosuspend(ov02c10->dev);
 	if (!pm_runtime_status_suspended(ov02c10->dev)) {
 		ov02c10_power_off(ov02c10->dev);
 		pm_runtime_set_suspended(ov02c10->dev);
@@ -983,6 +984,8 @@ static int ov02c10_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup;
 	}
 
+	pm_runtime_set_autosuspend_delay(ov02c10->dev, 1000);
+	pm_runtime_use_autosuspend(ov02c10->dev);
 	pm_runtime_set_active(ov02c10->dev);
 	pm_runtime_enable(ov02c10->dev);
 
-- 
2.51.0


