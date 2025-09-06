Return-Path: <linux-media+bounces-41903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C67B46FB1
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 16:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D88F7ABD8C
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FD72F49E6;
	Sat,  6 Sep 2025 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUo46ust"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4715130214F;
	Sat,  6 Sep 2025 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166873; cv=none; b=Ur9xgLOHxm77ojwCtZnZf3RAa4lHS5JUNyFgqibPC2FoedMD8DhVy9AoA6DfUoxHwrYL9J2BVdLGs+iF5cYVKTviPnCUdeF0TmC9tRD2wbpziVgz4z5n05xjbuDBoGnHRfVnAX2OWeZfQ0Ly9FpgNQ74IIBXugTArwMZIXaXXbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166873; c=relaxed/simple;
	bh=cy1fTRtuWfdpWV0lp1o5RqEBe16gggfZEWrxZ0GPur8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VC0GjJtOHSPeoJXOiaSvwdgknOb5FKgHk+o/dZ1To2Psphq8D+dAHGgu3VrxOUzlWy3Ht4Qvue0lhljQQnnL7Hi+4V/7fXrFJSFbblo70jnNkto/seT6p5s3gMRc+3J+YMbDuk5m44lb2bhfN4wcrMdxqnaEs/mm+pKrZVg2PmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUo46ust; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5608bfae95eso3375370e87.1;
        Sat, 06 Sep 2025 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166869; x=1757771669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71pLyutaBp87cS0Y4+A/ArGFNnaGoasujHt7io2bQsc=;
        b=TUo46ustgwDRdF2ZzJ7OHDkGWE7eYu5PB4H/9UlxovwrjhibRZ2bWsnz2ljKRkT7Zf
         bzvFbWLzKeQDcKSnzIdAeqkoHMKlJwPvJUb8xOTXXSY78MQrbCcbUCWAu2GiY1uUlMJn
         OoDt2GZxFT0ZkxbLtEKG0sMMeNZ6QJI4WIuXCccLnbq/imRS0rQLK85MYbdzibEd4kPq
         9GLJLCVvuCqsBqZr8WC4Q7DNU2yX5WFW3KujOk4Rfooab0inKY0Ja3V9sBexzJ/jjwCC
         AxI/6p1Oqd/y089A8rU5TgfQ59dEogmNA96eVdl7dPYsNvFC3qyO8eDtC4GQznKQAQFt
         rvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166869; x=1757771669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71pLyutaBp87cS0Y4+A/ArGFNnaGoasujHt7io2bQsc=;
        b=O6xQWBPiPz+aszVCmOSB7ukf4SL5rUshV2uowGOWv5Etcp3P4yQya7aL1pvnAO/x14
         C/OhSvHD1qKi9T9xPA8+wxe1W/RvM7SqwlfvQymiKOjbJPz7QMc3SmNGoPpC/EYVhHS9
         a/lAHnMR5W2TuiSEzGVJ65QTmBt8+wBMb+YmMNPUQlaCcQHeDTLIc4UvZLmI5u4CXbW/
         kuFnZsRBlGTFBY1fVDRpWg/xzLcJvwn4CoTcZGvcbuhUiqhP3HXdm3weghE0I8kX5wxD
         p4c222syMSDX47xS+JYx3XrHqwlO9mxRlci6rzHN7LLen5INtf0wC/II7ArpUtQXxb4U
         TtLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtNoNS5YVSnF32198xpxhVRXuZ7CTapVXNp5yTanW84qIqc3cizgvrqFu7ZMPp/MxbufkCf23W6fUEdws=@vger.kernel.org, AJvYcCWclD5rJw9de83inUqIWvjN10InI0M1SSmZbBHug1HW6EjSI1FtFD0oRURKDN80kJgrYGKWWwz+W3Mk@vger.kernel.org, AJvYcCWuhuhfn7By5OaD/Taen8GDYAYEUa7331lCsCYtgnMzGLyi/1+Uw92y5aHGzIxDnNB1LI6DnzVpDodx9myX@vger.kernel.org, AJvYcCXfrctCvDLDinJNGPM3azT/aRtpATqB3XQnJo7gHtEqpepu9YBFIdqolj2rOFO1lJwhX1Rtp+SIzjYc@vger.kernel.org, AJvYcCXsdp1p/+spQLlm2yyy3EqFZS5qJwMg17F1R/v0/BK9943/bHCyUYISByWYkY8z6WnMwuk2lMMsrp1xZOc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze/RYBNMmoSQ/mGVGPzXp4JhjngiArsonZbKy0DRZ62W3Weewm
	3aMtz+BNMoy6qeGHNGLT6oXScNc1YgnyT4ty9esr6pzchgIYilaTDerekA8byg==
X-Gm-Gg: ASbGncv9AbOn8KL4QW2ayWRoKrL9H+2G8kqWoC9gqpNtqJtSXJ4OwVSjitFuAtVxxDQ
	eqxrk4xO6gQDcBb5oVTWduY+hLyKHi1Q+qZPd/6yoA6cQAUvidvNAEqwPk+nI6gmc0dZ6yl4HnH
	S5RyBxuLk0aobhGLpIFHgKA89XNHzVTxS95hsv4SrpTUXgHtslBTKD6hbyZbaT10nqL6OpFoAnL
	+ua+dK5/YkmS6a3DP96FeqZJ8mDXg+X1I7WlKW5arGPpJisOmLjYccp7OzuDEzrjGjq+KtbxunK
	iP7kV7+PMPTvjpM61AWBxAxOHDGbTCtpJ6tJfJP1OmtYvCxeQexQppTgflnGys0fHb8r10tRf9R
	o3ZgUVvGZUeJzKA==
X-Google-Smtp-Source: AGHT+IEg1qsnc3gm9kCOfmMvOVRWziPs9tZ0bG+/2BX69CnDioWbbs9wqbu/YMJp9IAdkiymwh1eFA==
X-Received: by 2002:a05:6512:689:b0:55f:4cbc:8522 with SMTP id 2adb3069b0e04-56260e42ad4mr696185e87.30.1757166869186;
        Sat, 06 Sep 2025 06:54:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 17/23] staging: media: tegra-video: tegra20: set VI HW revision
Date: Sat,  6 Sep 2025 16:53:38 +0300
Message-ID: <20250906135345.241229-18-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra20, Tegra30 and Tegra114 have VI revision 1.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 781c4e8ec856..e0da496bb50f 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -588,6 +588,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1


