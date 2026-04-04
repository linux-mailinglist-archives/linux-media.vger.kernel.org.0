Return-Path: <linux-media+bounces-58054-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGVTKCla0WnuHwcAu9opvQ
	(envelope-from <linux-media+bounces-58054-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 20:36:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E64B39C121
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 20:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22DBD300F9EB
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2026 18:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE9C33B6D1;
	Sat,  4 Apr 2026 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SN2brQSF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702DD2EA171
	for <linux-media@vger.kernel.org>; Sat,  4 Apr 2026 18:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775327723; cv=none; b=KhYs+sduhPbzoRVv0jPFcludDMd2C0LCeylLDh9a2246HRZkkuDNptrhkVopX8YjPLx2fFpFzi3YyoR0aKdXHzoED2hnQ0Wvty6QtbGVazVjVXazDISWpgy9dSb+ms1U4XfTnJvhPvMyHjVXn+E9L7d4n8iyS4hbG5J72lhUA7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775327723; c=relaxed/simple;
	bh=S50TsFsiU9M1K6y5e4M9F3kUqHvXqombkzull3nXiJY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mcTRJ0PtnqFYV1lkCbJ/KZs4Ll2ponDsUwM3x9IZNepwrYaIyJXQnyAUWaWVXzfvWRww2HpX/e6aDx7kgi6+9jYzo1dvMyG/OhHQYSdin5rnZ8s0cwNQ2FrWNaq5PQMBOrSTbM4SCRyQ2XCsUADRixVoXeIH3S7+76vdudQTR8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SN2brQSF; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c736261ee8dso895361a12.1
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2026 11:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775327721; x=1775932521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WVWl5re71pNAD6Btcrt4wzNXwUF8WBs0uZS/3pQYX54=;
        b=SN2brQSFUMcjEr3mnIClhVsflp+lE+tt5uLMUG38jynUlMQ8TyKnTSnaRRzVylLSYn
         OxxYjUR5/LTQMN/tyoT9uWRh8tIhAQiJl3Olpf2desldZH1Qb1Qd9au+crVKadM12YLc
         FK04SS94OqlUf7cFubriGrtA7mQfhThT/OkiBLAUOLAg+G3RNtBKnKS8OY36bYYPPeRt
         W1GJ3fkkvjvVC3TVl9oWtOyg/rQojweDMarqnNHF6QRmWbn2UYRs/iBIBwz2W/hsZ7pk
         eONyo63pdYzaT0G9weU9wix7QzeTS1SswNFC9G1umP0SqDgGUxFd9iAhF7mLeuf6KzfG
         AGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775327721; x=1775932521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVWl5re71pNAD6Btcrt4wzNXwUF8WBs0uZS/3pQYX54=;
        b=HbXkHKx7I0n4/2Vou9iunOcuDAYt3iC0ksuAWIWF0eSJkIrUNeDw+KVVTRtyusFKbj
         6bKxSse2zKKcVVdsMl51b/YIqR4MulUELz74hT/sqp0FK8zOgSnPSQJ4MzrmW11oI4lR
         q/cEFYHZQMtz6Tp8pFpxfGarwToCYIJf1OHxY8ql1F8s531pVwkRI+SoSmDB2Yur6ho0
         EQKhP+JxL4C6gOWOnlQ3W0mj65G7aHUHE4FqLi4FSXkTMkAGRjCEnoGsdmGL4ytzobTf
         hVVLWqzsXMjHoLtvsY8ZGp5+q5LUBgO5PJAZ3WPCup61i8B+cSXbI7XQAGsRw6R3dk7D
         pd0A==
X-Forwarded-Encrypted: i=1; AJvYcCUxWRGL1EKeqe0Dti05l0WwJUItw1d+0fJdW8dKkSCIr7qacU/2ZBv7TIR8dXBuVF2U+U/0neghXcBjiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDDGGT3hSBVgweQn479hQFXEopwk7Is21DSNYc0Znk4u8hka6w
	QW4TkxPnFrAJdqUYrzUWm3KBZPbqKT5+Oj4ogBFvEJ0eeW/xzhupAVLVQ4V15TTu
X-Gm-Gg: AeBDies2QQRWJnoXmho3zH4j0dD1aTRKHERjcV8T2WzsnMzoe9aoz0naQ2dqu4IoMnd
	bk6eJm5T8M8g6aL+KgdwtbK05f65ESfuAnfRE5Xb+NiAV3J1i2CPAMFHdXuuTtifsFksd40YVko
	KCzgdDJxO2VbUSWKT6uaNmkNK2m/RMwul3yLqAubpCbrDnV/Jji8e8J4BkcdYZ/JlirOAdM3lpa
	95JOpT8s2uroupzG7LyijCiX7FA4wnW0nYn4FhMqPUV2hixTnkahUe6gUqi4Uuc8nThbpXZs7n8
	HCBgOFLqm86v5ecPsxFu+egD3Qhonyij08aPf8oSSmpMuxzYRvJ8zto2MHtCBTkxImmkmM62imP
	Dms99Hn7KRHz4OuZuZareS7wOK6uD31ZhbsSm3JgNtwMW1u3qQKl483Wq/dolzXmZBsPFsOX42m
	bk9hFIW/pLOgmMwaWp4JVVQA1sA3vkOFcdr//E21zPTD/et23zqGba/H3zwXOvghI7+7WqM9McL
	4UbmWpuS8sWnXzCzdU6+q1RUb2eGfHRbWQ=
X-Received: by 2002:a17:902:f60f:b0:2b0:917c:bc4 with SMTP id d9443c01a7336-2b2817d94c3mr75628605ad.4.1775327721438;
        Sat, 04 Apr 2026 11:35:21 -0700 (PDT)
Received: from rohaniyaa-Vivobook-ASUSLaptop.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm120081765ad.39.2026.04.04.11.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 11:35:21 -0700 (PDT)
From: Rohaniyaa <rohanmithari09@gmail.com>
To: Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rohan Mithari <rohanmithari09@gmail.com>,
	syzbot+5d7eece664082e0c5c1a@syzkaller.appspotmail.com
Subject: [PATCH] media: rc: igorplugusb: fix memory corruption race condition in probe
Date: Sun,  5 Apr 2026 00:05:07 +0530
Message-Id: <20260404183507.773866-1-rohanmithari09@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-58054-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rohanmithari09@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,5d7eece664082e0c5c1a];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email]
X-Rspamd-Queue-Id: 3E64B39C121
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rohan Mithari <rohanmithari09@gmail.com>

