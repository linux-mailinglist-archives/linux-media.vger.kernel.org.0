Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4D32D07D6
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgLFXEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgLFXEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:04:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE0FEC0613D1
        for <linux-media@vger.kernel.org>; Sun,  6 Dec 2020 15:04:11 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7835B5B0;
        Mon,  7 Dec 2020 00:03:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607295809;
        bh=vkY/myO+S7mFpjw+W9kVBGl6WZNeiv3si1pzUqi0KoM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ILVvxa3Ch4oKC/ICVBD05flcjVuzBBaDw8rSdi769XO+ySJXlhJb6AUtpsjXW5O20
         ZKJJrFgiSET3DGZWnoJFVraMohQEATQk7+4gVQLOFg8yOxzzOOjkR3Wrew2gYwPMGe
         J+S2WwXurMkxH+BbZGJE6CI+PJZIXRtA059LM7Ic=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v4 05/16] media: doc: pixfmt-rgb: Add title for deprecated formats
Date:   Mon,  7 Dec 2020 01:03:05 +0200
Message-Id: <20201206230316.1221-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206230316.1221-1-laurent.pinchart@ideasonboard.com>
References: <20201206230316.1221-1-laurent.pinchart@ideasonboard.com>
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

