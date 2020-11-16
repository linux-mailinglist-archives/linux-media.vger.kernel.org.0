Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE812B5049
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 19:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbgKPSwe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 13:52:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51284 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728505AbgKPSwe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 13:52:34 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8BA918D8;
        Mon, 16 Nov 2020 19:52:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605552745;
        bh=H6oJsZMNBbfpSgqTD2ZEPfVTOPlb8s0pZIcO7pRXwfI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rG6mheGC4XGMWC+8ilbEPR8MfBMxhmQ1jB40i2lixWZy/qZ4SUtzHNUdctIK228tx
         6YHLFF4z6K/lTQJx7VkXoH3XCbFzD3LJ3xP1/rziKum1AsRW0QqtWH062QwUNlpoLR
         nNuhUVFu+YDD6amzEEVD6XiYc/WP9FjXWWj56SOs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v3 13/21] media: doc: pixfmt-packed-yuv: Clarify naming scheme for 4:4:4 formats
Date:   Mon, 16 Nov 2020 20:51:59 +0200
Message-Id: <20201116185207.13208-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201116185207.13208-1-laurent.pinchart@ideasonboard.com>
References: <20201116185207.13208-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the naming scheme for the existing packed YUV 4:4:4 formats, as
previously done for the RGB formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-packed-yuv.rst  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index 6f9f9d63a4ad..eb551b57557e 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -25,6 +25,14 @@ components and thus differ in how they interlave the three components.
 These formats do not subsample the chroma components and store each pixels as a
 full triplet of Y, Cb and Cr values.
 
+The next table lists the packed YUV 4:4:4 formats with less than 8 bits per
+component. They are named based on the order of the Y, Cb and Cr components as
+seen in a 16-bit word, which is then stored in memory in little endian byte
+order, and on the number of bits for each component. For instance the YUV565
+format stores a pixel in a 16-bit word [15:0] laid out at as [Y'\ :sub:`4-0`
+Cb\ :sub:`5-0` Cr\ :sub:`4-0`], and stored in memory in two bytes,
+[Cb\ :sub:`2-0` Cr\ :sub:`4-0`] followed by [Y'\ :sub:`4-0` Cb\ :sub:`5-3`].
+
 .. raw:: latex
 
     \begingroup
@@ -145,6 +153,12 @@ full triplet of Y, Cb and Cr values.
     <overlay>` or :ref:`Video Output Overlay <osd>`.
 
 
+The next table lists the packed YUV 4:4:4 formats with 8 bits per component.
+They are named based on the order of the Y, Cb and Cr components as stored in
+memory, and on the total number of bits per pixel. For instance, the VUYX32
+format stores a pixel with Cr\ :sub:`7-0` in the first byte, Cb\ :sub:`7-0` in
+the second byte and Y'\ :sub:`7-0` in the third byte.
+
 .. flat-table:: Packed YUV Image Formats (8bpc)
     :header-rows: 1
     :stub-columns: 0
-- 
Regards,

Laurent Pinchart

