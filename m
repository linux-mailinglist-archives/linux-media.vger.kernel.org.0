Return-Path: <linux-media+bounces-18934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3827398BF2D
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E10CD1F237D1
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637381C8FDD;
	Tue,  1 Oct 2024 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwY/xclO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BF31C7B9B;
	Tue,  1 Oct 2024 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791786; cv=none; b=cHTC6zRnrsvFKoGx+fvbprkMxdFdz1C5NdvnwaPBoY9wOQkeVLarH5f77VQ+v/jKmbEhMr32UzFyNDSREyYME5g8HNdAjsWh8ggl36PkEDAJVfdmkITV/wukboEFhLQd+lSwonXWdMI3j/4XA8Gns5mWLjC/LDJ9wL6oamxnw/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791786; c=relaxed/simple;
	bh=DZ2oDmuwI7hYxiKfPRUwRYrBIbzfhMpyhql1cNQ2+nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7IUIJo37ls8X+B7m18qT6vidaYEPl7raaWGo1uSJdavw5AaCeZGtG/XSqiVmFaXqQCX0LHIg/b6QShLLktXIt8MWKs8RC+06AIlRRLSscRgStaaXw6oE5on9vC44Mw/So2ekjU7bFSOORX2PWAYWTaSOiAbzEXnWCfjZuR5068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwY/xclO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d100e9ce0so561472966b.2;
        Tue, 01 Oct 2024 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791783; x=1728396583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muRK2X87JJfmoVnt459RleLccdudc3zUouvnu3+u/Og=;
        b=QwY/xclOduNPC5CXaojh2XY6MZY7Dhmw1gdKW5mD2+D22jG2NEdN6KSt6UNvLpHPUj
         qERWD3jeBPRJRmMCvBi3nR56t6uxvbDh8OHyTqhYkPLKsqE0uoXQMje7OHgKE07w37TP
         EhCS0XL8m1MSN/Qa1Kc5qyZmgs1BmXT/C2noGUrKKWJRIl5naTqIYjSZchJ6Uy8xbVS+
         FENn/BCd6lEd/IyF1vvjHGFuHRFozDpySl52TkpUZQb1pGZitlzgvh8n48oBeZMb1UK9
         e8MnOzZchn8L2pVYxlbneb0ZUtravN+Uc1ChIYhrReYBOPfGkdnFL7nyGWWsh67tvD+U
         yXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791783; x=1728396583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muRK2X87JJfmoVnt459RleLccdudc3zUouvnu3+u/Og=;
        b=QUMQ6D4LPiB0LAZUjWNkXwowLjV04amVid/ZGzX4mDwLGzkNCkKuZvAGrn0E8V+lAG
         rki3CxmPZedXUcYrVHPAzclZzhRRJ2c7PZcY6ET+wWzSZnmcf77V3On6td8oyYnQn0XQ
         8P0W2k9LtruMTJBzesuNqD6+S/hecVx6i8m0ncEitXmvdPSICRe1l4wUVpBaDu3W2QaA
         bO5PvXX2X8PFCM4OonZHguxyqU0Pm+JcmwsdnS6vug0iVDFWtFPB1CVLgOtzGhIaHnJL
         xu0svVyKMSQPKNkHWWA4SmjtkAkHOtv/5Z6Z+NWfg95HDLf/G+yRl70PrdW7w1LjroJT
         foMA==
X-Forwarded-Encrypted: i=1; AJvYcCU48C2O2Q+8AAPMYaJxaNkp0zrojZvIlRhjLIF4HpTlsylqOCaRz7t+NweUUlscu8qVQGt1JxbUSAJqO6k=@vger.kernel.org, AJvYcCWNlupl8W7Hl0h0G52Q9XK4DMVvZW0r0BMW9jhl+ze+2hU/HgcqWRhBhySPZszA+W8xJzIfyyqr+q3rykwspmBS3/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ClH+9HIDnx/ptaO28rolAieEUWYxxZG3rkhElFMQUdLgyZYi
	RU5R1m+SFIlkPzUqJIucGN5IyWnJSlg38a/BXuSuikyE7GgOl+gh
X-Google-Smtp-Source: AGHT+IHVnv0suj9V1OXSgJyN+Zj+xbbE6DlB5uRgtFOQbjJdiW+PI22Bbr0HyA9cHoyvX+iWBAZLEQ==
X-Received: by 2002:a17:907:7203:b0:a86:8e3d:86e2 with SMTP id a640c23a62f3a-a93c48f6d4dmr1892253466b.11.1727791783111;
        Tue, 01 Oct 2024 07:09:43 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:42 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 05/17] media: rzg2l-cru: csi2: Implement .get_frame_desc()
Date: Tue,  1 Oct 2024 15:09:07 +0100
Message-ID: <20241001140919.206139-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/G2L CRU requires information about which VCx to process data from,
among the four available VCs. To obtain this information, the
.get_frame_desc() routine is implemented. This routine, in turn, calls
.get_frame_desc() on the remote sensor connected to the CSI2 bridge.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2->v3
- Updated subject line

v1->v2
- Collected RB tag
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index abacf53b944c..3fd0be6a3b65 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -582,6 +582,25 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
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
+	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
 	.s_stream = rzg2l_csi2_s_stream,
 	.pre_streamon = rzg2l_csi2_pre_streamon,
@@ -593,6 +612,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
 	.enum_frame_size = rzg2l_csi2_enum_frame_size,
 	.set_fmt = rzg2l_csi2_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.get_frame_desc = rzg2l_csi2_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {
-- 
2.43.0


