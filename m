Return-Path: <linux-media+bounces-8755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6F899F4F
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 16:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC0531F2675F
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 14:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9389916FF4E;
	Fri,  5 Apr 2024 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Se8eeWoI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AC216F91D
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326524; cv=none; b=dzwwZQ0R/E6dJ4IuI8IifBEXlXBmGgnVlknBkOb5vBexLJVSl3u67NtucTjwXuc0Ya+OtqOmm2XgzpeF1xW9ulN10blEt68zl08fIEcbQ+4/vkWXDVuIXdXhn6fWDIHgXPNe/40h24hEf40/KFdJRRqyLDPMtwACpbkg6mo9BMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326524; c=relaxed/simple;
	bh=5xnfmi2lBhW03BQCHOlNVYiVElPi3SW0dm8sNuaFNl0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Adh0HrH7QlawJRv1nm8MF6zZ5reTQmoC9wbN/EbLUsfif1iyAVbfPah1r3xRtrzCl+yXU6EPHxNcnLCaJlKo58I5F5PMZ2IFp6vVBm8Vq0+MmoBnIafMtHNWp/CyY+ujJc92WYsQTH6yMcT6WvJ02kVG4QJTg7nITc132+autAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Se8eeWoI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4162ba19021so7695435e9.2
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712326521; x=1712931321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsbtTl/lsCYzP7KPwMVeecq4kI9jqfdKIXhI66el1Xk=;
        b=Se8eeWoI87xA6B53PvKAoBuk0DYolqT2e1Ct54thzg3XTtLGnTP4W2FwOgw3aEFvRk
         +nd96GDpkFmuWkZUfM8MnDtuOGHXUDuxR9vRaWo90ymQieOMRCxt2C9av8rMurmmbk77
         PKKwGuDg1CUJbaNBDn318EUehdXAIuAhD82z+XO+REcaXwt3klGypAHKpgf5GHdVrYUy
         260/EMVDCKqGFuNjRvSXM1wqWq5C2UtZ3RZbIAnHP57jsYtLD/djIfSk8gpjtY+tSTj4
         s51Toj9fc0q4fNeqm1RAz7DNYEBwm2d431+wFrUpBZevBIxOU5LZ3FnM4xgi2rIwfcup
         KM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712326521; x=1712931321;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lsbtTl/lsCYzP7KPwMVeecq4kI9jqfdKIXhI66el1Xk=;
        b=iL/c3K6+sE2U7x5v/51aBNLHw2yDrVqlkAYUGZcje6BVQB0KCpehsJEVfGDUPvTpzV
         pxFiwBQ3LmS69RI4Wi+VwduU8Pddu3zFiGzCzOV2HUiZW7qiz1XYt11b39B0hVr/p7GG
         48I/0Dn1VJZxYxLFkV5DTCv08Ohaz8vztrzqMXIhHIlUx5yb67a/NFKrkhh7g2i2Pzto
         sBEB/0ckkXWWDrCuLyXJsxLds02xvSKj/tr/46zQ+NCh9Vgv3X7ZTYD6edeakPgT65bB
         HxZNAbQbFa8V+XZnsZHgq8N1OXwxQdzDJj1cZESrRZRbOaysAT+En0ODQnaPC6rMsMq2
         vV/w==
X-Gm-Message-State: AOJu0YwMYD2HzjH79M0Nnd/uO/r8FD7Zem6HLca7N7U9IZUgBNaHWo9n
	wQYsmLgkTWy/EnKzwT+TnQOqeokjy+DTIH0ltaTDJ/zAe8MKF0vJzVZuFAs7yJmjJzjq9p8WjtO
	tfVH6je9WJA==
X-Google-Smtp-Source: AGHT+IH7z/NIPYYuKTmisFXZIC5ABdbzSu5MmdtE9zAPHxlH0uA6LOlXz/68FujAlmVAv7FZ/1iKrTnqtbILTg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:3b08:b0:414:76ce:98fe with SMTP
 id m8-20020a05600c3b0800b0041476ce98femr4860wms.5.1712326521624; Fri, 05 Apr
 2024 07:15:21 -0700 (PDT)
