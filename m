Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CB5300B3D
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 19:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbhAVS3p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 13:29:45 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55134 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729941AbhAVS2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 13:28:18 -0500
Received: from floko.floko.floko (unknown [IPv6:2804:214:8593:5236:d605:9367:f420:5eea])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 34F071F4668A;
        Fri, 22 Jan 2021 18:27:32 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: doc: pixfmt-yuv: Fix 4:4:4 subsampling info
Date:   Fri, 22 Jan 2021 15:27:23 -0300
Message-Id: <20210122182723.327438-1-helen.koike@collabora.com>
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
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 7d4d39201a3f..bcb4ef24c334 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -396,8 +396,8 @@ number of lines as the luma plane.
 NV24 and NV42
 -------------
 
-Semi-planar YUV 4:4:4 formats. The chroma plane is subsampled by 2 in the
-horizontal direction. Chroma lines contain half the number of pixels and the
+Semi-planar YUV 4:4:4 formats. No sub-sampling.
+Chroma lines contain the same number of pixels and the
 same number of bytes as luma lines, and the chroma plane contains the same
 number of lines as the luma plane.
 
-- 
2.30.0

