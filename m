Return-Path: <linux-media+bounces-61956-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNjuKuvvCmpv+AQAu9opvQ
	(envelope-from <linux-media+bounces-61956-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:54:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F53256B09C
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0639A30036C1
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CD93EFFC6;
	Mon, 18 May 2026 10:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRbTEYbH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B0F3E8C68
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101667; cv=none; b=d7ZWjJs7HBbpiG6+XIxLGvngE7ehzqS8CvkrEZz7kUVvpNtubSiLzt1t1Dcx8indJ5Os7Nz7+GBxnJu/8BBIEtwyu1/It/SQPG6aJLX0RTabiWe+1wFwLA9yTSo1PRBcX/IKLqOtntaHMryqzWHLIR66o7DXfM/ov0uQxFQpnxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101667; c=relaxed/simple;
	bh=KpHz3lAQJzAohq8g44sqdTTqJWy6OEAJMENqHt74rd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=msTR6hY1eFwBiXsyZbPREHwi7GNC5nDuWOMifrOwA/cAdKV91JSFtxtJpVbQFeVMKHijTba26AAaXROkZ9KvcLvj51eElJZ6fwKA7sw8OULsdhAWpR6+4G6SkrFpVmbASSQra0KlCJWx4USvtDC9OSy1XEW7MTWNjsW+iYekFNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRbTEYbH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso20451445e9.3
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101662; x=1779706462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl/m7s8+gdhaAEkK8F8CgPM1JiiK905rKoY3T49KXgs=;
        b=qRbTEYbHn1wgrljfopAZnwIVZuqHnp78sngfpT4zbA8DF/NXNL+VzMjexvm3WdUiCG
         rPPmHsq+XfDnZ2LzukcRxrTGR1PvyUjP59uLDf9JqO4fbcYMHa3H5Qg21JTaP+b++H+t
         tLHpYyhv9Maf+JkyzumE73VU5rfndPXmGlqHTc23vn3Iizs/koMONhtVKSra1g7DyNwa
         xgcOYL2n0jGD8qB48563vgjMlftxuqb0z7hLYvRp0a+gbfRFO8onCt12O6OmFlsxlksC
         WIDtbwjGd+yALRmXna1O4EHxzt3GKB6S8Cb5XT3rrWLKkdocrvMNvYsIKcWIFFZNYWZ6
         25eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101662; x=1779706462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hl/m7s8+gdhaAEkK8F8CgPM1JiiK905rKoY3T49KXgs=;
        b=nYcd/TLA7ABOjVHfcNuTHgMYTMRKaVaDyVGsIK91MpM62Juq50Zgqzcq6s19GZPVAF
         mm0BfNep6g93IZTS8DduBN69rDCbqMSH0jOzm/eSUeZuGEf49jmFnmwUIm5Y2zSNgxYt
         9HCmWKzOU9zWEQQ/rpWTQivbBhAwyRl+1t552N6jdYX5IuCdMkpYXu4BpVlOfhorgRQR
         rx4bVqUwmdcJ/l1ZI/y/NvXGeFeWvK4BqyMP1XYlinAkZuB3CZqIx+j3Nhx8W/6ckzAo
         99qJHt0yJ4bbwwp8NwN949wQa/vsAeSHmCbep4WxxBwJ+FXWpux6sZZtnmDa4wglyy64
         3KHg==
X-Forwarded-Encrypted: i=1; AFNElJ/KNSt34TSx8MjxKT+dwiUMDH1KL3U8TC/nyMuSFEXJ5IFIy0gQ6t2eoC/Qb8xH8vFBiFogaNFHFAlKvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoqE9vDUcengFiaZ9Z6C9bF/doSBUaCIrNeCx9S/4wVUk9gZix
	ErafPaWUDyxkdMSgfuFNBCZ8c+dNe9PWlfkM02ZMUoriOTqXWKyFamo=
X-Gm-Gg: Acq92OHmWogIpmivPFX1EeW8ckI3F4DcH1y7NL/ta323jCNvNx2NXlOjKuHUhiCzO71
	u++6nYzgWrT7Qu8ohAAKjZ2HYbmkgfCFf9f7z5C7gYYMayAyb6V4XsZy30XwQIpA7TwUl4ZPag6
	qjU3Uo5PsBnE98rPkwz7x+ZuncvmN46HUYMGMjKh2SE0dPZLS8fC99kDcU1ZY9+z7GgQhgpa6Ir
	OtZs0aoHboyFbU48sWR2lbMQIl69t82LhxPveCmgyv7tZc3fJ6tyuLqByLD92kb98yUIgBxHm8E
	9YdQC5CP/SmZR6WzzRxIsFCoWNyrav0lpSjzWE/iJEdlmT1X/1a2B7wXEyl9rqnnDizk9I6lpII
	AajMtT7nDtrk4NNLvzzeUxjqUyjAxJP8aqqC4V6LJ2txagfamnWrNxECGj9cauSujOMu0jugLh4
	++IuH7hNDGXaiF0wvqKR52NcsLYjJsSZXSauXOP1gl4bbVonM8uP5Wx+7HsI9NEddAwT9iCM0XU
	T5DsRYnNEo02g==
X-Received: by 2002:a05:600c:c0db:b0:48e:8499:4be0 with SMTP id 5b1f17b1804b1-48fe60ee481mr163456935e9.15.1779101662049;
        Mon, 18 May 2026 03:54:22 -0700 (PDT)
Received: from localhost.localdomain ([151.57.14.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694f2csm249429345e9.4.2026.05.18.03.54.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 03:54:21 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
To: jonas@kwiboo.se,
	detlev.casanova@collabora.com,
	nicolas.dufresne@collabora.com,
	hverkuil@kernel.org,
	mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rkvdec: fix PM runtime teardown ordering in remove
Date: Mon, 18 May 2026 12:54:13 +0200
Message-ID: <20260518105413.42147-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1F53256B09C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[pavonelawyer@gmail.com,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-61956-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kwiboo.se:email]
X-Rspamd-Action: no action

From: Jonas Karlman <jonas@kwiboo.se>

The current remove() path calls rkvdec_v4l2_cleanup() and
pm_runtime_disable() before pm_runtime_dont_use_autosuspend(), and
frees the empty IOMMU domain after that. With autosuspend still
armed when the domain goes away, the VDPU381 can be left in a dirty
state across module reload and suspend/resume cycles.

On RK3588 this surfaces as a VP9 inter-prediction bug: from the
second ALTREF frame onward, motion blocks decode with U=V=0 (BT.709
green), while intra and static blocks stay correct. Reordering the
teardown to dont_use_autosuspend() -> iommu_domain_free() ->
pm_runtime_disable() -> v4l2_cleanup() makes the symptom go away.

Tested on a Radxa Rock 5B+ (RK3588, 8 GB LPDDR5) with both the
libva-v4l2-request mpv pipeline and Chromium's V4L2 stateless
decoder. With the fix, 300 random pixel samples on VP9 Profile 0
clips at 1080p and 1440p match a libvpx software reference exactly
(worst delta 0). Without it, the same 1080p sample at frame 4,
pixel (960, 270) reads HW=(0,112,0) vs SW=(204,147,116). HEVC and
H.264 stateless decoding via mpv keep running on hardware with no
fallback.

Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 6f5f0422d317..bb95b090a25b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -2066,12 +2066,13 @@ static void rkvdec_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&rkvdec->watchdog_work);
 
-	rkvdec_v4l2_cleanup(rkvdec);
-	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	if (rkvdec->empty_domain)
 		iommu_domain_free(rkvdec->empty_domain);
+
+	pm_runtime_disable(&pdev->dev);
+	rkvdec_v4l2_cleanup(rkvdec);
 }
 
 #ifdef CONFIG_PM
-- 
2.45.0


