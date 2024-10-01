Return-Path: <linux-media+bounces-18942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEB398BF47
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57794280A87
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232DF1CB501;
	Tue,  1 Oct 2024 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrWc7kGb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CC91CB30A;
	Tue,  1 Oct 2024 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791795; cv=none; b=Z7Ni7KL2NWoSLKo8TDWRSJ7vmDvzqtoJD1h0KpdOqFzxyDXyoAEaYIc5OPK76Gfx/PeTa5DqlsAxa5oXyg+UTDLmZ3Oyc3l0XYKdrvvx/NvZHi2/k/HYyVjCVXaeEXvxkBYNlpz+6F56zyALKJZSxlEMggC/iT08/tCoro49WV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791795; c=relaxed/simple;
	bh=evPL6jyF2BS8feV+jWK11x1gxcWi86McPDObsxXJbB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XdE0UAvf8f6nEyqQCxDxmw1MDjNzgTUq39YeFM5cVnAqLBbt8Q+C5edUaHbl4rIoXZ+M4t+Xa8Q7L4Q68E69VxoDl3GaKfqYseMitcK4lTnkbb6HVIbkjhqFExEvVQyMNmjlFJhOLP33iDxh8ze5F3Y+LAS/YBmoYtzEP5cdpfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrWc7kGb; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso1038353666b.1;
        Tue, 01 Oct 2024 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791792; x=1728396592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvT6BvGeyDrFDQpFtVyrCYvyK949r2xvbxa68QlOZZU=;
        b=WrWc7kGbHoJTSG0f1SCZBZAnB8ltMf1iyKrOJ84ePfcNBEiSFfFfnQEWxpmweOi8FB
         a+A4o38NEXPDRsljdPgGJ91aqPdyXgkQye324VJU0AqMdAa1ZO/PaEje+Oi88VK+YyQu
         8jKA7Ez0YpdwCt6J0za7PzWd1HpBiZOQNAOQkF3P22czbhAENccOtys071/5tk2Jme09
         FsI3jarnaUv/whuGqflJm6QUCcCO7slaU7GBMpBTsAJjdmi6lLukN6NdXfURhUrxrVSl
         ilDYBJ8kIPnTsoDKtNiwJPLNCg3qJKwerd7Q6pU0zjPZdVhL5c1Kydrwp3BZPw86JlAZ
         QaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791792; x=1728396592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvT6BvGeyDrFDQpFtVyrCYvyK949r2xvbxa68QlOZZU=;
        b=iaJt1zWfLDanFswiOZRMZ1zY6BucTJrKhzFN7ho+s/iw5R/aG+P2JPYtmJ14rgyW9i
         fIoEFMO776nAABlgftm68OQnkKxEO/d1+UnD2jrrlvIlEVPZxAGXOYG9z6FEBuTly9fY
         pbsaobnSdxdzRHpFF4WGxtXmYNoB/GCyBJCtPli5es6WmSq81q5/yV6kBM6MWw8ZDZRa
         3Ffzm1DZU/F53jtrxOVxTi6w3OsZjKkp4BoJuVi4ERP5Y80GxQyCcIKji3P4dcunpzN4
         jhGCxcWwiIsW3kjERcCdux2b8RkSwlDLtplSs6DjHuCdCrxEPsQcFM1Oy16GwM8ULZqr
         Lrnw==
X-Forwarded-Encrypted: i=1; AJvYcCW7fIXBh3xtfjxS0lar0bKjLiCgUFHI3Y8rO1loG2fUJjLnwWKOvGggc+Sgrs96+D/NxEvQfoGaNlgBCnY=@vger.kernel.org, AJvYcCWMGgntP98cCETW3T/QF/hzyP3OVSGcHHWiHjXCBqRqzle+Mk8Wsk8up8ARp0YVUzFkaVYnoJ7ZZ1/3PSLml39I4ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXBxqaN4PpmGQDL0RZ6+S2OOm2kcDGrQIgvIjFF5NWgk8zRxLL
	2z8kCMCEj9369o+PjtrMtrXHexpuM3uwTFuwgW3ECAUcCrd2zMOjWpkohA==
X-Google-Smtp-Source: AGHT+IGZYInbdbNc/IayUv1EsYZlQn5qfguSM/LIovw3lbVdcY3p7ZPaogDFKAPgsilVsXWan6bgcg==
X-Received: by 2002:a17:907:9454:b0:a77:ab9e:9202 with SMTP id a640c23a62f3a-a967be75e1fmr405570766b.4.1727791790866;
        Tue, 01 Oct 2024 07:09:50 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:50 -0700 (PDT)
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
Subject: [PATCH v3 12/17] media: rzg2l-cru: csi2: Remove unused field from rzg2l_csi2_format
Date: Tue,  1 Oct 2024 15:09:14 +0100
Message-ID: <20241001140919.206139-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Remove the unused `datatype` field from the `rzg2l_csi2_format` struct and
update the `rzg2l_csi2_formats[]` array to reflect the updated structure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3
- Updated subject line
- Collected RB tag

v1->v2
- New patch
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 3fd0be6a3b65..7b76d495cfe4 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -183,12 +183,11 @@ static const struct rzg2l_csi2_timings rzg2l_csi2_global_timings[] = {
 
 struct rzg2l_csi2_format {
 	u32 code;
-	unsigned int datatype;
 	unsigned int bpp;
 };
 
 static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16 },
 };
 
 static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
-- 
2.43.0


