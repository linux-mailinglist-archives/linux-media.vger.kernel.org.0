Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728B1332461
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 12:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhCILsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 06:48:25 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42429 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229881AbhCILsZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 06:48:25 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Jaqal7ZRVqY4WJaqdleDfJ; Tue, 09 Mar 2021 12:48:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615290503; bh=P0RjK0v7vBKlcRhGCH/RLccAJF1f5NfYz5kNg22+Wf0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qCxq4C3grm9XosjD0f+CToPdDlOHk17KnG/4y41Tnf4gtYMUtcHWqcsxwQcpk9k0a
         066VMzmBxin4pTpwpmRHXN3ieYK9CLF+XQXGY2edrGlZ+raU+0U7bRgCa2eT13uaoa
         KOvjPjXSRjWvVWV+mQAAu989ziJAV6eeAMF8lh8pxZXIJg85hEACfwsKdhlFx5wHV4
         rSeCCSrtaPQdLcMDnzSgMyHkWjxYgjtZ7IFERzJhrS5TD+dIdTRtx8Pt91xC6+Yk/v
         mLXBe7D/wAoqJgpSiPcPTUcJR/ajHwp9GkN7qgdobvFSrPi6Q6B+plQBstN6bbHKZ7
         yh6C6DG4CwtHA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: core headers: fix kernel-doc warnings
Message-ID: <b449c08d-0049-83ac-ee1c-5871a7f51015@xs4all.nl>
Date:   Tue, 9 Mar 2021 12:48:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBOb5f/IdIHcefUjQVx4IZHSJDs0WM7Jr6FS/ZNG+4cCYP/+KFRq9Fpzs/6AgB8WcExZVDJxAohoR71BPAX53bMhobz7SFUhYP47oOVRkzUxgdlz99NC
 zonGsMnR2lLva7T5DBnMxO8lAEW70YbiMhmr5KDKxOhfi+7qbst94w6m7KruvLsqH9rjhyjQjwATQqX9Tdodnlwsf/JrsPp3pWs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the following kernel-doc warnings:

include/uapi/linux/videodev2.h:996: warning: Function parameter or member 'm' not described in 'v4l2_plane'
include/uapi/linux/videodev2.h:996: warning: Function parameter or member 'reserved' not described in 'v4l2_plane'
include/uapi/linux/videodev2.h:1057: warning: Function parameter or member 'm' not described in 'v4l2_buffer'
include/uapi/linux/videodev2.h:1057: warning: Function parameter or member 'reserved2' not described in 'v4l2_buffer'
include/uapi/linux/videodev2.h:1057: warning: Function parameter or member 'reserved' not described in 'v4l2_buffer'
include/uapi/linux/videodev2.h:1068: warning: Function parameter or member 'tv' not described in 'v4l2_timeval_to_ns'
include/uapi/linux/videodev2.h:1068: warning: Excess function parameter 'ts' description in 'v4l2_timeval_to_ns'
include/uapi/linux/videodev2.h:1138: warning: Function parameter or member 'reserved' not described in 'v4l2_exportbuffer'
include/uapi/linux/videodev2.h:2237: warning: Function parameter or member 'reserved' not described in 'v4l2_plane_pix_format'
include/uapi/linux/videodev2.h:2270: warning: Function parameter or member 'hsv_enc' not described in 'v4l2_pix_format_mplane'
include/uapi/linux/videodev2.h:2270: warning: Function parameter or member 'reserved' not described in 'v4l2_pix_format_mplane'
include/uapi/linux/videodev2.h:2281: warning: Function parameter or member 'reserved' not described in 'v4l2_sdr_format'
include/uapi/linux/videodev2.h:2315: warning: Function parameter or member 'fmt' not described in 'v4l2_format'

include/uapi/linux/v4l2-subdev.h:53: warning: Function parameter or member 'reserved' not described in 'v4l2_subdev_format'
include/uapi/linux/v4l2-subdev.h:66: warning: Function parameter or member 'reserved' not described in 'v4l2_subdev_crop'
include/uapi/linux/v4l2-subdev.h:89: warning: Function parameter or member 'reserved' not described in 'v4l2_subdev_mbus_code_enum'
include/uapi/linux/v4l2-subdev.h:108: warning: Function parameter or member 'min_width' not described in 'v4l2_subdev_frame_size_enum'
include/uapi/linux/v4l2-subdev.h:108: warning: Function parameter or member 'max_width' not described in 'v4l2_subdev_frame_size_enum'
include/uapi/linux/v4l2-subdev.h:108: warning: Function parameter or member 'min_height' not described in 'v4l2_subdev_frame_size_enum'
include/uapi/linux/v4l2-subdev.h:108: warning: Function parameter or member 'max_height' not described in 'v4l2_subdev_frame_size_enum'
include/uapi/linux/v4l2-subdev.h:108: warning: Function parameter or member 'reserved' not described in 'v4l2_subdev_frame_size_enum'
include/uapi/linux/v4l2-subdev.h:119: warning: Function parameter or member 'reserved' not described in 'v4l2_subdev_frame_interval'
include/uapi/linux/v4l2-subdev.h:140: warning: Function parameter or member 'reserved' not described in 'v4l2_subdev_frame_interval_enum'

