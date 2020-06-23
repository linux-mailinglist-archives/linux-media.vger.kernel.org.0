Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015D920503B
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 13:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732472AbgFWLOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 07:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732470AbgFWLOF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 07:14:05 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDBAC061755
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 04:14:05 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id m2so1412992pjv.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 04:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=93qrMd78Xlb+ZpNRVqpA5pnHaP4K8ZEsyCEYXWR4at4=;
        b=bzMBnQtxs9hr6omm79Ej+cx52yW/S1GwiL6CXWe718TK6hVHsPSz9BLqPh1yTjFRfa
         PCNUwqqvW0WxYx9IWyn0iBHFXZUrO1pMijt2SEuQN0D1hyv3iag4TARo/AFku6QQmjI7
         lyXdjmqEaah9b2+n0nmHrw+IfKohUZEntwTvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=93qrMd78Xlb+ZpNRVqpA5pnHaP4K8ZEsyCEYXWR4at4=;
        b=Gs0ELzW5ADMsOpneWP18ptYEUD3BrvbVrm8vq/F09oF6KjwXO+Nvdr8SYStcH6JkoB
         8sbE5b/acparAl3rmppz3aF+BXDJCmsPbL4GPQgxmaYoWxPejRFaBMOQyH2CU2X98O8A
         JAG/o3dwPVPyIIrZ/OG0GdG31Xiyy+oacrmbMKETIVRjTr8kl4aiG+EHMzy9qPYOqls+
         fTAMh+ECBwtsO47GkxHHpJixjyB09ZSFngL4Z+HJaZ5EQYl41SvVtmozAthoNCLY0wzf
         iWJsUgMFAH96MZHf5MB7tYmWrp4tNHgpMOULjNju/YjO8HL2rkK0gRMikLXEdiA/9CjU
         Srrg==
X-Gm-Message-State: AOAM533Sj5I5gEHOvpo6HLQsA7cdV4OQ2Igv8XQIqsDzjPhUY1Xw9Mby
        iKy54BKm30IaXFBRbWT13V8R1A==
X-Google-Smtp-Source: ABdhPJxLnxyE+fNB5U/jY3MyUpB9JFLXya0EBIlsS+QTQu0Id0WpAzqYam9nKCFU0Iae4NPYKkG5Rw==
X-Received: by 2002:a17:90a:a106:: with SMTP id s6mr24214932pjp.211.1592910844612;
        Tue, 23 Jun 2020 04:14:04 -0700 (PDT)
Received: from keiichiw1.tok.corp.google.com ([2401:fa00:8f:203:863a:e217:a16c:53f2])
        by smtp.gmail.com with ESMTPSA id i22sm16816053pfo.92.2020.06.23.04.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 04:14:03 -0700 (PDT)
From:   Keiichi Watanabe <keiichiw@chromium.org>
To:     virtio-dev@lists.oasis-open.org
Cc:     linux-media@vger.kernel.org, acourbot@chromium.org,
        alexlau@chromium.org, daniel@ffwll.ch, dgreid@chromium.org,
        dstaessens@chromium.org, dmitry.sepp@opensynergy.com,
        egranata@google.com, fziglio@redhat.com, hverkuil@xs4all.nl,
        keiichiw@chromium.org, kraxel@redhat.com, marcheu@chromium.org,
        posciak@chromium.org, spice-devel@lists.freedesktop.org,
        stevensd@chromium.org, tfiga@chromium.org, uril@redhat.com,
        samiullah.khawaja@opensynergy.com, kiran.pawar@opensynergy.com,
        saket.sinha89@gmail.com, laurent.pinchart@ideasonboard.com,
        nicolas@ndufresne.ca, mst@redhat.com
Subject: [PATCH RFC v4 1/1] virtio-video: Add virtio video device specification
Date:   Tue, 23 Jun 2020 20:13:25 +0900
Message-Id: <20200623111325.237158-2-keiichiw@chromium.org>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
In-Reply-To: <20200623111325.237158-1-keiichiw@chromium.org>
References: <20200623111325.237158-1-keiichiw@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The virtio video encoder and decoder devices are virtual devices that
support video encoding and decoding respectively. Despite being different
devices, they use the same protocol.

Signed-off-by: Dmitry Sepp <dmitry.sepp@opensynergy.com>
Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .gitignore                        |    1 +
 content.tex                       |    1 +
 images/video-buffer-lifecycle.dot |   18 +
 make-setup-generated.sh           |    8 +
 virtio-video.tex                  | 1163 +++++++++++++++++++++++++++++
 5 files changed, 1191 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 images/video-buffer-lifecycle.dot
 create mode 100644 virtio-video.tex

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..31272c2
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1 @@
+/images/generated/
diff --git a/content.tex b/content.tex
index 24dbf84..0bf3f1c 100644
--- a/content.tex
+++ b/content.tex
@@ -6074,6 +6074,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 \input{virtio-fs.tex}
 \input{virtio-rpmb.tex}
 \input{virtio-iommu.tex}
