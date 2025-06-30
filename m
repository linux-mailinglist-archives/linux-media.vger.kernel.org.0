Return-Path: <linux-media+bounces-36368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91500AEEABB
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 01:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBCA1189EBE6
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 23:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D592E6D2C;
	Mon, 30 Jun 2025 23:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmEyG4BG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77058246784;
	Mon, 30 Jun 2025 23:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324414; cv=none; b=mE42721TirjIconyI1rcfHsoeMgV87dt8jq4b3PYI+pFjrx7ndhteBHcMqg4eQt3Dp3aS82If9eRZgc6zWy+0hBH4EMoiwYtTulHqd4laC+vBOoce+ukQDH3iRdDAK33GglLtjToCwDz+jybsrBeArHvX56+5l0cubjdZ77rZFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324414; c=relaxed/simple;
	bh=ugDQ7XGvZwkpemMH7QmpkxtJ9onUjVOlaXgvHTEXasI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fhWFqYApPAny6O2/Fm+6K3AjWPg/aC1IFp9ckXPMPRp4HOfQNjQrUk+t0CxzO6zhXHEefUyZvchmbxDy0hn7vScUDVOrxGbyYtSC+F+/RxxFSYvCSM/JlybwSYF1RPA/en1+HT7yeTxbm/ksdwIxfXwik/gV4wn5cePnyRTbY1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmEyG4BG; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a43d2d5569so33967641cf.0;
        Mon, 30 Jun 2025 16:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324411; x=1751929211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OU1ToA9Obu1KRUZZuXsJB3jLftTA2hEOwxCcX3HzyQ8=;
        b=nmEyG4BGF0E4mHmuGtmtpFXJeAEu8gO2xj8AQLudIQ6DyzbRTnp8kJ+udSVy0g/JBg
         BmcGDARXstYXRWR1POz8ykNFLbEXwkV6iW+0Kb4WsOadIC5uEBFGDbSWCMxG8zBBvHCl
         enJ4s9DTef+2XLSIU7HuI1ACeOJRj3Z735HILr4QiSYuaDFwS+pJhrcYT/lrjWD/faq8
         K2ioVkQ4wd1N/e6NDKvAFyMWzwjXmAI5LYVm/ZvVg07fX+JGKHekT9yW7jut1ueBDyxw
         bf3enZy6GzgzonyKmqg3LaCdqUJLmSYyqfq8aTh8XJEQPgPNn9TdBksI8jxbnbeoft1L
         PdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324411; x=1751929211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OU1ToA9Obu1KRUZZuXsJB3jLftTA2hEOwxCcX3HzyQ8=;
        b=AwF1DTapOxLlb3sN0dV2GLi1lRDRX7RGItUSpD4GoUAGE9OAz98KDaFeWiPeSeUE/v
         t2PM+Qp9QqgzHxUpYOUf/As6qZUU8nB+8K/p8WNvswThGeK4FHReQC3HoN1d+ok/1FqW
         tajKBl2zB/8mcGihmizEn5lXVAUlrqje0Bwm2NR+3X5BbUsxc2y2IOLqXp8tRwBpQhNN
         8+xpGXCDfgkzboI1z8Kf4lVlJocvVVGiOCK4RNVEqjMm/Ea7NuKInx5WdFgHyvtQ1Arj
         xMsJVojZ/JbF4UGBgxa+Ibf9MWM37LM5QU8UG0xjG56uQlvcBP59JKcXPoD0XvZh9JSk
         veSA==
X-Forwarded-Encrypted: i=1; AJvYcCUlxYyq976Cz5CFCrm/YvSbPgDRHOMSPIXKgRgEou6n8DbfFvJy8ptPcSka68xd9+btBOUnsKYnr1iJry4=@vger.kernel.org, AJvYcCWDuj6UkI5xkbE2zLzr08EtNCFvCMqxBf1Auh/Qqg103vgsxcJm+yTl5cwGzKXkzUP9BOxF4Z4f7/Hge6ZOWA==@vger.kernel.org, AJvYcCWG674lSGjLQr7LnBcckYJzVL9bOiNsnZgqXzlF/Ysm+92tc+4hxy+srr8KqGbasqE1emNIVICva0j1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ovngB1ga2MKnsHGmFtfo1PjD4ls8wYRE/yBBwfj+Gf9xEOzn
	AMkcClcXtPubFeZETb46Xyq0fZV03MxUOw5BUGkQ9gJaamFQYm4QkJzd
X-Gm-Gg: ASbGnctyG+f+VCQ2txNO+6bxJ79Xzp1a+1wZvQX50W98lbzbDVgbogcCTOdBVDCV5D8
	jF5LI6D2qE6t5MgGxHlVXndXRJ/rOPkAN8g1YM+qej/KSPAOsskgZNXRlEYf6jCQwy/Nx/4OqUA
	/xu1St4EmrGohggdRq/BeJ+zY0CXIRIMeLTUimYlKtsp2yqccCaHmcVSwRpjKZshzOHEBLO/HPp
	oNjey4i/6tEvvUkVYBnZnXVlgWR9uvUwmGjMl/GxeR5NTWsqe+yG8OqSEcxWkOlOGE41I5xPS4g
	IW6Po/yP2BDATerwRZau2eHwrg59uOi7xyTGDeqsqDCrzHmA5w==
X-Google-Smtp-Source: AGHT+IHL7T+5UPm6ZQXajM5Keb8wq0r++PIve+bD6h9hy4p5SgtXwIzOXmR5xpcT9//VK2dsgGRegA==
X-Received: by 2002:a05:620a:bd5:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d4439233a9mr1929327885a.11.1751324411060;
        Mon, 30 Jun 2025 16:00:11 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d44316d8d9sm673877085a.37.2025.06.30.16.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:00:10 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 5/5] arm64: dts: qcom: sdm670-google-sargo: Add front camera rotation/orientation
Date: Mon, 30 Jun 2025 18:59:50 -0400
Message-ID: <20250630225944.320755-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630225944.320755-7-mailingradian@gmail.com>
References: <20250630225944.320755-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Mader <robert.mader@collabora.com>

So it gets properly reported to clients like libcamera.

Signed-off-by: Robert Mader <robert.mader@collabora.com>
[richard: rebase onto patch series]
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 0af6a440ecbc..fcd2f1b77679 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -462,6 +462,9 @@ camera@1a {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_front_default>;
 
+		rotation = <270>;
+		orientation = <0>;
+
 		port {
 			cam_front_endpoint: endpoint {
 				data-lanes = <0 1 2 3>;
-- 
2.50.0


