Return-Path: <linux-media+bounces-8748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF9C899F40
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 16:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 070AE1C225B4
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 14:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223AF16F0FF;
	Fri,  5 Apr 2024 14:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cvaz3ecz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C7716F0CC
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326509; cv=none; b=rO3BsvrJV/MFqYX2OtnsHjpPou9dtWiFX2QOeTwS7/tWrJ0aD4oFaq2LuBpAyJMUkwBwASx3NPiVjSVzeEjJc/uPgRlHvKPmnPy6WSy7aPQPMJmbNY/B8I1rEGB2tbnV9yB5FAioSg+KInf8U+ysGSAqc3AqxjZbiMETTMBlyno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326509; c=relaxed/simple;
	bh=iylO9QdIY6acvXIk57+sD8IMYliPnmH08v8DfuMIWpw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LxYmhLbH+1mSAJmCzdEKCjo/AVfa/jI6CAf/yCK0PTlafOdAIuGVHW1nt0B78YnvCCGQowmrcFSPOYCS8a8+xnXaSZbI8cH9haZ/dai+UGbHMidxVvMT3+9iY7AmjZ0KZgi2thDqOQjfGy+0tFDYN3mBb06vEhDj6OATxeGCiCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cvaz3ecz; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcbfe1a42a4so3759830276.2
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712326506; x=1712931306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/Y7QBSs5jxIOwBWz8/SWyYZH9f8APjHhQAUen0aR5o=;
        b=Cvaz3ecztK7QiHLYudSp4uip7Nc6m5FTdgW1nGERFl1sSnImCnMFBhZWdyFl2oyWnk
         +KppcYTs19XDsvzeT9EVkguEiurx51Ax7V5QmNe7wKvq+P1DYMSRjOfC6Y504EFb5UJx
         zvHX238iiZZVM5EGzH7XckfQjk2ezOhfezVmCSiTo6veLlUb0SblOIvcIrJwolrCBOcp
         w26Bz0GiTPvje5f3RTPjrdk2m90f6zZ6jkjpG64inrQjAgGRNhPXHG9sGD3VgJWo3JFR
         QYiUK+91WgLHvVSM1YyBVQ93GM+EWWmVJm572Lie+rmsfPJakwwdoeJwfuGq0quDE5yc
         tm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712326506; x=1712931306;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G/Y7QBSs5jxIOwBWz8/SWyYZH9f8APjHhQAUen0aR5o=;
        b=QiAtJhUUqbLqySsFtmc1jhAaWMzrb5R1qJn2GUXxomYIAomda2h9ImVtC1F8JtwxOG
         XtOATGqx03peA9iuPjLyB5Th/nVwbF945lI50r8qNW+/pcMfsweeOUZC0e0Qe98Yl9ji
         DxAvK4Q+gLT6ZwOyds7cwNt7CRrSBhTZvmt3pvd+B11ge6ZKwdU01lux//2BiFimdqZq
         VTstk95H20e97g7Kyu6JKkvoWTuym4q9QePww4XjmOAarx8sOyVC5J/l5AceiONTd7iS
         XZPz4QBNE0MLSdb0dohkWsz2HH2wXLJuG0kmYgP52qEj8TW3yaG0luZRdYv/gGeB/6qV
         D51A==
X-Gm-Message-State: AOJu0YyQfnNvze94unyuvcL8zs/M0QlOdjCpkW3hpco+W+Wf4OwGSZ5c
	KGO2S4gmC3BvTKmnJPTPw3wpvIjh1HpY3NLXuSPT8RUpo93IXWrrL2/xS+Ciug6lCsN+qgxdhOE
	4E2Sno5A5Fg==
X-Google-Smtp-Source: AGHT+IFl16zX1rOrdVwa2sMyYfgvPB9BWMtRkPdr6CNPVhFQBRvPklQwYD9v0qOkBRPDEwYWoreVm7kZ3ErTug==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:100b:b0:dcc:6065:2b3d with SMTP
 id w11-20020a056902100b00b00dcc60652b3dmr393635ybt.8.1712326506516; Fri, 05
 Apr 2024 07:15:06 -0700 (PDT)
Date: Fri,  5 Apr 2024 14:13:58 +0000
In-Reply-To: <20240405141411.1807189-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240405141411.1807189-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240405141411.1807189-4-panikiel@google.com>
Subject: [PATCH 03/16] media: i2c: adv7511: Switch dv timing callbacks to pad ops
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
 drivers/media/i2c/adv7511-v4l2.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v=
4l2.c
index 0f780eb6ef63..00fbe411429a 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -995,7 +995,7 @@ static int adv7511_s_stream(struct v4l2_subdev *sd, int=
 enable)
 	return 0;
 }
=20
-static int adv7511_s_dv_timings(struct v4l2_subdev *sd,
+static int adv7511_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 			       struct v4l2_dv_timings *timings)
 {
 	struct adv7511_state *state =3D get_adv7511_state(sd);
@@ -1004,6 +1004,9 @@ static int adv7511_s_dv_timings(struct v4l2_subdev *s=
d,
=20
 	v4l2_dbg(1, debug, sd, "%s:\n", __func__);
=20
+	if (pad !=3D 0)
+		return -EINVAL;
+
 	/* quick sanity check */
 	if (!v4l2_valid_dv_timings(timings, &adv7511_timings_cap, NULL, NULL))
 		return -EINVAL;
@@ -1042,13 +1045,16 @@ static int adv7511_s_dv_timings(struct v4l2_subdev =
*sd,
 	return 0;
 }
=20
-static int adv7511_g_dv_timings(struct v4l2_subdev *sd,
+static int adv7511_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_dv_timings *timings)
 {
 	struct adv7511_state *state =3D get_adv7511_state(sd);
=20
 	v4l2_dbg(1, debug, sd, "%s:\n", __func__);
=20
+	if (pad !=3D 0)
+		return -EINVAL;
+
 	if (!timings)
 		return -EINVAL;
=20
@@ -1078,8 +1084,6 @@ static int adv7511_dv_timings_cap(struct v4l2_subdev =
*sd,
=20
 static const struct v4l2_subdev_video_ops adv7511_video_ops =3D {
 	.s_stream =3D adv7511_s_stream,
-	.s_dv_timings =3D adv7511_s_dv_timings,
-	.g_dv_timings =3D adv7511_g_dv_timings,
 };
=20
 /* ------------------------------ AUDIO OPS ------------------------------=
 */
@@ -1403,6 +1407,8 @@ static const struct v4l2_subdev_pad_ops adv7511_pad_o=
ps =3D {
 	.enum_mbus_code =3D adv7511_enum_mbus_code,
 	.get_fmt =3D adv7511_get_fmt,
 	.set_fmt =3D adv7511_set_fmt,
+	.s_dv_timings =3D adv7511_s_dv_timings,
+	.g_dv_timings =3D adv7511_g_dv_timings,
 	.enum_dv_timings =3D adv7511_enum_dv_timings,
 	.dv_timings_cap =3D adv7511_dv_timings_cap,
 };
--=20
2.44.0.478.gd926399ef9-goog


