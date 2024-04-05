Return-Path: <linux-media+bounces-8758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8A1899F57
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 16:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CEFA1C22615
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 14:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DA2171654;
	Fri,  5 Apr 2024 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1NDS4pOq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A4917108D
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326530; cv=none; b=e2tfRnESuI8obLFcJsNJKanTN8+n4ueUjBn/jf8sdAgib0bZhQNEndLo1u26dxN3oqRarYMkUAejimMc46YcRQr5UkQHcdicK1Sjmrldj09nQa6jTiSYmJS3nUxCdY2RPvS4T8V18d6oFP3L5P3HrBjogQ1xIc3QFe/XKsKpQVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326530; c=relaxed/simple;
	bh=yvs5ohvMMIVQE6dxuoqe23hp8oOeKkHAZNgJM1b+eKo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mCUkyR1iDD/nMrV6wjHk1mJ9WURLZhMn2BfmcEsy9H2mQVzpDedlNyCDsP6t3AUHyJmBmBSlicWJG8OjK63N2OC+zk0bqAdciHCjfxWlL1z6jH0sdoIDA5Dn7pEesPfnhBII4lbwA44F7wyxAYMrkW+1+5SYvVMqNtBs3YuJtzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1NDS4pOq; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc743cc50a6so2965908276.2
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712326528; x=1712931328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/C3TWz2wSP1NLw9gzEQpvHS/0ZIC1cjOjpTFuVIJ/6s=;
        b=1NDS4pOqa1MUMC9X9Dt/O2w125FOzhVlpogK4thoUyLctqpGh6i+LY+PxQj3blJ1tX
         q1HxiQNm/TqaSWQXI4Dhd6Bpc3WbxrFWuHIIVl6NzsrNMeFOhG2pCso9dK6N2Znw2seH
         Jd0bIfy9dHMziuUc/RoqvpnmHX+uz2oJc7tDVtkB2rzWFhteVVq11SV/70QFLsBn6zPj
         toaipmG4wLpkq0u4SgM7qehQ/PGOJjAnZ9GzVBbu09qmALdAmIGrTGSjXjJHsk+ATIV6
         DA34rc44LaLekwFBaTkCRoQX881V9Jl0Y1YgCZwU04oQLTQOEDLb9+av/bVX3fzG7oto
         m0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712326528; x=1712931328;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/C3TWz2wSP1NLw9gzEQpvHS/0ZIC1cjOjpTFuVIJ/6s=;
        b=nonrmmuLnfLBNaYxxjjGST5SZi9e2SiAVeD35jeJLwMRpg5bHSj/vs+9nm3XMpdbpf
         cZnkBLVoSKtQ/7GmpLzhsrhK9jX29u8nbAsTK/RZPMPKRnE+aTc++PhpFYUypJ+FuYTx
         mr0xYyStMe0gyP3e0GERF6YkH/U1UW5OjPX3Xl2OH4Ixo7xfsrdpVUjlraqXLxCP5OW0
         z/7/aRO7lGg1GOEYEPLW2fDXKTG1OSFkN2+dp5AfSooLRkjOlV+OQcFQnemY+f/evLP8
         crNoeECBVTNEvEgyo0+wAMJN+DA/irz4PBFVmYbvxbSgwbylWoG/73bC493CHXXcz8AE
         5VhA==
X-Gm-Message-State: AOJu0YyrNK+gbK0N8+Ts7UcQ1hailornkC/XQX/5bhnqs55LifJvV9KM
	Xsc/BkDHIhvXUEauFu6gtvOswaY2O0BpSv9zQvIlrersdo+tuOT1SKQMDNzHwlcPYds1dqQjWo2
	g5WJQPpFXJA==
X-Google-Smtp-Source: AGHT+IEvp+BsuWIh3iX4/LFegWn3KNCA11AfpYD2+Kk6/aMGIrt5lA5NyDXfFDJdRSyf+ooQiTrgoqyEH/yGTA==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:1108:b0:dc7:865b:22c6 with SMTP
 id o8-20020a056902110800b00dc7865b22c6mr78546ybu.8.1712326528036; Fri, 05 Apr
 2024 07:15:28 -0700 (PDT)
Date: Fri,  5 Apr 2024 14:14:08 +0000
In-Reply-To: <20240405141411.1807189-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240405141411.1807189-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240405141411.1807189-14-panikiel@google.com>
Subject: [PATCH 13/16] media: rcar-vin: Use pad variant of dv timing subdev calls
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
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/=
media/platform/renesas/rcar-vin/rcar-v4l2.c
index 073f70c6ac68..bb4b07bed28d 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -730,7 +730,8 @@ static int rvin_s_dv_timings(struct file *file, void *p=
riv_fh,
 	struct v4l2_subdev *sd =3D vin_to_source(vin);
 	int ret;
=20
-	ret =3D v4l2_subdev_call(sd, video, s_dv_timings, timings);
+	ret =3D v4l2_subdev_call(sd, pad, s_dv_timings,
+			       vin->parallel.sink_pad, timings);
 	if (ret)
 		return ret;
=20
@@ -744,7 +745,8 @@ static int rvin_g_dv_timings(struct file *file, void *p=
riv_fh,
 	struct rvin_dev *vin =3D video_drvdata(file);
 	struct v4l2_subdev *sd =3D vin_to_source(vin);
=20
-	return v4l2_subdev_call(sd, video, g_dv_timings, timings);
+	return v4l2_subdev_call(sd, pad, g_dv_timings,
+				vin->parallel.sink_pad, timings);
 }
=20
 static int rvin_query_dv_timings(struct file *file, void *priv_fh,
@@ -753,7 +755,8 @@ static int rvin_query_dv_timings(struct file *file, voi=
d *priv_fh,
 	struct rvin_dev *vin =3D video_drvdata(file);
 	struct v4l2_subdev *sd =3D vin_to_source(vin);
=20
-	return v4l2_subdev_call(sd, video, query_dv_timings, timings);
+	return v4l2_subdev_call(sd, pad, query_dv_timings,
+				vin->parallel.sink_pad, timings);
 }
=20
 static int rvin_dv_timings_cap(struct file *file, void *priv_fh,
--=20
2.44.0.478.gd926399ef9-goog


