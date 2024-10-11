Return-Path: <linux-media+bounces-19465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 527B199AA4B
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4E6EB24EFE
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D6A1D0E32;
	Fri, 11 Oct 2024 17:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRxypKt7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72A81CEADB;
	Fri, 11 Oct 2024 17:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667882; cv=none; b=M+vRliGEK2F/oaqJMktWLdI1VP6ML/US1mWGnaL8JW0ENc8xmRxgtyN2IKv2xwZ2NgoiOmrUGDzz/tWqof8ljM3pfEjJftPBGA2dWMzBiAUjy8w6rjYiVhDIMZBsnBAveZy2CesphhYXu4b73sRtcG+VsZkV8cqI1NszWbXWEng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667882; c=relaxed/simple;
	bh=BK/nuBnleo0GMpERs+3xSBfnWAQP2PkPNF09ALoxB68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n49LZPPbQZxj6r3mBB7XhGPC3mG+dtoC5iU4rcUSxFLi2sEuB918ilWieNFRGbU+khkI+2RNMc7THIZYgtNghpF9C72Idbmgfliv514rCQSOLNd2viulxyo5njkoKc18MwUQhinzt1z0c/fgQd3mR2ygZ42edpWjH1qgYIiIzLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRxypKt7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43124d1ca5dso1684085e9.2;
        Fri, 11 Oct 2024 10:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667879; x=1729272679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVADDJD/udDduyc0qzmtsHFliZ+t+L+Lt159xgWI2tA=;
        b=FRxypKt7Nhl318gQHOLySInhnMM1q8Ps2Bo/nSGHQsNpBYcAAgqJezDMcDAyqSEclW
         46CGae1KCYjyaUgNFJkhuUmrQvwLdXTAbjgDnUlPCmjRmjzEn2kPT7otvNT4OeD8/Nyy
         EZIa+yOIsOotENR3A5kw1+/k3wm9NtI36c7u9liNy4zxyCyy+yH9b5Nro7W6tkAmMupE
         Mu3B4UNtbckQzMWjDg8xYsnAxVfF8d92G2cergCnCA/SFAynFa6QLoXfDhlpfRT/KKMU
         unp8BHdguDBLbLo5lg5mMlREnantnW0yyGUL00KljnPv9bIgx7DHULzDVz37MQjgUptc
         RfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667879; x=1729272679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVADDJD/udDduyc0qzmtsHFliZ+t+L+Lt159xgWI2tA=;
        b=dfdrXsc08EMKdQM3AmIECNSKYhmxf50Ko3vOPBSjZlgGk5wOG+TR45X78VCBhI3q1y
         7LOHTvBRb+JL3R2a1Dz9jMDUTAUlHFlgqzSDIGSwW2V8JbIs3QXAXz3X17oGSP+0j6ve
         iag1XYbqD9C1bQCdM9Cd7k0zTES2IKxPNOiKEXFefSieHS6I5Syjt8gm4yzctNKeDwlT
         BI2er5l+mhpB3/sTrh3ei8LfVvTdl419mjeupARJ3Q9V8/u3iOPQPbNrKcDUvdWzMySU
         4Sl0qwyiO7XevYgroFJ8yJnu9J2olU28Zx01kGWRUMiYl6f6O1BIOsS9WhjN5Wsn82M1
         wblg==
X-Forwarded-Encrypted: i=1; AJvYcCUdDPdJSw4oeysI9NjeF19+oMChs3U6VAYiwhW+mRSVKcVwbR6OvM9vJR0Hv2fqyQtT+CJNKEXSb/+as9Q=@vger.kernel.org, AJvYcCW43FWsbEBL8AeaHeDzy+Wr2igNd9nItNFLzM+t0Yfrwl5EDeCLar004Gxybzj8yD6d0nRz4MYgFezjOUdelizbyyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyASM2gLWemKD0IHCVT9SGCPwmsTFzvZQc0pnMyyZmiO/e7u73J
	Y4FwVPksmPdqUzqT6ch75032Ag06Ezn2fqHkrtbRc8GxnlAn7ARH
X-Google-Smtp-Source: AGHT+IHd35DSkqn8duao5nIDoMIRLMCn08cedsZH9XRpY+AFgCSQgSvYf3chxiVM+LTFM7TKznFwDQ==
X-Received: by 2002:adf:f64f:0:b0:37d:49cc:cadc with SMTP id ffacd0b85a97d-37d551fc4e0mr2168785f8f.32.1728667878663;
        Fri, 11 Oct 2024 10:31:18 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:18 -0700 (PDT)
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
Subject: [PATCH v5 17/22] media: rzg2l-cru: csi2: Remove unused field from rzg2l_csi2_format
Date: Fri, 11 Oct 2024 18:30:47 +0100
Message-ID: <20241011173052.1088341-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Remove the unused `datatype` field from the `rzg2l_csi2_format` struct and
update the `rzg2l_csi2_formats[]` array to reflect the updated structure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


