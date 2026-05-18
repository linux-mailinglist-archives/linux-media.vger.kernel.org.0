Return-Path: <linux-media+bounces-61992-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHtiIOENC2pN/gQAu9opvQ
	(envelope-from <linux-media+bounces-61992-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:02:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E883956D3BD
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECA52304FA09
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457D34534B4;
	Mon, 18 May 2026 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFJ/7HbY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCA03F20F4
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108924; cv=none; b=lB08jxzG4kgrQ8iT8yrfZJWzPxMQvegSVqYHPz9rsbMA0tMAEXVMPP2QN1i3qvZFh1mFounfjzfmwec/I/sFORNie+8zQE0DzgE8rP9daL6RSOXjV5V5HYQoWGPNMDCn3tgnfCe8IaPxgfYO36ed16JLYMwfTKrm0rmZ8TqOFkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108924; c=relaxed/simple;
	bh=gFASDxJ4/WjR7l318RrP5WCrBl8iTVJR0z4COTYE0w8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ceAtIbQDQ9x6GQdroMNvKHzIV5CahtBdq8ENmu7NfbAdw9vNXot0UDh4Xs4rKCT8H/4jNkdfKZbTK5uBj2OOg+AZllxNfhuP3rkFD79nJZrEr8KjiWaYaU8b7OQSQ/n4GEEDkVUwlWak3kuGQObfFfYVfOSKNJdqCuVGK3GGtEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFJ/7HbY; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so2110675a91.3
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779108923; x=1779713723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1eFHqTiE371KCrLlYGgbVFRxRtaxnf3rFpulm5ChXcQ=;
        b=tFJ/7HbYdHkXL2EmUDL96qbo+wBykYiODpxFRZOryinGJMUuvDWtzatIXCaGH4iiVO
         3RO8SMvqEUVstT1BvPceqK11faw5iuN+/J9Ewpz38N1+U9MhZYIxtLOnwfqrk0ErPkRn
         lTVj+kPri5pQrshgncCP+363opjrWrBFfvyvow9dCjCYZ6Kvjpxn8qnGC1apHGNo0/0P
         lTAPX8UQfU5XuIX8yAXwXco5PEv/ak63PghRhoBc/pm+CzHkP4SHlD8AuNeH3MRgR4gp
         3N15LISvmpwniY/HaVXZFvz+qgt0TcqYL8sGQkauSaQHpPXxKPaQ/F4GlmAGk2F4ttUO
         g+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108923; x=1779713723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eFHqTiE371KCrLlYGgbVFRxRtaxnf3rFpulm5ChXcQ=;
        b=AcGlqnp5WcsmA4Gc2RL6IbktCZj+pHsIQHVs4HVIM7HcV7z0q2uf8OA37RMFMjtqSr
         mgQFblQi20uo8g+RCMFSjZqO5C6tPTCbl/UfwgcxNSBq5csWNX5h0W6UEHUTyk6smBlg
         mv8F45NiP1lX5WM7M7XAG4tBUeOJYG/xQ9u/86qhn2razLmaLoLrNluG4L5TkE0gIXF3
         UaUsFpohtnf3ROb/WgMwdUaVX5ac9HtOOhS6r0rI1T5pahc2g+CPxNB7+yVG4PTiLdMT
         V+R9QTPkpzFoTRdzPvg1op/EYMfoR+WcuJu39aGDIIZ+7k6MJMz6tydmnAQEOvASYOAU
         gsaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zFBEAtUO+vbiFuVLvXfUpHfBiG0LXdH/8lZF7KkZpHgU2RCrLy2r1yqUGKLTLTeN8HWpmDzvRymLswg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1N4+DltxptnmbbMINIfJHL/rP32AYXdDGIIMOnNJ1N0aIRNZ
	6Kqps46/Szi8c4I+1q8/Ie39GxKOxxfDoQbwCs2n063TI9+p29YEVVS0
X-Gm-Gg: Acq92OHlfkQ4OZgtyYdzQhuBlqxvmf5IrrRPXQP2vKB/valc/e6EJHy1T9suxNFkURi
	6AfWotLAO5+nVTvvhb074lSmWFNGfWwYwfEf50RSSJRfkHKIwUtCecgbA1USRFBZHRtt3T7rUDg
	4PEXLqKGynRW5jUoWsnZSxY+qx+FSemN9t7QY4e64vYqLye9+HI8s2cjX6378viurumt9XyJt7f
	54W0ETHUmGKwtuG7p4VYH9ycD9mGG0iwQ1LwkZSuNFS0H3rov9fgrE/fNEtrwBKjHhzHOm1fSM5
	0t2nDVnkqWQ2VHcJ7qpyJFWmIn2Ge6oC6srpwYW2EFNd/W85OsgE0j0ooGEIZezeNKVFhupLTRu
	n6B0lrnD7phHBbjX3hGqL5vhsD7LN/DuX4pTY5i+K8rVmx8HZMKtvIf7Of2mcDgKF9X/tjkquCB
	7HN7mBUq5zU6Je
X-Received: by 2002:a17:90b:5290:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-36951a044b5mr14533669a91.7.1779108922965;
        Mon, 18 May 2026 05:55:22 -0700 (PDT)
Received: from lgs.. ([101.36.111.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11cbdesm150135295ad.71.2026.05.18.05.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:55:22 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: mediatek: mdp: avoid double free on video register failure
Date: Mon, 18 May 2026 20:55:00 +0800
Message-ID: <20260518125500.1000083-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E883956D3BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61992-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,cisco.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

mtk_mdp_register_m2m_device() allocates a video_device with
video_device_alloc() and releases it from the err_m2m_init error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  mtk_mdp_register_m2m_device()
    -> err_m2m_init
       -> video_device_release(mdp->vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free mdp->vdev through vdev->release().
mtk_mdp_register_m2m_device() then releases mdp->vdev exactly once from
err_m2m_init. Restore video_device_release() after successful registration
so the registered device keeps its normal lifetime handling.

Clear mdp->vdev after releasing it on failure to avoid leaving a stale
pointer behind.

This issue was found by a static analysis tool I am developing.

Fixes: 7febb418a32a ("[media] mtk-mdp: allocate video_device dynamically")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index d2813890cceb..5cc80a542eda 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -1185,7 +1185,7 @@ int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
 	mdp->vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 	mdp->vdev->fops = &mtk_mdp_m2m_fops;
 	mdp->vdev->ioctl_ops = &mtk_mdp_m2m_ioctl_ops;
-	mdp->vdev->release = video_device_release;
+	mdp->vdev->release = video_device_release_empty;
 	mdp->vdev->lock = &mdp->lock;
 	mdp->vdev->vfl_dir = VFL_DIR_M2M;
 	mdp->vdev->v4l2_dev = &mdp->v4l2_dev;
@@ -1205,6 +1205,7 @@ int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
 		dev_err(dev, "failed to register video device\n");
 		goto err_vdev_register;
 	}
+	mdp->vdev->release = video_device_release;
 
 	v4l2_info(&mdp->v4l2_dev, "driver registered as /dev/video%d",
 		  mdp->vdev->num);
@@ -1213,7 +1214,8 @@ int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
 err_vdev_register:
 	v4l2_m2m_release(mdp->m2m_dev);
 err_m2m_init:
-	video_device_release(mdp->vdev);
+	video_device_release(mdp->vdev)
+	mdp->vdev = NULL;
 err_video_alloc:
 
 	return ret;
-- 
2.43.0


