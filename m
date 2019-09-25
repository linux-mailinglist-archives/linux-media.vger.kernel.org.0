Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEE8EBE0E6
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 17:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438080AbfIYPJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 11:09:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58852 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfIYPJ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 11:09:59 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 1D8B228D571
From:   Helen Koike <helen.koike@collabora.com>
To:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Cc:     Helen Koike <helen.koike@collabora.com>
Subject: [PATCH] media: vidioc-queryctrl.rst: clarify combining READ_ONLY with WRITE_ONLY
Date:   Wed, 25 Sep 2019 12:09:45 -0300
Message-Id: <20190925150945.27706-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make it clear in the documentation that V4L2_CTRL_FLAG_READ_ONLY doesn't
conflict with V4L2_CTRL_FLAG_WRITE_ONLY. Also make it clear that
if both are combined then the control has read and write permissions.

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---
Hi,

v4l2-compliance expects both flags for read and write permissions, so I
would like to make it clear in the docs.
Please let me know if this is not the case.

Thanks
Helen
---
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
index a3d56ffbf4cc..1d3aecdf679f 100644
--- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
+++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
@@ -500,6 +500,11 @@ See also the examples in :ref:`control`.
       - 0x0004
       - This control is permanently readable only. Any attempt to change
 	the control will result in an ``EINVAL`` error code.
+
+	.. note::
+
+	   If combined with ``V4L2_CTRL_FLAG_WRITE_ONLY``, then both, read
+	   and write are allowed.
     * - ``V4L2_CTRL_FLAG_UPDATE``
       - 0x0008
       - A hint that changing this control may affect the value of other
@@ -523,6 +528,11 @@ See also the examples in :ref:`control`.
 	where writing a value will cause the device to carry out a given
 	action (e. g. motor control) but no meaningful value can be
 	returned.
+
+	.. note::
+
+	   If combined with ``V4L2_CTRL_FLAG_READ_ONLY``, then both, read
+	   and write are allowed.
     * - ``V4L2_CTRL_FLAG_VOLATILE``
       - 0x0080
       - This control is volatile, which means that the value of the
-- 
2.22.0

