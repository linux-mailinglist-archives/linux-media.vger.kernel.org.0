Return-Path: <linux-media+bounces-8760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6201899F5B
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 16:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB8ADB227DA
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 14:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43621171E5C;
	Fri,  5 Apr 2024 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lGfM31qn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCB017167D
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326534; cv=none; b=bbrSn4HvnKv5eQj00dT/YcEPw5QxxRRc+NebggUpwAgV/Ys71T1P5dLxwoc52awx60ZSvD6M6gssdPYB+KU290jzYL4X09fTOtg7HbFDkI9DvY4lHrah6Vm8KClFUtR5DoCk6u3HUQKALLH/CkXerz8u6CUBoK3h2KEWWGMoIVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326534; c=relaxed/simple;
	bh=l0oG3N8c8mojKDmxECCVZ1V3hwbkCu1xRwc6SEUeGck=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pRHnXGxxPXfsqzpv/723Qzc5mqKeK/V66+bC2Xw0Qkr5xkHs+MR1jl+VGgVqV2fhpzFDoPbtQEfeSiHkMwonYwEK4RpjxHPKJc1zSMU2iHiRzgIOptqo3v9jaXV26gG+eEyydwNjFkZvD1IHjto+jho2LQ8Rmbh5WdrccuLculg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lGfM31qn; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dd8e82dd47eso3266561276.2
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 07:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712326532; x=1712931332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIc/vnSojBwtbKTlmQZ+P1NRRI2WMTZiwEa64VZPTHs=;
        b=lGfM31qnbTW8rUmAx5p+NPQwxJZcUuZOLG4Y2sn1VWK7CmT6WR3G65fN9SExuf4cQ4
         kQxcpxezF8f1dO36zRBubuRdpDoDQcEHaPYBZNpgij9d6opO2ev25X/QOtRSCKx6YAd+
         zgM7mx39tC5sApE94sTL24ZWxsjNvmMF9cvsBKZ/7qfp8QF/ThdVIVQ/OQpQdhjEiKUw
         pWfQ+cu5uF8dCNPZvJ2Jz/DuA34hVNiYhjFmVshHDrnMXsZBZNxaiKW3rlGf69aJN9zk
         zyUbw3nutYyEIu79f7fOq55MUNmCRliqtDS+spMzoYIi2HWPQEzCQqcvFAgDoN6TUwfh
         WBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712326532; x=1712931332;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HIc/vnSojBwtbKTlmQZ+P1NRRI2WMTZiwEa64VZPTHs=;
        b=KQbLXw0CZhFTIGICuL+lG9oMmF2Ep+gGpvX9VQuLWlfP5iRd7sSs9/4Un20oizm7zt
         iLwz9cnyh8NmEu5oz8GNZOd7rD4wnxTrtP5PoR1pcaBX1L1t0odmrkKKAC6pk/rSnO6s
         d5GoF6cQW2I+ZkNomtBwYv/4WAGZk4ZFqnwsQ6MU9Ft9iqgU8Vh06wvFA+PzseOdeD00
         04qrBnfoZlB0u6NPXBiVeTmPmOrRMoKs4Spxk+TsZTgdxLDZ1AUoSbSVZ38bm6dgVIpj
         3doe3zt5CtinQy06jXmau98+EYvAJZtoxGBefl6jNFUreo5/2cuFH9N6eqBOiUvyQNMR
         872w==
X-Gm-Message-State: AOJu0YxRl90YCg2bkJjlfjDWg/HL3hWbSpst48sKYAkPHGK4TI01rMAT
	B2iZvdKAHNLHk5eYRA+I6EVa0iYXIe3iwuOh/F/39Ib6BGQLt9QBfajPpQptzmdplnmZ2qmdEXb
	SZ/4mjyNq6A==
X-Google-Smtp-Source: AGHT+IEz1h6qQXkUMFl83+ZlYjZaKW4vvKVyMAs0V5zDifiOK4TkxQWVP3Z2WIWTgMXCjmjqeMR6zOmDG+MU6Q==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:100a:b0:dc6:c94e:fb85 with SMTP
 id w10-20020a056902100a00b00dc6c94efb85mr72164ybt.2.1712326532310; Fri, 05
 Apr 2024 07:15:32 -0700 (PDT)
Date: Fri,  5 Apr 2024 14:14:10 +0000
In-Reply-To: <20240405141411.1807189-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240405141411.1807189-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240405141411.1807189-16-panikiel@google.com>
Subject: [PATCH 15/16] media: tegra-video: Use pad variant of dv timing subdev calls
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

Use the pad variant for all (s|g|query)_dv_timings subdev calls, which
includes a pad argument.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 drivers/staging/media/tegra-video/vi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media=
/tegra-video/vi.c
index af6e3a0d8df4..57a856a21e90 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -719,11 +719,11 @@ static int tegra_channel_g_dv_timings(struct file *fi=
le, void *fh,
 	struct v4l2_subdev *subdev;
=20
 	subdev =3D tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, video, g_dv_timings))
+	if (!v4l2_subdev_has_op(subdev, pad, g_dv_timings))
 		return -ENOTTY;
=20
 	return v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
-					  video, g_dv_timings, timings);
+					  pad, g_dv_timings, 0, timings);
 }
=20
 static int tegra_channel_s_dv_timings(struct file *file, void *fh,
@@ -736,7 +736,7 @@ static int tegra_channel_s_dv_timings(struct file *file=
, void *fh,
 	int ret;
=20
 	subdev =3D tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, video, s_dv_timings))
+	if (!v4l2_subdev_has_op(subdev, pad, s_dv_timings))
 		return -ENOTTY;
=20
 	ret =3D tegra_channel_g_dv_timings(file, fh, &curr_timings);
@@ -750,7 +750,7 @@ static int tegra_channel_s_dv_timings(struct file *file=
, void *fh,
 		return -EBUSY;
=20
 	ret =3D v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
-					 video, s_dv_timings, timings);
+					 pad, s_dv_timings, 0, timings);
 	if (ret)
 		return ret;
=20
@@ -771,11 +771,11 @@ static int tegra_channel_query_dv_timings(struct file=
 *file, void *fh,
 	struct v4l2_subdev *subdev;
=20
 	subdev =3D tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, video, query_dv_timings))
+	if (!v4l2_subdev_has_op(subdev, pad, query_dv_timings))
 		return -ENOTTY;
=20
 	return v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
-					  video, query_dv_timings, timings);
+					  pad, query_dv_timings, 0, timings);
 }
=20
 static int tegra_channel_enum_dv_timings(struct file *file, void *fh,
--=20
2.44.0.478.gd926399ef9-goog


