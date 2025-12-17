Return-Path: <linux-media+bounces-49004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCACCC9184
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 18:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F2C530394AE
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 17:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D1A26C385;
	Wed, 17 Dec 2025 17:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o/F9uSrP"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EA71D619F;
	Wed, 17 Dec 2025 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765993316; cv=none; b=o2vygriAh6SuLq6eWLwe200i1hYOjvOKBpJlmiarng8hIuKLiM132xxw8vxYd0QNw8AF7b/5NBd2ZaC9lAVxQlzzTsSSa3dDAiAqnUJlD9zmQWyhp/xO+rxy9p0pJHeztpejIZHf5Su0fbNds3pPdUR0vHJ/Nu/uRrAsA+341Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765993316; c=relaxed/simple;
	bh=p+kuCGdXK/6j2iTBeIRSLPfGIialDQlPSZDcqO4rm2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bn0Ksd8xhUGiJU8TldoglYyz0h2RO6dOTvyo4bxzTv0c/sTRYfwJ8bChLpHuReTn/LAwTB5osSHjDhETnFaEk4/q2d4DTYKlwFiFH+itFwJasqN1BF7r1DnwS4u7aZXBzoA/TnkeJz4VIuPd1FvgTFvjtxw09pbadBNVgiIVrRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o/F9uSrP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765993307;
	bh=p+kuCGdXK/6j2iTBeIRSLPfGIialDQlPSZDcqO4rm2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o/F9uSrP7y72Da8aEE5K7fHSpjHAR1X31OgsA0cutLZEhVLQc5HP+Xy0x2q+sKHVX
	 o2awMu5KiwzLxWg5nHoWhHMahzjzgthRi3Kt9VCaz/RY/j0hteDgK/sK0mS1v3AvDR
	 TjLH1iaC3kDHhClNrslyVQIiN3N+0OK2QJDXaDXPLqdmrI37Tgjd5SESBHQPrpyeBe
	 N/+zYzk1wYIpLu96bZWFEWz/dXqt6w+FpixWojGyTEMKPH8RU9OL7uvp5bPMekM/hd
	 fdM1cFiyTQsP3dZlkko0QI/64ZLZBtTcT5SREP9ZMLBW8tuJQIOaUyHB2SsHn5vN8A
	 tH2YbYqh8iAWA==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C768117E1398;
	Wed, 17 Dec 2025 18:41:44 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v6 01/17] media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
