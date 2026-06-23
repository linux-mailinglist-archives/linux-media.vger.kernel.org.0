Return-Path: <linux-media+bounces-65442-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oRQ7BbEnOmqP2wcAu9opvQ
	(envelope-from <linux-media+bounces-65442-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 08:29:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DEC6B4793
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 08:29:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=ptKlU8cI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65442-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65442-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAD833041493
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 06:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AE23C1994;
	Tue, 23 Jun 2026 06:28:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2159237B41A;
	Tue, 23 Jun 2026 06:28:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782196101; cv=none; b=TUDNush9RymSxqExScNjWhc0HwYlZcX4BjrYg0fVJULUEWQVX3MYzhkeESb+BYYak/K+YMjIEt8RLRogfQRBKc25QnJcQ0VXW+5XFfxilhqSk/+scSEQIHHEmu68tN3FEnFeLmlTicIf4eY8+NvpmiYC+RBHqiGRLRUfNQ9HuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782196101; c=relaxed/simple;
	bh=tHZdgiIhlgLGSSkHI5yhtwMlRrk3+z6I4UQuW3cYQUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7L1opZbYpBas5JC8u0OXZVdYledDn4Bqeg9KIRV8vbK8uc/NY3V6iUT+5uSg0le5ZuaDQJSBEM+JjUHzLL65OYMvDDskPoIkvskKL9YDEivxpVe/ItAE6yJNOpHYaFc/4Elw8f+XRaBe5DGKnb7T7TBEtAuMnJxDlDD0u3eHB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ptKlU8cI; arc=none smtp.client-ip=54.204.34.129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782196070;
	bh=toK+6HMzAvsLOmltgNBaBZ3nHsaFlX2dkAh+RYCROSg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ptKlU8cIMZbFwes+72wqhuPVq63nb4tPzwJ12V1F5h8MjcLwNeybZVBkH/pAWhl+h
	 w5fZt2/OwAa0dyFHq2DZMdfPgTWYpRpRahvuJJxMUi7PVJFzNs0zxv0vsgEUwSA2yd
	 Y+CREzB0MeQwT+Pf0A86O8Ai1LU1KELYf0MFshGk=
X-QQ-mid: esmtpsz11t1782196065t498522e4
X-QQ-Originating-IP: EIiP5TxVAc38BMU9adMLmnvfcYk9k6eHPmV7q1lQtxE=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Jun 2026 14:27:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 610307066352730692
EX-QQ-RecipientCnt: 9
From: raoxu <raoxu@uniontech.com>
To: mchehab@kernel.org
Cc: raoxu@uniontech.com,
	hverkuil+cisco@kernel.org,
	johan@kernel.org,
	broonie@kernel.org,
	kees@kernel.org,
	vebohr@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: msi2500: free isochronous URBs on disconnect
Date: Tue, 23 Jun 2026 14:27:42 +0800
Message-ID: <BAB39342E5F96FBD+20260623062742.2157304-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MAN6sKHDZ5xSCAHEiP1D+f+Io+CQo9hJyLw1c4lxHgem/fAyRdDG6634
	tlq7yPCJr6lrR/mYSQYyCEMqMzPFYrvPQLRtnmOXVVf2/png+DN8i/tQKGwhmfuxIrj73tj
	FqKHXLTeitF3NXDCGWWAY7Mcph/S+qN5A3ERk0jyr6XdblYUPrL2yPH4m0zC2leRDcLj3QA
	tMCcPBoJrmB2OPsyWVWYs0RdOcj982WISycCpfBI4KkGhAHIo6WW8cMn0YBSS2Xk+40rKU4
	XRwxnRwt7asU1miojZ0xN2bmrRQgo91MuuAccJcZvqA0qzwjI6lTZmJ3tm3OOJcEoOJDHkL
	RtoR4rIp8vxtufZFn9MIlOS2gnV94f7FOfu2XyXfFW5m6RFf8B89gxLWA52M0Ov8XodtJ0O
	/lQ/1wGaFjdFExXJ29vezgwRt6l17DqzTZq7HK2PXBGcNbu5CTUTWJWDI90/AWI4DIxqkhw
	GQmZQeh3lCUaFW/qmtlDYkTH3RjUC3ttwUNp/3tjWx6tgroX0+305MMMvzroPGu6IOTwAWG
	y3yxbAPezRdQ/J/Hr77mi5ANaUKS1+9P6KSdQFelAAv/o2ayy08i82oSHvNeSzgswrqRmas
	DYO7vG8YrDX5haBF7c6zTBC7SNs1kvWE4qPN0hXEIw8T3Lhfkc+jZOMH1i9AT1CHaLutgwl
	7qOf6SZgYBgjeTekkPC50dDJ5uG91kI3T+DRP00wIlKy4xotI09rNeE4lYtiSUDTsDkQEeD
	4cCwngIZQv7DECYpmGPxBowfdfscnAcyF1InHuwoEE5bZB2eGMWwNH/lj2iDvd6POsc4acX
	QMPicOLJLQlb2N42nSnrm9tZHy96UAtXiwqWVGZ8cfoGy7cuoN0jj4HRShOv0uim8DKjwV8
	3PF4KUksqZ9zrU0xq11kvNC8HBma+lTFJA0JQeSLxE8VuPnLP4JtvoOzO+0RwV0n26JkjlG
	g5iKx4VmcCNaoLLNuAEJTKxuukFkRQ1BiJXxhF7R4qst33iv9rkTjDquEKk6qtDB+f/vG7k
	mNmuLiYFOT24eIFtIKmK2DW8rcOOtZP+zitHQXDXbwgxsJlmAdqHd8Jy9Y9ZY=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[uniontech.com,kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65442-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[raoxu@uniontech.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:raoxu@uniontech.com,m:hverkuil+cisco@kernel.org,m:johan@kernel.org,m:broonie@kernel.org,m:kees@kernel.org,m:vebohr@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,uniontech.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39DEC6B4793

From: Xu Rao <raoxu@uniontech.com>

The problem occurs when an MSi2500 device is unplugged while an
isochronous stream is active. The streaming setup allocates eight URBs
and a 24 KiB coherent transfer buffer for each URB.

On disconnect, msi2500_disconnect() clears dev->udev without releasing
those resources. When vb2 later calls msi2500_stop_streaming(), the
dev->udev check prevents msi2500_isoc_cleanup() from running.

This matters because msi2500_isoc_cleanup() calls msi2500_iso_free(),
which releases each transfer buffer with
usb_free_coherent(dev->udev, ...). Once dev->udev has been cleared, the
normal stop-streaming path can no longer perform that cleanup.

As a result, each unplug while streaming leaks all eight URBs and eight
24 KiB coherent buffers, for a total of 192 KiB of coherent DMA memory.

Run msi2500_isoc_cleanup() from the disconnect callback before clearing
dev->udev. The disconnect path already holds the two locks required by
the cleanup helper, and msi2500_iso_free() clears each URB pointer after
freeing it, so a later cleanup attempt cannot free the resources twice.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/media/usb/msi2500/msi2500.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 282256ab812a..88c188d3b001 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -572,6 +572,7 @@ static void msi2500_disconnect(struct usb_interface *intf)
 	mutex_lock(&dev->vb_queue_lock);
 	mutex_lock(&dev->v4l2_lock);
 	/* No need to keep the urbs around after disconnection */
+	msi2500_isoc_cleanup(dev);
 	dev->udev = NULL;
 	v4l2_device_disconnect(&dev->v4l2_dev);
 	video_unregister_device(&dev->vdev);
--
2.50.1


