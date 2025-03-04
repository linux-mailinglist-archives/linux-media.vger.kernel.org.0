Return-Path: <linux-media+bounces-27467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7904A4DC24
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89F3D16BA29
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0CB1FFC4C;
	Tue,  4 Mar 2025 11:11:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC32036E8
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 11:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086692; cv=none; b=Uw9BsbeuxQrwcDgIBshO1WkgcaTLEY3QUaqvstwF1IhDKJKDvTqSq3ErRy4byuFteG2p0VJ39U42IRVG2RTLN18XOHaBQSomC/4gGvDVLIYHR1gxeg2YLxVqyzLG75E3R4khpHSS1vlkE7wGD7RV1hoW41U+3ZrQAnLIt+xLcJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086692; c=relaxed/simple;
	bh=nCxd+9o7TnE/pAhdxP+oWArrxOlgpZzl8HoyscL7XMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFaBlk6rpQUK6OS5kNoRbPHpO7IDObJhozcaNQmVxCmAW3jaSIov6MvWNtNyaFNSRUV/pn2As5lu33EcEw/aBCmyTKNyaKWYecJDXc2q28S73a5e9Jvg4SW56EIQAbEMhFo1thwMrHp+sBPSC/awuAVuQtZQwP8jAav1ArdgG7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAEAC4CEEA;
	Tue,  4 Mar 2025 11:11:30 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 6/8] media: i2c: imx283: use (t,l)/wxh format for rectangle
Date: Tue,  4 Mar 2025 12:08:12 +0100
Message-ID: <b1800a865460fbe5a4aee8c132ef908673ed581c.1741086494.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1741086494.git.hverkuil@xs4all.nl>
References: <cover.1741086494.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize reporting of rectangles to (t,l)/wxh.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/i2c/imx283.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index f676faf4b301..01b73bab596e 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1082,7 +1082,7 @@ static int imx283_start_streaming(struct imx283 *imx283,
 	cci_write(imx283->cci, IMX283_REG_SVR, 0x00, &ret);
 
 	dev_dbg(imx283->dev, "Mode: Size %d x %d\n", mode->width, mode->height);
-	dev_dbg(imx283->dev, "Analogue Crop (in the mode) %d,%d %dx%d\n",
+	dev_dbg(imx283->dev, "Analogue Crop (in the mode) (%d,%d)/%ux%u\n",
 		mode->crop.left,
 		mode->crop.top,
 		mode->crop.width,
-- 
2.47.2


