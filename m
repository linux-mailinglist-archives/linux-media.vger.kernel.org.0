Return-Path: <linux-media+bounces-65812-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LOoKIVxrQGryfQkAu9opvQ
	(envelope-from <linux-media+bounces-65812-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 02:31:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5C76D2E17
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 02:31:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bw7N4Ktu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65812-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65812-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE3A83019FD1
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 00:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6869B19C556;
	Sun, 28 Jun 2026 00:31:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEFB40D574
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 00:31:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782606673; cv=none; b=fLdOhI2FnKpPTEHsOiKh+U6ma05msfFyF6ca8dXfcpr9vhSmUPXRYXL/GOg5XkjBdi4kEAyA5B5StvBHPKdmLWP21+VO+DKZaDAYoKeYsmEJESfRmJpTz6pB24nWdFpySV1aR/ymmtBNsgz2AB1oL1HUNH0gcM+nnRa14I83S1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782606673; c=relaxed/simple;
	bh=YCurl51Wd9up5XqC1lcIyo6fi0heIKeRJH9GNK+mSLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XtQeAYhavQyXANKonLNbdbULPa8yEBtlard/EJUWG5l2AUK0NcHpWcCbvgQj1iC+xO/rLKhGiG6VMJ7IzqIiYJKOAkU2+ZxR14rC1E48ecEGe+KtwvT3UsVfoibNvX9LqXi62bs2W4g9YDSIC05wLSbbl7FsLi0NEi12FR81JnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bw7N4Ktu; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49270f771c9so5167345e9.0
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 17:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782606671; x=1783211471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KOz501n904lvdLTm47kCJmdYhlDM6NLfGSeUIVVTmrQ=;
        b=bw7N4KtumtpGsZZMwFPL7DAaM9HLBW5vDq/uZ+gWejrhf50XRyGgqiVYGWzHitCZDO
         0+YhGEU4jVqxzgdsUQl1+u7hPE4VJ5hH1UhAlcKO5ULzb2bK2fH0jiVoCA33vVRzaM4O
         Sodm4s3hSJhTImueqVYD0lkgGE66+ClwOkzIcSnLTwknTpYffmRnAyUGYyJyUzoMOszs
         MNxfqa+Gr4EP1uSeARwuGCo5l54f1P7yQIO3TJQX5jOVwqXKpOKV4IulE9Zo/6ZD+c5O
         u1AghjAR+ymLABBzKCRLy61VE7m+82cJZPNWf1NReiOdEC/oVb15/xhaEkd5BCOM1tcV
         t/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782606671; x=1783211471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOz501n904lvdLTm47kCJmdYhlDM6NLfGSeUIVVTmrQ=;
        b=H6WZMEL0yGiJBJFpFruVCZEuV5hRR4EjBHyyVOx+jNIQiiY8GFDU84PUytphrcyPo4
         +4uJEo0X5JM+B0eoL3mMuhmTrd2c2dpUXzq467HBJPvScgsFP4hKana/H0usjdNqX5FR
         NBrTo8LRwGK6zWyxNeA1zu6gL4dRacLylJPGa7EWAhc77V3IoyyVtWIAZ1J7Di3LkpDy
         yllgOVbBrzszKT4eMZrw9EKVN5+36WxqqYeJo1+U7V7m7PMeihZ52iNQbsUvh5d8NNgv
         hTLC77W+rqJQ0FUa9Ibl+272Tg5k9KTx7CTwQm2rRNGfH4pE6wY33Mts3HStvbz+zWK/
         obgA==
X-Gm-Message-State: AOJu0YzITg7X/5qAKoQSPDs9xi89gzDwTU/E59weyDDKygsaF3rK06FY
	TB2d0kx35tvzeZXyriORdspOkaJfrgB9kgKN1bDMNJZIom59HE9auuR2
X-Gm-Gg: AfdE7cnRTb7+ix1L49SoxTrFJ8ltHFaSsKkI0MSW1j7i3J2uWel9lRhnXASHOOyZO1E
	yt9uHbVt9JB1TxfRWGPl9cBlptI3GS7JxtWVxtV5LwayCnxDSRTdKcUlUpZTqKIBAKG03o8mNTk
	BCLZaHTRDOmG+WYeQgXkzLEZIupeODGL4y6pCkANFfz+nc0uUCh9x12RMGEyXv76VOOya21BgVI
	wCe6OxqtqqjNFUId89Gt8rQ9KNUeVoZj8SD4FVScZujAnq9wJIQbOEV2sZEBsoLT2k6k0kzMhhd
	6SP5WeCZVo+nWpdU6XLpnoVT+W6WGOfgdbyQbYQUYnGiaSdoyrHh+9B0VaTdVhzV4AtZOfdqoRy
	ivcT8S2bc+NnVfV/fTRXwYHS8Afb2LzCWaDcJJs2RvF5eVWHXWqiZW3MbV/NpRXkG97D4Eqkt2k
	5wB25B8SfmC0AswAFXDXh7nBND+A==
X-Received: by 2002:a05:600c:6b70:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-49266893253mr130977045e9.25.1782606671052;
        Sat, 27 Jun 2026 17:31:11 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268f7670bsm192987435e9.0.2026.06.27.17.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 17:31:09 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Abhishek Kumar <abhishek_sts8@yahoo.com>,
	stable@vger.kernel.org,
	syzbot+39ff299961a7c07f00f0@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] media: em28xx: keep device state alive for registered video nodes
