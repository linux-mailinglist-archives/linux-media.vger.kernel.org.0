Return-Path: <linux-media+bounces-19873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAAC9A3FF0
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99E8F1C240D5
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DD92038C9;
	Fri, 18 Oct 2024 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnD7ev4u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67973202F8D;
	Fri, 18 Oct 2024 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258513; cv=none; b=Br1gAhqzJra203VsR/aAzykMZRBpVCljG5mBpjB4qOff72VG8xYZHgDUbbNo1uybmUZB9esG+vyWbwafzqTX1kPk4a+a6t1QimsqVvlHCyXjSjAc9hwvOYdKRBMIiGlRkpsMYTAKY8LfWM/VMSse8pRgWDTDH7aJz+3Z1ewa3PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258513; c=relaxed/simple;
	bh=MHL+cGwrYKjALIAcXQIyfGRXQH+NW625WOpP8KM+4u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYKyV6n10cpTsMLnirSlg6FXvdX2ZmZO3Jes56hrJx378Mh1bJz2NJoUOLHj0afCIDbGVXiLP8P5rj8dyZe7dzu3StHnvXy1hii4JKfNdjWdzkfHUxMOkRX6yxigmNlCrIlKUhOJMO+IhHn6JrDnOMR2+VKkkNoIuYSU7aMjf9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnD7ev4u; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43161c0068bso6098805e9.1;
        Fri, 18 Oct 2024 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258510; x=1729863310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfay+6XQLhQuLyjd0986nDfaEEar+zrG+nqf3/TB8Rg=;
        b=MnD7ev4udDP0OgYe7t4Xo3pZdAXyHT2eTA6/sBlqYJOyOibJZqPvXJsSLqVCy+vR7A
         jTWs4wtcfS7AX5SOX8mGWR/+ftXuc4LcHRlWzcSziLjH8HH1c5AOrBR4w7sBAGyb4zMf
         qIQ9UpWRFI3IUUgPQF1vBxX2HwB/mR2qOSYauaATc+IqB8pluECNJrPiPC9K0rpYvHxB
         4cfK5OkhHsoom13ZiU9Q6ol3BcbLbYET8tGlIKygarHv5yF3OmtaUbd8axqEPFvKK002
         V1YI60iKsQdKodX/AWhUcYwK6IxR3thOU0sLL+xlEFE58WJIpfC2Fo2/3rqYjevLyXKi
         rtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258510; x=1729863310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfay+6XQLhQuLyjd0986nDfaEEar+zrG+nqf3/TB8Rg=;
        b=fJ6biPIaQDg/EzMuq5hsexlty/LHlSy4/GdLR5sv22pLuEsgmwptaBc2557jLwHJx8
         Ykdenpi25PHnasDKaiYmgY7Jh7LUdotMmamgaUb1/fZxId1xjZDnQLrJ9YTbQdfFgEDW
         enKR3YVzUkQdhnGe39YA/suHGujk+bcZGyJd6KAxNSu9XS6xUogNwCERkwivuqlFZrBF
         tYbQx/wT3qgmtoRZ5DEPkvSQ99sJYML+1IvqtPPOMc/9psP9AxLWmMsnLDrUgpgSbUBW
         eLgsd3R4O9lXrcifLl1pkh7fd1rk0QVaqP9h9c44DK1pa/d1z22hIHHy9IocdfiI9wkg
         PrJA==
X-Forwarded-Encrypted: i=1; AJvYcCUO200Ex6b2xsFBKuK03dO0cBkpT80/lyPVe+Apaq7+5k30jhhu549kY1Rais7hvF7nkdaFHRJKY//n8q0eQANz0Ww=@vger.kernel.org, AJvYcCVVVI9r0UflKbs3FP2eDy1zf9ULveO345xu0i5q9rp4GkmZa4hNetnqmBondy8uuu8Aig6u6mmmBbmWcLo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrc/qYTYBSxaxd0BuIIM6oAxxDj7qT3XW76IT9B/gZGB41YuJx
	+sRkDGIUusWmrZ6ADE56avzbtxk21qqZBfMznSbTrCUzzdDpniX9
X-Google-Smtp-Source: AGHT+IFJfZtXnA78fTiQmluvQSsmI2ptS/mjLsodA6hieIyyf5n9M2jU5ghor+t4HY6X3SsTcE4hzw==
X-Received: by 2002:a05:600c:5124:b0:42f:823d:dddd with SMTP id 5b1f17b1804b1-4316169a57amr15813715e9.27.1729258509518;
        Fri, 18 Oct 2024 06:35:09 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:08 -0700 (PDT)
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
Subject: [PATCH v6 12/23] media: rzg2l-cru: Inline calculating image size
Date: Fri, 18 Oct 2024 14:34:35 +0100
Message-ID: <20241018133446.223516-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Inline the `rzg2l_cru_format_sizeimage()` function into its single
caller as the function is trivial and is not expected to be called
anywhere else.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 37fea2bed00f..6a4f0455dc9c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -839,11 +839,6 @@ static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
 	return pix->width * fmt->bpp[0];
 }
 
-static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
-{
-	return pix->bytesperline * pix->height;
-}
-
 static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 				   struct v4l2_pix_format *pix)
 {
@@ -868,7 +863,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
 
 	pix->bytesperline = rzg2l_cru_format_bytesperline(pix);
-	pix->sizeimage = rzg2l_cru_format_sizeimage(pix);
+	pix->sizeimage = pix->bytesperline * pix->height;
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
 		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
-- 
2.43.0


