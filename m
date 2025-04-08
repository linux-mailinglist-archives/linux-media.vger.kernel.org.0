Return-Path: <linux-media+bounces-29579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C47A7F475
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 07:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEB3117A2AE
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 05:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C583725F79F;
	Tue,  8 Apr 2025 05:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ib+/mnpR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C858C213E67;
	Tue,  8 Apr 2025 05:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091778; cv=none; b=GyYu1ND9d9BHTgxKWsa/mzMTzkdt3wRIX3w6gUNCcaO+yVZdxzMCUUPzdaXbLajfFjkkYwmsGBFry1wOIKrH8AM91x+kYWMPguV+i0A3ZOZXV+JkFRvJHtDoIl+1NnkIb4j1J2Zyk0SDSq/XDNjS7v1hDwoiOK97QOsOCz/voxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091778; c=relaxed/simple;
	bh=S42apcJopw6lMBL60g2IkAzYpNOxgwv2Cpr4/ENCP9k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gzU8eQTg/aJ3j1QVCHCPh4knkpNMTuWehTILl7lw4Q7Su4MR/TmJ+3g2rtcpqCfSUgXG3gYSapGCi/MBOU1ei8ZePuFX2voU5RfZNCXqLa4SbOwv/XU/O+SIExJ0ZVOJxDH3Qg/aJGeyyFkMxzowDmHM24PSGPa9t4sitSquLO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ib+/mnpR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2254e0b4b79so63220695ad.2;
        Mon, 07 Apr 2025 22:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744091776; x=1744696576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rqpz8NuFEKxlJYYhCortmvxtTD3Iriop0nreRrYWvRM=;
        b=Ib+/mnpRx5NdwNFFY0L44LEkZtGMTnKaFnOAnGfh44l8dnNiUouwGORoSGO0z2AWaD
         4XfA2hV2mquoD7HcSVyNdU/PuNsoKczMqgRGR5wTZcYOKlok5gT2YORC17mr65iXa9Xk
         qDka4CQ/q//m7JuznE93XZx+iycjDuMPLFrhknebvQS76nq2UNnvdVisyemZOhsl3Wl+
         gV20/ulkXwTW+mhj4Wb4K1WJgiQvJZGeLa04bKkC8YPz8Cu2QrlCCCIZTR7l7IOKN5QV
         xCcP7vDzlPxIeDF6gGuhnVII3fc9wLQu4+QjnGW0F/nmwju4z3FeCUR4ENjezUgbBuiU
         DCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091776; x=1744696576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rqpz8NuFEKxlJYYhCortmvxtTD3Iriop0nreRrYWvRM=;
        b=Wi65T3NJYFOtRK8phmbzgq1vSSrHrbyMVfmAOHTdc5Y5ZZk+W6c1HFlGyk86KJsGkr
         gy/7fBYaxJPV2zVDbFTzSR0gcaSqlXmzostQ+hFz1jwpq2/azYA/wfSeWigdJjLUDT9u
         sHywh1YhhNrrio7fff36FSV8ntYbt9a7ez13Ik4Cy6sGieYapN8LCKkN7vLe+wD/Nm8J
         LclzfxYya03Dclshts9BFTmmPwcbktrHQORz0yyM5zFhwRIMp9BqmSgGrkhom4dXltnW
         NyoIlvALr5QjRRsYDJZ+XpP77J0i4MO65ShrFlXAwIKmaG0cjUMZAK7olzA0UqY5SqQD
         ppzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZxjuTLT6OFnIykf/pRNlLYyNfenHvr7k5xAMxqbDj/FKRlDXNqydgTxilLpLL6ynziIoP0a4ppmLziY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXsgOD8A9R2gZIHzhf/9AUBGNOOPiRlw7bzO36nrmrWHCfEDXZ
	gsItnasBU1GHcOAmazRfrNXvPAEKaK13izwaNah0iKFPkNw4Kv7l
X-Gm-Gg: ASbGnct3/vy650amlfxqWivLTS/V6wz1Q6QGPKBcUueDZ28CSya2JTPX4/jjjk2xU//
	LhT3DBi49CVbsNCOQwi23gFPE/hZ7AwzNGIC6GOHRH/OLwHmv7w8+I/gQVqFwKEkqjPoLZD4gr9
	GQ+1Qzd6EtGXFUOhgO4hGUaUECrVqwcH3oGE3FYmPyod5gp7H1QJRz/YThL1vSeClhABDpCuQwm
	ghbsveklL9ZdL7ojjZryDYRP2uZ4/kbhdMzy1OrHHmuACcdydMASJNLXuAy2kLGYKi+CT+SUodx
	4DSr68RYVnDIsyW2ubbOhtw1rx9NeqEOz2zGsW3Z7lENi3FmY0W6o1rBRknNuY4i/l48YOl8lDj
	qaSOAG19xsXUIUjTi
X-Google-Smtp-Source: AGHT+IE05u9t9NFEBw+rXVTuN3JQshXllOgy7pnk00Je9nTx82e8AXGF/YtAVc4GIGc7M22Lq5mp8A==
X-Received: by 2002:a17:903:1b0c:b0:223:5a6e:b16 with SMTP id d9443c01a7336-22a8a84ae50mr231161415ad.5.1744091775946;
        Mon, 07 Apr 2025 22:56:15 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297877656bsm91127335ad.246.2025.04.07.22.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:56:15 -0700 (PDT)
From: Michael Chang <zhang971090220@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org,
	zhang971090220@gmail.com
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND] media: nuvoton: npcm-video: Prevent returning unsupported resolutions
Date: Tue,  8 Apr 2025 13:54:54 +0800
Message-Id: <20250408055454.3421083-1-zhang971090220@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To restrict the returned resolution due to Nuvoton SoC hardware
limitations.

Signed-off-by: Michael Chang <zhang971090220@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 234fdec04f74..8d6d51a674a3 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -578,7 +578,7 @@ static unsigned int npcm_video_hres(struct npcm_video *video)
 	regmap_read(gfxi, HVCNTL, &hvcntl);
 	apb_hor_res = (((hvcnth & HVCNTH_MASK) << 8) + (hvcntl & HVCNTL_MASK) + 1);
 
-	return apb_hor_res;
+	return (apb_hor_res > MAX_WIDTH) ? MAX_WIDTH : apb_hor_res;
 }
 
 static unsigned int npcm_video_vres(struct npcm_video *video)
@@ -591,7 +591,7 @@ static unsigned int npcm_video_vres(struct npcm_video *video)
 
 	apb_ver_res = (((vvcnth & VVCNTH_MASK) << 8) + (vvcntl & VVCNTL_MASK));
 
-	return apb_ver_res;
+	return (apb_ver_res > MAX_HEIGHT) ? MAX_HEIGHT : apb_ver_res;
 }
 
 static int npcm_video_capres(struct npcm_video *video, unsigned int hor_res,
-- 
2.34.1


