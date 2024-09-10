Return-Path: <linux-media+bounces-18120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E99974137
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B598286C15
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B271A4E7B;
	Tue, 10 Sep 2024 17:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auen0yZW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72C71A2C0D;
	Tue, 10 Sep 2024 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990864; cv=none; b=gL1uDZ+No5PYUSXxa3xbQUcIEEtPRbvEovZZvYIuD+j9P3XWvM9dlMnsraXTWhQ0rwSR/vHESiCntRi2IuPFbeE+yhJ87i+AyyPMt+DJYm2GO8dbYaqTQ6RzuxhdpV1AOfFBq2A59sHElzEy1yJijsV8SiwVxOfNcWgR29qfC5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990864; c=relaxed/simple;
	bh=p0rcSqNDkoae1ANIInQxI34EtffO8V7joAOxUotvwII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sRaoAY1DLDjtXhHv4BOfYq2kyUXgDpNOeAfIdtFbQ80BVQu0EVnRe3T7jP/QaLt4zI7TYJTtIxvSSAjwThYierzS0b2+e+YGrIki/2T3qiT2bDp9r7hnTKInGaw9XF970vjID7aURPHA3Et6N/BOnSgBy7gad/PlzSlQuBfNX84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auen0yZW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cba0dc922so17831615e9.3;
        Tue, 10 Sep 2024 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990861; x=1726595661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2T4TNtnyTy5Xj6sUcPx5X44BZb7uZwTscRdIHIEFNg=;
        b=auen0yZWElqnG1TZc3q5eBYwy6eoFHa/3CgPLfBZkn9JYCNNG4QQxgF3886fTP0ed6
         QwmtpEuvXS5ypUKd4rnr350bjP5MhWpTUkCsNGJAsTADWzXImBYODIshBUIBFyaOf+oS
         r687WqmPuO6MxxmSVjmMe0v3PpyfO52YOPq6f+WrlbPFZIqNV7kt7P9B9bQ9oaorS1V3
         Q0x1LeboyRF0LctF5A6UvDzc29YH919h4mzVPOCbWMHnMBFqCtvaBIAz7bNi/GGvMGPA
         Z6kp+qINNVHLkc6EV7Prl2m15pETyqKBuQJ/syl83cU9GZDc1sKEd/ZqkpcpJJ3lwpF6
         rfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990861; x=1726595661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2T4TNtnyTy5Xj6sUcPx5X44BZb7uZwTscRdIHIEFNg=;
        b=kR8nqIyGlYj2+g4Hu5KaUFQ4ezN8ydawxrOBSy9QXctOx/QB2LgaYw6/qQJZfxeLqs
         nPoGSl1BtRhIz87Fjb768W9a1W2zZWzYz6yjZH6wj0zAMDgdK3ya2wGEkvlT3C6PMFBR
         UfeV2B3WzB78pMrcTaIAzdtHop5L4UEPr/YCYQd4OmEu/Y7MhEeYx6vrzRtxwWKSM0D4
         DF0wHgiFFApjaXN5RZoh4kajhD7Bl05bIg+jwd3xqeoZsFPGc3KmJBYGH3bHeFjsOSAe
         xvvPz2M7pele6Z2PeugNVWidtF5nY4rWdyzLJ5TSrjW5eXg9uQey7hGazZkfXK2Li85O
         uWpw==
X-Forwarded-Encrypted: i=1; AJvYcCWs0gI2QEoKm9sPF5PG0o77fSacYET/ZVWquD59CUH4Sac34ZdHUSzbvaPbiKyZvHT6/Y+gY9gcd6TnpxM=@vger.kernel.org, AJvYcCXjHpOyO+XhRPDSAhKRolllyasUHjs++6Tfkr2FPWmgYM6ELG5OXuAAsYWF+iww0K8En6+bDqsb1hzJbPQWvyQpzts=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkPM4v7La7Ig2CTc3FFEP5lqhEdSIkPxA5KGdKnP9+3E3PijNe
	LkSK+Or0iII8mtOcn4gq/Lxxzu7+Ys6TIpubpbl1IIbEmR2niKur
X-Google-Smtp-Source: AGHT+IEp9bOA281vLQrsc4XSGHi0S4IHku5gEPv7cgaQvldLdqUXIgZN97R24MwtxSv6XvyxaM4FUQ==
X-Received: by 2002:a05:600c:314c:b0:42b:a88f:f872 with SMTP id 5b1f17b1804b1-42cadb699b9mr93432435e9.32.1725990861261;
        Tue, 10 Sep 2024 10:54:21 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:20 -0700 (PDT)
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
Subject: [PATCH v2 02/16] media: platform: rzg2l-cru: Mark sink pads with MUST_CONNECT flag
Date: Tue, 10 Sep 2024 18:53:43 +0100
Message-Id: <20240910175357.229075-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Mark the sink pads with the MEDIA_PAD_FL_MUST_CONNECT flag to ensure
pipeline validation fails if it is not connected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

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
index 9f0ea1de50da..db48118fc817 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -217,7 +217,8 @@ int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru)
 	ip->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	ip->subdev.entity.ops = &rzg2l_cru_ip_entity_ops;
 
-	ip->pads[RZG2L_CRU_IP_SINK].flags = MEDIA_PAD_FL_SINK;
+	ip->pads[RZG2L_CRU_IP_SINK].flags = MEDIA_PAD_FL_SINK |
+					    MEDIA_PAD_FL_MUST_CONNECT;
 	ip->pads[RZG2L_CRU_IP_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&ip->subdev.entity, 2, ip->pads);
-- 
2.34.1


