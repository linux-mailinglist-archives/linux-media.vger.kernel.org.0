Return-Path: <linux-media+bounces-62997-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG2fCP7pGGruoggAu9opvQ
	(envelope-from <linux-media+bounces-62997-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 03:21:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF775FBF66
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 03:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6BC473006448
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8063559F8;
	Fri, 29 May 2026 01:20:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8F6298CB2
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 01:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017656; cv=none; b=oTjPrv1c7rqhk2ziIhOFV8SGfEGUb/C7zg6Xpl+UfjiqzCvLfDUJBfT6I/LcMqmXZivuO9flDYutkOiAJ6NFairyKf6Xf43RPPFv+iD0FoqsL4AQnvm9dAKlJudzr/La7L3ixAzooD81ejFwyxt0oS5FWuSEno1RV3E5SA/PSso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017656; c=relaxed/simple;
	bh=nE74hMRIsV5NF4T6Dk1/43RR7Cc0hv+Bi14VkoKALdE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=d0zG2iz/Ygyo8BVzR0RBPX7gMy540t1mFJwHuHn2BV01THzbRbpl8JfT5QiUZNadlDcuSBrJqvt+JPj7Xv60IvcPy3AeKAxTfYT7v60W2MMogIzqgclTcC14Ih8VZYsu5D6gaaCowFNSoWxirKbf2+VOBWzB8rb7jka/oBCvUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 64T1Kn24027355;
	Fri, 29 May 2026 10:20:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 64T1Knmr027352
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 29 May 2026 10:20:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <bf19e526-3327-46a5-8ecd-4baaadef5bcf@I-love.SAKURA.ne.jp>
Date: Fri, 29 May 2026 10:20:46 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v2 (repost * 2)] media: usb: siano: don't set URB_FREE_BUFFER
 flag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav204.rs.sakura.ne.jp
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-media];
	DMARC_NA(0.00)[i-love.sakura.ne.jp];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.995];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-62997-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 1EF775FBF66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

syzbot is reporting invalid free at usb_free_urb(), for

  smscore_register_device() allocates all buffers at once as an array

  smscore_createbuffer() maps each element in the array to cb->p

  usb_fill_bulk_urb() assigns urb->transfer_buffer using cb->p
  which may point to a non-head element in the array

  URB_FREE_BUFFER causes usb_free_urb() to free urb->transfer_buffer
  which may point to a non-head element in the array

The urb->transfer_buffer must point to an address returned by kmalloc()
family if URB_FREE_BUFFER flag is set. But since the urb->transfer_buffer
allocation strategy for this module is to allocate buffers upon device
registration and free buffers upon device unregistration, we should
avoid setting URB_FREE_BUFFER flag. Otherwise, double free or invalid
free will happen.

Reported-by: syzbot+b466336413a1fba398a5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
Fixes: 564246fd3ff4 ("media: siano: Fix coherent memory allocation failure on arm64")
Tested-by: Tomoki Sekiyama <tomoki.sekiyama@gmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Changes in v2:
  Added Tested-by: line.

 drivers/media/usb/siano/smsusb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e0950b7..8140dc0c8b7d 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -168,7 +168,6 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 		smsusb_onresponse,
 		surb
 	);
-	surb->urb->transfer_flags |= URB_FREE_BUFFER;
 
 	return usb_submit_urb(surb->urb, GFP_ATOMIC);
 }
-- 
2.47.3

