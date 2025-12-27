Return-Path: <linux-media+bounces-49588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04008CDF841
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 11:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBD50300304F
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 10:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85ED275AFD;
	Sat, 27 Dec 2025 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZO6jiFHe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD101EB9F2
	for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 10:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766832989; cv=none; b=TQRJgBXTQ17xbbJV/nxXZxrOzxPpbl9v3W1hAO4ksvCLpYlcm+38jn38UUOGPICS3pKauf5YaOvekj5VFBsOX1sUSdEHafRukZIbcRTiOZflZLAqde+6sW5ujl2EVnexKNAVPJCvyHuyl89knoWD4MTo71WbL1FOfvwlqCHpxC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766832989; c=relaxed/simple;
	bh=rwK8Yb8lMppqkdA0k3CGzENNnh2QljvEb2uEw3c5S/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C62JTXNi3V5YG05njZRJZD1H1xRDs0aLk6FHnjyKvDtksF3Je7QVdDIduux6CIbFbyvuWLIn7bc3ZwFBusbQTJgfGYAeVW0lWWN9s/79/zAIHMj7OVieVY7FAqGilzUBv9WkJP9S3NO+hrKN12wUQd+AMtF81/WB+t+rnnpMhVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZO6jiFHe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0f3f74587so111361565ad.2
        for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 02:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766832987; x=1767437787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVirW5At3YCuRHq9p7Wco6R/vGAcg0AwQjMQ8Fn6NiU=;
        b=ZO6jiFHebHT3Js4aL2Oc7FnF2eL8eGbasGm9w1w6LomMggam1lxr8zCMBlIZSJ8a5X
         iyPeYlHmLHutElm3xRgpqSr31InIw1D749znp/1EUGHShRlreaovMpihsC5sVKPT3IRN
         OXCihNu0QPxtAbwhLFfzlzDEnD2Jkm2WDXXNBBcQf0fNpHbr1Ag0PRJLd6Pue7+I8BkH
         3kNSVFrzCGxvJ/nsGjy4i2Gx3pbwLhmYwbDm/uPGrsIoRMlCq9jPaK2UIWdDLIKLsFQi
         yO+Mb+lCPCJXrsNtpZDkh7cIhG074rtnn1kTqlVu8x9IG7jpeX4ppnv0a6Y87pOhW1Uh
         35pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766832987; x=1767437787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVirW5At3YCuRHq9p7Wco6R/vGAcg0AwQjMQ8Fn6NiU=;
        b=loYD/g5HvqB3ntcTIqAtd3xr//I1dADjtmqfVYDH1E4lulPZY3gfID5uUvtNDt199+
         qp6w8sQEdG/AySUJ/JApNCu1tKUTMm33b5BZDL04g7XERelJ2Je8ykJoQdi9abBHDnoE
         TZe0HdH+PNbnooalcwIyoIxl+COAgxyh9QStOBTSqaGmigWr2KNaU3naVaYElghP+htm
         l0FY67hZf8XDpwUcwEXRFmWW94C0lt0W7lQHsSlcxJc0GMq/pNxRaadNHgMNvXV3h7E7
         569wCY1JWaak8tIZNEdQIM06yBvDm51Neg78fMJwvHON9hZtpiTFVpjeygcm1+Yp14r+
         YJqA==
X-Forwarded-Encrypted: i=1; AJvYcCV7sl3AXEfAHDyndPBBL3qD5Abhk7kqeMpC+UHuJuI+yl/TvgAqfjfjVXFW2XtsXUL4Uc5BUctY9VGwnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmdAtqJJDiJyODCJh/RpxKw60zOneS9JIia62QgAgbhSifiW+t
	9bCJOhziQ0zw4mO4ziTM5zRu140VzrWQcVi1vtLALZ/m6HWM0mZO+MM+
X-Gm-Gg: AY/fxX4eVwg2/IlT3qtG4lFduMsdl6R8ZJM16+Iyk2NWJC3/fpJIrwCHBYQZ2K5JP8a
	9UUcCbEXDySSeyH44V+jthhfEBWx1qQ5vpz40D/h5zr6kmLy+dugCF+5Mbuc4IKf5zwXlMH4mhQ
	bv8/1yTv3kIwrMfX4TZ3ytBUsq08lDmfiostujo7oE8U0LddgHqzZMpTvQJwG8c+XosfnXAtItF
	fDH4DnDbgLQtLUwnSMMes2++XSPIRIC+9DHN1CB6cOZCVlzmtMJYDWT05kZJTsZFPHgs/S5Tp95
	GCDH6WU5JtK0JX9Z53fnqrH29xjFvuf5lIxXEZ9wfr/JeugIod8XA1EqyHlxDo03dPJbkXqvBIe
	XfemP81yF8nlMLeraVNcyNHshZ7tRbcP0uDeioN2Fn4YswGym1fC2i3/3cvTnUHfD/d7dujDYtP
	m7gjreeh9KW0ijsvUGv8vEQg==
X-Google-Smtp-Source: AGHT+IGRAYT/ctmH6zSNM1LdV5E+cpyyJcWG5cuzwamCZbhyzUijnn7x7Xah8sTXzyJBA6LMg8AO3g==
X-Received: by 2002:a17:903:2448:b0:2a0:e80e:b118 with SMTP id d9443c01a7336-2a2f2212781mr276888145ad.7.1766832987225;
        Sat, 27 Dec 2025 02:56:27 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm227372435ad.33.2025.12.27.02.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 02:56:26 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix block comment coding style
Date: Sat, 27 Dec 2025 16:26:13 +0530
Message-ID: <20251227105613.23283-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl warning:
WARNING: Block comments use a trailing */ on a separate line

This change aligns the block comment at line 1384 with the standard
Linux kernel coding style for better readability.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d..327836372 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1380,8 +1380,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 * We must free all buffers because they no longer match
+	 * the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
-- 
2.43.0


