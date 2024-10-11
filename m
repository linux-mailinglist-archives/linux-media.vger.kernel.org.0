Return-Path: <linux-media+bounces-19464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301899AA45
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 877131C26F6E
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56F11D1317;
	Fri, 11 Oct 2024 17:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTDf/+oI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790641D131E;
	Fri, 11 Oct 2024 17:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667881; cv=none; b=FhvybPlkwJIXtMg8Nu9v5Gk6hgR2QiH9NzVe+QOLv49PUAr1Tfk7G3ngEdr/jiIbDoI1yGaKjVtmLKJNnpIrJTbj13iWPSUwZioQ+j2GrAW+oa2uxI8ydwcDvhV2TBEV/1hkh0UnGfim2nSekx1OQkCe841Xe4RnBfaHkGerlYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667881; c=relaxed/simple;
	bh=PHRKf7x6L1ASM8G3srDIcBNdp5OhV2Njq3EqPXHRcho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMH2bW6elT9LyWSprmNWteXJhdrIEFkyWLnqN+5fmSPESuqishVBHVLfsmE4JwHDwpaAZWRrTIdnpnEItaAEvv/tTxTmBgyKWOi/J/PNh8FBXrEZofFqn67PxNJLbZrJ/Ic7GslJpLWtOWsDfSED+5uzZzAixm6OFAIk3Qkd9Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTDf/+oI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4305413aec9so20540835e9.2;
        Fri, 11 Oct 2024 10:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667878; x=1729272678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+msqcCV32I7SF5lf57WZeKZsQ3gqFv9ozYk9tMSxqs=;
        b=CTDf/+oIB38jQfw4IsW/Z+yqi6bVuZycBFpNmkEGO3fP9mydiylotF1GAjlVmtpfAT
         y0IqAgYJmEg6KmvyFI3PH2A5g2p6UTK97Vrl23l2kr38cxweYZjjDdZgui68Ko1CseJn
         w4sxLTNKrPSOK7SLElPdSAHYhUPLQuCUxEfmZyrP89cXX2Zb6+beed+k0YNbsJwD/68r
         E6I2vsElU45aT8Y6+92ehxbUYDBt2AMbuFO+kXk4nd6+2NpxlFa8Zp5Z6C+OzjufnDA9
         JLni47nzAEjT0Dyj+KSSyS7b4IymLa40/1ZdluxfO9QSHMNo8/AjzVmj8JCzlujqMGrB
         aWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667878; x=1729272678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+msqcCV32I7SF5lf57WZeKZsQ3gqFv9ozYk9tMSxqs=;
        b=hqmuyvM2DWuL+hWqyZiaofMtud1wYECzrNcg4T278VwmXtAz9aQtRL6VefZ7EB/Hp4
         cFKR8Q3e2ntA2ZBFPUAGsKw4dMjNVbAIG5kFlRYZAOgi+qBWCZ/mnZjBl3ijJ7/Lo72U
         FeTkROWtHNzG0SMAJW/XIEPThuBAyr0tHXYmVuSi/aDIdsGjtUCICQNsD0vgZEqmNzm6
         2g+g6FEcnJ8b2HJYWgN050XZ52vivnGFLV0cky8v5gVFtOeREpVIAVJTER1XGU2Fz9jM
         XMV8mJovmC9Qey1RJGFf1zB5ipiHniiP9PF3R9ph3kYAcC+UH2Wg3kwjI8PFenZRT4ld
         VtuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU58jXT9wOnu/A2nKOtaieQtjuS+LTOxvO9pvpRe8ME7RQhejPfw4YjCOSqiXtHKf16SdPCTIDZ0juzkHg=@vger.kernel.org, AJvYcCVldhlC/ejtgMai0OIlVXLqlCKuS6fUzhDM8DauiTpMhbnRh1VWy9A/H+s5GSJbj3o8F6x8Ystm/sc0BP7UfgtcvSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiNkYCM83/xNx5XOwbOA3otRXk9Zr7ZQNNyptMxt+qKZp5ZtBP
	m5u8ACcg0tYRDqm1chz1TbjTuunG1FfpMlXX72vAdQz3hnwo5DLo
X-Google-Smtp-Source: AGHT+IGlSsYL41bu/3RD07QWqrsfPUtn0x4LJ91nBsINUvs3TfWp6gx8G/MiUhwodx3vCiBORxCaZQ==
X-Received: by 2002:a05:600c:3501:b0:430:699b:7d22 with SMTP id 5b1f17b1804b1-4311df423e3mr28968875e9.26.1728667877628;
        Fri, 11 Oct 2024 10:31:17 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:16 -0700 (PDT)
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
Subject: [PATCH v5 16/22] media: rzg2l-cru: Use `rzg2l_cru_ip_formats` array in enum_frame_size
Date: Fri, 11 Oct 2024 18:30:46 +0100
Message-ID: <20241011173052.1088341-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Use the `rzg2l_cru_ip_formats` array in `rzg2l_cru_ip_enum_frame_size()`
to validate the format code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index a40b0184b955..07859c89be77 100644
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


