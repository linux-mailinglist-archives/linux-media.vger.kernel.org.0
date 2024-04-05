Return-Path: <linux-media+bounces-8749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD38899F41
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 16:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B2EB1C2216A
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 14:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B154816F27F;
	Fri,  5 Apr 2024 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EiBJ9d/x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA20616F0F6
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326511; cv=none; b=mcueNhlZeKmZ75cCo5KbHmV2MEjHMZ8adrzipPp0k4VmGAIHZnNfjEg9mYVqcsJOrwTfx/OcZMvbJQFTveG3VorUZ7iL6DswXEreGuelGeUZONB5iKYosQuypq3FEyR1ZzgXbCI5nVfwSTcHi3NyZwyCA+lXVAIuuu6576hojdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326511; c=relaxed/simple;
	bh=idYrd+JwFJEmpLa5TUjmluycyXqG6/ydzEQ0w5bLKts=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y8U0S/xlrZ84zLVDP54AnmGwCJPl42h1dZfJObW1RpzZ0NCxpqCZ4WSkl9AMfRMwTOAY2RXQwSbiJyKP4hOY0VbkFCwilwgVeYqe2a7AwHsc56vP/9UbHBfJE/lAvjytV0eMvMTlSHH3DMQTsIputcwGMK9tq2bdGwIuTnP+Ub4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EiBJ9d/x; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcc0bcf9256so2908520276.3
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712326508; x=1712931308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdSgusrl9te1mUbflA4RpHsrzTFXpOMOzAPL8Ip4ilw=;
        b=EiBJ9d/x/t09F9LMVgs6z4RGVViUk67UgdWAXJe+kD3UBIIgdX5etzfNa8AHsB8CFH
         0TzCq9rk8L5pJkaW9x4lUNDpVfmW8v3jKjuEcJ8M5HOXArjP1KqxssqzVWzF/Zfakj1a
         6YGNZgC5B6X1IdH5gn3Xk1YH3ai5NM2/BHKU5boNvx2eBZ0rsOkGcmGdwD71kq44g3XL
         PrCTexR4gVIVt/Lnwe4hgsM3fh+9J8QFdyUeuesGzGFEDteEUL3R3aZXktjiXojLXD30
         lHc+QgQZtCRaGb0kqE/+Ff1ZPBjtfBRnIgDUDByYBWIeG1V5LSUM9ubdCjooYRJbDfmp
         MbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712326508; x=1712931308;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JdSgusrl9te1mUbflA4RpHsrzTFXpOMOzAPL8Ip4ilw=;
        b=YD/4XJcDoQIdqZqhxbcmtg3xDpgVukjy/mUgsbVVYoUelTNz6RbVEA/949SmlE41iY
         zS5kiWBlcTG08s6wVdKEqBnYVf6t3MCMcQzIaR4T9isJ/4glqecb5n9xoKnJEJTVRM+U
         Dp9tS5xkAb8zy/ZGX2LiU3yUyeC6GWgOMbkXUPnKJDpJ3uG+0iMevgvgr4R8RlsUc+2E
         QdishjQLzcPd0c8zNvTB0JWwpzVjZurm6dM6nS3gk+taf7BRl+029zuv2OiFxsm/GyGb
         6BfV+kZuMumLGK1CdUrhN1KyCbbPiAg92Q/i3Rv+KT4kZegFVT6QxjjmSi4N+6L/ZIlR
         S4Rw==
X-Gm-Message-State: AOJu0YxSFWogghL7ZKSqObtVRd6VICGqB0i37B17EVYsNhjvBsg+U7Cm
	uAg5EIsuRj294TedyEwvvG7lHEhvuyptPQVHlaxSUwx/nOsydoETSQjGMrOnRwkdva8qyrqldXm
	qQsWob2DyWA==
