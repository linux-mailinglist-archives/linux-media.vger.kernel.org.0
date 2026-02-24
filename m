Return-Path: <linux-media+bounces-53308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFr0LzfznWk2SwQAu9opvQ
	(envelope-from <linux-media+bounces-53308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 19:51:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E881D18B93A
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 19:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9B943063088
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 18:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C470F2D97B5;
	Tue, 24 Feb 2026 18:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="2WyLgy88"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CC9271464
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 18:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959081; cv=none; b=vDpCV4WwK0C1D1O+Qib3DwaXfdFTmgtFMadi6bRLkN6cdi8fKYG6VXAmofHAWDht9e5l0aTWSenVCZkxSXd1TYpVqGbrIsYyrHJ9AOs4siXnUv+YXNoDFvhW2w0aG/Sxo5OBEM6jTE5DyaARMv3y4qnZ8xnbazeWNuqTCU6s2Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959081; c=relaxed/simple;
	bh=JQ+jvsHR+s7Da9yC6L3hyuz1uybCtnSHzHcmiEvGkOU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=TBFFCtZknBz4FKJNQoRoFj6nst1g1D4wwt/AkDXcSwd9Ph40DjnObYmGXJ+DtT3vLdDy6eMkEaV+FiT1dzJPmuI3O0hT1cbjPmxOhUFP5uZh+Rvuhmv3ob961nojMfcFtBCgjPlEsq92cWg1KYcKDVaj7UQJ7xeeBx4nJAheAsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=2WyLgy88; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4645dde00a7so133673b6e.1
        for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 10:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1771959078; x=1772563878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5VW5lLhettJ6gLieIpQNhWSKrt8EY5mDjQHDHeeBlc=;
        b=2WyLgy8892XMgTI6t0BMkn2UZ4ebERpYMS82hhyOSXJ1flshwQlqkm0Kz2T8bUGJkA
         p/Ay0fgoa68mJ2GwRlUxkmsMc4Fkj7cEsng0LcDf6MqKsrGWOv/uMMNTvGogWSAvMrZG
         1IliANEH3MeTbsMvkq+8GlsybyvJKwu1NKw0Ouz7hJjEW7l4jNrd1P7Pk/4uiwMwVr9U
         dtS6Nr0gHrtNlWzhqBO3vM7KpSmUs/hO8aIzDIssXxqenWbSGRW6mccK/y48ZiJi8XVv
         EzEFUESboaXchXA2GqGZAntIz08tyyi3LUa7arr5+Y+OHNz+rewXqO9p5wf1pcZBEZuW
         /W7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959078; x=1772563878;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5VW5lLhettJ6gLieIpQNhWSKrt8EY5mDjQHDHeeBlc=;
        b=lzPjlmAkWptl25626eDdJqkWhj++GJwZwviBT7HPseu6HDeeaVuImu7LeKbe9CRI9A
         jZQFclmkKF1HeG7vbhWcbjri/DWKacwW1RPSl2oRUop0z21XCuBgaNdoaaIEHl2tV9m0
         g0wOwiqs+kgjBKhyY2Ggcdx8WI6apFMzwPgcY1Vtc7s2ffHbsj5/uaFL99jJiCo6e44O
         oWQPLTTkKilu8BhAXB2rAUjrE6HhOf9Mn6KnHXuGmwUS1b6OzL+DGdhqTplgoFOz9pdK
         uATK1ra5TyHxAFqyTDDd8y4XxQ3z0kJh+98ixJeoP7+94DP+VYdNf0swk2AG6HCuImTj
         3Tqw==
X-Forwarded-Encrypted: i=1; AJvYcCUbhtaggI14ZyNY7ZQReaFoMs2eXk+A1ovyTPH2g/HBTMp5MNC2gR3BbUbkdwZ3OMSqirbAZ8pkra9zKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5005ZBK0eANDXGY0C2fTCKb6ypn8s6qkwpj2nL+AinXgIbql9
	fUjKP4UcwCofpmhJjspbeY7cIbZIP+bYTC2zr3e7py8T2qqh9fa+W5C1KwKPJDtX7VM=
X-Gm-Gg: AZuq6aJqfTXljJT4lyDzpz4JQzpl9ccaFHgbCXSPtkVXlkG0E29cFYFLspoJHDJb+Km
	AqB1dVrsgURCsx2gz+IbJG5obPrSdpbpEQM/+SwbcEPs2f4T2rG7EbtlMqrAqj9mamMR9FbldKC
	UvYr4ld/Ix06eYf5Aiv2lzRLJxS2bTMrLosdzTFe0pvhIZyfj6im1hYwu48oc8My2g8ubDTv4Cu
	0Dqn0gekayle74IUQxy62ZKRQwYqdqv77g+CxXteqeGb+bbrhpmGEX4x4SDYPe8LpuJV7oTZOln
	esoGKrrRcscjIZWFRVYJ6YripUMYBqI4UIRKXYwp9pes8CcQQw3fLbsmrJnS+gZpV+F1zxZid0h
	v20lO3QGjzYLtqICRWVRLIbX4pbiswpUrbq8V8eg0XH/7QZPe1sam5lmu++lfacMz0VPbBZWklh
	iRuOJIVn/7g0HACxdIuHGirmLiB4dE+4ZXuTwiaPnYSILl+y7O99PiInkPjYRqRSDdrw4DGy91v
	Vok2wPuZw==
X-Received: by 2002:a05:6870:898d:b0:3ff:46ad:271 with SMTP id 586e51a60fabf-415e5a90c01mr642463fac.23.1771959077870;
        Tue, 24 Feb 2026 10:51:17 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-415db90c6dfsm1568073fac.12.2026.02.24.10.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 10:51:17 -0800 (PST)
Message-ID: <32f48179-b51d-4513-b6a4-054241bec8e9@kernel.dk>
Date: Tue, 24 Feb 2026 11:51:16 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] media: dvb-core: fix wrong reinitialization of ringbuffer on
 reopen
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel-dk.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel-dk.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-53308-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[kernel.dk];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:mid,kernel.dk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kernel-dk.20230601.gappssmtp.com:dkim,appspotmail.com:email]
X-Rspamd-Queue-Id: E881D18B93A
X-Rspamd-Action: no action

