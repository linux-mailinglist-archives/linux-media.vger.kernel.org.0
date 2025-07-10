Return-Path: <linux-media+bounces-37236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E266AFF679
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 03:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3977E546122
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 01:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2849627E7D8;
	Thu, 10 Jul 2025 01:44:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FEF2F56;
	Thu, 10 Jul 2025 01:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752111848; cv=none; b=rfqDwyDlQ5Fd1wWXZMeevUO7s7aJ+5dg0ZmGeTNuLAV40uSeETZopdss3YTs7uBbDCwBMKGVi9+Kjf6+SjNO09PIGv+2FBd6/IUXy3IKLqHvk+F12yY3DSL0BC2qp0uDJ4j5c5NsS7D9pzuP3ufIJH6FjuP2rg9wg31C78J7TL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752111848; c=relaxed/simple;
	bh=byz0azJOgW439ACGcjcTmUzu3/BFNdZBqINAfcgzgjo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=OiUBPxch5AdneL0NCpQ6D4amYxDOijBR0Jxe1zKvEuWExXmKjBNy7fZC2g3vCV77OUjKybB5PCFpNzp7WEgW0p/1rqRe8m0k04Pd+vpYvlGMLFeN0ri6aVKY1Ge7e8njxXkdu0beXAuLc/bl/s23/4ahiy1DOj89iCVO5zEPB3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 56A1huNm053105;
	Thu, 10 Jul 2025 10:43:56 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 56A1hu42053101
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 10 Jul 2025 10:43:56 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <56c16d80-57d0-4873-98c8-03e37edbbbdf@I-love.SAKURA.ne.jp>
Date: Thu, 10 Jul 2025 10:43:56 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] media: imon: ratelimit usb_rx_callback_intf{0,1} error
 messages
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav403.rs.sakura.ne.jp
X-Virus-Status: clean

Ratelimiting flood of

  imon 1-1:0.0: imon usb_rx_callback_intf0: status(-71): ignored

message helps reducing possibility of hitting

  rcu: INFO: rcu_preempt self-detected stall on CPU
  rcu: 	0-....: (10485 ticks this GP) idle=ff54/1/0x4000000000000000 softirq=53201/53201 fqs=5246
  rcu: 	         hardirqs   softirqs   csw/system
  rcu: 	 number:     6548       7856            0
  rcu: 	cputime:        0        739        51598   ==> 52490(ms)
  rcu: 	(t=10500 jiffies g=34137 q=35661 ncpus=2)
  CPU: 0 UID: 0 PID: 6858 Comm: kworker/0:4 Not tainted 6.16.0-rc4-syzkaller-00300-g81c3b7256f9e #0 PREEMPT(voluntary)
  Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
  Workqueue: usb_hub_wq hub_event
  RIP: 0010:console_flush_all+0x9a2/0xc60 kernel/printk/printk.c:3227

messages.

Link: https://syzkaller.appspot.com/bug?extid=592e2ab8775dbe0bf09a
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/media/rc/imon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index f5221b018808..10124a26ffde 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -1765,7 +1765,7 @@ static void usb_rx_callback_intf0(struct urb *urb)
 		break;
 
 	default:
-		dev_warn(ictx->dev, "imon %s: status(%d): ignored\n",
+		dev_warn_ratelimited(ictx->dev, "imon %s: status(%d): ignored\n",
 			 __func__, urb->status);
 		break;
 	}
@@ -1806,7 +1806,7 @@ static void usb_rx_callback_intf1(struct urb *urb)
 		break;
 
 	default:
-		dev_warn(ictx->dev, "imon %s: status(%d): ignored\n",
+		dev_warn_ratelimited(ictx->dev, "imon %s: status(%d): ignored\n",
 			 __func__, urb->status);
 		break;
 	}
-- 
2.47.1


