Return-Path: <linux-media+bounces-24692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 171EDA0B4D0
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 11:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3268A1886D69
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 10:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655EC22F151;
	Mon, 13 Jan 2025 10:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="qSdc/V+Q"
X-Original-To: linux-media@vger.kernel.org
Received: from ksmg02.maxima.ru (ksmg02.maxima.ru [81.200.124.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE44242AA5;
	Mon, 13 Jan 2025 10:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736765582; cv=none; b=l5Gs+r+2Kp+KuERYbydZJk7xAfqjX49fgw7sAkOdjuQF3V2qCmFICraxHdP93DF4JV+JT0LVUQBZyQh1INm+EBL55KWyzC0RskhS3pkh20xpCHyBxsYJTnQ3EePgEIlx4CGUbZXna8qfiFtCeqwAg+zF8gStkF1mpyv3EttazRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736765582; c=relaxed/simple;
	bh=OgIa1VE1pLjd2NsDBtMlWGuQgI2Xa6iE2TCjAasRjOs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Afo4ske9OvwTCIfxtInYMHQsb906hIyyPro+6qUaWafEZcgRe6AkPm2Yo0HKbUrPLxJNK/b2QUQ8q0b2hrgPNaE8WiFxpkaxpOfGlN50hOtAKTuupdVR9slWMgj2T5VpBimdGVMyoq21w7D7eJqSg0vvlNNx+Kuy6jJknI/UBf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=qSdc/V+Q; arc=none smtp.client-ip=81.200.124.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg02.maxima.ru (localhost [127.0.0.1])
	by ksmg02.maxima.ru (Postfix) with ESMTP id BC0081E000B;
	Mon, 13 Jan 2025 13:52:55 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg02.maxima.ru BC0081E000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1736765575; bh=Z/dfpRdVljts0/41FJaCYWmNtEmsH3/l7xNFT7YOCwI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=qSdc/V+QdvAFmlcSdEkTnoL0rLCXxa6YHnKGkSLO1IJt+YamNKQYV0XsZiDdZjyLX
	 hLyD40BDVouWrGZL7quN+Uo9LHYisroPVpyxYouwsDzvXJ3kRlDhWgy7vYicbzKBJi
	 RkIgeBEPYa7S/XRtckSmL7JlN4jJ7yiehxhoi0UepfEr6W4ZmHjMw/FxLT1lNqhIRM
	 t70PqPoYMYus3ECoqcpRmcy/M7Ngdq9Gp+K2wogco3WxWvIaU1m9usaNuvpt9v6MNQ
	 uGuwQjvM4rLsgC1lh8e2tS2/eOd3gorP6Eedr7xF5KmruDXoBcgm+UIRsicvlpW3Dm
	 8s8dXkV5D7SKQ==
Received: from ksmg02.maxima.ru (autodiscover.maxima.ru [81.200.124.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.maxima.ru", Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
	by ksmg02.maxima.ru (Postfix) with ESMTPS;
	Mon, 13 Jan 2025 13:52:55 +0300 (MSK)
Received: from GS-NOTE-190.mt.ru (10.0.246.105) by mmail-p-exch02.mt.ru
 (81.200.124.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Mon, 13 Jan
 2025 13:52:54 +0300
From: Murad Masimov <m.masimov@mt-integration.ru>
To: Sean Young <sean@mess.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Jarod Wilson
	<jarod@redhat.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Murad Masimov <m.masimov@mt-integration.ru>,
	<stable@vger.kernel.org>,
	<syzbot+34008406ee9a31b13c73@syzkaller.appspotmail.com>
Subject: [PATCH 1/2] media: streamzap: fix race between device disconnection and urb callback
Date: Mon, 13 Jan 2025 13:51:30 +0300
Message-ID: <20250113105132.275-2-m.masimov@mt-integration.ru>
X-Mailer: git-send-email 2.46.0.windows.1
In-Reply-To: <20250113105132.275-1-m.masimov@mt-integration.ru>
References: <20250113105132.275-1-m.masimov@mt-integration.ru>
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
X-KSMG-AntiPhishing: NotDetected, bases: 2025/01/13 09:45:00
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: m.masimov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {rep_avail}, {Tracking_one_url, url3}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, syzkaller.appspot.com:5.0.1,7.1.1;mt-integration.ru:7.1.1;ksmg02.maxima.ru:7.1.1;81.200.124.62:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.62
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190293 [Jan 13 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/01/13 07:04:00 #26996016
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/01/13 09:45:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7

Syzkaller has reported a general protection fault at function
ir_raw_event_store_with_filter(). This crash is caused by a NULL pointer
dereference of dev->raw pointer, even though it is checked for NULL in
the same function, which means there is a race condition. It occurs due
to the incorrect order of actions in the streamzap_disconnect() function:
rc_unregister_device() is called before usb_kill_urb(). The dev->raw
pointer is freed and set to NULL in rc_unregister_device(), and only
after that usb_kill_urb() waits for in-progress requests to finish.

If rc_unregister_device() is called while streamzap_callback() handler is
not finished, this can lead to accessing freed resources. Thus
rc_unregister_device() should be called after usb_kill_urb().

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 8e9e60640067 ("V4L/DVB: staging/lirc: port lirc_streamzap to ir-core")
Cc: stable@vger.kernel.org
Reported-by: syzbot+34008406ee9a31b13c73@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
Signed-off-by: Murad Masimov <m.masimov@mt-integration.ru>
---
 drivers/media/rc/streamzap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 9b209e687f25..2ce62fe5d60f 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -385,8 +385,8 @@ static void streamzap_disconnect(struct usb_interface *interface)
 	if (!sz)
 		return;

-	rc_unregister_device(sz->rdev);
 	usb_kill_urb(sz->urb_in);
+	rc_unregister_device(sz->rdev);
 	usb_free_urb(sz->urb_in);
 	usb_free_coherent(usbdev, sz->buf_in_len, sz->buf_in, sz->dma_in);

--
2.39.2


