Return-Path: <linux-media+bounces-32014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10602AAF590
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 10:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C90017841C
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 08:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929AD23314B;
	Thu,  8 May 2025 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="GjRV9G05"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F0C22E41D
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 08:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692545; cv=none; b=hBdyh4XLIvmNVkcJXOIXFo6RG7qL/xY1LagxkSK+34y9Hq92XdimejpPBw+a1kNZxjQfPg4yU05Gcbp4W8cQfH/CtgGXs1PbLgPxDjtiYog03Q7wgAmfyAA59aVQvnj7aSN4leREprVQG6Bc2mqzsqHVIvtl1uBeIQDIwPjyLtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692545; c=relaxed/simple;
	bh=SbW5avzHaWU49AR278z0p1QzFkuzF3Da3gfRm2cmijA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fXTfhlxbI10WrvR/seIeIWWWvb63Pk4qDOiJqsjrPDJrDkFi7ACFYSAeOiXmyKWEZ2b54CyOADh8+mrPszX++kKpKBls+h/hBqbzA4In+gHffB0lQOtpwPM0SCaazYXwbOuhfdTxTkmFJ+x1T3RTeB572d5qh/xtTTBmwsGfgkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=GjRV9G05; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736b98acaadso766114b3a.1
        for <linux-media@vger.kernel.org>; Thu, 08 May 2025 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1746692543; x=1747297343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KkgycOKsn9rzANw2ASc26EEMyuH1deYSroQ2oKDRKiQ=;
        b=GjRV9G05LjCNj8YPmPBklF3N6oxzfcmN9v+Wo3XtzvHFJwyWMRHkx2AjLZg1gT3hV3
         b7hvPePNwIrAFZLL+t+eR5nXOgo73bo+I1Im5RyYgrYjuCR5rfgcl4ztrn2LgzDf0gRl
         IdLDU6IzgG0SrsGPAB5UmyO6/XqUU64geC+zHqwk5kqbqaCTE86XnD2l83LOq0m+4g0d
         /ZAWp5eDLkTaI2pYDfdISPKBdMbti6YubwJJoqh9lsxKDkVzjzNfg3uiuaT4o33IzE3l
         /Jupd7LoqUrsX8C55nlXBDc2y+mGpxAC9YjMoFlqf4oklqKqgfKKqZvwzpOLm8eKEWTH
         F02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692543; x=1747297343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkgycOKsn9rzANw2ASc26EEMyuH1deYSroQ2oKDRKiQ=;
        b=MeMdSyjWf6FUwOymnF86Sr+IqdyKyWuWYEV60br03BXIeAPj7V2cX9Xx2Xi87GtOBf
         KCMLvdlkzMKu+3oi80had+S1eYrZNeFNKxIij4QrnW0snAo5O6HoBmlZaxnM/pLg6ofF
         UVGVwcqHotmvkiOmVldAWg4T7nLwFJ1YuAOyJ/VaJ2+mCq9WsFMRHY/jtT1OHddX59Mh
         YlJDScS3STJL4g3StcByNihDPGUjseLkW7+XoQwukOxvyQcppiWhoqgRXXHvn5sKZh5p
         QDMKvedBlJMDA1fs3+8k8Vam102q5wj8mSNgH3bWUdJ/JHnPt6vKrxggIsGR35mjjNI3
         0CUA==
X-Forwarded-Encrypted: i=1; AJvYcCVB1cSuLiVIDPfWMoidZBmocjEfnN+PM6BF7Ci+2wN0xT1Aql8rTS0vd9PSjl7K4NGw/a0XB+Kw6Y95gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww6zHD+zFoU2X09s9sQr8KTNIyJbDR8FiYrryiUI0nIyi7Zygv
	Qa3E/BvP1ackGMhiH44R5R/+NsUdpRvxdEWpouiIkgia39SetXvTnUT4ZVmCORw=
X-Gm-Gg: ASbGncuWphatXgqpmRTyd3+WSBGcZC4ll8Obibv8RZqBUvsrGFD26zRYUAeb+pPYgkD
	ehNCm4Okf3h+bfUCC+7se7TH7D6tr4IdhMI1yvIugpq1yDmVgQDeRN8h16EhCUrcw2PS+QFRPtf
	/xwlz0y64ZSCTJ8yHxVFxhUcnZvmXOgbyciK261IoomU+AU/w9J/8iIcKglm87WgK04elGhvr/r
	4c4hBzt0jc1gCiBULo3JciIuVs8M/fL23/Oyxs1PMdtO9XX1+Pi3B5R1h4gqIodOZ8W7+/m0oAy
	vcEx01eooBmfymWC0Zoak5dT8afXtvSX46Pc9SoTRIDHPZoGIVdo5uS73hqf8tN8zcD6PYWFQsX
	CvG7P5BJuZMgMRUAOVpirn7+1Ww687Fzmdq6MuMZWs8/YrzxL2xa6PsJseII=
X-Google-Smtp-Source: AGHT+IHh6/dRcAY4q4e72XSHH6l8kN5iTSUPT9veRBZSGN5lb5me12RT1bksMwi1d5S3wjdA19MU2A==
X-Received: by 2002:a05:6a21:3946:b0:1f5:56fe:b437 with SMTP id adf61e73a8af0-2148d21d093mr11797135637.32.1746692543562;
        Thu, 08 May 2025 01:22:23 -0700 (PDT)
Received: from kells-Predator-PTX17-71.lan (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c3d6bcsm10879881a12.61.2025.05.08.01.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:22:22 -0700 (PDT)
From: Kells Ping <kells.ping@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kellsping@gmail.com>,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: platform: cros-ec: Add Dirks to the match table
Date: Thu,  8 May 2025 16:19:03 +0800
Message-Id: <20250508081904.632442-1-kells.ping@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kells Ping <kellsping@gmail.com>

The Google Dirks device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kells Ping <kellsping@gmail.com>
Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..a8d31c3126f8 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Dirks */
+	{ "Google", "Dirks", "0000:00:02.0", port_db_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1


