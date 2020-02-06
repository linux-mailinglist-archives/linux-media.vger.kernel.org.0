Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 570891541C5
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 11:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbgBFKVa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 05:21:30 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35489 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728304AbgBFKVa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 05:21:30 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so2518904pgk.2
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 02:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/FcQjBN21OusAqPE5MyppDL5lHvCI9sohkohBeXyh5s=;
        b=WvGeROmfnwvrSXWN9JqV9IxnTWeyLFmVXEOvYgrjsQR/yxbreqseU/RYzNic5tudEZ
         GdkdlfYU3o5VQ7HWiGwhpBTiivWckdkv/MQicPzGKWm0yDmvTf9jFIADy5oXJ88Zd5rL
         Teat98XE90MOeh8E7gz18Z90WwDXDu7+eokZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/FcQjBN21OusAqPE5MyppDL5lHvCI9sohkohBeXyh5s=;
        b=M4wCzU+XvGr5mNoSumJ3gWjTX6eIyVmvYmwmT4m9sFgUzVu4XCW09TQesQOx67YJ93
         LkZaBiheD6yLeqxKSUCW1aocJAEp/E4pwX3YDFMC2kkqE06xUpml2ZYaSebalNIpLOEI
         nFyCA6WFyxslFz+WWYFcWsZdJLznezElrZ+o1KAEYfPT+iDH91kWjK9R+JZ0/GWvMVuN
         pKzdnSaQR7VDHROwKh/s/OV0Qh8xlVMdFbDZIRYj++i/dnwHWwVZ8aNL/1SVUidmuvHQ
         IbdJuG1j3kz6/CRqLqJph4wpOdvFXTVTN12CWbKaFCs7Bnbj7J0u753yk1hAjLfAK300
         5FLg==
X-Gm-Message-State: APjAAAWjvMdFZZk7rr/5McmwOmUQ73TUWcVRcBNu/BOKY/qYvBGQ5YpN
        p6+3Gu87oJHtU9DxbVwfJBxXGw==
X-Google-Smtp-Source: APXvYqxss4X66465lgjsN45poAsU3yd3wXxkj2apYhptP6PpK2GPobnT5SWiSQMaDTidEr2bGNAbxQ==
X-Received: by 2002:a63:7e58:: with SMTP id o24mr2713678pgn.214.1580984488709;
        Thu, 06 Feb 2020 02:21:28 -0800 (PST)
Received: from keiichiw1.tok.corp.google.com ([2401:fa00:8f:203:863a:e217:a16c:53f2])
        by smtp.gmail.com with ESMTPSA id v4sm2590270pff.174.2020.02.06.02.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 02:21:27 -0800 (PST)
From:   Keiichi Watanabe <keiichiw@chromium.org>
To:     virtio-dev@lists.oasis-open.org
Cc:     linux-media@vger.kernel.org, acourbot@chromium.org,
        alexlau@chromium.org, daniel@ffwll.ch, dgreid@chromium.org,
        dstaessens@chromium.org, dmitry.sepp@opensynergy.com,
        egranata@google.com, fziglio@redhat.com, hverkuil@xs4all.nl,
        keiichiw@chromium.org, kraxel@redhat.com, marcheu@chromium.org,
        posciak@chromium.org, spice-devel@lists.freedesktop.org,
        stevensd@chromium.org, tfiga@chromium.org, uril@redhat.com,
        samiullah.khawaja@opensynergy.com, kiran.pawar@opensynergy.com
Subject: [PATCH v3 1/2] virtio-video: Add virtio video device specification
Date:   Thu,  6 Feb 2020 19:20:57 +0900
Message-Id: <20200206102058.247258-2-keiichiw@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200206102058.247258-1-keiichiw@chromium.org>
References: <20200206102058.247258-1-keiichiw@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dmitry Sepp <dmitry.sepp@opensynergy.com>

The virtio video encoder device and decoder device provide functionalities to
encode and decode video stream respectively.
Though video encoder and decoder are provided as different devices, they use a
same protocol.

