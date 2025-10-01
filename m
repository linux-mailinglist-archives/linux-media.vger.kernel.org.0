Return-Path: <linux-media+bounces-43492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39014BB0E05
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E441896C1B
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B40530F934;
	Wed,  1 Oct 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yj81TQF6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C593019DE;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=qOQGGv+VPkXxk8fioQEwNbDG6Kjy+MAqDV73WH82Nx4tCNeOtrkvOTrck8iITyJ+PKx2154z31qZS3GpfjOZE/WC/ANKFBuSdD3Du0v/LnJRAGMNkhniUV7Fpks7p0UNWx7iVoSkSkGHMjbfxqiNe+NG3vLbeG2kCpVMy8TWo84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=YNq1xYgFUw31uIou15okJA5ve0MNUWqz0G1RufqN5Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7fcb1v7S1Ry11rsXM+yA3k9//AUE5RUOjgpSJ1mLri7PpO3sU58/82T3eLJa6PetyLN4I9QqUoMb5bWC+7g0w8UQ2ebbDyw5GvEdTprxMPuTsLlI1nY3VHsBLWNFP05t4Kf17hVeRO3X4PfehvJyIUF4s/W3EJOmtKkS9I+xYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yj81TQF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4042EC4AF10;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=YNq1xYgFUw31uIou15okJA5ve0MNUWqz0G1RufqN5Ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yj81TQF6Dua6HVrsTVyh5U4Kkv2m3qvtmldkwj6H4lp95ZJ4d517lAyUXSHn6oxAZ
	 koG65XWyPOqZTqnSbJmdnQTPnadkhoiMmP88wI/K/6tZcpu4HlMKy8o7VaG8PIoDpv
	 ssgHXplWa1DQtQgtg4CZRXnBJbjjvarY3cO68kh9hMNyhkX69t4KLw/qvM1SB7YOBw
	 3//qqYtq+XJMdnOMlMD1X1xbRxahLM9PuxNzKN0Re2gzYVZ6lFGLEXKXpsfl+WNeUR
	 GHU66K8iKTR7c5fEm7ntesKWIieO6y2lhUaUFFMmtCzh7lKhJrI0yEzcuZNfEzxjO2
	 MEgYDZhkjW1Qw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIx-2DOh;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 15/23] docs: media: videodev2.h.rst.exceptions: fix namespace on refs
Date: Wed,  1 Oct 2025 16:49:38 +0200
Message-ID: <927f9c19d90b62ffda950cdac9bba23c2ca09f53.1759329363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759329363.git.mchehab+huawei@kernel.org>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Media uses V4L domain, but the replace rules are not considering
it.

Fix them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/v4l/videodev2.h.rst.exceptions      | 284 +++++++++---------
 1 file changed, 142 insertions(+), 142 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index 951d01bf7579..9bcb5ae6fbc4 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -20,155 +20,155 @@ ignore symbol V4L2_TUNER_DIGITAL_TV
 ignore symbol V4L2_COLORSPACE_BT878
 
 # Documented enum v4l2_field
