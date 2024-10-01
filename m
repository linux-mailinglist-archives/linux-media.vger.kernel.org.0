Return-Path: <linux-media+bounces-18940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA52A98BF42
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17D741C20B9F
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC4A1CB309;
	Tue,  1 Oct 2024 14:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlI0cOuO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35E41C9EA0;
	Tue,  1 Oct 2024 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791793; cv=none; b=lnUmmU9qaEyAGOSFCrLgiTjoZiwoAU4nR+EgeAIFHiWDD/XzTV9r+5lIK6G7CE4/Q/BOMalhqvbq/jeKH1mTvfsrDzbikZvn3FvWVWU6BCOwiVvF0wTh0akA0s0qODRh3HH5QOG946jdoGlTVuzETzg47Ucb2Yh3Oxp3DSWW9T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791793; c=relaxed/simple;
	bh=KEBZJUpiys9cL8RQIC6/B2MZs7EWcYD7qibyXCPYu/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUQ8tJD6X+qnt02RsRNvQYN4bD2tHCTwrVzuZT4qTPALtEQ1EbBMbQdEtGvnQ/Y5hN0lJ679HPcD/uQnTy6xexop4M9E2OSmUSdpRHBZjVvvTFlaiFqlEzEZx3szw830Gcvea9q5BdjYMxdLfc6Ydx2CrCHNNsezBBMKV1WZizg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlI0cOuO; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8ce5db8668so969786166b.1;
        Tue, 01 Oct 2024 07:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791790; x=1728396590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzRk5+hYxvHVtQznvUYLKHmK+AJzn5GCHjzzzcvFJhI=;
        b=dlI0cOuOUxNpAHVYIQ5NFLeClrU93jbFUFopvCFTrtzrHlSerPeLcndWjpR99FlFFp
         xLIxTxS9WAcGBqrpbJ89Sic9Jfo4V7/7+WWBw61WZzPhudgbV7SD1KksQANbyJuJsb73
         +OT1NdieV66+3ImdGAFORHmI85uI1yPf0fB0T9DMtFRJG2lF2RjTWgX3VhOZB9XKt5DP
         nc0Ye80mYzNtyKTzXdsYm+8EEt11Ux7j67L+GZY49FcGopEV1+JdJqaPo+lYj46pXCIn
         k4xiHVSamQIR6H8CN6PT/E4QfSwBj0U/tW22e4Gn367hJPE/aiYw34kqYiIXDwl7AohU
         HfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791790; x=1728396590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzRk5+hYxvHVtQznvUYLKHmK+AJzn5GCHjzzzcvFJhI=;
        b=bYG3s+csf/oIjY9fGD4QHcl0EZ9DdwlIFTRC5AbfPGQomQfw7C2jVNx8FdqYFjw5xM
         YZUp6f8cCa8/bgmY5r1pCLP1gKsWYov+8nstmHhOtRnItp6oDiLZvLOCcYEOfOehT9K1
         WdxqqxFMCBZIcHVQ0p5cHA/YCxUMKW/WUrtBASlRPugQoXfIm5V+GV/kChcj0IghzTcP
         WiZLf3T1dyqmuHAaBVzowdhdB+JARCBsIwAXI3BU2b7nzIMxuose+qwlRW8pQyYltg0o
         vsVdC84A07UB/lElyE8MeAVFG9QLS4DrAS+9MDFNcxoRPRwLY+82yAgAvSVFMO9h7v4r
         hiDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhSlXN04uxf5bpweI64gqSV9peNlBoq6/0g9YahmEBiie33U49qEDBubyhtgDkQUb2h9L7qHzLeEhPQAY=@vger.kernel.org, AJvYcCXoT/IU8xaQXWmZNhwQp2XSymO2luUI3+g5sP8TsLJhJi5KHz1PP23vHwk/ds9NxkMDASHBMngs+zvIbDvy5/IANXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YywCEcS6XCe1TBflZXTqZGcGK+YFx3zUV1v/3QVdf23ABv82/El
	qRyH4fYJI6ISDt+a0wKyf/Fylht6LUWhsDmJGrtdlhOXUe0FRVeT
X-Google-Smtp-Source: AGHT+IF/P+PIlJQeQjeVqILk1Bl3m4/Rqshb/H0SAk0JzAFjGDfLr8vA02ZPObzJ+ChdVvaxi/BTmw==
X-Received: by 2002:a17:907:6d1a:b0:a86:a41c:29b with SMTP id a640c23a62f3a-a93c48e80bdmr1829503666b.8.1727791789903;
        Tue, 01 Oct 2024 07:09:49 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:49 -0700 (PDT)
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
Subject: [PATCH v3 11/17] media: rzg2l-cru: Use `rzg2l_cru_ip_formats` array in enum_frame_size
Date: Tue,  1 Oct 2024 15:09:13 +0100
Message-ID: <20241001140919.206139-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Use the `rzg2l_cru_ip_formats` array in `rzg2l_cru_ip_enum_frame_size()`
to validate the format code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3
- Updated subject line and commit message
- Dropped fse->index check
- Collected RB tag

v1->v2
- New patch
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 12aac9d6cb4b..6ce077ab42e2 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -165,7 +165,7 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index != 0)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
+	if (!rzg2l_cru_ip_code_to_fmt(fse->code))
 		return -EINVAL;
 
 	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
-- 
2.43.0


