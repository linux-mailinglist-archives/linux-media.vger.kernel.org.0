Return-Path: <linux-media+bounces-18289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A274B979176
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 16:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D12BD1C215BD
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 14:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1671DFFB;
	Sat, 14 Sep 2024 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Go4BG6LF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DD51D015F
	for <linux-media@vger.kernel.org>; Sat, 14 Sep 2024 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726324179; cv=none; b=f4RuroaF2rHFutnBpoMx0qdI26CzT8qVYU+3uaYtyrKTfbazx0g14yJP3T8Y4skXw3tvJBnmDTyGbzzt+P3sd/XVSB7qDGMreaql07TM5gjTzwzLEXIvOa1EmjCAJfpTKvefgO0Lg6RLXMLiYO57iftzI9jlzclU8FPtMcFPMzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726324179; c=relaxed/simple;
	bh=Svmqfx19eAVCZYpM5kTub7xlJpLA8FhKw1hmqJ5t0aY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JLQdHlauU3TfNhL+zcnj3YEdFmr7Fb+gU1kSElqM1NPjBjzOnfM+xH0iUvf2rb6i3GO36Mw9oTldqv9N5M4jm8ofoaq8MoeATp8D8HG2fZbh2hQJkovO29BS55aYxzQ6oz1c9eRX7PQCOo68taJPBnm/KSyyncRPIQl0yKvEJNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Go4BG6LF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 075E87E2;
	Sat, 14 Sep 2024 16:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726324095;
	bh=Svmqfx19eAVCZYpM5kTub7xlJpLA8FhKw1hmqJ5t0aY=;
	h=From:To:Cc:Subject:Date:From;
	b=Go4BG6LFckhAnP3MtaNGWhV7KYQwKpLrzO7pL7bGSzgULdD6wFEFHDOryN/5g188V
	 4BKblNUlruV/SiKSHccpi2XoKOSrPldZ4HhY30/F5pv5B2VVru71YUn0Eu3/mYVD45
	 +sqUmrgks12UqXluH1fwKIidg3Q18Rz021XOv2TQ=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] media: dw100: Rectify debug log
Date: Sat, 14 Sep 2024 19:59:28 +0530
Message-ID: <20240914142928.17215-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rectify dev_dbg() log of dw100_hw_set_destination() from
"Set HW source registers" to "Set HW destination registers".

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/media/platform/nxp/dw100/dw100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 0024d6175ad9..394f1f6129e3 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -1311,7 +1311,7 @@ static void dw100_hw_set_destination(struct dw100_device *dw_dev,
 	}
 
 	dev_dbg(&dw_dev->pdev->dev,
-		"Set HW source registers for %ux%u - stride %u, pixfmt: %p4cc, dma:%pad\n",
+		"Set HW destination registers for %ux%u - stride %u, pixfmt: %p4cc, dma:%pad\n",
 		width, height, stride, &fourcc, &addr_y);
 
 	/* Pixel Format */
-- 
2.45.2


