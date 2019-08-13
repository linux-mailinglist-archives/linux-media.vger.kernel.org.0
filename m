Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 844AF8B6E3
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfHMLbX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:31:23 -0400
Received: from mga18.intel.com ([134.134.136.126]:49279 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbfHMLbX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:31:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 04:31:22 -0700
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="183845822"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 04:31:21 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 247C720399;
        Tue, 13 Aug 2019 14:30:12 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1hxV0F-0000W8-AC; Tue, 13 Aug 2019 14:30:11 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 1/1] v4l: Documentation: Serial busses use parallel mbus codes
Date:   Tue, 13 Aug 2019 14:30:11 +0300
Message-Id: <20190813113011.1948-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the support for serial busses was introduced in V4L2, it was decided
to use the existing parallel bus media bus pixel codes to describe them.
While this was a practical choice at the time, it necessitates choosing
which one of the many parallel mbus pixel codes to use, for on the serial
busses these formats are effectively all equivalent.

The practice has always been to use the pixel code that describes a bus
that transfers a single sample per clock. Document this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/media/kapi/csi2.rst               | 7 +++++++
 Documentation/media/uapi/v4l/subdev-formats.rst | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/media/kapi/csi2.rst b/Documentation/media/kapi/csi2.rst
index a7e75e2eba85a..c67736a15c45b 100644
--- a/Documentation/media/kapi/csi2.rst
+++ b/Documentation/media/kapi/csi2.rst
@@ -72,3 +72,10 @@ the transmitter up by using the
 :c:type:`v4l2_subdev_core_ops`->s_power() callback. This may take
 place either indirectly by using :c:func:`v4l2_pipeline_pm_use` or
 directly.
+
+Formats
+-------
+
+The media bus pixel codes document parallel formats. Should the pixel data be
+transported over a serial bus, the media bus pixel code that describes a
+parallel format that transfers a sample on a single clock cycle is used.
diff --git a/Documentation/media/uapi/v4l/subdev-formats.rst b/Documentation/media/uapi/v4l/subdev-formats.rst
index ab1a48a5ae80b..d6b8b86a6daad 100644
--- a/Documentation/media/uapi/v4l/subdev-formats.rst
+++ b/Documentation/media/uapi/v4l/subdev-formats.rst
@@ -85,6 +85,10 @@ formats in memory (a raw Bayer image won't be magically converted to
 JPEG just by storing it to memory), there is no one-to-one
 correspondence between them.
 
+The media bus pixel codes document parallel formats. Should the pixel data be
+transported over a serial bus, the media bus pixel code that describes a
+parallel format that transfers a sample on a single clock cycle is used.
+
 
 Packed RGB Formats
 ^^^^^^^^^^^^^^^^^^
-- 
2.20.1

