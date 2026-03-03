Return-Path: <linux-media+bounces-54274-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJm/C46gpmlqRwAAu9opvQ
	(envelope-from <linux-media+bounces-54274-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:49:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB551EB0EA
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687B33143554
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8AA38C2C2;
	Tue,  3 Mar 2026 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHKkiCul"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DFE38F654
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527394; cv=none; b=LzMK4WibzwMs7aADeOMSPa3zx0OvCpZU5DnYsAhR8TXACimiShWo88//IiEMbtK4vxY1WKcwcEhCZnRIN2LjYxsBClVpsKGlCyLRxEr/1uzDnrpMck6dVBrGO6062Fx1gYkvluP9Hs2J2+vMk1WvQt7vjz9ivz7PDMYHGJCeI8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527394; c=relaxed/simple;
	bh=1gog1afMORIsIGPfEuVIVFQI1bsAxNOV2bdjIS1D/tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+1Iv/qVx7tBo3cAgxCXmode6tWsTfKGHgtohUBzkCevbXihiebhEIMIWzZyWhNIKeFJwQE8qLXn8I36cttqxtKwQAzqTT0dko1EehiEBXg/hkP0Z1M9QDc6pbseoYiVBwiOZizJ0VhxwAWLRO0dOPKebMW6azDs7teff5OdetQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHKkiCul; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-389f9895c81so26507661fa.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 00:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527389; x=1773132189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=BHKkiCulIAxlD5ZNxjNqNWGaWoouqKF32NnjEF5BHmw8KGAHgqScvQaFXxZvT+C09z
         hkVJ2HY49H4fkiS7f4XrhUy52AyJjlOtcWIjUEiVWWifSpJEnVEmC613RaDHfTh3Eo5k
         sz3HYW5IL50A/3yzpaBMC+mSZB/krlT+hwHHgizI14xRoLDX48ISHBAR/CtbMlXkwwqP
         filXkTN3IFuOT+mXVdzNUzTJEIqRfm6kUnBcyRdBvNVPn0CfWuWCjbgQ9rGOXPRxNZFK
         vqHqM5bpHXr2G9kmZn8vFqber+c1hP1fKf5W2AKvlzsb6zIkBjoSooucotdlH/X5McEt
         MJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527389; x=1773132189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=vp1JTdEr2Q4Yt3GqvKxBw2T3pGmK2W+yJkWx1G8S65kijWm5G/aymuWUYO2ewWuFv7
         JAozB698NTVLAICfBpy9LpCBkRZaZrVrkL4zdfCffFG/eg8viKZBr/2v75iL5h32+15r
         inDOy0Zfo4xg35DDHaHIb8S4jLvT1OjVS/yRusCFvx6sqCmNyohOYVpWG8kw1n8IrTmh
         owIn9hAQS+fHzQWcBBO2o2aOrIiWUYU03ibs7utW7a+ZItHuoX+K5YmhMrjkHDiOxMY3
         Tl9c6ErfUuPvRq5SKJYdTF5i2oYyFj7rA1pHUww2PCAHarjBVBoR9PFWUqFVn+Owoqp6
         i4zg==
X-Forwarded-Encrypted: i=1; AJvYcCWUazXTpI5S9UOHXYQnA1gfuDSXDfnpDDZBSPAHO0RdW90c1W9Ke0ugR3nsDv5uBVMqP2wi00tDhExO0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkyYKhRFFBn4OLmbWYknY/7ad/1mFPk40sxiio9jk2sqk1fyjV
	PbL9n3heZAq++9uyKUQ1dVKf1UD4pTruMelwGDy4kF+YkMWRTHzZUph0kbw4SA==
X-Gm-Gg: ATEYQzxyaxXVlChdz725folp/MNWqwSdTrP7MKkA8YYI31EbdgP0GQWZ2r/1uAXFzIF
	LzoN+SJv+vgShNbZToeLyuxK64/AlUw2kdeuHaI2+sVhoe4knX69MRWuPrQ1T76oStD/3Q/3XVD
	utg4Ah8c3h6IPtrlhtdV0oBaYQ8Yii9xSY3j4Wg2x+HccxLKWKZG+YUSXTHhjz8pqsfwAZMFVx8
	mA77nwxKj7+zYiDa/2WnumD1hIY4bmKgjaW2ElJFSd95yiID/zEosJ2cVtqglk/GfwA+vypHX5U
	99fl6RVgrjgvRKaKYjfqU9tzy3cZbt0l8IjFnMhcZ1kDFeyNiTLKrsDb7qWZvXDE7raUPumJGDb
	SXIuUzKWv08OGdTOOiR2r4vytRfa/HDZm0wOPaT5A2n+YkD4/jgBKT68WeISY/EfAV7titU4mDC
	ecXAyXiaBEyDWJ
X-Received: by 2002:a05:651c:4211:b0:382:f78d:a0c with SMTP id 38308e7fff4ca-389ff34dfa3mr115153421fa.21.1772527389114;
        Tue, 03 Mar 2026 00:43:09 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 14/15] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Tue,  3 Mar 2026 10:42:37 +0200
Message-ID: <20260303084239.15007-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BDB551EB0EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54274-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 36a57078d539..1b8f2a2213f2 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.51.0


