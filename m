Return-Path: <linux-media+bounces-61605-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH0/Bbm+BWpLawIAu9opvQ
	(envelope-from <linux-media+bounces-61605-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 14:23:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD75418BB
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 14:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15BB9305D5C8
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A056E3DC4AF;
	Thu, 14 May 2026 12:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="m1yqK4eP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD77A3AFAE7;
	Thu, 14 May 2026 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761357; cv=none; b=ki6jPDwAKIHSDQd4hqvJqVAbvdbFASrnDuaaodXRVsZoc6y+RgVz6lUSIud5YdkAzaH4JolTVqgRMEoMoGX6zfJwY+vZlbjTX5dDPcb6tgKh6Mmomzxkfq0UUYcr2AskH5UQXNeV0IpuFPZZzbm6onpiIEUeVnJ+m81GrX4sKk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761357; c=relaxed/simple;
	bh=CF59wHDLYkYomlLOymWpbVSCcsvbCe1Kum8Y6mH+TPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gYRAkwetxtizXgYLD/4Czilz5bW8p3jQdXZRc1hbjaOJyua1KlyMbNmHqXuoOKEX4r0fRHTXGpX6MPChH4txsLQ7GAyDpyKcbHtLpOIUJB+dxy9P0FHzaRZfJ3eCRCHncQqfL/Hx9u4VuI0IhNgG4XhQxAKtRQF4MZ85PDeF5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=m1yqK4eP; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1778761301;
	bh=FdCXR+IriFz4PfcHcorRd2ofIaZySrU25+n2KQ/LyoI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=m1yqK4ePhPTunAK7ymPj0oXOpSwoS5XdlgqNEdo2qSkgUlZ9ZbOnv9bYO8NztaIx2
	 IIbN2Bku/ep1Y/mjXhoFx9f6UqzxRu2U/ik8D6V4B/Bto07kpxNY6zvo+Q/0oLCP6i
	 UPqCd2aaqmaFPBNsbHYbX8iI1FqrytvrihcSHong=
X-QQ-mid: zesmtpgz6t1778761281t1daf310b
X-QQ-Originating-IP: D9ejdqPxcwF8mJNDxWCN+P4MCBd4EUNp78nc6ewuprM=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 May 2026 20:21:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13115496104257423360
EX-QQ-RecipientCnt: 10
From: Xu Rao <raoxu@uniontech.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	ribalda@chromium.org,
	brad@nextdimension.cc,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com,
	syzbot+f3f24bbe63f3f6db9f44@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-usb-v2: abort probe on power-on failure
Date: Thu, 14 May 2026 20:21:18 +0800
Message-ID: <D69A374F59588677+20260514122118.1682587-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MUe2PhP7Eq79w14ZDLLPTlnCFgW5Vqc5tT8hZH9L+O19Xqp51svxBPCF
	pjbh3yfEvWFVlUkJFlLHoc39o5DPXsvsXa51BVS7McpcjB8OHBfWvHTu9zB9RMkT9galUS/
	gdLMURJ0U9C9xP18t0AgLHdN8Hoo9bbhyzpu0z8PfaJwuOsj2DpOq4qNe3Qqkm6t0lnLWYc
	cTRpMhXkuvfH6gOUXO0Jzu0V1Z3jK+xBIc/8FOSWzoEupI6d9sGanMd+0bWmVM61YtxL7RJ
	xbTAEW9r46gtKkF/MHTbMFoaUkrDGXK1iMPiQ2lGkailXAo+O+igVEkQ8A9If68A2IB9jzC
	3ox8wlOL/+cJqqimNwnmfTNJTHsZxR1vUtp+0HeGqKj3tZLNZMYnpQoHELw4vAiEysspjjr
	MRYc6aFDOC9h5vbvSoiGL/EReikdLqPRGvoHKLWdVGra9jUF4sAgVbXHTgajntf7HFy5XmN
	h8giQrzy8bZ6Ag+E+JZYcbHXVnkzirgHfM30XZyPYdtJtTkA82bzVHB1DUlKmWZQZ9hWbi+
	c6J8oKFpOpzGvT+0mte/XYpWamLE7T65Cx2ZsKRTHKYVe4Ior9yj+9ZBsE7hiRKiELD2vZj
	5TkWpSHBugElG/BEXSUD/yBkxdG5Z2Q7ijbZbOdz0+M9kiXjkYS5sehnd8855CiDbU/s3Vj
	OlADa4uG+7AJf1w6O5XxW1NOqyijHYPvlqcpvR8TRSnxtDOSizSKgRoqKg09K2LqbHTPdp7
	L7msl0fQFdxuQ7WvbOWKz+Q85gZA9cMooN9i/Hd9wGAw6OQwinHYS0u5GEgvoJ+WbEvp4IM
	3GWTdJn7GngSxbI8VL4ghxRwpcypOGy71+dc2evdB9MX1b9K3Q5fUZSmcjMPIVniHMp4aew
	aHTJtVLgZnJrjhFCme/ZTLBWlOk65tj+3RwDOeQwopFXdi+GpCg6bd4okpBMQzqFx3vUTBT
	RrFcVVQ1y1sAK4bln0dfvuoBuQSJsNM+j7RO5U5IJ2rrIv/xdqjyhzzGV8ZGLYdfgA7KU+O
	Sf1MYTSAJr55dvVZW5nInOFxrLCB/IWXfQZL8xcSeVR4PurGDrshnEUX7SbMvnETrCBEmJ4
	vgnpR8c4GnbGxxunBYJAma5TBvPt1L62g==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 64DD75418BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-61605-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,f3f24bbe63f3f6db9f44];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email,uniontech.com:email,uniontech.com:mid,uniontech.com:dkim]
X-Rspamd-Action: no action

dvb_usbv2_init() powers the device on before registering the I2C adapter
and DVB resources, but it ignores failures from the power control
callback.

For CE6230, the power control callback selects interface 1 alternate
setting 1 with usb_set_interface(). A malformed device may not provide
that alternate setting, causing the initial power-on request to fail.
Probe nevertheless continues and may publish the I2C adapter before
failing later during adapter/frontend initialization.

The later failure path then synchronously unregisters the I2C adapter
while USB probe locks are still held. Userspace may already have opened
the newly published i2c-dev node, holding an adapter reference and making
i2c_del_adapter() wait indefinitely in the probe path.

Abort initialization as soon as the initial power-on step fails. This
keeps malformed devices from exposing partially initialized I2C/DVB
resources.

Fixes: c79b339f9292 ("[media] dvb_usb_v2: copy current dvb_usb as a starting point")
Reported-by: syzbot+f3f24bbe63f3f6db9f44@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/683a9833.a70a0220.1a6ae.000a.GAE@google.com/
Tested-by: syzbot+f3f24bbe63f3f6db9f44@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=f3f24bbe63f3f6db9f44
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d250433d..5635394e5b7d 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -852,7 +852,9 @@ static int dvb_usbv2_init(struct dvb_usb_device *d)
 	int ret;
 	dev_dbg(&d->udev->dev, "%s:\n", __func__);

-	dvb_usbv2_device_power_ctrl(d, 1);
+	ret = dvb_usbv2_device_power_ctrl(d, 1);
+	if (ret < 0)
+		goto err;

 	if (d->props->read_config) {
 		ret = d->props->read_config(d);
--
2.43.0

