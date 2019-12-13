Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEE4511E346
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 13:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfLMMHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 07:07:12 -0500
Received: from inva020.nxp.com ([92.121.34.13]:37230 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbfLMMHM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 07:07:12 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 436131A0CEC;
        Fri, 13 Dec 2019 13:07:10 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2D2B31A0801;
        Fri, 13 Dec 2019 13:07:10 +0100 (CET)
Received: from fsr-ub1664-134.ea.freescale.net (fsr-ub1664-134.ea.freescale.net [10.171.74.111])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 53887203B1;
        Fri, 13 Dec 2019 13:07:09 +0100 (CET)
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v3 6/6] Add maintainer for IMX jpeg v4l2 driver
Date:   Fri, 13 Dec 2019 14:06:21 +0200
Message-Id: <1576238781-5911-7-git-send-email-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576238781-5911-1-git-send-email-mirela.rabulea@nxp.com>
References: <1576238781-5911-1-git-send-email-mirela.rabulea@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added as:
FREESCALE IMX / MXC JPEG V4L2 DRIVER

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d10d732..a4a267d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6609,6 +6609,14 @@ S:	Maintained
 F:	include/linux/platform_data/video-imxfb.h
 F:	drivers/video/fbdev/imxfb.c
 
+FREESCALE IMX / MXC JPEG V4L2 DRIVER
+M:	Mirela Rabulea <mirela.rabulea@nxp.com>
+R:	NXP Linux Team <linux-imx@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
+F:	drivers/media/platform/imx-jpeg
+
 FREESCALE QORIQ DPAA ETHERNET DRIVER
 M:	Madalin Bucur <madalin.bucur@nxp.com>
 L:	netdev@vger.kernel.org
-- 
2.7.4