dvb_dvr_open() calls dvb_ringbuffer_init() when a new reader opens the
DVR device. dvb_ringbuffer_init() calls init_waitqueue_head(), which
reinitializes the waitqueue list head to empty. Since
dmxdev->dvr_buffer.queue is a shared waitqueue (all opens of the same
DVR device share it), this orphans any existing waitqueue entries from
io_uring poll or epoll, leaving them with stale prev/next pointers
while the list head is reset to {self, self}.

The waitqueue and spinlock in dvr_buffer are already properly
initialized once in dvb_dmxdev_init(). The open path only needs to
reset the buffer data pointer, size, and read/write positions. Replace
the dvb_ringbuffer_init() call in dvb_dvr_open() with direct
assignment of data/size and a call to dvb_ringbuffer_reset(), which
properly resets pread, pwrite, and error with correct memory ordering
without touching the waitqueue or spinlock.

Cc: stable@vger.kernel.org
Fixes: 34731df288a5f ("V4L/DVB (3501): Dmxdev: use dvb_ringbuffer")
Reported-by: syzbot+ab12f0c08dd7ab8d057c@syzkaller.appspotmail.com
Tested-by: syzbot+ab12f0c08dd7ab8d057c@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/698a26d3.050a0220.3b3015.007d.GAE@google.com/
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

Linus, if you could pick this up directly, that would be great. I've
spent weeks pinging Mauro and the dvb/media list, and have yet to hear
ANYTHING back. This bug has been known for 1 year. As any user can crash
the kernel with this, it'd be prudent to get it fixed. IMHO, but
apparently less so the dvb folks opinion.

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index c946c8ea6e39..9c3e9f7859d8 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -168,7 +168,9 @@ static int dvb_dvr_open(struct inode *inode, struct file *file)
 			mutex_unlock(&dmxdev->mutex);
 			return -ENOMEM;
 		}
-		dvb_ringbuffer_init(&dmxdev->dvr_buffer, mem, DVR_BUFFER_SIZE);
+		dmxdev->dvr_buffer.data = mem;
+		dmxdev->dvr_buffer.size = DVR_BUFFER_SIZE;
+		dvb_ringbuffer_reset(&dmxdev->dvr_buffer);
 		if (dmxdev->may_do_mmap)
 			dvb_vb2_init(&dmxdev->dvr_vb2_ctx, "dvr",
 				     &dmxdev->mutex,

-- 
Jens Axboe


