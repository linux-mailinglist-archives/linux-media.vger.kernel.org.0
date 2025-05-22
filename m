Return-Path: <linux-media+bounces-33133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A28AC0D76
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B93C1179C0B
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348DC28C2D9;
	Thu, 22 May 2025 14:01:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D8812E7E;
	Thu, 22 May 2025 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922464; cv=none; b=FJ6Z6QfEqldy8ELbv4yXCnOxISn6Df/6oV/IgaVsG04p5UdtzxhaLfY0e/IFGuERYjlc0ioAcs5Ha+xZ0HKl1MisbHU+GofZ1bIaDAfnIW4Nfg0gP0TGEQCdGIcKmX6t2PpFgOCEASm0KrLrRRvGEG0cVxNdXar5PGg6HQDNiEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922464; c=relaxed/simple;
	bh=3JzNh4XaOmJeSctKDFPAISlkbTaeCwFwhtXzxqm1R74=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KAHRDXA380xQzuWiqaMZchxmm0XafdeNTEdCiyqmlVv6cp5Au4MzcEAGGdTVr7ZpAnijwqkJSn2CLpyX83oErsJo2T3+LPWxSSif3fKDrViYyQl6dRNmkXGWKG96QoxyqlWGsl//ThlR0WXMxrDsmOisggLqNwvBbHEABJGK+dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 22 May
 2025 17:00:55 +0300
Received: from localhost (10.0.253.101) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 22 May
 2025 17:00:54 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Hillf Danton
	<hdanton@sina.com>, <syzbot+b466336413a1fba398a5@syzkaller.appspotmail.com>
Subject: [PATCH] media: usb: siano: do not free urb-specific transfer buffer
Date: Thu, 22 May 2025 17:00:47 +0300
Message-ID: <20250522140048.2811356-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Since siano driver uses separately allocated buffers for urb tranfers,
such as smscore_buffer_t *cb, and deals with them accordingly
via calls to smscore_putbuffer() in smsusb_stop_streaming(), there is
no need to attempt to free urb->transfer_buffer by adding a
URB_FREE_BUFFER to urb transfer flags. As syzkaller shows, it triggers
a warning which will bring about proper crash on systems with
'panic_on_warn' set.

Therefore, skip the flag setting step to fix the issue. This change
was tested exclusively with syz-repros and KMEMLEAK sanitizer.

The idea for this patch was originally devised by Hillf Danton.

Suggested-by: Hillf Danton <hdanton@sina.com>
Reported-by: syzbot+b466336413a1fba398a5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
Fixes: 564246fd3ff4 ("media: siano: Fix coherent memory allocation failure on arm64")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 drivers/media/usb/siano/smsusb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 2c8179a84991..a78b1c233aad 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -168,7 +168,6 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 		smsusb_onresponse,
 		surb
 	);
-	surb->urb->transfer_flags |= URB_FREE_BUFFER;
 
 	return usb_submit_urb(surb->urb, GFP_ATOMIC);
 }

