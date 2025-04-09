Return-Path: <linux-media+bounces-29713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD69EA81D79
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 08:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C98A3466CE0
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 06:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6421DF977;
	Wed,  9 Apr 2025 06:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="N77eozij"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483F61B81DC
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181437; cv=none; b=ESh/qt/w8B8hfdqUH1V8uKwpiEqq7OG9iV96yZKDgtRVJ79yu50h4vK9WtA16Z28vsyqBOxt75HW4q7/26YUS4f+NrZyc3IehgF4zIGAzoCNVtLBQkyeOFM/ccIJKBP/9lm8+aLsJcDaSW7b31xANsRMq9vDu8XRpp4UhdCjxiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181437; c=relaxed/simple;
	bh=lzJPNu/ho7QoswrV6WnWRkvoPRlvvYAh73zB3hxTIVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mOgMoUfwId7YH67hyjqLakXqxFi6qFtriybdqRE/fYIvcRzCT6d/hqcFfZqHsJwG1SvavtgDKuf1cQIMP9ojvkfffz9As1pD2YRzbiha7BlsOy0+3uf1verLZEPXcTYTwwT2EfpWNS/804u+TWDce6prmYXO/nFkXRtpyvzR1MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=N77eozij; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22403cbb47fso68861395ad.0
        for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1744181433; x=1744786233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5118vdKYBhBBOKePz4luIaPeX9QCXZzRMgQUdbYU/AI=;
        b=N77eozijhrZQTOs9CLw0m47VS0cMTERBUBs+8Ln2Aw2rY6mYaIkq38StZbqbAHYdYp
         ATdh+riKw+rdzCEbI1BuQJFLoAtCiceOamO5utfPZBu5HYno6k8JypHzpecPFI73uiU2
         xDuHMq/qjvoBhkco2TxJ8t3a2X8AbY9PJjFtMHP68s/aLS2diiTWgZwEW+CJocLqAgNI
         srChXtQEg3ph6XsZz/+6h4gHQD2DB2fMqXaRIeippY1YSalLje/x0p3bRRQQxsXhqmcU
         PjtE/FSTT88WL0UHMNhPbXUyC5/5oQ2YVKWvVHsXb3QSPH6XSuUXsu4Kq2+QSWDpER4q
         7hUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181433; x=1744786233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5118vdKYBhBBOKePz4luIaPeX9QCXZzRMgQUdbYU/AI=;
        b=fk9Rxy9yr8ma0OPWi1o5YSw1KWcboWDvesihVo2fyOs3QhbHRZtNh52DujUp+4BYec
         vO8C/z0v9OAs/DSMmwLlU03pB3PXKJPpY1af/CKfFMBfQZAKx3QdFRuhdx8/XDCJt5ke
         WxEJEitoUwjD3QGeWTnACai8RQXN3oCPlZ6/W4/bRc4SwljLnvzx2hn7afKjsdHfj6QA
         2DyAA/d0UxlFOyTVfPWq+dKTLQVhVhuItwPH3Sl0UtwyLUF6g0dR5RQ0mIxlbtqDcigP
         GTJY+cIpM/F+3YKhrJZ1y91HhhvjrhG0iTx7FBo8n6ddSJGL/CA34qZeQMjHVJ0xKR16
         1gCg==
X-Forwarded-Encrypted: i=1; AJvYcCW6WCgEsD6MY6bA7rsCf6+5iqCQB6suVKxXTQabAjK2/m06/UZPi0galaOppxSScE2aI9sSFCfAyiOFlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPG99QozD9w8zhZ3TdPnUmwVm2A0ge1w4V6aKmCQ/fvmRYM+nh
	GuG8WOn5Y3b73D17mz2HC9OYsv3BgSpr/jkusH+nJFAT7KX1MKxbC56tuT4Iq60=
X-Gm-Gg: ASbGncs/wBsSe7vq44N8Qh0PDB5mPshLDRUoRBZGuh+h/xLSnxOpaHHCCL4JNUWCsjR
	xxICmO0CzrkKi9swtFJ99FplJrDELgwz+6qYDFuzsO2cL2bcJajP/bqLhau8ZRU/ogp8CuLRBAn
	ZCFrrp1tkysGw/l/3ENdnoop/x39YJDMpgRlQoSxA9OT4pjssRtFNnGRcnzMiPevtHbKjRk3GcF
	BxYhWaAZ3X0n1lNCyG1C8s66L9LM/NMCCYMDqwgMEtXRDng9kfX0CoKRlbwH+mc4TotUvCDS4in
	uX7f+19KGew7nUWjNmu1C4+L8pBh6t3cz6CwZWp5imb+GQENjiAvzEH5F9fuMehkvp0ts0TPDCi
	m6tC+f4xLR8Cd1Q/8KbDeCOO+zQLOQ8dO95fiZjTym040C6ANSuMB0ZMDf2arQ1/WhvqA9oP8mI
	0=
X-Google-Smtp-Source: AGHT+IHD/fcSTYcWjVLug8eNiUB0tiAbpo7VA3eJHkJExJWi+Ls8UggqC88792E4rbXW3ZUyHbHK6g==
X-Received: by 2002:a17:903:2f86:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22ac2a25780mr28913545ad.37.1744181433539;
        Tue, 08 Apr 2025 23:50:33 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e356-f6aa-64bc-0a4d-57de-afb7.emome-ip6.hinet.net. [2001:b400:e356:f6aa:64bc:a4d:57de:afb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm4308235ad.148.2025.04.08.23.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:50:33 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] media: platform: cros-ec: Add Moxie to the match table
Date: Wed,  9 Apr 2025 14:50:12 +0800
Message-Id: <20250409145007.1.I78118a7168f9021bb12e150111da31de39455c27@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

           "Benson Leung" <bleung@chromium.org>,
           "Hans Verkuil" <hverkuil@xs4all.nl>,
           "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
           "Mauro Carvalho Chehab" <mchehab@kernel.org>,
           "Tzung-Bi Shih" <tzungbi@kernel.org>,
           "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>,
           chrome-platform@lists.linux.dev, linux-media@vger.kernel.org

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d4..1de5799a05799 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Moxie */
+	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1


