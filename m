Return-Path: <linux-media+bounces-18742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1559895B0
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 15:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06191C2121F
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 13:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AA017B4FC;
	Sun, 29 Sep 2024 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J+Cxrkby"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65CD16631C;
	Sun, 29 Sep 2024 13:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727617012; cv=none; b=TUl5/kAm4vI5VZGISOdKFDmXAhbI0PWMwA1jtb/+hCfFtAzNkfKs5gEHtZEEr4GqiBbKJgrdT/dl+WZfbjJ/Kr0Nd4hPLLZ1iR50sAQQfr4vokrFWQWBhM+rBc4FeLxTdnSNpWYZyGt7lh0kvg8Pgs7yuERpaK4yOBmRi28JWH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727617012; c=relaxed/simple;
	bh=KaE6QeuGkbVWCugMJkBPpxf0RtCGMtPRgI0NftKEUus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0Xae34KiU5JLZIDDINSHDubTgA5E03n6wkj6os0YlbqBS+bx4LCSqjDqKMX8Z6hO5NpV/PIWq4qE0Ct1sxcrTV1ZoN8kYA2+o01eyRqSa14o0eDuo61EBO8rDbJyg39UZ4vpfqUB/lSgalKzp92Ymf0O0H0pBSWGS58HqI63Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J+Cxrkby; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AF53B3;
	Sun, 29 Sep 2024 15:35:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727616918;
	bh=KaE6QeuGkbVWCugMJkBPpxf0RtCGMtPRgI0NftKEUus=;
	h=From:To:Cc:Subject:Date:From;
	b=J+Cxrkbyf0x1SR1frsRFIZg3BsaOiwOFE9a3/FTdxEaPFrG2pHbEcMQtxszkKrgKe
	 IxIVY9K98IAADybX5F/G38s7+jZvep1vmAlO14dLgrMmiHslzibgwnblNd0JTOcbiH
	 34kcu7HVcTr+zrF1HrEjLHb3iRG5lry2MMaoda7A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: guoniu.zhou@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: imx8mq-mipi-csi2: Simplify power management handling
Date: Sun, 29 Sep 2024 16:36:39 +0300
Message-ID: <20240929133646.19991-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series is a reaction to "[PATCH] media: nxp:
imx8mq-mipi-csi2: Fix CSI clocks always enabled issue" ([1]). Instead of
making the PM handling more complex, I think it can be greatly
simplified.

I have only compile-tested the patches. Guoniu, could you give this a
try ?

https://lore.kernel.org/r/20240929101635.1648234-1-guoniu.zhou@oss.nxp.com

Laurent Pinchart (3):
  media: imx8mq-mipi-csi2: Drop stream stop/restart at suspend/resume
    time
  media: imx8mq-mipi-csi2: Drop ST_SUSPENDED guard
  media: imx8mq-mipi-csi2: Drop system suspend/resume handlers

 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 113 ++----------------
 1 file changed, 10 insertions(+), 103 deletions(-)


base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
-- 
Regards,

Laurent Pinchart


