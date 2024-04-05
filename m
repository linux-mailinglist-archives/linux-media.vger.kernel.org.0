Return-Path: <linux-media+bounces-8753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D7899F4A
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 16:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F5481F263DC
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 14:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9684E16EC11;
	Fri,  5 Apr 2024 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="koNcX9m1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8687E16F852
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326520; cv=none; b=mQSEPv1ma6kYHqIz0hhvp2OzTS/NOywXAtjEu+F7oovSMyeCWp6jlqTCCzUqf3Br4N85leh6UD1sDz8CwObS8xQ4r0cG5V8Ji5ABEjdrw5niNJU99M6g5T8EFru+/x84IJFwu8SvGoFOcadqlpGcducO/A1/dCoUe9eS0U/lEN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326520; c=relaxed/simple;
	bh=ZMS7hM6KW9z07sWnfqtb0vfUnCFSGDurCvDVGwpKtH4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lUcmF/Vrg0ISMr8qRgDN3SIHv9HBPA7PuvwNoTKFWa0lKqElK1aDPJuuHfOwsd23OpRGchqVBn0Pm6YTY44Wzrxw/CAdRUmwGopFdbR0URMXYoh8dmIU1EqqsmMgQglWfReNBuBED3QF/Izie01y0gB1QagHnJVMjbWPcMBWNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=koNcX9m1; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dced704f17cso3849748276.1
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712326517; x=1712931317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94YlLU32Aw+sMxB+PMoafcDiaHrqtTcDMU3Gx4Hxs1I=;
        b=koNcX9m1Ps2wwp0tQBqFmNo8qemsmuR+pkJ6lBfjalreLVYj/Zg9JtbXfU70owHpWh
         gPAqGJDJIhZIIxEwuucfEyiAylMu1JOTyWOleu7XpgjxDxixOvtMxq1/PVfx2//nLIEe
         w1eGhREbvLdrl6mgqJ0RWWrXZMzpYvQft2Znd3xun1qiWyJ6ZaHp61+1Y4BKDlfertnY
         0Vyc7SYwtitDBZ7TZLZ7iJIfTjJaoBFdEdSKJ/aEzElPRkcVOVJ/gVkXO4M+bbkDXGDl
         E3EjnCEcd7+9m1VEHmauaMeYN6EuJ20XJWndN9QzTn9M/x12GlY/BhXURA1Hl9CMWvbF
         WO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712326517; x=1712931317;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=94YlLU32Aw+sMxB+PMoafcDiaHrqtTcDMU3Gx4Hxs1I=;
        b=GhVoSFOtVi4BpF4cPreMHCdHruVe79RBBTWm/7F6Jcil5da0iI2JRPldUinvTssC75
         LVdBnhHFswaVucwPQ3vG7XuQoI3ZziTux/yxV2ss45vM9H4QC2ebS1PU/nOT+OGWiJpI
         44i6fbC3HucgGExZS5CaWuOInXC6tDxejBqLxomBsXatV66zVOOMrVrlZIFgPc+NI11y
         rVYLXUq74JCBe8wJ+ixSkiXzx7d8PvRoMfmve9P2SUyty49sKqjaZ4RZ1KCVypJinSOV
         9iST4g8hiqnDPLAqgFWDCXihrEwlOVUufhV91fFwhcKDs6m0hqxnxIfcUXCPxdbuqt4R
         JKkA==
X-Gm-Message-State: AOJu0YzgZdWJcj7TJChBP7L9/kXgOhU6b2wgKZmPS2b0O1eyrFWFKlll
	3zevX8Gxx8rDV35kRXLUh7X9msUrRk3XAEMeoskcZsJ/2zPckZxe1LTljsaf7pNy1O2X3I1lIho
	iqUpTH1s80g==
X-Google-Smtp-Source: AGHT+IGrK5D+Al9x3FTMCHj14GU/jIUebXWjMWxE2WeT0/GABiLAK8y3wTuNfqwVvbVtebybpNUuNDmYAKkDAA==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:1502:b0:dd9:1b94:edb5 with SMTP
 id q2-20020a056902150200b00dd91b94edb5mr78790ybu.10.1712326517609; Fri, 05
 Apr 2024 07:15:17 -0700 (PDT)
Date: Fri,  5 Apr 2024 14:14:03 +0000
In-Reply-To: <20240405141411.1807189-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240405141411.1807189-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240405141411.1807189-9-panikiel@google.com>
Subject: [PATCH 08/16] media: i2c: ths7303: Switch dv timing callbacks to pad ops
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: kieran.bingham@ideasonboard.com, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, tharvey@gateworks.com, 
	niklas.soderlund@ragnatech.se, prabhakar.csengg@gmail.com, 
	charles-antoine.couret@nexvision.fr, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, skomatineni@nvidia.com, luca.ceresoli@bootlin.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Change all (s|g|query)_dv_timings subdev callbacks to include
a pad argument.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 drivers/media/i2c/ths7303.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ths7303.c b/drivers/media/i2c/ths7303.c
index ea70c1c13872..5e4a76eaf507 100644
--- a/drivers/media/i2c/ths7303.c
+++ b/drivers/media/i2c/ths7303.c
@@ -193,7 +193,7 @@ static int ths7303_s_stream(struct v4l2_subdev *sd, int=
 enable)
 }
=20
 /* for setting filter for HD output */
-static int ths7303_s_dv_timings(struct v4l2_subdev *sd,
+static int ths7303_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 			       struct v4l2_dv_timings *dv_timings)
 {
 	struct ths7303_state *state =3D to_state(sd);
@@ -210,7 +210,6 @@ static int ths7303_s_dv_timings(struct v4l2_subdev *sd,
 static const struct v4l2_subdev_video_ops ths7303_video_ops =3D {
 	.s_stream	=3D ths7303_s_stream,
 	.s_std_output	=3D ths7303_s_std_output,
-	.s_dv_timings   =3D ths7303_s_dv_timings,
 };
=20
 #ifdef CONFIG_VIDEO_ADV_DEBUG
@@ -317,9 +316,14 @@ static const struct v4l2_subdev_core_ops ths7303_core_=
ops =3D {
 #endif
 };
=20
+static const struct v4l2_subdev_pad_ops ths7303_pad_ops =3D {
+	.s_dv_timings =3D ths7303_s_dv_timings,
+};
+
 static const struct v4l2_subdev_ops ths7303_ops =3D {
 	.core	=3D &ths7303_core_ops,
 	.video	=3D &ths7303_video_ops,
+	.pad	=3D &ths7303_pad_ops,
 };
=20
 static int ths7303_probe(struct i2c_client *client)
--=20
2.44.0.478.gd926399ef9-goog


