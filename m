Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D73A28D031
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 16:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388581AbgJMO15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 10:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387516AbgJMO14 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 10:27:56 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21EDC0613D0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 07:27:56 -0700 (PDT)
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 6F70C634C89;
        Tue, 13 Oct 2020 17:26:45 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/2] Documentation: v4l: Fix language
Date:   Tue, 13 Oct 2020 17:27:50 +0300
Message-Id: <20201013142751.26228-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201013142751.26228-1-sakari.ailus@linux.intel.com>
References: <20201013142751.26228-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove extra "is" from sentence explaining V4L2_CID_PIXEL_RATE may be used
to tell the pixel rate used by a transmitter driver. Also call
V4L2_CID_PIXEL_RATE a control.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/csi2.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
index e1b838014906..e3bbc6baf0f0 100644
--- a/Documentation/driver-api/media/csi2.rst
+++ b/Documentation/driver-api/media/csi2.rst
@@ -28,10 +28,9 @@ interface elements must be present on the sub-device represents the
 CSI-2 transmitter.
 
 The V4L2_CID_LINK_FREQ control is used to tell the receiver driver the
-frequency (and not the symbol rate) of the link. The
-V4L2_CID_PIXEL_RATE is may be used by the receiver to obtain the pixel
-rate the transmitter uses. The
-:c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an
+frequency (and not the symbol rate) of the link. The V4L2_CID_PIXEL_RATE
+control may be used by the receiver to obtain the pixel rate the transmitter
+uses. The :c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an
 ability to start and stop the stream.
 
 The value of the V4L2_CID_PIXEL_RATE is calculated as follows::
-- 
2.27.0

