Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114F92EAE56
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbhAEPbC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:31:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727414AbhAEPbC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:31:02 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 852B3878;
        Tue,  5 Jan 2021 16:29:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860578;
        bh=sjUC8h2lBeGDVLvxPKTR/OWGPMim+tAWpsptZOpC2NA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DGlkMjLpEAt3zHeHBrtFq6ga/XMmemb6rz7TJzZSbe9Zn5xdcQO26DD9MIIsXt9m2
         PF3mB+sGQ6XgAQXlbQ2VFLqlU7rRBbmdIThcgtWdwj+/rlgNrj0fKO5ppv4kWRQxKR
         4JOdnCbowQOyhGMeBz2AVTxtCma60F9CAEV6hJpw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 03/75] media: imx: Drop manual dependency on VIDEO_IMX_MEDIA
Date:   Tue,  5 Jan 2021 17:27:40 +0200
Message-Id: <20210105152852.5733-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VIDEO_IMX_CSI and VIDEO_IMX7_CSI symbols are defined in a section
guarded by VIDEO_IMX_MEDIA. There's no need to duplicate that with a
"depends on" statement. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 76a9111c189c..ce270627a7c4 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -19,14 +19,12 @@ menu "i.MX5/6/7 Media Sub devices"
 
 config VIDEO_IMX_CSI
 	tristate "i.MX5/6 Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA
 	default y
 	help
 	  A video4linux camera sensor interface driver for i.MX5/6.
 
 config VIDEO_IMX7_CSI
 	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA
 	default y
 	help
 	  Enable support for video4linux camera sensor interface driver for
-- 
Regards,

Laurent Pinchart

