Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23FE32D58D5
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389233AbgLJK5d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:57:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:56388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389224AbgLJK5V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:57:21 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] media: buffer.rst: fix a PDF output issue
Date:   Thu, 10 Dec 2020 11:55:49 +0100
Message-Id: <fbde561f4ee2157f882450c0b03254a73b113f42.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607597287.git.mchehab+huawei@kernel.org>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sphinx/LaTeX doesn't work well with literal blocks.
Due to that, V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF ends
being writing outside the table (and even outside the page).

We need to not only change the table size and font size, but
also to change the message, in order to avoid this bug.

So, improve the text a little bit, while ensuring that the
literal will be written at the beginning of the second line.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/buffer.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 1b0fdc160533..4194ebac2d6a 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -452,16 +452,16 @@ Buffer Flags
 
 .. raw:: latex
 
-    \small
+    \footnotesize
 
-.. tabularcolumns:: |p{7.0cm}|p{2.1cm}|p{8.4cm}|
+.. tabularcolumns:: |p{6.5cm}|p{1.8cm}|p{9.0cm}|
 
 .. cssclass:: longtable
 
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
-    :widths:       3 1 4
+    :widths:       65 18 70
 
     * .. _`V4L2-BUF-FLAG-MAPPED`:
 
@@ -585,7 +585,7 @@ Buffer Flags
 
       - ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF``
       - 0x00000200
-      - Only valid if ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` is
+      - Only valid if :c:type:`struct v4l2_requestbuffers` flag ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` is
 	set. It is typically used with stateless decoders where multiple
 	output buffers each decode to a slice of the decoded frame.
 	Applications can set this flag when queueing the output buffer
-- 
2.29.2

