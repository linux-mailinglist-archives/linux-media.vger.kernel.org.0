Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1711F186F6A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 16:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731953AbgCPP4g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 11:56:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50212 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731672AbgCPP4f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 11:56:35 -0400
Received: from localhost.localdomain (p200300CB8701910060EECF5C40C0EC5A.dip0.t-ipconnect.de [IPv6:2003:cb:8701:9100:60ee:cf5c:40c0:ec5a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 295CD2941F3;
        Mon, 16 Mar 2020 15:56:34 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH] media: doc-rst: in the RGB formats table add '-' in undefined bits
Date:   Mon, 16 Mar 2020 16:56:26 +0100
Message-Id: <20200316155626.20272-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the table of the RGB formats, add an explicit '-' signs
to cells that contain undefined bits.
This makes it more clear how many bits and bytes are used
for each format.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 Documentation/media/uapi/v4l/pixfmt-rgb.rst | 136 ++++++++++----------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
index 4ce305cc45da..e4adac7f2e4c 100644
--- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
@@ -128,10 +128,10 @@ next to each other in memory.
       - b\ :sub:`1`
       - b\ :sub:`0`
 
-      -
-      -
-      -
-      -
+      - `-`
+      - `-`
+      - `-`
+      - `-`
       - r\ :sub:`3`
       - r\ :sub:`2`
       - r\ :sub:`1`
@@ -169,10 +169,10 @@ next to each other in memory.
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
-      -
-      -
-      -
-      -
+      - `-`
+      - `-`
+      - `-`
+      - `-`
 
       - r\ :sub:`3`
       - r\ :sub:`2`
@@ -220,10 +220,10 @@ next to each other in memory.
       - r\ :sub:`1`
       - r\ :sub:`0`
 
-      -
-      -
-      -
-      -
+      - `-`
+      - `-`
+      - `-`
+      - `-`
       - b\ :sub:`3`
       - b\ :sub:`2`
       - b\ :sub:`1`
@@ -261,10 +261,10 @@ next to each other in memory.
       - r\ :sub:`2`
       - r\ :sub:`1`
       - r\ :sub:`0`
-      -
-      -
-      -
-      -
+      - `-`
+      - `-`
+      - `-`
+      - `-`
 
       - b\ :sub:`3`
       - b\ :sub:`2`
@@ -312,7 +312,7 @@ next to each other in memory.
       - b\ :sub:`1`
       - b\ :sub:`0`
 
-      -
+      - `-`
       - r\ :sub:`4`
       - r\ :sub:`3`
       - r\ :sub:`2`
@@ -356,7 +356,7 @@ next to each other in memory.
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
-      -
+      - `-`
 
       - r\ :sub:`4`
       - r\ :sub:`3`
@@ -404,7 +404,7 @@ next to each other in memory.
       - r\ :sub:`1`
       - r\ :sub:`0`
 
-      -
+      - `-`
       - b\ :sub:`4`
       - b\ :sub:`3`
       - b\ :sub:`2`
@@ -448,7 +448,7 @@ next to each other in memory.
       - r\ :sub:`2`
       - r\ :sub:`1`
       - r\ :sub:`0`
-      -
+      - `-`
 
       - b\ :sub:`4`
       - b\ :sub:`3`
@@ -510,7 +510,7 @@ next to each other in memory.
       - ``V4L2_PIX_FMT_XRGB555X``
       - 'XR15' | (1 << 31)
 
-      -
+      - `-`
       - r\ :sub:`4`
       - r\ :sub:`3`
       - r\ :sub:`2`
@@ -640,21 +640,21 @@ next to each other in memory.
 
       - r\ :sub:`1`
       - r\ :sub:`0`
-      -
-      -
-      -
-      -
-      -
-      -
-
-      -
-      -
-      -
-      -
-      -
-      -
-      -
-      -
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
     * .. _V4L2-PIX-FMT-ABGR32:
 
       - ``V4L2_PIX_FMT_ABGR32``
@@ -727,14 +727,14 @@ next to each other in memory.
       - r\ :sub:`1`
       - r\ :sub:`0`
 
-      -
-      -
-      -
-      -
-      -
-      -
-      -
-      -
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
     * .. _V4L2-PIX-FMT-BGRA32:
 
       - ``V4L2_PIX_FMT_BGRA32``
@@ -780,14 +780,14 @@ next to each other in memory.
       - ``V4L2_PIX_FMT_BGRX32``
       - 'RX24'
 
-      -
-      -
-      -
-      -
-      -
-      -
-      -
-      -
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
 
       - b\ :sub:`7`
       - b\ :sub:`6`
@@ -887,14 +887,14 @@ next to each other in memory.
       - b\ :sub:`1`
       - b\ :sub:`0`
 
-      -
-      -
-      -
-      -
-      -
-      -
-      -
-      -
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
     * .. _V4L2-PIX-FMT-ARGB32:
 
       - ``V4L2_PIX_FMT_ARGB32``
@@ -940,14 +940,14 @@ next to each other in memory.
       - ``V4L2_PIX_FMT_XRGB32``
       - 'BX24'
 
-      -
-      -
-      -
-      -
-      -
-      -
-      -
-      -
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
+      - `-`
 
       - r\ :sub:`7`
       - r\ :sub:`6`
-- 
2.17.1

