Return-Path: <linux-media+bounces-50719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7FBD20BA7
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 19:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFDCF3017868
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 18:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3137832BF4C;
	Wed, 14 Jan 2026 18:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4ep5WVK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633117A309
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 18:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414064; cv=none; b=bUqvyUUUIkCvYeYo9mhR0CDegi90Vu3nopb6Od7ypHiQq16XvPuogBnkW3hOb+Ly4Xz9AyGBU0lHC+xr5guEsPRo1RSpg2f7dxmGAl9cY6z9kIJJOUV56dhcAkOAQWFrX6BYU8xu/wOIgZlohMA1//NwLvroNBpNNII02V293bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414064; c=relaxed/simple;
	bh=U58OgqkF0FnLNMsluxHv6GR+9+T+DzItDJduGe9JjeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IL3yS1mz82oNBUCCMbZNPX9hEJy9XomVaYy1FMeHE3ucDIV3mB3QZDpV2Ds+lUqtgXEiqT44DyKtrC3CaQWQKemumJjJSoh1TdaKBQMH4xOKl2XeVmMumEzoR6MLsw3xL5i3XCd2ecaDpMq+hsMp+xchgQArAKXazF85zAaMKHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4ep5WVK; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c3e921afad1so46728a12.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 10:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768414063; x=1769018863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mQjaCQcS7+ndCFM47qBrIon6U6oW4IRpWFUDwNmONx4=;
        b=G4ep5WVKmOuSpwCJfo1KesdeqMDFnfb2SZRgtFSi7sEprZM7PW3x5CEtm2pQkCXTdY
         PWzeO4dNYvuYzWs7hN/IzP91jQOZrP+bLrLRBCpcxbY92uFy9Z4Z/7Y4VQscq6NM8VAz
         d/22iNQXciKJAt5lYf6CeG0AQzK6qGcRd1bSVI1wEaa0djL2az0vy2n3LLQ3I6ARLhsm
         gv/lHDijjfYy6ubnPQgAyxO7tasKaMIXgD9De7vL4aseSxsOxqqjWK54Lhwi7bHu+RHo
         4VqVHQdXkLka+serSZykB3XG4qK0Qh/6MdmseflCJ8zO55khxo97LZ2C1t9A6C/WlyEv
         96tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768414063; x=1769018863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQjaCQcS7+ndCFM47qBrIon6U6oW4IRpWFUDwNmONx4=;
        b=TIkfZENq/70seULk/BVNRLkvZ0YYh4re+N0YbGiF7+2fAFTVmQdgoRs/jumHwJP4iP
         POYLMhsVHujAqB43fBqXAPcCAP6UUIZy/L8c/aX6aIxOBaP6ajKSg4X110bMJcvZ/ZOu
         ucE5Cr7EuC6z9L/dxQvWUmBGjrvyZ6dyphhhYfyyHNyurUFwCVIGRbjqjySb/MHxW34y
         /mgz4WmOwt6BQ8XHAMvZI7gP1JGhM02zhEUrQEAe+grZJRolmouovwiMr1Zv3RLggC3d
         zF4+wgmWRP5vYqCAuLF9atbX5CyZ7ibMA6/2KzztJ51C4+tZA+VywLOPu3MyTs+EqwNZ
         OSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyXy+R2AUmX0HmbvW6mvveFU/aqYOnzqWQxc36+shHX0zvaw2qwxALIcYu3Y3XTenSj7PfrXuA5sCgMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQB7WsqiyOTGxHg3jW01KmKGvTOQrI2+Okf10BHQSINq5BQpPo
	5fK9UAlzZFkTUXdD2QQs7pUFqJAON4jm0qEKKQJEWqEXFuldK9GVa7w9LXuQfQ==
