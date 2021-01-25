Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2F1304858
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388686AbhAZFp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:45:26 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59352 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729286AbhAYOLy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 09:11:54 -0500
Received: from floko.floko.floko (unknown [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 09F2E1F452C0;
        Mon, 25 Jan 2021 14:10:37 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: doc: pixfmt-yuv: Fix 4:4:4 subsampling info
Date:   Mon, 25 Jan 2021 11:10:29 -0300
Message-Id: <20210125141029.16481-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

YUV 4:4:4 is not subsampled, fix this in the docs.

Fixes: da785536e007 ("media: doc: pixfmt-yuv: Move all semi-planar YUV formats to common file")
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---
Changes in v2:

- s/No sub-sampling/The chroma plane is not subsampled/ (Laurent)
- Fixed description regarding the number of bytes (Laurent)
---
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 7d4d39201a3f..1e0db602cc1b 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -396,9 +396,9 @@ number of lines as the luma plane.
 NV24 and NV42
 -------------
 
-Semi-planar YUV 4:4:4 formats. The chroma plane is subsampled by 2 in the
-horizontal direction. Chroma lines contain half the number of pixels and the
-same number of bytes as luma lines, and the chroma plane contains the same
+Semi-planar YUV 4:4:4 formats. The chroma plane is not subsampled.
+Chroma lines contain the same number of pixels and twice the
+number of bytes as luma lines, and the chroma plane contains the same
 number of lines as the luma plane.
 
 .. flat-table:: Sample 4x4 NV24 Image
-- 
2.30.0

