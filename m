Return-Path: <linux-media+bounces-47732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0BCC88470
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 07:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F0674351455
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 06:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA503164A9;
	Wed, 26 Nov 2025 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="JTppPQB+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CE230E856
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764138625; cv=none; b=QI59puZluGLmPMF12JiX3Nn3kuNllY2S3G4AZjnG2sPY+D2ZcEz8PSCspahm8ZjC2OhtEJKX7AzTxeoG+AkuFWtCQ61aSNdHFmppAd1tBW1dlVpLsAc6vX5JUYUyDSdO8hx8IXu0RO7IpmbDrcjXOfXbOQE879zZOzF3KT4UZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764138625; c=relaxed/simple;
	bh=U6bQmkUxd70UqE5e2zL7MVt9+dVE77Ehtb/US7OhAYg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mfI3ijIXrJ2XWr7F2KXPLSR5IyLkEFFqA3xEWpwSavMjVKCYEgpWTFTWzo6/iO6a6azfJOrsxggW5xXo9VOUUJ/5vYynMHqAWBzsRWTpBP0GnYwdoN2EtfndFa3Xv49lXzqYKMt/DSlKm9ANCzwME0ZPIyqqDFgnceN09k17Rhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=JTppPQB+; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-3418ad69672so4033756a91.3
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 22:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764138623; x=1764743423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IzRkGTCq3jZ+jOaGIzMctMlQ71AdgQEN3oB90COYnDU=;
        b=JTppPQB+1X7vktBDdv7BdsW1wouObmrt/ltyeVaeRbKpWb3ZCwWd5q2uyYPqOd8c5K
         ifMXX0zEowWEmm2U9WHPPCNRWmcmaS5E/zqAgO4VHK6tlAnMSL/fAAzqsFT8OqL3rsJv
         c1L+uKfD8ZH0G0M91dfM71ILEnzxLK4mDk8MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764138623; x=1764743423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzRkGTCq3jZ+jOaGIzMctMlQ71AdgQEN3oB90COYnDU=;
        b=khDRNy4ggaNQ5NJ9CI2tMmD5RWQzW8v6b5bNC68WYTlrrmMbhE44n6uuhQvQjM6qR8
         Gto4kRd7SAS9nJ6tLCbsesb3Rraf8KU0QyiQqGxKdgk0nu0S6ByogdFUq7K1Kdu4hew5
         iCGaHKp8kVnXiCOirUxtx0fzr6De7w/a5aSIi5hvq6Hw+BBkii6JwBCXC2gTY34vrdK3
         1/3jNicsRXu4BxN9dYeZ1Hv6vDGxSVne92bgRDzTSnXyb/ez3AxtWo2Vs3xRQ9Dv6p5s
         WsRARfYKAdShBe30NK2b/x75KIWdiXuf68THXyym0x1C5gG+2wVg8e7QTnyz5jC3Nive
         d7JA==
X-Gm-Message-State: AOJu0Yxcf50cGjJNz+MvsczRZBdF0e9m+XQuCq31Vjttt9Xo5yIyzFZo
	Y3KO7JNN9swNNjg5ynEQEmJ912F0hnfB8aKKzaIrr94L/nZZkYtNUjKJdYStf93wWw8=
X-Gm-Gg: ASbGncsLrhWhJypkaSkcKWDDLXyBC5Wr85SebKtE7bmlDsywh9GVi9ktp+PkUbAX7+g
	Cl3z0XIM1VldR2Tt72jfATOImSuWPoNZPMI/SXC5gJ5d7tqzlbCKgB9AjE5632UGZDZHB1e5uFD
	1LTtz16/Dg0/oImUVNFNd0rP27MeteN88x+OyAiYIoATMqIeS3olBpZdJ/C1iGLjm810aou9npY
	RG4t/PPJkf+JDNsc0VI6Z5HTNxEdyJXRf83Flk71raHcAKoV/SlY4Ho+wvsJMC7K8ABFI4Yz54h
	fU0Xk2RmXBGvQw/JQXnXGiNYokXblLMHvU7zpr1Bw2BP93D/gVH1A194AoryVlnXaeaXex3DLCw
	IH5RFBJsbfxWB41IsHPI+0yojF6HfMXGyzpkDVEBWCoyJL5USnw7QpiJZHR820+A5QVMOfDQx/n
	PYi4e1dFXFOY0ubGD3PQdccrcsg3ttp5N2nFyjlIgoR9KZ3oOuxKN6+uoC
X-Google-Smtp-Source: AGHT+IEuaHOrzBEFxv16/3EUkSrMUsaXs6T/9SLzDvNZQkcQxKIdKmZkZuFocPDxwf8ehClgPQYvyQ==
X-Received: by 2002:a17:90b:4b8c:b0:340:d578:f2a2 with SMTP id 98e67ed59e1d1-34733e4cb74mr19340413a91.6.1764138622659;
        Tue, 25 Nov 2025 22:30:22 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d869:7ab4:fdd5:842b:6bfe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63dbcsm20088553b3a.50.2025.11.25.22.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 22:30:22 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Subject: [PATCH v2] media: radio-keene: fix memory leak in error path
Date: Wed, 26 Nov 2025 12:00:00 +0530
Message-Id: <20251126063000.28493-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Fix a memory leak in usb_keene_probe() when v4l2_device_register()
fails. The v4l2 control handler was initialized and controls were
added, but if v4l2_device_register() failed, the handler was never
freed, leaking the allocated memory for the handler buckets and
control structures.

Consolidate the error handling by adding an err_hdl label that
ensures v4l2_ctrl_handler_free() is called for all error paths
after the handler is initialized.

Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
Fixes: 1bf20c3a0c61 ("[media] radio-keene: add a driver for the Keene FM Transmitter")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
v2:
  - Simplified fix: call v4l2_ctrl_handler_free() inline before goto
    instead of adding a new error label, avoiding unused label warning
    reported by Media CI.
---
 drivers/media/radio/radio-keene.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/radio/radio-keene.c b/drivers/media/radio/radio-keene.c
index f3b57f0cb1ec..4a203e958a4f 100644
--- a/drivers/media/radio/radio-keene.c
+++ b/drivers/media/radio/radio-keene.c
@@ -344,6 +344,7 @@ static int usb_keene_probe(struct usb_interface *intf,
 	retval = v4l2_device_register(&intf->dev, &radio->v4l2_dev);
 	if (retval < 0) {
 		dev_err(&intf->dev, "couldn't register v4l2_device\n");
+		v4l2_ctrl_handler_free(hdl);
 		goto err_v4l2;
 	}
 
-- 
2.34.1


