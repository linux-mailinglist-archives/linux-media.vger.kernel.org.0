Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8DB2D58C3
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389241AbgLJK5d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:57:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:56398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389164AbgLJK5V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:57:21 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Yong Zhi <yong.zhi@intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] media: docs: pixfmt: use section titles for bayer formats
Date:   Thu, 10 Dec 2020 11:55:48 +0100
Message-Id: <835582a357e5e7fa298ace9eb02984b7d0eba0b7.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607597287.git.mchehab+huawei@kernel.org>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bayer formats have a subtitle, specifying how many bits
they use. Add a title markup to those, as otherwise they
look weird, specially at the PDF output.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst | 2 ++
 Documentation/userspace-api/media/v4l/pixfmt-srggb14.rst      | 2 ++
 Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst      | 2 ++
 Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst       | 3 ++-
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
index 15f1900cd914..5d4d260db7b5 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
@@ -9,7 +9,9 @@
 V4L2_PIX_FMT_IPU3_SBGGR10 ('ip3b'), V4L2_PIX_FMT_IPU3_SGBRG10 ('ip3g'), V4L2_PIX_FMT_IPU3_SGRBG10 ('ip3G'), V4L2_PIX_FMT_IPU3_SRGGB10 ('ip3r')
 **********************************************************************************************************************************************
 
+====================
 10-bit Bayer formats
+====================
 
 Description
 ===========
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb14.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb14.rst
index 7e5d45f30cab..4f5120a6c678 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb14.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb14.rst
@@ -11,7 +11,9 @@ V4L2_PIX_FMT_SRGGB14 ('RG14'), V4L2_PIX_FMT_SGRBG14 ('GR14'), V4L2_PIX_FMT_SGBRG
 ***************************************************************************************************************************
 
 
+========================================
 14-bit Bayer formats expanded to 16 bits
+========================================
 
 
 Description
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst
index 93a210e22592..2f2f1ef430d9 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst
@@ -11,7 +11,9 @@ V4L2_PIX_FMT_SRGGB16 ('RG16'), V4L2_PIX_FMT_SGRBG16 ('GR16'), V4L2_PIX_FMT_SGBRG
 ***************************************************************************************************************************
 
 
+====================
 16-bit Bayer formats
+====================
 
 
 Description
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst
index 81e72f115994..02061c5a9778 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst
@@ -10,8 +10,9 @@ V4L2_PIX_FMT_SRGGB8 ('RGGB'), V4L2_PIX_FMT_SGRBG8 ('GRBG'), V4L2_PIX_FMT_SGBRG8
 ***************************************************************************************************************************
 
 
+===================
 8-bit Bayer formats
-
+===================
 
 Description
 ===========
-- 
2.29.2

