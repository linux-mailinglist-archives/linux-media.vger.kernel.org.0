Return-Path: <linux-media+bounces-8751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DDA899F45
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 16:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E07E9283F66
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 14:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF0416F836;
	Fri,  5 Apr 2024 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IIPYXxXj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C05E16F29A
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326515; cv=none; b=PUY34/RtDYnPQU+GoWUEc+C12hx80SoB7ANHW6bu853hckB+L1/B7yDKt86HOhR+vSgdaM1q+hk7BYXgH8Xs6HDwNWFLsqQneqmYw6SoYuifwN5qnS6OFMLXTUevLs48WPk/9ZJpGbXPuM9gMaV4ogpG8Ii1UNOJCjtcMHs3vhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326515; c=relaxed/simple;
	bh=4wtNik17CJrGwo09hGU5FCupPfVKAQ7aXZ/lboHZCY8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EzDvuWptTAQEO5GJMLXobZzxaH2q/0CUtm1dJGpf2nYhxwh39AXsjvbQI1Qq5ypzclaCXeHolxiA9HjErNrPBmHr9mIBfdvwpdlm5rafK9jfg3JCL+7oblCYjMuCGjsSmsta11kPo0/vxv3eJ49de235aDSVbRLC2gKaVuNu2V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IIPYXxXj; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6ceade361so3774129276.0
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 07:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712326513; x=1712931313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Elc5l/UMF2FSTb8MiWLeLSVgKSF7YacOuvj79p+V2jg=;
        b=IIPYXxXjaykjQPMrEzLPVJmy22WhyOCQUXPZunT/nLENBxuS5nqVuKtMmtqaYtgH/p
         kYQex1NfKKuJaw5tR8WGbOdKsMWCtX/HY8R8GTaL7AGjuZyVsgVf6UaXzdOm8KrXf7ux
         RRJOdJ8V0N7CBAXc8rn9WVt9Pllu9Cch2HjVra8aLvu2eCph4gXjwac/NQ9uhwlXhr8X
         POrnxTbtIhZCPm9pmFoQlTS6Wf4n+7Pe9knhhftfSM8fLFPjj8rkuMJ2maFS/Zt7qcDq
         1AzHpsKxEBEncvyoLl78wqCaDzKz9UdPoOBXY2Fkbd9644jSh5CYh0MoPCPNP676zRLE
         afFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712326513; x=1712931313;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Elc5l/UMF2FSTb8MiWLeLSVgKSF7YacOuvj79p+V2jg=;
        b=LGnO2Eo3etQE3ASPa0JLM3/uvdaNnrKcpws9L9gdlQzu6vtmt7juNPPIkRK2VX/Rxc
         O0cvRcTvPCVxpflAvWMICh4rrnM8H/Babilsa6a467gWDMYbNi5Wa8pDoX9QoQPTpZmh
         ZIQ72IDZwosecBRBZPlHm6SOb+e3fCNCpwbliMrEQAAwwN0BsETccd4LTfotIXeY1jSa
         uHQhIxV/IHEdTRGwkfkruXppgfYHjN6vc7LUXW3HNP4uyrRhxUonVoZsQPYYH26V/Byo
         jw6SESVvi9myaCsbozPy5atBFjYDrm+/yxeIr15ITdZD4z72xSDaT6Pf0swOxDsNLqB7
         6v6w==
X-Gm-Message-State: AOJu0YwFF6Z+XnN1Bk3ap3MSILbqqJ9HFA269a7tF3JrPi94bSyhY6Rz
	OxKBBUf4IJ2I9A5WwFE1h5mYPcNuRwmefoQCbHnrTnmqTR+6atQbAiPJEmqistQOWZFc3/4kvoc
	uVBQeRfM10w==
