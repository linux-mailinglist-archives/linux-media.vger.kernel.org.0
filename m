Return-Path: <linux-media+bounces-54271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCFTF2qgpmlqRwAAu9opvQ
	(envelope-from <linux-media+bounces-54271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:48:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D68FC1EB0D5
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7503A3139758
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94AF38F63F;
	Tue,  3 Mar 2026 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJkSS/qw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6249838C414
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527390; cv=none; b=E6FSYeV47RQWA40Nm4KMZBXin2gFdbVaLkcuOcirrNqQmSSL4OKykCOI1JV3/4x2tP26WnaNskXpc0IklMjynXgVyQmAYa/XLYjiMQqqlKktHAIRl7yVwcN8HhjMfhNysueShHwwAkKL+Y5f4H3DFFmXqwGn+H9zzv9ibknWryE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527390; c=relaxed/simple;
	bh=EuXSZFPJCK7U29pmE8NcCmHCEEPhWM8lTnBth/7gT4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cD1jdAmhO0PG4XMc9xhea6UlZZsXpxw92qqFuW71kX6kES/5BlSxZgL5rZqk3rpMCKdJoY1Grpx6qjQmI2n4Q+61jjcAgA+/2OipqWCfP8QCFafMAABvQZCEYHuO8ZA5CDmTcH8zgC70qd2VK0KK9UpsVeuS1JjfhajSc1gVfZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJkSS/qw; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-389f173b91fso92448611fa.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 00:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527385; x=1773132185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=PJkSS/qwVhUlkcaXaFItruftcfF9+juSJ4H+P6TROG8OrIT4N4BGhIRmjZ8nBWLik5
         VtBELTMx7D76DaQc8lNAKAqFAWiQeSdEbYG/cbPNXsjjTQ/+mK/5xMnpBJ1e1TvGc2jc
         Z3z7WRr82S300NoDZZ0Nwp3sWqUurtBmykO+XsG7M7X6aSgFb1V5TsCLnm+ltxTAwurp
         y54VLl6LLp7J9KCXWtbOEubllziGP0cFNIT4DXwMVZobd3AsEDoSkfxzjfu7Fa84L4NH
         R9dhN9JwwQJ9PpYuievunaSMHnYcD8GCVMSr6xl86y8PJMN6I2mjDmsOtPU/06OA//9k
         x3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527385; x=1773132185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=Vlgw4SggntJED1I6Vh20At7tlKm/HYUtqldrWH8J6yi1IReak94tHNDQsIAGplDDcD
         dl0jwz8AdBSjF4NYB7vsNiJpyDwJ7f/M1sBtiuoyuY6mfqt2GftQilJVujH7VAFmytow
         WhDDNb5S0AbXEGkp34ToSV+BvRuXjuucJyd8jeuedVOZxCKFwPzJhMUMn5ZfG0XRJZ25
         GFjGzZedqdnnJJKnfTpDCF1s4bNC3sj3hDGlBfiM0FO7w2i62jqvv2xPUUPcPl3SZiut
         fRsvMmWIr076/tzcjSzNM5GWxJqaeW4vq6T/V/4SnPhI4f3di5iSaW0+ILdDWXfLlhRA
         IBNg==
X-Forwarded-Encrypted: i=1; AJvYcCWkrIpjFJl7KH92leTtBT9axctME9Ic5XMCs7tNah/adYf0rB3dZRqVhOPBh15FlD1uoYrIlNh8ATMuxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3i6wm4AGvoi/eLYz8sdqnTZw1WstEahrRAPgw3uFj541Kv4e
	n/xmyv0DAwiVpYgAffrFk00i6GzW1Vdq5wOog3442v6PTppUWAG73nq1
X-Gm-Gg: ATEYQzxQNX2UynLPKipVbAhHE0kvcVn5w7Fcue7c3toLw5oZWeeF3JMRP0OO+mLwGOM
	WzKiv0B3vZDYKWZcO2amqk+IeLtGuUSgg+Isyy8y9TYX2THvJAP02PgiOjulk4V+8l37ahb0JMy
	LfJ5NOMz9qbmOcomZ84oLv6OWpAnjSBEbu7v3aE9Kfdl/ML1xAa3M9eaT16l+/Tva4MedOjxMet
	njidVDQkqY6DQ1R6VXXcTcINLaJAdMF5Cqo2LnBd+jcc7FayN1t6/Lr6/pSan7A5YcYClNUdX+A
	zMHllq1I3q4pAOmFoK51ZehOFsohiglTADosLPT5uBV96lSYcrgFm9f7eK+JdvUM50+9e2YORqH
	66I0GaeXJfMJpvL3+uhgw2IccsS40MGmsfZmrSxI8qcjsCzFiyqCHhCmOz64ZEd4aOr8SpOtB/n
	Aj4RcxNebt+2ic
X-Received: by 2002:a05:651c:515:b0:37b:9e27:89f with SMTP id 38308e7fff4ca-389ff363a7cmr102300131fa.37.1772527385431;
        Tue, 03 Mar 2026 00:43:05 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:04 -0800 (PST)
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
Subject: [PATCH v7 11/15] staging: media: tegra-video: tegra20: set VI HW revision
Date: Tue,  3 Mar 2026 10:42:34 +0200
Message-ID: <20260303084239.15007-12-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: D68FC1EB0D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54271-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email]
X-Rspamd-Action: no action

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 4b218b9fbc26..7ceefd920cd6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.51.0


