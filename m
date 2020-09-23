Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C495274F27
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgIWCoR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbgIWCoR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C6DC061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 19:44:17 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4DBC1243;
        Wed, 23 Sep 2020 04:44:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829053;
        bh=+b9K081dcyxEOPZJvoJasyVcPhpkn1Y5Yst92VuJC0I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qKpeBOwVC4D9lS4nSyXsjGMhy625mYPc6+69GaalVfFqQr2vigz0i7pLf3hLEa0Vy
         ZDp9vjQKcW+wUTUp/lf0HCBKjaDN74cIbq1tfd9Y5uzCphDZcjWgnxYVD9jkp73E7C
         MC5VYqXOEm6G41PlNRwx6iBCtwZ3gktZVnjQR0Pw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 04/16] media: doc: pixfmt-rgb: Remove layout table for packed RGB formats
Date:   Wed, 23 Sep 2020 05:43:21 +0300
Message-Id: <20200923024333.920-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The packed RGB formats documentation includes a layout table without any
context. This doesn't bring much useful information, and is confusing at
best. Remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 71 -------------------
 1 file changed, 71 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index 89cc2a37b285..231383c49e15 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -1006,77 +1006,6 @@ The XRGB and XBGR formats contain undefined bits (-). Applications,
 devices and drivers must ignore those bits, for both
 :ref:`capture` and :ref:`output` devices.
 
-**Byte Order.**
-Each cell is one byte.
-
-
-.. raw:: latex
-
-    \small
-
-.. tabularcolumns:: |p{3.1cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|
-
-.. flat-table:: RGB byte order
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       11 3 3 3 3 3 3 3 3 3 3 3 3
-
-    * - start + 0:
-      - B\ :sub:`00`
-      - G\ :sub:`00`
-      - R\ :sub:`00`
-      - B\ :sub:`01`
-      - G\ :sub:`01`
-      - R\ :sub:`01`
-      - B\ :sub:`02`
-      - G\ :sub:`02`
-      - R\ :sub:`02`
-      - B\ :sub:`03`
-      - G\ :sub:`03`
-      - R\ :sub:`03`
-    * - start + 12:
-      - B\ :sub:`10`
-      - G\ :sub:`10`
-      - R\ :sub:`10`
-      - B\ :sub:`11`
-      - G\ :sub:`11`
-      - R\ :sub:`11`
-      - B\ :sub:`12`
-      - G\ :sub:`12`
-      - R\ :sub:`12`
-      - B\ :sub:`13`
-      - G\ :sub:`13`
-      - R\ :sub:`13`
-    * - start + 24:
-      - B\ :sub:`20`
-      - G\ :sub:`20`
-      - R\ :sub:`20`
-      - B\ :sub:`21`
-      - G\ :sub:`21`
-      - R\ :sub:`21`
-      - B\ :sub:`22`
-      - G\ :sub:`22`
-      - R\ :sub:`22`
-      - B\ :sub:`23`
-      - G\ :sub:`23`
-      - R\ :sub:`23`
-    * - start + 36:
-      - B\ :sub:`30`
-      - G\ :sub:`30`
-      - R\ :sub:`30`
-      - B\ :sub:`31`
-      - G\ :sub:`31`
-      - R\ :sub:`31`
-      - B\ :sub:`32`
-      - G\ :sub:`32`
-      - R\ :sub:`32`
-      - B\ :sub:`33`
-      - G\ :sub:`33`
-      - R\ :sub:`33`
-
-.. raw:: latex
-
-    \normalsize
 
 Formats defined in :ref:`pixfmt-rgb-deprecated` are deprecated and
 must not be used by new drivers. They are documented here for reference.
-- 
Regards,

Laurent Pinchart