include/uapi/linux/cec.h:406: warning: Function parameter or member 'raw' not described in 'cec_connector_info'
include/uapi/linux/cec.h:470: warning: Function parameter or member 'flags' not described in 'cec_event'

include/media/v4l2-h264.h:82: warning: Function parameter or member 'reflist' not described in 'v4l2_h264_build_p_ref_list'
include/media/v4l2-h264.h:82: warning: expecting prototype for v4l2_h264_build_b_ref_lists(). Prototype was for v4l2_h264_build_p_ref_list()
instead

include/media/cec.h:50: warning: Function parameter or member 'lock' not described in 'cec_devnode'

include/media/v4l2-jpeg.h:122: warning: Function parameter or member 'num_dht' not described in 'v4l2_jpeg_header'
include/media/v4l2-jpeg.h:122: warning: Function parameter or member 'num_dqt' not described in 'v4l2_jpeg_header'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/media/cec.h b/include/media/cec.h
index cd35ae6b7560..208c9613c07e 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -28,8 +28,8 @@
  * @minor:	device node minor number
  * @registered:	the device was correctly registered
  * @unregistered: the device was unregistered
- * @fhs_lock:	lock to control access to the filehandle list
  * @fhs:	the list of open filehandles (cec_fh)
+ * @lock:	lock to control access to this structure
  *
  * This structure represents a cec-related device node.
  *
diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
index d2314f4d4490..4b1c71c935e0 100644
--- a/include/media/v4l2-h264.h
+++ b/include/media/v4l2-h264.h
@@ -66,11 +66,11 @@ v4l2_h264_build_b_ref_lists(const struct v4l2_h264_reflist_builder *builder,
 			    u8 *b0_reflist, u8 *b1_reflist);

 /**
- * v4l2_h264_build_b_ref_lists() - Build the P reference list
+ * v4l2_h264_build_p_ref_list() - Build the P reference list
  *
  * @builder: reference list builder context
- * @p_reflist: 16-bytes array used to store the P reference list. Each entry
- *	       is an index in the DPB
+ * @reflist: 16-bytes array used to store the P reference list. Each entry
+ *	     is an index in the DPB
  *
  * This functions builds the P reference lists. This procedure is describe in
  * section '8.2.4 Decoding process for reference picture lists construction'
diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
index ddba2a56c321..3a3344a97678 100644
--- a/include/media/v4l2-jpeg.h
+++ b/include/media/v4l2-jpeg.h
@@ -91,7 +91,9 @@ struct v4l2_jpeg_scan_header {
  * struct v4l2_jpeg_header - parsed JPEG header
  * @sof: pointer to frame header and size
  * @sos: pointer to scan header and size
+ * @num_dht: number of entries in @dht
  * @dht: pointers to huffman tables and sizes
+ * @num_dqt: number of entries in @dqt
  * @dqt: pointers to quantization tables and sizes
  * @frame: parsed frame header
  * @scan: pointer to parsed scan header, optional
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 7d1a06c52469..dc8879d179fd 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -396,6 +396,7 @@ struct cec_drm_connector_info {
  * associated with the CEC adapter.
  * @type: connector type (if any)
  * @drm: drm connector info
+ * @raw: array to pad the union
  */
 struct cec_connector_info {
 	__u32 type;
@@ -453,7 +454,7 @@ struct cec_event_lost_msgs {
  * struct cec_event - CEC event structure
  * @ts: the timestamp of when the event was sent.
  * @event: the event.
- * array.
+ * @flags: event flags.
  * @state_change: the event payload for CEC_EVENT_STATE_CHANGE.
  * @lost_msgs: the event payload for CEC_EVENT_LOST_MSGS.
  * @raw: array to pad the union.
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index a38454d9e0f5..658106f5b5dc 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -44,6 +44,7 @@ enum v4l2_subdev_format_whence {
  * @which: format type (from enum v4l2_subdev_format_whence)
  * @pad: pad number, as reported by the media API
  * @format: media bus format (format code and frame size)
+ * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_format {
 	__u32 which;
@@ -57,6 +58,7 @@ struct v4l2_subdev_format {
  * @which: format type (from enum v4l2_subdev_format_whence)
  * @pad: pad number, as reported by the media API
  * @rect: pad crop rectangle boundaries
+ * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_crop {
 	__u32 which;
@@ -78,6 +80,7 @@ struct v4l2_subdev_crop {
  * @code: format code (MEDIA_BUS_FMT_ definitions)
  * @which: format type (from enum v4l2_subdev_format_whence)
  * @flags: flags set by the driver, (V4L2_SUBDEV_MBUS_CODE_*)
+ * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_mbus_code_enum {
 	__u32 pad;
@@ -90,10 +93,15 @@ struct v4l2_subdev_mbus_code_enum {

 /**
  * struct v4l2_subdev_frame_size_enum - Media bus format enumeration
- * @pad: pad number, as reported by the media API
  * @index: format index during enumeration
+ * @pad: pad number, as reported by the media API
  * @code: format code (MEDIA_BUS_FMT_ definitions)
+ * @min_width: minimum frame width, in pixels
+ * @max_width: maximum frame width, in pixels
+ * @min_height: minimum frame height, in pixels
+ * @max_height: maximum frame height, in pixels
  * @which: format type (from enum v4l2_subdev_format_whence)
+ * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_frame_size_enum {
 	__u32 index;
@@ -111,6 +119,7 @@ struct v4l2_subdev_frame_size_enum {
  * struct v4l2_subdev_frame_interval - Pad-level frame rate
  * @pad: pad number, as reported by the media API
  * @interval: frame interval in seconds
+ * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_frame_interval {
 	__u32 pad;
@@ -127,6 +136,7 @@ struct v4l2_subdev_frame_interval {
  * @height: frame height in pixels
  * @interval: frame interval in seconds
  * @which: format type (from enum v4l2_subdev_format_whence)
+ * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_frame_interval_enum {
 	__u32 index;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 79dbde3bcf8d..1073da5411bb 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -975,8 +975,10 @@ struct v4l2_requestbuffers {
  *			pointing to this plane
  * @fd:			when memory is V4L2_MEMORY_DMABUF, a userspace file
  *			descriptor associated with this plane
+ * @m:			union of @mem_offset, @userptr and @fd
  * @data_offset:	offset in the plane to the start of data; usually 0,
  *			unless there is a header in front of the data
+ * @reserved:		drivers and applications must zero this array
  *
  * Multi-planar buffers consist of one or more planes, e.g. an YCbCr buffer
  * with two planes can have one plane for Y, and another for interleaved CbCr
@@ -1018,10 +1020,14 @@ struct v4l2_plane {
  *		a userspace file descriptor associated with this buffer
  * @planes:	for multiplanar buffers; userspace pointer to the array of plane
  *		info structs for this buffer
+ * @m:		union of @offset, @userptr, @planes and @fd
  * @length:	size in bytes of the buffer (NOT its payload) for single-plane
  *		buffers (when type != *_MPLANE); number of elements in the
  *		planes array for multi-plane buffers
+ * @reserved2:	drivers and applications must zero this field
  * @request_fd: fd of the request that this buffer should use
+ * @reserved:	for backwards compatibility with applications that do not know
+ *		about @request_fd
  *
  * Contains data exchanged by application and driver using one of the Streaming
  * I/O methods.
@@ -1059,7 +1065,7 @@ struct v4l2_buffer {
 #ifndef __KERNEL__
 /**
  * v4l2_timeval_to_ns - Convert timeval to nanoseconds
- * @ts:		pointer to the timeval variable to be converted
+ * @tv:		pointer to the timeval variable to be converted
  *
  * Returns the scalar nanosecond representation of the timeval
  * parameter.
@@ -1120,6 +1126,7 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
  * @flags:	flags for newly created file, currently only O_CLOEXEC is
  *		supported, refer to manual of open syscall for more details
  * @fd:		file descriptor associated with DMABUF (set by driver)
+ * @reserved:	drivers and applications must zero this array
  *
  * Contains data used for exporting a video buffer as DMABUF file descriptor.
  * The buffer is identified by a 'cookie' returned by VIDIOC_QUERYBUF
@@ -2229,6 +2236,7 @@ struct v4l2_mpeg_vbi_fmt_ivtv {
  *			this plane will be used
  * @bytesperline:	distance in bytes between the leftmost pixels in two
  *			adjacent lines
+ * @reserved:		drivers and applications must zero this array
  */
 struct v4l2_plane_pix_format {
 	__u32		sizeimage;
@@ -2247,8 +2255,10 @@ struct v4l2_plane_pix_format {
  * @num_planes:		number of planes for this format
  * @flags:		format flags (V4L2_PIX_FMT_FLAG_*)
  * @ycbcr_enc:		enum v4l2_ycbcr_encoding, Y'CbCr encoding
+ * @hsv_enc:		enum v4l2_hsv_encoding, HSV encoding
  * @quantization:	enum v4l2_quantization, colorspace quantization
  * @xfer_func:		enum v4l2_xfer_func, colorspace transfer function
+ * @reserved:		drivers and applications must zero this array
  */
 struct v4l2_pix_format_mplane {
 	__u32				width;
@@ -2273,6 +2283,7 @@ struct v4l2_pix_format_mplane {
  * struct v4l2_sdr_format - SDR format definition
  * @pixelformat:	little endian four character code (fourcc)
  * @buffersize:		maximum size in bytes required for data
+ * @reserved:		drivers and applications must zero this array
  */
 struct v4l2_sdr_format {
 	__u32				pixelformat;
@@ -2299,6 +2310,8 @@ struct v4l2_meta_format {
  * @vbi:	raw VBI capture or output parameters
  * @sliced:	sliced VBI capture or output parameters
  * @raw_data:	placeholder for future extensions and custom formats
+ * @fmt:	union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
+ *		and @raw_data
  */
 struct v4l2_format {
 	__u32	 type;

