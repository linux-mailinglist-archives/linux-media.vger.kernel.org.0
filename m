Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026DF2A36B0
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 23:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgKBWl6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 17:41:58 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42350 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgKBWl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 17:41:58 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C44BFD8;
        Mon,  2 Nov 2020 23:41:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604356916;
        bh=vkY/myO+S7mFpjw+W9kVBGl6WZNeiv3si1pzUqi0KoM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bwN/JEMzN1vUehL6EOmNcj4eYiMNpfpcSX9TX7tCj+71ADdqSO9EWAAM7oIwq+POR
         aFufvXmwD44dhzFwpSfBI8UEWFy4E19qFJypVIf9T6Ve0Xl38U+Q3thKsmQoirNfjW
         DJAT/WRmKZTJhInEhZw7SjK2MruLOXuFJH7Ozfeo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2 05/19] media: doc: pixfmt-rgb: Add title for deprecated formats
Date:   Tue,  3 Nov 2020 00:40:48 +0200
Message-Id: <20201102224102.30292-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve readability of the documentation by adding a section title for
the deprecated formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index 731bde23e055..5045895e85e1 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -1000,12 +1000,14 @@ devices and drivers must ignore those bits, for both
 :ref:`capture` and :ref:`output` devices.
 
 
+Deprecated RGB Formats
+======================
+
 Formats defined in :ref:`pixfmt-rgb-deprecated` are deprecated and
 must not be used by new drivers. They are documented here for reference.
 The meaning of their alpha bits ``(a)`` are ill-defined and interpreted as in
 either the corresponding ARGB or XRGB format, depending on the driver.
 
-
 .. raw:: latex
 
     \begingroup
-- 
Regards,

Laurent Pinchart

