Return-Path: <linux-media+bounces-11617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA08C8BAC
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 19:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F00D42859BF
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 17:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27DD15921B;
	Fri, 17 May 2024 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wBHbaq7T"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2E6158D8E;
	Fri, 17 May 2024 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715967672; cv=none; b=mKbKWN0ucHi/AOaLwbikrr/ZkN5vHZBw9fIA/B1xWw8McuBv2YGOY1ktxEyIyz+PHiQY+/CONXaSk8glYXudDBlaTjJbI5TPrSNQkmEdyel2WkLTi3Ejirfou3Br+dj9NAyzG6wP/3qWfniu1ZSEXb3Ky7SPq8tpgtL1LoI5XFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715967672; c=relaxed/simple;
	bh=XvaXRpk5jVDfaLF6Tcl6t3qPRumZhLNoAB2RuaBv05A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s4fWxxmfLIYnCgXcZ5++HAxJpZl6XjwYN7XN3gljwP0I7zzsFw8i9TFYqHN2q38hQ+CU3sE3Kp5d6pOZC8T6B6Q3s7h4zEqJptllS27OdlWs0w+VN6Me3+RL6xPSm3O7+nVQNh2zvo+PFceIAeg8pHklnrnutqu+54hD1utdogY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wBHbaq7T; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44HHetIk116593;
	Fri, 17 May 2024 12:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715967655;
	bh=Z0Jtv/ACxyCng0G72W+TurXG21YdGWxQxYgqPeRPW3k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wBHbaq7T/IS+g9pzSpRs30RDyFKtefn5kA+Uq+ATKfcReki/7cvkxH0fiNs5/VVby
	 UQYjJ+bPjhHSAAyIqa3TsAyId34uF4XwOsk/EICVTXzIz+d4bvKJtEdqrEkQLwTmtb
	 O9VCao4US2juAc96sMtZ+/Mxf6/7jpvSKfLdXWP8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44HHetkw031054
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 May 2024 12:40:55 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 May 2024 12:40:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 May 2024 12:40:55 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44HHesjK018723;
	Fri, 17 May 2024 12:40:55 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
        <adobriyan@gmail.com>, <jani.nikula@intel.com>
Subject: [PATCH v8 10/10] gpu: ipu-v3: Use generic macro for rounding closest to specified value
Date: Fri, 17 May 2024 23:10:54 +0530
Message-ID: <20240517174054.812332-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240517171532.748684-1-devarsht@ti.com>
References: <20240517171532.748684-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Use generic macro round_closest_up() for rounding closest to specified
value instead of using local macro round_closest().

There is no change from functionality point of view as round_closest_up()
is functionally same as the previously used local macro round_closest().

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V8: Update commit message
V1->V7 : (No change, patch introduced in V7)
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index 841316582ea9..5192a8b5c02c 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -477,8 +477,6 @@ static int calc_image_resize_coefficients(struct ipu_image_convert_ctx *ctx,
 	return 0;
 }
 
-#define round_closest(x, y) round_down((x) + (y)/2, (y))
-
 /*
  * Find the best aligned seam position for the given column / row index.
  * Rotation and image offsets are out of scope.
@@ -565,7 +563,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
 		 * The closest input sample position that we could actually
 		 * start the input tile at, 19.13 fixed point.
 		 */
-		in_pos_aligned = round_closest(in_pos, 8192U * in_align);
+		in_pos_aligned = round_closest_up(in_pos, 8192U * in_align);
 		/* Convert 19.13 fixed point to integer */
 		in_pos_rounded = in_pos_aligned / 8192U;
 
-- 
2.39.1


