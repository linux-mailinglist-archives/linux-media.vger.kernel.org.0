Return-Path: <linux-media+bounces-29803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0AA83337
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 23:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A21C3AE80F
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 21:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796DD215162;
	Wed,  9 Apr 2025 21:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6kAg0M2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AFD202C40;
	Wed,  9 Apr 2025 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233468; cv=none; b=YYYiSS2qAHeyrGXry8bzYbOuVTpKIXYJa0kSarWSt4LGIwzZFKK5IdkEN/fikGXamYJ+SB09cneAkY5m+PF/USw9j6eeHdmKUBPDjkIQP4TJEDAarr3B8DRmBeifZnGjLWWTEZYicCy/7OnDLFCUgub6ga9IqFqqAu7obbXFdY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233468; c=relaxed/simple;
	bh=JVLsErMm1lbZgGTUGBXuZBa0TVE6alCzPguq9pnhM9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hkL1cuQcvYHyzqgP52ImBc/6kFpcujTi18jGydeqMqdZ9vrduIuTV6gYzJva5XQsAyCHbGtVnepiLVTyLCpqnZ5z5Jo1ovrwkepWZaXVZBqtAiqC5DxXfh/JLGM7sjdk0FNxXckKcJHWX+bgPGHMwl5sTXX12guoPRy8OnyW5VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6kAg0M2; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-736c1138ae5so61107b3a.3;
        Wed, 09 Apr 2025 14:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744233466; x=1744838266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6pVlwzrEmx32p/oFLtQxJLU3h+GY6t/2EgH6uv7p6PI=;
        b=U6kAg0M2Ip5KpP5w2LtDKD05MfmghlG4Zt878OtU9/mKiQIO9d0VXs2pJmGyQHTDt3
         BsNYPPL2uLBLkOg2HVkaFJJk2mNvRrYREK9Fa1RyOEYHdmGWPXH4GP3xDFfNXCEluUpq
         bj0kfZplfoosvkOAV7xCfm2JT1Q/dKdEvxStxAqVRKZe2DGYsv0G03LV6j+whL6kYaqt
         cJDnJcdfd+gRbgknGKvcnGMERv3/KaYNov3F+RzzxYnoli481fkUZfMFXBz3WSBWyfm2
         0M2AUlSXjhzy5yT+NxETqUYo/Qy3fm4Bc4YHq4U6dtq4+qNVEwD2yWA/oQr4s0ANrUam
         gdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233466; x=1744838266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pVlwzrEmx32p/oFLtQxJLU3h+GY6t/2EgH6uv7p6PI=;
        b=Fo+DE46RHIbqbne4mmMko41RkHjhPph9Ccn/q7AcPH40uGit5OujwSa4kNfmlbNJRf
         uaJ5zTlDN+AaB6Isr4UQ2rk+bloxu4OVDjqEXf53MLVpfqrrgQ9TTq8A6ILyBc0lGHBd
         owrfjscaVDpX1rFkZUV55KT0aT+43cSDgnnSjtH8lKGwjun+VrxMyQfuITiwhUoU2uwh
         FJnTmNbw8NEA6f4kEjxWsSfv4SDrYPw/E/OiMVEzwiqeFsknQouBvISQPBjFlMmu2kqb
         y2qtDnvjCL4IOFP9FluVueCk0rw9h5VWYxNxEkOeh3DbgWPlYiWj6PCVdchFOQVgmsHC
         pLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIjZGmwxjZy78bbJed2rDLYqtdBY4sOIi/EmZxH7wa3X6Z9Bx1ozcwwG5d4mkWQvNZ8tzMIv4TLladknU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynmrn5kAwUmqXLqA4FpM5UN635Ky8pAWuBmT6gqCzevFGjlRED
	zhuI5DBZH5vhoTUf87cjQkCIUCjod7lbw6BaFdlIVqX0pK7jqomM
X-Gm-Gg: ASbGncvkIdLndgOw3jKmPh80goULWAPSi3wwYAxa578L5+qQAPVPJbc9A7LsUeQxhcU
	E/NpI6Pxnyj0uDaLbEyllAB66Q8J5m9SRkrCZHMoJgAEniciSEamvJS6uxVogLlebeS/E6yidyD
	oHkeDswdiVmfYTY3R4VnMppDPDvOjcHyn8Uz9hGyHS5dbpLjBkADFssDbIN5a2JdYN47rFskdwf
	OsTCau43FyqLHKWtHGXnPHf7jv/0BGi5IPO2uvPpapGjdKumdm9AVjpxK+PiH1CPxMXYFWer4fk
	p30JlhpX4FFb9qXroS76cpLi3IhhaS+oHkZu0Jj12hT5Anx1FgKy2NCYtfc=
X-Google-Smtp-Source: AGHT+IGmPmWoSu8tga2SfVkZJNouE0+nOCKOrGe4roKu39WWRmF9KPusYmzx3vw22zaprVmqFp/tNw==
X-Received: by 2002:a05:6a20:94c7:b0:1f3:3c5d:cd86 with SMTP id adf61e73a8af0-20169480cf3mr905809637.11.1744233466357;
        Wed, 09 Apr 2025 14:17:46 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.229.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3abffsm1475046a12.48.2025.04.09.14.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:45 -0700 (PDT)
From: Siddarth G <siddarthsgml@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Siddarth G <siddarthsgml@gmail.com>
Subject: [PATCH] staging/media/imx: fix null pointer dereference
Date: Thu, 10 Apr 2025 02:47:27 +0530
Message-ID: <20250409211727.62710-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cppcheck warnings:

drivers/staging/media/imx/imx-media-fim.c:79:6:
error: Null pointer dereference: fi [ctunullpointer]
  if (fi->denominator == 0) {

drivers/staging/media/imx/imx-media-csi.c:795:27:
note: Calling function imx_media_fim_set_stream, 2nd argument is null
  imx_media_fim_set_stream(priv->fim, NULL, false);

drivers/staging/media/imx/imx-media-fim.c:388:3:
note: Calling function update_fim_nominal, 2nd argument is null
  update_fim_nominal(fim, fi);

drivers/staging/media/imx/imx-media-fim.c:79:6:
note: Dereferencing argument fi that is null
  if (fi->denominator == 0) {

To fix the issue, add a check to validate that the 'fi' is not
null before accessing its members.

Signed-off-by: Siddarth G <siddarthsgml@gmail.com>
---
 drivers/staging/media/imx/imx-media-fim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index ccbc0371fba2..25f79d0f87b9 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -76,6 +76,9 @@ static bool icap_enabled(struct imx_media_fim *fim)
 static void update_fim_nominal(struct imx_media_fim *fim,
 			       const struct v4l2_fract *fi)
 {
+	if (!fi)
+		return;
+
 	if (fi->denominator == 0) {
 		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
 		fim->enabled = false;
-- 
2.43.0