X-Gm-Gg: AY/fxX51pMbaXmkRZ/oRH4o2Epbos8J6HXb4HOi3t4PPAw/Pr5s9rW6N1pbV9axdJoa
	u6ZOCg6iM/9uGCf2GSM/JyG80DW4H5TdkhHx+qDgIDOyCFNTyVBf0Ym6J6UjEy/DNHYF2RquKoA
	2348M7zmvP1aC6KXaDH0qytnoes5lvHUdbt60eEeVABsmkCcr3NHk/3OctJ6vd5EWv0rjv1EUva
	IzP8Os2NPLLatO7T+Utfy+974jEKDbK+y7SCmO2jhnZCoUTrsV2wtgL0bwCfTFVdso1BmTDyqN1
	H71QIygFrXl6Z/87SIdWJcAClsBfX4i8aX1bHrYyUUxqcK601tzVRnxsukRshnLit6D3bBR+6fp
	Cv2omfjwWvVVIjPvPApqip085P06u+gHhkD7cQm3bzcp4piXnQ4ifvSsmsTnoDnqFqj9Zdv2aML
	h+/q2jRwvbjkCzTLWWuP8yKUuYrAcnAy3Mkw==
X-Received: by 2002:a17:90b:2e87:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-351090b0ef3mr3627828a91.15.1768414062538;
        Wed, 14 Jan 2026 10:07:42 -0800 (PST)
Received: from karthik.bbrouter ([103.215.237.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35107b75c70sm1424570a91.5.2026.01.14.10.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:07:42 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2] media: atomisp: replace ia_css_region with v4l2_rect
Date: Wed, 14 Jan 2026 23:37:30 +0530
Message-ID: <20260114180730.39744-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Karthikey D Kadati <karthikey3608@gmail.com>

The struct ia_css_region definition is redundant as struct v4l2_rect
provides the same functionality (left, top, width, height) and is the
standard V4L2 type.

Replace usage of ia_css_region with v4l2_rect in ia_css_dz_config
and remove the definition of ia_css_region from ia_css_types.h.

Also remove historical comments referencing the addition of zoom_region
and include <linux/videodev2.h> to support the v4l2_rect type.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
Changes in v2:
- Replaced ia_css_region with v4l2_rect in ia_css_types.h.
- Removed definition of ia_css_region.
- Removed historical comments about zoom_region.
- Verified atomisp_cmd.c logic is safe with the type change.
- Updated commit message for clarity and conciseness.

 drivers/staging/media/atomisp/pci/ia_css_types.h | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index 5c21a5415..f7b77901e 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -15,6 +15,7 @@
  * directly but still need to forward parameters for it.
  */
 
+#include <linux/videodev2.h>
 #include <type_support.h>
 
 #include "ia_css_frac.h"
@@ -427,16 +428,6 @@ struct ia_css_point {
 	s32 y; /** y coordinate */
 };
 
-/**
- * This specifies the region
- */
-struct ia_css_region {
-	s32 left; /** Starting point coordinates for the region */
-	s32 top;
-	s32 width; /** Region resolution */
-	s32 height;
-};
-
 /**
  * Digital zoom:
  * This feature is currently available only for video, but will become
@@ -444,7 +435,7 @@ struct ia_css_region {
  * Set the digital zoom factor, this is a logarithmic scale. The actual zoom
  * factor will be 64/x.
  * Setting dx or dy to 0 disables digital zoom for that direction.
- * New API change for Digital zoom:(added struct ia_css_region zoom_region)
+ *
  * zoom_region specifies the origin of the zoom region and width and
  * height of that region.
  * origin : This is the coordinate (x,y) within the effective input resolution
@@ -457,7 +448,7 @@ struct ia_css_region {
 struct ia_css_dz_config {
 	u32 dx; /** Horizontal zoom factor */
 	u32 dy; /** Vertical zoom factor */
-	struct ia_css_region zoom_region; /** region for zoom */
+	struct v4l2_rect zoom_region; /** region for zoom */
 };
 
 /* The still capture mode, this can be RAW (simply copy sensor input to DDR),
-- 
2.43.0