Date: Wed, 17 Dec 2025 12:40:38 -0500
Message-ID: <20251217174059.1341784-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217174059.1341784-1-detlev.casanova@collabora.com>
References: <20251217174059.1341784-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hardware (e.g.: Rockchip's rk3588 hevc decoder) need to fully parse
the slice header, which cannot be passed with the current controls.
There is also no skip method similar as to what can be found in
verisilicon HW.

The SPS is therefore extended through these 2 new controls, providing the
long and short term reference information from the slice header for HEVC
decoding.

These now controls are similar as what is passed in the Vulkan Video API
with the StdVideoH265ShortTermRefPicSet and StdVideoH265LongTermRefPicsSps
structures embedded in the SPS struct.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 120 ++++++++++++++++++
 .../media/v4l/videodev2.h.rst.exceptions      |   2 +
 .../media/v4l/vidioc-queryctrl.rst            |  12 ++
 3 files changed, 134 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 497ae74379f6..3b1e05c6eb13 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -2959,6 +2959,126 @@ This structure contains all loop filter related parameters. See sections
       - 0x00000004
       -
 
+``V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS (struct)``
+    Subset of the :c:type:`v4l2_ctrl_hevc_sps` control.
+    It extends it with the list of Long-term reference sets parameters.
+    These parameters are defined according to :ref:`hevc`.
+    They are described in section 7.4.3.2.1 "General sequence parameter set
+    RBSP semantics" of the specification.
+    This control is a dynamically sized 1-dimensional array.
+    The values in the array should be ignored when either
+    num_long_term_ref_pics_sps is 0 or the
+    V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT flag is not set in
+    :c:type:`v4l2_ctrl_hevc_sps`.
+
+.. c:type:: v4l2_ctrl_hevc_ext_sps_lt_rps
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_lt_rps
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``lt_ref_pic_poc_lsb_sps``
+      - Long term reference picture order count as described in section 7.4.3.2.1
+        "General sequence parameter set RBSP semantics" of the specification.
+    * - __u16
+      - ``flags``
+      - See :ref:`Extended Long-Term RPS Flags <hevc_ext_sps_lt_rps_flags>`
+
+.. _hevc_ext_sps_lt_rps_flags:
+
+``Extended SPS Long-Term RPS Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT``
+      - 0x00000001
+      - Specifies if the long-term reference picture is used 7.4.3.2.1 "General sequence parameter
+        set RBSP semantics" of the specification.
+
+``V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS (struct)``
+    Subset of the :c:type:`v4l2_ctrl_hevc_sps` control.
+    It extends it with the list of Short-term reference sets parameters.
+    These parameters are defined according to :ref:`hevc`.
+    They are described in section 7.4.8 "Short-term reference picture set
+    semantics" of the specification.
+    This control is a dynamically sized 1-dimensional array.
+    The values in the array should be ignored when
+    num_short_term_ref_pic_sets is 0.
+
+.. c:type:: v4l2_ctrl_hevc_ext_sps_st_rps
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_st_rps
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``delta_idx_minus1``
+      - Specifies the delta compare to the index. See details in section 7.4.8 "Short-term
+        reference picture set semantics" of the specification.
+    * - __u8
+      - ``delta_rps_sign``
+      - Sign of the delta as specified in section 7.4.8 "Short-term reference picture set
+        semantics" of the specification.
+    * - __u8
+      - ``num_negative_pics``
+      - Number of short-term RPS entries that have picture order count values less than the
+        picture order count value of the current picture.
+    * - __u8
+      - ``num_positive_pics``
+      - Number of short-term RPS entries that have picture order count values greater than the
+        picture order count value of the current picture.
+    * - __u32
+      - ``used_by_curr_pic``
+      - Bit i specifies if short-term RPS i is used by the current picture.
+    * - __u32
+      - ``use_delta_flag``
+      - Bit i specifies if short-term RPS i is included in the short-term RPS entries.
+    * - __u16
+      - ``abs_delta_rps_minus1``
+      - Absolute delta RPS as specified in section 7.4.8 "Short-term reference picture set
+        semantics" of the specification.
+    * - __u16
+      - ``delta_poc_s0_minus1[16]``
+      - Specifies the negative picture order count delta for the i-th entry in the short-term RPS.
+        See details in section 7.4.8 "Short-term reference picture set semantics" of the
+        specification.
+    * - __u16
+      - ``delta_poc_s1_minus1[16]``
+      - Specifies the positive picture order count delta for the i-th entry in the short-term RPS.
+        See details in section 7.4.8 "Short-term reference picture set semantics" of the
+        specification.
+    * - __u16
+      - ``flags``
+      - See :ref:`Extended Short-Term RPS Flags <hevc_ext_sps_st_rps_flags>`
+
+.. _hevc_ext_sps_st_rps_flags:
+
+``Extended SPS Short-Term RPS Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED``
+      - 0x00000001
+      - Specifies if the short-term RPS is predicted from another short term RPS. See details in
+        section 7.4.8 "Short-term reference picture set semantics" of the specification.
+
 .. _v4l2-codec-stateless-av1:
 
 ``V4L2_CID_STATELESS_AV1_SEQUENCE (struct)``
diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index c41693115db6..6182b4e2d2ee 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -150,6 +150,8 @@ replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_PRED_WEIGHTS :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index c8baa9430c14..82c8b52e771c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -531,6 +531,18 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_hevc_decode_params`, containing HEVC
 	decoding parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_lt_rps`, containing HEVC
+	extended Long-Term RPS for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_st_rps`, containing HEVC
+	extended Short-Term RPS for stateless video decoders.
     * - ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR``
       - n/a
       - n/a
-- 
2.52.0


