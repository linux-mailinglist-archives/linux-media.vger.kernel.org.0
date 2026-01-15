Return-Path: <linux-media+bounces-50762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A13D23D40
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D32B30254BA
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0F536167D;
	Thu, 15 Jan 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L0vmEiST"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7033612EE;
	Thu, 15 Jan 2026 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471731; cv=none; b=p6FC+26scUJ0q1uQ51GxuOk+n1GV1Rqz/e0N7CZJOgDiCABzghrLCYk/jVvfYppFMIDwYWMLezEPsnVucsiN6P/tIUgubeJhyJ6ysHDZzySzesOW2iaDsRmn59/QEE+rhCJPLv6qI2m3aQypUQZ9rGvk19dBZ4GrpPONa4K/giA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471731; c=relaxed/simple;
	bh=utOQf1vMGqA6bTOF25Nkik7nQcx6ZmtvMsBSPMxIR6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYtnIzmhT+acH5QKFjiINhSb+i9d8yF/BqeNQ5mgrL/rrIm40CqYPZJgnFf4EbpkCnoiZcc3g527n2Z1WOOqGxZ1ILefCEALTRH6ZPIWEi78ud0Jmr2DcSnTPalgnnaA5mFBHhyUqLVdyIElY3BEBGgSVzgdrgho2bfSBxYOMgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L0vmEiST; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3785A289A;
	Thu, 15 Jan 2026 11:08:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768471698;
	bh=utOQf1vMGqA6bTOF25Nkik7nQcx6ZmtvMsBSPMxIR6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L0vmEiSTN6P5diHMFBbfpmryYBSZQhPlLo1709dcM2LtMDsk/T4CT+Vhou97PoGKm
	 71hWjHIqVj7mvfias5Oimo/ebzAwfzwLPfxl8toECz1nIVElvQ8xsjFj+IdyFNqzpl
	 f0mbZgog6G8h5yO2bZwtmpeEINs/vJAY/hkQggVM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 15 Jan 2026 12:06:58 +0200
Subject: [PATCH 2/5] media: rcar-csi2: Improve FLD_FLD_EN macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-rcar-streams-prep-1-v1-2-f87700926c11@ideasonboard.com>
References: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
In-Reply-To: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=utOQf1vMGqA6bTOF25Nkik7nQcx6ZmtvMsBSPMxIR6s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpaLyqzoFgM9MIGR3uO+VWAJ5eltfGJ2VKLwVEi
 z2KKhFYL5yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaWi8qgAKCRD6PaqMvJYe
 9VSZD/41FYSDZdCuGj8jBY4amaT9+edGUAaZz+TNX13/Y+sHgjg/1Aw8CU4J20umWsVu6zrkXhd
 cYUtzSWkIaxcmggJE+sJLr38tH74RwwC2QLs7Ja5AK0LVbA0NcyJMOMvyR5aM9urbm5OMY+7/bC
 ibaY95C6/FlwxblcvWskoIqFEZy9JH4yocfn7OIYPJJmBzSylV0EObmKIKW/b2ghscOSFixdMnx
 hf2Gpf2qomnUw14pkscL/s2oYtCZcbOUTGL8aNHAGjsdZqpCoRIyEbHlYj1hUWU1CiFK3k2q1/D
 MCVBwt33O4z+6f3jDM4NAbB7cRHXnarEX1csqlrobXcSeKBT98snEopC+AMFpggJsEVybAv/ruU
 xYuFKkBwqbo4TWgIsABwkgjtX7b2V3kEZH1UuTCpP5Z0btRQ/pbIHWz8hGJcRNdC0WTZhW5pRRS
 PfRpIJvVHuwF/3PRRP9+1RlFAZd13eAn2qmBonpmWss76vx1w7LV24OqV6iZmFp1xb47RkN394b
 AqE3wpkYuzf1AsY4WWXychfvNp6FMO/7qsx7Qw3UbrjCcMrGOCxo9ovgZmDkDg/jXMSFWuK2c1R
 IbWmxOqNwUKO6u9S2SSlg9S4BlPrbvOk0LxHjh+oNuwrZwZ7BQsH3cNUtLFc17tiWO6fTwue3/2
 29dcKijddnlO+QA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Instead of having four macros for FLD_FLD_EN for different channels,
have just one FLD_FLD_EN(ch).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index d1b31ab8b8c4..3cd35adb6803 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -71,10 +71,7 @@ struct rcar_csi2;
 #define FLD_REG				0x1c
 #define FLD_FLD_NUM(n)			(((n) & 0xff) << 16)
 #define FLD_DET_SEL(n)			(((n) & 0x3) << 4)
-#define FLD_FLD_EN4			BIT(3)
-#define FLD_FLD_EN3			BIT(2)
-#define FLD_FLD_EN2			BIT(1)
-#define FLD_FLD_EN			BIT(0)
+#define FLD_FLD_EN(ch)			BIT(ch)
 
 /* Automatic Standby Control */
 #define ASTBY_REG			0x20
@@ -1082,8 +1079,8 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	}
 
 	if (fmt->field == V4L2_FIELD_ALTERNATE)
-		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
-			| FLD_FLD_EN;
+		fld = FLD_DET_SEL(1) | FLD_FLD_EN(3) | FLD_FLD_EN(2) |
+		      FLD_FLD_EN(1) | FLD_FLD_EN(0);
 
 	/*
 	 * Get the number of active data lanes inspecting the remote mbus

-- 
2.43.0


