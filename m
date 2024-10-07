Return-Path: <linux-media+bounces-19172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C699369E
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1F261F24AA1
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1CF1DE4D3;
	Mon,  7 Oct 2024 18:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMIslS6q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1101DE3B9;
	Mon,  7 Oct 2024 18:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326934; cv=none; b=Hsv4pDVH0LZsXe2b5inzmzkGr5DqX/WZ6TN3UkAu7fUvi8if4uzxNpPenRyd07jKYPPnCG31S0RkGRlEJFaps5XzsXDqDP4hj9RbB/zirWAx7ntvPsQd1akPd6MLBzransLCTO4kypQHIEhN9+CfORYP5VYw7YgZoF+3HfdWcuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326934; c=relaxed/simple;
	bh=pcfgfWFO4/e6ngaEOYf/I9xYEAvOdCY1IzThYtqzqpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kaI81F7HX+l8Q+m17cFozprPCXdGq9ILrPq/jEAIKJSibPNoG6aJJEB87GOLtz0Pk2wNlzJEvTEgiluw0vIQX6CctE0yzZ/6r9X05JFowTgog7QeMYny1Vb0olIkOfjlbQ3rjs5XcPyN2bNohf6ztYcgW5N72CbVCeN5Nrx4ew4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMIslS6q; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so61510631fa.2;
        Mon, 07 Oct 2024 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326931; x=1728931731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnzUD0XGwShtQYaTeIme9/Et1GdDQt24EpXyBbyJYVg=;
        b=TMIslS6qvdTy8ycGEvQbFuIBH7yqRXWwBhSCqS/uUV8zu7HxRTMX8qBVB8Vp2K4Gmw
         7qhCsOLyTO5vNFVv4YZBOeE92a6oAayOUFQqVTuhg9hvXj6SrOPlIkixmy5/W9YKE1ib
         MmfNXjSVkmEsC9aKbz5e7MUV9sG6znTy4bFj/r/8wNDite2izFtchu633jGwPDTkL7Me
         7I0ZKjKTsfxbinaKRFMQSYP9etdiAT4Qh5wCOyRFbPD4pbw4vRWJnmldA7TxQEpez6yZ
         CF6TNr5ayYX5y7rWJUoqIrYId0zaVZit45Ykg6O6ZdKmV3k/i3ywgAAfYGpbmEVKyzam
         Bzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326931; x=1728931731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnzUD0XGwShtQYaTeIme9/Et1GdDQt24EpXyBbyJYVg=;
        b=GQYRtDDsgGmlQZBMn/uAitzwHJOxcC9qSHfiatuFguY+l084e6kzpHnRbSOw1XQciV
         ZtcYDnzz46oHN6VARxQ5vWEGOTy90YKcIv5Fl6AbLkXxNJcZnRVoyy7abJYEd+keBuCY
         QsNTUSNZihEkEMptVJDKjiSpV8EtLWlyH0K0Q1UTHnzn1QbbV1n7YqgpazKlFsZ0cz+T
         MADyf0cRDh9wbGKJewiR47nBVfIanLdFVpTV+lBVFozYDSLr3Y6qO6/9DRFVlW8iMa2q
         CKDTdU7+e1WKvPU7I4JTSbcBpsqkxI1RRkk3OQfe2oZItMVLlcGUvt/tiqlrBzmVRhdS
         GTgw==
X-Forwarded-Encrypted: i=1; AJvYcCVTEfh5vvkk2YcPmQzRmiM9rBCQpP9NHSNeLJDoRUsXbyGQKjE6wGT9ddlmCbqozivsDGgFDdkn+dTjpc8=@vger.kernel.org, AJvYcCW1p6ujN8ZXxfXLqYsBEPt06ubutuZ+xqeM0n8iitcNzasJet5JkfuYcJaark1QDABLHW7gM6H5oAcLGCmSHU30rXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztm19lDc7hTuMlztN1Q43C09xMN4mPhQesWjlN5tlXlqewWN6L
	Og+FrX6Z/2fIUJJqhYGoEaixZObF+CInIn93h53UBOumakKr2gWk/raBvA==
X-Google-Smtp-Source: AGHT+IH/WD2cSCcuj8P0IlM3sGYJSHWtZIWvG7uBp9BOfO+yMceLT2XRBzbHtHxjIgB3XSJmzmWklQ==
X-Received: by 2002:a05:651c:19ab:b0:2fa:c455:23c with SMTP id 38308e7fff4ca-2faf3d79741mr87322741fa.42.1728326930536;
        Mon, 07 Oct 2024 11:48:50 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:48:49 -0700 (PDT)
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
Subject: [PATCH v4 03/17] media: rzg2l-cru: csi2: Mark sink and source pad with MUST_CONNECT flag
Date: Mon,  7 Oct 2024 19:48:25 +0100
Message-ID: <20241007184839.190519-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


