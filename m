Return-Path: <linux-media+bounces-41613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267DDB410C5
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 01:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC1FA3B9DA3
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 23:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E2F27F160;
	Tue,  2 Sep 2025 23:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="AjbR6Sa8"
X-Original-To: linux-media@vger.kernel.org
Received: from ksmg01.maxima.ru (ksmg01.mt-integration.ru [81.200.124.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4299C23B0;
	Tue,  2 Sep 2025 23:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756855753; cv=none; b=YJALcupnKe07Jug8Ae0pAIqNQsPS7QPVtB3ws2qL7CbJfZ9gY3kInGg6OpIZ0/Q8dizmiGOzXZATiz7X7JyFinsWiB6aaufkPcCV2KgL9VgW0Z3buIY1f5cvU/byqmggnEOTZFCKEhH7Nb3pyeCOgFL3nC9flok9TQsi2ZlemPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756855753; c=relaxed/simple;
	bh=SEtGgAVUQer9dl3z2RKdIUzVbQNgUPXc6RoXTpF/wZg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eovsTGnZlidWxzHAGzu6Xt5lxUBi9GcM01M/efUTKNv/UvyUeNDxNWaXBuJ0ZHl17gVpEcYXdB+1w4hun4kohlTIgKrPE5QRwltNKEX3J49G2ypTz3QqaVtzT2s2FgY6iL/OKkwFSe9uoTszElMbFZoxRuSRzbZNnKsLN6MVSK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=AjbR6Sa8; arc=none smtp.client-ip=81.200.124.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
	by ksmg01.maxima.ru (Postfix) with ESMTP id 0393DC000C;
	Wed,  3 Sep 2025 02:29:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 0393DC000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1756855748; bh=k1+EGiK/n5xjGkwOh8h7YdQrC4oUAa59hbmYV+IeFHg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=AjbR6Sa8+ELYVuFVCkTqpVQjFEC543GLHqQizg5cz89IkQGiMFeSIlzeDlGj2LuSy
	 OhH7yGGRunDLi32t+zM5W8ssXH06B76ztEgmugHhkS2ixBYQ0BwWlect0HPffcrqcv
	 6bTdu2a3wQN3mUAg/Fisu/gFdW+M37qzaPWtmW5yy3Dl1vUf48tnGSEhmbcKuI7CCo
	 v2KkurGm5XHVWsx3K9NoQ/bQs7M7ZE6nH756nDpt0wNminztGP6iRivBNz73l7e4IU
	 g6bwTYac0pqAyTr8chwA2/Szp3UQ9BLhlAHaRl/8htNFXV6VSrxdDAhzBG65xHkeQn
	 A8utXWevD1hbQ==
Received: from ksmg01.maxima.ru (mail.maxima.ru [81.200.124.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by ksmg01.maxima.ru (Postfix) with ESMTPS;
	Wed,  3 Sep 2025 02:29:07 +0300 (MSK)
Received: from db126-1-abramov-14-d-mosos.mti-lab.com (172.25.20.118) by
 mmail-p-exch01.mt.ru (81.200.124.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 3 Sep 2025 02:29:07 +0300
From: Ivan Abramov <i.abramov@mt-integration.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Ivan Abramov <i.abramov@mt-integration.ru>, Hans Verkuil
	<hverkuil@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 1/1] media: msp3400: Avoid possible out-of-bounds array accesses in msp3400c_thread()
Date: Wed, 3 Sep 2025 02:28:14 +0300
Message-ID: <20250902232819.2415335-1-i.abramov@mt-integration.ru>
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

It's possible for max1 to remain -1 if msp_read() always fail. This variable is
further used as index for accessing arrays.

Fix that by checking max1 prior to array accesses. 

It seems that restart is the preferable action in case of out-of-bounds value.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 8a4b275f9c19 ("V4L/DVB (3427): audmode and rxsubchans fixes (VIDIOC_G/S_TUNER)")
Signed-off-by: Ivan Abramov <i.abramov@mt-integration.ru>
---
 drivers/media/i2c/msp3400-kthreads.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/msp3400-kthreads.c b/drivers/media/i2c/msp3400-kthreads.c
index ecabc0e1d32e..1d9f41dd7c21 100644
--- a/drivers/media/i2c/msp3400-kthreads.c
+++ b/drivers/media/i2c/msp3400-kthreads.c
@@ -596,6 +596,8 @@ int msp3400c_thread(void *data)
 				"carrier2 val: %5d / %s\n", val, cd[i].name);
 		}
 
+		if (max1 < 0 || max1 > 3)
+			goto restart;
 		/* program the msp3400 according to the results */
 		state->main = msp3400c_carrier_detect_main[max1].cdo;
 		switch (max1) {
-- 
2.43.0


