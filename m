Return-Path: <linux-media+bounces-33670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8308AC9096
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D32C4A80CA
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E28022D9F4;
	Fri, 30 May 2025 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RAWJDibz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D11D22CBE4;
	Fri, 30 May 2025 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613098; cv=none; b=Ac9qb/uFRBWtehRs0+mrqUQMaGUGRr2MmATmsKaEh+dK6yv8vxM7Dr4YwLOgsznsFC8VZWTH5AVUDiq3JNoijqS5btY8nWQiC1VeOnmGHrBdjMtk0LQMSzf3O7DM3KQHsYgUY61LHBQ9Ih2V6QGySDYQrr5VEJDMGOw+e5StlOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613098; c=relaxed/simple;
	bh=hmnQ+jK97q2WKdM1rwH2rwCrfKMpKR0KZEvJa1ntwjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nNKa2Nor1PkZpxyADbQ21OKpz6sCilPo/d/bFzFuJZd0/kbbMv1SSL89msYW91EzirnvlqD8OBNvqaG/A6DzAy5K7MPIAj1erx1TgN+6dBwPjYYJ7W+4kSzFstZKeRAsu3EdO0p1MGchTK71N1hAh15bOoOp+WyckOjv9lXzB5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RAWJDibz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F31310C4;
	Fri, 30 May 2025 15:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613063;
	bh=hmnQ+jK97q2WKdM1rwH2rwCrfKMpKR0KZEvJa1ntwjM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RAWJDibzLhqkq3XlE0on3qlBm/viskf33T4GEII9OoLSK/u86RXvXU2jDbdQ+pM8r
	 5fHVCHqk2uzVTwSsOg//gq4QH6S8B5GfWv3EDDxchEoe2dX2O+xwaO9XY4qSuyOMiz
	 kVVvspu5i1WlwJxw2xkKQzjQ1mMXD2ySYYe32KtU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:32 +0300
Subject: [PATCH v3 03/15] media: rcar-isp: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-3-026655df7138@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
In-Reply-To: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=hmnQ+jK97q2WKdM1rwH2rwCrfKMpKR0KZEvJa1ntwjM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfbXA2nghA+PGEjqGOS2BiJcZwLdjUw1JHMO
 tFyLQ153c2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm32wAKCRD6PaqMvJYe
 9dJXD/9yBe9gTG3FoThVaqheVo1bmwhzfvsp83xkzaLPN9FVDlQ3j3v5p9U8TVQvprAP53QKiCt
 swPAl5Wz6m/WjeQqWOIGT0m+ULZhepYL6WOp4i2t4iBuMp9TL1xhLVHG0nxrGLMYXdx+MnlgQQt
 9AEZ0cuJXUq9ibxKNvBJQi57PSDqZwNrQb5EnhgTHnQYBTQXMXIkZsoXgJRF+p2VL8mE93/Cod8
 /lqyuoS4RtKDbYrlbGOVr8Z1YjtTiAZqji8wSPqWSYSpwEFUmNivxiuz8XdIZ0RsgdDvYZrZBaO
 MyehXusq9zcZbRtQSd4+S/KvYy82knsJJ0xPPPAB5aYO4BlyQye/IR4Dgnml3H9W/pNKz8NVOl2
 MRtW4j/oEb/hrMsPIsupyiF4cwX9OZsd16w7SX7h2cL/J5pLcXD/SFgqgKFr1uMWNr0JXTt6Ak3
 wGS+3neKk/BrXdW95fHOh2g3Jj97DKtY+kgYXOSgpDo4tiYvdLyHchMb06RZyLlfqwzQScbaCzW
 SzrhJnuIAtoi1n9InN10YU7ZEN7uZGcN0viDERL2e2Ywyb0cSLwP+1N51vqrrFkjCZHpBHqfan1
 H7l2VQVAp5C7QRtaRdaXtNPkOniDdWRR6f2/zLm1aEVVmv/nwvT4jYJAzZs9rB80VqxB+dgjpKN
 0UkSLbG2+hyoQLg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With multiple streams the operation to enable the ISP hardware and to
call {enable|disable}_streams() on upstream subdev will need to be
handled separately.

Prepare for that by moving {enable|disable}_streams() calls out from
risp_start() and risp_stop().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..2337c5d44c40 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -268,18 +268,11 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	/* Start ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
 
-	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
-					 BIT_ULL(0));
-	if (ret)
-		risp_power_off(isp);
-
-	return ret;
+	return 0;
 }
 
 static void risp_stop(struct rcar_isp *isp)
 {
-	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
-
 	/* Stop ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
 
@@ -305,6 +298,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
+					 BIT_ULL(0));
+	if (ret) {
+		risp_stop(isp);
+		return ret;
+	}
+
 	isp->stream_count += 1;
 
 	return ret;
@@ -322,6 +322,8 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 	if (!isp->remote)
 		return -ENODEV;
 
+	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
+
 	if (isp->stream_count == 1)
 		risp_stop(isp);
 

-- 
2.43.0


