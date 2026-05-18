Return-Path: <linux-media+bounces-61877-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pbvPN9+oCmra5QQAu9opvQ
	(envelope-from <linux-media+bounces-61877-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 07:51:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FBF56674A
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 07:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 430F5306A36D
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 05:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FEA3DB99C;
	Mon, 18 May 2026 05:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9QNAxsT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858B03890F0
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 05:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779083201; cv=none; b=jn97oe+TEZkr0XAbfQA/5ZcjumB0J1wrzUFbAW5NviJxZmF8aLM3PW7fpqAHMT+h1Tlk89Pg/1wyuhc+jt+ghHsDGtBOrNEFPy9Me8OMnL/yYnZZjxRdmpyw6ep8+DopORwurnj172LDf3+kZdNh7mMp+J83uMpq5K1do+2SNrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779083201; c=relaxed/simple;
	bh=nzlZAviRkiUVtqGLGxPY21P8av4JBOU+eehvWsyKAQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=miAjT3kx63bcJD3bmqRiSFV76g1RMxmZSRtuOtXuLVm5e/wxFx1G1/+Rn1bkwNFbQt0N5ewLw0D1vhWK8bMjgOSEAoNPz4Jenag5hmMW5qtW9ZfkftwxiHkZvBsSRMq6LHPO5ftQQmKI69g/ABBSxoFuhQRmjwoiAnjjC+cuUQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9QNAxsT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso789942b3a.0
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 22:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779083188; x=1779687988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b69/f1IaWhKRvn/Sm6atJ8FHYkT6bLRfEDI5V7g2TEc=;
        b=P9QNAxsTYoCrtJAqRipyQ/5O6RJfofqhViHXq7vMDk11nwfZiTTDlY2nZl9FOvULac
         EWK5RUD7xvMsLBNqY0BjihuUsu4DSoOyE2Zx+KcXs6G2aaPcMQjE+XEC/exK0C8jRR7i
         YAbi+JF9HDvGtoqQYNKeWxrvbinVUItTJJ9ztQGcOiqGmlUTn1V5PyC2IpxIsnvnPEK7
         Mgda3Z0/wF+0rP4xAKF8GrUk4YW+WMUGJZTou4L1DJVCugK76sBul2Zz07qlVBl5Jab7
         vihEGXe1Z0DAMMKN9IrFgwal/ixkskv0rl6BYgOcQjOM8CkTJoz8ZhWaDv1B2O2NIU4s
         2ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779083188; x=1779687988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b69/f1IaWhKRvn/Sm6atJ8FHYkT6bLRfEDI5V7g2TEc=;
        b=FDCD4dLwnIKYN3KbD2ONs1wsJVLfFXCCwaQQDFW6LWiopkUpMl0oV4zoewq0pTpemC
         qA76yAhQWF9KqdYhGyh5E1HOe0pdJ2miJrU0vM3h4CUoDtbFPtdvO39UY+XaVUBx+/Hv
         Wl9pp/lrJCbYSz10hsVgpLIqUzjEgsLnSsXXjhhrO0ogmIyHYgtc9GIaQcl4Fowm5Tio
         I5tsddeldlTJSqdRn9jAeCe1v/tU3tfalQ1MKBGHCSGx4GNvNpqCbohYQ/+lHW3mFeJZ
         BMhV39CUB6J8DkG7BVUbEz/BkVLYmVd8UcLoME5DzZUflUU5uLOUgGuBIGIt2/QR66Hl
         /gqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/y5UAxVoSdKptQQS4cIiAHflOl/OAHveDLgDO5CXO33d2dC/fAAavX4vhyF/py5u6URyNPqb4281+Z1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfXQEnFAUYmQv9eKSCLL3TIo3QEI8nTKzEy2qBa670J8XTj+NB
	WVATkRPXVsbalHwxEGKbjdogOgZzp183yoHC+V/avlV4YiAl6bP2tujm
X-Gm-Gg: Acq92OGoGV5PgeaJnVUudYjmUdpi6Brcdtmbpq8p9u3d/8qLRe5GJGec3YUJbgwup9S
	Elwl9ezceAEmB93IJuaR6xgoZGzwiq/Jw7tLTWudCg2K6CmiiNBx7RQW5ddWEWv7mJu9QVTMcWV
	/eOyoNUIF3gc7YagK2pSjZy+VQO+Tq2iI1UqT/I0QaYJ28OLymd3+VJIXAzND3gd7f3ymruUxxn
	+n1RZLTvlirnJHYSVkz23Wtmq89ya2jj0jbQx6go3p6h7ni95Ix5D7K/O8F77NrpFH7HY4f8EhM
	9NuTHgLmqgdvHsoY8e7Uc/HioIpvfTCzCANMrLPhoiCVij84nf/5m+EUK0hKg1SA6pMAdFld61v
	yCCPHOkJJ/+z7tWspY2ZLGcQIjR27OoTGNP+BbJASPJ2vAhbJYQ9sll0L178vlaSzx9597Pdfyd
	/j3Ia8HqqfBovrDe8i
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr14563893b3a.16.1779083187983;
        Sun, 17 May 2026 22:46:27 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c020sm13344918b3a.30.2026.05.17.22.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:46:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: meson: vdec: avoid double free on video register failure
Date: Mon, 18 May 2026 13:43:18 +0800
Message-ID: <20260518054318.979147-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 48FBF56674A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61877-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

vdec_probe() allocates a video_device with video_device_alloc() and
releases it from the err_vdev_release error path if
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

  vdec_probe()
    -> err_vdev_release
       -> video_device_release(vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vdev through vdev->release().
vdec_probe() then releases vdev exactly once from err_vdev_release.
Restore video_device_release() after successful registration so the
registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..2994e46cbc25 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1074,7 +1074,7 @@ static int vdec_probe(struct platform_device *pdev)
 	mutex_init(&core->lock);
 
 	strscpy(vdev->name, "meson-video-decoder", sizeof(vdev->name));
-	vdev->release = video_device_release;
+	vdev->release = video_device_release_empty;
 	vdev->fops = &vdec_fops;
 	vdev->ioctl_ops = &vdec_ioctl_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
@@ -1089,6 +1089,7 @@ static int vdec_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed registering video device\n");
 		goto err_vdev_release;
 	}
+	vdev->release = video_device_release;
 
 	return 0;
 
-- 
2.43.0


