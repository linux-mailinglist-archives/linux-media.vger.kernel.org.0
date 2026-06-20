Return-Path: <linux-media+bounces-65305-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z9XwN1tSNmqV9QYAu9opvQ
	(envelope-from <linux-media+bounces-65305-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 10:42:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBAB6A8981
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 10:42:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=hMLSw7lD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65305-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65305-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B82F30329A0
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 08:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305AA315D33;
	Sat, 20 Jun 2026 08:40:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7BF1D86FF;
	Sat, 20 Jun 2026 08:40:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781944850; cv=none; b=gHmY5Sie1/tW/0OStG4eJaTMw9Hdktnt4usfhxWk/BWP70e5TibPqjf61B3j+eQFihEARtc8c30S5U4pNpvYACXXvINXMvgWoxj4er/PD6Eh9bVFpiWPZb//56IqT01sawL5ur3nATscZWHVRw9FOv73Vm6uRSJsxXIkNzg4Pwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781944850; c=relaxed/simple;
	bh=vPMM5uhH2oLGDm75MAgqPTGPq+Nbj2lpNrUV80IHOpg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=DCK76F8U5xzUtsvsIt9/shgCgE1j4mFcLSRCOWt908UNffE0OG2bxIo31HQwVwYJz6b+tlUNrJTbUUwSJVY2cz3GWwi8ra94b9QbZrrhvo/NsgJe5qnMiOPuk64bCwvifmK0XZ/4VkcFU/mDFR/38mqt0kSZKqqJl25fHI1EfiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=hMLSw7lD; arc=none smtp.client-ip=203.205.221.209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781944840; bh=/tK3odepgMut/SbaQhpLeDfPyGDAl1XL4rlq7poyr4M=;
	h=From:To:Cc:Subject:Date;
	b=hMLSw7lDzGfh7wjfBISVpAtilxNE+96vmCgXFEYRMWLuGF6lXPN+fKdTxiy4KimaW
	 5AeCgQbdqQN9v/Wf6eNOmZNrP8TbCK7Szc+ovkfZ0KR7rjP3bihvLyRDEJdYEdOt22
	 4flBltapY1qOw/1lk6Yrw7VCP/q8ZhZVFyZNr45c=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id A23AAAF6; Sat, 20 Jun 2026 16:40:35 +0800
X-QQ-mid: xmsmtpt1781944835t63s600f6
Message-ID: <tencent_B47ADAA251C849DD30A72DC0E25F8CCAAF07@qq.com>
X-QQ-XMAILINFO: NvfE96cLltb5iAmM3XRTJJA3DSWgbfXpskL2QBUeqdUWV2ssCZ/YvI96PDQS/Z
	 ahS8eh2r20D+7z17NAk2gCRqq3sfDC4VNT/G/5AQ59GXd/t1YXTFv2qnJpHE+FXYAG8XJTV2PAFk
	 osZVEnZ1h5ORTfWh0OSMgjZTmi+jqXHTS3Run8N6PaqAE3Y6WlOJmoAWFso6rBrlFoRHi1cA7FBe
	 cUC+EerBVLvmmIaUQYAszGYAya2nj19NLJTVbP7mKQHbGAPGmvIYLejnm5K3pKm8ypM5DLTJ7nig
	 YfCWL3QTnhLeiI9vJGvb3JPYNb7/dFkXPF5eZ1rECRM2Ovzx48fMJfNJQM+hBNwp6SHueNMNNXBu
	 uoXNBgN1gmq6X6uUMNjwnl6jvvCTBTPNT0EQwcy8V7uV2PEEgaIAZS/17+aeYWk+Iw9at2ZKPEMT
	 RpD97f08/NHGKw6MfjvdpoYDDF9DAlvS/gTaWs/v262J011gS86MgBRuWZJI9UZvVua4nPhEZ4rA
	 yrTIhUwUMp2lICCZTh0AB5F8NPqKg0HjZXVpL71z+GMlJLcfzcIdLV2cqN6JnJnPb5YoFUfMaPlX
	 9mJ0S5sEN0A1dkzlhGyVLDvb11WAS1jSeC5bsfdlKK1Vm5OFURNge3CH4+pvwcYqt2yqzLyB1hnw
	 F5mhbknyOy3QO6+Ykl1xn0ZqgD7bLTWCJKsuS/NNnxfUIHR+3hU6SlrbQ5FuNxvQz5H40TcG/Xct
	 iqDzbN4phmJWWLe1rni1namQHD5NN8nI8tIcT5uWUJ67aY4m2tdARVEr1sruXB4t/mkmsZX4sC2k
	 TBll/eKHnn9W9Mg0lvX+PpbEoKP/yT5XkRU4gANipqBpsEybYPMmznqCYRvR4bZ8yaTufCrEFlxS
	 T8juKNdaBXFRzzFRmTY6YubqIRkrJ8A00BiVgY1TA3os2XKztn2eJo0yxNXH0hOWiJXbLaxYGa9L
	 eGaANLkIdAQpHwWdAaL2CDg8kqPQdV2KdKp41wib02kmevzLpvauLVa3zfeI06cvkeeC1/6gLK9I
	 ZilNkHc+qP5Qrjr7AOWWzYCS6i/cPUN/2SDJ5iBQhweRxZJguGLGlgBUqB//5MdLhvdNtcefrErX
	 UWLKoZ
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Jiawen Liu <1298662399@qq.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiawen Liu <1298662399@qq.com>
Subject: [PATCH] media: as102: drop device reference on probe failure
Date: Sat, 20 Jun 2026 12:40:25 +0400
X-OQ-MSGID: <20260620084025.1126118-1-1298662399@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65305-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:1298662399@qq.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[1298662399@qq.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,qq.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1298662399@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:email,qq.com:mid,qq.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FBAB6A8981

as102_usb_probe() initializes the kref and takes a USB device
reference before registering the USB minor.

If stream allocation or DVB registration fails later, the error
path deregisters the minor but does not drop the initial kref.

Use kref_put() so as102_usb_release() drops the USB reference.

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


