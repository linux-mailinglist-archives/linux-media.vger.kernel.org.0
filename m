Return-Path: <linux-media+bounces-27469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E28AA4DC59
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1731B3B24AF
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563CE201024;
	Tue,  4 Mar 2025 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="ZeV8A67R"
X-Original-To: linux-media@vger.kernel.org
Received: from ksmg02.maxima.ru (ksmg02.maxima.ru [81.200.124.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB7B200BA1;
	Tue,  4 Mar 2025 11:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086931; cv=none; b=TjClcRBDzPKATGHwJgb3cKhvAiuTuim56eMRPF5bCQJXUFgoGDKypLqAm3h0KGi8QBuFjxgH1PVvI8ah/6+dEdnNYQnt/oAnOLxd3tAjPVSc7cCURgZwmResWc9igy9Tk0M4KA5Wo+rIwxFgnpBQGLInYl331wSlh4W8sKNkfGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086931; c=relaxed/simple;
	bh=5BDM17uom/O82sIHy0lmhsXIKxXEb/ZX3iY6CW+R5N0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JtT9tDZXKFrdbR8C2YB/opdl9H673y9ryX+fnjEVCiBB0+0HpOMuslhFJFzpkgy83fNHoEmp1Hl+yeqVC3NcncgwT0shKuQKp6Sk/ml2O89MbDmo9LEU1BHL9DCtQD5LHsC1gKE0oxKot8/9PS4JNc6vUxc9qdzqrdLUSoKzTYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=ZeV8A67R; arc=none smtp.client-ip=81.200.124.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg02.maxima.ru (localhost [127.0.0.1])
	by ksmg02.maxima.ru (Postfix) with ESMTP id BCE2D1E0002;
	Tue,  4 Mar 2025 14:15:18 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg02.maxima.ru BCE2D1E0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1741086918; bh=Z0V0m8DolYfni7Yo+BrJEX6IjWmZXrYC9lZZ7A+VISI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ZeV8A67RJAaKq5uMY6QB4vEkrOzD53rwqBg3xirIe1Jf5IgKgAcBj5CoR6Y58h//J
	 dvvPUQg3oSGEIOSs/BIYgzdAnpt20plmHD1C0JPz8mCZpdwTJVglf4ivOt/F+4Necd
	 6UySDoYZ3O7TV0hrbcB/DQTKRd1EU6Iyj0l6jfmqtXsKcbR7yWhLHhJEx0zYMmjq9K
	 6XH/evsqndVLuWqyqYq0Ah4VvD8wGSZbuflD8qj3QDftVbuGwr+DPam/Xmfp76KIu6
	 sgmsrx7Yw8U7rraxsYovpjoO3UsvkCUWgLg3EUCtbzSDjhBfw2vEAVEu/JLJZpg5VC
	 yG4RXMKBzQK2w==
Received: from ksmg02.maxima.ru (mail.maxima.ru [81.200.124.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.maxima.ru", Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
	by ksmg02.maxima.ru (Postfix) with ESMTPS;
	Tue,  4 Mar 2025 14:15:18 +0300 (MSK)
Received: from GS-NOTE-190.mt.ru (10.0.247.85) by mmail-p-exch02.mt.ru
 (81.200.124.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Tue, 4 Mar 2025
 14:15:16 +0300
From: Murad Masimov <m.masimov@mt-integration.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Zheyu Ma <zheyuma97@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Murad Masimov
	<m.masimov@mt-integration.ru>, "Rob Herring (Arm)" <robh@kernel.org>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Fred Richter <frichter@hauppauge.com>,
	Michael Ira Krufky <mkrufky@linuxtv.org>, Brad Love <brad@nextdimension.cc>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] media: lgdt3306a: handle negative SNR in lgdt3306a_calculate_snr_x100
Date: Tue, 4 Mar 2025 14:14:53 +0300
Message-ID: <20250304111453.1688-1-m.masimov@mt-integration.ru>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch02.mt.ru
 (81.200.124.62)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: m.masimov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {rep_avail}, {Tracking_from_domain_doesnt_match_to}, mt-integration.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;ksmg02.maxima.ru:7.1.1;127.0.0.199:7.1.2;81.200.124.62:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.62
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 191453 [Mar 04 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/03/04 09:41:00 #27591543
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7

The lgdt3306a_calculate_snr_x100() function returns value of type u32.
However it is possible that the calculated SNR value is negative, which
may affect the behaviour of the driver. E.g. lgdt3306a_read_snr() assumes
SNR (x10) can be represented as a value of type u16 so passing negative
32-bit values would result in garbage there.

Since the dvb-frontends API only allows unsigned SNR values,
lgdt3306a_calculate_snr_x100() should return 0 if SNR is negative.
The same way calculate_snr() returns 0 on negative SNR in lgdt330x driver.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: b63b36fa44d0 ("[media] DVB: add support for LG Electronics LGDT3306A ATSC/QAM-B Demodulator")
Signed-off-by: Murad Masimov <m.masimov@mt-integration.ru>
---
 drivers/media/dvb-frontends/lgdt3306a.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index 6ab9d4de65ce..e6c3b65157e5 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -1500,6 +1500,9 @@ static u32 lgdt3306a_calculate_snr_x100(struct lgdt3306a_state *state)
 	snr_x100 = log10_x1000((pwr * 10000) / mse) - 3000;
 	dbg_info("mse=%u, pwr=%u, snr_x100=%d\n", mse, pwr, snr_x100);

+	if ((s32)snr_x100 < 0)
+		return 0;
+
 	return snr_x100;
 }

--
2.39.2


