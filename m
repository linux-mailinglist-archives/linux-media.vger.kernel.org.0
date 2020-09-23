Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A31C274F28
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgIWCoS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53034 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbgIWCoR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:17 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44B77124E;
        Wed, 23 Sep 2020 04:44:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829054;
        bh=XbDINcek9pFDJdruTnCLgUfbWU1vAM6GLAIBY7EMe74=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cln6uQe77N6vBsdrqD9eclPXZQYouaS0eebQ65nwSe+xlXvAohoG9+qDJRPs4x/Gi
         kqsG2qHo6iMTQmizzV9VEsybk4UjAIRpwLnAPz0NwZughLAzqJlxx5zQgu5Owm4RbV
         gHu3jZr/FQe539LCCFGRsu2W9aT5I0//XxJ5FPwA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 05/16] media: doc: pixfmt-rgb: Add title for deprecated formats
Date:   Wed, 23 Sep 2020 05:43:22 +0300
Message-Id: <20200923024333.920-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
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
index 231383c49e15..3208ec94db4c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -1007,12 +1007,14 @@ devices and drivers must ignore those bits, for both
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

