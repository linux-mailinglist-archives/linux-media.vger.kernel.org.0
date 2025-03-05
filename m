Return-Path: <linux-media+bounces-27561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B81A4F90F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 687D93A539E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 08:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A131FCF65;
	Wed,  5 Mar 2025 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TW7KcfUr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD91FC7F3;
	Wed,  5 Mar 2025 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164289; cv=none; b=hcq5zg+/4TNrFha0mfJnm2MG8xv9dQy+Cz28gyelwRYiiVhA6J9gNsYX5E/Zpbe8ND0xhSpPqMnH0jvYqR2u7BSsR/RpI4doO+xuz6ssuPzxVTAktuzQap0s8P3uB80V7d0OE6OBi5damPaZ44FeZJqwyzrDsErpMkqNnAl9IWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164289; c=relaxed/simple;
	bh=RS4y4uVxjaKGuaK73r43Jh0t8huEq2LPiqqw/cBwPQI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XM/YHZfkLXc34WJB6hH7mmpChXBFrtClz+fvey720szrPYUn5bEftmMfQx9BJOJlPyicEbK2bEv9Z67Uh8E9Ew7b17KQY171prKKJscexaMCeWeBmu7f0PIYsMVdYl8tIw+FRSgXfT3zw2aQrumBzn49Byw/GYxT7Rvf0kGCa/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TW7KcfUr; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2feb867849fso9078011a91.3;
        Wed, 05 Mar 2025 00:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741164287; x=1741769087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMh/1IYC1/u6DKKOw2ms/3tpOZM3Bu58eEc2wmPyXZA=;
        b=TW7KcfUrKiBqKYfRHU1UplUFGV8Y4qoUKI1MZDE4tywK4xqmWuZ4yK1XuCSAm1uF5W
         VJrdjmZRU9hDYBbSCGtjZ4Ppv9M5Qvbi/cXX4+u3DpvPqUnUeuwkpGJNtpeabZgE0nyd
         C95kdgSr2cWfNSk7xxut6aSXOerQjv/SRkxKPk3xQuhTOzANF6FGXTaj/u4T81ll6t03
         7ibeyww28bOl9Yp45JsWkVFQ6OpoYUp3Nvdvz7QDt6lDcuABXh/i9tYWIrA1cifA2voi
         Fdo+wBXi0MPreMEgmjd4bPcP2iSGzOIpxWmUGzou2cscgC2O/u7L0SlSvEIO40e4Y6tV
         /iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164287; x=1741769087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMh/1IYC1/u6DKKOw2ms/3tpOZM3Bu58eEc2wmPyXZA=;
        b=rhmHuRxaYwj7xXpKo7ZM9zoKHwg4PAlnm+87ct+Or8Z+imU4UcHtXE1MaTno/K4Ues
         C40VCX8yHuK64a0qJdLFyJl70dN/CqjDRQ/90q4P4mziT+rEXyE+T6stmgqwzPMPMRy5
         Q6+6rpuQHnLc2NxxtfhMlth82ZnAOUuJEBVn0+WMWUBw0k0KXxem+ETunHBBg6IDFFMa
         mnz/51DixTsJ6/8XIjWIIegoBiltLpQRD/WeX+JJOw2YyFhUIZi2+o2KV4dikr+hpmbG
         sk6ybYWUc4Ei7cSPTZdyXV0aZDl5Js03ZnOczWrrVFj/z09AhubYrWQuN9dLJtTyTyaE
         Ra5A==
X-Forwarded-Encrypted: i=1; AJvYcCW/7avGOZgDeTzpBPaQksH01kBZoRnIqgP3PHIQylWKrnTMZm5Llvtyjpkko3OMndodRGrlgSPV+tUHLMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9y1DI1XK+lRtfz4H+Liw6omji6QnirUKfAKrdKGyZzMyWeydj
	ngPA4kMrTDzH9Oheg3aVR0wYYIAGGPZ9mAghymsfmqlj2Cq2Duce5O3wNnk4
X-Gm-Gg: ASbGnctzIniodr3IH7MzQoO3DKOdJOx0A91kNXmUFJ8h0A1LbwQQrxnqnzxjJZv72GW
	HvJ4s0TMwCNTZ1b17ZkVFGeozRWizKcitkbHwyQMQT2tnb3K7r0vr7kdO5ncLMtXQVkLF3dg3Qt
	n78JbmnVTLnCV8S0g5Tr4T5+mpMpYKomK8sOtIaAevSCdpfMh7RQOgkX6esQP9vfVSZk5G/93Jr
	+GaWseH5WnvIgUQBqYZrJFqO+6R2hgBJRoKA5SE8ennscH3J9ax2xKtEXX7rpmS2oV4/6T0iA0s
	vl490oaBudSyktjnOR6Pp06FtZv8GmWdbetpwxx+oSKsi2D3GwvK+VNUNvkI4qp8pDgudslS944
	8nQ7HLAzvzs+PRHar
X-Google-Smtp-Source: AGHT+IE1y9oYg9eOq2NejaOXd+474ozq3ci5ZYOukGHKwvLj+l8H31AsVZndFe30B0ZQzkAYYdQImw==
X-Received: by 2002:a17:90b:5110:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-2ff551531ddmr483870a91.19.1741164287369;
        Wed, 05 Mar 2025 00:44:47 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7ffe18sm789169a91.31.2025.03.05.00.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:44:46 -0800 (PST)
From: Michael Chang <zhang971090220@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org,
	zhang971090220@gmail.com
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: nuvoton: npcm-video: Fix stuck due to no video signal error
Date: Wed,  5 Mar 2025 16:44:18 +0800
Message-Id: <20250305084418.1301030-1-zhang971090220@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the issue when start_frame and detect_resolution
functions are executed at the same time, which may cause driver
stops capturing due to status of no video signal error.

Signed-off-by: Michael Chang <zhang971090220@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 024cd8ee1709..234fdec04f74 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -863,7 +863,6 @@ static void npcm_video_detect_resolution(struct npcm_video *video)
 	struct regmap *gfxi = video->gfx_regmap;
 	unsigned int dispst;
 
-	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 	det->width = npcm_video_hres(video);
 	det->height = npcm_video_vres(video);
 
@@ -892,12 +891,16 @@ static void npcm_video_detect_resolution(struct npcm_video *video)
 		clear_bit(VIDEO_RES_CHANGING, &video->flags);
 	}
 
-	if (det->width && det->height)
+	if (det->width && det->height) {
 		video->v4l2_input_status = 0;
-
-	dev_dbg(video->dev, "Got resolution[%dx%d] -> [%dx%d], status %d\n",
-		act->width, act->height, det->width, det->height,
-		video->v4l2_input_status);
+		dev_dbg(video->dev, "Got resolution[%dx%d] -> [%dx%d], status %d\n",
+			act->width, act->height, det->width, det->height,
+			video->v4l2_input_status);
+	} else {
+		video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
+		dev_err(video->dev, "Got invalid resolution[%dx%d]\n", det->width,
+			det->height);
+	}
 }
 
 static int npcm_video_set_resolution(struct npcm_video *video,
-- 
2.34.1


