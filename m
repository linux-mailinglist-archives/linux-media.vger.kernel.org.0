Return-Path: <linux-media+bounces-28809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 050FBA728CF
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 03:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B50D7164AB2
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 02:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A692513D62B;
	Thu, 27 Mar 2025 02:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="KDKEz89P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B77B7DA82
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 02:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043171; cv=none; b=ZZxD6/S3JPEqpD/R3m0YG6cktdVcNb/001pvWbbkeiZblpmo3oNjGkaqxqUG8b4S4CX5Q8AzQfaLbOCIdtPhfgqMCfS34CBy9JpRF5RZEJOk8hUz5zzUKp9f5BZAX0UsKyN9WN/wis/4egBn8vdjJXKwfqTDFH5LxV02RQbKd20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043171; c=relaxed/simple;
	bh=bfZnAhWbIHetf94vPVxB6NVwMTgNEQjCKhpHr0TUlx8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mE3Vu2ZJUn9p/j4VTEi4Nz8jrS1ISU7nNCPfYKP16Z3BAzirE0U6+Sj3Ggd0Fxr8DsPmVpzu/601DJFZp8aa8GGaapDGvtCKgF6T4ulOaB1Qhv8PjATDAiCkYNn0aoTVNlTCUjL1t8fMX/dnBFWrHANPKUBbELqNiBrDif2b93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=KDKEz89P; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227d6b530d8so9978125ad.3
        for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 19:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743043169; x=1743647969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khaZwp5Vq6UxSHSInGWQoaGrGmu008TcfrCzn3Sp1jE=;
        b=KDKEz89P0thsDnLniOFBXrOZVoA5byCeirEpqBin0lZYauggnLHxexSI0oXnry1ONF
         4SszpLEcjKzg33WkLlVL1V7xhmemZ+zXF9ncQ3w8ySlIKwk+3gHqyzTzB4NehR3HuY2r
         ZEJYoye3ezfj1R1f+Bteq36cFZULVG6m0AYejnHxqJetpu1H18a/nBa+LOLH7rm01iF1
         B2Irv/sEts0sm6XCfHeN/W04gNq8oMtjBRFX7bL8YcFghjVERYCCtXv20AS2WPNCTGMx
         8VAAiszQIHLncIXFj9J7G79VOtWvGUs0Snnh3MLsvPcnRjrRkVkSt30kQOOxWrUOTmRK
         YrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743043169; x=1743647969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khaZwp5Vq6UxSHSInGWQoaGrGmu008TcfrCzn3Sp1jE=;
        b=NBo2CmpPQic3IAKehBzZ/hIfAa9OuTiqkjNOE06wabwI+1YbDQW2/GU1wQAyZXFJkW
         TiFszuKgWSQOggy3DVUpY30qfqhvoW/LdlP0u4JyZgNgSMEbnKQTX91DyBMCy0VHo4zY
         oMOrYnCVbIr2kDUJne3gZD5b2l3Qo+zYxzZSUok1EmrD/uJNTu2UJKNP2lFb/WdNfzP7
         5K/N8qZMIuQKvHSlsJq1Ko4M0cMHltVldjc8GxFnLGN/lxmAgh5a16feG4ju/8QDHVS+
         nnz8wIKG1ut1S77iEfuRjn0T9TYgvB9v49IvQt4c4AWgpbE5jvkmleNLYPsKoyqDyg78
         bOdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVnMY3kPAiGU+s3ErHX2dSOYa8yunKeZLKqaHQQ2uBtD7OHBCWduwvNuOh33Yyh2RCfe5IPyGbf3PTvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5OAmx5tCPtTKVR2JTF80jFOGhzuk1OYZ9mEeP0+ZUbu5bKcqu
	NBOE1eEH5Q/02AlO7Cxr5AdQx0F0Wkk8nbTsmIY0+jmYq9Gu3ZS0FfRY/uidr/Y=
X-Gm-Gg: ASbGncvOcLrggSlHQzmcrORMfYNsxBHG+prGmvM7JmD/WBpwcABhTGYa4Gc3t1nRyIR
	9VqueEVKKcQYxpaQzqBcSNjpZl2VbyadGqWQ1jGY++YrewQT1J/RpO7qK7FrPSRKWzHaBs8u5WH
	unnTRd6U8HEyBCXpTFVJmvM7vPpRJO8j0mTgy+vyFPZHhtJCpj+5+p1C5OQ/GTyYdAvGBxQOAjn
	LkY1AHirZzeJFNfO+lt8ZPmB5l8Vkuhf66o5++hHsKEmSmVn1hC2q9IsjRmefWh8K5dAAkOmTia
	lO/P7VOFo3WX4LgF9sd10GDDv4UEq9ADozxxD+eGmfzZK+YIkYV97Q9QifBCFbg8Coo7TZSiLJI
	NXt+WPf46oBGNukTJgVMocRQYF3agA4LJZKpPOvcfrWifpk6nSZj4ExjiRqSA+QA5Lxen9eSB0u
	fCsT+z
X-Google-Smtp-Source: AGHT+IHVjsfEKk7SQAq4/COA7W8hgn5DQ0NFXJ8KTp6oRzGgyMHcaaVaDn7SD+ynl26dPt1q9peR9A==
X-Received: by 2002:a05:6a00:189c:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-739610dbcecmr2571003b3a.21.1743043168560;
        Wed, 26 Mar 2025 19:39:28 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e33a-bfe3-438c-4ad1-9019-9f7c.emome-ip6.hinet.net. [2001:b400:e33a:bfe3:438c:4ad1:9019:9f7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061592b9sm13027897b3a.152.2025.03.26.19.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 19:39:28 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	groeck@chromium.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] UPSTREAM: media: platform: cros-ec: Add Moxie to the match table
Date: Thu, 27 Mar 2025 10:39:21 +0800
Message-Id: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

           Hans Verkuil <hverkuil-cisco@xs4all.nl>,
           Mauro Carvalho Chehab <mchehab@kernel.org>,
           Reka Norman <rekanorman@chromium.org>,
           Stefan Adolfsson <sadolfsson@chromium.org>,

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..1de5799a0579 100644
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


