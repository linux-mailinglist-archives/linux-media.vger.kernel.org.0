Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899EB1D90EC
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 09:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgESHXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 03:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbgESHXE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 03:23:04 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F98DC061A0C
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 00:23:04 -0700 (PDT)
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 851B9634C87;
        Tue, 19 May 2020 10:22:45 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 1/1] Documentation: media: Document media bus codes to use on serial busses
Date:   Tue, 19 May 2020 10:21:48 +0300
Message-Id: <20200519072148.28071-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document media bus codes on serial busses. The single sample per pixel
variant is to be chosen from all the possible variants. While this has
been the practice since the introduction of CSI-2 support, it never was
written down. Do it now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/csi2.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
index da8b356389f0..af078ac927bd 100644
--- a/Documentation/driver-api/media/csi2.rst
+++ b/Documentation/driver-api/media/csi2.rst
@@ -10,6 +10,16 @@ the host SoC. It is defined by the `MIPI alliance`_.
 
 .. _`MIPI alliance`: http://www.mipi.org/
 
+Media bus formats
+-----------------
+
+Always use single sample per pixel formats on the CSI-2 bus.
+
+No new media bus formats were created when the support for serial busses were
+added. To avoid using different media bus codes to describe the same format, the
+practice is to use a format that has a single sample per pixel on the parallel
+bus.
+
 Transmitter drivers
 -------------------
 
-- 
2.20.1

