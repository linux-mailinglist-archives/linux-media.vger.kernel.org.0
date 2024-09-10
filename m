Return-Path: <linux-media+bounces-18122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD1D97413E
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EE0F282E99
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058671A706B;
	Tue, 10 Sep 2024 17:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1JDBuX8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D383D1A4B82;
	Tue, 10 Sep 2024 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990866; cv=none; b=lsoFGe1AtiKkpZh95zRuwDY6Td65MGQTlgvpYRy4VxiERkKmu6y6WGfP2fObHSchZXAeKBWGnnzIptmBpkaJoD1ExfxiMnGG+pdDdHHuGXBtEM5sbeCzSL8YPZ9GEdMz2c/iQzwlYm16syNrvyU4nKYk9rGhPnI6FscSLyAzHqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990866; c=relaxed/simple;
	bh=RovCLfsnDlrsmjJjptM1IJKbfXPN4/LbCsAEJElBZU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EADqzkO0bxUkl3REwyKyR3v6xPFYoIYMqksm0zTjORjXQduPvB4FYZYVtItTvroQlV571Xak6++Cb9G1Iwt7vjTe6NpI7OnXf7+kPMx7UGmbWr5wiuzwko1Gw6MOGT79UFzGIcFz9/+FyCGAdIXKh3FWnJL4sFKw/WxyTOoLXOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1JDBuX8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374d29ad870so3628748f8f.3;
        Tue, 10 Sep 2024 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990863; x=1726595663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T365CfszrGDfzoyk4g1jrrFrtycMXH2Ev66xLzYf1T0=;
        b=E1JDBuX8kQJGfKJvWb3FGFEGpiPMkuGCHeF/OOiTNLjuwWarGr1YQUM666ndwUN+g8
         lV4v7VrhzzzVltGCU0ZT04oG4/JnbFEUK4ICymTYHYN3XiUByhBP4iX3Cl6kJM5oNnQY
         haXm2WvzACJ+Ab/pSfK2TpdskuH5Ku69XZXQIiC7RBpivykRljOrZoi6nDRN6VYop+5V
         1zkTEKvgcCHi6URb1iNNHxY5ADjXOn6QJzJHqyNJptqLZGDXYsJ6ANLUhax1Iedn+SoK
         jaoYF0HCWEBdcTHDWKcXwB22/QSsZO9Afsxa0UB91wsJiZN0UbnkIWeU9H73268RIalD
         P+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990863; x=1726595663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T365CfszrGDfzoyk4g1jrrFrtycMXH2Ev66xLzYf1T0=;
        b=GV3MiT2wjrUotbwICGHZS7Exld2TgKSFq+Plc6NB8vCVyEnRQb+LFZhrOMjxfLWSS0
         nGjowfdxjZ+A9IICYQ9OoO4l1fMENGBlodK5Rsv0tMKiUQVVPbYQmJTXZJDyEQ/GO75u
         7F7rvtxJPCL4sIxjROm6URYBJXGYmkYBfKFML9e/NbKhc+h+JGQRH+M49xGZUJGnCQEP
         88vzhriFo3ryUwo2/UtiMeB2uvEnJb9NcqO8Ndu1pNYEuy8I7w2LEWPOBZoQBzCtFiE4
         onEgkutf+BINqTlvGGBwr4RThOOd4cvFPCQRJKLKpjR9FBiK4oPlatUyaUWfuYfyJdf0
         wt8A==
X-Forwarded-Encrypted: i=1; AJvYcCUofnw66FvZxtaW/cNSg/6VL1cTod8r0MjDxfNyMviqtbKC/0S0WTc5CdD2yuw8aQvzUKaxiv6z8roCeBeKR30pwWE=@vger.kernel.org, AJvYcCVdVAlV/u7qAAaFIFMqdeC9P+X5ZobuQ+iXHJPLuNoKvnM4o3zLYgAS8MdvodqtiHRq4U5iyA/8Rt/BmIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaWHuV3TrgvZGTHjl/Nn8rI6lr88bYAx7NMOxXwmAT6J94bPJZ
	LeRSD5VlSCEAZ7d6FPOzqlxSzsVvAA3JoQxEFN/lo5CAKZgyAW2s
X-Google-Smtp-Source: AGHT+IHNMj4+P9FHg+a2BtNp0gsOMhiiqS6grdg4xYI1tUevBlZqjTZDLFMbVTqMPPqtpJggv1JC9w==
X-Received: by 2002:adf:f3ca:0:b0:371:8eb3:8c64 with SMTP id ffacd0b85a97d-378896c7ddfmr8380588f8f.54.1725990863171;
        Tue, 10 Sep 2024 10:54:23 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 04/16] media: platform: rzg2l-cru: rzg2l-csi2: Make use of NR_OF_RZG2L_CSI2_PAD
Date: Tue, 10 Sep 2024 18:53:45 +0100
Message-Id: <20240910175357.229075-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make use of NR_OF_RZG2L_CSI2_PAD enum entry in media_entity_pads_init()
instead of magic number.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 2f4c87ede8bf..10b8b0c87c1f 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -804,7 +804,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	 */
 	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
 					      MEDIA_PAD_FL_MUST_CONNECT;
-	ret = media_entity_pads_init(&csi2->subdev.entity, 2, csi2->pads);
+	ret = media_entity_pads_init(&csi2->subdev.entity, NR_OF_RZG2L_CSI2_PAD, csi2->pads);
 	if (ret)
 		goto error_pm;
 
-- 
2.34.1


