Return-Path: <linux-media+bounces-65435-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N+uwKhkOOmrZ0gcAu9opvQ
	(envelope-from <linux-media+bounces-65435-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 06:39:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A76B405E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 06:39:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b="cBN/lkTO";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65435-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65435-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D3553035A94
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 04:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2B23A900B;
	Tue, 23 Jun 2026 04:39:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FB2242910;
	Tue, 23 Jun 2026 04:39:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782189577; cv=none; b=u6XHl4NLLoJBsTd6830i4RPnWRJA70YgL4UrcJvMDrd1mYGUxQrmF4Qmu3IO8ddiFwoMfUvyXQ6vCO5A63NnUJubgmeEZM+HdyLocQun6Q4Um05Ptd7rl84d4pkTORUQ2jWbw8P2qdLKoH/5pxLgPBwsQvKJOHz0XqXEoPje2EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782189577; c=relaxed/simple;
	bh=OWuWmLFeJ5HRMTGzBeh35LWznvf8RSsmOwK2Zz9yMao=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=rD9e5NyXvmkZvGV+rNUolbFs3cqhwqRwrRMEJsAchYzCcZnU9g0w5OJppFQXaHcw6dXYMG91e1jDHMvAphRFxJacdjdszifSMd9mu37Gni9Frghy1c0bwlPdTGc8blJ7ccA6CXUs0C/IfsP7ZVgWDmjz2V4j/ZjAq5kQqgBtfsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=cBN/lkTO; arc=none smtp.client-ip=162.62.57.210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782189568; bh=vByuusCNWRw7Uh/u62cApKv7cBmVCuUzrj2EhnKQ2Sc=;
	h=From:To:Cc:Subject:Date;
	b=cBN/lkTOCVGU//VISsQ42rpO0G2bnOsWgXNtRD9XNzv2z/48wLefkCVl0bz4ojD3m
	 jl3RID89kgLYjmUiO20n8O5mgAJ6wQgDHU1a3U76hXBqwKpjLIcfiTUwUzfh5gZppH
	 FeHVcUqjUWr2CgeeF8XmzI28qyT8BeF7e3Ix5bzg=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 9C91BEAA; Tue, 23 Jun 2026 12:39:09 +0800
X-QQ-mid: xmsmtpt1782189549tvoi1308y
Message-ID: <tencent_F35CBD76D113E494EEA8930320DCEF7B6506@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Ju9XwnU4+EAkg39x+31O9VPpwLPk7VJNROwMFDFrWP0XSJ5UgKu1
	 +ySn50pINIfi2Uui5qQKA0PI6jFtDR4qEVNcDFtUgMj8WYpLBeATMNDytul/HIx19I2FVlU6t3LJ
	 KA/a+Z5l3N7yzotbkfazrzVc5ja96GJJOMwV3uGU1cxl/m2NWwnml6MVXklkAJpXCiYj1WA288ll
	 LYjZGZwj86xHc7IFf0CBNk9f06kuuzx2TemWQW84bcsUXeHYnOD8tyZHDLKpyf0ppVcq5ADbxD2n
	 PC17yQLonosVpRHdNqBNvrc5/Nr7FPakZX1u4wxncFvgvYqNBckwOT3mm+qDA6UKhKgdoKLLvT1E
	 OeVxKpT2N2MBntSSRcg5elyFirGFC+74foFXqncU6zaUZyMe8LH/RpVSZCHy4KpeRj0KzBXTdyUC
	 aVI5sKslVH1qBgP66IfkovYScT3oIBuuIGyfHIKbvzibzRR7jHB9Qk9dALUJpB+qgV/AeGt0xVVH
	 ssjgKzdS4+9Sjf+RaKQO9ADlU0+5lEHT+dC1slo3K2dNuMOX24+XIsixrWtoW3tD9oH+wuvum+c6
	 qxmpl5xR7vNRL25gCFZOiXvYNiKyKnOGcpRUvjF2LY9+N0NxfS96c111PUcDicAEP9Z0wPePrlMV
	 5KGCjif5WbLA+i5kfg8uMA2DAzPXdWU76hq0vK/JQXavb1U/fe0zKH8qflj0VbQH/NpkYiXnrOx1
	 LLkZBnybySVsaV6P21leCvagUsWYdBj0w6Q7KKp9rLAwmnoI2whmCF2TyP/J9cic2wnILIifaJWB
	 bXXED5JV5+KnHiZSyUue1VRkuYNKBDEpaJBVGejZ9zkjxhMWwYGMgEpx30YojaHj1Fx0BikMfiet
	 YW+CcHweEgsCbbAyrkoE4l+mOEvLt9KA/BO3+58PO+jTferVJsf1+dI8q8DnJwvWp+B6oqZDMfMr
	 ODxPr3R+f8VWcDtU0KsbzYh5tZtPxK/yxM+Bxnauqc3OIP14hIdmMVtuaknP+CG3KvyZgD/eK1X2
	 44evPD8zQ1YpZJI1faCAMIMlPqLGEs2UMwa9PlKTEiG4fxR9na+/NyCvFNs6geaZWILguboA==
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
Subject: [PATCH v2] media: as102: drop device reference on probe failure
Date: Tue, 23 Jun 2026 08:39:05 +0400
X-OQ-MSGID: <20260623043905.1329318-1-1298662399@qq.com>
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
	TAGGED_FROM(0.00)[bounces-65435-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qq.com:dkim,qq.com:email,qq.com:mid,qq.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E8A76B405E

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
 drivers/media/usb/as102/as102_usb_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/as102/as102_usb_drv.c b/drivers/media/usb/as102/as102_usb_drv.c
index a11024451ceb..ad6c5837f1d7 100644
--- a/drivers/media/usb/as102/as102_usb_drv.c
+++ b/drivers/media/usb/as102/as102_usb_drv.c
@@ -405,6 +405,7 @@ static int as102_usb_probe(struct usb_interface *intf,
 failed_stream:
 	usb_set_intfdata(intf, NULL);
 	usb_deregister_dev(intf, &as102_usb_class_driver);
+	kref_put(&as102_dev->kref, as102_usb_release);
 	return ret;
 failed:
 	usb_put_dev(as102_dev->bus_adap.usb_dev);

base-commit: 9e7e6633458362db72427b48effad8d759131c35
-- 
2.34.1


