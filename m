Return-Path: <linux-media+bounces-19869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBFD9A3FE5
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAAAB1F24C88
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C332022EF;
	Fri, 18 Oct 2024 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYYlkYIh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029B8374CC;
	Fri, 18 Oct 2024 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258508; cv=none; b=hcG+y1Qe8jrJYGNoIYUpVI1/lLA3AD75IAVZZRefzm0eT2zDD6gRN4zTgHeOD716JF31lNUEZ6dky2nKu2v9LeYz4YQCr3xJO+FAE4zJT2RxNotRXJYM1XADX6WdBSSpB4hSQx2grWu/cqfq/WRGLIEja5pcrPNm66bmOKRikwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258508; c=relaxed/simple;
	bh=C1qUYYuRnWzN0Zz7CliMFvIfZZC42AzyLPIVnw9T4s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FGBz6OyDnJfrHQe/dB1tvcUBKgFMG25/RyFkxQQdDMGyRnpjzzWK0bps8eEvvoVokSYzFQlHPO2+Brwy2u2wJugSAsUhJ+h4QUoeutvAYit8tmo4PruzXreL4yHVwPXfQ34Et1PpRREy0CVTDH+YTLPt7kIGgq5isQ77wBfm3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYYlkYIh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43158625112so19957795e9.3;
        Fri, 18 Oct 2024 06:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258504; x=1729863304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WL+Bmul59N0MJqBB8bgrzNdSKYlWKVm6sYmTP9eyLfQ=;
        b=DYYlkYIhOoJM7UyT8966Ktpby0TCprqw+D7SJsYKNh0TIIPvRNUav2yxAyBCJwmVFf
         g6Q6KZRFU9tcfaKNDse03XPx3okUOnv/hgzAM5pKsxxGA5fcoxn6g+JW6BOvNdJQ/0cn
         kjSEA1TangiYmHtPlChcP5F+76Tkl2rcaHC8rAhs76P6dr790bXGBSt30Q0Pq0XJWDAx
         Wyft+6TKcHsCMHzTM4OvkVXt4yp0OQiXGaPNCmk+w6NjcWqcTrPpWRK1SDMHFImKacmi
         KcsoaK5LiwYd0fGhgXmkbXBy/e+8ynSTumLDfkmtVPqTlg/3Ig4Ov3O4yN23Xz+lZJ6H
         zHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258504; x=1729863304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WL+Bmul59N0MJqBB8bgrzNdSKYlWKVm6sYmTP9eyLfQ=;
        b=CJPiFsYWoSw4ZHWmv657f8BV5+K7YCmUpp/DvXS9paKofMIperxiAlO8H7rP4upW7l
         g6ITvkH/BTiWKKzA6SY9M8gbtT7YYenqGphjm6GD7UFM4klIeyG5aXcJDR8BAXz5ykYQ
         DaPLZKdajak6kb27UzByHmuIL7nA5qaIeeGDhMuGc+IQHvH8x9vsODLfyuYRYB1UEHiV
         y6Qd7RAldIBhq/2SSV/x2h27+vgbBrRDBFKjWH5aXf1dm4vT/o2GQXe1RSDEBv69ywdU
         ThbOPMsowuX/yYDwnYZN5vMwbOS9YqeIxIaAsFqE9eGDbABCzt9zbI4c0vQ7SqSKfhXI
         miKg==
X-Forwarded-Encrypted: i=1; AJvYcCV7AZszbITjKnVVU2BwPMtKeO3TpR8n5gvnryswsX7eUDoB9kwYNIHt4sSg7aI7dAZSDTQujzc4rs6e+H4=@vger.kernel.org, AJvYcCW9s0zQdTRdPQ0JYyZhP0dysty/5nK8TJvqbXxA47VjXiDBaUuFegvm7raaasIfCWTJPmQxFQ55BbJRp201BWjokR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBSaovOzhO7x2GAaB/rlLzKQpZh5YmURMLKBIZhr2hMbZumcxG
	Zj+X5aM7ewrfJLePKSbPZzLvrGWZvBSfdwW7x8KlfVJfH9yDNfS114cTPg==
X-Google-Smtp-Source: AGHT+IFohn/9b+GBpybbjuPTY0wePe0Xk8f7ewlj7wjB8K04lcdeOXZy6DpC9lhcoE7Yx+n8y6YVeg==
X-Received: by 2002:a05:600c:3553:b0:42b:af5a:109 with SMTP id 5b1f17b1804b1-431616a3c1bmr19067205e9.24.1729258503796;
        Fri, 18 Oct 2024 06:35:03 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:02 -0700 (PDT)
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
Subject: [PATCH v6 08/23] media: rzg2l-cru: Use MIPI CSI-2 data types for ICnMC_INF definitions
Date: Fri, 18 Oct 2024 14:34:31 +0100
Message-ID: <20241018133446.223516-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The INF field in the ICnMC register accepts data type codes as specified
in the MIPI CSI-2 v2.1 specification. This patch introduces the
`ICnMC_INF()` macro to use the MIPI CSI-2 data types, which are available
in the `media/mipi-csi2.h` header.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 9ab7ef33c9da..de88c0fab961 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-contig.h>
 
@@ -77,8 +78,7 @@
 /* CRU Image Processing Main Control Register */
 #define ICnMC				0x208
 #define ICnMC_CSCTHR			BIT(5)
-#define ICnMC_INF_YUV8_422		(0x1e << 16)
-#define ICnMC_INF_USER			(0x30 << 16)
+#define ICnMC_INF(x)			((x) << 16)
 #define ICnMC_VCSEL(x)			((x) << 22)
 #define ICnMC_INF_MASK			GENMASK(21, 16)
 
@@ -307,12 +307,12 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
 
 	switch (ip_sd_fmt->code) {
 	case MEDIA_BUS_FMT_UYVY8_1X16:
-		icnmc = ICnMC_INF_YUV8_422;
+		icnmc = ICnMC_INF(MIPI_CSI2_DT_YUV422_8B);
 		*input_is_yuv = true;
 		break;
 	default:
 		*input_is_yuv = false;
-		icnmc = ICnMC_INF_USER;
+		icnmc = ICnMC_INF(MIPI_CSI2_DT_USER_DEFINED(0));
 		break;
 	}
 
-- 
2.43.0


