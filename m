Return-Path: <linux-media+bounces-34218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CBFAD0062
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 736567AA32C
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 10:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3F8287514;
	Fri,  6 Jun 2025 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fulbXStv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01CB286D72;
	Fri,  6 Jun 2025 10:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205775; cv=none; b=jPSFFvjWgMR6mrZ6GypCqmf9cX7CmIj2NvoyWv4xUs4b3/2jycWd+rpmLx6KDoXF+GBwvJ9w9o2bSbLaCm/COttv0HON7ckgZOVMbKGxfm9XyemtoQtO4elJrxYyctF/FQhxQ9xvc4HllQ2CSPj6rcAxS3zMUDDmBcIb+GV3XJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205775; c=relaxed/simple;
	bh=He0s+tyNVfHnUMKL1lDOSU+7xlicumSDIBITTA0IwMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRJRD1/Li0VqJjtTKOxbgHmm5v1UcskPcT9CaKLT1d53KpdpYzAhGziWeXVHPerb5Cw6P9AEnjt9R5En6ndU+VrJCEoz9XGZ03Tfdj7SWr9bFg9f1MyMiRwpNEskxrEUy3LjTaSpP4+65WAu5sjsqOUqJlX905PexubPA1ELBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fulbXStv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C77A1340;
	Fri,  6 Jun 2025 12:29:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749205767;
	bh=He0s+tyNVfHnUMKL1lDOSU+7xlicumSDIBITTA0IwMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fulbXStvWLTGnWN2A5klkVTQroHmlPbqPwV3QlyEmb7anyPGjeyGELJhCLqRZgoBH
	 01HHbyMRund+RQtQWAOfK20l7a1qDMzq4Bl3dBKNFmAdOH7VgerdLczOv3AgQpLInT
	 jJpyq4EJ6UDdxV/t3sUbX5TdvS35WWU0ASTbpcm8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 06 Jun 2025 12:29:21 +0200
Subject: [PATCH v7 1/4] media: pisp_be: Drop reference to non-existing
 function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-1-46169f0622b7@ideasonboard.com>
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=He0s+tyNVfHnUMKL1lDOSU+7xlicumSDIBITTA0IwMQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoQsMIGt1fda006Td2LBAA5RnOpAz2jRvhSDLeH
 d/T88NxQzGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaELDCAAKCRByNAaPFqFW
 PDOvD/9DtemdGJeu46ceFrfKReelpDD0ARPiehQx9Q3Fesv2XCKxRDYPras92HBq2nV3tTuGMAR
 vFUIgqziS7COcYUU+cjBC7kPMzWxnY7bjtQW4D9WPdCnKgumq7fOPrIDGiJmxvQv8XWY0dZpPNV
 gGCoS2l/wXlZxX3W7CXtLJ5sRbiKhD6vLnzQx071Ao05sK9N2WsmJA/2vqgZKZmoWaBgxl+LL1J
 y/DHtKdaL27MerUcQ8dU1ZlZ+MwDRrj/l3d8hcI1tq3/xsCOGefkQBhmEYRyfrcAVkVTsfLUqj5
 dANQbKmUNeIINPlQ5d3Gg4suvCGycGR8P3f8scTd1byHPwHpxbT6DVwlMy/JL6LieG6ircf43FH
 n4rUmFPzrzhDTeN24PK2kZl19rUYFNh9zBvj0JQmqL4oz3lvNi8bn3TDEeFpTlk7yYmTgEAqPOL
 hTSV3633VzS90DU9zAngZ8bT37Yx5pWpfm+m93+UYgm9EJuZcg9HM0wL8BEK0RLa3CLpjc50y7D
 j+pIJ6x6q5zKwFY3HSApDdpqrt8P7B8xW7oW+H+QLyNM809ZWr/ZHXCPMdLa6xGaRegfHHm4L25
 1NniFBdNIW6XeS4SstPjaGC6I9isRb6Qklk8oFzhTdb095Ef52N6O58ZVLgA0vOayAbYsnMX7lp
 jICGNfv5DkSJjAg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

A comment in the pisp_be driver references the
pispbe_schedule_internal() function which doesn't exist.

Drop it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 7596ae1f7de6..b1449245f394 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
 	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
 				     &pispbe->node[MAIN_INPUT_NODE]);
 	if (ret <= 0) {
-		/*
-		 * This shouldn't happen; pispbe_schedule_internal should insist
-		 * on an input.
-		 */
+		/* Shouldn't happen, we have validated an input is available. */
 		dev_warn(pispbe->dev, "ISP-BE missing input\n");
 		hw_en->bayer_enables = 0;
 		hw_en->rgb_enables = 0;

-- 
2.49.0


