Return-Path: <linux-media+bounces-18126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA097414A
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93B2F1C259FC
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE1A1A4F2D;
	Tue, 10 Sep 2024 17:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IM71dfND"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C981A76DC;
	Tue, 10 Sep 2024 17:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990870; cv=none; b=bQRZRnH9fNm311EMxJVD4nE3OawqrEdz9ztKObSezetMN4MEl2aVWV3tpI+GhxW47sb88/YeD+OHVK/f2w0ASOJTe0TOIdLiYPyu3JQQWiiBmLCMq5jYcYrY2R4MpUh0anIT+dwdbvHUPdb9YaFZv1RLbr47fdnkIG73IjzfXaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990870; c=relaxed/simple;
	bh=IIZrxqBWpBualEucrvRbwq/W4kMtlIGisufKS9Y7Gp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tkOWMP3silBX1urQdUUN5xpmMMRBsI0nwLNDPBK0d1oJDRQ6Hu/15pzDivvR9z3SPi+BOeGvLTSnVPYV8mxOaeNpW38FJS85V96xDqn2FcgBFLUYZVNB43zlgL0oObsikRfB3viJav/mIx4afvRSPPjSpNmHWjC7Oi0LtnmqhK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IM71dfND; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374ba78f192so3515133f8f.3;
        Tue, 10 Sep 2024 10:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990867; x=1726595667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3MIdF05wW2BMzr5XjwUwLKKt7kk8kOEADyH/19j9Ew=;
        b=IM71dfNDKP1y2Yb8SLWYrBe5gx1dvbOk1XqEXDTOAt2Ems8zA185KUCYOTgTq2/QMx
         nnQGU/grZVe6WBxMv9zYgcVlj1OoOZG05g+s8IEz0S/h1xIKjaPALD6AKWmSi3dMqVxA
         xRSu/p95loHma4Wds8PrcT9Zgm562fb47B7l92PuTtsTULYGlibWvKbp5bpEaSF76WO2
         dIahubXB95BV9V8pxS0fwEGJEB8WgLH9Z8AsFe/W3LPKhbsez6iNPFVdMzMUgt6B07mR
         0a3uuUHADGFo3MLiXTzBdB7mQQV28hL9J09QinYpV/3UCYdKlp6QErRzdYRe7zqrqB00
         TvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990867; x=1726595667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3MIdF05wW2BMzr5XjwUwLKKt7kk8kOEADyH/19j9Ew=;
        b=NYg3MFIjlIvHHMDkoqOclm4qhkqPrVK3I0vXoJ/o0shfUHSSL0SiHvZyBwidILFg0L
         Eg6ooNcjhP+gfD4tbAwSOW9s6qT/gbcwDt1zhewDKCAY7UXeWpwDWCNrUH9BdJsGlIk6
         +i1IgQ3fYFwjv20yylWgekieZsuO+uccy3VZlSHB0oOCYm2IHGnuFeqtIbj+FsqgK+W9
         mGqgfN2a7FSh79S7bT4C7ylUn+NZZzpJji5gh3D6ZT4ZypD+e3LvTHUMrIoWHBwjpOxG
         qBy5PK1jDtiWglnA/n+rvx9XwtQ5HS4/oq0OGgq3PegBW3qMCaw6ISjZdWHGi61VWNyH
         CzVA==
X-Forwarded-Encrypted: i=1; AJvYcCVuSN4WjPFfShrgtKkhkEUJfXBGBiTtuPe92Tz9OwnSekwDk4Wr7cTctQ2rT0fZh+GepzSmD6I1X7pcCv6ErAE9paU=@vger.kernel.org, AJvYcCVxCYqj1YyRGCRTrPWgGJxApCgIcai5aAOOwVe4oW2nQoaRxm88HGSx84ZHBC3V9ifldY9FqEGtoMmGiXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5fUXp8+phorsJTUgj0CqhCtIfyF6jg7mNDPzN5W9hBmyO0jd0
	zL2/BJgXs/j8oNbemhpctvoraTsssfLI0uLdaSoEG2q6PXDuFN0q
X-Google-Smtp-Source: AGHT+IHfXa1uX/7zmxiU2yW7apAdq8ipHyEjW/mGfPuhcxNrc5qH8g9KEcjq0Hyw1J5tdPivVCGKuA==
X-Received: by 2002:a05:6000:a8e:b0:371:8dcc:7f9f with SMTP id ffacd0b85a97d-378895c5343mr9965437f8f.5.1725990867275;
        Tue, 10 Sep 2024 10:54:27 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:26 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 08/16] media: platform: rzg2l-cru: rzg2l-video: Use MIPI CSI-2 data types for ICnMC_INF definitions
Date: Tue, 10 Sep 2024 18:53:49 +0100
Message-Id: <20240910175357.229075-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The INF field in the ICnMC register accepts data type codes as specified
in the MIPI CSI-2 v2.1 specification. This patch introduces the
`ICnMC_INF()` macro to use the MIPI CSI-2 data types, which are available
in the `media/mipi-csi2.h` header.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
2.34.1


