Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B863B2A89
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 10:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhFXInQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 04:43:16 -0400
Received: from retiisi.eu ([95.216.213.190]:51526 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229884AbhFXInM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 04:43:12 -0400
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 5AA53634C8F;
        Thu, 24 Jun 2021 11:40:32 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v3 6/6] Documentation: v4l: Fix V4L2_CID_PIXEL_RATE documentation
Date:   Thu, 24 Jun 2021 11:40:46 +0300
Message-Id: <20210624084046.13136-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624084046.13136-1-sakari.ailus@linux.intel.com>
References: <20210624084046.13136-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index ed65fb594cc8..2b5a13dc843f 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -40,7 +40,7 @@ Image Process Control IDs
 .. _v4l2-cid-pixel-rate:
 
 ``V4L2_CID_PIXEL_RATE (64-bit integer)``
-    Pixel rate in the source pads of the subdev. This control is
+    Pixel sampling rate in the device's pixel array. This control is
     read-only and its unit is pixels / second.
 
 ``V4L2_CID_TEST_PATTERN (menu)``
-- 
2.30.2