X-Google-Smtp-Source: AGHT+IEaUHqRZ1t/645SPuoM0Mq1wtBDlBAVyUzDU3uFVn4lz8fochNj8syLSt9Fpo1fHuDprzN3KNVBj/p5rA==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:100a:b0:dc6:c94e:fb85 with SMTP
 id w10-20020a056902100a00b00dc6c94efb85mr71969ybt.2.1712326508757; Fri, 05
 Apr 2024 07:15:08 -0700 (PDT)
Date: Fri,  5 Apr 2024 14:13:59 +0000
In-Reply-To: <20240405141411.1807189-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240405141411.1807189-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240405141411.1807189-5-panikiel@google.com>
Subject: [PATCH 04/16] media: i2c: adv7604: Switch dv timing callbacks to pad ops
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
 drivers/media/i2c/adv7604.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 319db3e847c4..404ccc9b42f0 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -1557,7 +1557,7 @@ static unsigned int adv76xx_read_hdmi_pixelclock(stru=
ct v4l2_subdev *sd)
 	return freq;
 }
=20
-static int adv76xx_query_dv_timings(struct v4l2_subdev *sd,
+static int adv76xx_query_dv_timings(struct v4l2_subdev *sd, unsigned int p=
ad,
 			struct v4l2_dv_timings *timings)
 {
 	struct adv76xx_state *state =3D to_state(sd);
@@ -1687,7 +1687,7 @@ static int adv76xx_query_dv_timings(struct v4l2_subde=
v *sd,
 	return 0;
 }
=20
-static int adv76xx_s_dv_timings(struct v4l2_subdev *sd,
+static int adv76xx_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 		struct v4l2_dv_timings *timings)
 {
 	struct adv76xx_state *state =3D to_state(sd);
@@ -1730,7 +1730,7 @@ static int adv76xx_s_dv_timings(struct v4l2_subdev *s=
d,
 	return 0;
 }
=20
-static int adv76xx_g_dv_timings(struct v4l2_subdev *sd,
+static int adv76xx_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 		struct v4l2_dv_timings *timings)
 {
 	struct adv76xx_state *state =3D to_state(sd);
@@ -2607,7 +2607,7 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 				stdi.lcf, stdi.bl, stdi.lcvs,
 				stdi.interlaced ? "interlaced" : "progressive",
 				stdi.hs_pol, stdi.vs_pol);
-	if (adv76xx_query_dv_timings(sd, &timings))
+	if (adv76xx_query_dv_timings(sd, 0, &timings))
 		v4l2_info(sd, "No video detected\n");
 	else
 		v4l2_print_dv_timings(sd->name, "Detected format: ",
@@ -2726,9 +2726,6 @@ static const struct v4l2_subdev_core_ops adv76xx_core=
_ops =3D {
 static const struct v4l2_subdev_video_ops adv76xx_video_ops =3D {
 	.s_routing =3D adv76xx_s_routing,
 	.g_input_status =3D adv76xx_g_input_status,
-	.s_dv_timings =3D adv76xx_s_dv_timings,
-	.g_dv_timings =3D adv76xx_g_dv_timings,
-	.query_dv_timings =3D adv76xx_query_dv_timings,
 };
=20
 static const struct v4l2_subdev_pad_ops adv76xx_pad_ops =3D {
@@ -2738,6 +2735,9 @@ static const struct v4l2_subdev_pad_ops adv76xx_pad_o=
ps =3D {
 	.set_fmt =3D adv76xx_set_format,
 	.get_edid =3D adv76xx_get_edid,
 	.set_edid =3D adv76xx_set_edid,
+	.s_dv_timings =3D adv76xx_s_dv_timings,
+	.g_dv_timings =3D adv76xx_g_dv_timings,
+	.query_dv_timings =3D adv76xx_query_dv_timings,
 	.dv_timings_cap =3D adv76xx_dv_timings_cap,
 	.enum_dv_timings =3D adv76xx_enum_dv_timings,
 };
--=20
2.44.0.478.gd926399ef9-goog


