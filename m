Return-Path: <linux-media+bounces-18764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30914989BCF
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D3F71C216BC
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 07:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A713161328;
	Mon, 30 Sep 2024 07:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg89WdR9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9B446444;
	Mon, 30 Sep 2024 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727682370; cv=none; b=XpigXuMp0aSAcPg4wuAHiQvUpYVg0VTDU/B/aEefH/CvH5fyIox1BxqQ89sr9eaO5pzh8bu68+bxbC3KUO6Nv/bqjQqIgS3y0yW6dWEK2TDrJJ9RrSUNNt8jpzXDNpKZUikB3J77pZXvGA3IjQRfyBx0GWAkw4tdZIwtu0E+E/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727682370; c=relaxed/simple;
	bh=BQpQRKotpPUbROJEka7Jc0JMq31sph1t38NhhhefHLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nkEYkzRmzYAlGBspoS4a37EAxfCG23YR+w2LvpRqyop6ic4qpi2LOxnhzZHlVIrsg4pv2GTZYjGhH3SPLj1usNBXg7v+xHHyUJPVDz8FYME2bmmNQqMuD/APnssmRobmljMBBM8Lgk6eLbRNz6UcKnHzoSBBErQtjuCGi3h55TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg89WdR9; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c87ab540b3so5898915a12.1;
        Mon, 30 Sep 2024 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727682367; x=1728287167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d1exfD00/TC4+inACEcZfqiu4Lapq/4PqvMhcA5g74M=;
        b=hg89WdR9NJ/gj4f3uHr73T0zIhKXbukJBIquGCuhD0/ViznslBqgU2fcK56zVLyLoQ
         YTY3l9G08A0+31IP3MHp9DfArjGeWopyWFvA0W/uY+JNkzJLtlE6ZWlZtUeKHuuilyQ2
         XXcfOTPI0vO9auGIgNQbaJUx2JHDEhttZsCgln7p9inB3Gbb6m0XMv8wxJ1hzHa0IwLJ
         qS1huVU7y6+GGErypBQ24Ghz07rboMwMBC1NA/xUcD8BcyoAkuMrzhOM/37buJPAiYuu
         9MlP2KcgRyQaNzVPW/YQy0VYfdqrOf5Fy+DP3GeDh3NbEBAnMiG+VSToFEaKK49Cyxn/
         4x3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727682367; x=1728287167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1exfD00/TC4+inACEcZfqiu4Lapq/4PqvMhcA5g74M=;
        b=tNv2XSqXen1hBRQIpaAUsC/s8p3wzBtM+IlsyqsJdhDuTO86UvcK348PZjO0Ri+O7J
         E6Qnix9LO11DxtuJrpYPsTrrCGnDFzI7Oiiq27ktuJfSgIns1PIksLkq/pDiKJJ67+Tv
         aIR1Umm9NqMIA1azANNz30i2z3f2M15t8OqA40rjh9g93SL6POrU9GamT+fTkQ23KE5B
         TjmB7Nt4S/hDDvHsiF9V4r3f7u4VAGWx4tlSZDyR7pc95LJ/gwdTJDESxyqR58OO9mq9
         Z9n0aaCLuaz71um/n0bLQlYsEQd41IMFDQo8hcHzc4+CyzI7bwLMF5z65BWAaFwDBifc
         ifHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDhjIWjRWum0DqSoDEkbiCvqnxwIiNB/KnGEfovY/JjKE6YF30x6T1xi1ghLIk3ZcRezIpuL5VMuhPO4M=@vger.kernel.org, AJvYcCWCbSUNz1clzTJVyjM2kNObTGHnqPPiblre47/9Mb0QlfBOnNy9hkhqfGs/BKZY2qfZgc8LGhKKNgRcoXp37JGCcRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XC+iZ0/75c3wm7hQdbLv/6bSxRUICOw4tIEapczYtFYZ1+qX
	TeO7TXMr+rj2fJsiZ0m3lzDE9mAge0gfaN3v/NESw+i0bbo5DrK9
X-Google-Smtp-Source: AGHT+IH3MC1zbtISzeMVpxWS/AMA/s1zFFnCt4GVBZkEpHuH64UaLW2tas/0oGWuozwBI3qhjEAcDQ==
X-Received: by 2002:a05:6402:5407:b0:5c8:81a6:f14c with SMTP id 4fb4d7f45d1cf-5c882455c96mr12523719a12.9.1727682367114;
        Mon, 30 Sep 2024 00:46:07 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88240517fsm4128885a12.4.2024.09.30.00.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 00:46:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] v4l2-subdev: Return -EOPNOTSUPP for unsupported pad type in call_get_frame_desc()
Date: Mon, 30 Sep 2024 08:46:02 +0100
Message-ID: <20240930074602.500968-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The `get_frame_desc()` operation should always be called on a source pad,
which is indicated by the `MEDIA_PAD_FL_SOURCE` flag. This patch adds a
check in `call_get_frame_desc()` to ensure that the `MEDIA_PAD_FL_SOURCE`
flag is set for the pad before invoking `get_frame_desc()`. If the pad is
not a source pad, the function will return an `-EOPNOTSUPP` error,
signaling that the operation is not supported on non-source pads.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index de9ac67574bb..ea8e8976272d 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -325,6 +325,9 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	unsigned int i;
 	int ret;
 
+	if (!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE))
+		return -EOPNOTSUPP;
+
 	memset(fd, 0, sizeof(*fd));
 
 	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
-- 
2.43.0


