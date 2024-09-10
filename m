Return-Path: <linux-media+bounces-18132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C3C97415D
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67D391C23C31
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336581A4AAF;
	Tue, 10 Sep 2024 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i33bf+hW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B73A1AC441;
	Tue, 10 Sep 2024 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990878; cv=none; b=PZVe9bW0/Zss8d0+5NDH53G+MuqcvNIZ/6rQKqgtHTyHneV6zFgiG6S+NEGZXWDH3BKPyNEKk2tKptJtnmj+Apel4COx4MntK0qfp6IC6/cfv49xNNlWvIVUvK8WmLITTRXPeHH/r9E7J+wQCP9nrogegN9eETUWrvBoAc3LFLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990878; c=relaxed/simple;
	bh=lzxK5hox+fyZCWiXsxH3re9rjYjo+weB7srtiaRgcAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VeBc71isBUHxN0LUS8NkPIIhPn+YnCrCkIdtuKa579+t8DsEOv56grLvwnY5UXsiL9/oyoORj43/wBw4NPNejtghehrkOqIcoCC+ZAXtF1TKxkroBPr89oyh1GfjhkdEVMwEDpuilfWYPrjwUyKeMoTBMwT8VU5Jmm2nrASFW14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i33bf+hW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso15841635e9.2;
        Tue, 10 Sep 2024 10:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990875; x=1726595675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JR/4EdKCW2JPuHwI0LXuWMHFn99oxRnJuLKUXC8slUU=;
        b=i33bf+hWr2EquchfE0OKvIv5VwCs/anOTcIIUd11CB394wjDq0iCbX2sXhDzfQfs8c
         vUlnTslddV51mmvsRp6I0x6PAZIBb2Icca3T6b+IVp1rePw+2GWe3M2+CJCTUAmHWHlF
         +jQKlZ2JI8dvNayO3khAHbz6yE89EJgifaVj6gfN8OWcvE9+96Ey40jHCzE1zawBU/jt
         snrCGZukELKWCpESJeYM8kcUSD1X/ITC1nNaMRk069zDovhnrr+kq0/M1Bb3kpN1cvdw
         h7YCGH7LhIjXhcxK5UyspF0U/4jDzoZgziKGjIJ9anMxtMkdO89XHvsYWrcE0GnylBAi
         9NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990875; x=1726595675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JR/4EdKCW2JPuHwI0LXuWMHFn99oxRnJuLKUXC8slUU=;
        b=PQI0Z6Ve7j9a1glN/sJJgPy8a7TaM34ZqYI0zp3o2f2fNN8vDIxBLQ2oAxGrz8/2D5
         gUAE8JLZ5wwXsU0Xg7K5rAR2hhvBAyICzQaVGcRyunefjuvQJnUOJFNzZVbWtRCIQuxA
         dMmXywRu2YHTaDqMDB+7a7eXkUyg2bvHDEqEuf1//VfTtA1YuBedCIZUOkAew9Hkp66V
         9eme4ckCriUyrSb9tjI/3LJZYjuv8SePDEFL8COiJ55vLXj43yjMpSju0PM1BDM7P3UR
         U17IkFviIQzlmGCG/LFslfvnr4Hig0+NCmmNysWKbASEK+HR22+fMJ75tuI34PnXWYZb
         SeFA==
X-Forwarded-Encrypted: i=1; AJvYcCVcaUT8JbZzWCqYJov1SJ+V6fbVtsewFERDiCp3X3QYQpHRS/8Ah6HC6YIkiIEAFLNJfPJP6xEtDlze2CB8tXuX38c=@vger.kernel.org, AJvYcCX2FF7UlanOhP0r+vme29tH8mnuXNVkAP5GHpHU8yUhgb+A0eD920NZGqI8T9jNveW2gZpSS7vQeVQcq2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF6tJUktOL8wowZQf+1seG20WmzvO6pzuNmQe/Huz44eU/j65s
	E2MieIo1uAW26IIrLtRm9TUu7gfVa7ixOgjuUEWzVEhW33n2ihIO
X-Google-Smtp-Source: AGHT+IFYZH84e0tZw3pG2lJ71J8xunccgPaGCV1llsfHpV97rKTU7vYBkqS/0r2FprXfgbqf6oKBpw==
X-Received: by 2002:a05:600c:1d15:b0:42c:b9a5:ebbc with SMTP id 5b1f17b1804b1-42cb9a5ee47mr48778205e9.16.1725990875347;
        Tue, 10 Sep 2024 10:54:35 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:34 -0700 (PDT)
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
Subject: [PATCH v2 14/16] media: platform: rzg2l-cru: rzg2l-csi2: Make use of rzg2l_csi2_formats array in rzg2l_csi2_enum_frame_size()
Date: Tue, 10 Sep 2024 18:53:55 +0100
Message-Id: <20240910175357.229075-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Make use `rzg2l_csi2_formats` array in rzg2l_csi2_enum_frame_size().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 79d99d865c1f..e630283dd1f1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -570,7 +570,10 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index != 0)
+	if (fse->index >= ARRAY_SIZE(rzg2l_csi2_formats))
+		return -EINVAL;
+
+	if (!rzg2l_csi2_code_to_fmt(fse->code))
 		return -EINVAL;
 
 	fse->min_width = RZG2L_CSI2_MIN_WIDTH;
-- 
2.34.1