+\input{virtio-video.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/images/video-buffer-lifecycle.dot b/images/video-buffer-lifecycle.dot
new file mode 100644
index 0000000..98f379b
--- /dev/null
+++ b/images/video-buffer-lifecycle.dot
@@ -0,0 +1,18 @@
+digraph {
+  graph [ rankdir = LR, layout = dot ];
+
+  init [style = invis]
+  destroyed  [style = invis]
+  created [label="Created", shape=circle]
+  dequeued [label="Dequeued", shape=circle]
+  queued [label="Queued", shape=circle]
+
+  init -> created [label="RESOURCE_CREATE"]
+
+  created -> queued [label="RESOURCE_QUEUE is sent"]
+  dequeued -> queued [label="RESOURCE_QUEUE\n is sent"]
+  queued -> dequeued [label="RESOURCE_QUEUE\n has returned"]
+
+  created -> destroyed [label="RESOURCE_DESTROY_ALL"]
+  dequeued -> destroyed [label="RESOURCE_DESTROY_ALL"]
+}
diff --git a/make-setup-generated.sh b/make-setup-generated.sh
index f15d148..4caff72 100755
--- a/make-setup-generated.sh
+++ b/make-setup-generated.sh
@@ -61,3 +61,11 @@ cat > setup-generated.tex <<EOF
 \newcommand{\virtiodraftstagename}{$STAGENAME}
 \newcommand{\virtiodraftoasisstagename}{$OASISSTAGENAME}
 EOF
+
+# Generate PNG from DOT
+mkdir -p images/generated
+for file in images/*.dot
+do
+    BASENAME=`basename "$file" .dot`
+    dot -Tpng -o images/generated/${BASENAME}.png ${file}
+done
diff --git a/virtio-video.tex b/virtio-video.tex
new file mode 100644
index 0000000..a57e180
--- /dev/null
+++ b/virtio-video.tex
@@ -0,0 +1,1163 @@
+\section{Video Device}\label{sec:Device Types / Video Device}
+
+The virtio video encoder and decoder devices are virtual devices that support
+video encoding and decoding respectively. Despite being different devices, they
+use the same protocol.
+
+\subsection{Device ID}
+\label{sec:Device Types / Video Device / Device ID}
+
+\begin{description}
+\item[30] encoder device
+\item[31] decoder device
+\end{description}
+
+\subsection{Virtqueues}
+\label{sec:Device Types / Video Device / Virtqueues}
+
+\begin{description}
+\item[0] commandq - queue for driver commands and device responses to these
+  commands.
+\item[1] eventq - queue for events sent by the device to the driver.
+\end{description}
+
+\subsection{Feature bits}
+\label{sec:Device Types / Video Device / Feature bits}
+
+\begin{description}
+\item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (0)] Guest pages can be used for video
+  buffers.
+\item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (1)] The device can use
+  non-contiguous memory for video buffers. Without this flag, the
+  driver and device MUST use video buffers that are contiguous for the device.
+\item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (2)] Objects exported by
+  another virtio device can be used as video buffers.
+\end{description}
+
+\devicenormative{\subsubsection}{Feature bits}{Device Types / Video
+  Device / Feature bits}
+
+The device MUST present at least one of VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES or
+VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT.
+
+\subsection{Device configuration layout}
+\label{sec:Device Types / Video Device / Device configuration layout}
+
+Video device configuration uses the following layout structure:
+
+\begin{lstlisting}
+struct virtio_video_config {
+        le32 version;
+        le32 caps_length;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{version}] is the protocol version that the device understands. The
+  device MUST set this to 0.
+\item[\field{caps_length}] is the length of a device-writable descriptor
+  required to call VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS in bytes. The device MUST
+  set this value.
+\end{description}
+
+\subsection{Supported formats}
+
+\subsubsection{Supported image formats}
+
+The following image formats are defined:
+\begin{lstlisting}
+enum virtio_video_image_format {
+        /* Raw formats */
+        VIRTIO_VIDEO_IMAGE_FORMAT_ARGB8888 = 1,
+        VIRTIO_VIDEO_IMAGE_FORMAT_BGRA8888,
+        VIRTIO_VIDEO_IMAGE_FORMAT_NV12,   /* 12  Y/CbCr 4:2:0  */
+        VIRTIO_VIDEO_IMAGE_FORMAT_YUV420, /* 12  YUV 4:2:0     */
+        VIRTIO_VIDEO_IMAGE_FORMAT_YVU420, /* 12  YVU 4:2:0     */
+};
+\end{lstlisting}
+
+\subsubsection{Supported bitstream formats}
+
+The following bitstream formats are defined:
+\begin{lstlisting}
+enum virtio_video_codec {
+        VIRTIO_VIDEO_CODEC_MPEG2 = 1, /* MPEG-2 Part 2 */
+        VIRTIO_VIDEO_CODEC_MPEG4,     /* MPEG-4 Part 2 */
+        VIRTIO_VIDEO_CODEC_H264,      /* H.264 */
+        VIRTIO_VIDEO_CODEC_HEVC,      /* HEVC aka H.265*/
+        VIRTIO_VIDEO_CODEC_VP8,       /* VP8 */
+        VIRTIO_VIDEO_CODEC_VP9,       /* VP9 */
+};
+
+union virtio_video_codec_params {
+        struct virtio_video_codec_h264 h264;
+        struct virtio_video_codec_hevc hevc;
+        struct virtio_video_codec_vp8 vp8;
+        struct virtio_video_codec_vp9 vp9;
+}
+
+struct virtio_video_bitstream_format {
+        le32 virtio_video_codec codec; /* VIRTIO_VIDEO_CODEC_* */
+        union virtio_video_codec_params params;
+};
+\end{lstlisting}
+
+The field \field{params} in \field{struct virtio_video_bitstream_format} is
+valid only when \field{codec} designates a value which has a corresponding field
+in \field{union virtio_video_codec_params}.
+
+The fields in \field{union virtio_video_codec_params} are defined below.
+
+\paragraph{H.264}
+
+When the field \field{codec} in \field{struct virtio_video_bitstream_format}
+is set to VIRTIO_VIDEO_CODEC_H264, \field{params.h264} MUST be set to a
+valid value defined as follows:
+
+\begin{lstlisting}
+enum virtio_video_codec_h264_profile {
+        VIRTIO_VIDEO_CODEC_H264_PROFILE_BASELINE = 1,
+        VIRTIO_VIDEO_CODEC_H264_PROFILE_MAIN,
+        VIRTIO_VIDEO_CODEC_H264_PROFILE_EXTENDED,
+        VIRTIO_VIDEO_CODEC_H264_PROFILE_HIGH,
+        VIRTIO_VIDEO_CODEC_H264_PROFILE_HIGH10PROFILE,
+        VIRTIO_VIDEO_CODEC_H264_PROFILE_HIGH422PROFILE,
+        VIRTIO_VIDEO_CODEC_H264_PROFILE_HIGH444PREDICTIVEPROFILE,
+        VIRTIO_VIDEO_CODEC_H264_PROFILE_SCALABLEBASELINE,
+        VIRTIO_VIDEO_CODEC_H264_PROFILE_SCALABLEHIGH,
+        VIRTIO_VIDEO_CODEC_H264_PROFILE_STEREOHIGH,
+        VIRTIO_VIDEO_CODEC_H264_PROFILE_MULTIVIEWHIGH,
+};
+
+enum virtio_video_codec_h264_level {
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_1_0 = 1,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_1_1,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_1_2,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_1_3,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_2_0,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_2_1,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_2_2,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_3_0,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_3_1,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_3_2,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_4_0,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_4_1,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_4_2,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_5_0,
+        VIRTIO_VIDEO_CODEC_H264_LEVEL_5_1,
+};
+
+struct virtio_video_codec_h264 {
+        le32 profile; /* VIRTIO_VIDEO_CODEC_H264_PROFILE_* */
+        le32 level;   /* VIRTIO_VIDEO_CODEC_H264_LEVEL_* */
+};
+\end{lstlisting}
+
+\paragraph{HEVC}
+
+When the field \field{codec} in \field{struct virtio_video_bitstream_format}
+is set to VIRTIO_VIDEO_CODEC_HEVC, \field{params.hevc} MUST be set to a
+valid value defined as follows:
+
+\begin{lstlisting}
+enum virtio_video_codec_hevc_profile {
+        VIRTIO_VIDEO_CODEC_HEVC_PROFILE_MAIN = 1,
+        VIRTIO_VIDEO_CODEC_HEVC_PROFILE_MAIN10,
+        VIRTIO_VIDEO_CODEC_HEVC_PROFILE_MAIN_STILL_PICTURE,
+};
+
+struct virtio_video_codec_hevc {
+        le32 profile; /* VIRTIO_VIDEO_CODEC_HEVC_PROFILE_* */
+};
+\end{lstlisting}
+
+\paragraph{VP8}
+
+When the field \field{codec} in \field{struct virtio_video_bitstream_format}
+is set to VIRTIO_VIDEO_CODEC_VP8, \field{params.vp8} MUST be set to a
+valid value defined as follows:
+
+\begin{lstlisting}
+enum virtio_video_codec_vp8_profile {
+        VIRTIO_VIDEO_CODEC_VP8_PROFILE_0 = 1,
+        VIRTIO_VIDEO_CODEC_VP8_PROFILE_1,
+        VIRTIO_VIDEO_CODEC_VP8_PROFILE_2,
+        VIRTIO_VIDEO_CODEC_VP8_PROFILE_3,
+};
+
+struct virtio_video_codec_vp8 {
+        le32 profile;/* VIRTIO_VIDEO_CODEC_VP8_PROFILE_* */
+};
+\end{lstlisting}
+
+\paragraph{VP9}
+
+When the field \field{codec} in \field{struct virtio_video_bitstream_format}
+is set to VIRTIO_VIDEO_CODEC_VP9, \field{params.vp9} MUST be set to a
+valid value defined as follows:
+
+\begin{lstlisting}
+enum virtio_video_codec_vp9_profile {
+        VIRTIO_VIDEO_CODEC_VP9_PROFILE_0 = 1,
+        VIRTIO_VIDEO_CODEC_VP9_PROFILE_1,
+        VIRTIO_VIDEO_CODEC_VP9_PROFILE_2,
+        VIRTIO_VIDEO_CODEC_VP9_PROFILE_3,
+};
+
+struct virtio_video_codec_vp9 {
+        le32 profile;/* VIRTIO_VIDEO_CODEC_VP9_PROFILE_* */
+};
+\end{lstlisting}
+
+\subsection{Device Initialization}
+\label{sec:Device Types / Video Device / Device Initialization}
+
+\devicenormative{\subsubsection}{Device Initialization}{Device Types /
+  Video Device / Device Initialization}
+
+The driver SHOULD query device capability by using the
+VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS and use that information for the
+initial setup.
+
+\subsection{Device Operation}
+\label{sec:Device Types / Video Device / Device Operation}
+
+After initializing the device and setting the desired parameters,
+the driver allocates input and output buffers and queues them
+to the device. The device then performs the requested operation on the buffers.
+
+\subsubsection{Command Virtqueue}
+
+The command virtqueue is used to send commands and their responses. Commands
+MUST be written by the driver and their responses MUST be written by the device
+in the next device-writable descriptor.
+
+Different structure layouts are used for each command and response. Every
+command structure starts with a field storing a variant of \field{enum
+  virtio_video_cmd_type} defined as follows:
+\begin{lstlisting}
+enum virtio_video_cmd_type {
+        /* Global */
+        VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS = 0x0100,
+
+        /* Stream */
+        VIRTIO_VIDEO_CMD_STREAM_CREATE = 0x0200,
+        VIRTIO_VIDEO_CMD_STREAM_DESTROY,
+        VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS,
+        VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS,
+        VIRTIO_VIDEO_CMD_STREAM_DRAIN,
+
+        /* Queue */
+        VIRTIO_VIDEO_CMD_QUEUE_CLEAR = 0x300,
+        VIRTIO_VIDEO_CMD_QUEUE_DETACH_RESOURCES,
+
+        /* Resource*/
+        VIRTIO_VIDEO_CMD_RESOURCE_ATTACH = 0x400,
+        VIRTIO_VIDEO_CMD_RESOURCE_QUEUE,
+};
+\end{lstlisting}
+
+Each response structure starts with a field storing a variant of
+\field{enum virtio_video_result} defined as follows:
+\begin{lstlisting}
+enum virtio_video_result {
+         /* Success */
+         VIRTIO_VIDEO_RESULT_OK = 0x000,
+
+         /* Error */
+         VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION = 0x0100,
+         VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID,
+         VIRTIO_VIDEO_RESULT_ERR_INVALID_RESOURCE_ID,
+         VIRTIO_VIDEO_RESULT_ERR_INVALID_PARAMETER,
+         VIRTIO_VIDEO_RESULT_ERR_CANCELED,
+         VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY,
+};
+\end{lstlisting}
+
+\paragraph{Query device capability}
+
+\begin{description}
+\item[VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS] Retrieve information about device
+  capabilities.
+
+The driver sends this command with \field{struct
+  virtio_video_device_query_caps}.
+\begin{lstlisting}
+struct virtio_video_device_query_caps {
+        le32 cmd_type;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be set to VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
+\end{description}
+
+The device responds with \field{struct virtio_video_device_query_caps_resp}.
+\begin{lstlisting}
+struct virtio_video_device_query_caps_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+        le32 num_image_formats;
+        le32 num_bitstream_formats;
+        /**
+         * Followed by
+         * struct virtio_video_image_format_desc image_formats[num_image_formats];
+         */
+        /**
+         * Followed by
+         * struct virtio_video_bitstream_format_desc bitstream_formats[num_bitstream_formats];
+         */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] MUST be set to one of variants of \field{enum
+    virtio_video_result}.
+\item[\field{num_image_formats}] is the number of supported image formats. If
+  \field{result} is not VIRTIO_VIDEO_RESULT_OK, the device MUST set this to 0.
+\item[\field{num_bitstream_formats}] is the number of supported bitstream
+  formats. If \field{result} is not VIRTIO_VIDEO_RESULT_OK, the device MUST set
+  this to 0.
+\end{description}
+
+The device MUST write two arrays of \field{struct
+  virtio_video_image_format_desc} and \field{struct
+  virtio_video_image_format_desc} following the \field{struct
+  virtio_video_device_query_caps_resp}. The lengths of these arrays MUST be
+\field{num_image_formats} and \field{num_bitstream_formats} respectively.
+\subparagraph{Image format description}
+
+The image format description \field{virtio_video_image_format_desc} is defined
+as follows:
+\begin{lstlisting}
+enum virtio_video_planes_layout {
+        VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER = 0,
+        VIRTIO_VIDEO_PLANES_LAYOUT_PER_PLANE,
+};
+
+struct virtio_video_image_format_desc {
+         le32 format; /* VIRTIO_VIDEO_CMD_IMAGE_FORMAT_* */
+         le32 planes_layouts; /* Bitmask with VIRTIO_VIDEO_PLANES_LAYOUT_* */
+         le32 plane_align;
+         le32 num_frames;
+         /**
+          * Followed by
+          * struct virtio_video_image_format_frame frames[num_frames];
+          */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{format}] specifies an image format. The device MUST set
+  one of the variants of \field{enum virtio_video_image_format}.
+\item[\field{planes_layouts}] is a bitmask representing the set of plane layout
+  types that the device supports.
+  \begin{description}
+  \item[\field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER}] The device expects
+    the planes of a frame to be laid out one after another in the same buffer.
+  \item[\field{VIRTIO_VIDEO_PLANES_LAYOUT_PER_PLANE}] The device expects the
+    planes of a frame to be located in separate buffers.
+  \end{description}
+\item[\field{plane_align}] is the plane alignment the device requires when
+  multiple planes are located in the same buffer. This field is valid only if
+  \field{planes_layouts} has the \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER}
+  bit, and MUST be set to zero otherwise.
+\item[\field{num_frames}] is the number of \field{virtio_video_format_frame}
+  that follow.
+\end{description}
+
+The frame information \field{virtio_video_format_frame} is defined as follows:
+\begin{lstlisting}
+struct virtio_video_image_format_range {
+       le32 min;
+       le32 max;
+       le32 step;
+};
+
+struct virtio_video_image_format_frame {
+       struct virtio_video_image_format_range width;
+       struct virtio_video_image_format_range height;
+       le32 num_rates;
+       /**
+        * Followed by
+        * struct virtio_video_image_format_range frame_rates[num_rates];
+        */
+};
+\end{lstlisting}
+
+The value of \field{struct virtio_video_image_format_range} is used to represent
+the range of values supported by the device. The device MUST set \field{step} to
+a positive integer. An integer \(x\) is in a range \field{struct
+  virtio_video_image_format_range r} if \(\field{r.min} \le x \le
+\field{r.max}\) holds and \(x\) is equals to \((\field{min} + \field{step} *
+n)\) for some integer \(n\).
+
+\begin{description}
+\item[\field{width}] represents the range of widths supported by the device.
+\item[\field{height}] represents the range of heights supported by the device.
+\item[\field{num_rates}] is the length of the \field{frame_rates[]} array.
+\item[\field{frame_rates}] is the set of frame rates ranges supported
+  by the device.
+\end{description}
+
+\subparagraph{Bitstream format description}
+
+The bitstream format description \field{virtio_video_bitstream_format_desc} is
+defined as follows:
+\begin{lstlisting}
+struct virtio_video_bitstream_format_desc {
+        le32 virtio_video_codec codec;
+        le32 num_variants;
+        /**
+         * Followed by
+         * union virtio_video_codec_params variants[num_variants];
+         */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{codec}] specifies a codec. This field MUST be set to one of the
+  variants of \field{enum virtio_video_codec}.
+\item[\field{num_variants}] is the number of \field{union virtio_video_codec_params}
+  values that follow. If \field{union virtio_video_codec_params} has a field
+  corresponding to the specified \field{codec}, this value MUST be a positive
+  integer. Otherwise, it MUST be 0.
+\item[\field{variants}] is a list of supported variants of the given
+  \field{codec}. Only the field corresponding to the given \field{codec} MUST be
+  valid in each element.
+\end{description}
+\end{description}
+
+\devicenormative{\subparagraph}{Query device capability}{Device Types / Video
+  Device / Device Operation / Device Operation: Query device capability}
+
+The total size of the device response MUST be equals to \field{caps_length}
+bytes, as reported by the device configuration.
+
+\paragraph{Per stream operations}
+
+\begin{description}
+\item[VIRTIO_VIDEO_CMD_STREAM_CREATE] Create a video stream using the device.
+
+The driver sends this command with \field{struct virtio_video_stream_create}.
+\begin{lstlisting}
+enum virtio_video_mem_type {
+       VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES = 1,
+       VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT,
+};
+
+struct virtio_video_stream_create {
+        le32 cmd_type;
+        le32 in_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
+        le32 out_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
+        le32 codec; /* One of VIRTIO_VIDEO_CODEC_* types */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be set to VIRTIO_VIDEO_CMD_STREAM_CREATE.
+\item[\field{in_mem_type, out_mem_type}] is the type of buffer management for
+  input/output buffers. The driver MUST set a value in \field{enum
+    virtio_video_mem_type} for which the device reported a corresponding feature
+  bit.
+\begin{description}
+\item[\field{VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES}] Use guest pages. The driver
+  MUST not set this value if the feature bit VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES
+  is not set.
+\item[\field{VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT}] Use object exported by
+  another virtio device. The driver MUST not set this value if the feature bit
+  VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT is not set.
+\end{description}
+\item[\field{codec}] is the video codec that will be used with this stream. The
+  driver MUST set it to one of the variants of \field{enum virtio_video_codec}.
+\end{description}
+
+The device responds with \field{struct virtio_video_stream_create_resp}:
+\begin{lstlisting}
+struct virtio_video_stream_create_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+        le32 stream_id;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] MUST be set to one of the variants of \field{enum
+    virtio_video_result}.
+\item[\field{stream_id}] is the ID of the created stream, allocated by the
+  device. It is only valid if \field{result} is VIRTIO_VIDEO_RESULT_OK.
+\end{description}
+
+\item[VIRTIO_VIDEO_CMD_STREAM_DESTROY] Destroy a video stream.
+
+The driver sends this command with \field{struct virtio_video_stream_destroy}.
+\begin{lstlisting}
+struct virtio_video_stream_destroy {
+         le32 cmd_type;
+         le32 stream_id;
+};
+\end{lstlisting}
+\begin{description}
+\item{\field{cmd_type}} MUST be set to VIRTIO_VIDEO_CMD_STREAM_DESTROY.
+\item{\field{stream_id}} is the ID of the stream to be destroyed. It must be set
+to the value of an existing stream.
+\end{description}
+
+The device responds with \field{struct virtio_video_stream_destroy_resp}.
+\begin{lstlisting}
+struct virtio_video_stream_destroy_resp {
+         le32 result; /* VIRTIO_VIDEO_RESULT_* */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] MUST be set to one of the variants of \field{enum
+    virtio_video_result}.
+\end{description}
+
+\item[VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS] Get the current stream parameters.
+
+The driver sends this command with \field{struct
+  virtio_video_stream_get_params}.
+\begin{lstlisting}
+struct virtio_video_stream_get_params {
+    le32 cmd_type;
+    le32 stream_id;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be set to VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS.
+\item[\field{stream_id}] MUST be set to the ID of an existing stream, whose
+  parameters will be returned.
+\end{description}
+
+The device responds with \field{struct virtio_video_stream_get_params_resp}.
+\begin{lstlisting}
+struct virtio_video_stream_get_params_resp {
+    le32 result; /* VIRTIO_VIDEO_RESULT_* */
+    struct virtio_video_params params;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] MUST be set to one of variants of \field{enum
+    virtio_video_result}.
+\item[\field{params}] is the stream parameters. It is only valid if
+  \field{result} is VIRTIO_VIDEO_RESULT_OK.
+\end{description}
+
+The struct \field{virtio_video_params} is defined as follows. Some of these
+parameters can be updated by the driver with VIRTIO_VIDEO_CMD_SET_PARAMS.
+\begin{lstlisting}
+struct virtio_video_crop {
+        le32 left;
+        le32 top;
+        le32 width;
+        le32 height;
+};
+
+enum virtio_video_rate_control {
+        VIRTIO_VIDEO_RATE_CONTROL_FRAME = 1,
+        VIRTIO_VIDEO_RATE_CONTROL_MACRO_BLOCK,
+};
+
+struct virtio_video_rc_range {
+        le32 min_qp;
+        le32 max_qp;
+};
+
+struct virtio_video_frame_qp {
+        le32 iframe_qp;
+        le32 pframe_qp;
+        le32 bframe_qp;
+};
+
+union virtio_video_quantization_param {
+        struct virtio_video_rc_range rc;
+        struct virtio_video_frame_qp no_rc;
+};
+
+struct virtio_video_params {
+        /* Image format */
+        le32 image_format; /* VIRTIO_VIDEO_IMAGE_FORMAT_* */
+        le32 min_image_buffers;
+        le32 max_image_buffers;
+        le32 cur_image_buffers;
+        le32 width;
+        le32 height;
+        struct virtio_video_crop crop;
+        le32 frame_rate;
+        le32 planes_layout;
+        le32 num_planes;
+        struct virtio_video_plane_format
+        plane_formats[VIRTIO_VIDEO_MAX_PLANES];
+
+        /* Bitstream format */
+        struct virtio_video_bitstream_format bitstream_format;
+        le32 min_bitstream_buffers;
+        le32 max_bitstream_buffers;
+        le32 cur_bitstream_buffers;
+
+        /* Bitrate  (for encoder) */
+        le32 min_bitrate;
+        le32 max_bitrate;
+        le32 cur_bitrate;
+
+        /* Quantization parameter (for encoder) */
+        le32 rc_mode; /* VIRTIO_VIDEO_RATE_CONTROL_* */
+        union virtio_video_quantization_param qp;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{image_format}] is the image format used by the stream. It is
+  set to one of the variants of \field{enum virtio_video_image_format}.
+\item[\field{min_image_buffers}] is the minimum number of image buffers that the
+  device requires. The device MUST set this to a non-zero integer.
+\item[\field{max_image_buffers}] is the maximum number of image buffers that the
+  device can accept. The device MUST set this to an integer larger than
+  or equal to \field{min_image_buffers}.
+\item[\field{cur_image_buffers}] is the number of image buffers that the driver
+  can enqueue via VIRTIO_VIDEO_RESOURCE_QUEUE. These fields are set by the
+  driver to how many buffers it wishes to use, and set by the device
+  to how many buffers it allows to use.
+  The value MUST be larger than or equal to \field{min_image_buffers} and not
+  exceed \field{max_image_buffers}.
+\item[\field{width}] is the current width of frames in the stream.
+\item[\field{height}] is the current height of frames in the stream.
+\item[\field{crop}] is the current cropping rectangle for frames in the stream.
+\item[\field{frame_rate}] is the frame rate.
+\item[\field{planes_layout}] specifies the plane layout of the resource. The
+  driver MUST set this to one of the variants of \field{enum
+    virtio_video_planes_layout} that is supported for a current image format.
+\item[\field{num_planes}] is the number of planes per frame.
+\item[\field{plane_formats}] is an array containing the current planes format.
+  Only the first |\field{num_planes}| elements are valid. The struct
+  \field{virtio_video_plane_format} is defined as follows.
+\begin{lstlisting}
+struct virtio_video_plane_format {
+        le32 plane_size;
+        le32 stride;
+        le32 offset;
+};
+\end{lstlisting}
+\begin{description}
+\item[plane_size] is a size of the plane in bytes.
+\item[stride] is the line stride.
+\item[offset] is an offset from the beginning of the buffer. This field is valid
+  only if VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER is set to
+  \field{planes_layout}.
+\end{description}
+\item[\field{bitstream_format}] is the bitstream format used in the
+  stream.
+\item[\field{min_bitstream_buffers}] is the minimum number of bitstream buffers
+  that the device requires. The device MUST set this to a non-zero integer.
+\item[\field{max_bitstream_buffers}] is the maximum number of bitstream buffers
+  that the device can accept. The device MUST set this to an integer which is
+  larger than or equal to \field{min_bitstream_buffers}.
+\item[\field{cur_bitstream_buffers}] is the number of bitstream buffers that the
+  driver can enqueue via VIRTIO_VIDEO_RESOURCE_QUEUE. These fields are set by
+  the driver to how many buffers it wishes to use, and set by the device to how
+  many buffers it allows to use. The value MUST be larger than or equal to
+  \field{min_bitstream_buffers} and not exceed \field{max_bitstream_buffers}.
+\item[\field{min_bitrate}] is the minimum bitrate supported by the
+  device. (only for encoders)
+\item[\field{max_bitrate}] is the maximum bitrate supported by the
+  device. (only for encoders)
+\item[\field{cur_bitrate}] is the current bitrate of the stream. (only for
+  encoders)
+\item[\field{rc_mode}] whether rate control is enabled for the stream. If
+  this value is one of variants of \field{enum virtio_video_rate_control}, the
+  rate control described below is enabled. Otherwise, the quantization parameter
+  for each frame type is constant and set with \field{qp.no_rc}. (only for
+  encoders)
+  \begin{description}
+  \item[\field{VIRTIO_VIDEO_RATE_CONTROL_FRAME}] Frame level rate control is
+    enabled. In this mode, the quantization parameter is adjusted according to
+    \field{cur_bitrate}. Minimum and maximum value for the quantization
+    parameter can be set with \field{qp.rc}.
+  \item[\field{VIRTIO_VIDEO_RATE_CONTROL_MACRO_BLOCK}] Macroblock level rate
+    control is enabled. (only for MPEG4 and H.264 encoders)
+  \end{description}
+\item[\field{qp}] is the quantization parameter. (only for encoders)
+\end{description}
+
+After the device responds to VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS, it MUST keep
+responding the same value until one of the followings events occurs:
+\begin{itemize}
+\item the driver sends VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS via commandq.
+\item the device sends VIRTIO_VIDEO_EVENT_DECODER_RESOLUTION_CHANGED via eventq.
+\end{itemize}
+
+\item[VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS] Update the current stream parameters.
+
+The driver sends this command with \field{struct
+  virtio_video_stream_set_params}.
+\begin{lstlisting}
+struct virtio_video_stream_set_params {
+        le32 cmd_type;
+        le32 stream_id;
+        struct virtio_video_params params;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be VIRTIO_VIDEO_CMD_TYPE_SET_PARAMS.
+\item[\field{stream_id}] is the ID of the stream whose parameters are to be
+  updated.
+\item[\field{params}] the new parameters requested by the driver.
+\end{description}
+
+The device responds with \field{struct virtio_video_stream_set_params_resp}.
+\begin{lstlisting}
+struct virtio_video_stream_set_params_resp {
+       le32 result; /* VIRTIO_VIDEO_RESULT_* */
+       struct virtio_video_params params;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] MUST be set to one of the variants of \field{enum
+    virtio_video_result}.
+\item[\field{params}] the updated stream parameters. Values may differ from the
+    requested one depending on the device's and codec capabilities, and values
+    that are not directly changed by the SET_PARAMS command may also be changed.
+    It is the responsibility of the driver to check all values for potential
+    changes and update its state accordingly.
+\end{description}
+
+\item[VIRTIO_VIDEO_CMD_STREAM_DRAIN] Complete processing all queued input
+  buffers.
+
+VIRTIO_VIDEO_CMD_STREAM_DRAIN ensures that all sent
+VIRTIO_VIDEO_CMD_RESOURCE_QUEUE commands for input buffers have been processed
+by the device and that related output buffers are available to the driver.
+
+The driver sends this command with \field{struct virtio_video_stream_drain}.
+\begin{lstlisting}
+struct virtio_video_stream_drain {
+        le32 cmd_type;
+        le32 stream_id;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be VIRTIO_VIDEO_CMD_TYPE_STREAM_DRAIN.
+\item[\field{stream_id}] is a valid stream ID.
+\end{description}
+
+The device responds with \field{struct virtio_video_stream_drain_resp}.
+\begin{lstlisting}
+struct virtio_video_stream_drain_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] MUST be set to one of the variants of \field{enum
+    virtio_video_result}.
+\end{description}
+
+\begin{itemize*}
+\item Before the device sends the response of a VIRTIO_VIDEO_CMD_STREAM_DRAIN
+  command, it MUST process and respond to all of
+  VIRTIO_VIDEO_CMD_RESOURCE_* commands for the input queue which are sent before
+  the drain command.
+\item While the device is processing a VIRTIO_VIDEO_CMD_STREAM_DRAIN
+  command, it MUST return
+  VIRTIO_VIDEO_RESP_ERR_INVALID_OPERATION to the following incoming commands:
+  \begin{itemize*}
+  \item VIRTIO_VIDEO_CMD_RESOURCE_* commands with an input buffer, or
+  \item VIRTIO_VIDEO_CMD_STREAM_DRAIN commands.
+  \end{itemize*}
+\item If the processing was stopped due to
+  VIRTIO_VIDEO_CMD_QUEUE_CLEAR, the device MUST respond with
+  VIRTIO_VIDEO_RESP_OK_NODATA as response type and
+  VIRTIO_VIDEO_BUFFER_FLAG_ERR in \field{flags}.
+\end{itemize*}
+\end{description}
+
+\paragraph{Per queue commands}
+
+\begin{description}
+\item[VIRTIO_VIDEO_CMD_QUEUE_CLEAR] Discard all pending resource commands for a
+  given queue.
+
+The driver sends this command with \field{struct virtio_video_queue_clear}.
+\begin{lstlisting}
+enum virtio_video_queue_type {
+        VIRTIO_VIDEO_QUEUE_TYPE_INPUT = 1,
+        VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT,
+};
+
+struct virtio_video_queue_clear {
+        le32 cmd_type;
+        le32 stream_id;
+        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be VIRTIO_VIDEO_CMD_TYPE_QUEUE_CLEAR.
+\item[\field{stream_id}] is a valid stream ID.
+\item[\field{queue_type}] is the queue to be cleared. This MUST be one of
+  variants of \field{enum virtio_video_queue_type}.
+\end{description}
+
+The device responds with \field{struct virtio_video_queue_clear_resp}.
+\begin{lstlisting}
+struct virtio_video_queue_clear_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] MUST be set to one of the variants of \field{enum
+    virtio_video_result}.
+\end{description}
+
+\begin{itemize*}
+\item Before the device sends a response for VIRTIO_VIDEO_CMD_QUEUE_CLEAR, it
+  MUST respond with VIRTIO_VIDEO_RESULT_ERR_CANCELED to the following pending
+  commands:
+  \begin{itemize*}
+  \item VIRTIO_VIDEO_CMD_RESOURCE_* on the input queue,
+  \item VIRTIO_VIDEO_CMD_STREAM_DRAIN.
+  \end{itemize*}
+\item While the device is processing a VIRTIO_VIDEO_CMD_QUEUE_CLEAR, it
+  MUST return VIRTIO_VIDEO_RESP_ERR_INVALID_OPERATION to the following incoming
+  commands:
+  \begin{itemize*}
+  \item VIRTIO_VIDEO_CMD_STREAM_DRAIN,
+  \item VIRTIO_VIDEO_CMD_QUEUE_CLEAR, or
+  \item VIRTIO_VIDEO_CMD_RESOURCE_*.
+  \end{itemize*}
+\end{itemize*}
+
+\item[VIRTIO_VIDEO_CMD_QUEUE_DETACH_RESOURCES] Detach all the resources of an
+  input or an output queue.
+
+The command VIRTIO_VIDEO_CMD_QUEUE_DETACH_RESOURCES is used to detach all
+resources attached by VIRTIO_VIDEO_CMD_RESOURCE_ATTACH for a given queue.
+The driver sends this command with \field{struct
+  virtio_video_queue_detach_resources}.
+\begin{lstlisting}
+struct virtio_video_queue_detach_resources {
+        le32 cmd_type;
+        le32 stream_id;
+        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be VIRTIO_VIDEO_CMD_QUEUE_DETACH_RESOURCES.
+\item[\field{stream_id}] is a stream ID.
+\item[\field{queue_type}] MUST be a variant of \field{enum
+    virtio_video_queue_type}.
+\end{description}
+
+The device responds with \field{virtio_video_queue_detach_resources_resp}.
+\begin{lstlisting}
+struct virtio_video_queue_detach_resources_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] MUST be set to one of the variants of \field{enum
+    virtio_video_result}.
+\end{description}
+\end{description}
+
+\paragraph{Per resource commands}
+
+\begin{description}
+\item[VIRTIO_VIDEO_CMD_RESOURCE_ATTACH] Attach memory entries to use as a video
+  buffer.
+
+The driver sends this command with \field{struct virtio_video_resource_attach}.
+\begin{lstlisting}
+struct virtio_video_resource_attach {
+        le32 cmd_type;
+        le32 stream_id;
+        le32 queue_type;
+        le32 resource_id;
+        union virtio_video_resource resources[];
+};
+
+struct virtio_video_resource_attach_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be set to VIRTIO_VIDEO_CMD_RESOURCE_ATTACH.
+\item[\field{stream_id}] is the ID of the stream.
+\item[\field{queue_type}] is the direction of the queue.
+\item[\field{resource_id}] is the ID of the resource. If the \field{queue_type}
+  indicates the queue for an image format, \field{resource_id} MUST be an
+  integer less than \field{cur_image_buffers} in \field{virtio_video_params}
+  obtained via VIRTIO_VIDEO_GET_PARAMS. Otherwise, \field{resource_id} MUST be
+  less than \field{cur_bitstream_buffers}.
+\item[\field{resources}] specifies memory regions that will be attached. Its
+  length of the array depends on the value of \field{planes_layout} in
+  \field{virtio_video_params} obtained via VIRTIO_VIDEO_GET_PARAMS. If it is
+  VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER, the length MUST be 1. If it is
+  VIRTIO_VIDEO_LAYOUT_PER_PLANE, the length MUST be equal to \field{num_planes}
+  in \field{virtio_video_params}.
+
+  The struct \field{virtio_video_resource} is defined as follows:
+  \begin{lstlisting}
+union virtio_video_resource {
+        struct virtio_video_resource_sg_list sg_list;
+        struct virtio_video_resource_object object;
+};
+\end{lstlisting}
+\begin{description}
+  \item[sg_list] represents a scatter-gather list. This field is valid when
+    VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES is set for the specified queue type in
+    VIRTIO_VIDEO_CMD_STREAM_CREATE command. The struct
+    \field{virtio_video_resource_sg_list} is defined as follows:
+    \begin{lstlisting}
+struct virtio_video_resource_sg_entry {
+        le64 addr;
+        le32 length;
+        u8 padding[4];
+};
+
+struct virtio_video_resource_sg_list {
+        le32 num_entries;
+        u8 padding[4];
+        struct virtio_video_resource_sg_entry entries[];
+};
+\end{lstlisting}
+The \field{num_entries} in \field{virtio_video_resource_sg_list} is the number
+of \field{virtio_video_resource_sg_entry} instances that follow.
+
+Each field in \field{virtio_video_resource_sg_entry} is used as follows:
+    \begin{description}
+    \item[\field{addr}] is the physical guest address.
+    \item[\field{length}] is the length of the resource.
+    \end{description}
+  \end{description}
+  \item[object] represents an object exported from other virtio devices as
+    defined in \ref{sec:Basic Facilities of a Virtio Device / Exporting
+      Objects}. This field is valid when VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT is
+    set for the specified queue type in VIRTIO_VIDEO_CMD_STREAM_CREATE command.
+    The struct \field{virtio_video_resource_object} is defined as follows:
+    \begin{lstlisting}
+struct virtio_video_resource_object {
+        u8 uuid[16];
+};
+    \end{lstlisting}
+    \begin{description}
+    \item[uuid] is a version 4 UUID specified by
+      \hyperref[intro:rfc4122]{[RFC4122]}.
+    \end{description}
+\end{description}
+
+The device responds with \field{struct virtio_video_resource_attach_resp}:
+\begin{lstlisting}
+struct virtio_video_resource_attach_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] MUST be set to one of the variants of \field{enum
+    virtio_video_result}.
+\end{description}
+
+\item[VIRTIO_VIDEO_CMD_RESOURCE_QUEUE] Add a buffer to the device's
+queue.
+
+\begin{lstlisting}
+enum virtio_video_enqueue_flag {
+        VIRTIO_VIDEO_ENQUEUE_FLAG_FORCE_KEY_FRAME = 0,
+};
+
+struct virtio_video_resource_queue {
+        le32 cmd_type;
+        le32 stream_id;
+        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+        le32 resource_id;
+        le32 flags; /* Bitmask with VIRTIO_VIDEO_ENQUEUE_FLAG_* */
+        u8 padding[4];
+        le64 timestamp;
+        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be set to VIRTIO_VIDEO_CMD_RESOURCE_QUEUE.
+\item[\field{stream_id}] is the ID for the stream the resource belongs to.
+\item[\field{queue_type}] direction of the queue this resource belongs to.
+\item[\field{resource_id}] is the ID of the resource to be queued.
+\item[\field{flags}] is a bitmask of VIRTIO_VIDEO_ENQUEUE_FLAG_* values
+  representing requirements when processing the resource. If the driver doesn't
+  have any requirement, it MUST set this value to 0.
+  \begin{description}
+    \item[\field{VIRTIO_VIDEO_ENQUEUE_FLAG_FORCE_KEY_FRAME}] The frame MUST be
+      encoded as a key frame. (only for encoders)
+  \end{description}
+\item[\field{timestamp}] is an abstract sequence counter that can be
+  used for synchronization. When \field{queue_type} is set to
+  VIRTIO_VIDEO_QUEUE_TYPE_INPUT, the driver MUST set this field to a unique
+  value per frame. If using multiple VIRTIO_VIDEO_RESOURCE_QUEUE requests per
+  frame, then the timestamps for a given frame MUST be identical.
+  For VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT, the driver MUST set it to 0.
+\item[\field{data_sizes}] number of data bytes used for each plane. The driver
+  MUST set this for each plane of an input buffer. For output buffers, the
+  driver MUST set this to zero.
+\end{description}
+
+The device responds with \field{virtio_video_resource_queue_resp}:
+\begin{lstlisting}
+enum virtio_video_dequeue_flag {
+        VIRTIO_VIDEO_DEQUEUE_FLAG_ERR = 0,
+        VIRTIO_VIDEO_DEQUEUE_FLAG_EOS,
+
+        /* Encoder only */
+        VIRTIO_VIDEO_DEQUEUE_FLAG_KEY_FRAME,
+        VIRTIO_VIDEO_DEQUEUE_FLAG_P_FRAME,
+        VIRTIO_VIDEO_DEQUEUE_FLAG_B_FRAME,
+};
+
+struct virtio_video_resource_queue_resp {
+        le32 result;
+        le32 flags;
+        le64 timestamp;
+        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] MUST be set to one of variants of \field{enum
+    virtio_video_result}.
+\item[\field{flags}] is a bitmask of VIRTIO_VIDEO_DEQUEUE_FLAG_* flags.
+  \begin{description}
+  \item[\field{VIRTIO_VIDEO_DEQUEUE_FLAG_ERR}] When this flag is set, the data
+    might have been corrupted or the process was terminated by
+    VIRTIO_VIDEO_CMD_QUEUE_CLEAR.
+  \item[\field{VIRTIO_VIDEO_DEQUEUE_FLAG_EOS}] When this flag is set, this is
+    the last frame for the current stream.
+  \item[\field{VIRTIO_VIDEO_DEQUEUE_FLAG_KEY_FRAME}] When this flag is set, the
+    buffer contains a compressed image which is a key frame. (only for encoders)
+  \item[\field{VIRTIO_VIDEO_DEQUEUE_FLAG_P_FRAME}] When this flag is set, the
+    buffer contains contain only differences to a previous key frame. (only for
+    encoders)
+  \item[\field{VIRTIO_VIDEO_DEQUEUE_FLAG_B_FRAME}] When this flag is set,
+    the buffer contains only the differences between the current frame and both
+    the preceding and following key frames to specify its content. (only for
+    encoders)
+  \end{description}
+\item[\field{timestamp}] is an abstract sequence counter that can be
+  used for synchronization. For an output buffer, the device MUST copy
+  the \field{timestamp} of the input buffer this output buffer was
+  produced from.
+\item[\field{timestamp}] is an abstract sequence counter that can be
+  used for synchronization. When \field{queue_type} is set to
+  VIRTIO_VIDEO_QUEUE_TYPE_INPUT, the device MUST set this field to 0.
+  For VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT, the device MUST copy the \field{timestamp}
+  from requests of input buffers the frame of this response was produced from.
+\item[\field{data_sizes}] is the size written by the device, for each valid
+  plane.
+\end{description}
+
+\begin{itemize*}
+\item For each VIRTIO_VIDEO_CMD_RESOURCE_QUEUE request, the device MUST send a
+  response to the queue request with VIRTIO_VIDEO_OK_NODATA when it has finished
+  processing the buffer successfully.
+\item The device MUST mark a buffer that triggered a processing error with the
+  VIRTIO_VIDEO_BUFFER_F_ERR flag.
+\item The device MUST mark the last buffer with the VIRTIO_VIDEO_BUFFER_F_EOS
+  flag to denote completion of the drain sequence.
+\item In case of encoder, to denote a particular frame type the device MUST mark
+  the respective buffer with VIRTIO_VIDEO_BUFFER_IFRAME,
+  VIRTIO_VIDEO_BUFFER_PFRAME, or VIRTIO_VIDEO_BUFFER_BFRAME.
+\item If the processing was stopped due to VIRTIO_VIDEO_CMD_QUEUE_CLEAR, the
+  device MUST set \field{result} to VIRTIO_VIDEO_RESP_OK_NODATA and set the bit
+  of VIRTIO_VIDEO_BUFFER_FLAG_ERR in \field{flags} in
+  \field{virtio_video_resource_queue_resp}.
+\item The driver and device MUST follow requirements about buffer ownership
+  explained in \ref{sec:Device Types / Video Device / Device Operation / Buffer
+    lifecycle}.
+\end{itemize*}
+\end{description}
+
+\subsubsection{Event Virtqueue}
+
+While processing buffers, the device can send asynchronous event notifications
+to the driver. The behaviour depends on the exact stream. For example, the
+decoder device sends a resolution change event when it encounters new resolution
+metadata in the stream.
+
+The device reports events on the event queue. The driver initially populates the
+queue with device-writeable buffers. When the device needs to report an event,
+it fills a buffer and notifies the driver. The driver consumes the event and
+adds a new buffer to the virtqueue.
+\begin{lstlisting}
+enum virtio_video_event_type {
+        /* For all devices */
+        VIRTIO_VIDEO_EVENT_ERROR = 0x0100,
+
+        /* For decoder only */
+        VIRTIO_VIDEO_EVENT_DECODER_RESOLUTION_CHANGED = 0x0200,
+};
+
+struct virtio_video_event {
+        le32 event_type; /* One of VIRTIO_VIDEO_EVENT_* types */
+        le32 stream_id;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{event_type}] type of the triggered event.
+\item[\field{stream_id}] id of the source stream.
+\end{description}
+
+The device MUST send VIRTIO_VIDEO_EVENT_DECODER_RESOLUTION_CHANGED whenever it
+encounters new resolution data in the stream. This includes the case of the
+initial device configuration after metadata has been parsed and the case of
+dynamic resolution change.
+
+\subsubsection{Buffer life cycle}
+\label{sec:Device Types / Video Device / Device Operation / Buffer
+  life cycle}
+
+The state machine in Figure~\ref{fig:buffer-lifecycle} shows the life
+cycle of a video buffer.
+``ATTACH'' and ``QUEUE'' on edges represent per-resource device operations
+VIRTIO_VIDEO_CMD_RESOURCE_ATTACH and VIRTIO_VIDEO_CMD_RESOURCE_QUEUE,
+respectively.
+The edges labeled with ''detach'' represents the following cases:
+\begin{itemize}
+\item VIRTIO_VIDEO_CMD_STREAM_DESTROY is completed,
+\item VIRTIO_VIDEO_CMD_QUEUE_DETACH_RESOURCES is completed, or
+\item another resource is attached for the resource_id by
+  VIRTIO_VIDEO_CMD_RESOURCE_ATTACH.
+\end{itemize}
+
+VIRTIO_VIDEO_CMD_STREAM_DESTROY or VIRTIO_VIDEO_CMD_QUEUE_DETACH_RESOURCES.
+
+\begin{figure}[h]
+  \centering
+  \includegraphics[width=\textwidth]{images/generated/video-buffer-lifecycle.png}
+  \caption{Life Cycle of a Buffer}
+  \label{fig:buffer-lifecycle}
+\end{figure}
+
+
+\drivernormative{\subparagraph}{Buffer life cycle}{Device Types / Video Device /
+  Device Operation / Buffer life cycle}
+
+The following table shows whether the driver can read or write each buffer in
+each state in Figure~\ref{fig:buffer-lifecycle}. The driver MUST not read or
+write buffers in the state that doesn't permit.
+\begin{center}
+  \begin{tabular}{|c|c|c|}
+    \hline
+    State & Input buffers & Output buffers \\
+    \hline
+    Detached & Read / Write & Read \\
+    Queued   & -            & -    \\
+    Dequeued & Read / Write & Read \\
+    \hline
+  \end{tabular}
+\end{center}
+
+\devicenormative{\subparagraph}{Buffer life cycle}{Device Types / Video
+  Device / Device Operation / Buffer life cycle}
+
+The following table shows whether the device can read or write each buffer in
+each state in Figure~\ref{fig:buffer-lifecycle}. The device MUST not read or
+write buffers in the state that doesn't permit.
+\begin{center}
+  \begin{tabular}{ |c|c|c| }
+    \hline
+    State & Input buffers & Output buffers \\
+    \hline
+    Detached  & -    & - \\
+    Queued   & Read & Read / Write \\
+    Dequeued & -    & Read \\
+    \hline
+  \end{tabular}
+\end{center}
-- 
2.27.0.111.gc72c7da667-goog

