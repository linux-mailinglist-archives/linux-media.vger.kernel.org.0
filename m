Return-Path: <linux-media+bounces-18933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F25898BF29
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83AD51F23476
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AE91C8FB7;
	Tue,  1 Oct 2024 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XT8ACy6x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20C1C7B7B;
	Tue,  1 Oct 2024 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791785; cv=none; b=a7ps8raWpwp0BNHsI0VEXeDdjiEX3UTf8Y6AkIPJFDkvutKY+5S2Cx93tvAy8BXz7MJpyxPZZQbcxvnzEaOzE5eTseVsUN93mF10BD8x5/XTffG1fUGrYiYovR4BIlEnVR7gEl6JQUttb0IkT6d5mymGctw3NNv84ZdOWrbnq8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791785; c=relaxed/simple;
	bh=IC/LZfAnrhCzteBL/JVZfCR5DtHkL8XMZU5DAXdQQQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhEn+9QF9SiB3s/roRNvKPbVNVe5SiBIEzSozijwJSh6PPjAoQX+qrtllGPXwjFcUQoMxUEw7MQg0SgJstqUAcRsgqSgfQ5wvv1r2dyx4ZziSJblDF+ZGjhIzAA8sBp50PoSKhFvEyXaueWaIOFMBw1Gh/UCp3FjjP8/Ye9waC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XT8ACy6x; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a843bef98so811037866b.2;
        Tue, 01 Oct 2024 07:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791782; x=1728396582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l09FKGIUDUQUQ1PCZi8BYukjjtT4r5+g6zu1hVrAAhs=;
        b=XT8ACy6x1jjmZRUjr6eSCx61qm7PJ2kg8Jhs+O2hrk9LEDzfJW8ehthnsLXVeJ8xEJ
         WiBq9dpaRiwf3LKTJrASFK29Hhm/P3JICvbUxcHOnmYRV1KsDK1Y1Mbklzt4O9/960IS
         MPFb/IYnZCIXvtfo0DTl1nDh5/ln8jBKa3HuQcEI6Q3AHl5cJyuU/iYZPBULEVW9wW6h
         uoy+uuratjZ89r9vCofIEua2eydDoAvN33Ct4cZrapUGbY6G/wrTS4H+r35vp9gWw4Mz
         +nVDSFOwpzIduRwyt2HNBsriMMOnKUcuf/fXWgdORnb0vs6WxcBX1fA3X4mmZISbwDJB
         XEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791782; x=1728396582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l09FKGIUDUQUQ1PCZi8BYukjjtT4r5+g6zu1hVrAAhs=;
        b=sKW4/XPoIR2YeNxWWnZZH/Ve4jO8ZzLZLxyYxWXkVXw/Ioa5hKpq1rQux15pdMWhnp
         TaTDf1pjeuXtbzaGJHOxCraCNMEmo5B4PTdphnp+nfapvQukIJXVRBnUp9ER1hkbtNd2
         aZAHr1i5w2UqNwgYd2sIxyOrYjiocNX66WTZYOy6nVFbH3L86NIY4Xy6qrX19urWNjzH
         UcI72VFqDqIdDiM68vttr9FO+hKh9JR2BU3jJAEWE+g0mcAue2Mh234zCrsg+eLrgjtT
         u6YG7coMTXXGUL64tz/l3rVQXDYJiNJ0kpngJ3GWNOm9ou2CpnFcO4vKJAjQmboWM3VV
         iXOA==
X-Forwarded-Encrypted: i=1; AJvYcCUsgzYbOTwRQ3peBfa7XQGAZwdvCVtQjbn5qneB8uHhJyML4JWM8buqCrgpv+Qpd/fwwUbGUSmgU5LjeqW9OBDXV44=@vger.kernel.org, AJvYcCVmOx6+Hf97hu+H2j0uH4E59VhYmIlm60zruY/ZbYbgkkKDArwLUhwI6POF3NcOR/7ydbPtOVynbv5/N5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfgaIMWoXJayWgSCg8jrqZbpohFFOuVT60QzScyImZz/LZ+80L
	caJmpb5h/CAckTB4ELSMrdSKTMjKwUhNbRVyRhSbJLZ8usQ4eRf0
X-Google-Smtp-Source: AGHT+IFezicmYgzToP8hqKWoeXBkFMT2g++0/EQCS/K6bAMJjfNxNI5L3xMdiIzec/sHoZYhHRw8iQ==
X-Received: by 2002:a17:907:eac:b0:a86:7199:af37 with SMTP id a640c23a62f3a-a93c4aca8d9mr1931386466b.58.1727791781794;
        Tue, 01 Oct 2024 07:09:41 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 04/17] media: rzg2l-cru: csi2: Use ARRAY_SIZE() in media_entity_pads_init()
Date: Tue,  1 Oct 2024 15:09:06 +0100
Message-ID: <20241001140919.206139-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The media_entity_pads_init() function was previously hardcoded to use a
magic number for the number of pads. Replace the magic number with the
ARRAY_SIZE() macro to determine the number of pads dynamically.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3
- Updated subject line and commit message
- Used ARRAY_SIZE() instead of NR_OF_RZG2L_CSI2_PAD
- Collected RB tag

v1->v2
- New patch
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 2f4c87ede8bf..abacf53b944c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -804,7 +804,8 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	 */
 	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
 					      MEDIA_PAD_FL_MUST_CONNECT;
-	ret = media_entity_pads_init(&csi2->subdev.entity, 2, csi2->pads);
+	ret = media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->pads),
+				     csi2->pads);
 	if (ret)
 		goto error_pm;
 
-- 
2.43.0


