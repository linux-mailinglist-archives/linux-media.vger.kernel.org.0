Return-Path: <linux-media+bounces-53271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLaDIVRdnWmxOgQAu9opvQ
	(envelope-from <linux-media+bounces-53271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 09:12:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF0183722
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 09:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12DEF3003618
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0C0366078;
	Tue, 24 Feb 2026 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="tIT7I0LU"
X-Original-To: linux-media@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8086B3375DF;
	Tue, 24 Feb 2026 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771920459; cv=none; b=inZcjPJi6bU+TsG/xVK5bAmT0Bj3CXfGOWkRnVEr+JpHMrzzo8US3QkOC/Lu/w1BQIxJAUCTQjts+HvRa8FjEUsQzMTxXwvUmAuf4tIhnVtTktQRm2bbY9b19X1tuxz0df5diERI7RiD/b4LkuajZ9jTIQ7pvx/lI/Ia1HpW1uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771920459; c=relaxed/simple;
	bh=cg/3+vQXW36JdAEnn6LV5WbWoKtLOw3t6ZhwfyETReU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rWnPdaQKZmejfYePTacMgrA/8KgoUlVqt9Ng1qyoxRwnuyxRxxVrwQk0/g8W6f2emlSdUkGzvC556iVzwDrTJ9EKKsDHaT4LYA0J6qhmmn/kBkQl4rcMKtAMa3IDkB40yxseqg3EUfXxA8uq0LP1fgmK3C7lMiTaAV8oHofMhOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=tIT7I0LU; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1771920448;
	bh=0aA3GOQjKuLjmzfwgQIDqro2LKFlQeZoo1K4N69XWZA=; l=2317;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=tIT7I0LU3jzOWxnHcjMKSq8AgPp5fbDlkseur0Ci5BBlvBGp8rGVnrZhbfnRA3fJ6
	 f2VZ52Y9WAUROWmUd/l6J9dj5R8yCH5Jx1CKU/Gz8LlNj6mXvmWgAm9nfmN5ARHIGv
	 60Vw1z0i47M2oAngt7EmhGiTiUcqj/bWRFfJeimrBjJHmJ8S5xvHusYW0S6YVgL5E8
	 i+b3jqXEn7P3I/SuSvGwFDQcV9UJwBViqmY5SePPHL71lw7LDDhJQwJbFJzU+7ARpn
	 K8BUBPU4w0S2twclLOjqwp3llypacXiL8bXWlCg+R7qBVhZHBY3oHxe5/4HhGBzv0f
	 1BBAO2V7YucTg==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2285640:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Tue, 24 Feb 2026 16:06:51 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 24 Feb
 2026 16:06:51 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Tue, 24 Feb 2026 16:06:51 +0800
From: <cy_huang@richtek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jacek Anaszewski
	<jacek.anaszewski@gmail.com>
CC: Bryan Wu <cooloney@gmail.com>, Jacek Anaszewski
	<j.anaszewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	"Sakari Ailus" <sakari.ailus@linux.intel.com>, <roger-hy.wang@mediatek.com>,
	"ChiYuan Huang" <cy_huang@richtek.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [PATCH v4] media: v4l2-flash: Enter LED off state after file handle closed
Date: Tue, 24 Feb 2026 16:06:42 +0800
Message-ID: <3f5e98addcedf0f425b63608b0ca694129fb31a5.1771916686.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[richtek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[richtek.com:s=richtek];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,samsung.com,linux.intel.com,mediatek.com,richtek.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53271-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cy_huang@richtek.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[richtek.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,richtek.com:mid,richtek.com:dkim,richtek.com:email]
X-Rspamd-Queue-Id: B1FF0183722
X-Rspamd-Action: no action

From: ChiYuan Huang <cy_huang@richtek.com>

To make sure LED enter off state after file handle is closed, initiatively
configure LED_MODE to NONE. This can guarantee whatever the previous state
is torch or strobe mode, the final state will be off.

Cc: stable@vger.kernel.org
Fixes: 42bd6f59ae90 ("media: Add registration helpers for V4L2 flash sub-devices")
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
v4:
- Refine the led close into lock guarantee.

v3
- Remove 'Reported-by' tag
- Fix identation check for patch integration

v2
- Fix commit message redudant space cause patch robot parsing error

Hi,

Since the original 'direcly return' is bad, the below lines cannot be
called like as restroing led/iled to sysfs control. Therefore I refine
the code writing. 'goto' may be a bad coding. But to minimize changes,
this could be tradeoff.

Open discussion if there's the better solution.

[Preface]
We encounter an issue. When the upper layer camera process is crashed,
if the new process did not reinit the LED,  it will keeps the previous
state whatever it's in torch or strobe mode

OS will handle the resource management. So when the process is crashed
or terminated, the 'close' API will be called to release resources.
That's why we add the initiative action to trigger LED off in file
handle close is called.
---
 drivers/media/v4l2-core/v4l2-flash-led-class.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
index 163badeef76f..259fe014db26 100644
--- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
+++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
@@ -624,10 +624,17 @@ static int v4l2_flash_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	if (led_cdev) {
 		mutex_lock(&led_cdev->led_access);
 
+		/* If file handle is released, make sure LED enter off state */
+		ret = v4l2_ctrl_s_ctrl(v4l2_flash->ctrls[LED_MODE],
+				       V4L2_FLASH_LED_MODE_NONE);
+		if (ret)
+			goto out_led_close;
+
 		if (v4l2_flash->ctrls[STROBE_SOURCE])
 			ret = v4l2_ctrl_s_ctrl(
 				v4l2_flash->ctrls[STROBE_SOURCE],
 				V4L2_FLASH_STROBE_SOURCE_SOFTWARE);
+out_led_close:
 		led_sysfs_enable(led_cdev);
 
 		mutex_unlock(&led_cdev->led_access);
-- 
2.34.1


