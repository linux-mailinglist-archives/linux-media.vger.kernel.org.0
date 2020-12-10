Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC242D58B5
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 11:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389255AbgLJK5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:57:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:56390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730358AbgLJK5V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:57:21 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] media: ext-ctrls-codec-stateless.rst: fix an H-264 table format
Date:   Thu, 10 Dec 2020 11:55:50 +0100
Message-Id: <d852b26a8d10f0876be067746d07e19e1faa9f80.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607597287.git.mchehab+huawei@kernel.org>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Picture Parameter Set Flags table for H-264 doesn't output
well on PDF. There are missing format instructions for LaTeX, and
the columns are too long.

Reduce the size of the second column, as 16 bits is more than enough
for the current flags usage, and add the needed bits for it to be
properly output in PDF format.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 36 +++++++++++++------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index e1537ffc6eaa..360165c4d98f 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -212,43 +212,57 @@ Stateless Codec Control ID
       - ``flags``
       - See :ref:`Picture Parameter Set Flags <h264_pps_flags>`
 
+.. raw:: latex
+
+    \normalsize
+
 .. _h264_pps_flags:
 
 ``Picture Parameter Set Flags``
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \begingroup
+    \scriptsize
+    \setlength{\tabcolsep}{2pt}
+
+.. tabularcolumns:: |p{9.8cm}|p{1.0cm}|p{6.5cm}|
 
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 2
+    :widths:       10 1 4
 
     * - ``V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE``
-      - 0x00000001
+      - 0x0001
       -
     * - ``V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT``
-      - 0x00000002
+      - 0x0002
       -
     * - ``V4L2_H264_PPS_FLAG_WEIGHTED_PRED``
-      - 0x00000004
+      - 0x0004
       -
     * - ``V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT``
-      - 0x00000008
+      - 0x0008
       -
     * - ``V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED``
-      - 0x00000010
+      - 0x0010
       -
     * - ``V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT``
-      - 0x00000020
+      - 0x0020
       -
     * - ``V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE``
-      - 0x00000040
+      - 0x0040
       -
     * - ``V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT``
-      - 0x00000080
-      - Indicates that ``V4L2_CID_STATELESS_H264_SCALING_MATRIX``
+      - 0x0080
+      - ``V4L2_CID_STATELESS_H264_SCALING_MATRIX``
         must be used for this picture.
 
+.. raw:: latex
+
+    \endgroup
+
 ``V4L2_CID_STATELESS_H264_SCALING_MATRIX (struct)``
     Specifies the scaling matrix (as extracted from the bitstream) for
     the associated H264 slice data. The bitstream parameters are
-- 
2.29.2