Signed-off-by: Dmitry Sepp <dmitry.sepp@opensynergy.com>
Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
---
 .gitignore                        |   1 +
 content.tex                       |   1 +
 images/video-buffer-lifecycle.dot |  18 +
 make-setup-generated.sh           |   8 +
 virtio-video.tex                  | 988 ++++++++++++++++++++++++++++++
 5 files changed, 1016 insertions(+)
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
index b91a132..b75a40f 100644
--- a/content.tex
+++ b/content.tex
@@ -6062,6 +6062,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
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
index 0000000..2eeee53
--- /dev/null
+++ b/virtio-video.tex
@@ -0,0 +1,988 @@
+\section{Video Device}\label{sec:Device Types / Video Device}
+
+The virtio video encoder device and decoder device are virtual devices
+that supports encoding and decoding respectively. While the encoder
+and the decoder are different devices, they use the same protocol.
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
+\item[0] commandq - queue for sending commands.
+\item[1] eventq - queue for sending events happened in the device.
+\end{description}
+
+\subsection{Feature bits}
+\label{sec:Device Types / Video Device / Feature bits}
+
+\begin{description}
+\item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (0)] Guest pages can be used
+  for video buffers.
+\item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (1)] The device can use
+  non-contiguous memories for video buffers. Without this flag, the
+  driver and device MUST use video buffers that are contiguous in the
+  device-side.
+\end{description}
+
+\devicenormative{\subsubsection}{Feature bits}{Device Types / Video
+  Device / Feature bits}
+
+The device MUST offer VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES.
+
+\subsection{Device configuration layout}
+\label{sec:Device Types / Video Device / Device configuration layout}
+
+Video device configuration uses the following layout structure:
+
+\begin{lstlisting}
+struct virtio_video_config {
+        le32 version;
+        le32 max_caps_length;
+        le32 max_resp_length;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{version}] is the protocol version that the device talks.
+  The device MUST set this to 0.
+\item[\field{max_caps_length}] defines the maximum length of a
+  descriptor required to call VIRTIO_VIDEO_CMD_QUERY_CAPABILITY in
+  bytes. The device MUST set this value.
+\item[\field{max_resp_length}] defines the maximum length of a
+  descriptor required to call a command other than
+  VIRTIO_VIDEO_CMD_QUERY_CAPABILITY in bytes. The device MUST set this
+  value.
+\end{description}
+
+\subsection{Device Initialization}
+\label{sec:Device Types / Video Device / Device Initialization}
+
+\devicenormative{\subsubsection}{Device Initialization}{Device Types /
+  Video Device / Device Initialization}
+
+The driver SHOULD query device capability by using the
+VIRTIO_VIDEO_CMD_QUERY_CAPABILITY and use that information for the
+initial setup.
+
+\subsection{Device Operation}
+\label{sec:Device Types / Video Device / Device Operation}
+
+The driver allocates input and output buffers and queues the buffers
+to the device. The device performs operations on the buffers according
+to the function in question.
+
+\subsubsection{Command Virtqueue}
+
+\paragraph{Device Operation: Command header}
+
+All commands and responses on the command virtqueue have a fixed
+header using the following layout structure and definitions:
+
+\begin{lstlisting}
+  enum virtio_video_cmd_type {
+        /* Command */
+        VIRTIO_VIDEO_CMD_QUERY_CAPABILITY = 0x0100,
+        VIRTIO_VIDEO_CMD_STREAM_CREATE,
+        VIRTIO_VIDEO_CMD_STREAM_DESTROY,
+        VIRTIO_VIDEO_CMD_STREAM_DRAIN,
+        VIRTIO_VIDEO_CMD_RESOURCE_CREATE,
+        VIRTIO_VIDEO_CMD_RESOURCE_QUEUE,
+        VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL,
+        VIRTIO_VIDEO_CMD_QUEUE_CLEAR,
+        VIRTIO_VIDEO_CMD_GET_PARAMS,
+        VIRTIO_VIDEO_CMD_SET_PARAMS,
+        VIRTIO_VIDEO_CMD_QUERY_CONTROL,
+        VIRTIO_VIDEO_CMD_GET_CONTROL,
+        VIRTIO_VIDEO_CMD_SET_CONTROL,
+
+        /* Response */
+        VIRTIO_VIDEO_RESP_OK_NODATA = 0x0200,
+        VIRTIO_VIDEO_RESP_OK_QUERY_CAPABILITY,
+        VIRTIO_VIDEO_RESP_OK_RESOURCE_QUEUE,
+        VIRTIO_VIDEO_RESP_OK_GET_PARAMS,
+        VIRTIO_VIDEO_RESP_OK_QUERY_CONTROL,
+        VIRTIO_VIDEO_RESP_OK_GET_CONTROL,
+
+        VIRTIO_VIDEO_RESP_ERR_INVALID_OPERATION = 0x0300,
+        VIRTIO_VIDEO_RESP_ERR_OUT_OF_MEMORY,
+        VIRTIO_VIDEO_RESP_ERR_INVALID_STREAM_ID,
+        VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID,
+        VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER,
+        VIRTIO_VIDEO_RESP_ERR_UNSUPPORTED_CONTROL,
+};
+
+struct virtio_video_cmd_hdr {
+        le32 type;
+        le32 stream_id;
+};
+\end{lstlisting}
+
+The fixed header \field{virtio_video_cmd_hdr} in each message includes
+the following field:
+\begin{description}
+\item[\field{type}] specifies the type of the driver command
+  (VIRTIO_VIDEO_CMD_*) or the device response (VIRTIO_VIDEO_RESP_*).
+\item[\field{stream_id}] specifies a target stream if needed.
+\end{description}
+
+On success the device will return VIRTIO_VIDEO_RESP_OK_NODATA in case
+there is no payload. Otherwise the \field{type} field will indicate
+the kind of payload.
+
+On error the device will return one of the VIRTIO_VIDEO_RESP_ERR_*
+error codes.
+
+\paragraph{Device Operation: Query device capability}
+
+\begin{description}
+\item[VIRTIO_VIDEO_CMD_QUERY_CAPABILITY] Retrieve information about
+supported formats.
+
+The driver uses \field{virtio_video_query_capability} to send a
+query request.
+
+\begin{lstlisting}
+enum virtio_video_queue_type {
+        VIRTIO_VIDEO_QUEUE_TYPE_INPUT = 0x100,
+        VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT,
+};
+
+struct virtio_video_query_capability {
+        struct virtio_video_ctrl_hdr hdr;
+        le32 queue_type;
+        u8 padding[4];
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{queue_type}] is the queue type that the driver asks
+information about. The driver MUST set either
+\field{VIRTIO_VIDEO_QUEUE_TYPE_INPUT} or
+\field{VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT}.
+\end{description}
+
+The device responds to VIRTIO_VIDEO_CMD_QUERY_CAPABILITY with
+\field{virtio_video_query_capability_resp}.
+\begin{lstlisting}
+struct virtio_video_query_capability_resp {
+        struct virtio_video_cmd_hdr hdr;
+        le32 num_descs;
+        u8 padding[4];
+        /* Followed by struct virtio_video_format_desc descs[] */
+};
+\end{lstlisting}
+
+The device MUST return its capability with \field{
+  virtio_video_capability_resp} that includes the following fields:
+\begin{description}
+\item[\field{num_descs}] is a number of \field{virtio_video_format_desc}
+  that follow. The value MUST not exceed 64.
+\end{description}
+
+The format description \field{virtio_video_format_desc} is defined as
+follows:
+\begin{lstlisting}
+enum virtio_video_format {
+        /* Raw formats */
+        VIRTIO_VIDEO_FORMAT_RAW_MIN = 1,
+        VIRTIO_VIDEO_FORMAT_ARGB8888 = VIRTIO_VIDEO_FORMAT_RAW_MIN,
+        VIRTIO_VIDEO_FORMAT_BGRA8888,
+        VIRTIO_VIDEO_FORMAT_NV12, /* 12  Y/CbCr 4:2:0  */
+        VIRTIO_VIDEO_FORMAT_YUV420, /* 12  YUV 4:2:0     */
+        VIRTIO_VIDEO_FORMAT_YVU420, /* 12  YVU 4:2:0     */
+        VIRTIO_VIDEO_FORMAT_RAW_MAX = VIRTIO_VIDEO_FORMAT_YVU420,
+
+        /* Coded formats */
+        VIRTIO_VIDEO_FORMAT_CODED_MIN = 0x1000,
+        VIRTIO_VIDEO_FORMAT_MPEG2 = VIRTIO_VIDEO_FORMAT_CODED_MIN, /* MPEG-2 Part 2 */
+        VIRTIO_VIDEO_FORMAT_MPEG4, /* MPEG-4 Part 2 */
+        VIRTIO_VIDEO_FORMAT_H264, /* H.264 */
+        VIRTIO_VIDEO_FORMAT_HEVC, /* HEVC aka H.265*/
+        VIRTIO_VIDEO_FORMAT_VP8, /* VP8 */
+        VIRTIO_VIDEO_FORMAT_VP9, /* VP9 */
+        VIRTIO_VIDEO_FORMAT_CODED_MAX = VIRTIO_VIDEO_FORMAT_VP9,
+};
+
+enum virtio_video_planes_layout_flag {
+        VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER = 1 << 0,
+        VIRTIO_VIDEO_PLANES_LAYOUT_PER_PLANE = 1 << 1,
+};
+
+struct virtio_video_format_desc {
+        le64 mask;
+        le32 format; /* One of VIRTIO_VIDEO_FORMAT_* types */
+        le32 planes_layout; /* Bitmask with VIRTIO_VIDEO_PLANES_LAYOUT_* */
+        le32 plane_align;
+        le32 num_frames;
+        /* Followed by struct virtio_video_format_frame frames[] */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{mask}] is a bitset that represents the supported
+  combination of input and output format. If \textit{i}-th bit is set
+  in \field{mask} of \textit{j}-th \field{virtio_video_format_desc}
+  for input, the device supports encoding or decoding from the
+  \textit{j}-th input format to \textit{i}-th output format.
+\item[\field{format}] specifies an image format. The device MUST set
+  one of \field{enum virtio_video_format}.
+\item[\field{planes_layout}] is a bitmask representing a set of plane
+  layout types the device supports. This driver MUST ignore this field
+  for encoded formats.
+  \begin{description}
+  \item[\field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER}] The device
+    expects planes in one buffer laid out one after another.
+  \item[\field{VIRTIO_VIDEO_PLANES_LAYOUT_PER_PLANE}] The device
+    expects planes to be located in separate buffers.
+  \end{description}
+\item[\field{plane_align}] is a plane alignment the device require
+  when multiple planes are located in one buffer. The driver MUST
+  ignore this field if \field{format} is a bitstream format or
+  \field{planes_layout} doesn't have
+  \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit.
+\item[\field{num_frames}] is the number of
+  \field{virtio_video_format_frame} that follows.
+\end{description}
+
+The frame information \field{virtio_video_format_frame} is defined as
+follows:
+\begin{lstlisting}
+struct virtio_video_format_range {
+        le32 min;
+        le32 max;
+        le32 step;
+        u8 padding[4];
+};
+
+struct virtio_video_format_frame {
+        struct virtio_video_format_range width;
+        struct virtio_video_format_range height;
+        le32 num_rates;
+        u8 padding[4];
+        /* Followed by struct virtio_video_format_range frame_rates[] */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{width, height}] represents a range of resolutions
+  supported by the device. If its \field{step} is not applicable, its
+  \field{min} is equal to its \field{max}.
+\item[\field{num_rates}] is the number of
+  \field{virtio_video_format_ranges} that follows to represent
+  supported frame rates.
+\end{description}
+\end{description}
+
+\devicenormative{\subparagraph}{Device Operation: Query device
+  capability}{Device Types / Video Device / Device Operation / Device
+  Operation: Query device capability}
+
+The total size of the device response MUST not exceed
+\field{max_cap_length} in bytes reported in the device configuration.
+
+\paragraph{Device Operation: Create streams}
+
+To process buffers, the device needs to associate them with a certain
+video stream (essentially, a context). Streams are created by
+VIRTIO_VIDEO_CMD_STREAM_CREATE with a default set of parameters
+determined by the device.
+
+\begin{description}
+\item[VIRTIO_VIDEO_CMD_STREAM_CREATE] Create a video stream (context)
+  within the device.
+
+\begin{lstlisting}
+enum virtio_video_mem_type {
+        VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES,
+};
+
+struct virtio_video_stream_create {
+        struct virtio_video_cmd_hdr hdr;
+        le32 in_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
+        le32 out_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
+        le32 coded_format; /* One of VIRTIO_VIDEO_FORMAT_* types */
+        u8 padding[4];
+        u8 tag[64];
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{in_mem_type, out_mem_type}] is a type of buffer
+  management for input /output buffers. The driver MUST set a value in
+  \field{enum virtio_video_mem_type} that the device reported a
+  corresponding feature bit.
+\begin{description}
+\item[\field{VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES}] Use guest pages.
+\end{description}
+\item[\field{coded_format}] is the encoded format that will be
+  processed.
+\item[\field{tag}] is the name associated with this stream. The tag
+  MUST be encoded in UTF-8 and NUL-terminated.
+\end{description}
+
+The driver MUST set \field{stream_id} in \field{virtio_video_cmd_hdr}
+to an integer that is not used before. If a used value is passed as
+\field{stream_id}, the device MUST reports an error with
+VIRTIO_VIDEO_RESP_ERR_INVALID_STREAM_ID.
+
+\item[VIRTIO_VIDEO_CMD_STREAM_DESTROY] Destroy a video stream
+  (context) within the device.
+
+\begin{lstlisting}
+struct virtio_video_stream_destroy {
+        struct virtio_video_cmd_hdr hdr;
+};
+\end{lstlisting}
+\end{description}
+
+\paragraph{Device Operation: Import resources}
+
+\begin{itemize*}
+\item Use VIRTIO_VIDEO_CMD_RESOURCE_CREATE to import a resource to use
+  it as a video buffer.
+\item Use VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL to invalidate all the
+  resources imported by VIRTIO_VIDEO_CMD_RESOURCE_CREATE so far.
+\end{itemize*}
+
+\begin{description}
+\item[VIRTIO_VIDEO_CMD_RESOURCE_CREATE] Create a resource descriptor
+  within the device.
+
+The driver sends \field{virtio_video_resource_create} defined as
+follows:
+\begin{lstlisting}
+#define VIRTIO_VIDEO_MAX_PLANES 8
+
+struct virtio_video_resource_create {
+        struct virtio_video_cmd_hdr hdr;
+        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+        le32 resource_id;
+        le32 planes_layout;
+        le32 num_planes;
+        le32 plane_offsets[VIRTIO_VIDEO_MAX_PLANES];
+        le32 num_entries[VIRTIO_VIDEO_MAX_PLANES];
+        /* Followed by struct virtio_video_mem_entry entries[] */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{queue_type}] specifies a direction of queue which the
+  resource will be used for.
+\item[\field{resource_id}] is an identifier of the resource. The
+  driver MUST set it to an integer that is not used before for the
+  given \field{queue_type}. If the specified \field{resource_id} is
+  already in use, the device MUST report an error with
+  VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID.
+\item[\field{planes_layout}] specifies a plane layout. The driver MUST
+  set only one bit of \field{virtio_video_planes_layout_flag} that is
+  supported for a current raw format.
+\item[\field{num_planes}] specifies a number of planes.
+\item[\field{plane_offsets}] specifies offsets for each plane.
+\item[\field{num_entries}] is an array of numbers of \field{entries}
+  memory entries for each plane. If \field{planes_layout} is
+  VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER, only the first element is
+  used.
+\end{description}
+
+The \field{virtio_video_resource_create} is followed by an array of
+\field{virtio_video_mem_entry} defined as follows:
+\begin{lstlisting}
+struct virtio_video_mem_entry {
+        le64 addr;
+        le32 length;
+        u8 padding[4];
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{addr}] is the physical guest address.
+\item[\field{length}] is the length of the resource.
+\end{description}
+The number of \field{virtio_video_mem_entry} MUST be equal to the sum
+of integers in the array \field{num_entries}.
+
+\item[VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL] Invalidate all the
+  resource descriptor created so far.
+\begin{lstlisting}
+struct virtio_video_resource_destroy_all {
+        struct virtio_video_cmd_hdr hdr;
+        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+        u8 padding[4];
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{queue_type}] is a type of queue.
+\end{description}
+\end{description}
+
+\paragraph{Device Operation: Process buffers}
+
+\begin{itemize*}
+\item Use VIRTIO_VIDEO_CMD_RESOURCE_QUEUE to queue the resource for
+  processing in the device. The request completes asynchronously and
+  out-of-order when the device has finished with the buffer.
+\item Use VIRTIO_VIDEO_CMD_STREAM_DRAIN to ask the device to process
+  and return all of the already queued buffers.
+\item Use VIRTIO_VIDEO_CMD_QUEUE_CLEAR to ask the device to return
+  back already queued buffers from the input or the output queue. This
+  also includes input or output buffers that can be currently owned by
+  the device's processing pipeline.
+\end{itemize*}
+
+\begin{description}
+\item[VIRTIO_VIDEO_CMD_RESOURCE_QUEUE] Add a buffer to the device's
+queue.
+
+\begin{lstlisting}
+struct virtio_video_resource_queue {
+        struct virtio_video_cmd_hdr hdr;
+        le32 queue_type;
+        le32 resource_id;
+        le64 timestamp;
+        le32 num_data_sizes;
+        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{resource_id}] is the ID of the resource to be queued.
+\item[\field{timestamp}] is an abstract sequence counter that can be
+  used for synchronization. For an input buffer, the driver MUST set a
+  \field{timestamp}.
+\item[\field{num_data_sizes}] is the number of \field{data_sizes}
+  entries in use.
+\item[\field{data_sizes}] number of data bytes within a plane.
+\end{description}
+
+The device returns \field{virtio_video_resource_queue_resp} defined as
+follows:
+\begin{lstlisting}
+enum virtio_video_buffer_flag {
+        VIRTIO_VIDEO_BUFFER_FLAG_ERR = 0x0001,
+        VIRTIO_VIDEO_BUFFER_FLAG_EOS = 0x0002,
+
+        /* Encoder only */
+        VIRTIO_VIDEO_BUFFER_FLAG_IFRAME = 0x0004,
+        VIRTIO_VIDEO_BUFFER_FLAG_PFRAME = 0x0008,
+        VIRTIO_VIDEO_BUFFER_FLAG_BFRAME = 0x0010,
+};
+
+struct virtio_video_resource_queue_resp {
+        struct virtio_video_cmd_hdr hdr;
+        le64 timestamp;
+        le32 flags;
+        le32 size; /* Encoded size */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{timestamp}] is an abstract sequence counter that can be
+  used for synchronization. For an output buffer, the device MUST copy
+  the \field{timestamp} of the input buffer this output buffer was
+  produced from.
+\item[\field{flags}] marks specific buffers in the sequence with
+  VIRTIO_VIDEO_BUFFER_FLAG_* flags.
+\item[\field{size}] is the data size in the buffer (encoder only).
+\end{description}
+
+\begin{itemize*}
+\item For each VIRTIO_VIDEO_CMD_RESOURCE_QUEUE request, the device
+  MUST send a response to the queue request with
+  VIRTIO_VIDEO_OK_NODATA when it has finished processing the buffer
+  successfully.
+\item The device MUST mark a buffer that triggered a processing error
+  with the VIRTIO_VIDEO_BUFFER_F_ERR flag.
+\item The device MUST mark the last buffer with the
+  VIRTIO_VIDEO_BUFFER_F_EOS flag to denote completion of the drain
+  sequence.
+\item In case of encoder, to denote a particular frame type the device
+  MUST mark the respective buffer with VIRTIO_VIDEO_BUFFER_IFRAME,
+  VIRTIO_VIDEO_BUFFER_PFRAME, or VIRTIO_VIDEO_BUFFER_BFRAME.
+\item If the processing was stopped due to
+  VIRTIO_VIDEO_CMD_QUEUE_CLEAR, the device MUST respond with
+  VIRTIO_VIDEO_RESP_OK_NODATA as a response type and
+  VIRTIO_VIDEO_BUFFER_FLAG_ERR in \field{flags}.
+\item The driver and device MUST follow requirements about buffer
+  ownership explained in \ref{sec:Device Types / Video Device / Device
+    Operation / Buffer lifecycle}.
+\end{itemize*}
+
+\item[VIRTIO_VIDEO_CMD_STREAM_DRAIN] Ask the device to push all the
+  queued buffers through the pipeline.
+
+\begin{lstlisting}
+struct virtio_video_stream_drain {
+        struct virtio_video_cmd_hdr hdr;
+};
+\end{lstlisting}
+
+\begin{itemize*}
+\item While the device is processing a VIRTIO_VIDEO_CMD_STREAM_DRAIN
+  command, the device MUST return
+  VIRTIO_VIDEO_RESP_ERR_INVALID_OPERATION for incoming commands of
+  VIRTIO_VIDEO_CMD_RESOURCE_QUEUE for input buffers and
+  VIRTIO_VIDEO_CMD_STREAM_DRAIN.
+\item If the processing was stopped due to
+  VIRTIO_VIDEO_CMD_QUEUE_CLEAR, the device MUST respond with
+  VIRTIO_VIDEO_RESP_OK_NODATA as a response type and
+  VIRTIO_VIDEO_BUFFER_FLAG_ERR in \field{flags}.
+\end{itemize*}
+
+\item[VIRTIO_VIDEO_CMD_QUEUE_CLEAR] Return already queued
+  buffers back from the input or the output queue of the device. The
+  device SHOULD return all of the buffers from the respective queue as
+  soon as possible without pushing the buffers through the processing
+  pipeline.
+
+\begin{lstlisting}
+struct virtio_video_resource_queue_clear {
+        struct virtio_video_cmd_hdr hdr;
+        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+        u8 padding[4];
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{queue_type}] queue type.
+\end{description}
+
+While the device is processing a VIRTIO_VIDEO_CMD_QUEUE_CLEAR command,
+the device MUST return VIRTIO_VIDEO_RESP_ERR_INVALID_OPERATION for
+incoming commands of VIRTIO_VIDEO_CMD_RESOURCE_QUEUE,
+VIRTIO_VIDEO_CMD_STREAM_DRAIN, and VIRTIO_VIDEO_CMD_QUEUE_CLEAR.
+
+\end{description}
+
+\paragraph{Device Operation: Handle stream parameters}
+
+\begin{itemize*}
+\item Use VIRTIO_VIDEO_CMD_GET_PARAMS to get the current stream
+  parameters for input and output streams from the device.
+\item Use VIRTIO_VIDEO_CMD_SET_PARAMS to provide new stream parameters
+  to the device.
+\item After setting stream parameters, the driver may issue
+  VIRTIO_VIDEO_CMD_GET_PARAMS as some parameters of both input and
+  output can be changed implicitly by the device during the set
+  operation.
+\end{itemize*}
+
+\begin{description}
+\item[VIRTIO_VIDEO_CMD_GET_PARAMS] Get parameters of the input or the
+  output of a stream.
+
+\begin{lstlisting}
+struct virtio_video_plane_format {
+        le32 plane_size;
+        le32 stride;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{plane_size}] size of the plane in bytes.
+\item[\field{stride}] stride used for the plane in bytes.
+\end{description}
+
+\begin{lstlisting}
+struct virtio_video_crop {
+        le32 left;
+        le32 top;
+        le32 width;
+        le32 height;
+};
+
+struct virtio_video_params {
+        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+        le32 format; /* One of VIRTIO_VIDEO_FORMAT_* types */
+        le32 frame_width;
+        le32 frame_height;
+        le32 min_buffers;
+        le32 max_buffers;
+        struct virtio_video_crop crop;
+        le32 frame_rate;
+        le32 num_planes;
+        struct virtio_video_plane_format plane_formats[VIRTIO_VIDEO_MAX_PLANES];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{frame_width}] the value to get/set.
+\item[\field{frame_height}] the value to get/set.
+\item[\field{pixel_format}] the value to get/set.
+\item[\field{min_buffers}] minimum buffers required to handle the
+  format (r/o).
+\item[\field{max_buffers}] maximum buffers required to handle the
+  format (r/o).
+\item[\field{crop}] cropping (composing) rectangle.
+\item[\field{frame_rate}] the value to get/set.
+\item[\field{num_planes}] number of planes used to store pixel data
+(r/o).
+\item[\field{plane_formats}] description of each plane.
+\end{description}
+
+\begin{lstlisting}
+struct virtio_video_get_params {
+        struct virtio_video_cmd_hdr hdr;
+        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+        u8 padding[4];
+};
+
+struct virtio_video_get_params_resp {
+        struct virtio_video_cmd_hdr hdr;
+        struct virtio_video_params params;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{queue_type}] queue type.
+\item[\field{params}] parameter values.
+\end{description}
+
+\item[VIRTIO_VIDEO_CMD_SET_PARAMS] Change parameters of a stream.
+
+\begin{lstlisting}
+struct virtio_video_set_params {
+        struct virtio_video_cmd_hdr hdr;
+        struct virtio_video_params params;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{params}] parameters to set.
+\end{description}
+
+Setting stream parameters might have side effects within the device.
+For example, the device MAY perform alignment of width and height,
+change the number of planes it uses for the format, or do whatever
+changes that are required to continue normal operation using the
+updated parameters. It is up to the driver to check the parameter set
+after the VIRTIO_VIDEO_CMD_SET_PARAMS request has been issued.
+\end{description}
+
+\paragraph{Device Operation: Handle control values}
+
+The driver can query, get and set control values. Though control
+values are associated with a video stream like stream parameters,
+supported values differ depending on the device capabilities and
+formats of videos being processed.
+
+\subparagraph{Commands for controls}
+
+\begin{description}
+\item[VIRTIO_VIDEO_CMD_QUERY_CONTROL] Query supported control values.
+
+\begin{lstlisting}
+struct virtio_video_query_control {
+        struct virtio_video_cmd_hdr hdr;
+        le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
+        u8 padding[4];
+};
+
+struct virtio_video_query_control_resp {
+        struct virtio_video_cmd_hdr hdr;
+        /* Followed by one of struct virtio_video_query_control_resp_* */
+};
+\end{lstlisting}
+
+If the device supports a given control, the device MUST return a
+struct that indicates supported control values after sending
+\field{virtio_video_query_control_resp}. The struct used as the
+response differs depending on the value of requested \field{control}.
+Otherwise, the device MUST report an error with
+VIRTIO_VIDEO_RESP_UNSUPPORTED_CONTROL.
+
+\item[VIRTIO_VIDEO_CMD_GET_CONTROL] Get a control value.
+
+\begin{lstlisting}
+struct virtio_video_get_control {
+        struct virtio_video_cmd_hdr hdr;
+        le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
+        u8 padding[4];
+};
+
+struct virtio_video_get_control_resp {
+        struct virtio_video_cmd_hdr hdr;
+        /* Followed by one of struct virtio_video_control_val_* */
+};
+\end{lstlisting}
+
+If the device supports a given control and a control value is
+available, the device MUST return a control value after
+\field{virtio_video_get_control_resp}.
+The struct used as the response differs depending on the value of
+requested as \field{control}. If the given control is unsupported, the
+device MUST report an error with
+VIRTIO_VIDEO_RESP_UNSUPPORTED_CONTROL.
+
+\item[VIRTIO_VIDEO_CMD_SET_CONTROL] Set a control value.
+
+\begin{lstlisting}
+struct virtio_video_set_control {
+        struct virtio_video_cmd_hdr hdr;
+        le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
+        u8 padding[4];
+        /* Followed by one of struct virtio_video_control_val_* */
+};
+
+struct virtio_video_set_control_resp {
+        struct virtio_video_cmd_hdr hdr;
+};
+\end{lstlisting}
+
+The driver MUST set \field{control} in
+\field{virtio_video_set_control} and send a corresponding struct after
+it. If the given control is unsupported, the device MUST report an
+error with VIRTIO_VIDEO_RESP_UNSUPPORTED_CONTROL.
+\end{description}
+
+\subparagraph{Types of controls}
+
+The types of controls are defined as follows:
+\begin{lstlisting}
+enum virtio_video_control_type {
+        VIRTIO_VIDEO_CONTROL_BITRATE = 1,
+        VIRTIO_VIDEO_CONTROL_PROFILE,
+        VIRTIO_VIDEO_CONTROL_LEVEL,
+};
+\end{lstlisting}
+
+\begin{description}
+\item[VIRTIO_VIDEO_CONTROL_BITRATE] Bitrate of video. (Only for the
+  encoder device.)
+
+The driver can VIRTIO_VIDEO_CMD_GET_CONTROL and
+VIRTIO_VIDEO_CMD_SET_CONTROL to get and set a bitrate for encoding
+respectively.
+The following \field{virtio_video_control_val_bitrate} is used when
+the device returns a value as a response of
+VIRTIO_VIDEO_CMD_GET_CONTROL and when the driver specifies a value to
+be set by VIRTIO_VIDEO_CMD_SET_CONTROL.
+\begin{lstlisting}
+struct virtio_video_control_val_bitrate {
+        le32 bitrate;
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\item[VIRTIO_VIDEO_CONTROL_PROFILE] Profile of a compressed video
+  stream.
+
+VIRTIO_VIDEO_CONTROL_PROFILE is used to handle profiles, which
+represent sets of cabalities for several compressed formats such as
+H.264 and VP9. The enum representing profiles are defined as follows:
+\begin{lstlisting}
+enum virtio_video_profile {
+        /* H.264 */
+        VIRTIO_VIDEO_PROFILE_H264_MIN = 0x100,
+        VIRTIO_VIDEO_PROFILE_H264_BASELINE = VIRTIO_VIDEO_PROFILE_H264_MIN,
+        VIRTIO_VIDEO_PROFILE_H264_MAIN,
+        VIRTIO_VIDEO_PROFILE_H264_EXTENDED,
+        VIRTIO_VIDEO_PROFILE_H264_HIGH,
+        VIRTIO_VIDEO_PROFILE_H264_HIGH10PROFILE,
+        VIRTIO_VIDEO_PROFILE_H264_HIGH422PROFILE,
+        VIRTIO_VIDEO_PROFILE_H264_HIGH444PREDICTIVEPROFILE,
+        VIRTIO_VIDEO_PROFILE_H264_SCALABLEBASELINE,
+        VIRTIO_VIDEO_PROFILE_H264_SCALABLEHIGH,
+        VIRTIO_VIDEO_PROFILE_H264_STEREOHIGH,
+        VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
+        VIRTIO_VIDEO_PROFILE_H264_MAX = VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
+
+        /* HEVC */
+        VIRTIO_VIDEO_PROFILE_HEVC_MIN = 0x200,
+        VIRTIO_VIDEO_PROFILE_HEVC_MAIN = VIRTIO_VIDEO_PROFILE_HEVC_MIN,
+        VIRTIO_VIDEO_PROFILE_HEVC_MAIN10,
+        VIRTIO_VIDEO_PROFILE_HEVC_MAIN_STILL_PICTURE,
+        VIRTIO_VIDEO_PROFILE_HEVC_MAX =
+                VIRTIO_VIDEO_PROFILE_HEVC_MAIN_STILL_PICTURE,
+
+        /* VP8 */
+        VIRTIO_VIDEO_PROFILE_VP8_MIN = 0x300,
+        VIRTIO_VIDEO_PROFILE_VP8_PROFILE0 = VIRTIO_VIDEO_PROFILE_VP8_MIN,
+        VIRTIO_VIDEO_PROFILE_VP8_PROFILE1,
+        VIRTIO_VIDEO_PROFILE_VP8_PROFILE2,
+        VIRTIO_VIDEO_PROFILE_VP8_PROFILE3,
+        VIRTIO_VIDEO_PROFILE_VP8_MAX = VIRTIO_VIDEO_PROFILE_VP8_PROFILE3,
+
+        /* VP9 */
+        VIRTIO_VIDEO_PROFILE_VP9_MIN = 0x400,
+        VIRTIO_VIDEO_PROFILE_VP9_PROFILE0 = VIRTIO_VIDEO_PROFILE_VP9_MIN,
+        VIRTIO_VIDEO_PROFILE_VP9_PROFILE1,
+        VIRTIO_VIDEO_PROFILE_VP9_PROFILE2,
+        VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
+        VIRTIO_VIDEO_PROFILE_VP9_MAX = VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
+};
+\end{lstlisting}
+
+The driver can query supported profiles for a compressed format by
+VIRTIO_VIDEO_CMD_QUERY_CONTROL command with
+\field{virtio_video_query_control_profile}. If the device supports the
+given format and the format's profiles are listed in \field{enum
+  virtio_video_profile}, the device MUST returns a list of supported
+profiles as a response
+\field{virtio_video_query_control_resp_profile}.
+\begin{lstlisting}
+struct virtio_video_query_control_profile {
+        le32 format; /* One of VIRTIO_VIDEO_FORMAT_* */
+        u8 padding[4];
+};
+
+struct virtio_video_query_control_resp_profile {
+        le32 num;
+        u8 padding[4];
+        /* Followed by an array le32 profiles[] */
+};
+\end{lstlisting}
+
+The device and the driver use \field{virtio_video_control_val_profile}
+for VIRTIO_VIDEO_CMD_GET_CONTROL and VIRTIO_VIDEO_CMD_SET_CONTROL.
+\begin{lstlisting}
+struct virtio_video_control_val_profile {
+        le32 profile;
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\item[VIRTIO_VIDEO_CONTROL_LEVEL] Level of a compressed video stream.
+
+VIRTIO_VIDEO_CONTROL_LEVEL is used to handle levels of video stream.
+Levels are defined for some compressed video formats to specify sets
+of constraints that indicate a degree of required decoder performance.
+The enum representing levels are defined as follows:
+\begin{lstlisting}
+enum virtio_video_level {
+        /* H.264 */
+        VIRTIO_VIDEO_LEVEL_H264_MIN = 0x100,
+        VIRTIO_VIDEO_LEVEL_H264_1_0 = VIRTIO_VIDEO_LEVEL_H264_MIN,
+        VIRTIO_VIDEO_LEVEL_H264_1_1,
+        VIRTIO_VIDEO_LEVEL_H264_1_2,
+        VIRTIO_VIDEO_LEVEL_H264_1_3,
+        VIRTIO_VIDEO_LEVEL_H264_2_0,
+        VIRTIO_VIDEO_LEVEL_H264_2_1,
+        VIRTIO_VIDEO_LEVEL_H264_2_2,
+        VIRTIO_VIDEO_LEVEL_H264_3_0,
+        VIRTIO_VIDEO_LEVEL_H264_3_1,
+        VIRTIO_VIDEO_LEVEL_H264_3_2,
+        VIRTIO_VIDEO_LEVEL_H264_4_0,
+        VIRTIO_VIDEO_LEVEL_H264_4_1,
+        VIRTIO_VIDEO_LEVEL_H264_4_2,
+        VIRTIO_VIDEO_LEVEL_H264_5_0,
+        VIRTIO_VIDEO_LEVEL_H264_5_1,
+        VIRTIO_VIDEO_LEVEL_H264_MAX = VIRTIO_VIDEO_LEVEL_H264_5_1,
+};
+\end{lstlisting}
+
+The driver can query supported levels for a compressed format by
+VIRTIO_VIDEO_CMD_QUERY_CONTROL command with
+\field{virtio_video_query_control_level}. If the device supports the
+given format and the format's levels are listed in \field{enum
+  virtio_video_level}, the device MUST return a list of supported
+levels as a response \field{virtio_video_query_control_resp_level}.
+\begin{lstlisting}
+struct virtio_video_query_control_level {
+        le32 profile; /* One of VIRTIO_VIDEO_PROFILE_* */
+        u8 padding[4];
+};
+
+struct virtio_video_query_control_resp_level {
+        le32 num;
+        u8 padding[4];
+        /* Followed by an array le32 level[] */
+};
+\end{lstlisting}
+
+The device and the driver use \field{virtio_video_control_val_level}
+for VIRTIO_VIDEO_CMD_GET_CONTROL and VIRTIO_VIDEO_CMD_SET_CONTROL.
+\begin{lstlisting}
+struct virtio_video_control_val_level {
+        le32 level;
+        u8 padding[4];
+};
+\end{lstlisting}
+\end{description}
+
+\subsubsection{Buffer lifecycle}
+\label{sec:Device Types / Video Device / Device Operation / Buffer
+  lifecycle}
+
+The state machine in Figure~\ref{fig:buffer-lifecycle} shows the life
+cycle of a video buffer.
+
+\begin{figure}[h]
+  \centering
+  \includegraphics[width=\textwidth]{images/generated/video-buffer-lifecycle.png}
+  \caption{Lifecycle of a buffer}
+  \label{fig:buffer-lifecycle}
+\end{figure}
+
+\drivernormative{\subparagraph}{Buffer lifecycle}{Device Types / Video
+  Device / Device Operation / Device Operation: Buffer lifecycle}
+
+The following table shows whether the driver can read or write each
+buffer in each state in Figure~\ref{fig:buffer-lifecycle}. The driver
+MUST not read or write buffers in the state that doesn't permit.
+\begin{center}
+  \begin{tabular}{|c|c|c|}
+    \hline
+    State & Input buffers & Output buffers \\
+    \hline
+    Created  & Read / Write & Read \\
+    Queued   & -            & -    \\
+    Dequeued & Read / Write & Read \\
+    \hline
+  \end{tabular}
+\end{center}
+
+\devicenormative{\subparagraph}{Buffer lifecycle}{Device Types / Video
+  Device / Device Operation / Device Operation: Buffer lifecycle}
+
+The following table shows whether the device can read or write each
+buffer in each state in Figure~\ref{fig:buffer-lifecycle}. The device
+MUST not read or write buffers in the state that doesn't permit.
+\begin{center}
+  \begin{tabular}{ |c|c|c| }
+    \hline
+    State & Input buffers & Output buffers \\
+    \hline
+    Created  & -    & - \\
+    Queued   & Read & Read / Write \\
+    Dequeued & -    & Read \\
+    \hline
+  \end{tabular}
+\end{center}
+
+\subsubsection{Event Virtqueue}
+
+While processing buffers, the device can send asynchronous event
+notifications to the driver. The behaviour depends on the exact
+stream. For example, the decoder device sends a resolution change
+event when it encounters new resolution metadata in the stream.
+
+The device can report events on the event queue. The driver initially
+populates the queue with device-writeable buffers. When the device
+needs to report an event, it fills a buffer and notifies the driver.
+The driver consumes the report and adds a new buffer to the virtqueue.
+
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
+\item[\field{event_type}] type of the triggered event .
+\item[\field{stream_id}] id of the source stream.
+\end{description}
+
+The device MUST send VIRTIO_VIDEO_EVENT_DECODER_RESOLUTION_CHANGED
+whenever it encounters new resolution data in the stream. This
+includes the case of the initial device configuration after metadata
+has been parsed and the case of dynamic resolution change.
-- 
2.25.0.341.g760bfbb309-goog

