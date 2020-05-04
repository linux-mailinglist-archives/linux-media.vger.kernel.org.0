Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3523B1C35A2
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728427AbgEDJ0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728419AbgEDJ0s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:48 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E38701209;
        Mon,  4 May 2020 11:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584405;
        bh=ZDaZRct1RVy7xs8SPv417jYteulvJrltZo++xeluApo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X9EzMyaZO9E1/CyaameloyaYAVfGKnxD4o5bp0clvEkdOkMU4e976ZR30+MlQox3t
         IObbuh2xmUOpXAhG3WxQhCdNZjxhGGLU//u8eowobqZxHQHfEQYLaL1+5ix/CQKQwm
         ZeCe0Q99ngZ1JOCt4CL2o5PHcHQLYbZ8MSBDpiiw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v2 26/34] staging: vchiq_arm: Set up dma ranges on child devices
Date:   Mon,  4 May 2020 12:26:03 +0300
Message-Id: <20200504092611.9798-27-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The VCHIQ driver now loads the audio, camera, codec, and vc-sm
drivers as platform drivers. However they were not being given
the correct DMA configuration.

Call of_dma_configure with the parent (VCHIQ) parameters to be
inherited by the child.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index c5c7af28c1c8..15ccd624aaab 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -2733,6 +2733,12 @@ vchiq_register_child(struct platform_device *pdev, const char *name)
 		child = NULL;
 	}
 
+	/*
+	 * We want the dma-ranges etc to be copied from the parent VCHIQ device
+	 * to be passed on to the children too.
+	 */
+	of_dma_configure(&new_dev->dev, pdev->dev.of_node, true);
+
 	return child;
 }
 
-- 
Regards,

Laurent Pinchart

