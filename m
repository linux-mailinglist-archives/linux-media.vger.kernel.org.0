Return-Path: <linux-media+bounces-18932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 489CD98BF25
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE9531F23A78
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527081C7B8A;
	Tue,  1 Oct 2024 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hvg2tBxb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178061C6F78;
	Tue,  1 Oct 2024 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791783; cv=none; b=nC1P9LqABcT/H5NVf59HdiabgaBQYBqhgZ3+xx8IOyxNcUpfH0IRGtnjL2AmdFYbAgAP3ieRZSO7AVa37IX60X8gBP1Gg4AWmBDa/QL34EHWWgMv7ZnBjWnJzvGmnWuHpQWN72lvqqYqCJcaJfOEaAgCXcjNUW3xOqkmb+8fWD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791783; c=relaxed/simple;
	bh=i638chX4bzpdrjrtX+G7IudMVW3kXRsVe+5mbVnrsDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOWN85w2rnw1ObP5stsGQrwhkCaLPewT9ymNrPGr2kCqADLD6Qj9yySMvANTTvJ3HW4vwm2n2fIBfVUNAVzTbbZ2Bc0w6QtEUQagU6kPLEyh+yxmKdIhmJWuxMGEAI3cf/niIqAkvzUwQeEjTbCLDRRJxEeGDpEbasXRZQ39t14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hvg2tBxb; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d56155f51so715805466b.2;
        Tue, 01 Oct 2024 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791780; x=1728396580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMYCeT1AvyrWAGQYfjzize1dyUeK7Njlfbuu15Mx25c=;
        b=Hvg2tBxb5uQTrnMeie3LijXSEWSrPCt1wdDRMWlLlMIpLhYfw/koRs2FZOcIFpoqw5
         RJp/Kp08jD5VgLyXneNBQFeLPmhWjtDKFwfWIN9em6ZX1Hz0FRqsVS+iRdDtG+sBC9gB
         1ycrgFh4KzjgmfVrTSHIAyVQk4H1HvyHDVp5ELNVxLsL/F/O3vFxp61qnQeHLtmSdSrr
         LSqkpFX6X4vIdfJxUQCdrg0YMqRC8BbLlqu6FyxV0RQn51POlbNHiE4RmvKwS+yzAmJB
         tnKyaGL4Rre5bfTFfuINbKOuPpNnopySUA3/G9SFLgwGP9aAQMYcqqtq3zuvn5JiY+mk
         tESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791780; x=1728396580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMYCeT1AvyrWAGQYfjzize1dyUeK7Njlfbuu15Mx25c=;
        b=Xbrc6hvrlIvCee6ebaY81+XabJM2E0L+hup+yKUawBmufZV09ug2aUBHvgWMiXjxPU
         4Ok/nNhWIoghuMcZ0dvA1GfcG5mNo2ZJH5zfliWvFPSo15xQDyFMfIlU8KzfZi9H5cVQ
         6+CkyOnk6jWjvKVmXCWK/wT9IflrmkIzCETNbLDvwotqJpdU6X4Mjmean+WAsU8CFgy4
         yn4ggusIX18cAdiGiOJXTauMJolZbaf4hmHctpA6a0v9BySeQzKTmRnHXAxOYkZQAFiR
         l03+qiItq7k3KajP9GjcLpyZRl5MbHvNOphszswUFdoM38I/1/2a8/MAx3H9lMBpYS3m
         gk5w==
X-Forwarded-Encrypted: i=1; AJvYcCVBrwPkXVbBhzpuaAVgPH6XDCYWp4yoWP1LxzC5UPHfNmXHlY+5nTzjmu185YeIY9vkaw/3MVx+6euCimc=@vger.kernel.org, AJvYcCXopAxFscNZ4hx7+3zSFhiENtKeMQrHr4gZ5YsIb1kGlQ3Eo+RFb6xHDGvyNBQnz1CDu/b86ZVd7EETCLF+mRyM4Fo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyydygk/0Y5PdjCIzHPJX4IwWmfjWqNarVulUXYj2yV7KO2OMt
	8a+N5HY2APvF1FqgXhNbvIsmQCi1TapKgHlrE7hSkUPW2sHauisB
X-Google-Smtp-Source: AGHT+IGl4J1n/+IxJ+EK+VfOfS//lCvGkYN21hBBR14/fibuWFgzqpZj1S0Wivm3Ea2QX1VwNUcwfQ==
X-Received: by 2002:a17:906:478c:b0:a8a:86a9:d6e2 with SMTP id a640c23a62f3a-a93c497029bmr1738501266b.37.1727791780346;
        Tue, 01 Oct 2024 07:09:40 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:39 -0700 (PDT)
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
Subject: [PATCH v3 03/17] media: rzg2l-cru: csi2: Mark sink and source pad with MUST_CONNECT flag
Date: Tue,  1 Oct 2024 15:09:05 +0100
Message-ID: <20241001140919.206139-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Mark the sink and source pad with the MEDIA_PAD_FL_MUST_CONNECT flag to
ensure pipeline validation fails if it is not connected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3
- Updated subject line and commit message
- Collected RB tag

v1->v2
- New patch
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index c7fdee347ac8..2f4c87ede8bf 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -795,13 +795,15 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	csi2->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	csi2->subdev.entity.ops = &rzg2l_csi2_entity_ops;
 
-	csi2->pads[RZG2L_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
+	csi2->pads[RZG2L_CSI2_SINK].flags = MEDIA_PAD_FL_SINK |
+					    MEDIA_PAD_FL_MUST_CONNECT;
 	/*
 	 * TODO: RZ/G2L CSI2 supports 4 virtual channels, as virtual
 	 * channels should be implemented by streams API which is under
 	 * development lets hardcode to VC0 for now.
 	 */
-	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
+					      MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&csi2->subdev.entity, 2, csi2->pads);
 	if (ret)
 		goto error_pm;
-- 
2.43.0


