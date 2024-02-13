Return-Path: <linux-media+bounces-5082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFA48532A3
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 15:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB525282523
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 14:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2135357336;
	Tue, 13 Feb 2024 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="YvFTgYPY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E2056764
	for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707833228; cv=none; b=gJpVLOknLVXOtS7gY8AED4Juv30Kw2uSfD033v84igV+Tc6Qv3lpCjYlqrRhDHivvPS1CxSAG4Ei7pbFZYyEvRKsCRLlMDSk29PYencLK9FtfgArl+qHoWPPOTpLHno0BHqDC3pn7F5ekESUOXT5FqOA+cyYBM4wpcMKHqie8D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707833228; c=relaxed/simple;
	bh=+s/OfGNMXB58P7TxwiDwAEhQ+GBlUKjDVwC55toeJVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QTvgFUKhhR6LaLxnX9+8UOWX1ylkdlcItwcRUtP7Bvb3IAr1kRJw0uyeA6MyyN78LZjej+4eKqY1X6jZwgaY6JQpoxYxjai3lzUhA28i2ZxTWYdYOGZ9LZg5aSmNT605Xr2Q64xy+Li2HvMKIJCslovMsNzzdpE7eSqMPCsduO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=YvFTgYPY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-411d2836b20so1193895e9.0
        for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 06:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1707833224; x=1708438024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OznreBbGn8I8qErYNCh7MV7tKWfbq+5twYL5yapVuHA=;
        b=YvFTgYPYeSpNbdCxOjklcltk58yg2oZROYr/l5C+nIz2X8Hgu4B9aRRlvh6JTvQVqN
         hiYGFHSWtsqFITWZ0B0oUy43NTU6PZgoY6aO/DQdkjch48NbKDtUHqb0R90CI6N4uD8O
         Du/Ji6c0IoELV/VN/aRI4zWwvoiEvzoIfIixGgLDeo1+pqK+bLCN5KtOv7qGvdxuSQB8
         Hg54V1Fzi/TFWW+9Uwa53OIAu1TGmsui8Fe8xRMykXCrZUTtUWglBoDInWYmcDFL5vhi
         90eUObiU3HFzUciPhj3y2wuGTEJY50zVOypf0Eg0d6vJy9thB90VTDXJ+Hx3j7Ia6ZkS
         afOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707833224; x=1708438024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OznreBbGn8I8qErYNCh7MV7tKWfbq+5twYL5yapVuHA=;
        b=bQM9fD0uuLAjcFxE+bniZ9aGrJvWcvcEsAH+A6obivrBZvXBMCgpgi9fBZSB99a4wJ
         wfHDoDyVspzFOSPay4N9HA+htkoDHPccFOaI82epQBZJ0ojqdrLlStOJfJ2sZRcs2Hi3
         Zia3Svts1pikDLTfC3f9LB6vHrUREo7K51RmNpWum/QoTZTKyGox341r6p1nnbfmWzCE
         mlZNGRuh6zCvfIXRBSNP5Mi5Ka/z32RUUUjezByriHbpOkMDz4BfEpq/7xwcKH5LaTIb
         gOQ4bG0Po3LnXKCyux73qAgRdOI1L4kLvlPpRYKEi3nY90cTJdoFobeSqr2pVf976giS
         xJOA==
X-Forwarded-Encrypted: i=1; AJvYcCV6EBMGIvigIlRcC0WP5qmAiUJtmF8puTUnl4Oi88uNx3PDRgG6FeZI43ADnBsgBXj8bXm55pdsuf0jaoHSrGJhpk+kxCgHrzrRhgA=
X-Gm-Message-State: AOJu0YyBpwrC8jvnNQiNYdSHon4l7tRUN/YmluVKeALBXoefA7iLO+uh
	EI0PVBGbr7BTcwOD6+WA0BJjTlJ5zRhIp/0jqB7L212Ees9L2WOfSlkZ/DVps7E=
X-Google-Smtp-Source: AGHT+IHgaCsw+bI3YnMtmRZRxOhZhIBpjtyhecfn4YghOjw9O5dxyxlKSEdfcJ9dLFmj9HUOdbCPFA==
X-Received: by 2002:a05:600c:1c98:b0:410:1587:7c0 with SMTP id k24-20020a05600c1c9800b00410158707c0mr8585573wms.31.1707833224356;
        Tue, 13 Feb 2024 06:07:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPlTlgcRhS132bjJpvP127vmj2lPugovqokaqg0rSgIYimGTm7LoF/kfRoriLQM2mmmzfw93YScwoshSD8YO0n/srrSuAnufpdYFdq55rAiqi2z8k4zctqQ++Z/VQxn8wANY36BXIaAxJlBh9Hzw3jtYQdFCD4k7D4KfmNY0M8czaEcVuZO8MT0H9F0AXQgR1sJTpc74Sxq5ZJhwOVvlm+
Received: from fedora.fritz.box (aftr-82-135-80-242.dynamic.mnet-online.de. [82.135.80.242])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c154d00b0040fb783ad93sm11744683wmg.48.2024.02.13.06.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:07:02 -0800 (PST)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] drivers: wave5: Remove unnecessary semicolons
Date: Tue, 13 Feb 2024 15:04:41 +0100
Message-ID: <20240213140441.8640-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/media/platform/chips-media/wave5/wave5-hw.c      | 2 +-
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index f1e022fb148e..2d82791f575e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -2315,7 +2315,7 @@ static bool wave5_vpu_enc_check_common_param_valid(struct vpu_instance *inst,
 				param->intra_refresh_mode);
 			return false;
 		}
-	};
+	}
 	return true;
 
 invalid_refresh_argument:
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index f29cfa3af94a..8bbf9d10b467 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -92,7 +92,7 @@ static int switch_state(struct vpu_instance *inst, enum vpu_instance_state state
 		break;
 	case VPU_INST_STATE_STOP:
 		break;
-	};
+	}
 
 	dev_dbg(inst->dev->dev, "Switch state from %s to %s.\n",
 		state_to_str(inst->state), state_to_str(state));
-- 
2.43.0


