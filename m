Return-Path: <linux-media+bounces-18123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D40974140
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA175284208
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC631A76C1;
	Tue, 10 Sep 2024 17:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsjjTjKg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B581A4F2D;
	Tue, 10 Sep 2024 17:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990867; cv=none; b=OBh7FP1VvaW/14Iowky7QEB2Fjpbyswx5Iw+Z86qD9G7EVT6KzMymNQsQTd3HLEi9N+o1GMUY2DtPI7l8rlimihLFDJ5wqJaEdnOeEK5HPM5zP4hgDrzqgK+G8We2k8KFJrA5Y+0rHAxaIX89WAN6gokOfk1ICoTHzepFecnAl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990867; c=relaxed/simple;
	bh=Rug2G/cq2zgB+wXzCC2v3xDbeD5WdaUO6mgJp69FfuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=el57Pk7ZtxXm5DNEmAdBQY96aJEL8FY5tCtcoyqWy4U5UAfIgg6L73M/6iaPM1stnBJXrKDuuoveAZNICreFTthcMOTGtZjulFp/P07QSuL4GCBAK4YRqLTIyPxPM0cxNo4yhpC13PV5/usdjXAa7sNyLpPKyT8qj8ze/2kVulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsjjTjKg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb2191107so23971145e9.1;
        Tue, 10 Sep 2024 10:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990864; x=1726595664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejTEHNcsBD1DrfHR6s4LkPhnkpDczz0iTfYbRqUbEt8=;
        b=jsjjTjKgdKBWsycUYKiupbAqFKjLUvJtOxHaa3NriAC+jh/pFNlodJKxBSZ1ylcdvr
         CzBrZYu408Ff1rQS179A29dOAx2IhiKnFWNBVDqS27M8vmvY4pKPhEsylDXpI4o8dA+f
         J/Oknf/4f/GpNfyW4K5YeAMDByolN0EgdUF08gACgL2Njz2Uew9khhtawn1m5mWrVBV3
         9zZaZvMlsWjueWp/LAfjnfOSlogVsIOpFkpBujGhBjf5l01a9o8FqHLs2AjDjg+whjXK
         SQzr409TRmvgPYHfj06jMJ9Aw4cM+B2Kum3GFWewzf5aL/4O7sGE1JINqeA23sq0kdmG
         oB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990864; x=1726595664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejTEHNcsBD1DrfHR6s4LkPhnkpDczz0iTfYbRqUbEt8=;
        b=veq483CwjgrxqRlWd+7H/x0iUq3sHBOm2wg42EI223qKjbZ+em4MRMLpRdB34DJ2TB
         uHDxXkyF9HDLviAeg4uOTzysNodTyiJfhAXZYEAS36CmnASZMwSu33qeOBB/Djwvmfh0
         GjtC/MYysUr201Uh16Idavqek8Npig5nljCZgzX287/j5axrYLrF2M7HLR8sOYIm/7Qz
         Ja1wJQnxBq9ntKiECuKkmePqnsd/knkZPEt6Z4zdXsUYCIquvl7Rhp75793vEvwQQH69
         1xFN4jUSTWzXxVF5BdNgaRpNh/rmie9Wxrq2W/dnetCgsFIr6F2vImEiHDlN1ELRZuYm
         B4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUljejGkXIrAC6eLIGaMQqDfA1uIinW51pqHj0+Y2I+ITaeWHAPL7GSYEXGyROQXtCM2j8C++V272ML0pk=@vger.kernel.org, AJvYcCWlFjYZM9WD5PS7kzS6tBbbLR9aI3Cnyl3uxBagU7JWUpGxvmWyEdK570HpkPfTCknwqn1GDIMGSa6punF54l2lsRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsmeV/xZ5XtNbx2PHnQOZZD4Mxw2JZvpmGOwGr9Miz20qL6uYo
	IsmlQtAHEsyBFxcZDqlrT7uiaN8j6Y/2VYMrx/pKY9JNBPZFM20D
X-Google-Smtp-Source: AGHT+IGebAElVIF8QVZ4GEbRR2hEbzxYJuaIpZR5mpONcz6SgWxls1mOSh5nkUiDCOIUQWaOnjEQWA==
X-Received: by 2002:a05:600c:450b:b0:426:60b8:d8ba with SMTP id 5b1f17b1804b1-42cad87efc7mr86741475e9.28.1725990864157;
        Tue, 10 Sep 2024 10:54:24 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:23 -0700 (PDT)
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
Subject: [PATCH v2 05/16] media: platform: rzg2l-cru: rzg2l-csi2: Implement .get_frame_desc()
Date: Tue, 10 Sep 2024 18:53:46 +0100
Message-Id: <20240910175357.229075-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/G2L CRU requires information about which VCx to process data from,
among the four available VCs. To obtain this information, the
.get_frame_desc() routine is implemented. This routine, in turn, calls
.get_frame_desc() on the remote sensor connected to the CSI2 bridge.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 10b8b0c87c1f..26953499f305 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -582,6 +582,24 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				     struct v4l2_mbus_frame_desc *fd)
+{
+	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
+	struct media_pad *remote_pad;
+
+	if (!csi2->remote_source)
+		return -ENODEV;
+
+	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
+	if (IS_ERR(remote_pad)) {
+		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
+			csi2->remote_source->name, PTR_ERR(remote_pad));
+		return PTR_ERR(remote_pad);
+	}
+	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc, remote_pad->index, fd);
+}
+
 static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
 	.s_stream = rzg2l_csi2_s_stream,
 	.pre_streamon = rzg2l_csi2_pre_streamon,
@@ -593,6 +611,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
 	.enum_frame_size = rzg2l_csi2_enum_frame_size,
 	.set_fmt = rzg2l_csi2_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.get_frame_desc = rzg2l_csi2_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {
-- 
2.34.1


