Return-Path: <linux-media+bounces-29379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AECF6A7B96C
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 11:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17800178547
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 09:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB631A2393;
	Fri,  4 Apr 2025 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx7pXNXy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC6D611E;
	Fri,  4 Apr 2025 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757238; cv=none; b=LcYL3+0RO0QevQFcu/VU1AnRYiZW1EencyKavAMlsu8eng7r4j1JOk0eInGC5z+9gO/UT+8Y5mXfNIXsNYBHx807FEe7HbSYnnuHFVc4P9mPq2FDMRQ5aVpmf0VTcsByDY9AxCQSKaSZbjdhEzVsU3UtR6n4HH02Jvh6O93f0Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757238; c=relaxed/simple;
	bh=dDw9nB3R5CrigY7byXXpDEVqVujq14h4RJcGIbk8Eyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVh7l0uvM2NIduAaWIE4dIhAr3ZNoBDTPelQUTlCBsoB4S12dUntuOI4hoMEYw0lJtGfNRRGMaRAfbckrz0k7INGbLupvxeqqdFKD7YVS5lYXiLXIl+3RAiqZAjPMA0h9MCgTCPwMYzAbDasjgsNZyye8CZUTD1MN4iTL9Nsqlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx7pXNXy; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac298c8fa50so300849466b.1;
        Fri, 04 Apr 2025 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743757235; x=1744362035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZZIhlXmSEM4mLMGt9PJm09NKzZfuiEVonPYgb5H/yw=;
        b=Cx7pXNXyD+fJyZgOa66cHFUHggvW1Zfs2fGsTIhchCFR/UNsZ/KQaG+48ezEpbWfMz
         5OICLHAexn0Lcf/LSax24K5rCqTPo6ambPj05IcNuyHJdEK/JQXp03P3HgrugaWDht4+
         cdos7lzPQ0PBfwzoQwTujqm3PaGanLT5hD+QkWtMIsMSWorZQtIOAGH5eOKTpYiQdHey
         9Z2ZOSBLk1yO+rw3AHzutPrr0i0DV0RPUDEMXFzxTim1o9RSe9PqW81VG/G/CsbaQD+i
         xB1UzgsCWcwfd6Sd1QSp/NAoOvll16X5JLfXTvfDL7rQbi0nOekeSUR5Kkwppro9VgdE
         H8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757235; x=1744362035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZZIhlXmSEM4mLMGt9PJm09NKzZfuiEVonPYgb5H/yw=;
        b=EPvQ+I7tb0vgt3hiBv4c/nMs8PEhnnowucAvLHkVJdhq/ajlQTuF6sXYgE7XjoEmEM
         TqA8og3J5UT82zKVCuT6xTvJr2FMrvPosht/KZsWpuWCFpHxMDIF1jcxSoA07+pz6Yfk
         7ooafa+jU9QyBXhxIkBVJN5comoL/jLQ6bYSEOuNkxmX8WHN4/AN0sQFuR1/hwNW2Tz7
         hKnewj4kS2P/3DH6a2ceVm/vjcRZntPsIDKUUHFIXzxFxfKjeCC34jX25ixL182qJyv3
         ApGDO3ZtAqBC2UnVQ7ManEHYaLWseoy2BdIPGsFpCghxgVyemo0gaDu/p/Yl8xpv0ygy
         f2aw==
X-Forwarded-Encrypted: i=1; AJvYcCU8fg4h1zKD3EMYM8j4y4mCRE7OMtXieN0GjZYGNM88wdMTQVIG0LLDEzZNb/7VE/ReBsOnJfedW8BsrJc=@vger.kernel.org, AJvYcCUQjK2UoU/2dDC+N3OVKuC/Gj8AIaex+OEZDoJX+35wTDWV4wtzkLP4XBDCHkyBmmOV/MxQi7noO6gExCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx18wXNu+HNpKCl8/8a8FON3iYqPUNE6Br8U2FNuAihk8YSqvQY
	IBxH836dki/UeOfnrBtIUsm0K0IAx0fZM+OUbeSfnJB63UAoLZHm
X-Gm-Gg: ASbGncuFWe8EGwu2IgdNUrD91SU7tZMCy54w1saugYVGs/ORl/4wCUrvPAh4XzittIA
	jMgai3cqnL51lLg4KJLWBuhhoe6gGO9uGdio9mYktU2IlFcWiMf2i+9U23XOP5KTPBrx/38lugZ
	W0gaFsfFH/LfzB7OZlaimIKm3/PI9apoZE37jRFnNYmm9bl5Hulk3dgoztd95M0IXP2R2jmRlGf
	92hmFvyR8mk58Qvbgjxn4kQd+W61vuICngd58s4XineRnBQ0TPSOUUVTvOAs0nYnI0Pn2m4zSvN
	R7bHgaDUrPImHGBILcRKn77RHYHFnInzrCL/wIJApCn2c3u9vkCIFiYCStNzWIk0LKnAHg==
X-Google-Smtp-Source: AGHT+IFKaYCa9Ekb9gEfEN5MRzSJWHbOs1q70b7ER2jDUNXjdVPmL24jFWpqdnQ80yp71nL0KKYsSg==
X-Received: by 2002:a17:907:988:b0:ac7:31a4:d4e9 with SMTP id a640c23a62f3a-ac7d16bc089mr299516766b.4.1743757234491;
        Fri, 04 Apr 2025 02:00:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.129.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9adc6sm222086166b.59.2025.04.04.02.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:00:33 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2] media: platform: rpi1-cfe: fix pad in call to get_mbus_config()
Date: Fri,  4 Apr 2025 12:00:25 +0300
Message-ID: <20250404090026.2986810-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The source subdevice might be using a source pad not equal to 0.

Use the already existing source_pad field of cfe.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---

V2:
 * correct Fixes tag

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
2.49.0