-replace symbol V4L2_FIELD_ALTERNATE :c:type:`v4l2_field`
-replace symbol V4L2_FIELD_ANY :c:type:`v4l2_field`
-replace symbol V4L2_FIELD_BOTTOM :c:type:`v4l2_field`
-replace symbol V4L2_FIELD_INTERLACED :c:type:`v4l2_field`
-replace symbol V4L2_FIELD_INTERLACED_BT :c:type:`v4l2_field`
-replace symbol V4L2_FIELD_INTERLACED_TB :c:type:`v4l2_field`
-replace symbol V4L2_FIELD_NONE :c:type:`v4l2_field`
-replace symbol V4L2_FIELD_SEQ_BT :c:type:`v4l2_field`
-replace symbol V4L2_FIELD_SEQ_TB :c:type:`v4l2_field`
-replace symbol V4L2_FIELD_TOP :c:type:`v4l2_field`
+replace symbol V4L2_FIELD_ALTERNATE :c:type:`V4L.v4l2_field`
+replace symbol V4L2_FIELD_ANY :c:type:`V4L.v4l2_field`
+replace symbol V4L2_FIELD_BOTTOM :c:type:`V4L.v4l2_field`
+replace symbol V4L2_FIELD_INTERLACED :c:type:`V4L.v4l2_field`
+replace symbol V4L2_FIELD_INTERLACED_BT :c:type:`V4L.v4l2_field`
+replace symbol V4L2_FIELD_INTERLACED_TB :c:type:`V4L.v4l2_field`
+replace symbol V4L2_FIELD_NONE :c:type:`V4L.v4l2_field`
+replace symbol V4L2_FIELD_SEQ_BT :c:type:`V4L.v4l2_field`
+replace symbol V4L2_FIELD_SEQ_TB :c:type:`V4L.v4l2_field`
+replace symbol V4L2_FIELD_TOP :c:type:`V4L.v4l2_field`
 
 # Documented enum v4l2_buf_type
-replace symbol V4L2_BUF_TYPE_META_CAPTURE :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_META_OUTPUT :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_SDR_CAPTURE :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_SDR_OUTPUT :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_SLICED_VBI_CAPTURE :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_SLICED_VBI_OUTPUT :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_VBI_CAPTURE :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_VBI_OUTPUT :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_VIDEO_CAPTURE :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_VIDEO_OUTPUT :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY :c:type:`v4l2_buf_type`
-replace symbol V4L2_BUF_TYPE_VIDEO_OVERLAY :c:type:`v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_META_CAPTURE :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_META_OUTPUT :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_SDR_CAPTURE :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_SDR_OUTPUT :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_SLICED_VBI_CAPTURE :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_SLICED_VBI_OUTPUT :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_VBI_CAPTURE :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_VBI_OUTPUT :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_VIDEO_CAPTURE :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_VIDEO_OUTPUT :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY :c:type:`V4L.v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_VIDEO_OVERLAY :c:type:`V4L.v4l2_buf_type`
 
 # Documented enum v4l2_tuner_type
-replace symbol V4L2_TUNER_ANALOG_TV :c:type:`v4l2_tuner_type`
-replace symbol V4L2_TUNER_RADIO :c:type:`v4l2_tuner_type`
-replace symbol V4L2_TUNER_RF :c:type:`v4l2_tuner_type`
-replace symbol V4L2_TUNER_SDR :c:type:`v4l2_tuner_type`
+replace symbol V4L2_TUNER_ANALOG_TV :c:type:`V4L.v4l2_tuner_type`
+replace symbol V4L2_TUNER_RADIO :c:type:`V4L.v4l2_tuner_type`
+replace symbol V4L2_TUNER_RF :c:type:`V4L.v4l2_tuner_type`
+replace symbol V4L2_TUNER_SDR :c:type:`V4L.v4l2_tuner_type`
 
 # Documented enum v4l2_memory
-replace symbol V4L2_MEMORY_DMABUF :c:type:`v4l2_memory`
-replace symbol V4L2_MEMORY_MMAP :c:type:`v4l2_memory`
-replace symbol V4L2_MEMORY_OVERLAY :c:type:`v4l2_memory`
-replace symbol V4L2_MEMORY_USERPTR :c:type:`v4l2_memory`
+replace symbol V4L2_MEMORY_DMABUF :c:type:`V4L.v4l2_memory`
+replace symbol V4L2_MEMORY_MMAP :c:type:`V4L.v4l2_memory`
+replace symbol V4L2_MEMORY_OVERLAY :c:type:`V4L.v4l2_memory`
+replace symbol V4L2_MEMORY_USERPTR :c:type:`V4L.v4l2_memory`
 
 # Documented enum v4l2_colorspace
