Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C72EB1C35AA
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbgEDJ05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728425AbgEDJ04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:56 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DACC91209;
        Mon,  4 May 2020 11:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584410;
        bh=uHRgbhwFDlNAhbKOzmn1UcejEtQyI6bnr3E0DowIxZw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pqfwEcMVgGzpc9U1H7t/p0sihE5DqJ1CdCmJpqgj1JoUMeZbmr3RyUjgwp/w1fjnE
         UMztNobdPVy1De5EYsmPFARoUOSnE6JtcqTd72wsRcAyOkO1lwL2VO8Rb2MWCe8ZSB
         3gTaWLmwJC6TuwQIbG9+78BXR7MB6+7ukaMUCgOU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 34/34] staging: vchiq: Load bcm2835_isp driver from vchiq
Date:   Mon,  4 May 2020 12:26:11 +0300
Message-Id: <20200504092611.9798-35-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Naushir Patuck <naush@raspberrypi.com>

bcmn2835_isp is a platform driver dependent on vchiq,
therefore add the load/unload functions for it to vchiq.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 59ae2d479ef4..abc30e593b67 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -108,6 +108,7 @@ static DEFINE_SPINLOCK(msg_queue_spinlock);
 static struct platform_device *bcm2835_camera;
 static struct platform_device *bcm2835_audio;
 static struct platform_device *vcsm_cma;
+static struct platform_device *bcm2835_isp;
 
 static struct vchiq_drvdata bcm2835_drvdata = {
 	.cache_line_size = 32,
@@ -2824,6 +2825,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	vcsm_cma = vchiq_register_child(pdev, "vcsm-cma");
 	bcm2835_camera = vchiq_register_child(pdev, "bcm2835-camera");
 	bcm2835_audio = vchiq_register_child(pdev, "bcm2835_audio");
+	bcm2835_isp = vchiq_register_child(pdev, "bcm2835-isp");
 
 	return 0;
 
@@ -2836,6 +2838,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 static int vchiq_remove(struct platform_device *pdev)
 {
+	platform_device_unregister(bcm2835_isp);
 	platform_device_unregister(bcm2835_audio);
 	platform_device_unregister(bcm2835_camera);
 	platform_device_unregister(vcsm_cma);
-- 
Regards,

Laurent Pinchart

