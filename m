Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2DF2D58E2
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389183AbgLJK46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:56:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:56246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389168AbgLJK4k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:56:40 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] media: colorspaces-details.rst: drop tabularcolumns
Date:   Thu, 10 Dec 2020 11:55:41 +0100
Message-Id: <b52f62a7b1f1e33be35fdc4b626aefdd14840f6a.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607597287.git.mchehab+huawei@kernel.org>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those tables have small cells that fit nicely without requiring
line beaks.

So, they don't need tabular columns, as Sphinx/LaTeX
can adjust the width on such tables.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/v4l/colorspaces-details.rst         | 31 -------------------
 1 file changed, 31 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/colorspaces-details.rst b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
index 126f66482a0d..26a4ace42ca5 100644
--- a/Documentation/userspace-api/media/v4l/colorspaces-details.rst
+++ b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
@@ -17,10 +17,6 @@ PAL and by SDTV in general. The default transfer function is
 range. The chromaticities of the primary colors and the white reference
 are:
 
-
-
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: SMPTE 170M Chromaticities
     :header-rows:  1
     :stub-columns: 0
@@ -98,10 +94,6 @@ default Y'CbCr encoding is ``V4L2_YCBCR_ENC_709``. The default Y'CbCr
 quantization is limited range. The chromaticities of the primary colors
 and the white reference are:
 
-
-
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: Rec. 709 Chromaticities
     :header-rows:  1
     :stub-columns: 0
@@ -225,10 +217,6 @@ would break how applications interpret the quantization range.
 
 The chromaticities of the primary colors and the white reference are:
 
-
-
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: sRGB Chromaticities
     :header-rows:  1
     :stub-columns: 0
@@ -308,9 +296,6 @@ would break how applications interpret the quantization range.
 
 The chromaticities of the primary colors and the white reference are:
 
-
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: opRGB Chromaticities
     :header-rows:  1
     :stub-columns: 0
@@ -373,10 +358,6 @@ definition television (UHDTV). The default transfer function is
 ``V4L2_YCBCR_ENC_BT2020``. The default Y'CbCr quantization is limited range.
 The chromaticities of the primary colors and the white reference are:
 
-
-
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: BT.2020 Chromaticities
     :header-rows:  1
     :stub-columns: 0
@@ -478,9 +459,6 @@ is ``V4L2_XFER_FUNC_DCI_P3``. The default Y'CbCr encoding is
 The chromaticities of the primary colors and the white reference are:
 
 
-
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: DCI-P3 Chromaticities
     :header-rows:  1
     :stub-columns: 0
@@ -532,9 +510,6 @@ quantization is limited range. The chromaticities of the primary colors
 and the white reference are:
 
 
-
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: SMPTE 240M Chromaticities
     :header-rows:  1
     :stub-columns: 0
@@ -603,9 +578,6 @@ limited range. The chromaticities of the primary colors and the white
 reference are:
 
 
-
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: NTSC 1953 Chromaticities
     :header-rows:  1
     :stub-columns: 0
@@ -683,9 +655,6 @@ range. The chromaticities of the primary colors and the white reference
 are:
 
 
-
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: EBU Tech. 3213 Chromaticities
     :header-rows:  1
     :stub-columns: 0
-- 
2.29.2