-replace symbol V4L2_COLORSPACE_470_SYSTEM_BG :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_470_SYSTEM_M :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_OPRGB :c:type:`v4l2_colorspace`
-replace define V4L2_COLORSPACE_ADOBERGB :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_BT2020 :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_DCI_P3 :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_DEFAULT :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_JPEG :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_RAW :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_REC709 :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_SMPTE170M :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_SMPTE240M :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_SRGB :c:type:`v4l2_colorspace`
-replace symbol V4L2_COLORSPACE_LAST :c:type:`v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_470_SYSTEM_BG :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_470_SYSTEM_M :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_OPRGB :c:type:`V4L.v4l2_colorspace`
+replace define V4L2_COLORSPACE_ADOBERGB :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_BT2020 :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_DCI_P3 :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_DEFAULT :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_JPEG :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_RAW :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_REC709 :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_SMPTE170M :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_SMPTE240M :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_SRGB :c:type:`V4L.v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_LAST :c:type:`V4L.v4l2_colorspace`
 
 # Documented enum v4l2_xfer_func
-replace symbol V4L2_XFER_FUNC_709 :c:type:`v4l2_xfer_func`
-replace symbol V4L2_XFER_FUNC_OPRGB :c:type:`v4l2_xfer_func`
-replace define V4L2_XFER_FUNC_ADOBERGB :c:type:`v4l2_xfer_func`
-replace symbol V4L2_XFER_FUNC_DCI_P3 :c:type:`v4l2_xfer_func`
-replace symbol V4L2_XFER_FUNC_DEFAULT :c:type:`v4l2_xfer_func`
-replace symbol V4L2_XFER_FUNC_NONE :c:type:`v4l2_xfer_func`
-replace symbol V4L2_XFER_FUNC_SMPTE2084 :c:type:`v4l2_xfer_func`
-replace symbol V4L2_XFER_FUNC_SMPTE240M :c:type:`v4l2_xfer_func`
-replace symbol V4L2_XFER_FUNC_SRGB :c:type:`v4l2_xfer_func`
-replace symbol V4L2_XFER_FUNC_LAST :c:type:`v4l2_xfer_func`
+replace symbol V4L2_XFER_FUNC_709 :c:type:`V4L.v4l2_xfer_func`
+replace symbol V4L2_XFER_FUNC_OPRGB :c:type:`V4L.v4l2_xfer_func`
+replace define V4L2_XFER_FUNC_ADOBERGB :c:type:`V4L.v4l2_xfer_func`
+replace symbol V4L2_XFER_FUNC_DCI_P3 :c:type:`V4L.v4l2_xfer_func`
+replace symbol V4L2_XFER_FUNC_DEFAULT :c:type:`V4L.v4l2_xfer_func`
+replace symbol V4L2_XFER_FUNC_NONE :c:type:`V4L.v4l2_xfer_func`
+replace symbol V4L2_XFER_FUNC_SMPTE2084 :c:type:`V4L.v4l2_xfer_func`
+replace symbol V4L2_XFER_FUNC_SMPTE240M :c:type:`V4L.v4l2_xfer_func`
+replace symbol V4L2_XFER_FUNC_SRGB :c:type:`V4L.v4l2_xfer_func`
+replace symbol V4L2_XFER_FUNC_LAST :c:type:`V4L.v4l2_xfer_func`
 
 # Documented enum v4l2_ycbcr_encoding
