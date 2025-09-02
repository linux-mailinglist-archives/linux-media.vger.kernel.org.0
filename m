Return-Path: <linux-media+bounces-41614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A17B410C7
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 01:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 191FB1897E77
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 23:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB53F27F727;
	Tue,  2 Sep 2025 23:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="IfecAki+"
X-Original-To: linux-media@vger.kernel.org
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0CD25FA3B;
	Tue,  2 Sep 2025 23:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756855800; cv=none; b=le7MPj8kgax+9u9xQFX1WP9vcoikpIzSaZb7urrS9hWuakg7zwfR2gXx9jZEznIfmClhZOCwVnE+R+iOID7za/aRY1C7eAwQPFbl7xfS2owoBgh2Y/MHTf6flcCwAbU4z9tbxQe3o8wPzVuuiIjbQRj9be8SRCcUQ7dNV2odNzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756855800; c=relaxed/simple;
	bh=eCtynB9qCCWRxn3bv5JMf0afGJAMZ0YPFQlCRPf4gVI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L3EsLyWvUHt84mraQJqda0I4/LNCvTLaW8kNBx+ENafULEuXgcl2I8eW+QyH2qOA6gtvCH1jjJnIT/3AeE28qhhaTNOtR1Xq/RyIrW+KqhdP3MKe50rPUctE7w5Wli54nC0SJpMlfMUSBRC38q14YC4plLl/iToGguPXyksV89k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=IfecAki+; arc=none smtp.client-ip=81.200.124.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
	by ksmg01.maxima.ru (Postfix) with ESMTP id 5B71EC000A;
	Wed,  3 Sep 2025 02:24:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 5B71EC000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1756855478; bh=OsvMOjxVa4lS/AuBTii+O5PhCoQ7bxijjbz8vf7z0sk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=IfecAki+f8G6BMkqZI/hE8vUgdbrDDksuPxq9vcvCDpmqfDLcWlEcM/vEjmNiwQ4S
	 8+Dt+kZuL5kGvanCjc8E/GwpzBpO5H/UcAou92pab6y6b5DGDyiFKJ4vbOxjto/FFf
	 3iIvuvVS0FsUMmGLkHzHaYH4alE9heC850C9nh79AD8NTkeI5k5pyAGSQoad4oOiag
	 B6klY7jWbrci0BLjKdCVQX3KiwwUjvhCz8hT1xwNuAErt/aqZygNy0WSBxiUTaZnZu
	 EvyR7t4pPoB8U5GP4Sww6q1wsvkDLM/oA6VjGbWK4uVpQmLNb0OoJZ+9hWQoHhK+5x
	 Lh+jYMqMfI6yA==
Received: from ksmg01.maxima.ru (mail.maxima.ru [81.200.124.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by ksmg01.maxima.ru (Postfix) with ESMTPS;
	Wed,  3 Sep 2025 02:24:38 +0300 (MSK)
Received: from db126-1-abramov-14-d-mosos.mti-lab.com (172.25.20.118) by
 mmail-p-exch01.mt.ru (81.200.124.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 3 Sep 2025 02:24:37 +0300
From: Ivan Abramov <i.abramov@mt-integration.ru>
To: Hans Verkuil <hverkuil@kernel.org>
CC: Ivan Abramov <i.abramov@mt-integration.ru>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 1/1] media: adv7842: Avoid possible out-of-bounds array accesses in adv7842_cp_log_status()
Date: Wed, 3 Sep 2025 02:23:31 +0300
Message-ID: <20250902232332.2415227-1-i.abramov@mt-integration.ru>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mmail-p-exch02.mt.ru (81.200.124.62) To
 mmail-p-exch01.mt.ru (81.200.124.61)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: i.abramov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 65 0.3.65 8dea72be373f570d1254d7cfea8c999699687d30, {rep_avail}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, ksmg01.maxima.ru:7.1.1;81.200.124.61:7.1.2;mt-integration.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.61
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 195981 [Sep 02 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/09/02 21:48:00 #27735634
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7

It's possible for cp_read() and hdmi_read() to return -EIO. Those
values are further used as indexes for accessing arrays.

Fix that by checking return values where it's needed.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a89bcd4c6c20 ("[media] adv7842: add new video decoder driver")
Signed-off-by: Ivan Abramov <i.abramov@mt-integration.ru>
---
 drivers/media/i2c/adv7842.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 5545cd23e113..6db26b7f0496 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -2699,6 +2699,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 	/* CP block */
 	struct adv7842_state *state = to_state(sd);
 	struct v4l2_dv_timings timings;
+	int temp;
 	u8 reg_io_0x02 = io_read(sd, 0x02);
 	u8 reg_io_0x21 = io_read(sd, 0x21);
 	u8 reg_rep_0x77 = rep_read(sd, 0x77);
@@ -2821,8 +2822,9 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 		  (((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
 			"(16-235)" : "(0-255)",
 		  (reg_io_0x02 & 0x08) ? "enabled" : "disabled");
+	temp = cp_read(sd, 0xf4) >> 4;
 	v4l2_info(sd, "Color space conversion: %s\n",
-		  csc_coeff_sel_rb[cp_read(sd, 0xf4) >> 4]);
+		  temp < 0 ? "" : csc_coeff_sel_rb[temp]);
 
 	if (!is_digital_input(sd))
 		return 0;
@@ -2852,8 +2854,9 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 			hdmi_read(sd, 0x5f));
 	v4l2_info(sd, "AV Mute: %s\n",
 			(hdmi_read(sd, 0x04) & 0x40) ? "on" : "off");
+	temp = hdmi_read(sd, 0x0b) >> 6;
 	v4l2_info(sd, "Deep color mode: %s\n",
-			deep_color_mode_txt[hdmi_read(sd, 0x0b) >> 6]);
+			temp < 0 ? "" : deep_color_mode_txt[temp]);
 
 	adv7842_log_infoframes(sd);
 
-- 
2.43.0


