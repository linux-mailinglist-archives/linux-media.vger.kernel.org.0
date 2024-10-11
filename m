Return-Path: <linux-media+bounces-19460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 072C699AA39
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3F1E1F27DCA
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FF51CDA3D;
	Fri, 11 Oct 2024 17:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMWKAKiK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207041D0DFE;
	Fri, 11 Oct 2024 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667876; cv=none; b=qwSkn+pwiwtdFoel7sZj5+ICVU/e8MtABsBvONGyyGm0Ygp38Tb0QfADRRo/gS1W7s+nqS0+D1OcitmJCzs2Ufl+SY339QggX8V6yduXEHIypHxTu0hcVtMGnZUYsTq0V0kH0OtK5mX2VT+xXs6sLbbUBd5jr2h4jR9MT/d9B9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667876; c=relaxed/simple;
	bh=UyZD62s1v2d5YaJvcqOxS/MfB69s2yqWlkTeAHIW0v0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiWkHfOG9Gf8VHUySCPIaPcrF2xAn4Nl75zawfbSHZTuHdR4WnPsnwOWmXk7NiZR7IJKUJ4Srdm5JBBNzVkC8S1UjNndNTl08JtJphjuPDPCqgq66ZR2Hi6v3xc5bbURcbNHmYUD+TFjUEQ0U0S4Lq3HK98vBh/7f8b7DTH9bqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMWKAKiK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43056d99a5aso21521205e9.0;
        Fri, 11 Oct 2024 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667873; x=1729272673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCAeo8KyOiOjgCPOqLwmsX3d8qXbi8D0bHOohJrw/JY=;
        b=cMWKAKiK1iZkHXB4ZIUqMOgkpjtKwzX+NDhGtJz1lyk2Uj6UpRLCDOR5uoWo4mw6r2
         krEM8EE2Wx9enb0vgaZM5TI4FA5ryktoopZamuc2TLYZ4ON/pfbz6nxwTG3kDzPtuqS9
         RkqMyS3DlAFRyklOt9nUt+hF1cjZ7mOayuR+tHUQ7zEejQmkljaPMll33mJZRpE2mCHm
         PuXLr483T9tGrGeXduztqF2Pkgh/BDSNrgPHQj8ET0JZLNDJU6pyBBs6KGOoK/qU5edT
         vKuqQOBYWQV+nu2JkHhfAJb/LvQcjKs56OLPuNVbRLRUtA1ICSJ1iAZr/EO5NMTPHRfR
         qvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667873; x=1729272673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCAeo8KyOiOjgCPOqLwmsX3d8qXbi8D0bHOohJrw/JY=;
        b=f3zo1xJH3Y4PfHrhQKJnTaOmyEfDfJWG164mTy00X8FLOeqO1lxeMmPCbZafJJIBkJ
         kFcJiwZtDJAyM0jW8SQzbP4voQHg3d5o6KhnUy4FBGsH//Ok3gxdE87LnD0ZgVTAgqHn
         MR+5SNWOuYiRkqYRx5BA3Fw81u0Cv1ttOWpernyFKbcsb51ynLEvwgXAWa37ZknYmQG5
         Sdv7D9IRctaEiaiYugALG1LQEja1fEK/hD4mLmXOERewAt80KGyjYo43pvq1pMsCm6ns
         DWUstqwq4avHEBE98TCSEmPDtmTGhRPgTJBQtWNXrxXjgbS+WgCQ0I0Aspds/esbaEBD
         +4aA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ2p2/Jil6fjWRbKukb7lWHNs6YZVJ4ZN4ZFl3msk8K5JUrImK/9psdJN4v/5Jf9VHvqxidTcgpBrO2LK+D3n1H08=@vger.kernel.org, AJvYcCWjrTDQOD9GjHCMySaTHg5JEy2v5TuXXwZPst6NJwIbbMQzA8B/FJPVhxnLPh9tg4Ox9ubMHpKuvwM7L9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGmUVq3/JK7ljrb6Djcnrt3LIH1i8g/ud4BkfQDg+OqB5avOSA
	J7/SRBy32XOxu8PTZWN+X6Z5q341I97vwMMIAZ4CrHGzUcv5sVen
X-Google-Smtp-Source: AGHT+IE5il1yujibWZxDlla7UBFzfgL7bCZleTNmjT1uK2hnqAlyoTZlRS+yTXL5Psca6eVwJHAVXQ==
X-Received: by 2002:a5d:5108:0:b0:376:dbb5:10c2 with SMTP id ffacd0b85a97d-37d552d4a14mr3072579f8f.29.1728667873312;
        Fri, 11 Oct 2024 10:31:13 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:11 -0700 (PDT)
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
Subject: [PATCH v5 12/22] media: rzg2l-cru: Inline calculating image size
Date: Fri, 11 Oct 2024 18:30:42 +0100
Message-ID: <20241011173052.1088341-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The `rzg2l_cru_format_sizeimage()` function has been inlined into the
`rzg2l_cru_format_align()` function as it has a single caller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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


