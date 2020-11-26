Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A56B2C5544
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 14:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390012AbgKZN1c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 08:27:32 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:39721 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390005AbgKZN1c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 08:27:32 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id iHIrkPCQhN7XgiHJ4kYrYJ; Thu, 26 Nov 2020 14:27:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606397250; bh=umVGmAMS5xVVuV6te2/VUkV10EglMKeIiU/OYgQHDt4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Vwwadc/92PdwtVB6jz4LVHdz6qR1esQXRuG/2cgt1xtmydMm6NyKTQoBG/1RdHUf1
         WLjEw9Omlj3umdngXqneY2w9NAz0PXxK4C7dq+RgTMNYzyBrhPVNOfvn7gAZONFgf9
         zD51d87eAGJEEPDBs6/v8expA+Pi/w7zfIw2uXjpQlB3YFrugF3pvuKxNjGUlSQ6yj
         ziZnoSMf33uXFbE0UJkJINxaWq/zr/2AQ8+54qx3bzlxVhqx03NrdMTPXcDlVfMVFZ
         3PTBOLWY9nELQGuMLhLys6Bo2XiPogkRhKs5b/djHYh5nDjner8xjXcTnsQIyzFYEl
         R7Bo/KdrnE2PQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/6] vidioc-g-ext-ctrls.rst: add missing 'struct' before the types
Date:   Thu, 26 Nov 2020 14:27:16 +0100
Message-Id: <20201126132717.1216907-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
References: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfI2mYU/U22kBPRgdIV4rFhhBfw55xjWo5zsUQkgwONGtjwg1nWlRrYf/MrJQoHvJbLKYsi5QGNYkG+ulpk4vZ64bqHvJm7MQfqyIEhP5op/CaxfaPSEs
 KNhiDZ2GQWRALvY/1ucE59gxB3rcgcudHXJ9WYO+jp+tfOzfBX5GBC6qASCiqJdFYLNHnZKzmty7x6R9VW+xQzlEmc74ztHq6NXr6tHANX+rzhgD9OGuut+T
 jXcvYK25kfd7VwvryfEbgl0dbFQXVxeQJ3osXw4pNdw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add 'struct' to clarify that these are pointers to structs.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 726d6a97325f..5b1fc62ade0d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -180,31 +180,31 @@ still cause this situation.
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
-    * - :c:type:`v4l2_area` *
+    * - struct :c:type:`v4l2_area` *
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AREA``.
-    * - :c:type:`v4l2_ctrl_h264_sps` *
+    * - struct :c:type:`v4l2_ctrl_h264_sps` *
       - ``p_h264_sps``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_H264_SPS``.
-    * - :c:type:`v4l2_ctrl_h264_pps` *
+    * - struct :c:type:`v4l2_ctrl_h264_pps` *
       - ``p_h264_pps``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_pps`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_H264_PPS``.
-    * - :c:type:`v4l2_ctrl_h264_scaling_matrix` *
+    * - struct :c:type:`v4l2_ctrl_h264_scaling_matrix` *
       - ``p_h264_scaling_matrix``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_scaling_matrix`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_H264_SCALING_MATRIX``.
-    * - :c:type:`v4l2_ctrl_h264_pred_weights` *
+    * - struct :c:type:`v4l2_ctrl_h264_pred_weights` *
       - ``p_h264_pred_weights``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_pred_weights`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_H264_PRED_WEIGHTS``.
-    * - :c:type:`v4l2_ctrl_h264_slice_params` *
+    * - struct :c:type:`v4l2_ctrl_h264_slice_params` *
       - ``p_h264_slice_params``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_slice_params`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_H264_SLICE_PARAMS``.
-    * - :c:type:`v4l2_ctrl_h264_decode_params` *
+    * - struct :c:type:`v4l2_ctrl_h264_decode_params` *
       - ``p_h264_decode_params``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_decode_params`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_H264_DECODE_PARAMS``.
-- 
2.29.2

