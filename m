Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 592C52D07DA
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgLFXFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:05:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59894 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgLFXFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:05:12 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64295153E;
        Mon,  7 Dec 2020 00:03:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607295814;
        bh=0p64Nlh9WYoNr3lXpanXu/k5w+/japfxo8jRG9BH6eI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ha4nlxCi4jycpV/OBhRHbTpjaqnM9bOJAEgaWWsZvtlsh6z7vqKKsSwtQDBV34bhf
         7FOIGcmCk8YPGYnAdc21Tu+nWq+rfVp/GGfG6h3XxaQmtg+HKiWWT35p/mYME8YjXx
         6sOmtKMFRwVgu+8h3WFDLGj67bJNOTGJZDvyrWas=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v4 11/16] media: doc: pixfmt-packed-yuv: Fill padding bits with 'X'
Date:   Mon,  7 Dec 2020 01:03:11 +0200
Message-Id: <20201206230316.1221-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206230316.1221-1-laurent.pinchart@ideasonboard.com>
References: <20201206230316.1221-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The padding bits are left blank, which look weird in the XYUV format,
and, worse, may lead to the VUYX format to be understand as consuming 3
bytes per pixel. Add 'X' for padding bits as we do for RGB formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Replace '-' with 'X'
---
 .../media/v4l/pixfmt-packed-yuv.rst           | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index 8ed1a6aff3a6..fbd9b412388c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -239,14 +239,14 @@ full triplet of Y, Cb and Cr values.
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
+      - X\ :sub:`7`
+      - X\ :sub:`6`
+      - X\ :sub:`5`
+      - X\ :sub:`4`
+      - X\ :sub:`3`
+      - X\ :sub:`2`
+      - X\ :sub:`1`
+      - X\ :sub:`0`
 
       - Y'\ :sub:`7`
       - Y'\ :sub:`6`
@@ -348,14 +348,14 @@ full triplet of Y, Cb and Cr values.
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
+      - X\ :sub:`7`
+      - X\ :sub:`6`
+      - X\ :sub:`5`
+      - X\ :sub:`4`
+      - X\ :sub:`3`
+      - X\ :sub:`2`
+      - X\ :sub:`1`
+      - X\ :sub:`0`
 
 .. raw:: latex
 
-- 
Regards,

Laurent Pinchart