-replace symbol V4L2_YCBCR_ENC_601 :c:type:`v4l2_ycbcr_encoding`
-replace symbol V4L2_YCBCR_ENC_709 :c:type:`v4l2_ycbcr_encoding`
-replace symbol V4L2_YCBCR_ENC_BT2020 :c:type:`v4l2_ycbcr_encoding`
-replace symbol V4L2_YCBCR_ENC_BT2020_CONST_LUM :c:type:`v4l2_ycbcr_encoding`
-replace symbol V4L2_YCBCR_ENC_DEFAULT :c:type:`v4l2_ycbcr_encoding`
-replace symbol V4L2_YCBCR_ENC_SYCC :c:type:`v4l2_ycbcr_encoding`
-replace symbol V4L2_YCBCR_ENC_XV601 :c:type:`v4l2_ycbcr_encoding`
-replace symbol V4L2_YCBCR_ENC_XV709 :c:type:`v4l2_ycbcr_encoding`
-replace symbol V4L2_YCBCR_ENC_SMPTE240M :c:type:`v4l2_ycbcr_encoding`
-replace symbol V4L2_YCBCR_ENC_LAST :c:type:`v4l2_ycbcr_encoding`
+replace symbol V4L2_YCBCR_ENC_601 :c:type:`V4L.v4l2_ycbcr_encoding`
+replace symbol V4L2_YCBCR_ENC_709 :c:type:`V4L.v4l2_ycbcr_encoding`
+replace symbol V4L2_YCBCR_ENC_BT2020 :c:type:`V4L.v4l2_ycbcr_encoding`
+replace symbol V4L2_YCBCR_ENC_BT2020_CONST_LUM :c:type:`V4L.v4l2_ycbcr_encoding`
+replace symbol V4L2_YCBCR_ENC_DEFAULT :c:type:`V4L.v4l2_ycbcr_encoding`
+replace symbol V4L2_YCBCR_ENC_SYCC :c:type:`V4L.v4l2_ycbcr_encoding`
+replace symbol V4L2_YCBCR_ENC_XV601 :c:type:`V4L.v4l2_ycbcr_encoding`
+replace symbol V4L2_YCBCR_ENC_XV709 :c:type:`V4L.v4l2_ycbcr_encoding`
+replace symbol V4L2_YCBCR_ENC_SMPTE240M :c:type:`V4L.v4l2_ycbcr_encoding`
+replace symbol V4L2_YCBCR_ENC_LAST :c:type:`V4L.v4l2_ycbcr_encoding`
 
 # Documented enum v4l2_hsv_encoding
-replace symbol V4L2_HSV_ENC_180 :c:type:`v4l2_hsv_encoding`
-replace symbol V4L2_HSV_ENC_256 :c:type:`v4l2_hsv_encoding`
+replace symbol V4L2_HSV_ENC_180 :c:type:`V4L.v4l2_hsv_encoding`
+replace symbol V4L2_HSV_ENC_256 :c:type:`V4L.v4l2_hsv_encoding`
 
 # Documented enum v4l2_quantization
-replace symbol V4L2_QUANTIZATION_DEFAULT :c:type:`v4l2_quantization`
-replace symbol V4L2_QUANTIZATION_FULL_RANGE :c:type:`v4l2_quantization`
-replace symbol V4L2_QUANTIZATION_LIM_RANGE :c:type:`v4l2_quantization`
+replace symbol V4L2_QUANTIZATION_DEFAULT :c:type:`V4L.v4l2_quantization`
+replace symbol V4L2_QUANTIZATION_FULL_RANGE :c:type:`V4L.v4l2_quantization`
+replace symbol V4L2_QUANTIZATION_LIM_RANGE :c:type:`V4L.v4l2_quantization`
 
 # Documented enum v4l2_priority
-replace symbol V4L2_PRIORITY_BACKGROUND :c:type:`v4l2_priority`
-replace symbol V4L2_PRIORITY_DEFAULT :c:type:`v4l2_priority`
-replace symbol V4L2_PRIORITY_INTERACTIVE :c:type:`v4l2_priority`
-replace symbol V4L2_PRIORITY_RECORD :c:type:`v4l2_priority`
-replace symbol V4L2_PRIORITY_UNSET :c:type:`v4l2_priority`
+replace symbol V4L2_PRIORITY_BACKGROUND :c:type:`V4L.v4l2_priority`
+replace symbol V4L2_PRIORITY_DEFAULT :c:type:`V4L.v4l2_priority`
+replace symbol V4L2_PRIORITY_INTERACTIVE :c:type:`V4L.v4l2_priority`
+replace symbol V4L2_PRIORITY_RECORD :c:type:`V4L.v4l2_priority`
+replace symbol V4L2_PRIORITY_UNSET :c:type:`V4L.v4l2_priority`
 
 # Documented enum v4l2_frmsizetypes
