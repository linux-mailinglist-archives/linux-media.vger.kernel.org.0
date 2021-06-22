Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923573B02C4
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 13:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhFVLbP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 07:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbhFVLbN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 07:31:13 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A04C061574
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 04:28:57 -0700 (PDT)
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 0B5F1634C8F;
        Tue, 22 Jun 2021 14:21:55 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 6/6] Documentation: v4l: Fix V4L2_CID_PIXEL_RATE documentation
Date:   Tue, 22 Jun 2021 14:22:00 +0300
Message-Id: <20210622112200.13914-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
References: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_CID_PIXEL_RATE is nowadays used to tell pixel sampling rate in
the sub-device's pixel array, not the pixel rate over a link (for which it
also becomes unfit with the addition of multiplexed streams later on). Fix
this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index 37dad2f4df8c..6d681af95624 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -38,7 +38,7 @@ Image Process Control IDs
     of this control is Hz.
 
 ``V4L2_CID_PIXEL_RATE (64-bit integer)``
-    Pixel rate in the source pads of the subdev. This control is
+    Pixel sampling rate in the device's pixel array. This control is
     read-only and its unit is pixels / second.
 
 ``V4L2_CID_TEST_PATTERN (menu)``
-- 
2.30.2

