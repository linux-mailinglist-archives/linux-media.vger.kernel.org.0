Return-Path: <linux-media+bounces-18129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBE0974156
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E66F1C24EFA
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2608A1ABECC;
	Tue, 10 Sep 2024 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lN9n49Dk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B6F1AB535;
	Tue, 10 Sep 2024 17:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990874; cv=none; b=fscyu/5//w+4RTFgkeiePvjEMliRLwsxO0vb2sPuxURHNfteC3xWq60oLuxAJrUViDNLn7x1tNF2l+etipLgcrrRmbUb4Hb7YF7Ud2GMjuV2vcO4EKZ4VKfifCGBZj9ubdJtT/00l6sDPQCgdu6ZvhZNj8z/UsKRJsGHOH3wssQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990874; c=relaxed/simple;
	bh=mUUW33nU4rnskWaWHErFoUtBXG/2GUtHTWuN/3rZSgg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UXVsCc7kuRZCbUU4Gr15JJRs7I4quxQt1qkXsN4IPMpfqT02qYqL/q1y8IRyTGESwGDo3I704Aoi6wDEIt42CsQFRM13klGBvNddl4k3vycJtwnvROk9QEQ0mKehyPZvi1NmwaqPHjyH5og97ACnVJpuAIXdq9JJoGDWayxMDgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lN9n49Dk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so10615905e9.3;
        Tue, 10 Sep 2024 10:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990871; x=1726595671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhIJbgVG4vXLXIA1ruCJBKWynUkQGlZ1u1ic3MfgJss=;
        b=lN9n49DkEJ0AiL+tfMA/1AQ7HUsJu7uSvSscgpyJqoh9tX8yDRornRUIvZusT1eMgQ
         aqw+o8C7KT4qWld/aRT6zwa4+zlGUYJ5mTpP2+7/t54KeAFNxzHOPb3gB8bGmYSBzrdm
         O6+zAYicrYpOh0Vhch93o3/aVakb/5Ct6WGmVvwgaNiBj8uneuwhUnZOD3BjlRhu9aZF
         cTGJnuChccZ97/rebVgtH1BfxpFmRw7HOTwUsGJ5rKdEABQmUkUBi+E5axKCIrSKRPe/
         MYA4ADbX532wGD/18bMGgvw/cIUDnIXgEBh5+GrQGZ9hU6yteBesj0fthEZuFTQ4q6D/
         31Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990871; x=1726595671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhIJbgVG4vXLXIA1ruCJBKWynUkQGlZ1u1ic3MfgJss=;
        b=ikxUUoXuQ7/A6IQYhBdvJ6UyWETvAypmu4FJyV3u+6715UJlsOn6ZUxv7iXebWSRTc
         GvIEyCdVfN05sIM/vcAJN1V9a97QGQyFUn5dqhVoA6XSLbvCltzdUCnsPSvS13TXuus7
         WWQz3fOsmVREbUN4riPM73h6gRzHTglZlL1SYcuCFPgf2WlSvdNaFzjCGI99UoKMmRQ6
         kGo3706u4GU02o7CA+4BTJD6LctcXq0rv0yPAZsIAJ1S+kwKhxdcR+KAsjkaomcA2eUp
         2GaJKdLxEC1y5LO7sWVLx7BIiuSBnv0DBBf9OEW20j1rRhmbX+OWudD/wXHoKFr/lDpj
         Yspw==
X-Forwarded-Encrypted: i=1; AJvYcCU5hgdtog0ou8U+q6T9mGbvdICk+auiM10Q2LTt5R9EkpJIq78yFScCl2pxSbe7zl4qekG0dcHZ6SRBzhg=@vger.kernel.org, AJvYcCV/4LoKYzCO82fr81gt3Sa/HMAa1NziYuTzx3y8nTprGA8+SQZciI4ZKnVzYm8QVP898sOsqn1X4uM0MEyatcBpQLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwjRXxiMc25UzxVB6BXmrzlO+KOm33nNdwxKhlJrU5XOC0OrJK
	bwUAbdeOn1ronW3tHsIoO/mKuo9oNM97MQQygPs6n3Mvt9FKROZG
X-Google-Smtp-Source: AGHT+IGAf0SNtFSIZWMh6pXRjMc+FPAnuX+FXtORL/hsmUPe4nFy87KLOUnlrSMRLszulawHzrky8A==
X-Received: by 2002:a7b:c858:0:b0:42c:af06:71b with SMTP id 5b1f17b1804b1-42caf060978mr80409155e9.28.1725990871288;
        Tue, 10 Sep 2024 10:54:31 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:30 -0700 (PDT)
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
Subject: [PATCH v2 11/16] media: platform: rzg2l-cru: rzg2l-ip: Use `rzg2l_cru_ip_formats` array in enum_frame_size callback
Date: Tue, 10 Sep 2024 18:53:52 +0100
Message-Id: <20240910175357.229075-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Use the `rzg2l_cru_ip_formats` array in `rzg2l_cru_ip_enum_frame_size()`
to validate the index range and format code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 2d3b985b7b0d..c7bc82bf3f14 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -162,10 +162,10 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index != 0)
+	if (fse->index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
+	if (!rzg2l_cru_ip_code_to_fmt(fse->code))
 		return -EINVAL;
 
 	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
-- 
2.34.1