-replace symbol V4L2_FRMSIZE_TYPE_CONTINUOUS :c:type:`v4l2_frmsizetypes`
-replace symbol V4L2_FRMSIZE_TYPE_DISCRETE :c:type:`v4l2_frmsizetypes`
-replace symbol V4L2_FRMSIZE_TYPE_STEPWISE :c:type:`v4l2_frmsizetypes`
+replace symbol V4L2_FRMSIZE_TYPE_CONTINUOUS :c:type:`V4L.v4l2_frmsizetypes`
+replace symbol V4L2_FRMSIZE_TYPE_DISCRETE :c:type:`V4L.v4l2_frmsizetypes`
+replace symbol V4L2_FRMSIZE_TYPE_STEPWISE :c:type:`V4L.v4l2_frmsizetypes`
 
 # Documented enum frmivaltypes
-replace symbol V4L2_FRMIVAL_TYPE_CONTINUOUS :c:type:`v4l2_frmivaltypes`
-replace symbol V4L2_FRMIVAL_TYPE_DISCRETE :c:type:`v4l2_frmivaltypes`
-replace symbol V4L2_FRMIVAL_TYPE_STEPWISE :c:type:`v4l2_frmivaltypes`
+replace symbol V4L2_FRMIVAL_TYPE_CONTINUOUS :c:type:`V4L.v4l2_frmivaltypes`
+replace symbol V4L2_FRMIVAL_TYPE_DISCRETE :c:type:`V4L.v4l2_frmivaltypes`
+replace symbol V4L2_FRMIVAL_TYPE_STEPWISE :c:type:`V4L.v4l2_frmivaltypes`
 
-# Documented enum :c:type:`v4l2_ctrl_type`
+# Documented enum :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_COMPOUND_TYPES vidioc_queryctrl
 
