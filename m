Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62297274F2C
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbgIWCoY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbgIWCoY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:24 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 694969CE;
        Wed, 23 Sep 2020 04:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829056;
        bh=FoXcVofPcBW1B2k94frrVstPvlJ4HAbg08xZiipFojI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dvjgOSIou1UW3UcgsotY3cA7nxTn69Lz6OZLayGpE76edBvrSvQJaUFDy6fziPxDs
         YgAZYyqt9+cDsF36rIBEeLU4/oKmsO1zzlAUe5Q+7CZUVIifOZdaNzvBV1zkz/KKCO
         NNQROgKck4DeAeiMIqxZdGgDO3Q6aAu2+l0Pc+L0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 09/16] media: doc: pixfmt-packed-yuv: Fill padding bits with '-'
Date:   Wed, 23 Sep 2020 05:43:26 +0300
Message-Id: <20200923024333.920-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The padding bits are left blank, which look weird in the XYUV format,
and, worse, may lead to the VUYX format to be understand as consuming 3
bytes per pixel. Add '-' for padding bits as we do for RGB formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/pixfmt-packed-yuv.rst           | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index 08b4361ba879..c4ee8d5ac668 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -246,14 +246,14 @@ full triplet of Y, Cb and Cr values.
       - ``V4L2_PIX_FMT_XYUV32``
       - 'XYUV'
 
-      -
-      -
-      -
-      -
-      -
-      -
-      -
-      -
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
 
       - Y'\ :sub:`7`
       - Y'\ :sub:`6`
@@ -355,14 +355,14 @@ full triplet of Y, Cb and Cr values.
       - Y'\ :sub:`1`
       - Y'\ :sub:`0`
 
-      -
-      -
-      -
-      -
-      -
-      -
-      -
-      -
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
 
 .. raw:: latex
 
-- 
Regards,

Laurent Pinchart

