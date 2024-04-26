Return-Path: <linux-media+bounces-10220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5902C8B388A
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 15:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9A66B23B2D
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 13:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B90E147C91;
	Fri, 26 Apr 2024 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J8zugdgu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9482B147C61;
	Fri, 26 Apr 2024 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138489; cv=none; b=fzu3Z/odg6hlKZvhkjuPbDLpEmrTK6XofgIEfX9DkORAjP9zVqlWFSse+cccwJs5gjQtg/KWAyNA8g+nxoeq5N1cmC1ZvGp/oBcgvt1jRH8c4Yl4q4ZxiwYnJYs8qZN4AsNnpW8fAMZhfo+erLym62C8+v1k6YFE94l59wtiq2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138489; c=relaxed/simple;
	bh=JzDiz1wz5pOiVASJ7ZgXZfkdAo2gKWQG4JoogGb+QgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6GN4DcC5X7BxxxF/WJfEscY0rqN+oVcIV9tryyxwpoChv5hcrdxK0nRMy0MvEmIxRLIhfCKfjFHO5dPTD+j6pBSM6hQ/y6BDRWxYOxrW9bI7yf3B3Wjs0ejrGkiYwGTytwosrXeuFiSsH0onORaQAhW4+dPBl1/vZc0elwadZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J8zugdgu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EB66CC8;
	Fri, 26 Apr 2024 15:33:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714138426;
	bh=JzDiz1wz5pOiVASJ7ZgXZfkdAo2gKWQG4JoogGb+QgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J8zugdgu622Co+nJAhrQQOA7WRmoxeHelyT+TRwoJ66igvRIyRdjHORQWWM35h6el
	 tCRXe//8Ye2IzLTsXu06HUtKBl1V4O1MNjLHS4wVQ7W9AnuPChIUd+kD1GjHEG2fAx
	 07ex5ey4tM/6QGEuY3mPQOVIAj0BiEqEpPiGxzqM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v11 6/5] media: bcm2835-unicam: Return error code when DT parsing fails
Date: Fri, 26 Apr 2024 16:34:32 +0300
Message-ID: <20240426133432.13266-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424153542.32503-1-laurent.pinchart@ideasonboard.com>
References: <20240424153542.32503-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two of the error paths in unicam_async_nf_init() when DT parsing fails
are not setting the ret variable, resulting in the function returning 0
on error. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This patch should be squashed with "[PATCH v11 4/5] media:
bcm2835-unicam: Add support for CCP2/CSI2 camera interface".
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index e91d02a64770..6ac4ea8efb1a 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2519,6 +2519,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
 		    num_data_lanes != 4) {
 			dev_err(unicam->dev, "%u data lanes not supported\n",
 				num_data_lanes);
+			ret = -EINVAL;
 			goto error;
 		}
 
@@ -2526,6 +2527,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
 			dev_err(unicam->dev,
 				"Endpoint uses %u data lanes when %u are supported\n",
 				num_data_lanes, unicam->max_data_lanes);
+			ret = -EINVAL;
 			goto error;
 		}
 
-- 
Regards,

Laurent Pinchart