-replace symbol V4L2_CTRL_TYPE_BITMASK :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_BOOLEAN :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_BUTTON :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_CTRL_CLASS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_INTEGER :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_INTEGER64 :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_INTEGER_MENU :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_MENU :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_STRING :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_U16 :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_U32 :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_U8 :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_H264_SPS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_H264_PPS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_H264_PRED_WEIGHTS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_H264_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_VP9_FRAME :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_BITMASK :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_BOOLEAN :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_BUTTON :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_CTRL_CLASS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_INTEGER :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_INTEGER64 :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_INTEGER_MENU :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_MENU :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_H264_SPS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_H264_PPS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_H264_PRED_WEIGHTS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_H264_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AREA :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_RECT :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_VP9_FRAME :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`V4L.v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
@@ -204,10 +204,10 @@ replace define V4L2_CAP_IO_MC device-capabilities
 replace define V4L2_CAP_EDID device-capabilities
 
 # V4L2 pix flags
-replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
+replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`V4L.v4l2_pix_format`
 replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA format-flags
-replace define V4L2_PIX_FMT_HM12 :c:type:`v4l2_pix_format`
-replace define V4L2_PIX_FMT_SUNXI_TILED_NV12 :c:type:`v4l2_pix_format`
+replace define V4L2_PIX_FMT_HM12 :c:type:`V4L.v4l2_pix_format`
+replace define V4L2_PIX_FMT_SUNXI_TILED_NV12 :c:type:`V4L.v4l2_pix_format`
 
 # V4L2 format flags
 replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
@@ -266,7 +266,7 @@ replace define V4L2_FBUF_FLAG_SRC_CHROMAKEY framebuffer-flags
 # Used on VIDIOC_G_PARM
 
 replace define V4L2_MODE_HIGHQUALITY parm-flags
-replace define V4L2_CAP_TIMEPERFRAME :c:type:`v4l2_captureparm`
+replace define V4L2_CAP_TIMEPERFRAME :c:type:`V4L.v4l2_captureparm`
 
 # The V4L2_STD_foo are all defined at v4l2_std_id table
 
@@ -319,11 +319,11 @@ replace define V4L2_STD_ALL v4l2-std-id
 
 # V4L2 DT BT timings definitions
 
-replace define V4L2_DV_PROGRESSIVE :c:type:`v4l2_bt_timings`
-replace define V4L2_DV_INTERLACED :c:type:`v4l2_bt_timings`
+replace define V4L2_DV_PROGRESSIVE :c:type:`V4L.v4l2_bt_timings`
+replace define V4L2_DV_INTERLACED :c:type:`V4L.v4l2_bt_timings`
 
-replace define V4L2_DV_VSYNC_POS_POL :c:type:`v4l2_bt_timings`
-replace define V4L2_DV_HSYNC_POS_POL :c:type:`v4l2_bt_timings`
+replace define V4L2_DV_VSYNC_POS_POL :c:type:`V4L.v4l2_bt_timings`
+replace define V4L2_DV_HSYNC_POS_POL :c:type:`V4L.v4l2_bt_timings`
 
 replace define V4L2_DV_BT_STD_CEA861 dv-bt-standards
 replace define V4L2_DV_BT_STD_DMT dv-bt-standards
@@ -459,11 +459,11 @@ replace define V4L2_AUDMODE_AVL audio-mode
 
 # MPEG
 
-replace define V4L2_ENC_IDX_FRAME_I :c:type:`v4l2_enc_idx`
-replace define V4L2_ENC_IDX_FRAME_P :c:type:`v4l2_enc_idx`
-replace define V4L2_ENC_IDX_FRAME_B :c:type:`v4l2_enc_idx`
-replace define V4L2_ENC_IDX_FRAME_MASK :c:type:`v4l2_enc_idx`
-replace define V4L2_ENC_IDX_ENTRIES :c:type:`v4l2_enc_idx`
+replace define V4L2_ENC_IDX_FRAME_I :c:type:`V4L.v4l2_enc_idx`
+replace define V4L2_ENC_IDX_FRAME_P :c:type:`V4L.v4l2_enc_idx`
+replace define V4L2_ENC_IDX_FRAME_B :c:type:`V4L.v4l2_enc_idx`
+replace define V4L2_ENC_IDX_FRAME_MASK :c:type:`V4L.v4l2_enc_idx`
+replace define V4L2_ENC_IDX_ENTRIES :c:type:`V4L.v4l2_enc_idx`
 
 replace define V4L2_ENC_CMD_START encoder-cmds
 replace define V4L2_ENC_CMD_STOP encoder-cmds
@@ -491,10 +491,10 @@ replace define V4L2_DEC_START_FMT_GOP decoder-cmds
 replace define V4L2_VBI_UNSYNC vbifmt-flags
 replace define V4L2_VBI_INTERLACED vbifmt-flags
 
-replace define V4L2_VBI_ITU_525_F1_START :c:type:`v4l2_vbi_format`
-replace define V4L2_VBI_ITU_525_F2_START :c:type:`v4l2_vbi_format`
-replace define V4L2_VBI_ITU_625_F1_START :c:type:`v4l2_vbi_format`
-replace define V4L2_VBI_ITU_625_F2_START :c:type:`v4l2_vbi_format`
+replace define V4L2_VBI_ITU_525_F1_START :c:type:`V4L.v4l2_vbi_format`
+replace define V4L2_VBI_ITU_525_F2_START :c:type:`V4L.v4l2_vbi_format`
+replace define V4L2_VBI_ITU_625_F1_START :c:type:`V4L.v4l2_vbi_format`
+replace define V4L2_VBI_ITU_625_F2_START :c:type:`V4L.v4l2_vbi_format`
 
 
 replace define V4L2_SLICED_TELETEXT_B vbi-services
@@ -530,7 +530,7 @@ replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
 
 replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
 
-replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
+replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`V4L.v4l2_event_motion_det`
 
 replace define V4L2_EVENT_SUB_FL_SEND_INITIAL event-flags
 replace define V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK event-flags
-- 
2.51.0


