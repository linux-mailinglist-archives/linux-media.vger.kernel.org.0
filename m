Return-Path: <linux-media+bounces-26984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B350A44EB0
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 22:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 373343A6DA9
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 21:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C89820C476;
	Tue, 25 Feb 2025 21:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUdLM4gt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E1C1A8F95;
	Tue, 25 Feb 2025 21:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518441; cv=none; b=HMLO4KjPUGfLnckR189tQ7f2xu5TIb4BN2NIYGfLU7tBCf9RI2z9XZz8AFbhL42lSqkQXyzm9R5mNFRoqrgJg+XDLeX/n52CgA7cMXvHznDvweb1WoSn3NSye3aLeoDnZynnfjpP/u3vC/av/Y4O96mJYe1+PlN7gaeSPZZnLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518441; c=relaxed/simple;
	bh=cLqhDbrPYvWuIQ01P5u1Pg/JDTDb9OtRsIwc4NEfevQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DFhKuMLTz9COiVw+t9difU8KGy4vLFZBN4BFJAMOl/NmURt+lv/VSeLgQqLwRplbkMHeunv7zVDW4KXNsp38G/QPIcqHGNi1XcRibX7qzUFi4rhY9uRfjWlNH90S+GZ2xIBw1kS95DKENekA1cSL44kQr2g/sF8VmO1+0FLKFDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUdLM4gt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4397dff185fso53341655e9.2;
        Tue, 25 Feb 2025 13:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740518438; x=1741123238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETJS16OnTYl7vwlekxa+pFGq8xk1BazLklga/IsiBKI=;
        b=EUdLM4gt+vmC/Mc6km5yrKsf4YyI89d9aGOlFobYArMKmkwgm/H5IlvF+sgIP4XPzF
         pVxH63bmvHrlYi8VixD+s5WFSf/VoKakeis6KR7fYsDv3M5kDw0RC38beMzGIv0IT++d
         1zoTTlHchjGX9cnEZV3zksZmLNUHppmYgAm9/M2x46/xDaw7afPCI8FZR/ve9tj8+upJ
         zsakP/3WfRdqtUrdRGbYBkSMlcxgusMmPcjb7J02OjBjiCAn3MbieYYATF/OtnVVsZbk
         Q8U2NERJ2Y9BfUQ2fEyHnAcvj7pXKqpfTi98Inu+awMWu2HBXYXCnfp/O7fVw5KQJk2W
         4akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740518438; x=1741123238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETJS16OnTYl7vwlekxa+pFGq8xk1BazLklga/IsiBKI=;
        b=GpJQXAYmR2L3aRt6nmyc6MaLNHEg0tOE85eOm41fWggEeLp+7Wm37sok67tozfIFKd
         ee5sa6cLyJvrB7AfqUg563e1UbvwgEHaNFcXy9kAVrW33PNoYVovaB6BNHJy8RiP3pW+
         Nim0r8nyoYQxRSiYLMUzu1s7U0IErySJvNd9kpfGNzZX793uU4sUn+Q9iLEHgM3KTeZB
         DI/wLLll/+TjZwQ+nMo3pHh2K+5lpCgLnvjBwUs+MUOxL/h4CXwx+5oflypSI3mXW7dB
         UqMo5qqC2uMiObH2Ph3ojB7V7LQum39s9u9iX4XOqaH/fJFogJh114fNHiVGm2uqePZG
         0irA==
X-Forwarded-Encrypted: i=1; AJvYcCUGBQ+o+OTwqmSR16PUFN7y6Kovf0Pf3ppS/fKDMTAhsqqiUCdCHRtwHksEvtb5pe/hXrJ3GVUYuvbkPlw=@vger.kernel.org, AJvYcCW735bEbVYQ2H3bBj9iLyD0P7SljdaS0WJwZLxTDAGqP5THaipwjyNPzTUQ6QNLHOvjjExH6GDt1+Eqs3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCQ6ajRwiaMBLJ2h13TuNSC5rzS0K0Yj/knFj0XMJhwka4H7NI
	G5XogDWCzhqWau6TGcDT+t2W+2+Z+9Q/AHcV+mXWswuwd9ELGqvD
X-Gm-Gg: ASbGnctO6QiPz/kVzhxy/Z1s0f3gsmK4DEknSt5/nJC/iLa3tOfmFqeUOzn3hmR7ext
	5lfVpJGeNzBKlhj2WeLzKg7njGYAxgfV/aojvlPI6+DHqQjW1X3jKQqFK+/lb2cHCykE6qcpWeG
	BI6Uc/bkVif6+NSbCRVvtuemrux5plbsASWksLkWQvfEVieEQ4FpWzDyUHj2tBZwuVxfRtz1aeK
	q75fMZICzlBk0yp6sWBbOybrO3esRh0BOvScse1oyVMbGhPHKrxceFvP7YXQs9ARooJR615M6MQ
	ZHX/0o+zx6RGPI3bIHWNjucEHxUEhhIK7l9TJzU=
X-Google-Smtp-Source: AGHT+IGb4WNnMBJZw29M3uaY/4XEnbOyHtds/lEjO/1INAFbGy/YiqTYqtMMwMU9n7j05m1HLtMuMA==
X-Received: by 2002:a05:600c:4e8b:b0:439:6101:5440 with SMTP id 5b1f17b1804b1-43ab8fd875dmr7917395e9.8.1740518437510;
        Tue, 25 Feb 2025 13:20:37 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86cc26sm3605357f8f.30.2025.02.25.13.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 13:20:36 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH] media: platform: rpi1-cfe: fix pad in call to get_mbus_config()
Date: Tue, 25 Feb 2025 23:20:30 +0200
Message-ID: <20250225212031.188987-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The source subdevice might be using a source pad not equal to 0.

Use the already existing source_pad field of cfe.

Fixes: e7bad98c205d ("media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad")
Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 69a5f23e7954..7db4fe5e0fd4 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1206,8 +1206,8 @@ static int cfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cfg_reg_write(cfe, MIPICFG_INTE,
 		      MIPICFG_INT_CSI_DMA | MIPICFG_INT_PISP_FE);
 
-	ret = v4l2_subdev_call(cfe->source_sd, pad, get_mbus_config, 0,
-			       &mbus_config);
+	ret = v4l2_subdev_call(cfe->source_sd, pad, get_mbus_config,
+			       cfe->source_pad, &mbus_config);
 	if (ret < 0 && ret != -ENOIOCTLCMD) {
 		cfe_err(cfe, "g_mbus_config failed\n");
 		goto err_clear_inte;
-- 
2.48.1