X-Google-Smtp-Source: AGHT+IHNeI5HSh0A3wDhTGZD/QoxygxfQJND3EBhOMUo7WjeYvOYmOryZPypoQlS0NMtGL+mlRC1y7EXBD6Fnw==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:1108:b0:dc7:68b5:4f21 with SMTP
 id o8-20020a056902110800b00dc768b54f21mr374791ybu.9.1712326513206; Fri, 05
 Apr 2024 07:15:13 -0700 (PDT)
Date: Fri,  5 Apr 2024 14:14:01 +0000
In-Reply-To: <20240405141411.1807189-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240405141411.1807189-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240405141411.1807189-7-panikiel@google.com>
Subject: [PATCH 06/16] media: i2c: tc358743: Switch dv timing callbacks to pad ops
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
 drivers/media/i2c/tc358743.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 3192a334aaab..303c1d06c8b5 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1521,11 +1521,14 @@ static int tc358743_g_input_status(struct v4l2_subd=
ev *sd, u32 *status)
 	return 0;
 }
=20
-static int tc358743_s_dv_timings(struct v4l2_subdev *sd,
+static int tc358743_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_dv_timings *timings)
 {
 	struct tc358743_state *state =3D to_state(sd);
=20
+	if (pad !=3D 0)
+		return -EINVAL;
+
 	if (!timings)
 		return -EINVAL;
=20
@@ -1553,11 +1556,14 @@ static int tc358743_s_dv_timings(struct v4l2_subdev=
 *sd,
 	return 0;
 }
=20
-static int tc358743_g_dv_timings(struct v4l2_subdev *sd,
+static int tc358743_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_dv_timings *timings)
 {
 	struct tc358743_state *state =3D to_state(sd);
=20
+	if (pad !=3D 0)
+		return -EINVAL;
+
 	*timings =3D state->timings;
=20
 	return 0;
@@ -1573,11 +1579,14 @@ static int tc358743_enum_dv_timings(struct v4l2_sub=
dev *sd,
 			&tc358743_timings_cap, NULL, NULL);
 }
=20
-static int tc358743_query_dv_timings(struct v4l2_subdev *sd,
+static int tc358743_query_dv_timings(struct v4l2_subdev *sd, unsigned int =
pad,
 		struct v4l2_dv_timings *timings)
 {
 	int ret;
=20
+	if (pad !=3D 0)
+		return -EINVAL;
+
 	ret =3D tc358743_get_detected_timings(sd, timings);
 	if (ret)
 		return ret;
@@ -1822,9 +1831,6 @@ static const struct v4l2_subdev_core_ops tc358743_cor=
e_ops =3D {
=20
 static const struct v4l2_subdev_video_ops tc358743_video_ops =3D {
 	.g_input_status =3D tc358743_g_input_status,
-	.s_dv_timings =3D tc358743_s_dv_timings,
-	.g_dv_timings =3D tc358743_g_dv_timings,
-	.query_dv_timings =3D tc358743_query_dv_timings,
 	.s_stream =3D tc358743_s_stream,
 };
=20
@@ -1834,6 +1840,9 @@ static const struct v4l2_subdev_pad_ops tc358743_pad_=
ops =3D {
 	.get_fmt =3D tc358743_get_fmt,
 	.get_edid =3D tc358743_g_edid,
 	.set_edid =3D tc358743_s_edid,
+	.s_dv_timings =3D tc358743_s_dv_timings,
+	.g_dv_timings =3D tc358743_g_dv_timings,
+	.query_dv_timings =3D tc358743_query_dv_timings,
 	.enum_dv_timings =3D tc358743_enum_dv_timings,
 	.dv_timings_cap =3D tc358743_dv_timings_cap,
 	.get_mbus_config =3D tc358743_get_mbus_config,
@@ -2110,7 +2119,7 @@ static int tc358743_probe(struct i2c_client *client)
=20
 	tc358743_initial_setup(sd);
=20
-	tc358743_s_dv_timings(sd, &default_timing);
+	tc358743_s_dv_timings(sd, 0, &default_timing);
=20
 	tc358743_set_csi_color_space(sd);
=20
--=20
2.44.0.478.gd926399ef9-goog


