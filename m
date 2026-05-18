Return-Path: <linux-media+bounces-61996-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKZyNDMRC2pN/gQAu9opvQ
	(envelope-from <linux-media+bounces-61996-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:16:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4270E56D774
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54B9C30720E1
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9879F48095A;
	Mon, 18 May 2026 13:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRLZxD+I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9D83EF0B3
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109784; cv=none; b=qzf9ETLZOG49IiLuI0BB9cWV8NpiB8EVQLG4CqdEGcXkNV5/jZOukprYUE9mgv4hWyMa6tZs4qxTWysKR0EdNbGC1l3vOS8qUmESBixLSyT4Ysg6JI/nZM8b3QHKj86zK9SJL9DwTrXXkYH/QFC7v6rfpXsHIwFFz5a4WJb9QR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109784; c=relaxed/simple;
	bh=NfclscNBSnSTPaF1Uyz6avlOxZwSfStDxpuf2uV4hL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOJG6uC8UeQvFDnk2A78r5xJWsKNfiiYT8EQel1UzlNhtrLCPT4JV+has1yjY2MiEJn5BcJF8cvEhZootn44wuzAw+kSCYWlT500sM20HafcGQ20kv1oJScXAp1sCMwg0JcLlt92fk4thOBDHTKM7olJaVrWLJbVZ998UpyKjlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRLZxD+I; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-366330b6751so1836241a91.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779109783; x=1779714583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAloUi+mRjxqQ41OzwWcNwZlapgA44SFMZ3iPQ72NV8=;
        b=NRLZxD+I4JD4SV0Hfk8nKzyUMuY0BowWSfQwXcURdo9uUZo/SBRMHplq/JUP41WiEv
         uw/Z1mDVcXuvLB82jtq398ClLB16omlp7RDhD0qMVkqsHT24mWhdcwHd8AO6hAfelfsd
         qEwfRcAxvb29NhZTpjPcEt9EflaRfStoQTDjE5labRLluY1BkA2k2ETxzmtZMzeZzvaq
         iZ3MvOtC2GGpXbV1/xqJakrFjS3ZaAmoPNZAOzm6KjNvdxbFwMGnr01TpALtMEYZZWr7
         QIKl/oiMWftcqbxgFA2K/0P5jeYgLLIx2Q0MLbYDJVb4Iilid10VXqYONAlyu8UM7j96
         GH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109783; x=1779714583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAloUi+mRjxqQ41OzwWcNwZlapgA44SFMZ3iPQ72NV8=;
        b=RR5y8yavcRZsfDDLVK418d7bexZD9+U3wQ5OYklIlLM54fnglMNajUDxH5bQysep5w
         J22DBccjQ4LKhwOnOliLyLbJwtBQmJOqyqxgaCZsYoFoE0dHZyoeg/lDdTwx8LVEa4aP
         Wvu+ZOvJ/DqfYXNcwDb+NVGnLOVue6u8E41H9TlkavZ6n3i1QYj+ryCj8fiHVksrzxHa
         BHKaR3pXJ5/gF89PtOuW67WF5+6Kknu7AyjoU7Zla4ip4oWIqjpRgY2ZcF4XwDjjlxaP
         u36E2vJ2tFEaJEo1t4r2pT/6xSguEQg+PsG2qujKWjdBoLaSwhSSQ7l2yDhxCkyj5zOe
         HQIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ISy4xeZ27aiKnutKrYNTlRaUvF0Ku6gaYLBSvX854MIN+SmPtg8ZlLthcnlOI5SZrEdRvZ8fD0fcA+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxBOH0J56D+Dy6wRE//egPChL6Zb31kF/P07FXblmfG+ADQXZR
	aFE5h523x5V+0rFCpTUpQbOAl4Y7ZJRf+hxo65xE+hxu/8CfTEqfGy+m
X-Gm-Gg: Acq92OFxinFKjVAHvDTZ9jHR7jYI5umr29YTd4/6YFE5cxuDIj0BjFuwIyZqFA4DKTr
	tLA16LPD0aouLRjEx6f5zzDgs+sftL0YpcXIh0HHb3RdGxa6aFAjGoobl/4TpaMQ+rL0I1pbY4F
	utvA2c3f1W5OfsEKqiSfEXUTvWHremQH+C3E95VwfwVvpwFre7dR7Y9noajQbtdQ617LgMr1tm4
	BA9Z5u3hSlsc4RYpFRSWOOb4t+r05lGd50DgLi//c26Tul6DIvgN8CDJiBsylK1U4OGecE8HEYg
	tTFRYuHzG57XJV5GWc+W2FtZa2LDk20XN742XdsxAooEskdmaLyedm/bFxCjXbh1oFTL2Q7gLfe
	XeJh1GVLQwaPWvBALXxyLTXKlpJ6aznbIsRSxuide0xbdI21yjPCDl5bWh9B7rLm4K/iiPAlHeh
	W9yuVrXQsjl8IO04PbLxPE
X-Received: by 2002:a05:6300:218a:b0:39f:2dd0:65bf with SMTP id adf61e73a8af0-3b22ebe1bb6mr17937148637.28.1779109783131;
        Mon, 18 May 2026 06:09:43 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1966471dsm14863375b3a.6.2026.05.18.06.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:09:42 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Joonyoung Shim <jy0922.shim@samsung.com>,
	Kamil Debski <k.debski@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: s5p-mfc: avoid double free on video register failure
Date: Mon, 18 May 2026 21:09:29 +0800
Message-ID: <20260518130929.1003652-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4270E56D774
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61996-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

s5p_mfc_probe() allocates video_device instances for both the decoder
and encoder and releases them from the probe error paths if
video_register_device() fails.

This can double free a video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  s5p_mfc_probe()
    -> err_dec_reg or err_enc_reg
       -> video_device_release(vdev)

Use video_device_release_empty() while registering the decoder and encoder
video devices so that registration failure paths do not free them through
vdev->release(). s5p_mfc_probe() then releases each video_device exactly
once from its error path. Restore video_device_release() after successful
registration so the registered devices keep their normal lifetime
handling.

This issue was found by a static analysis tool I am developing.

Fixes: d0ce898c39bf ("[media] s5p-mfc: Replaced commas with semicolons")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 32eb402d439c..75abb0a8b7a9 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -1376,7 +1376,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 	}
 	vfd->fops	= &s5p_mfc_fops;
 	vfd->ioctl_ops	= get_dec_v4l2_ioctl_ops();
