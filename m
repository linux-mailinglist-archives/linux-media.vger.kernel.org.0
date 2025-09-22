Return-Path: <linux-media+bounces-42954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6271B91C5C
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 16:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA3AD426760
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 14:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1B627F4D4;
	Mon, 22 Sep 2025 14:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bq45ijOg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8614327B343
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552187; cv=none; b=dJhAes2YkwKl/A7Q93XfB+ZTjKGPWwpTvXaHmw5aGZEEGxoS5jfslGABsN46jwpkh5ROYN31Z07TL21AdmUiJqdTmT+UtNMdJ4ontZQhmMlWziV5CsJDy26NNkJkRDw9K48Cc8A/FGZutLcRxrrD04BFha/n6PYMgttQg1RWJdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552187; c=relaxed/simple;
	bh=GNd0y4cVbWPetSA78wepeAR7zoMfnuBG+rjT2H3cUJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iBb5cmeSAUfkLD0LTY0jaZgIYjSHy3JeF8f5b8W0TYnjsS/9rvctOfJiKa+cfPboGnZ4gLOV0mZ675emkDS8D5VmVv6K2iVB/L0WoTokge0+pYfQHq68nJk/LbCPRPjKomFf4XEEKy0U2rh4oG1GBB2Mbz7eJg9bom6o0LvL77o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bq45ijOg; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-36a6a397477so15187641fa.3
        for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 07:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758552184; x=1759156984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MtIdBcXjvQm0npfMBQTkmT+Qi8zM6Vw8hQsMj63CDrk=;
        b=bq45ijOgAmprZnywT9pQa4Os54Gc44xFaAHmLAwbL/7fvG2rR1EFAhdcvhfiVQPF4R
         QZ6/Dmx+6D/eCeKSWEq4oW5ARx7fLihN6aI5PFjr5gQvDM8RugKIfSdNKJSfR4KbAQ4b
         cNozQm6aiPcWRLG23ktDWtfx7DFoZJkGjBLEc78+cdpIZNWFmk2hxHItnJFf5+KXH83K
         WsM7zV6gNNic9JNsfgyPLbY+skaQg40+6Jd2ThqVznDWkd8d3C26lFtwrtGEuZ8d9LK3
         Yi+FnNjAY99alx6nGy/vNqKZgoZBlkTRNDhxtaayMGY9ujGknln517P5cJaExfh9oqP+
         uWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758552184; x=1759156984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtIdBcXjvQm0npfMBQTkmT+Qi8zM6Vw8hQsMj63CDrk=;
        b=TsFrwOSoudASrffFzdu12jTCTNzgPyNm/8y5aJBuTcZxyoH41h2Hw4z4dLz1J45rzI
         9jZu9RoVMoYEgI5Y87po2rLc9/bxV8V5bBvb2k10v1HdEJdG9FA67JYPBImJOU0vtsUM
         itEeFI7hdNVU4ZpGl55kypmI9phDGGxNC+TdfG2z4Pb2HnHZNpV3f/FWIzfb7fh+Sdfu
         BX2Q6NHEaobHMyU6wCVb+tX2l7B7WwUVyRnCxabhgXU1xAyXBrJ+JcqTMmegdSaab4R0
         enfi4wjoYo5XNkmNfAVrV7q29ur4Xg2zI/mD86o66DOF1qhLc6R2jBejgSHSpkJjkc3T
         SI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZwPYJCb0hHUlwno8f5zAmK68Mc9tzkK3MdR428fECnQwSFhXPRv8DwQjdsXAZrZd6UnRwmxOYvJk0uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqAfNEgt77Hxh3CQb/VeTv0LyWCo4L9OhtzZJEUBhd1WaUAEYK
	EWNneycn/Vz3NkCvXsJO8YOjsZbwIEP5MMGRd19oeUqfBTDDWVb2hlhs
X-Gm-Gg: ASbGnctrNmCMp9hEErh7GMSZo9AMX9zT90WVNyfYLNiBRFhrju4Tyln90SZVXTHikia
	T6wUQR8lmJPOqFmKR4CcpTzIwlAu4i+KsDdWO49SpEsznfNsoO8gRhdwI5jPor73Ot4/MTVrr0d
	2tt9mHlon0HFHdcwWBkEfm4sTc8/KDRsp1IvTCzRXHggDbiCBx57HQFcxs6STlSOLWQJJEI4WSn
	z/im8O0FkAwfyef31msu6e7lgGl32OJh5MRjrjS/1GqM+CSnRlIKLL7SUee85bn23BWEk+dRdGU
	WrJrz2u8ctLp13HdQJo9Fv/vT5sr8XCJ800R48YhClqDbIaSf+Z8lRwllmErGGBwyEhi1cV4iX2
	7CPYbXJcnVyEp+qVex48Uh9i8Nd80Ox3RuCOPr+cQBLiHiyrQYSeFoj2zZaI6mpGOBVLP0RE4/C
	UwcO1Zi65DUHAiqhMk
X-Google-Smtp-Source: AGHT+IEyiePhldEEUbZLhZdpleCuDyBFXuJfswMLKkVPADF+9ubU/JrFMn02YfNheZiFsLVEtydyuw==
X-Received: by 2002:a05:651c:4413:20b0:360:3fc1:28a3 with SMTP id 38308e7fff4ca-36418ed0e80mr31697991fa.38.1758552183370;
        Mon, 22 Sep 2025 07:43:03 -0700 (PDT)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a25d7309sm30492541fa.15.2025.09.22.07.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 07:43:03 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] rtc: fix error return in pm80x_rtc_set_alarm()
Date: Mon, 22 Sep 2025 17:42:58 +0300
Message-ID: <20250922144300.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandr Sapozhnikov <alsp705@gmail.com>

Return value of function 'regmap_raw_write', called at rtc-88pm80x.c:205, 
is not checked, but it is usually checked for this function

Found by Linux Verification Center (linuxtesting.org) with SVACE.
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>

---
 drivers/rtc/rtc-88pm80x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
index f40cc06b0979..82984a58dca7 100644
--- a/drivers/rtc/rtc-88pm80x.c
+++ b/drivers/rtc/rtc-88pm80x.c
@@ -173,7 +173,7 @@ static int pm80x_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	struct rtc_time now_tm, alarm_tm;
 	unsigned long ticks, base, data;
 	unsigned char buf[4];
-	int mask;
+	int mask, ret;
 
 	regmap_update_bits(info->map, PM800_RTC_CONTROL, PM800_ALARM1_EN, 0);
 
@@ -202,7 +202,9 @@ static int pm80x_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	buf[1] = (data >> 8) & 0xff;
 	buf[2] = (data >> 16) & 0xff;
 	buf[3] = (data >> 24) & 0xff;
-	regmap_raw_write(info->map, PM800_RTC_EXPIRE1_1, buf, 4);
+	ret = regmap_raw_write(info->map, PM800_RTC_EXPIRE1_1, buf, 4);
+	if (ret)
+		return ret;
 	if (alrm->enabled) {
 		mask = PM800_ALARM | PM800_ALARM_WAKEUP | PM800_ALARM1_EN;
 		regmap_update_bits(info->map, PM800_RTC_CONTROL, mask, mask);
-- 
2.43.0


