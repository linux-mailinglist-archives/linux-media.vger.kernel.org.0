Return-Path: <linux-media+bounces-48033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EECDDC9A8C0
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BFB3A4E2C6A
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8521D303A05;
	Tue,  2 Dec 2025 07:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rp9VXFlc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22D91D514E
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661744; cv=none; b=lDNxRdY4J0SV6pLNR6MXvCctCy7i0X0UB141KiyFEL7UaABqu8d+WBTTPRep3VjSOTPJr11E7uBBuTJq/q+jTiiJzETjz0t6D+hQAfkUuMAQLaHd0QhTihBNogxhC0njpKGaEYCeiRryTE+At5AF7rPvo1u6VD5n02sNwF3LKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661744; c=relaxed/simple;
	bh=Q0RWrGOrxCxP4grYbnVH/DtV4XeE6Sjc4ee1hshFWhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijauDUE+2+dR12HBSNaJaAp/c2Tq3BxB0O1/EQev2pvyOjl0qX3zkKm2GTFnfTjVNBlPuwjb1xTX/mxq63ZM9z+jV94hO5ISJGGeHwHwdvcISjm2Mzvc6MMDJm5n5f/adGWvO1+MjEt6jYeFjv99WOuT8W6ELPr4jyQQ86jVDNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rp9VXFlc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A40C4CEF1;
	Tue,  2 Dec 2025 07:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661743;
	bh=Q0RWrGOrxCxP4grYbnVH/DtV4XeE6Sjc4ee1hshFWhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rp9VXFlc9zQsYdF1LBvOfSbVNWcAyDr+wPkbvxF0dfMx/tqlDPzR0c9ZnKEpeLxK1
	 /sEN8ejhn7pcP0xxe/V4D3esFf+bbrynKLhTz7Wc9tKBYUV4pNn4Ae3lrpcHJb72nJ
	 VvQs/pknk9nBZk9mrlraBm6Z/WFEiEiXzQEP5kLbdnkFLtQW+iyWc+0kFVrHgFHUk/
	 z4AvuN/Uk+QBmFYrW1mRmq8UQE4ubyv7iFuqJE2ySzGE0DF1T1acVbbTyWHOBVoiRg
	 68ux+i9IoHHy+APFPBPEzjZi2qlDOAQWieRPQYFMBzu7YzUG97sC8TC4UnBnORKF0p
	 Mb7rrU3Qfarwg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 02/11] media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
Date: Tue,  2 Dec 2025 08:48:03 +0100
Message-ID: <e3cc8e2899c015aed1a8dfa5b6ff96f62e1f6288.1764661692.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661692.git.hverkuil+cisco@kernel.org>
References: <cover.1764661692.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The isp_video_mbus_to_pix/pix_to_mbus functions did not take
the last empty entry { 0, } of the formats array into account.

As a result, isp_video_mbus_to_pix would accept code 0 and
isp_video_pix_to_mbus would select code 0 if no match was found.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 46609045e2c8..864d38140b87 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -148,12 +148,12 @@ static unsigned int isp_video_mbus_to_pix(const struct isp_video *video,
 	pix->width = mbus->width;
 	pix->height = mbus->height;
 
-	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
+	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
 		if (formats[i].code == mbus->code)
 			break;
 	}
 
-	if (WARN_ON(i == ARRAY_SIZE(formats)))
+	if (WARN_ON(i == ARRAY_SIZE(formats) - 1))
 		return 0;
 
 	min_bpl = pix->width * formats[i].bpp;
@@ -191,7 +191,7 @@ static void isp_video_pix_to_mbus(const struct v4l2_pix_format *pix,
 	/* Skip the last format in the loop so that it will be selected if no
 	 * match is found.
 	 */
-	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
+	for (i = 0; i < ARRAY_SIZE(formats) - 2; ++i) {
 		if (formats[i].pixelformat == pix->pixelformat)
 			break;
 	}
-- 
2.51.0


