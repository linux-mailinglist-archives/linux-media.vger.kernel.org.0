Return-Path: <linux-media+bounces-35922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ADBAE93AD
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 03:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0745C1C27577
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 01:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4291A7253;
	Thu, 26 Jun 2025 01:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="op0oT2Sr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9033194AD5
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 01:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750901078; cv=none; b=Eo9issee9SmaNnFyvN00cl6zYkw7UDnPzXIyYvYhePckXrtrV4qxE676AM9nYPWna7AF2hFPI0FTJR0fLck6CLErJnWIs9f6Jk3lcQCga/lIXr7y3wxDiruDiVirzbhVtIv+WWUEXGs/6g7IhXM88hONKr3Qhu3aQEfCeQnM6r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750901078; c=relaxed/simple;
	bh=UmGP/l8Um9+2msGQYm5eaI/Itrhs9wb11QD4Edoc5NM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XI5XUij0FaxoH4KlKi98zRL1LBohuOIRJ2OTHHJX85MLo9ndvdyveE3TR5tFgQUjouAExXO8q/4iob2Rd6Uk3knO+hiz+e0riyMttm1GWyNI4EAWXD5r29fcxgqjX9pp03eKiTN9hl8V/bYzZUIJOAQBBKm+eW/N3u1Vqn6IBRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=op0oT2Sr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so384805f8f.2
        for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 18:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750901075; x=1751505875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y4u/eN2D/tx7Xb+N1lY9SuoxpnS9Tkv8LbiwG/EEyYE=;
        b=op0oT2SrJC7PsgepruUXwmrG/iwdAliv7Iqu6EGXmkPPZ2YCmRExAgm3jpYe85C1Gp
         kfE4erZ154J+0PYmvAZ7vYimtWVotL/ndCxkZD6zr8G79rpmzOZ7/0BFJt/ODRGm2vGF
         ZKEjfHtC77y7GyFNXpoysx54sSaHSYfR9HtYIQK5ygbCMM/ZrouUU+4Swg9RWqkfve2J
         r1gHjXyEZUudDz7Inw1oygKMkYrw55z1/swkKAvtaJ+7rJ3HIV4CXrdqhmNj4G/RGE61
         TAn27LUsG7soY6fbR84zXfo2KpG5MwDQUGq9ZwrRhkCHL+7jJGrSLBAmOG6wJX1ns2FE
         1rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750901075; x=1751505875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4u/eN2D/tx7Xb+N1lY9SuoxpnS9Tkv8LbiwG/EEyYE=;
        b=ruTcz6bCoKUURdTCxCcFRUUPL+JDaIQ706OwcEQLBe0WV8GFn8m7vkEEeXdmhIVN8l
         iAJH/jSo482hh8reULsb71aK7Y1tP5EzVGNcGYibAAjLs81m1kXdn0sx3WjFcKiATL5T
         wmX907EE/AXaf+EGZVk/sxvmm5CD5lifAdRGQrxT+G8kkOBkhqSFC6BKvxPW1uL/ua49
         6I6klbNSd2i5MluBNCPBVE/DMMdXh77oO7ZqSK4QvJwA+JGz2iPbnTg1jUxGA6gc47Uq
         RRsUkp11BGETFUOd+wMW5nflmmBSxKzUFucbM5/p7IGWKWmyYmDNjK2hFYWE+KmDWN7O
         dEKg==
X-Forwarded-Encrypted: i=1; AJvYcCWr5G6YQR9pasV42ps+bUUnZ2UxU6MFnIL87CspIaULdWR/5l/WxTIstjaJx12My3VDeNKn6RTFYhjjbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytjbAdl3YhwESSx6zpalXpPo16nIhYpEeG+k9feLqXULzsmVkn
	RTS9Wm05dA9M29Oj3EO0ZVFQTH3eZcwbB2vU+fOYzktXvZNN54d+ODruJVmPTv1j02k=
X-Gm-Gg: ASbGncvHDYBtciusP/n2Hpd+Lfy+EdAz+PKRX/kVhDJUagIqObw68J9gyG9riCeURU1
	mZ+ClYAmEQfETvvjhewtq1EJ6TrFt7dG4QlsPVM88cMl0VAxL8QdkvS4ukl4maYbUH7pxRwyB4K
	ejtjXYQCePOGJMevXCFAwHSTrpKiDJCxf0xHB0oUKXj9etjIhKRddVbvAv3q4nluN3dUwZ9pIeW
	XGjmRSimTHCElLIpUFVJZEuKJJEci0E4Wxk9eFt2O23chauo3bCWH7l5ie/71IZ8CRUcFIuTKd1
	HRC6cGwlgqb/FdSTzXznMj/hWDI1AxGuWxp0M6ojxxeVXvUZtdHeWUnFzyfd9Vw1a30tcT5J0/1
	t1CfhOZyW1CDqi4aAE37J0+4H6IswT5yc0SUi
X-Google-Smtp-Source: AGHT+IFrQbW0/zunPIUA7/e1au7dH4zXrdfTYnz/u0Sj+eVsjA42PkiE7HAee9HE7uLpQZSciOFkxA==
X-Received: by 2002:a05:6000:4007:b0:3a5:2599:4178 with SMTP id ffacd0b85a97d-3a6ed5db0b5mr3770688f8f.19.1750901074792;
        Wed, 25 Jun 2025 18:24:34 -0700 (PDT)
Received: from sagittarius-a.ht.home (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm34695025e9.22.2025.06.25.18.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 18:24:34 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: bryan.odonoghue@linaro.org
Cc: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vladimir.zapolskiy@linaro.org
Subject: [PATCH] media: qcom: camss: Remove extraneous -supply postfix on supply names
Date: Thu, 26 Jun 2025 02:24:33 +0100
Message-ID: <20250626012433.261328-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The -supply postfix is wrong but wasn't noticed on the CRD devices or
indeed the Dell devices, however on Lenovo devices the error comes up.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06f42875702f0..ce79cd8d32787 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2486,8 +2486,8 @@ static const struct resources_icc icc_res_sm8550[] = {
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy-0p8",
+				"vdd-csiphy-1p2" },
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2501,8 +2501,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy-0p8",
+				"vdd-csiphy-1p2" },
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2516,8 +2516,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy-0p8",
+				"vdd-csiphy-1p2" },
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2531,8 +2531,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy-0p8",
+				"vdd-csiphy-1p2" },
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
-- 
2.49.0


