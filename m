Return-Path: <linux-media+bounces-19451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 543C999AA16
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F11EC1F26AA8
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4041C9B87;
	Fri, 11 Oct 2024 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSRDJWbJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88DE1C232C;
	Fri, 11 Oct 2024 17:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667865; cv=none; b=sfm6bZLb2q+goN5DNyBt5vmkrWUFT3wJ06HrNZPNFsqJ7MgfgJNdkmcXrd/H4kLqMHInhfQON4wHjbGvCo25ZTBMNTd76ZhIrIkQQm3OydDRkRbqmXVCUrPWa28LYzLabFojVnz2VxsewczTsaQCC83TrRalOhVrrkvVq1nO2pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667865; c=relaxed/simple;
	bh=pcfgfWFO4/e6ngaEOYf/I9xYEAvOdCY1IzThYtqzqpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwM6w1uFny9qlGDTZIS7Y+nvhiMZWTC0x/Yl2/sRplyBi3JT0e5gC72oSiP2omAST4sRn/xLLy0Bk6VmZZW+4Z6YwuHCX8DglEzG4Mk2w0fgWa27xmRY5khQLetnhvrpJJXeiXNZjeEoMyYaXvEFsGgZ7tGAOMeUsZEJ6VA6eDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSRDJWbJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-430576ff251so19576615e9.0;
        Fri, 11 Oct 2024 10:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667862; x=1729272662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnzUD0XGwShtQYaTeIme9/Et1GdDQt24EpXyBbyJYVg=;
        b=XSRDJWbJ2/K7SqFTg8gV5Kh893h2NpMguf9BGKIKDqs3kEbXOpi8WtZZ8hnRm+AXwM
         lPov664BMHnZeBqeKPWpcHhGIjRrb1Q0/Fm2XEpdVyQWhvk6SrxQkfX0cyBtCjWy9wUG
         89NbphHvRRv3zrdOQ66Rf9LwleuP9H5qqoHLi3L2n5yyWVwJOsJz7zlTfNzyoh7DrnmG
         c+o1svJk3WdqxqyKwcZo+E1PsXmQeNQyq3ms5o0vMFOyG5+c1Qw0qecJuv9kEsEM4LeS
         959u6l4J78sZsL0hoCgBP9C7bX8Sql74Awm225Y76x4z6H/Ze2cA5oV6VkcUEus8M0qH
         fv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667862; x=1729272662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnzUD0XGwShtQYaTeIme9/Et1GdDQt24EpXyBbyJYVg=;
        b=Cg5fu5anaMjAQT16q0+2q5g6Zn9om04mml98l2P1WvTs5H0sNidKKUNpdItZrrbuZv
         Xgg927kb4xprvpM6CAkD4uKJrEomGorShDSRkCzJT0KnbhIiexl9sns+JKKXhKyokqJA
         6SeHg1dQbYl+qJ19Yvtj77oryNGqGV7JlP9L9jcDJumVCYqMr7pgDT1nr9ad4rVI4Q9d
         TqNW9dmVLEH3OdxEtRzLW81KKBvsQvgI+iOdiD25qs8pzPcsrTwPNxYu5icjWJNrJ3A8
         6qWG1zOj+JZeuV2woI1tpS5kbldY8/94gPdILSz+HHHQlBTJQdnAMrIHRxq/Ulrvqo/h
         vjFg==
X-Forwarded-Encrypted: i=1; AJvYcCV4nmCzNL5c3zBtBDOP2eAPjlG8+mp/59qwxIDKjlxN6lR/R5RZVM4tdFNnthh/3lkP3cxqQ7YIKFqdhAo=@vger.kernel.org, AJvYcCX1Fwb4S1sxElO18SkqxrfLzhPjVMriQ+zYoe4K2DCSvvJhgyHe7oBaMc4gbT9z0Kvq6fREHYAQ2idBcOaPxe4tgi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHZPw0ypy723D3GXpqh4r6oPY+JF68dL2y1Zawp/5SatFCt/Uv
	21Ur3gwOc+TwmRAgObyH72zdkGN0v56cmYZkp3bHV4ar4uxbyNWWFQlbnw==
X-Google-Smtp-Source: AGHT+IGpRSEv7gmOKl+6fdtA2iLdECckBDXs+r0Xa/0VyX8y4KYo0gkNLQrwO7bWGLiqFk/VaKN7qw==
X-Received: by 2002:a5d:4fc8:0:b0:378:89be:1825 with SMTP id ffacd0b85a97d-37d5529bc9fmr2458173f8f.49.1728667862018;
        Fri, 11 Oct 2024 10:31:02 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 03/22] media: rzg2l-cru: csi2: Mark sink and source pad with MUST_CONNECT flag
Date: Fri, 11 Oct 2024 18:30:33 +0100
Message-ID: <20241011173052.1088341-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


