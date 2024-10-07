Return-Path: <linux-media+bounces-19171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D299369A
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81B421F21443
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7653B1DE3DB;
	Mon,  7 Oct 2024 18:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5xL7hSg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E891F1DDC1A;
	Mon,  7 Oct 2024 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326933; cv=none; b=eBu9mLWnTeuabajcvs1a3e7qwMf+qjTPzwgJPFCmuASD+ukgVeUWkc6rMrctn36eA0QsZHkIKbYq66d11q6Prequp8YcnAtGRAcusfbVk5EZUD2biCxxpmnPoF8+UASNWPM9Nbr65f8Ku8UrSPCwg14MT6YjJyZlzjD8xVVl79s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326933; c=relaxed/simple;
	bh=T8keBBIKmh+gQilFeSMtnLq1tChWN51TvIxv5AmsMX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPw3Z9wY+1mWu5rsnICD5SfznB/luLdsnk+qvjOUnM0WqC73zJ5HGj/O48DdPnnWIIfQP7mgDL8OCuzDr01dlddBTDKlAZv73HD4/5C8WDjVLNcPZtagSTNBShccY5Rl5sWIl2AYzzjYmF8RWphyxarvIOA/ouHcgTnM2Yz4KXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5xL7hSg; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9957588566so173725066b.3;
        Mon, 07 Oct 2024 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326929; x=1728931729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39t/gj4BnzJio6PIx0Gz5cXfMhkF8u41aLRktL+ki3g=;
        b=F5xL7hSgsuut7yJp4VXnNAr/TXVQPidPLJqAxvUxvdorxCDTBYZUJ7qTFyAVWbYxYp
         axMWA70yQmdGGGxaDx6ndpEGUblFiV0mmP8iI0hR+bd0Io9twGwo21rZp+S9ViUuNGwm
         BZwFQDk1M1mK6lgRogQFyTgHTh38vZFDCyXUlk+W5nNUtU1MOsk9rcTncTMDx8Z3OOni
         V44HPzgk/tuGE4lfgLWUoETnqv32PasdF4H5UfAgw8vLmCIOJchw1nBcykHThYFtKsbX
         t3Y/zge98p4vw+7PpsQWyCB71epGOSuCdEzGUS0KwLs7uGGpPsVBHv3CbHLCsP1dkEeY
         6Bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326929; x=1728931729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39t/gj4BnzJio6PIx0Gz5cXfMhkF8u41aLRktL+ki3g=;
        b=RS6sWKMpePIghF5K4vySRG0NeQr54WPWXjiDqAtRvyGMjeC9ziGLssISopCD7EmFVX
         CakMiI23hRSXF7KJMs/6Z+NoP78jRgNwiB+5QIRwMxdz0qMyBQa2qsRDa1EQhWbEIKAG
         Ra8ATOMi5GLELZTXKFEnXXhRvm5zLWroV9538tfWzkVxUPL6LaKPlOjwhKQeCD0cnxGr
         LhJGGp9dg/yI7yIncgPcfrfGTeW+zz/v6OeQfzYNGHRzBARn5Z6ljSrFq1d63VUR+Ey4
         pFMeWaj25Z93qsicJcN9qXv10xcOKdqOH836g4QFzj/JghP5mlpdS0n+sPYgM422BCcq
         hMYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9UKWFZSZVRNRjSN10YBDt+j7Zs2x0uAWl9YwihI4ivhx/Oa0sUa47BVloNcBMIWZxVClmbZVU6yQJiVg=@vger.kernel.org, AJvYcCVHinVu/hHLG3t1Eul12lFley3joCxSWuD/4xLbFrjxqWtqefmTGM3K920fLMPU8w2YoNAec/xTW4bIOC+dNhhby0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXfphH5WMmrn2bOEY8ERXlKE2jYkqiqhIpzx1Avnc/swRkrUEZ
	0eWhZMgoTTXXmYLImMwSiTVeX54fjovSxIJ4xHtfFJ7UO2nLjXzN
X-Google-Smtp-Source: AGHT+IFZZo+Axi3b3AUPuTX/ooCFGfkMLdiOnPYX99kpySZ+RbhYjhajstp72jrw06HefNACIOuUgg==
X-Received: by 2002:a17:906:f599:b0:a99:42e7:21f with SMTP id a640c23a62f3a-a9942e73d6fmr840286966b.37.1728326929164;
        Mon, 07 Oct 2024 11:48:49 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:48:48 -0700 (PDT)
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
Subject: [PATCH v4 02/17] media: rzg2l-cru: Mark sink and source pad with MUST_CONNECT flag
Date: Mon,  7 Oct 2024 19:48:24 +0100
Message-ID: <20241007184839.190519-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 19e0ba9596c9..69cd45b26951 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -209,7 +209,7 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 	const struct of_device_id *match;
 	int ret;
 
-	cru->pad.flags = MEDIA_PAD_FL_SINK;
+	cru->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&cru->vdev.entity, 1, &cru->pad);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 9f0ea1de50da..700d8b704689 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -217,8 +217,10 @@ int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru)
 	ip->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	ip->subdev.entity.ops = &rzg2l_cru_ip_entity_ops;
 
-	ip->pads[RZG2L_CRU_IP_SINK].flags = MEDIA_PAD_FL_SINK;
-	ip->pads[RZG2L_CRU_IP_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ip->pads[RZG2L_CRU_IP_SINK].flags = MEDIA_PAD_FL_SINK |
+					    MEDIA_PAD_FL_MUST_CONNECT;
+	ip->pads[RZG2L_CRU_IP_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
+					      MEDIA_PAD_FL_MUST_CONNECT;
 
 	ret = media_entity_pads_init(&ip->subdev.entity, 2, ip->pads);
 	if (ret)
-- 
2.43.0


