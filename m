Return-Path: <linux-media+bounces-49291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CFECD4F3C
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04C543009F04
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554B030BF6A;
	Mon, 22 Dec 2025 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z1ZWp18V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA48730B528;
	Mon, 22 Dec 2025 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391387; cv=none; b=ORWRvUUpJZ3SPcnNHn9TZ0EBFZtp/RPtzLyAtYT05DMkFn8uAKJsGz37R/Qvi6FmVh/RSNd/2q7Fh9rjkHyyDBnxPJAhXLTn7Nt0icpziy7ao1QSzL3/3S+zn0i07yoh0d19u6k2pw0FU4QSfNtMDLSrLg7wBX7gv2GjkdkIqJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391387; c=relaxed/simple;
	bh=PQ9M14QST2QJ3TTrOgRzy38BDMsRRz+W6wnAukNjKZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OwFu92yO0O4KFNSm6IOy9GTF+sRqfW751rU9Ya7Ty5F4CImkEzbRFgHuHWV9z2BWMlSfApHuPcfT+qHVprnUPODfnpsyCktRolsz5fbGoSKwpjHf2xA5LMhTR8+wawkNrkoKFoUskJV4xRyjm1+CWBLAiyAqd+F3TWg1vSIDllM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z1ZWp18V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 351F13C8;
	Mon, 22 Dec 2025 09:16:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391374;
	bh=PQ9M14QST2QJ3TTrOgRzy38BDMsRRz+W6wnAukNjKZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z1ZWp18VS+hEJaOFWZ+KcQdKuUU7YErRVSmjVYTc1k7wsyUNS5HlojfeeRb89wmcS
	 rO9bSf5EHHLJij8suzu0sJnTGNPrpzdlCJDDPH2TlQFrl+RrVEniZ7dvGUqw9coHYm
	 uKV0rHYMbsz3SeHnJYyAlhJ/68fwWivYtCOBpyxs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:29 +0530
Subject: [PATCH v4 05/17] media: i2c: ov5647: Fix PIXEL_RATE value for VGA
 mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-5-b949c7309280@ideasonboard.com>
References: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
In-Reply-To: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=PQ9M14QST2QJ3TTrOgRzy38BDMsRRz+W6wnAukNjKZU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4l0SrmCWdRbu+MVc1OTvDVd/+yebepsSglP
 Bss26xDRLqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+JQAKCRBD3pH5JJpx
 ReW6EADSJqRvEMOWSfE20K5nI+RfMQx7iO2EVvq1kUe2mx2QCIEYnFfYA8VH/2UhC1kbwgeuhGI
 znnFkI3DcEH8TIW1oq3YTt53A5JjdAJChIrDoamlCHyGRQcXfSgXKgb3AkA7iSZhMFMUkgjolIR
 dgTQhHiNGQQOw5XOEiFMjM6cjWNCMClXojJfDRupY+kShLlliP4HORT+U5NVaycbjH3gvRpx7n5
 lWfkvBten+ROVpc1Limc3sj6cZT4x6O5+bJKB2663VRgppS5RjnKQdVZznHFlKUM4Rvx+vP2qXW
 sFoNDT48LDpXRj8z/hXcEsdROBQ90dsigCGcLMza7WBhrIVIhYKOoMzPckqYBmLsUyfY7AgfFJ+
 tc+0ssb6ixuLZHvnX1mBLDLtYMFDP/EgI614306duCJw55da1GGQZ+h4fYo2g/rWsd6KscMLmfS
 lZzBYu1pgcMH/LQ7Ib97lY9icf31z+yO8hZqyl/6dx7h4+wIHOMuyAqrj6yNo26DmiXkfTZ37mH
 mlxFuNNWjZzExwRCDhbN/5kuUVFjg4vdkCO6rLYU422HqTnwCIEEFc4DqifeAiT/Vr2sT+pGctW
 bA4iNtLvbh2ksJnrb4eB4i6cuQBvTfBXKFXczmCIla5HxeOjYo8vj6QjInUObonHkSXfbKIq0VZ
 dV5ZB7Vnf4D5aJw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The pixel rate for VGA (640x480) mode is configured in the mode's table
to be 58.333 MPix/s instead of 55 MPix/s, so fix it.

Fixes: 911f4516ee2b ("media: ov5647: Support V4L2_CID_PIXEL_RATE")
Link: https://lore.kernel.org/all/CAPY8ntA2TCf9FuB6Nk%2BOn%2By6N_PMuYPAOAr3Yx8YESwe4skWvw@mail.gmail.com/
Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index c0f1121b025e5592d6fd4d5fd23e4262dde2d84c..bf5b0bd8d6acbe246e54b566c3d8f8044e688110 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -582,7 +582,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 			.width		= 2560,
 			.height		= 1920,
 		},
-		.pixel_rate	= 55000000,
+		.pixel_rate	= 58333000,
 		.hts		= 1852,
 		.vts		= 0x1f8,
 		.reg_list	= ov5647_640x480_10bpp,

-- 
2.52.0