Date: Fri,  5 Apr 2024 14:14:05 +0000
In-Reply-To: <20240405141411.1807189-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240405141411.1807189-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240405141411.1807189-11-panikiel@google.com>
Subject: [PATCH 10/16] media: i2c: tvp7002: Switch dv timing callbacks to pad ops
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
 drivers/media/i2c/tvp7002.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index 6a04ffae5343..881b54f46d41 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -546,13 +546,16 @@ static int tvp7002_write_inittab(struct v4l2_subdev *=
sd,
 	return error;
 }
=20
-static int tvp7002_s_dv_timings(struct v4l2_subdev *sd,
+static int tvp7002_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 					struct v4l2_dv_timings *dv_timings)
 {
 	struct tvp7002 *device =3D to_tvp7002(sd);
 	const struct v4l2_bt_timings *bt =3D &dv_timings->bt;
 	int i;
=20
+	if (pad !=3D 0)
+		return -EINVAL;
+
 	if (dv_timings->type !=3D V4L2_DV_BT_656_1120)
 		return -EINVAL;
 	for (i =3D 0; i < NUM_TIMINGS; i++) {
@@ -566,11 +569,14 @@ static int tvp7002_s_dv_timings(struct v4l2_subdev *s=
d,
 	return -EINVAL;
 }
=20
-static int tvp7002_g_dv_timings(struct v4l2_subdev *sd,
+static int tvp7002_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 					struct v4l2_dv_timings *dv_timings)
 {
 	struct tvp7002 *device =3D to_tvp7002(sd);
=20
+	if (pad !=3D 0)
+		return -EINVAL;
+
 	*dv_timings =3D device->current_timings->timings;
 	return 0;
 }
@@ -659,12 +665,16 @@ static int tvp7002_query_dv(struct v4l2_subdev *sd, i=
nt *index)
 	return 0;
 }
=20
-static int tvp7002_query_dv_timings(struct v4l2_subdev *sd,
+static int tvp7002_query_dv_timings(struct v4l2_subdev *sd, unsigned int p=
ad,
 					struct v4l2_dv_timings *timings)
 {
 	int index;
-	int err =3D tvp7002_query_dv(sd, &index);
+	int err;
+
+	if (pad !=3D 0)
+		return -EINVAL;
=20
+	err =3D tvp7002_query_dv(sd, &index);
 	if (err)
 		return err;
 	*timings =3D tvp7002_timings[index].timings;
@@ -861,9 +871,6 @@ static const struct v4l2_subdev_core_ops tvp7002_core_o=
ps =3D {
=20
 /* Specific video subsystem operation handlers */
 static const struct v4l2_subdev_video_ops tvp7002_video_ops =3D {
-	.g_dv_timings =3D tvp7002_g_dv_timings,
-	.s_dv_timings =3D tvp7002_s_dv_timings,
-	.query_dv_timings =3D tvp7002_query_dv_timings,
 	.s_stream =3D tvp7002_s_stream,
 };
=20
@@ -872,6 +879,9 @@ static const struct v4l2_subdev_pad_ops tvp7002_pad_ops=
 =3D {
 	.enum_mbus_code =3D tvp7002_enum_mbus_code,
 	.get_fmt =3D tvp7002_get_pad_format,
 	.set_fmt =3D tvp7002_set_pad_format,
+	.g_dv_timings =3D tvp7002_g_dv_timings,
+	.s_dv_timings =3D tvp7002_s_dv_timings,
+	.query_dv_timings =3D tvp7002_query_dv_timings,
 	.enum_dv_timings =3D tvp7002_enum_dv_timings,
 };
=20
@@ -1001,7 +1011,7 @@ static int tvp7002_probe(struct i2c_client *c)
=20
 	/* Set registers according to default video mode */
 	timings =3D device->current_timings->timings;
-	error =3D tvp7002_s_dv_timings(sd, &timings);
+	error =3D tvp7002_s_dv_timings(sd, 0, &timings);
=20
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	device->pad.flags =3D MEDIA_PAD_FL_SOURCE;
--=20
2.44.0.478.gd926399ef9-goog


