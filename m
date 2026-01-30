Return-Path: <linux-media+bounces-51836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEDZL+iqfGkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-51836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:58:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21418BACEE
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D34A230AE452
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF7E37E302;
	Fri, 30 Jan 2026 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV2oT17u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4883806C2
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777411; cv=none; b=BtZqL6nEt3SYOaOfZ221tF1cI5VG29/1nBhQNv3de0aWh7wBh9qgwSBsCw4+7ziKQbYqwLbdtQcehREPXgwqCfBcEoss5qKgQoP2e6k8Q7oBqBMe9vrf7s59T46/63xrJkDTvSxkb1EKzKeFMtmYyo32JUrhQECFOm+s8EwtiUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777411; c=relaxed/simple;
	bh=EuXSZFPJCK7U29pmE8NcCmHCEEPhWM8lTnBth/7gT4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJx4K6VWpl2nAW+iwW3AKryiO/ACgbubEyE+oPLJs3T4zLU+a51LH1hvZMmEzNjlYVAHDVthig1ddmVFTNAQ1ZYdcPN4XK3Q1G30SUxWi/HNtWVwdUT9G6a1rTlM0wC09JhXwJCKSX4p9wU6LCrrDLCyPu3IgLs7InsJO7Vy3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV2oT17u; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-435a11957f6so1749119f8f.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777407; x=1770382207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=JV2oT17urykXFAIG42Xv9GOAfayCu+vt+e89ecEyBkVRGdQSuKu+xRTuZOiHN86XS0
         7Gf09vkp+xn5Ra3cDojulCgVWAt7qKEfwFJfmWpzwujr+ayIhqV6kbbDAGTLdiEm7GYT
         tesRNSYGhWXdHWyEbmP96AQS2d3lm8uk7nyCR3gKOxg0MmqSNwjeOrvNNZkqIgcnXXJj
         CBT1m5YfjEbYN3UezuM/4z3QtYzEhj88Ja4JKbEWh6g71S5ULXIIAQ1LvMeDXuQK+Nze
         tIGPscNQJm+s52ZqWzFCQnMmr9FL9XH3YesrGRDP4FQbOutAkOfUd7C+Opo15Cn1Aly3
         62rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777407; x=1770382207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=qj3KhzhTalPkcAGCMMG2sGaUt4JbqZY+5s20xER90Ydis/kjyTfyimtf+vITn2yjiH
         wv5pC4tSvWls9xY+clCgW5SyLbr8M5K2Gmz4rdr+h2ZYagfzqI7oAUUmnE0hDGQ5QTsI
         NqvOySeiVBrNLFWFBVwD8c5ZbVHhzfTBZaHDfvwfAnUe73T48ZvCQhA3JF+oOFuSAsN7
         E79Zph3tHuizizm8sW0k4JzdgRFIY52b7y7dOPEKYK/Dkcc9ZOl3n2LyNFC7Ii9dPrLn
         xvwsN1sxaRlpswNEWldmO6Outni3aNY6/0kOSnmJawOnhjKknMHwZo5qsLdtrmtgPuUH
         msdw==
X-Forwarded-Encrypted: i=1; AJvYcCWAMLKYsYBueJivadH1GM5VRftRMqxZcwdqwi4KlBtjim+ZJ+OI35pdYyrOF3QOKEYWlFPA6TnQfJe0Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr2j3mM8KxHCYm3yfDuhJ4jCH5WGjTVAwrqk5M47IfZSW9J2eI
	mLv8bDxdjonfqJRxzPQbUmz9cJiP8AemLddMe64b44DewP1keVqa5YCl
X-Gm-Gg: AZuq6aK+4Xi8axQujzQk/JARnHqfy8yhQ0cnyq/f8k5leUkmKmCMHmamMyeNIIUU69J
	Om5tPoe4Y1/SjBiXyg3elqkLWrMNyOOsROuZLyC7F2qhw4rd31SoZUENLl8auFCS4TXX1z2YFYm
	yaB96H7MJ4MYwkM6Xc9NgQ1MVN4M9BhtSl9z2Fg6UAZu/juFSdvZgHku7Bu7IAVRVRaRIYWnQsk
	5ZWffDV/DfJUQF0nLNeOXZkjSt2ig57W4ZuKk5Xo0aM4Tdu8QnYT36hHxBtEFbmfahilC7V88Fw
	YeCfS3m/J5FCyp3xic3/KgrS27BjJfnklpj17ZSGttCq4UbHWMk5W14WNCiGxqnoVnAigHHOBQ1
	bNP7u60a9pFz93U26PyFvNPjh1u207Xwxm518fLYl0UYpO5i55w66T8mXESHZw2kTW0Y1Ju9UBi
	Kc
X-Received: by 2002:a05:6000:24c3:b0:435:95fb:a0f2 with SMTP id ffacd0b85a97d-435f3aaf7a1mr4266059f8f.46.1769777406689;
        Fri, 30 Jan 2026 04:50:06 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:06 -0800 (PST)
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
Subject: [PATCH v6 11/15] staging: media: tegra-video: tegra20: set VI HW revision
Date: Fri, 30 Jan 2026 14:49:28 +0200
Message-ID: <20260130124932.351328-12-clamor95@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-51836-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21418BACEE
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


