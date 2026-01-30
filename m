Return-Path: <linux-media+bounces-51833-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJb9MoeqfGkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-51833-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:56:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F435BAC82
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B6D93066BD1
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D5D3806D3;
	Fri, 30 Jan 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/7vlFqF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C8C37F8D7
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777407; cv=none; b=gkAcMTAMgzwXmDDvtOwxoplTVanGGtdlUF5sUB4mVGSiBHXKLaGcYYKdgzT3eNoWfd/+U/BdVc7LdSNgZAotfufcCtd/peCUws21OwN6IWoCXhbpRMx17qCXUT8+HUiaNWolsLwP6Snc2FjlQpZ9OC++eZx/FRomvU/jYz7dlnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777407; c=relaxed/simple;
	bh=BtYUDPRydbD7qJguB7Cv1gqWmul/7Eiqmo1Zcx4dX7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CyJlNJ+R8Praq2EkSuNhkrr67e74OsVp/jYndQXUfQfQ8HhFlcoHbfGMxLfskoOzFaUSziGwJDEe1HFWB7wft05BwazuJIaJxJjSLG98FZMfRPVwPt9Bvng23DOQA1eXp9qti/R2fi4cEJliYmBkqOVhvxISU1lDL2pnxMjuQtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/7vlFqF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4359a16a400so1806687f8f.1
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777403; x=1770382203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=K/7vlFqFqJgrn+DuNHyEw1pTkFGBZ5+9ZlEu6OCadmYu/HSL95hvRiTzJx4DZfJcHw
         AWdzSR3O4VYPkM7lRoTwgilfp4Lc4HHwAR14g1e4eS3E5W5dzv+64/Et5vI5bKV+3m8X
         HItrVmT+2HMtG4fyXtQq5Kuoz5byVZHzEFzLEzyDOpEXD1iYk9c7tOLSwvWa4DCv6VUz
         i6OuXvXCvhYofBafWkYjXcEmn/hnI2yQFApnrpyPwnEWlSwLM70XOOXz722XNreZamzI
         ZGdTkbb92HqC3lONdRHH3JCZ5i2ugVMG022Hi6MJn+QA3gIiszXiHcqTtlPPmFNeuDiq
         ZFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777403; x=1770382203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=gDM6vOIZX0aJ7VpSCd3+sZXkFg9GUz70mWgwxj5tVin+3nsxsW4BTl6GujuJLx9PyO
         g206g/UaIHW9e10mwEPGWKjM2jxMMjUjjcVmPXtWTolzA9O66SNSQw8+x44Y2z2u5MKb
         y+yd2z26jbUAPMHpApxM1z1lSFw2Z3T/pi7TbEg4E1GdUlNmcRr5Y7nVGIHHEhKaWx33
         8c/UzeBEhUuZ5e+ny9AYYcgLiRxkKaMpkdoWBXG8QMfiTJ+ZU7NBLyk1kGDKGRBE0Ain
         TWEi4TjoM0s0h0VigwDxZJemFeVZaSLh1AZGz729M6pzgOV2EcoQ7RmjssmryPxrKySu
         FK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVpaqmM70bHOKKvKf60aL0ysL5XcwVy530nl3saYBg1s9LGsVWCTde8q1ToQjsqvowiYPoMJZpA3qGDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGse2jXtZDIOVyOCiRohodnGihjbh7ZWVvKRuHwhL93Oa1J6CF
	U+FRUBedUMZ8CHAPU1LiqShhS29d0z0JJ3JwbQC+HLP/ZaPmgChLvlUX
X-Gm-Gg: AZuq6aJiZZNMeHE8p3lGXOigN1zyXDgBoLp5N7GljED2+REETzKr6+O3nVmbI8T4F42
	flHRMiGyxbHxpObLXJGpCGKxo1qaJu/5DVifUdz0v2B1ZqxZTNeQvBzei0wOHn2K3RC6amaP04Z
	QW77Yc8Yf3UCovPgXHO1tqIsKKf+EHvvc6lU09q5uaDkmjRUWRyb6UfZiY8i7FyN22MVlBZUBk8
	hb2nz1DXe46WrRZBdZWK39dEIYE6hoUI0BzExpOHI4Na9uXynDjW6wI+Q0b3NABlITbpsMXXoge
	z3Oaf5LDjw9gmSrVG6paqFUsqDucEJXYH4gUm8PuGGWahY68QC7wVZrCiMJYbPML6rxgwC+UsQ5
	p0xlYjs8eN14UNsLtsQwFk27nSzlupj1FcXhZJXDmLRwNyXG3S4nbUmFQidTuKX6TAGtIJOakgn
	WP
X-Received: by 2002:a05:6000:4381:b0:435:9f41:d60 with SMTP id ffacd0b85a97d-435f3ab2020mr4343007f8f.35.1769777403327;
        Fri, 30 Jan 2026 04:50:03 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
Subject: [PATCH v6 08/15] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Fri, 30 Jan 2026 14:49:25 +0200
Message-ID: <20260130124932.351328-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51833-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,nvidia.com:email]
X-Rspamd-Queue-Id: 4F435BAC82
X-Rspamd-Action: no action

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index aa9ff7fec4f9..b2e706fa727b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.51.0


