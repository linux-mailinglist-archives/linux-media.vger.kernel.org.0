Return-Path: <linux-media+bounces-65452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7LxJJBRMOmoj5gcAu9opvQ
	(envelope-from <linux-media+bounces-65452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 11:04:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F35E86B58CC
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 11:04:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=ioF9jx+f;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65452-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65452-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D7363019811
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 08:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6233CF68B;
	Tue, 23 Jun 2026 08:58:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34F53CF213;
	Tue, 23 Jun 2026 08:58:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205103; cv=none; b=RepwblJkOFV/HhY7iCNXk5bVWT9tJgQQqneKM2hfpTWGIt+hQv0VvrIqOKAP5EgvjorCwlY9SZdj6GIt+eu3uRLbtImpwtwegM9jci3z/zekUSp4JLnXQXR4HqlQxAfk2SiXthDJZoQZPjy3iUjdJyNbHx362MOvwQS7xPuPeTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205103; c=relaxed/simple;
	bh=AtHJHerjVCkcPF7MXs3fd5s1fRbOouBp43R27zWa7os=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Z++f8t56qHYeDYgD5qxe85KZKQH9ue4fcDzOgj6RK1/K7FyVAOlf8hY0QtM3Wq0lcY/dT/y5BY5IuvxtGKp2hlVKC6wFfZRO9cLOIT7TGB1AkZuX/95zMhnhDipHwOJunGnpP5KPXiwZ/uUWuRJK/bjn6Cg00XcZmJQQVxmlZ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ioF9jx+f; arc=none smtp.client-ip=203.205.221.221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782205092; bh=ByLLDuTdHQ66I2EseRISj68f2tdyWuiR8qQrRro/Iak=;
	h=From:To:Cc:Subject:Date;
	b=ioF9jx+fa1GLYbTDSY3j8Nhh2sBJy0rEmWQu7Sv59djBPNa3jsCCeyhNb1DhfYFXO
	 VojcVMuY/HBqYjOdg/gYx9nXkwGimWVlk/gGbFPQ7ks+tWdrsKBdlepMgpQeteEg4A
	 g1ob5fMOJ1iOgKsKgk2nzDviiXtZWM1VGdmv7kv0=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id E2D93A86; Tue, 23 Jun 2026 16:56:45 +0800
X-QQ-mid: xmsmtpt1782205005t517qmriq
Message-ID: <tencent_82A872B4FEBAE805125BB7D18918D0E25705@qq.com>
X-QQ-XMAILINFO: OATpkVjS499u5ooZSXGai3YPq6BFC3SAS26x+FR7q63OZazKqodJDm3a6ShXaj
	 nZx32NL+zFZeG+KzAeAzgbxUy5alO8Hx2h+3lq9gKXqxjlUgyc2w/4PkGPZK/pusWrp6Jo2umU7O
	 UNgnQDqRlUV4HusKuTybIwJpWhIk9/38WxrsVIDeLZdg99kIDMY/Go6CVtT5/+h+esLmUB7vhIAZ
	 AJtrw1Hh4F4rMytLXxk6a5jQ+whxpI/de+X0CEZP1xsa87rynB100b8dLrxRUYkcXAauwcEFrdr2
	 txQMIgZb5jWBMoBZAoaG7O9PbwDXP+bmgTejFGw3Qthq9gMLukl+4L4anXx0hUzB//EU16pUhxIC
	 evOtFMiqsbWqkeiqRECrP06R0COA5M+R6CNkm2pONYQA034kJfCVYjEGZrHWPCjRmcSANaXZTgL+
	 QDYj1NsuYmAeAKKCbuVD6FW3AEeyHm7kV7QaVZ1SypxeGmALA4MUVXf5ctUoXqxD7W/bwpk3eV5H
	 4Hi+sQ4DNMtMTHVpi2uW0kavGZ+ruVgm/GJKOy/umT0JV0w+GVcMEOuIePICMDIFvB+jWI1xhQ4s
	 fqvIVkG3auVfhzJHEGaJuHASPAldcivQcYTT5cHlNAxwdIa3ZUGnZr5M35jXS1c3m6s9xzEY7LAT
	 S5ijEMmQ0UdKDyWdO/M01gag4Jwb59A+mO4hSzUqkuaCJ4H91C8/6h31ez40gUme3EY5/jiDRzTH
	 ilpaLGCUS4pfjgntC7N6IaFwE5n0xNAJ4Auf9sqz+2F/ArfZ0ctk3r+lgy4YfVazhIOC2Af78fop
	 RyC732Knm4zunS3gTVwW6Y5elXZZdL6nnvnliQ7YgBN5demLd2RBrMZWptGrSfevo3CbKaMGH9ko
	 oyYbmOWChEiFn1qMHxq+LTUPb9BfYpY2MCtXNJwV3CauaP7Fayv9wT/hxhwO4QnIr00OdA1nGohT
	 UwPZ1Q7MNTYl1jHOQfVBhY0R5CyB9bB6fxk4TU3IE58xyPoS9uNJ5O1GQFzpliWcIOjQKTObGYu7
	 +hs/S905jfj4Nd126zy/8e0PUmtz9slINOh+re1Rp4IELQ0eRK
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Jiawen Liu <1298662399@qq.com>
To: mchehab@kernel.org
Cc: bod@kernel.org,
	hverkuil+cisco@kernel.org,
	kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiawen Liu <1298662399@qq.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] media: as102: drop device reference on probe failure
