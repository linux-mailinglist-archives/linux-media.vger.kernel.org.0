Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF2F72D58B2
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 11:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389227AbgLJK5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:57:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:56396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389223AbgLJK5V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:57:21 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] media: pixfmt-yuv-planar.rst: fix PDF OUTPUT
Date:   Thu, 10 Dec 2020 11:55:51 +0100
Message-Id: <2f46882c4f60a9353ead5630293e6245ffed9e6a.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607597287.git.mchehab+huawei@kernel.org>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missing format macros for the tables there to be properly
output.

While here, also remove the empty ".. note::" markup.

It should be noticed that ".. [1]" markups will generate footnotes,
and not a note within the main text body.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/v4l/pixfmt-yuv-planar.rst           | 34 ++++++++++++++-----
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 7d4d39201a3f..77744d6e5745 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -48,6 +48,12 @@ relationship between the luma and chroma line padding and stride.
 
 All components are stored with the same number of bits per component.
 
+.. raw:: latex
+
+    \footnotesize
+
+.. tabularcolumns:: |p{5.2cm}|p{1.0cm}|p{1.5cm}|p{1.9cm}|p{1.2cm}|p{1.8cm}|p{2.7cm}|
+
 .. flat-table:: Overview of Semi-Planar YUV Formats
     :header-rows:  1
     :stub-columns: 0
@@ -146,12 +152,14 @@ All components are stored with the same number of bits per component.
       - Yes
       - Linear
 
-.. note::
+.. raw:: latex
 
-   .. [1] Order of chroma samples in the second plane
-   .. [2] Indicates if planes have to be contiguous in memory or can be
-      disjoint
-   .. [3] Macroblock size in pixels
+    \normalsize
+
+.. [1] Order of chroma samples in the second plane
+.. [2] Indicates if planes have to be contiguous in memory or can be
+       disjoint
+.. [3] Macroblock size in pixels
 
 
 **Color Sample Location:**
@@ -481,6 +489,12 @@ relationship between the luma and chroma line padding and stride.
 
 All components are stored with the same number of bits per component.
 
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{5.0cm}|p{1.1cm}|p{1.5cm}|p{2.2cm}|p{1.2cm}|p{3.7cm}|
+
 .. flat-table:: Overview of Fully Planar YUV Formats
     :header-rows:  1
     :stub-columns: 0
@@ -565,11 +579,13 @@ All components are stored with the same number of bits per component.
       - Y, Cr, Cb
       - No
 
-.. note::
+.. raw:: latex
 
-   .. [4] Order of luma and chroma planes
-   .. [5] Indicates if planes have to be contiguous in memory or can be
-      disjoint
+    \normalsize
+
+.. [4] Order of luma and chroma planes
+.. [5] Indicates if planes have to be contiguous in memory or can be
+       disjoint
 
 
 **Color Sample Location:**
-- 
2.29.2

