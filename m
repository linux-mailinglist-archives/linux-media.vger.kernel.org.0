Return-Path: <linux-media+bounces-62014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJjQI9gpC2rqEAUAu9opvQ
	(envelope-from <linux-media+bounces-62014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 17:01:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 535B056F73A
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 17:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1F5E304AB56
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236DA296BA9;
	Mon, 18 May 2026 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oH9pdbGd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E8A148850
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116068; cv=none; b=bOR0Yc2sHwy8rYS7Xe8toqK2xpHpBA2w4E2vqpUe3QyJqO2RWfbuAADgiFma6ynu9i2iC54reWQqJR2eYMTn2nYYhDg62KB0KgyWdL/3japdDW0kHm9II2k7o8SyAZu6ZREKbhl/247SZSCU9sA8x72GTehHhMwS3RnGxSip3vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116068; c=relaxed/simple;
	bh=Czv8Tfe2ypNrmX0zrODg0o5K6vEJO7x3cRJLNC1oLno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEjQPebF78K6Wzigc0SisjGVFQA40euq6qL1G0KjS2tAGSFuv+CRwdHwcawu1Na4J2R5egfh0oDpgH+4Xy/Z7JbE175EduJCXpFpr99YCzmg7yJRNDmZ7B2B55u0XdsxBqErgX5BcxBW8bqEJq+pI0Yk6WHkjQsJNDAPFgiMtr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oH9pdbGd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso29779775e9.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779116063; x=1779720863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pC9TScL6CxIBlhr7Fs+T0Ee2cF3m9ksp0G13aaDD7mA=;
        b=oH9pdbGdjywz25MCUrFB1Ze7sQc9DtouvLEQdmDEBv8gCpcL1Il53lxU6vRlvZLksv
         GOmXQz7tMgfQk15rdjyQmgDw3hb4oQPAuY4WXMMqkAKkPLgwuHQG3M9aRZD5m2lpr/Az
         oO5rAaypIIGFPA+iJ8FFWXCOYkZgj9X8pZNgA9LUQq/fJc5ALEeErb5LB/HVg0FLSurU
         EPEgj3RFdumsAtMSOGEKG3te2TwhfAJnDTKdD4hSrWls6v/iNpLOgA1BCD2kSCFVdsLr
         sMAUu1h3k7vsbA67nze95eibcYuNr/pWw9eZ7DZ5ufoBwSb+2bcFzvKWhmhCR6Bf67hN
         fKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116063; x=1779720863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pC9TScL6CxIBlhr7Fs+T0Ee2cF3m9ksp0G13aaDD7mA=;
        b=Lf+M6x6UJ+93dh+/xKByYf6WaELYKstKFfJ+A3RUOyhJwqYUrlTMl1+48+1XvLbkOQ
         Af9GjmC+D6hBwaunSzSUn2LaAuVvv3E+UgUCLVyJC5SsB+LnNloM4FPniu3UZW0RtkqW
         0Ircox7ARzsLlPBEvn2vGyNQ7dIGUbEmtsIXeFX1hW1C4XpvuBfNEYYX+qbwNYlaY7+6
         tQrDB1n0QcjCn4lTUG0i9FncnJEKzInCgNDBjVRIvFv1p96yPywdHbJ8g8LvR/sTXLnj
         STlA8kboagU4TIHS/873TpYLm8woLd2xy/b1x/KZpd8wZcx53P0ZK2c/u/rmjNFqYUwh
         q6FQ==
X-Forwarded-Encrypted: i=1; AFNElJ81lw/lcdrps458LyNrmd66vryB1nplP42GwkllRjZiYTHI9QAS4qbzCsUFKIZrNL7THijEnbqIlfSXpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZkXgmxV5rQfUrFYVDjq2aaeWNTHyvE768urfAyPH2GF5qrIn
	iU2EzAUan82LWN88yajwZGywEVm/nZC0WXUnKQ0/qe8uhOXoRb4GvuQ=
X-Gm-Gg: Acq92OHqCSTsvDETwcvbxuqPblmWGOfLQO+nigzp//vrP6XkknP/1m3X9crcyIC4aMA
	Ne9uVl/VBWYtaeCKbYvYLun3/lMa54X9WAWDzniTZrFMlQMT6hyWR8AVCiBSx+RKIpwVFFYHQ3b
	c1jY0YNRHgCtEzfjxscEK2WVMc9ZUD+FlfAnG1T72JZsa1Cr2WEyIno1/MP4+nH2gJk4ZZWMXJZ
	BYQF0ssC7/iWa4OPzhFGgcDrvqe7nSPXsS60yEYGwSHnSRgyDyWkKqDtcw5eG+x4XGLDhw+6g0G
	DgxTrx+BE1eh0Uv3OOgz7uF/IBAvlsojbwPNV+ukqzcvT1DEJu6zaGYriP75EiS8wWHdE7BynZA
	9d+x+AKRJHTFLddiT4XMJvuEsXduxlI/qLvk4G+bpKKKWTWno/HHEzzYDtXCi+WauCL8xuYFOhv
	SwQ60YQ1U+Dcz0I0vksdXsxTwwwRdEpDYU3ovv8P3aEHFMz8Pcw9EupllyuDXi+LEFuFPv6FMPp
	w+YysXkFeo=
X-Received: by 2002:a05:600c:821b:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-48fe6515831mr225383255e9.25.1779116062889;
        Mon, 18 May 2026 07:54:22 -0700 (PDT)
Received: from localhost.localdomain ([151.47.57.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm261061285e9.1.2026.05.18.07.54.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 07:54:22 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
To: jonas@kwiboo.se,
	detlev.casanova@collabora.com,
	nicolas.dufresne@collabora.com,
	hverkuil@kernel.org,
	mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	stable@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: rkvdec: fix PM runtime teardown ordering in remove
Date: Mon, 18 May 2026 16:54:14 +0200
Message-ID: <20260518145414.64514-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518105413.42147-1-pavone.lawyer@gmail.com>
References: <20260518105413.42147-1-pavone.lawyer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62014-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[pavonelawyer@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 535B056F73A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Cc: <stable@vger.kernel.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
---
Changes in v2:
 - Add Cc: <stable@vger.kernel.org>; media-CI flagged that the
   Fixes: target (ff8c5622f9f7) is present in the 6.17, 6.18, 6.19
   and 7.0 stable branches, so the fix should reach them too.
   Link to v1: https://lore.kernel.org/all/20260518105413.42147-1-pavone.lawyer@gmail.com/
   Media-CI report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/100124849/artifacts/report.htm

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