-	vfd->release	= video_device_release;
+	vfd->release	= video_device_release_empty;
 	vfd->lock	= &dev->mfc_mutex;
 	vfd->v4l2_dev	= &dev->v4l2_dev;
 	vfd->vfl_dir	= VFL_DIR_M2M;
@@ -1395,7 +1395,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 	}
 	vfd->fops	= &s5p_mfc_fops;
 	vfd->ioctl_ops	= get_enc_v4l2_ioctl_ops();
-	vfd->release	= video_device_release;
+	vfd->release	= video_device_release_empty;
 	vfd->lock	= &dev->mfc_mutex;
 	vfd->v4l2_dev	= &dev->v4l2_dev;
 	vfd->vfl_dir	= VFL_DIR_M2M;
@@ -1416,6 +1416,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto err_dec_reg;
 	}
+
+	dev->vfd_dec->release = video_device_release;
 	v4l2_info(&dev->v4l2_dev,
 		  "decoder registered as /dev/video%d\n", dev->vfd_dec->num);
 
@@ -1424,6 +1426,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto err_enc_reg;
 	}
+
+	dev->vfd_enc->release = video_device_release;
 	v4l2_info(&dev->v4l2_dev,
 		  "encoder registered as /dev/video%d\n", dev->vfd_enc->num);
 
-- 
2.43.0


