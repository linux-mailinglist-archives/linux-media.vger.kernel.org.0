Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573CD274F2E
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbgIWCo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727318AbgIWCo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:26 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B4871490;
        Wed, 23 Sep 2020 04:44:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829057;
        bh=ksOi8RfKASnBXb2Tjz82nro/URda3z6QJYJzMNmMhlw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dwa7PTYnqkGDyB48GgOmRMzknUfMzhOtmL0BFcYUfrnxYVh09jYsVNfi8xembbwqg
         iHzlHAow2gyuBJCyuh4daIdIRs0X9Im6bu4Qqu6Y54hnmkFdN5lbojP8fY5goHoCOh
         AUlS5H4zskkDLNhs5/0gGkhVEz1Crokjojtosz7k=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 11/16] media: doc: pixfmt-packed-yuv: Clarify naming scheme for 4:4:4 formats
Date:   Wed, 23 Sep 2020 05:43:28 +0300
Message-Id: <20200923024333.920-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
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
index e378309d70f0..81b95ca25fb7 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -32,6 +32,14 @@ components and thus differ in how they interlave the three components.
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
@@ -152,6 +160,12 @@ full triplet of Y, Cb and Cr values.
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

