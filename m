Return-Path: <linux-media+bounces-19864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7FA9A3FD5
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBECF1C23E12
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D8A1F4FA8;
	Fri, 18 Oct 2024 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laohAVbp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB2B1D7E57;
	Fri, 18 Oct 2024 13:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258501; cv=none; b=Cdohc7wlXOEle862Jcg35tRqvq7Qkr0yiYIVFJrOxpaIh1pUkEnw8PdftV5CXtpnKBmO4O5R2G5oKFH3d+2d4x3JHCgNe+XZuamhQfbw3+7V225Ql52DTSfPbC6HcPQ/aslATb2T0FtNt5ICr0UdYYQ+ez5ZVQ/lT27K0zb7X5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258501; c=relaxed/simple;
	bh=XrZ0Y9voLBD//Xb3HNxBf04kB84TJPdYukCdenkpZ7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2eWblq7CeFNrPPHXLyzvuUd4Ixr6WnZ+6uuDfq1zO7v36Mhsbf4E+CZfs8fs3bn1GaRU5ghyHfvwfWLBhurRxYHWONtuFw7ml83/TjldKrZLDwtSNroWskYr70ybtFdPBmMATcW7wteXmPWINDigGs3zi57jfzq3uFuauYwZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laohAVbp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4311c285bc9so20983435e9.3;
        Fri, 18 Oct 2024 06:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258497; x=1729863297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkacEOlSZqELBxa5jdq8M4LStax1MjtHMjdYa4KcK14=;
        b=laohAVbpbNxHsid2z2TYwci3qbrNn747hIRipgN7AxgyWWP4nsqAyNkQTKwSfFBq0I
         XthsBSj08NdZJuWPldLuyWAhl50EiimBG0hsXh90GcCyIcJYWP0ZyVhynGZGBaV6RXpn
         onFiTYI0Mcy9LZqPKv2+9xEaEgFjUMnK89ax2/UwBevkUuUX/3yokQB/bJMTtIRE+jea
         GzbQ8YIwjujnlB9M9VbKZxz2n65xAGk7/38H62XEwoXAwrxH9mgtdE1ha7kBLaI4J52C
         Kl6UH7uiK/oOTRc9L9xDAA+KxPnWAlJuf1XTQ/nOPFKnQWy2PdH+5e575MIrOwg7xfmc
         sc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258497; x=1729863297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkacEOlSZqELBxa5jdq8M4LStax1MjtHMjdYa4KcK14=;
        b=RkkLhbUihAlvffX64c+fY1cRHyZ+OnVljtZ6tW7h5+lEw8fzWQCO0USk+Bcpb0RH6C
         zw/pAkBfm99irwBSEiLwDd/kbTryJtgmocY8xQtjVzHVaBoU9qmIheeeqPRqop7ItUIb
         LcnUW0x1zRDhQht8WXMxkoPMvS/qmvX7MB8c9YQ3gEST0ohSq6bF2CcVKqBF18zEO8uX
         a6mIsR4iio8Ds6A8f3k0dcMK8Ov0eSFtO5BaBGr55C28GaQiQcqeDXb9Ttn10EKzH4de
         KoQA16XLAyyp6NLpvQd2d2y3EwQkWcaaLM5rtUGkdDRX7cZFsoHwauQgT3e50/DcQqrh
         OwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSOpqSOtbtjEiAfgx2ZD/cMTUy/hzMzRoWf4d4eW9dxS7x/lSpQd9YZNw1uMLufI6kkoUpJrbb7uHADv6T5F3Gl4w=@vger.kernel.org, AJvYcCW7YeQ03gME51BFTUn1FRYRwxruVrJAbbo1iJWZ8ov+obkIIKjhFtwnAd5BpUJxmZ1KH13s8yOa4wwZtjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTq1f6EVE3Cctziw6+MWeKn2Pg3I6EIk/XdI2B4DZeNgzWd18u
	whIhWgYu4mzfW3j8Pop517cg9QlEwbt+VrCBdri8rW/KeS4rkmzF
X-Google-Smtp-Source: AGHT+IFb1Xc7jD8lTtB0gEzO7sa4Jfk7Hk8eKa1bZfr83WBKAU47jibQJZfAQeh/Z2ZCfWEA7Zjemg==
X-Received: by 2002:a05:600c:1988:b0:431:59b2:f0d1 with SMTP id 5b1f17b1804b1-4316163614bmr16432895e9.4.1729258497197;
        Fri, 18 Oct 2024 06:34:57 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:34:56 -0700 (PDT)
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
Subject: [PATCH v6 03/23] media: rzg2l-cru: csi2: Mark sink and source pad with MUST_CONNECT flag
Date: Fri, 18 Oct 2024 14:34:26 +0100
Message-ID: <20241018133446.223516-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Mark the sink and source pad with the MEDIA_PAD_FL_MUST_CONNECT flag to
ensure pipeline validation fails if it is not connected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e725982c4705..b6a118ce9fcb 100644
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


