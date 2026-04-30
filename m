Return-Path: <linux-media+bounces-60061-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO8GI7Av82n5yAEAu9opvQ
	(envelope-from <linux-media+bounces-60061-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 12:32:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 728BE4A0DBC
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 12:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C926B300D717
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71392335067;
	Thu, 30 Apr 2026 10:32:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0868018C2C
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545132; cv=none; b=Aq0h2+oOATaz7dSkNUBdvKe++2C5vK+y7clnlaCnZqC/Eu3yfQh6nziPOmVLlLxwzyA5XpqX+U1ot1o+YtYsAmexK2L9d/AFUqTqvtm4Xg4rDA3Tf1RuGBVzAs0dx7sKwHFl2mKJaUT4JTZyH5rdxu3q0b1HFcBhCFJiRxX+Zeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545132; c=relaxed/simple;
	bh=nE74hMRIsV5NF4T6Dk1/43RR7Cc0hv+Bi14VkoKALdE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QxfJuE1g5jU3vRvJnv/ExmVEfR96jY2YOHw63JnWgS3OlYnL4Fwv0fyKFaG5KO5MpfDzrzOEPXSVf9oWWB5HnruzRRX5eXkgmylTMZYEzbQ+NQMHggDQCV0TOgQ4cYsawhOm/Z0ItTE2HVNeFjXXaL9s/ipSrnyMZwKEGpAVB9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 63UAVuJM077389;
	Thu, 30 Apr 2026 19:31:56 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 63UAVuk7077386
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Apr 2026 19:31:56 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <b3b57412-a384-48df-af15-515c6e96699e@I-love.SAKURA.ne.jp>
Date: Thu, 30 Apr 2026 19:31:54 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] media: usb: siano: don't set URB_FREE_BUFFER flag
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>, Tomoki Sekiyama <tomoki.sekiyama@gmail.com>
References: <09072a14-77bf-47cc-9b79-1edc3c1426ea@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <09072a14-77bf-47cc-9b79-1edc3c1426ea@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav103.rs.sakura.ne.jp
X-Rspamd-Queue-Id: 728BE4A0DBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[i-love.sakura.ne.jp];
	TAGGED_FROM(0.00)[bounces-60061-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.574];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,I-love.SAKURA.ne.jp:mid,i-love.sakura.ne.jp:email]

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


