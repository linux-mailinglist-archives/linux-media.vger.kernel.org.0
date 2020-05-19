Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770A71D952F
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 13:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728745AbgESLWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 07:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgESLWp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 07:22:45 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBB3C061A0C
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 04:22:45 -0700 (PDT)
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 8CD63634C87;
        Tue, 19 May 2020 14:22:26 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v3 1/1] Documentation: media: Refer to mbus format documentation from CSI-2 docs
Date:   Tue, 19 May 2020 14:21:36 +0300
Message-Id: <20200519112136.6122-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media bus formats to be used on serial busses are documented but there
was no reference from CSI-2 documentation. Add that now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v2:

- Refer to mbus formats.

- Remove other elaboration on formats.

- Fix subject (format vs. code)

 Documentation/driver-api/media/csi2.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
index da8b356389f0..310849d53d05 100644
--- a/Documentation/driver-api/media/csi2.rst
+++ b/Documentation/driver-api/media/csi2.rst
@@ -10,6 +10,12 @@ the host SoC. It is defined by the `MIPI alliance`_.
 
 .. _`MIPI alliance`: http://www.mipi.org/
 
+Media bus formats
+-----------------
+
+See :ref:`v4l2-mbus-pixelcode` for details on which media bus formats should   
+be used for CSI-2 interfaces.
+
 Transmitter drivers
 -------------------
 
-- 
2.20.1