Date: Tue, 23 Jun 2026 12:56:39 +0400
X-OQ-MSGID: <20260623085639.2234871-1-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65452-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:bod@kernel.org,m:hverkuil+cisco@kernel.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:1298662399@qq.com,m:stable@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[1298662399@qq.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,qq.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1298662399@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F35E86B58CC

as102_usb_probe() initializes the kref and takes a USB device reference
before registering the USB minor.

The change named in the Fixes tag avoided freeing as102_dev directly
after usb_register_dev() succeeds, because userspace can open the minor
before a later probe failure and hold an extra kref until release.

However, the stream-allocation and DVB-registration failure paths now
deregister the USB minor and return without dropping the probe path
initial kref. That leaves the USB device reference held by as102_dev
leaked.

Drop the initial reference with kref_put() after usb_deregister_dev(). If
no userspace file is open, as102_usb_release() releases the USB device
and frees as102_dev immediately. If a file is open, the final free is
deferred until the last file release drops the remaining kref.

Fixes: 8bd29dbe03fc ("media: as102: fix to not free memory after the device is registered in as102_usb_probe()")
Cc: stable@vger.kernel.org
Signed-off-by: Jiawen Liu <1298662399@qq.com>
---
Changes in v3:
- Collapse the error labels so failed_stream falls through to the common
  kref_put() return path, as suggested by Bryan O'Donoghue.

Changes in v2:
- Add Fixes and Cc stable tags.
- Clarify why the probe failure path must drop the initial kref rather
  than free as102_dev directly.

 drivers/media/usb/as102/as102_usb_drv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/as102/as102_usb_drv.c b/drivers/media/usb/as102/as102_usb_drv.c
index a11024451ceb..2e6c9b50ee5f 100644
--- a/drivers/media/usb/as102/as102_usb_drv.c
+++ b/drivers/media/usb/as102/as102_usb_drv.c
@@ -403,13 +403,10 @@ static int as102_usb_probe(struct usb_interface *intf,
 failed_dvb:
 	as102_free_usb_stream_buffer(as102_dev);
 failed_stream:
-	usb_set_intfdata(intf, NULL);
 	usb_deregister_dev(intf, &as102_usb_class_driver);
-	return ret;
 failed:
-	usb_put_dev(as102_dev->bus_adap.usb_dev);
 	usb_set_intfdata(intf, NULL);
-	kfree(as102_dev);
+	kref_put(&as102_dev->kref, as102_usb_release);
 	return ret;
 }
 

base-commit: 9e7e6633458362db72427b48effad8d759131c35
-- 
2.34.1


