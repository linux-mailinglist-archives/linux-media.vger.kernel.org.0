Return-Path: <linux-media+bounces-61630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePuTGzF2BmoUkAIAu9opvQ
	(envelope-from <linux-media+bounces-61630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 03:26:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0848548632
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 03:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89D2730799E4
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 01:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A518368D64;
	Fri, 15 May 2026 01:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="L34BCyCg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDB628686;
	Fri, 15 May 2026 01:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807987; cv=none; b=gv6Gbl1fr1KoGR+qAwCDQEmBAdvBLwvaM2cp65BhJCThJfx3VYElWU76ILRIJ5wVBaFa//8+jNbp9dfWBIWwk9Jv9alxbSKu33Urs+ZBNgHKmdFqbN7n1rVoclGGVHztZRdfmr7jv/1jngYjLghhpTQb3e8jMpr0RK0kpn8DPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807987; c=relaxed/simple;
	bh=IV1YjVnZO0A0BXTgH5RkBMrjUe/NzIC0eDsOKRCaplE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rXHSuYEra8l0xjfo2PR1Ah+h3pOBDKKJKtczeLxvvyeUrlrrYOuHsoHEUzdelnvVfmF+W5URgXo4vmfsF+2oGrOSEObH//hl+Qx5JMA7q27msOI3kytZ9jaETH949VgCUhYCrzowF6GCcGX8VFKWqqbtSFUMTQ7PG6LwCXjb7Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=L34BCyCg; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1778807938;
	bh=wXNDb671mkQycOn5zCXtPX0cD41zbYQ/ko4VDJZidzw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=L34BCyCgJoWGM0qEI7QLfx0ti8fwk++/CYY+qtxxgLRaxKhzli9V6oJZG256rMUXe
	 n8GcNQLpBy+CZiMCtpF32YamKpEwDggCCrrFjD8n2kgiOktpZ9t8t/6XCZXXXbXLm6
	 LdoL2jwNlIxffcQSfM0uGJDIbFJTQsbq/o+h26pk=
X-QQ-mid: zesmtpsz2t1778807933t02cdfc2e
X-QQ-Originating-IP: Znx+6d1twP+5XtQQ7/grxvMpT0C3W1xT6fEArJ5OkjI=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 15 May 2026 09:18:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17137598037907104835
EX-QQ-RecipientCnt: 11
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
	stable@vger.kernel.org,
	syzbot+f3f24bbe63f3f6db9f44@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-usb-v2: abort probe on power-on failure
Date: Fri, 15 May 2026 09:18:48 +0800
Message-ID: <CC965F0EF2A96052+20260515011848.2670161-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mutteg8H72qDco6sBqedFrQLV0fPeNg76CeZvN0GtKSZc8akJXdgT4nG
	mlvl+zYm0LrVXI7hTXQZDGxY6uxk0Sl+QY51G3UtVQUqeckHj3HgnQt2HzQ8Et6LLYixsDy
	Jwa7FHdsFf73ZQd/2bE/DaxlcdrOs8xvlIrySttgKgrFl8RKiiqVf2G1nAI6WbK7A0juTfQ
	s+e0trWBe6lrldvVK5HFEkX71Whf9ta52Uf/lcw3O+3vMM8BPKf9HITcpz3rmQvvoj0JCzj
	1z7KR/o63POzfDXcRh/99qPkkWs40NL/ilxzZxQ7cGyd0fDU6fv1EWBk5Gib/uVrdRYjMGK
	HBUzV0pXFgzgyDsOARmMnykAfMfhyx9gSsnQ/bPkilndduFiQZVx7Y+WFxtl02p/FZ7O41L
	bz1/Fi88gu5te2yOU31mOHyany0plBCDAV3eWfP3QN6Wd/x4hqlfpIHMqu0Sbl99phsTrke
	e7CYB4UEVN1wyq5197H36L38UEFwouRgPYiN9pkidh8Rs0y/csO5eMpr5Zto22rGKKqbLbU
	Wjj9FWOp4BHs986cWzjkJWJQRPPmdgh+ZaoUdBpQjA5HpULchtnG9eNAvYoJZCsMU2N5Ew8
	vf1Ywz7CyQdTPPBBKsTiYhnp7ATDztZHYo3Zxv5jfA4XwJQAtGaWygefLTFHNbW9OZKaZna
	EZTC4wvbTTsqkYwRihEemIpMgx2LmupOsQ7R2ZYqgKOSGwOZkGHDaYDlNLkDf+QIGUnyil5
	UhoiO0lTczvqCuvEhTKgUfyzsjuKIntCA6yXekmhY1OfCQE/QuAmvDtMLsRKdahczYGPh+Y
	9UrlZk4304pKdiprAX6poqlQ7A8WNwSpcM43zZH5IdlhUys0K0UtHutSvvJjbbgonLQPf/J
	KBAepwNp1G83R3/lpJiJIgOpB5ianLuFHHbZvpuDNdBcDCQfF5CcJCjzJ6a5KCrYBs85RNd
	6oid43bTPAmuWAeAGrN7ZxLdiCWTEdS4EsLEkxbWMPmwGrzIE9xePpOnB1l/RoKGoZwE8MH
	ZWDArTnIa7dxKmmxBJnMdBvAMl50Y=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: D0848548632
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
	TAGGED_FROM(0.00)[bounces-61630-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,f3f24bbe63f3f6db9f44];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url,uniontech.com:email,uniontech.com:mid,uniontech.com:dkim]
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
Cc: stable@vger.kernel.org
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

