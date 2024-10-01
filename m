Return-Path: <linux-media+bounces-18931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B24F198BF22
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A62E1F23F62
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA301C7B76;
	Tue,  1 Oct 2024 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjzRbZdI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5221C6F6D;
	Tue,  1 Oct 2024 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791783; cv=none; b=LNDY338mG1V1FCicB7kXIyRXCsgXKrlZWQaKq6GUELg1CXhs8jyVlivG8idd6XCe+5upejQAQ+rTWHZgSDEF+YfUCkVZ6G5wV0ZMR9IzgQxw15OfdIQ8o2ywZe8APkYanJvYVM7Zis5eQSS7qWlviMpSuaXA674huCtpUx34axw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791783; c=relaxed/simple;
	bh=17XOngcZ2uXGlh65ZO1mcJYxR1kSWX99gHpZSQNi+ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+4UDs04R9KhypjfUj3tw73YiRvQ/8ImocjsxZW2cRQkT9rJwcK1j9eFAqUCy+cwahTlmPDmynqTaSw3a5CSXK/6c2aep7JWZWuNZpMQVzCfrRSV9qKAFO2c6jc7PBPO6N+tMi2N9FiwUk094+BepQBKWoEOQpEdeNEDoHDlGAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjzRbZdI; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d43657255so57132066b.0;
        Tue, 01 Oct 2024 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791779; x=1728396579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4o3ygLjGHGZxajheOBKFoAIXpSBd6wFmLueJRnOZSo=;
        b=YjzRbZdIM1mGFcSalGXsaUQ1VQU0qTtLLJWLhIDRzMJhz7E5UhBI5EpC7GO9uoXSkh
         cMvaGcY9aTaDDVulTs2vKwVwqvtMr5M3iYnlQHxThiqrihHCAyqyP0Ll0ZL1TGA+rxW4
         ZF13eoWE09lOACJAvx5vH9aP4RFBRG42bDQYYyv7dGCrjk2ajLacijdoHChN36mwA28w
         sr1MHbFZVfP2pJmDt4mnDMzNwt8ta4r1PEylCpzcMm+cV8LLpaNNplNw1A7gh1q50RqI
         6lSEn5EfafdLpt5WMj1C4OG76nkW2DupD8szwFuu57yJO332nXY8RkVI3/xCvLZyk0yQ
         VrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791779; x=1728396579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4o3ygLjGHGZxajheOBKFoAIXpSBd6wFmLueJRnOZSo=;
        b=wcwtaE0SVZAm9MPSj5qR72MDl3EFckBI1o5LfW15xy/iyoUSuOia+ZjsJxpYRS0s3v
         8Os6Yo+RKgtjSBMtq9An8zDKC3Eke8cw+uihnwiSX+mAFiFrb1ut9JwjoyoIm9/yDdK2
         ENnaMKwxt8xUz9qQjkwEhV/Np0MgdvIX4NfrYgLCiX+yOAM7k7+eJQkFtP4ZOiYz66HB
         fccqYqmjlNpxO8BidAei/NRW2uu203dX5+eN5LSE7g2wo+BzhGaztxnFEnjbNnMwTJjW
         tg0Jgp708QRau7qISBDZjhFCNtpcM1Vt1K/OsmAhyG+DwSk3Q2MgofqIQBgt9r5J5wH+
         lAoA==
X-Forwarded-Encrypted: i=1; AJvYcCU9tAOJUjs1pJlXZ4Uy66HooDerV4zKGxgkV1+ZvCiN0XfEmOVl8DF8lprzI75MnZr1nUVB1i/kb8haOYo/9SvQi7w=@vger.kernel.org, AJvYcCUiYmYmc/VH44YSLwFPm0iqksqXq/0IAVB25WxQQIjCVXHcFG8660U/MdSAALI/vXP2udTLGr4zgXj7IvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1za/S0qUwJqJoEhvNNEUIqlasDnnCagEdr4r8h4i3yCUegW7E
	6TAQjuavgUuel417HOEJAnTuNdAnMsz4bbA+09fgeMxp7NKw8G5W
X-Google-Smtp-Source: AGHT+IGxO8XElrrFKkSpquWw6huInLzB8f5GrfUqgAB8sQJzXpeJKAeRzZTGQuYJSEbIl7uJtpMU5Q==
X-Received: by 2002:a17:907:7e8a:b0:a8a:8dd1:b2d1 with SMTP id a640c23a62f3a-a93c4aa4640mr1272893366b.55.1727791779224;
        Tue, 01 Oct 2024 07:09:39 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:37 -0700 (PDT)
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
Subject: [PATCH v3 02/17] media: rzg2l-cru: Mark sink and source pad with MUST_CONNECT flag
Date: Tue,  1 Oct 2024 15:09:04 +0100
Message-ID: <20241001140919.206139-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
- Added MUST_CONNECT flag for source pad
- Collected RB tag

v1->v2
- New patch
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


