Return-Path: <linux-media+bounces-61928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNpxOpHnCmoE9QQAu9opvQ
	(envelope-from <linux-media+bounces-61928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:18:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 574B956A8E2
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6847A301C6D2
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D706C34104B;
	Mon, 18 May 2026 10:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3LdmwwE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8AE31A7EA
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099528; cv=none; b=pdTxPEc7dDaG6NHKrxLReCCcOpwEfV+zFHMKZ3nqdw6xkFEcEKNE1OOUYnPt5+FsvWi1E01Bo3sVGVIUP6ch0iE6NScymS9OuxdWdY08ThPQG6mX1acDF35FeBhJGr3aNHtHUKOTu7rLhqiwWi9jR1Ojs6efLmvKawurA8zJnxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099528; c=relaxed/simple;
	bh=ewm1kbv1+N3Kat0ubmv2J5bMALXxYISRWam1ypvHch0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vD+TX0ToxibDXIrgZIfY4xNNIJGq1pL0eLMDmUH4OKyd58cG28osX/VVc6tuNhPCY17CCeMJEPcYkoac36vgdn9UAUzWPmKSxbIuzOApW/zUbauddJflDEVrViJMkh2wvBnHZpizvw13eYBElCqFvkGkUX0Trf1xrVsXCBBRePI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3LdmwwE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bc85eda6b6so9100245ad.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779099526; x=1779704326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYuvKfaVNXKjK+yXrIC0/A95KOQQQb/+OdhM2DmllfM=;
        b=U3LdmwwErEvJcL+uUvueUgi8TdHgMNn7S7WJ9z31ktQpDeglxF4F8TrOd9Fj0M/aAc
         gJk7kXRvh3Cn8ynM9bBYN8g5DqRm+RN8SZVoUlTZ/L2Z99nwhqil2jkmMcaKFRBSvi8l
         Pr0wtTgF62sEaC7CsmR+uOZK6GR28kXHvvQsGkURL4exs9trxHgdMgg8NgYpTggaWT/j
         HMAUXlZtuiR5K0akuj1DxwXiNaCTllx+eGmpDLrr6ojoA8ABL3wz/F5wqb7CT6eEHcEZ
         Ppy0cUV4DXbejr0naww11Kss8JTKWHpvDvzs+1Ky9/Jxe7WK44MBJ7e42IGohtci9ee6
         /idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099526; x=1779704326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYuvKfaVNXKjK+yXrIC0/A95KOQQQb/+OdhM2DmllfM=;
        b=HFzeqqRx3vVmKPEdF3e3xEYv3sJyvttKOduBIXQHGFkJQPeDc8EEz6q4ViBvhGvFE2
         DqLKpA1gRQjBK8nZCnEsYw/dUi4FKNqE0gyKOhiyRUrRReKN2HiHSYT/fxfiTaTLmqFE
         kEnFDPcd01JMDuLTl5AaM2A/8QC6UOXeAH7303J3l5p7O6YZ6DmumG74CHoq8Ye34yUE
         uMaJDrYt3rxKDsG66wXAUhuRyVjZMCIo//SjgFAday/dlGQFStGYZyXC/oHFvLWDlLYC
         IBJEx7Z9U8quG6FqmQB+Wzl2gs2FBWo7i2mvXRR28FNYV3ln95NOJbpbF8RWAFz0ti66
         +WVw==
X-Forwarded-Encrypted: i=1; AFNElJ8S/Br7K0ivlXX+Pia96AKw5bH7qW5+JPSz5ECFqvN9MLA95dag6ebeAxZaEKoUYjGVJcGG6yZIBAQGBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDQr/zx0xu71L0i8Prr6z6L9SiaPQHfa9hGA0LdEqhfEXV1ZHA
	lGnjWBFuwSgO4qGBHpUEVHqK2LIxdWeboYgGI0oZIfzu0yN4a8BSmpst
X-Gm-Gg: Acq92OG23ADFehGS6fpywfEbtEevnDez6/QWzT985sOtqhl03R4jEGvWWvZoywv+GIM
	Tsu/mq/7MyR1K5HwTVzKK0yRJ0/vEXbt9Fv/ZaP1kt4xhiynhVdLMh+ny78BYCnNHXzij0tVSWX
	WV4CJV0io1xB7PTMFFu2UbsIcXS7x01c/yOWy3XmX7nFldTGfgwRGYUhczBFwkNXBeNMJ4dhkCG
	Tk4zYRRmvfAc8N3qXgmD7OCM24nnRif1yzrAkNKACtDd6RcBWhES3TdQ9KIfzn8Ajzk4tXkuaJH
	YxEg/0tC40jexf0UMsw24iepJSCjN8dBRGehqpNsIku2GUPAYru7K44kRsqUI7TP2hL7+Pw0537
	csGgWQC1wBFDxJBqRiC8f6McMNsXYEahbN1wZ5y/irLIuhuYIT3TWG8U440guCLUsDWG3V04DAn
	qKhBtvS2OrszW5Bz/JGZuFcfvn/oitqagbUQ==
X-Received: by 2002:a17:903:984:b0:2b0:6e4a:32d0 with SMTP id d9443c01a7336-2bd7e97951dmr161511895ad.35.1779099526312;
        Mon, 18 May 2026 03:18:46 -0700 (PDT)
Received: from lgs.. ([152.32.251.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm153584155ad.82.2026.05.18.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:18:45 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: tw686x: avoid double free on video register failure
Date: Mon, 18 May 2026 18:17:09 +0800
Message-ID: <20260518101709.984270-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 574B956A8E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61928-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[vanguardiasur.com.ar,kernel.org,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

tw686x_video_init() allocates a video_device with video_device_alloc()
and releases it if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  tw686x_video_init()
    -> video_device_release(vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vdev through vdev->release().
tw686x_video_init() then releases vdev exactly once on failure. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

Clear vc->device after releasing the failed video_device, since the
common error path tears down already initialized channels.

This issue was found by a static analysis tool I am developing.

Fixes: e0b212ec9d81 ("media: tw686x: Fix memory leak in tw686x_video_init")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/pci/tw686x/tw686x-video.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 785dd797d921..7d121dba4f79 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -1266,7 +1266,7 @@ int tw686x_video_init(struct tw686x_dev *dev)
 		snprintf(vdev->name, sizeof(vdev->name), "%s video", dev->name);
 		vdev->fops = &tw686x_video_fops;
 		vdev->ioctl_ops = &tw686x_video_ioctl_ops;
-		vdev->release = video_device_release;
+		vdev->release = video_device_release_empty;
 		vdev->v4l2_dev = &dev->v4l2_dev;
 		vdev->queue = &vc->vidq;
 		vdev->tvnorms = V4L2_STD_525_60 | V4L2_STD_625_50;
@@ -1281,8 +1281,11 @@ int tw686x_video_init(struct tw686x_dev *dev)
 		err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 		if (err < 0) {
 			video_device_release(vdev);
+			vc->device = NULL;
 			goto error;
 		}
+
+		vdev->release = video_device_release;
 		vc->num = vdev->num;
 	}
 
-- 
2.43.0


