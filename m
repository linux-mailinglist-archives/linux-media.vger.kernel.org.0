Return-Path: <linux-media+bounces-59021-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLezBU9F4mlh4AAAu9opvQ
	(envelope-from <linux-media+bounces-59021-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:35:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E7641C1C6
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA1E9305CB90
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19433B47C2;
	Fri, 17 Apr 2026 14:30:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434A83B38A9;
	Fri, 17 Apr 2026 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776436244; cv=none; b=ou5gDVZ6nHM/iO33lp0QcWLKC2KHo750sO7e6JbfuOrr0cZyLtVUSAyN9FmGP6evm7yzIdTvsPsr855sFN2nU0Wk2Poif/Il7WOCvjneicTJDyXkqMJbXqjaGpWofMPyQPuofKFXf3nYe4cR1KizKhTXI2ZsYlxaXna4VxFSNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776436244; c=relaxed/simple;
	bh=oZ/rIQj4aDVkGbtwQ41oaok3D7BaTof/1+7B5AmWQQ8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=dtOAIgx6Vl3xJoVJqlXV1BBs4GDRMPK1Kt+joMJ4WQPgo3MtpvCr/T3vT/J49rNilq0peNIWxukjz/Kx+n6zukq+q7JZ5Gv8UKuRCT/iqAmQZ4ajTkY1yFvGnyfmDMjxYxPp9z102Cja8e+Yb70fRCVIVWwzwYx9OcKoxbiSOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 63HEUSoP001826;
	Fri, 17 Apr 2026 23:30:28 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 63HEUSNA001823
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 17 Apr 2026 23:30:28 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <09072a14-77bf-47cc-9b79-1edc3c1426ea@I-love.SAKURA.ne.jp>
Date: Fri, 17 Apr 2026 23:30:24 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
        Tomoki Sekiyama <tomoki.sekiyama@gmail.com>
Cc: linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] media: usb: siano: don't set URB_FREE_BUFFER flag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav401.rs.sakura.ne.jp
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59021-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[i-love.sakura.ne.jp];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,linux-media@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: A8E7641C1C6
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
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
I found that the same change was proposed at
https://lore.kernel.org/all/20250522140048.2811356-1-n.zhandarovich@fintech.ru/T/
after I wrote this patch.
If nobody is using this module, we should consider removing this module?

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


