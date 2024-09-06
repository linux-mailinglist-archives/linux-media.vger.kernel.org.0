Return-Path: <linux-media+bounces-17813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7258C96FA09
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 19:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE441B2246C
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8561D6C48;
	Fri,  6 Sep 2024 17:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0w+Rrzx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2B1154BF5;
	Fri,  6 Sep 2024 17:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725644428; cv=none; b=jzrDn6GfHDGoM5Ue5gm1QUoS9L3z9K4gJ2ntJkctyphN83PqO/z+vB98hhdeV6qPyaES/CUxje6IbRUk5YLpOWhRYs1Labyd8jOYNFxETqpr6nz82qlhhUaNtXMyYHXQ1jfECe5kEBHT0l5k+eoX317SAQ1XhEwjFeehRMcWWoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725644428; c=relaxed/simple;
	bh=YPKrvoiTq6nWtkxe4ZFFcGAZ8SFTIBuM8+heVE/TslY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kviFiijU1p9DAr6Fn/bKsl0RLxlXfsmhaobTFFcgsrx/2nG4RRKbASqiII5TnmFHpmIEZzx/S9cs9glYQTYA3ap5t1+S/4aNBWz+yu6/1qvju5AcYlIMOLaZbAlP27UcYoAsmKzW0nCSOKWpMTlrx0R6Ku03aAJQPsaySp3kisE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0w+Rrzx; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso6520617a12.0;
        Fri, 06 Sep 2024 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725644425; x=1726249225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leNcJ9uVUwRxDumIwXcMwTGBOKocFKMYGNyhiFfYTBs=;
        b=m0w+RrzxQnGtIuwMDN7b4yFkKduynelcTrp9p2vWyZBm/g0mkYgx7PHioLs8Ew5yVq
         9D2gUYg8U8iaiibYiqAbXp/Ur+8wQTKQMo3qMCnayKV4rhvPK4FdkfhPPwNHDdHkcAGU
         ZqUsNIZb7waOJ3XnnI+oRzqZ5HnDrui3RY+Jw3OiQ8pk+NavHulw/EVu9SZ/fh75uO4z
         GgZtox6VIwJ/8Vz9NdQ6fTg9AWrozmVanlSTagewyaaDV0aqtkAeSpdHfE+dMIfNbiAc
         WJf8fgicip/PiqdosthGholzeDVPRirHCFDWHmvCUPUEmZ3tjJN26xniF2utNVrtY1lN
         zotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644425; x=1726249225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leNcJ9uVUwRxDumIwXcMwTGBOKocFKMYGNyhiFfYTBs=;
        b=q8DZ/+rEILZwcq/ZQbdQyWmDJ//iw6F3yopHZsY8XvWrUoUduv1DrofFLcKE/eAHqx
         MKXwbAZD4a0M5UHERqaqX6qOnT/lMhCXSQFIBvjKM3ia+nggoLjMoFIdtRYEBpPyiShi
         UocOozAOtybHuqrlPe6v3M+G57Y0Jl8z4MUSLMIhWjYYx/Mv2ZoPgX2vzhrIV2K9hHq1
         Z5fmknh7anG0muMnChtOX3m3c9MsChwDkp5YEmulH+SB/Bx2cQtDn7/buxttu8zzi0vh
         gZ2b2MMMeTxW/S1YP/QAreyKNt3Lwk1i/HQYKGXUKQvv+JQ3sSHpHnDJkq3fJ/e3A7AF
         LHvA==
X-Forwarded-Encrypted: i=1; AJvYcCV/7lcRwHs8SJyZdWyLfhhQ/iqavDvs7uecodDlDBHGhT2x4PhoFujhnN12dsXwODpa2CQ3i5VEuFgKXa0=@vger.kernel.org, AJvYcCXt6Yp6BKi4rwMk2VpGbVaB66oSgHw8KBMoOtiX17dDttb2tBaLxZdsgtKZwrEjHU8FAI2UpRLWPATFPsTG1gELLN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2QI8Zt7baGFph3sIOl4ScwhmQGX+3vym5QsDbY0BzOYYBxs+n
	VR/WwrfcztbFhWn0ADz87zb8wOFl1CV+OBiKeliIuP1FlXfpGqK8
X-Google-Smtp-Source: AGHT+IGYAW1HB66qZRT+Z/jqAkHuOohLiBmqaWAqGxc7uAydfKGIjNVf2raSiK0zdl19BYJd69V7SQ==
X-Received: by 2002:a05:6402:50d4:b0:5c2:e888:4cf4 with SMTP id 4fb4d7f45d1cf-5c3b291c3b5mr11076727a12.0.1725644424929;
        Fri, 06 Sep 2024 10:40:24 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc697fedsm2623557a12.64.2024.09.06.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:40:24 -0700 (PDT)
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
Subject: [PATCH 1/3] media: platform: rzg2l-cru: rzg2l-csi2: Implement .get_frame_desc()
Date: Fri,  6 Sep 2024 18:39:45 +0100
Message-Id: <20240906173947.282402-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index c7fdee347ac8..a7e4a0c109da 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -582,6 +582,17 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				     struct v4l2_mbus_frame_desc *fd)
+{
+	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
+
+	if (!csi2->remote_source)
+		return -EINVAL;
+
+	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc, pad, fd);
+}
+
 static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
 	.s_stream = rzg2l_csi2_s_stream,
 	.pre_streamon = rzg2l_csi2_pre_streamon,
@@ -593,6 +604,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
 	.enum_frame_size = rzg2l_csi2_enum_frame_size,
 	.set_fmt = rzg2l_csi2_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.get_frame_desc = rzg2l_csi2_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {
-- 
2.34.1


