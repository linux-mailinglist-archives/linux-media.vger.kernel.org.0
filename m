Return-Path: <linux-media+bounces-32015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF1AAF593
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 10:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E92A19E1F91
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 08:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B55E2343C7;
	Thu,  8 May 2025 08:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="No3iuEuJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1299C233735
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692552; cv=none; b=FUU154exWF+oGI9IedM646l2lqxKsHIByXOGaS44Br//8WFTA79SwdXQhWKhU5zjJEhtBjEzdT/pvAvk29XfBrRGB46fkE51rhXqLq/zFK7vtgq+8HMwU5l/tfDNEC3KEyMPToz0rkzEZ2/zOlz+3V5Iqk3og2vV9jHC2CxNH0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692552; c=relaxed/simple;
	bh=b3KQHbcle90b43aec774WIneNV4nZ170I27rWBYWVls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WO4c0Pt1eh6a7keapqhTMAw5aIfqlJx00gCJbSNnYYVD6V/SeVRxJH+/HNK4ja3hTdpPkQwK2Z4ZzVOsmbSZ+Q5fT1c04WH1SPv/LJFIPjoGN1psM2AZL1VsJiYiW4xiWcmFsut4cefVgeBMRCvBjtGMs2lMjRa/6O0ZasrDiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=No3iuEuJ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7411f65811cso113163b3a.1
        for <linux-media@vger.kernel.org>; Thu, 08 May 2025 01:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1746692550; x=1747297350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mimeEgxpLLLBSpau4R5LqHxy90HrqVEPJpvVRXqSVB0=;
        b=No3iuEuJ+JE6ijNT7wGW/xIEobi2Y75jiXsksP0KPuRTskKFOsvI4MyCfZ0zNRekps
         GZ2IJEKPVOjLaoh0HckkubCO3sGQEnUPgmYbEtHFYQn/8RUFD8ZBIaWFo+z1QW1IBjol
         tixxm8VqnzdEtkoy1WX9QUDEC6BTXJz8xjywRlBu3B4Kn8R0p3DCwzhQ+bfPS5qXr5US
         xnA5WuDhQFvUlv8y5EwOBtwfk0Uog2ard1/ZZny4pRnGc221YTIJVmsAlYxYn4tn+eHR
         GYBYiJfx7W7po+3QWCqZp4c2Y/ecjQQ7XGL9q38S2QIw2DZhT1Vt6WSEfqTCBbmH/aUr
         Eh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692550; x=1747297350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mimeEgxpLLLBSpau4R5LqHxy90HrqVEPJpvVRXqSVB0=;
        b=Rrm2ryWqcEydvP+UujxTp9XvzmKVwddg1BSI1t4pMEhtUE03anrTopwQlNEBLwjSXc
         6mRWMgiC43rzy+PJqrJuBodpkFST6RLxWPo7D/+7dj6DlN3/bTRB0DQ2AECRLne9sbU6
         Mzia8vpelFDqvSE189jtZy0v1HIMkCc3h4PkK2uQlegF5M1cPpNoNFJbfcP6iE7oTwyg
         hwmIP/zA2gyGtqF2vPyVOWyyqaHqlJYql1psSQZgUv5i48wN3XX96T9H5Ro/GzQGFIyo
         daK40NRLwOzYGnNpcuZVTNPQvSFsGcmnXlU9LmD6LDC3DYAZ9EX9/wNUuH8jl9hBJg4b
         Jb9w==
X-Forwarded-Encrypted: i=1; AJvYcCVX5QzHHbAm0lPXeZZgC4l5kNsDMa5aydVGfRGdaa/Z9M1dW3TSVZw7SmUU6PE32Itvn1nHiSPAByU4zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwljHZVGBIocrHpNwmFwAUO37OZ6T/FxQZ4tQ6jjOftNplrO283
	DF16JdZJlczCJdO8BIJ6zbGFlt6V5m3OPgZ8iqBkIuthZrMEwqi22qJaspIt/xM=
X-Gm-Gg: ASbGncuMKTydHy65OZImWUG+0ouVJqQJ2SSuC0UWkUZ2qpDh1o5CVb4gyNBFCBsCHRg
	uDaGa2pBNbRtWrsdvhfBudpefY6l+8FCmXK83HfLuL7HjCmpYmFrKw8tzWrsywYp5VVQg5/E9uS
	UpDtes4voe//OkRPMjfc2CiK8D6wKG53CDFjDTlY3k6VPwS6MX02TFVj1ZXvsZSKIHODIAgH3Xt
	5DOZafw01lAW2kBa3tvztTFwi23QTOZlY8E/aTtUaOqQOEbjSSOh/UHJPXxh8RcWRyir6UxTqF9
	DQmQrm8RCJmH48jjEgi/x5c0n1L/H1HtRVLYurcYO5gWcJ3m3O4MMZ1Hmnl49y0aYKW9lCQjR5U
	0/6iEbdB3I0j66pXm8bHpKy6bpFSrfYoqv154oynqsu8eFewn
X-Google-Smtp-Source: AGHT+IHcA7QydHX9WQFfVC7ZtjQ8Be9/mnnHoybztapFsLeeWUiuanwzBOsdq80SzYVfbDhXjL5n1g==
X-Received: by 2002:a05:6a20:d80a:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-2148d88b926mr9160923637.38.1746692550391;
        Thu, 08 May 2025 01:22:30 -0700 (PDT)
Received: from kells-Predator-PTX17-71.lan (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c3d6bcsm10879881a12.61.2025.05.08.01.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:22:30 -0700 (PDT)
From: Kells Ping <kells.ping@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] [v3] media: platform: cros-ec: Add Dirks to the match table
Date: Thu,  8 May 2025 16:19:04 +0800
Message-Id: <20250508161334.2.I4b139dfca0cbb20f0c9096a40b47f097f40ec235@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508081904.632442-1-kells.ping@quanta.corp-partner.google.com>
References: <20250508081904.632442-1-kells.ping@quanta.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Dirks device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---

Changes in v3: update ports
native driver cec is port 0.
bitbang driver cec is port 1.

---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index a8d31c3126f8..81b4524c69f4 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -298,6 +298,7 @@ struct cec_dmi_match {
 static const char *const port_b_conns[] = { "Port B", NULL };
 static const char *const port_db_conns[] = { "Port D", "Port B", NULL };
 static const char *const port_ba_conns[] = { "Port B", "Port A", NULL };
+static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
@@ -330,7 +331,7 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
 	/* Google Dirks */
-	{ "Google", "Dirks", "0000:00:02.0", port_db_conns },
+	{ "Google", "Dirks", "0000:00:02.0", port_ab_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1