Syzbot reported a race condition causing a WARNING in usb_submit_urb.

In igorplugusb_probe(), the driver registers the RC device via
rc_register_device() before initializing the internal interface data
via usb_set_intfdata().

If the device is abruptly disconnected or accessed by userspace
immediately after registration, the disconnect function or active URB
submission can trigger a NULL pointer dereference or Use-After-Free.
Without KASAN enabled, this race condition silently corrupts the slab
allocator, leading to a delayed fatal panic in kmem_cache_alloc().

This patch fixes the race by ensuring the private data (ir) is safely
attached to the USB interface and the hardware is fully initialized
before exposing the device to the subsystem via rc_register_device().

Reported-by: syzbot+5d7eece664082e0c5c1a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5d7eece664082e0c5c1a

Signed-off-by: Rohan Mithari <rohanmithari09@gmail.com>
---
 drivers/media/rc/igorplugusb.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index 3e10f6fe89f8..a694ed1e5c1f 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -214,17 +214,14 @@ static int igorplugusb_probe(struct usb_interface *intf,
 	rc->rx_resolution = 85;
 
 	ir->rc = rc;
+	usb_set_intfdata(intf, ir);
+	igorplugusb_cmd(ir, SET_INFRABUFFER_EMPTY);
 	ret = rc_register_device(rc);
 	if (ret) {
 		dev_err(&intf->dev, "failed to register rc device: %d", ret);
 		goto fail;
-	}
-
-	usb_set_intfdata(intf, ir);
-
-	igorplugusb_cmd(ir, SET_INFRABUFFER_EMPTY);
-
-	return 0;
+}
+return 0;
 fail:
 	usb_poison_urb(ir->urb);
 	timer_delete(&ir->timer);
@@ -233,8 +230,7 @@ static int igorplugusb_probe(struct usb_interface *intf,
 	rc_free_device(ir->rc);
 	kfree(ir->buf_in);
 	kfree(ir->request);
-
-	return ret;
+return ret;
 }
 
 static void igorplugusb_disconnect(struct usb_interface *intf)
-- 
2.34.1


