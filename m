Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094701C35A6
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728439AbgEDJ0x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728401AbgEDJ0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:51 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4947F304;
        Mon,  4 May 2020 11:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584407;
        bh=kA6YRPSNeFZEAYiNKAMVdXCXB8iBJh1FSsBXbLabxA8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YF1cIwjY386T5teD5tz/eZo/fhmr0WIwlSLS22a9kQ2ANKWax3ASPFkk/KjCtKtTs
         5oYR7xbpS42NtMRshv3wQ50xnFzVixudHsh3BxOBZgF69aTIOMdVxQxcc9zR1JwfHa
         r2ObMFn2U7bEEpdy0bbaVh4jxYM3Z66U/FxPvkAA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH v2 30/34] staging: vchiq_arm: Give vchiq children DT nodes
Date:   Mon,  4 May 2020 12:26:07 +0300
Message-Id: <20200504092611.9798-31-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Phil Elwell <phil@raspberrypi.com>

vchiq kernel clients are now instantiated as platform drivers rather
than using DT, but the children of the vchiq interface may still
benefit from access to DT properties. Give them the option of a
a sub-node of the vchiq parent for configuration and to allow
them to be disabled.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index dd3c8f829daa..2325ab825941 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -2734,12 +2734,20 @@ vchiq_register_child(struct platform_device *pdev, const char *name)
 	pdevinfo.id = PLATFORM_DEVID_NONE;
 	pdevinfo.dma_mask = DMA_BIT_MASK(32);
 
+	np = of_get_child_by_name(pdev->dev.of_node, name);
+
+	/* Skip the child if it is explicitly disabled */
+	if (np && !of_device_is_available(np))
+		return NULL;
+
 	child = platform_device_register_full(&pdevinfo);
 	if (IS_ERR(child)) {
 		dev_warn(&pdev->dev, "%s not registered\n", name);
 		child = NULL;
 	}
 
+	child->dev.of_node = np;
+
 	/*
 	 * We want the dma-ranges etc to be copied from a device with the
 	 * correct dma-ranges for the VPU.
-- 
Regards,

Laurent Pinchart

