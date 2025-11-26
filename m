Return-Path: <linux-media+bounces-47781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B24C8B854
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 20:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69F684E123F
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 19:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D003126BC;
	Wed, 26 Nov 2025 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="TXG6QltB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BE233A033
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 19:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764183868; cv=none; b=WzMoXuG2RYOn59zBwtzt9/c9GcTCbIg1Cj3YiOoVN1kpi3RcAcEq+ZUzYD2QDB+R2ioggrHDIT/LprdZlMEOhJKDUQxgauuCnOPOHtegX9v4FQbA93CuYwQxgo2stOTuO9l4cHQ/H+hki3NYYgO2TCqzMVlulJQbRD59Ls7TVPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764183868; c=relaxed/simple;
	bh=TZD2Ey6Z8WvlpW2dfjWUC5ho1c+Z3cypZpbXGhlo5HQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hH98GpSEdEVc8hJ5fVXOpeEpfw4OKFcFe7t9egVae2rpb1gEQ0Vo3O6JQuL5dUmkzYuBkMqepzbHR5VP9/3QSVW128qh8eJxmhdkUbQAVwS8YF+se+DedethBLGaZQaAePsow75du3QDM5lE2TSFWbjC4dLQFyZE16HLRiRh29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=TXG6QltB; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7b9387df58cso64046b3a.3
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 11:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764183865; x=1764788665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=04+GJw/QeAhZXEl0aXKPi//aV7HxxJ1aVYtljym3uF0=;
        b=TXG6QltBQThwMSyXaeR3cKbGaPaPxcxaIQ9vV5gPV9aLv3gDlJ5LE616qZoBsGwtN1
         gHf6jy2fUy3Y9WkGTRPu9wCC1ZmmrVFppBaTZ+lU4cg4yygkjoevMoWGI+N0+VOTpOt/
         E5ZfHTi5hj3Pl73tQ6e/ViMZ9dypWq33o5pdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764183865; x=1764788665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04+GJw/QeAhZXEl0aXKPi//aV7HxxJ1aVYtljym3uF0=;
        b=psOY+ZtQ1oTnNZ09wVTc3nnFGNFH3TbLR3cm32/W6un+gtvVeyN9n2gQbsCpK9P3Uh
         OxlLa4Cf17fvFC6LSDw/OEYABMAfWoG7zjQYd0iydjtudtYs/u+nbXWyqF9kb/YeCIGF
         Q2BXb6YEntpRwcxynPR1MqZeYY+4wtmMQUqV0M9DPeK3wDUZ0eeCgcH5LCAbFimfBSc1
         m6YgUqdnFxIaVnhJynVgqBukpH3etC7i3sjgJzJGOivVQM5wjFFMj0BrtDqsFqwSwLsb
         FtMiOZ2gU1pC3mJhlVxIA0xoAGUMiuxys6BHCf57IreVpGVlo65GSqWp3qKjaB7ygvPr
         dz3g==
X-Forwarded-Encrypted: i=1; AJvYcCWGsLobIGh8FeZ5beR6O8kUcO4ZQ2dOM7tNF9JGZR7PFYJyupHyztFDc95ibRiOKGIjTOKc5LCBFf8mcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfR/KW84ry8iNeqKofTvpRxiws9PUNFtKrG6KGVXx3ste+qIDr
	YeTtXWCxaWS3fc6QCYabAC7ORCZ22dgLBOdbN2S5CESpKkeMhvKKJ3MAMUpWVW2g+bU=
X-Gm-Gg: ASbGncudK4BkmdsK/o8uqyWPIBnwLZSygUtAoRj1xnTQq3LFy3qTHLlKD93i+JnNT1C
	404dxAPZ6PQxrq4V7ZERGIPVQnhO2xL+g2DQMP/OV2ZDbSzVU7dPJg8rXpCgmTMcXC33AXa3PkS
	DIlRoo72AHF4uPE7YkAnVpwI9qcMRdWsmudB93VcINPWt2RDqbR5WPAV4fr2yV33Fxwlv3AYeQc
	ZaBMZz5Pxrgrh6TMxng4GAf17rn90Jqa0PIf2U/TgMQx7q0BjUkR3MZTZQn38X9PvuvDCVUUitX
	yVRiB91hamWKlUhZRSNVlvyHlajPlJNS6286yUEDpVIxYkFcjIApDqpKWkwQ+rWDnHazH5zfaZQ
	DnVgBgo3BgMNe0g8jy2SzCHJ6ZCqyFeZhsdUKUNiUrOypjrHHEfRtJYbKSYVQh/vnqfgev+0mcX
	JTKPdpokQTro4MIdB98LCaUCMptAjQuq6iQE7Ubs+xNKYD4vvg9ImhEzE6foveGzwdeNLhvw==
X-Google-Smtp-Source: AGHT+IFm+MfJvs/Wf+g788FjoV56T+TV2tLXBCMUGkU9nJcP6d6Kcmdlz0QOSTBOZdqGTzkoz5n/2A==
X-Received: by 2002:a05:6a00:3a0b:b0:7b8:7c1a:7f68 with SMTP id d2e1a72fcca58-7ca8a1392b4mr8897925b3a.32.1764183865271;
        Wed, 26 Nov 2025 11:04:25 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2409:40c0:20:6a17:674c:cac:c69:59f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471f80sm22541529b3a.24.2025.11.26.11.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 11:04:24 -0800 (PST)
From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Subject: [PATCH v3] media: radio-keene: fix memory leak in error path
Date: Thu, 27 Nov 2025 00:34:10 +0530
Message-Id: <20251126190410.94933-1-ssrane_b23@ee.vjti.ac.in>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a memory leak in usb_keene_probe(). The v4l2 control handler is
initialized and controls are added, but if v4l2_device_register() or
video_register_device() fails afterward, the handler was never freed,
leaking memory.

Add v4l2_ctrl_handler_free() call in the err_v4l2 error path to ensure
the control handler is properly freed for all error paths after it is
initialized.

Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
Fixes: 1bf20c3a0c61 ("[media] radio-keene: add a driver for the Keene FM Transmitter")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
v3:
  - Put v4l2_ctrl_handler_free() in err_v4l2 label
    covering all error paths with a single call.
v2:
  - Simplified fix: call v4l2_ctrl_handler_free() inline before goto
    instead of adding a new error label.
---
 drivers/media/radio/radio-keene.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-keene.c b/drivers/media/radio/radio-keene.c
index f3b57f0cb1ec..c133305fd019 100644
--- a/drivers/media/radio/radio-keene.c
+++ b/drivers/media/radio/radio-keene.c
@@ -338,7 +338,6 @@ static int usb_keene_probe(struct usb_interface *intf,
 	if (hdl->error) {
 		retval = hdl->error;
 
-		v4l2_ctrl_handler_free(hdl);
 		goto err_v4l2;
 	}
 	retval = v4l2_device_register(&intf->dev, &radio->v4l2_dev);
@@ -384,6 +383,7 @@ static int usb_keene_probe(struct usb_interface *intf,
 err_vdev:
 	v4l2_device_unregister(&radio->v4l2_dev);
 err_v4l2:
+	v4l2_ctrl_handler_free(&radio->hdl);
 	kfree(radio->buffer);
 	kfree(radio);
 err:
-- 
2.34.1


