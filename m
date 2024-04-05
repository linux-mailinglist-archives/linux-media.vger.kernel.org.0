Return-Path: <linux-media+bounces-8756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F19BF899F51
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 16:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2D381F2269F
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 14:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EC5171062;
	Fri,  5 Apr 2024 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iGkRBpWr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52616FF41
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326526; cv=none; b=Hu7nL0thZIStFwWYr+1RtRObJnFm0LEWNwDlWLrJTpWf2/Zt9tgU38bq2ogHYby6U4LE+bwoWjIYQXMu3m5mBELvcU86s1SKOjARW4c+UWCYnu1LliMYb+wrmvwteQ0C6b4V6fHDgwPHr/wgcYu1DeYjuAuCMpe8dg1zmy8mVm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326526; c=relaxed/simple;
	bh=NDwy44L0Jhu5ltK/Qxlk6F2up/ZRjhK55Rnmu42WtFo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l2osZ12iNm8a4r2ZwOubnoZT7gBL1uYp1Wtqu6JqGxp7CtCU6o3DPxOUPVRPQdn+RfRMvVaL5osLyfOOX/iZDibwWx+tkpbDE7dOT/f8VDST+mGPrjGiOmX5jUS+awu9T+rrBVoCqtozBqqOiaxFZShB5qWLIAPTVpTiPq5nU+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iGkRBpWr; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcc05887ee9so3254679276.1
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712326523; x=1712931323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJXjeQEubm8j9rzfDm3JhpB2lxNrpssVrF6JxlheeFU=;
        b=iGkRBpWrTtvioIUngKWxG6ipIXrrTGsmm0rchtJGXXLdkDfXTl/lYb4pAPI8Mxa5ad
         3KD55i7DxmNgZI8K/14Ks3B05gg200XD8rgwTY/CV7vBdhJiKGr1fE3vTDeuy24JJe+M
         kd1lDsHeJtB9Ti++HBeENFzGzhcdaV7l6fj6wPUOfo+xJWEMH7sf/xg+Y6RQfGLxSKqE
         5OF8ajTSDbzta5a+FpISc4Flk/s+a+Is+XA29aWU1tvAzr+lsG4WG7F9r0Ty+SV9WJ1d
         CHPdXWXDl8S+xJKnqnJ/r4KvpCCr9wQb+OkANqdBjKuxKMTSvI2OBOM/+jMsVp+IL+tO
         c1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712326524; x=1712931324;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lJXjeQEubm8j9rzfDm3JhpB2lxNrpssVrF6JxlheeFU=;
        b=gX0V4gsUX2BCPQGDfS8bQhBNppv/Dp57I9gUuYPSnrViHtZR2cdoSKP7qwrUPygzsu
         2ELiXD5rJhY7/i/jt2Zv7iGmvv3D5rL+2hpfbuP8uSaLkJgQVN0+H5oc91tR/zIb3C2X
         nQytlmH0qmd7HbQtRHjxDXuBhZRFSn1Stkl08SpvYU7p13pSck77Gl1a03EZckS+sxFM
         Cbre5DmxES6Nx5AkhL6Mfklx9oFzbE45RRTutjgS5nmcsprVJ1ehGCOi7vTYX7EkjNR3
         QGZ+nflvdCiqskBiyHBnr72KkbbOWOykxvl+VIXxEck0SwJ48msPTsTIvDkJ1bVH09wX
         kDwQ==
X-Gm-Message-State: AOJu0YypqbGOyNs5ltwaqjN9eQ5pDtLdV1I9eLnpDX2o8GDHzB1eBLP/
	oWV0cJ+gyUOd8cKJGhT71Iz9UEAXICkckzQFqXzUpLJBUEftU172uPBNAWRY+dabpCHbzXfWyus
	HG6VpzR/n0A==
X-Google-Smtp-Source: AGHT+IFVFwlZU1PraJh7zR4KWB5k+lXQt0DhRwiJsHwWvJZodZ5pAkCM37kDWlFescohXveYraQyCFA+NS+Tqw==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:f87:b0:dbe:30cd:8fcb with SMTP
 id ft7-20020a0569020f8700b00dbe30cd8fcbmr71259ybb.0.1712326523732; Fri, 05
 Apr 2024 07:15:23 -0700 (PDT)
Date: Fri,  5 Apr 2024 14:14:06 +0000
In-Reply-To: <20240405141411.1807189-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240405141411.1807189-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240405141411.1807189-12-panikiel@google.com>
Subject: [PATCH 11/16] media: spi: gs1662: Switch dv timing callbacks to pad ops
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
 drivers/media/spi/gs1662.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/media/spi/gs1662.c b/drivers/media/spi/gs1662.c
index 75c21a93e6d0..44f97e99ff15 100644
--- a/drivers/media/spi/gs1662.c
+++ b/drivers/media/spi/gs1662.c
@@ -259,12 +259,15 @@ static inline struct gs *to_gs(struct v4l2_subdev *sd=
)
 	return container_of(sd, struct gs, sd);
 }
=20
-static int gs_s_dv_timings(struct v4l2_subdev *sd,
+static int gs_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 		    struct v4l2_dv_timings *timings)
 {
 	struct gs *gs =3D to_gs(sd);
 	int reg_value;
=20
+	if (pad !=3D 0)
+		return -EINVAL;
+
 	reg_value =3D get_register_timings(timings);
 	if (reg_value =3D=3D 0x0)
 		return -EINVAL;
@@ -273,16 +276,19 @@ static int gs_s_dv_timings(struct v4l2_subdev *sd,
 	return 0;
 }
=20
-static int gs_g_dv_timings(struct v4l2_subdev *sd,
+static int gs_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 		    struct v4l2_dv_timings *timings)
 {
 	struct gs *gs =3D to_gs(sd);
=20
+	if (pad !=3D 0)
+		return -EINVAL;
+
 	*timings =3D gs->current_timings;
 	return 0;
 }
=20
-static int gs_query_dv_timings(struct v4l2_subdev *sd,
+static int gs_query_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 			struct v4l2_dv_timings *timings)
 {
 	struct gs *gs =3D to_gs(sd);
@@ -290,6 +296,9 @@ static int gs_query_dv_timings(struct v4l2_subdev *sd,
 	u16 reg_value, i;
 	int ret;
=20
+	if (pad !=3D 0)
+		return -EINVAL;
+
 	if (gs->enabled)
 		return -EBUSY;
=20
@@ -410,14 +419,14 @@ static const struct v4l2_subdev_core_ops gs_core_ops =
=3D {
 };
=20
 static const struct v4l2_subdev_video_ops gs_video_ops =3D {
-	.s_dv_timings =3D gs_s_dv_timings,
-	.g_dv_timings =3D gs_g_dv_timings,
 	.s_stream =3D gs_s_stream,
 	.g_input_status =3D gs_g_input_status,
-	.query_dv_timings =3D gs_query_dv_timings,
 };
=20
 static const struct v4l2_subdev_pad_ops gs_pad_ops =3D {
+	.s_dv_timings =3D gs_s_dv_timings,
+	.g_dv_timings =3D gs_g_dv_timings,
+	.query_dv_timings =3D gs_query_dv_timings,
 	.enum_dv_timings =3D gs_enum_dv_timings,
 	.dv_timings_cap =3D gs_dv_timings_cap,
 };
--=20
2.44.0.478.gd926399ef9-goog


