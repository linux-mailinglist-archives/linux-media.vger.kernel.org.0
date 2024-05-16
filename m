Return-Path: <linux-media+bounces-11566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9748C7A87
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 18:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E2BD1F2208A
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 16:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9673C1DA58;
	Thu, 16 May 2024 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="oAHc1LLS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC024C94
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 16:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715877733; cv=none; b=bvbfmY81vU6QmuiThpj+1dFpuPr2K6plXwMt0BZ0SytbjusdOUSd5KB6vsJzcP4OcG5p4gLRN/Ga27sGYFaUSrssrviLab11IlIZiETmH3r1C1zqdqX+s5oG/Ou7RcLQEHt0KQjuP4zAMktM7hs6yqlW2x7oxeJxGpJkwOiLvs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715877733; c=relaxed/simple;
	bh=Z2Up8NdNWpwOPvHkVPSkQzmGpXgQHnv35kuhg72/dno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f1/01oJlI9+XyXQkDUy5OotvivIArXFxPi0J4uaF2+mjG0dr/R6i7CBIi5/PXE9Z3lqawK1JWyFMnfddXjwRrfN9gqGmJJC8dxKcCsIhTmCV6TRz9zc+c8AQH5nApEP211jLTc5wqN4WR4oappVxT+KSl95neiqpA5ObdC2m94o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=oAHc1LLS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5723edf0ae5so3511559a12.0
        for <linux-media@vger.kernel.org>; Thu, 16 May 2024 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1715877730; x=1716482530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kd2BP40fUxe3iXqLrCdtO0arn/PW8G+mlzZObTv2eB8=;
        b=oAHc1LLSmoXSGD5Ws95cutBHMTTVgPgKGmoXobH1ifSi9TyDBruyoFMvsZ+rGDb3DW
         K3OJ2w6xWylpYEgjC9CsQPNWBIeqyhEyIyHzWPbbidKKEsU0WRHOtOJGLys1Zy0S5KBV
         qNkno5UX4T9XG5hIeRMe2m3cx4v5hBsfa/sKsobd7RnS+DroX4IjAbB/AqIyb/LSmZ3h
         pzMupe4hZk6ad9l2KYHmlogp8c4fhkBsmGZS3+aTGeNXKy68NSaWrTkiBAt6MwkPj51v
         KGswV+REzG48fs0YzaBXNqOB/zTQYcBx4xrKh1+UwMh8RblbsmUGtxq8ko6wJq0Zyotv
         fL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715877730; x=1716482530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kd2BP40fUxe3iXqLrCdtO0arn/PW8G+mlzZObTv2eB8=;
        b=vOkZBhpCKnjrnoNFhexf2KrBCzgZALF1RE/TiKl1FL4E8X6z/QdEZCxWH4vTGMXnm0
         Z/kW/sMXJyANd77KFTy6vih98JUZ2QEbo0alvfztACUWWQOdxL8UZFTHIf8SNCfRt2gf
         3A/HPiWkVics/NwJirimQXOXtamdJbT05iMjASLpJVXGRYfeqS7uFhPJ4yNPAar0sYlM
         3jhKDly+WfnF2QaZYwwfom7fZCFj2G8qOIYnL6Yg9Rdm+JAdHVRzM/+6dAFZ2n4mlAfl
         r3nnyN0GI8OE+n9Nz+vmLGQdkYOm0nibSEeEH/9uSsgdOq/3+1PY2lwxeTw9OwPYsky+
         vPsA==
X-Gm-Message-State: AOJu0Yy80p33nwWrDWBzhFvYup8LnI+OOlPR0b+ABN16pvoGhsZaLhZu
	w6cVCmw4OW8s6H+ej4OXykaqfLMf5sxDL3PijuOAZSdTA3Uoatb0y91Ph6QNmNY2CHb8Iuz4auB
	i6PRhPQyMSgbUsa0z6zwZIo1l53WQc5m8pVidy9uCNATpidXKE1UJf5xcFkurE57T5nwidSHJtZ
	fLUF5qyPdDs9iokJEGtadxUWJ6sK5QKplNN3e9r9GF
X-Google-Smtp-Source: AGHT+IFoBv4qFB8tusulro970FDf32Yd7hCImB/40oyR/6oHGniRsD3ojCeaDfGVwFWuKqLReE2xIg==
X-Received: by 2002:a50:d791:0:b0:572:707f:1a99 with SMTP id 4fb4d7f45d1cf-5734d5d3747mr12697360a12.25.1715877729821;
        Thu, 16 May 2024 09:42:09 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733becfb83sm10694063a12.46.2024.05.16.09.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 09:42:09 -0700 (PDT)
From: Volodymyr Kharuk <vkh@melexis.com>
To: <linux-media@vger.kernel.org>
Cc: Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v6 03/10] media: uapi: ctrls: Add Time of Flight class controls
Date: Thu, 16 May 2024 19:41:48 +0300
Message-Id: <d5e9801c3b081123a06bf73b52336bf6f48e69cb.1715871189.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1715871189.git.vkh@melexis.com>
References: <cover.1715871189.git.vkh@melexis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define Time of Flight class controls.
Also add most common TOF controls:
 - phase sequence
 - time integration
 - frequency modulation

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 include/uapi/linux/v4l2-controls.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 7901f40a1bd8..3ac204818bdf 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -30,6 +30,7 @@
 #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
 #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
 #define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
+#define V4L2_CTRL_CLASS_TOF		0x00a60000	/* Time of flight camera controls */
 
 /* User-class control IDs */
 
@@ -3499,6 +3500,13 @@ struct v4l2_ctrl_av1_film_grain {
 	__u8 reserved[4];
 };
 
+#define V4L2_CID_TOF_CLASS_BASE		(V4L2_CTRL_CLASS_TOF | 0x900)
+#define V4L2_CID_TOF_CLASS		(V4L2_CTRL_CLASS_TOF | 1)
+
+#define V4L2_CID_TOF_PHASE_SEQ		(V4L2_CID_TOF_CLASS_BASE + 0)
+#define V4L2_CID_TOF_FREQ_MOD		(V4L2_CID_TOF_CLASS_BASE + 1)
+#define V4L2_CID_TOF_TIME_INTEGRATION	(V4L2_CID_TOF_CLASS_BASE + 2)
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
-- 
BR,
Volodymyr Kharuk


