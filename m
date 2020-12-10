Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450B42D58B3
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 11:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389246AbgLJK5d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:57:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:56386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389221AbgLJK5V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:57:21 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] media: ext-ctrls-jpeg.rst: cleanup V4L2_CID_JPEG_COMPRESSION_QUALITY text
Date:   Thu, 10 Dec 2020 11:55:47 +0100
Message-Id: <b24f9196a55475eb91be693e5be1b38032ce23cf.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607597287.git.mchehab+huawei@kernel.org>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The text is repeating the name of the control, which causes
it to be displayed outside the page with PDF output.

Besides that, this is the only JPEG control doing that. Removing
the name duplication doesn't affect the description, but, instead,
make it nicer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/v4l/ext-ctrls-jpeg.rst      | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst
index e07a2dbcd65d..60f9a09422d6 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst
@@ -64,13 +64,12 @@ JPEG Control IDs
 .. _jpeg-quality-control:
 
 ``V4L2_CID_JPEG_COMPRESSION_QUALITY (integer)``
-    ``V4L2_CID_JPEG_COMPRESSION_QUALITY`` control determines trade-off
-    between image quality and size. It provides simpler method for
-    applications to control image quality, without a need for direct
-    reconfiguration of luminance and chrominance quantization tables. In
-    cases where a driver uses quantization tables configured directly by
-    an application, using interfaces defined elsewhere,
-    ``V4L2_CID_JPEG_COMPRESSION_QUALITY`` control should be set by
+    Determines trade-off between image quality and size.
+    It provides simpler method for applications to control image quality,
+    without a need for direct reconfiguration of luminance and chrominance
+    quantization tables. In cases where a driver uses quantization tables
+    configured directly by an application, using interfaces defined
+    elsewhere, ``V4L2_CID_JPEG_COMPRESSION_QUALITY`` control should be set by
     driver to 0.
 
     The value range of this control is driver-specific. Only positive,
-- 
2.29.2