Date: Sun, 28 Jun 2026 02:31:03 +0200
Message-ID: <20260628003103.24832-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,yahoo.com,syzkaller.appspotmail.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-65812-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil-cisco@xs4all.nl,m:abhishek_sts8@yahoo.com,m:stable@vger.kernel.org,m:syzbot+39ff299961a7c07f00f0@syzkaller.appspotmail.com,m:alhouseenyousef@gmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,39ff299961a7c07f00f0];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED5C76D2E17

The V4L2 core takes a video_device reference before invoking the
driver open callback. That reference does not protect em28xx state
because all three video_device objects are embedded in em28xx_v4l2 and
use video_device_release_empty().

If initialization fails after registering a node, the error path can
unregister it and drop the last em28xx_v4l2 reference while a concurrent
open has passed the core registration check. The open callback then
dereferences the freed video_device in video_drvdata(), as observed by
KASAN. A disconnect has the same lifetime gap.

Give each successfully registered video node references to both the
enclosing V4L2 state and the parent em28xx device. Release those
references from the video_device release callback, after the core has
drained pending opens and existing file references.

Fixes: ef74a0b9ff56 ("[media] em28xx: move video_device structs from struct em28xx to struct v4l2")
Reported-by: syzbot+39ff299961a7c07f00f0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=39ff299961a7c07f00f0
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 35 +++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index da0422c65e5f..4274a9bcb432 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2289,6 +2289,31 @@ static void em28xx_free_v4l2(struct kref *ref)
 	kfree(v4l2);
 }
 
+static void em28xx_vdev_release(struct video_device *vdev)
+{
+	struct em28xx_v4l2 *v4l2;
+	struct em28xx *dev;
+
+	switch (vdev->vfl_type) {
+	case VFL_TYPE_VIDEO:
+		v4l2 = container_of(vdev, struct em28xx_v4l2, vdev);
+		break;
+	case VFL_TYPE_VBI:
+		v4l2 = container_of(vdev, struct em28xx_v4l2, vbi_dev);
+		break;
+	case VFL_TYPE_RADIO:
+		v4l2 = container_of(vdev, struct em28xx_v4l2, radio_dev);
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return;
+	}
+
+	dev = v4l2->dev;
+	kref_put(&v4l2->ref, em28xx_free_v4l2);
+	kref_put(&dev->ref, em28xx_free_device);
+}
+
 /*
  * em28xx_v4l2_open()
  * inits the device and starts isoc transfer
@@ -2554,7 +2579,7 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
 static const struct video_device em28xx_video_template = {
 	.fops		= &em28xx_v4l_fops,
 	.ioctl_ops	= &video_ioctl_ops,
-	.release	= video_device_release_empty,
+	.release	= em28xx_vdev_release,
 	.tvnorms	= V4L2_STD_ALL,
 };
 
@@ -2583,7 +2608,7 @@ static const struct v4l2_ioctl_ops radio_ioctl_ops = {
 static struct video_device em28xx_radio_template = {
 	.fops		= &radio_fops,
 	.ioctl_ops	= &radio_ioctl_ops,
-	.release	= video_device_release_empty,
+	.release	= em28xx_vdev_release,
 };
 
 /* I2C possible address to saa7115, tvp5150, msp3400, tvaudio */
@@ -2965,6 +2990,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 			"unable to register video device (error=%i).\n", ret);
 		goto unregister_dev;
 	}
+	kref_get(&v4l2->ref);
+	kref_get(&dev->ref);
 
 	/* Allocate and fill vbi video_device struct */
 	if (em28xx_vbi_supported(dev) == 1) {
@@ -2999,6 +3026,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 				"unable to register vbi device\n");
 			goto unregister_dev;
 		}
+		kref_get(&v4l2->ref);
+		kref_get(&dev->ref);
 	}
 
 	if (em28xx_boards[dev->model].radio.type == EM28XX_RADIO) {
@@ -3012,6 +3041,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 				"can't register radio device\n");
 			goto unregister_dev;
 		}
+		kref_get(&v4l2->ref);
+		kref_get(&dev->ref);
 		dev_info(&dev->intf->dev,
 			 "Registered radio device as %s\n",
 			 video_device_node_name(&v4l2->radio_dev));
-- 
2.54.0


