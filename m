Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50E92FCCC6
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 09:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730774AbhATIe4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 03:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730910AbhATIcd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 03:32:33 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66EFC061575
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 00:31:52 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id g15so1759739pjd.2
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 00:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P/rW+rEVhQ3ZyMMC4FNdhLnFWwERJgyojGVrcUSjtkI=;
        b=EYoN1KClrLJ03bKWhzFIBooKdzngNHO9FXKidHHk8Ao9JxUXts9vKe3xNsqkcBSvxL
         b3GRoN19onygOoKL2JTc17AXartK7MIe1w1v0z6ZBhqG6I7AtxKaq+aR3avinAP89C8r
         BXw5jG/hzrRh+adEp9M2tEifDY0lo2xg5Jqwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P/rW+rEVhQ3ZyMMC4FNdhLnFWwERJgyojGVrcUSjtkI=;
        b=krbsJWrmVVESg+JVEgoq6xWUnHtY6QcLSMst0lEula4nerFaefZcullhH4mvk+9kRb
         QYXuteeftPhf/AXXZ2ChA91SAU8pzSj0vfLxtUp9VVnQonbRYLl/NtN2EVWOTdxYoad0
         NCaebCjfwP2ssgnmQpzMUe/f8MxrrmaDIbSIWXOe23Jxw+OdnR+oEcq2AlXs9hhueCGm
         4TeSc6/MJ/oT8dUxfO9PGSivamJOt17WrzjZPF2I86O3Kvkjcw+781caHO1XzQTROzis
         fGbLP+Ysl9vuAgw5Y64YmN7ue0KU7zaq/XXgmwwX/zW7mo1lM3lbviJbyuwWPMbFdyTs
         u9lA==
X-Gm-Message-State: AOAM530hxb3l7LR0NVwQ4z54bs32sslCI4J0PchRWnDI0pmuoyGwzl8x
        5Y17DEUMSdN4uboj3xsdaMXwfw==
X-Google-Smtp-Source: ABdhPJyT/NH3mjC8ZpyaWLv/bJ2Zq00JpCoj8g0EycnDXxeKqB7w3u7a9pBPnBimq4lHaLCd9C1Fag==
X-Received: by 2002:a17:90a:bd12:: with SMTP id y18mr4577391pjr.146.1611131511920;
        Wed, 20 Jan 2021 00:31:51 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id n15sm1750448pjk.57.2021.01.20.00.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 00:31:50 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     virtio-dev@lists.oasis-open.org
Cc:     linux-media@vger.kernel.org, alexlau@chromium.org, daniel@ffwll.ch,
        dgreid@chromium.org, dstaessens@chromium.org, egranata@google.com,
        kraxel@redhat.com, posciak@chromium.org,
        spice-devel@lists.freedesktop.org, stevensd@chromium.org,
        tfiga@chromium.org, uril@redhat.com, kiran.pawar@opensynergy.com,
        enric.balletbo@collabora.com, alex.bennee@linaro.org,
        Matti.Moell@opensynergy.com,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v5] virtio-video: Add virtio video device specification
Date:   Wed, 20 Jan 2021 17:31:43 +0900
Message-Id: <20210120083143.766189-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Keiichi Watanabe <keiichiw@chromium.org>

The virtio video encoder and decoder devices are virtual devices that
support video encoding and decoding respectively. Although they are
different devices, they use the same protocol.

Signed-off-by: Dmitry Sepp <dmitry.sepp@opensynergy.com>
Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
Here is the new revision of the virtio-video specification. Compared to
v4 some extra simplification work has been performed, and all stream
settings are now consolidated under the parameters. Hopefully this can
be used as the basis to write a new version of the Linux driver and
virtual device, or maybe even to drop that RFC tag! :)

Full PDF: https://drive.google.com/file/d/1Lqjpcntj6ydLtrHPhbMbvq0oVIevGatj/view?usp=sharing
Only video section: https://drive.google.com/file/d/1dGzYGCV-xrO-AYqMbMsHBrJh_CvLDLMA/view?usp=sharing

 content.tex                       |    1 +
 images/video-buffer-lifecycle.dot |   15 +
 make-setup-generated.sh           |    9 +
 virtio-video.tex                  | 1308 +++++++++++++++++++++++++++++
 4 files changed, 1333 insertions(+)
 create mode 100644 images/video-buffer-lifecycle.dot
 create mode 100644 virtio-video.tex

diff --git a/content.tex b/content.tex
index 620c0e2..8b8bfed 100644
--- a/content.tex
+++ b/content.tex
@@ -6507,6 +6507,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 \input{virtio-iommu.tex}
 \input{virtio-sound.tex}
 \input{virtio-mem.tex}
+\input{virtio-video.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/images/video-buffer-lifecycle.dot b/images/video-buffer-lifecycle.dot
new file mode 100644
index 0000000..d5ef184
--- /dev/null
+++ b/images/video-buffer-lifecycle.dot
@@ -0,0 +1,15 @@
+digraph {
+  graph [ rankdir = LR, layout = dot ];
+
+  init [label="Init", shape=circle]
+  attached [label="Attached", shape=circle]
+  queued [label="Queued", shape=circle]
+
+  init -> attached [label="ATTACH"]
+
+  attached -> queued [label="QUEUE"]
+  queued -> attached [label="Processing\n complete"]
+
+  attached -> init [label="CLEAR"]
+  queued -> init [label="CLEAR"]
+}
diff --git a/make-setup-generated.sh b/make-setup-generated.sh
index f15d148..073b094 100755
--- a/make-setup-generated.sh
+++ b/make-setup-generated.sh
@@ -61,3 +61,12 @@ cat > setup-generated.tex <<EOF
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
+
diff --git a/virtio-video.tex b/virtio-video.tex
new file mode 100644
index 0000000..9adac0d
--- /dev/null
+++ b/virtio-video.tex
@@ -0,0 +1,1308 @@
+\section{Video Device}\label{sec:Device Types / Video Device}
+
+The virtio video encoder and decoder devices are virtual devices that support
+video encoding and decoding, respectively. Despite being different devices, they
+use the same protocol.
+
+% TODO: be more precise about the sync or async nature of commands/responses.
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
+\item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (0)] Guest pages can be used as the
+  backing memory of video buffers.
+\item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (1)] The device can use non-contiguous
+  memory for video buffers. Without this flag, the driver and device MUST use
+  video buffers that are contiguous for the device.
+\item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (2)] Objects exported by another
+  virtio device can be used as the backing memory of video buffers.
+\end{description}
+
+The device MUST present at least one of VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES or
+VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT, since the absence of both bits would mean
+that no memory can be used at all for buffers.
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
+\begin{description}
+\item[\field{version}] is the protocol version that the device understands. The
+  device MUST set this to 0.
+\item[\field{caps_length}] is the length in bytes of a device-writable
+  descriptor that can receive the response of
+  VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS. The device MUST set it to a sufficiently
+  large value.
+\end{description}
+
+\subsection{Device Initialization}
+\label{sec:Device Types / Video Device / Device Initialization}
+
+\devicenormative{\subsubsection}{Device Initialization}{Device Types /
+  Video Device / Device Initialization}
+
+The driver SHOULD query the device capabilities using the
+VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command.
+
+\subsection{General Device Operation}
+\label{sec:Device Types / Video Device / Device Operation}
+
+The driver requests a new stream to be created using
+VIRTIO_VIDEO_CMD_STREAM_CREATE.
+
+It then invokes VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS to retrieve the default
+parameters of the stream, modifies them to fit its needs using the device
+capabilities information queried during initialization, and calls
+VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS to apply them. The device might change the
+requested parameters to suit its own limitation, so the driver MUST check that
+the applied parameters are still acceptable, and keep adjusting them with
+subsequent calls to VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS until a mutually
+satisfying configuration is found.
+
+Each stream has one input and one output queue. The input queue accepts buffers
+in the configured input format (e.g. bitstream format for a decoder) and returns
+them once they are done being processed. The output queue accepts buffers in the
+configured output format (e.g. image format for a decoder) and will write the
+result of the decoding or encoding operation to them, i.e. a frame for a
+decoder, or a chunk of encoded stream for an encoder. There is no direct 1:1
+relationship between input and output buffers, meaning that queueing one input
+buffer can result in zero, one, or more output buffers to be emitted. The driver
+can think of the queues as operating independently from each other.
+
+Once the stream is configured, the driver attaches backing memory to buffer
+resources using VIRTIO_VIDEO_CMD_RESOURCE_ATTACH, and queues them using
+VIRTIO_VIDEO_CMD_RESOURCE_QUEUE. The device will respond once the buffer is
+processed, which then allows the driver to queue that buffer again.
+
+The driver has control over the stream: it can request for all queued input
+buffers so far to be processed and receive a notification when they are (useful
+at the end of a stream) using VIRTIO_VIDEO_CMD_STREAM_DRAIN, or abandon all
+pending operations (in order to, say, seek to a different point) with
+VIRTIO_VIDEO_CMD_STREAM_QUEUE_CLEAR.
+
+Sometimes the device will detect events that require intervention from the
+driver and signal them. One such event is
+VIRTIO_VIDEO_EVENT_DECODER_RESOLUTION_CHANGED for a decoder, meaning that the
+resolution of the stream has changed, and that the driver might need to
+reallocate the backing memory for its buffers.
+
+Once a stream is completed, it can be closed using
+VIRTIO_VIDEO_CMD_STREAM_DESTROY.
+
+The remainder of this section describes all the commands and events mentioned
+above.
+
+\subsubsection{Command Virtqueue}
+
+The command virtqueue is used for the driver to send commands to the device, and
+receive the device's response. Commands MUST be written by the driver and their
+responses MUST be written by the device in the next device-writable descriptor.
+
+Different structure layouts are used for each command and response. A command
+structure starts with the requested command code, defined as follows:
+\begin{lstlisting}
+enum virtio_video_cmd_type {
+        /* Global */
+        VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS = 0x100,
+
+        /* Stream */
+        VIRTIO_VIDEO_CMD_STREAM_CREATE = 0x200,
+        VIRTIO_VIDEO_CMD_STREAM_DESTROY,
+        VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS,
+        VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS,
+        VIRTIO_VIDEO_CMD_STREAM_DRAIN,
+
+        /* Queue */
+        VIRTIO_VIDEO_CMD_QUEUE_CLEAR = 0x300,
+
+        /* Resource*/
+        VIRTIO_VIDEO_CMD_RESOURCE_ATTACH = 0x400,
+        VIRTIO_VIDEO_CMD_RESOURCE_QUEUE,
+};
+\end{lstlisting}
+
+A response structure starts with the result of the requested command, defined as
+follows:
+\begin{lstlisting}
+enum virtio_video_result {
+         /* Success */
+         VIRTIO_VIDEO_RESULT_OK = 0x000,
+
+         /* Error */
+         VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION = 0x100,
+         VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID,
+         VIRTIO_VIDEO_RESULT_ERR_INVALID_RESOURCE_ID,
+         VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT,
+         VIRTIO_VIDEO_RESULT_ERR_CANCELED,
+         VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY,
+};
+\end{lstlisting}
+
+For response structures carrying an error code, the rest of the structure is
+considered invalid and must be ignored by the driver. Only response structures
+carrying VIRTIO_VIDEO_RESULT_OK shall be examined further.
+
+\paragraph{Device capabilities}
+
+\subparagraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
+Retrieve device capabilities.
+
+The driver sends this command with \field{struct
+virtio_video_device_query_caps}:
+\begin{lstlisting}
+struct virtio_video_device_query_caps {
+        le32 cmd_type;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be set to VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
+\end{description}
+
+The total size of the device response to this command MUST be equal to
+\field{caps_length} bytes, as reported by the device configuration. The device
+responds with \field{struct virtio_video_device_query_caps_resp}:
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
+\item[\field{result}] is
+  \begin{description*}
+    \item[VIRTIO_VIDEO_RESULT_OK] if the operation succeeded,
+    \item[VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY] if the descriptor was smaller
+    than the defined \field{caps_length} in the video device configuration.
+  \end{description*}
+\item[\field{num_image_formats}] is the number of supported image formats.
+\item[\field{num_bitstream_formats}] is the number of supported bitstream
+  formats.
+\end{description}
+
+The device MUST write two arrays of \field{struct
+  virtio_video_image_format_desc} and \field{struct
+  virtio_video_bitstream_format_desc} following the \field{struct
+  virtio_video_device_query_caps_resp}. The lengths of these arrays MUST be
+\field{num_image_formats} and \field{num_bitstream_formats} respectively.
+
+\subparagraph{Image format description}
+
+The image format description \field{virtio_video_image_format_desc} is defined
+as follows:
+\begin{lstlisting}
+enum virtio_video_planes_layout {
+        VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER = 0,
+        VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS,
+};
+
+struct virtio_video_image_format_desc {
+         le32 format; /* VIRTIO_VIDEO_IMAGE_FORMAT_* */
+         le32 planes_layouts; /* Bitmask with VIRTIO_VIDEO_PLANES_LAYOUT_* */
+         le32 plane_align;
+         le32 num_format_frames;
+         /**
+          * Followed by
+          * struct virtio_video_image_format_frame frames[num_format_frames];
+          */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{format}] specifies an image format. The device MUST set one of the
+  variants of \field{enum virtio_video_image_format_frame}. See \ref{sec:Device
+  Types / Video Device / Supported formats} for a list of all valid formats.
+\item[\field{planes_layouts}] is a bitmask representing the set of plane layout
+  types that the device supports.
+  \begin{description}
+  \item[\field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER}] The device expects the
+    planes of a frame to be laid out one after another in the same buffer.
+  \item[\field{VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS}] The device expects the
+    planes of a frame to be laid out in separate buffers.
+  \end{description}
+\item[\field{plane_align}] is the plane alignment the device requires when
+  multiple planes are located in the same buffer. This field is valid only if
+  \field{planes_layouts} has the
+  \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit, and MUST be set to zero
+  otherwise.
+\item[\field{num_format_frames}] is the number of
+  \field{virtio_video_image_format_frame} that follow.
+\end{description}
+
+The frame information \field{virtio_video_image_format_frame} is defined as
+follows:
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
+\item[\field{width}] represents the range of widths supported by the device for
+this format.
+\item[\field{height}] represents the range of heights supported by the device
+for this format.
+\item[\field{num_rates}] is the length of the \field{frame_rates[]} array.
+% TODO we cannot support fractional rates (e.g. 29.999997 fps) with this
+% representation, can we?
+\item[\field{frame_rates}] is the set of frame rates ranges (in frames per
+  second) supported by the device for this format.
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
+  variants of \field{enum virtio_video_codec}. See \ref{sec:Device Types / Video
+  Device / Supported formats} for a list of all supported codecs formats.
+\item[\field{num_variants}] is the number of \field{union
+  virtio_video_codec_params} values that follow. If \field{union
+  virtio_video_codec_params} has a field corresponding to the specified
+  \field{codec}, this value MUST be a positive integer. Otherwise, it MUST be 0.
+  See \ref{sec:Device Types / Video Device / Supported formats} for a complete
+  description of the variants.
+\item[\field{variants}] is a list of supported variants of the given
+  \field{codec}. Only the field corresponding to the given \field{codec} is
+  valid for each element.
+\end{description}
+
+\paragraph{Stream commands}
+
+\subparagraph{VIRTIO_VIDEO_CMD_STREAM_CREATE}
+Create a video stream using the device.
+
+The driver sends this command with \field{struct virtio_video_stream_create}:
+\begin{lstlisting}
+enum virtio_video_mem_type {
+       VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES = 1,
+       VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT,
+};
+
+struct virtio_video_stream_create {
+        le32 cmd_type;
+        le32 in_mem_type; /* VIRTIO_VIDEO_MEM_TYPE_* */
+        le32 out_mem_type; /* VIRTIO_VIDEO_MEM_TYPE_* */
+        le32 codec; /* VIRTIO_VIDEO_CODEC_* */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be set to VIRTIO_VIDEO_CMD_STREAM_CREATE.
+\item[\field{in_mem_type, out_mem_type}] is the type of buffer management for
+  input/output buffers.
+\begin{description}
+\item[\field{VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES}] Use guest pages. The driver
+  MUST NOT use this value if the feature bit VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES
+  is not set.
+\item[\field{VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT}] Use object exported by
+  another virtio device. The driver MUST NOT use this value if the feature bit
+  VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT is not set.
+\end{description}
+\item[\field{codec}] is the video codec that will be used with this stream (i.e.
+  as input for a decoder, and as output for an encoder). The driver MUST set it
+  to one of the variants of \field{enum virtio_video_codec} (see \ref{sec:Device
+  Types / Video Device / Supported formats} for a list of supported values).
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
+\item[\field{result}] is
+  \begin{description*}
+    \item[VIRTIO_VIDEO_RESULT_OK] if the operation succeeded,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT] if the memory type
+    specified for \field{in_mem_type} or \field{out_mem_type} is not supported,
+    or if an unsupported codec has been specified in \field{codec}.
+    \item[VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY] if the limit of simultaneous
+    streams has been reached on the device and no more can be created.
+  \end{description*}
+\item[\field{stream_id}] is the ID of the created stream, allocated by the
+  device.
+\end{description}
+
+\subparagraph{VIRTIO_VIDEO_CMD_STREAM_DESTROY}
+Destroy a video stream and all its resources. Any activity on the stream is
+halted and all resources released by the time the response is received by the
+driver.
+
+The driver sends this command with \field{struct virtio_video_stream_destroy}:
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
+The device responds with \field{struct virtio_video_stream_destroy_resp}:
+\begin{lstlisting}
+struct virtio_video_stream_destroy_resp {
+         le32 result; /* VIRTIO_VIDEO_RESULT_* */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] is
+  \begin{description*}
+    \item[VIRTIO_VIDEO_RESULT_OK] if the operation succeeded,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID] if the requested stream ID
+    does not exist.
+  \end{description*}
+\end{description}
+
+Before the device sends a response for VIRTIO_VIDEO_CMD_STREAM_DESTROY, it MUST
+respond with VIRTIO_VIDEO_RESULT_ERR_CANCELED to the following pending commands:
+\begin{itemize*}
+\item VIRTIO_VIDEO_CMD_RESOURCE_* on the input queue,
+\item VIRTIO_VIDEO_CMD_STREAM_DRAIN.
+\end{itemize*}
+
+\subparagraph{VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS}
+Obtain a stream's parameters.
+
+The driver sends this command with \field{struct
+  virtio_video_stream_get_params}:
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
+The device responds with \field{struct virtio_video_stream_get_params_resp}:
+\begin{lstlisting}
+struct virtio_video_stream_get_params_resp {
+    le32 result; /* VIRTIO_VIDEO_RESULT_* */
+    struct virtio_video_params params;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] is
+  \begin{description*}
+    \item[VIRTIO_VIDEO_RESULT_OK] if the operation succeeded,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID] if the requested stream
+    does not exist.
+  \end{description*}
+\item[\field{params}] contains the parameters of the requested stream.
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
+\begin{description}
+\item[\field{image_format}] is the image format used by the stream. It is set to
+  one of the variants of \field{enum virtio_video_image_format}.
+\item[\field{min_image_buffers}] is the minimum number of image buffers that the
+  device requires. The device MUST set this to a non-zero integer. For a decoder
+  device, the device MUST set this to the minimum number of buffers required to
+  decode the stream after it has obtained this information.
+\item[\field{max_image_buffers}] is the maximum number of image buffers that the
+  device can accept. The device MUST set this to an integer larger than or equal
+  to \field{min_image_buffers}.
+\item[\field{cur_image_buffers}] is the number of image buffers that the driver
+  can enqueue via VIRTIO_VIDEO_RESOURCE_QUEUE. The device MUST initially set
+  this field to \field{min_image_buffers}, and the driver CAN update it to a
+  value between \field{min_image_buffers} and \field{max_image_buffers}
+  included.
+\item[\field{width}] is the current width of frames in the stream.
+\item[\field{height}] is the current height of frames in the stream.
+\item[\field{crop}] is the current cropping rectangle for frames in the stream.
+\item[\field{frame_rate}] is the current frame rate.
+\item[\field{planes_layout}] specifies the plane layout of the frames. The
+  driver MUST set this to one of the variants of \field{enum
+  virtio_video_planes_layout} that is supported for the current image format.
+\item[\field{num_planes}] is the number of planes per frame. The device MUST set
+  this to 1 if \field{planes_layout} is
+  VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER.
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
+\item[plane_size] is the size of the plane in bytes.
+\item[stride] is the line stride.
+\item[offset] is an offset from the beginning of the buffer. This field is valid
+  only if \field{planes_layout} is VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER.
+\end{description}
+\item[\field{min_bitstream_buffers}] is the minimum number of bitstream buffers
+  that the device requires. The device MUST set this to a non-zero integer.
+\item[\field{max_bitstream_buffers}] is the maximum number of bitstream buffers
+  that the device can accept. The device MUST set this to an integer which is
+  larger than or equal to \field{min_bitstream_buffers}.
+\item[\field{cur_bitstream_buffers}] is the number of bitstream buffers that the
+  driver can enqueue via VIRTIO_VIDEO_RESOURCE_QUEUE. The device MUST initially
+  set this field to \field{min_bitstream_buffers}, and the driver CAN update it
+  to a value between \field{min_bitstream_buffers} and
+  \field{max_bitstream_buffers} included.
+\item[\field{min_bitrate}] is the minimum bitrate supported by the device. (only
+  for encoders)
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
+Note that the bitstream format is not represented in the parameters; that's
+because it is decided at the time of stream creation and does not change
+afterwards.
+
+After the device responds to VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS, it MUST
+keep responding the same value until one of the following events occurs:
+\begin{itemize}
+\item the driver sends VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS via commandq.
+\item the device reports VIRTIO_VIDEO_EVENT_DECODER_RESOLUTION_CHANGED
+via eventq.
+\end{itemize}
+
+\subparagraph{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+Update the parameters of a stream.
+
+The driver sends this command with \field{struct
+  virtio_video_stream_set_params}:
+\begin{lstlisting}
+struct virtio_video_stream_set_params {
+        le32 cmd_type;
+        le32 stream_id;
+        struct virtio_video_params params;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be set to VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS.
+\item[\field{stream_id}] is the ID of the stream whose parameters are to be
+  updated.
+\item[\field{params}] the new parameters requested by the driver.
+\end{description}
+
+The device responds with \field{struct virtio_video_stream_set_params_resp}:
+\begin{lstlisting}
+struct virtio_video_stream_set_params_resp {
+       le32 result; /* VIRTIO_VIDEO_RESULT_* */
+       struct virtio_video_params params;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] is
+  \begin{description*}
+    \item[VIRTIO_VIDEO_RESULT_OK] if the operation succeeded,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID] if the requested stream
+    does not exist,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION] is setting parameters is
+    not valid at the moment. Setting parameters is only valid when no drain or
+    clear operation is in progress.
+  \end{description*}
+\item[\field{params}] the updated stream parameters. Values may differ from the
+    requested one depending on the device's and codec capabilities, and values
+    that are not directly changed by the SET_PARAMS command may also be changed.
+    It is the responsibility of the driver to check all values for potential
+    changes and update its state accordingly.
+
+    The device MUST react to invalid or out-of-range parameters not by returning
+    an error, but by adjusting the invalid value to the closest valid value it
+    can support. Therefore, a successful result does not mean that all the
+    parameters have been applied as specified, and the driver still needs to
+    check the actual values set by the device and continue (or abort)
+    accordingly.
+\end{description}
+
+Not all parameters can be updated by the driver. Table~\ref{tab:set_params}
+lists the parameters that can be read and written by an encoder or decoder.
+
+\begin{table}[ht]
+  \centering
+  \begin{tabular}{|l|c|c|}
+  \hline
+  Parameter             & Decoder & Encoder \\
+  \hline
+  image_format          &   R/W   &   R/W   \\
+  min_image_buffers     &    R    &    R    \\
+  max_image_buffers     &    R    &    R    \\
+  cur_image_buffers     &   R/W   &   R/W   \\
+  width                 &   R/W   &   R/W   \\
+  height                &   R/W   &   R/W   \\
+  crop                  &   R/W   &   R/W   \\
+  frame_rate            &    R    &   R/W   \\
+  planes_layout         &   R/W   &   R/W   \\
+  num_planes            &    R    &    R    \\
+  plane_formats         &   R/W   &   R/W   \\
+  \hline
+  min_bitstream_buffers &    R    &    R    \\
+  max_bitstream_buffers &    R    &    R    \\
+  cur_bitstream_buffers &   R/W   &   R/W   \\
+  \hline
+  min_bitrate           &    -    &    R    \\
+  max_bitrate           &    -    &    R    \\
+  cur_bitrate           &    -    &   R/W   \\
+  rc_mode               &    -    &   R/W   \\
+  qp                    &    -    &   R/W   \\
+  \hline
+  \end{tabular}
+  \caption{Parameters that can be read or written by the driver, for encoder and decoder devices. "-" means that the value is not available and MUST NOT be accessed by the driver.}
+  \label{tab:set_params}
+\end{table}
+
+\subparagraph{VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+Complete processing all currently queued input buffers.
+
+VIRTIO_VIDEO_CMD_STREAM_DRAIN ensures that all sent
+VIRTIO_VIDEO_CMD_RESOURCE_QUEUE commands for input buffers have been processed
+by the device and that related output buffers are available to the driver.
+
+The driver sends this command with \field{struct virtio_video_stream_drain}:
+\begin{lstlisting}
+struct virtio_video_stream_drain {
+        le32 cmd_type;
+        le32 stream_id;
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be VIRTIO_VIDEO_CMD_STREAM_DRAIN.
+\item[\field{stream_id}] is a valid stream ID.
+\end{description}
+
+The device responds with \field{struct virtio_video_stream_drain_resp}:
+\begin{lstlisting}
+struct virtio_video_stream_drain_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] is
+  \begin{description*}
+    \item[VIRTIO_VIDEO_RESULT_OK] if the operation succeeded,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID] if the requested stream
+    does not exist,
+    \item[VIRTIO_VIDEO_RESULT_ERR_CANCELED] if the operation has been canceled by
+    a STREAM_QUEUE_CLEAR or STREAM_DESTROY operation.
+  \end{description*}
+\end{description}
+
+Before the device sends the response of a VIRTIO_VIDEO_CMD_STREAM_DRAIN command,
+it MUST process and respond to all of VIRTIO_VIDEO_CMD_RESOURCE_* commands for
+the input queue which are sent before the drain command, and produce all the
+corresponding output buffers. The driver is expected to keep queueing output
+buffers until it gets the response ; failure to do so may result in the device
+stalling as it awaits output buffers.
+
+While the device is processing a VIRTIO_VIDEO_CMD_STREAM_DRAIN command, it MUST
+return VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION to the following incoming
+commands:
+\begin{itemize*}
+\item VIRTIO_VIDEO_CMD_RESOURCE_* with an input buffer, or
+\item VIRTIO_VIDEO_CMD_STREAM_DRAIN.
+\end{itemize*}
+
+If the processing was stopped while draining due to a
+VIRTIO_VIDEO_CMD_QUEUE_CLEAR or VIRTIO_VIDEO_CMD_STREAM_DESTROY operation, the
+device MUST respond with VIRTIO_VIDEO_RESULT_ERR_CANCELED.
+
+\paragraph{Queue commands}
+
+\subparagraph{VIRTIO_VIDEO_CMD_QUEUE_CLEAR}
+Discard all pending resource commands for a given queue and detach all its
+resources.
+
+The driver sends this command with \field{struct virtio_video_queue_clear}:
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
+\item[\field{cmd_type}] MUST be VIRTIO_VIDEO_CMD_QUEUE_CLEAR.
+\item[\field{stream_id}] is a valid stream ID.
+\item[\field{queue_type}] is the queue to be cleared. This MUST be one of
+  variants of \field{enum virtio_video_queue_type}.
+\end{description}
+
+The device responds with \field{struct virtio_video_queue_clear_resp}:
+\begin{lstlisting}
+struct virtio_video_queue_clear_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{result}] is
+  \begin{description*}
+    \item[VIRTIO_VIDEO_RESULT_OK] if the operation succeeded,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID] if the requested stream
+    does not exist,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT] if the \field{queue_type}
+    parameter has a non-valid value.
+  \end{description*}
+\end{description}
+
+Before the device sends a response for VIRTIO_VIDEO_CMD_QUEUE_CLEAR, it MUST
+respond with VIRTIO_VIDEO_RESULT_ERR_CANCELED to the following pending commands:
+\begin{itemize*}
+\item VIRTIO_VIDEO_CMD_RESOURCE_* on the input queue,
+\item VIRTIO_VIDEO_CMD_STREAM_DRAIN.
+\end{itemize*}
+
+While the device is processing a VIRTIO_VIDEO_CMD_QUEUE_CLEAR, it MUST return
+VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION to the following incoming commands:
+\begin{itemize*}
+\item VIRTIO_VIDEO_CMD_STREAM_DRAIN,
+\item VIRTIO_VIDEO_CMD_QUEUE_CLEAR, or
+\item VIRTIO_VIDEO_CMD_RESOURCE_*.
+\end{itemize*}
+
+After completion of the command, all the resources previously attached to the
+queue using VIRTIO_VIDEO_CMD_RESOURCE_ATTACH will be detached. This means
+VIRTIO_VIDEO_CMD_RESOURCE_ATTACH must be called on each resource before it can
+be queued again.
+
+\paragraph{Resource commands}
+
+\subparagraph{VIRTIO_VIDEO_CMD_RESOURCE_ATTACH}
+Attach memory entries to use as a buffer for a given resource.
+
+The driver sends this command with \field{struct virtio_video_resource_attach}:
+\begin{lstlisting}
+struct virtio_video_resource_attach {
+        le32 cmd_type;
+        le32 stream_id;
+        le32 queue_type; /* VIRTIO_VIDEO_QUEUE_TYPE_* */
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
+\item[\field{resources}] specifies memory regions that will be attached. The
+  length of this array MUST be equal to \field{num_planes} in
+  \field{virtio_video_params}, as obtained via VIRTIO_VIDEO_GET_PARAMS.
+
+  The union \field{virtio_video_resource} is defined as follows:
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
+  \item[\field{result}] is
+  \begin{description*}
+    \item[VIRTIO_VIDEO_RESULT_OK] if the operation succeeded,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID] if the requested stream
+    does not exist,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT] if the \field{queue_type},
+    \field{resource_id}, or \field{resources} have an invalid value,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION] if the operation can not be
+    performed at the moment.
+  \end{description*}
+\end{description}
+
+VIRTIO_VIDEO_CMD_RESOURCE_ATTACH can only be called during the following times:
+
+\begin{itemize*}
+\item AFTER a VIRTIO_VIDEO_CMD_STREAM_CREATE and BEFORE invoking
+    VIRTIO_VIDEO_CMD_RESOURCE_QUEUE for the first time on the resource,
+\item AFTER a VIRTIO_VIDEO_CMD_QUEUE_CLEAR and BEFORE
+    VIRTIO_VIDEO_CMD_RESOURCE_QUEUE is called again on this resource.
+\end{itemize*}
+
+At any other time, the device MUST return
+VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION.
+
+This is to ensure that the device can rely on the fact that a given resource
+will always point to the same memory for as long as it may be used by the video
+device. For instance, a decoder may use returned decoded frames as reference
+frames and won't overwrite a resource until it is not needed. It is only before
+a stream is started and after a VIRTIO_VIDEO_CMD_QUEUE_CLEAR command is issued
+that we can be sure that all buffers won't be used in that way.
+
+\subparagraph{VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+Add a buffer to the device's queue.
+
+\begin{lstlisting}
+enum virtio_video_enqueue_flag {
+        VIRTIO_VIDEO_ENQUEUE_FLAG_FORCE_KEY_FRAME = 0,
+};
+
+struct virtio_video_resource_queue {
+        le32 cmd_type;
+        le32 stream_id;
+        le32 queue_type; /* VIRTIO_VIDEO_QUEUE_TYPE_* */
+        le32 resource_id;
+        le32 flags; /* Bitmask with VIRTIO_VIDEO_ENQUEUE_FLAG_* */
+        u8 padding[4];
+        le64 timestamp;
+        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
+};
+\end{lstlisting}
+\begin{description}
+\item[\field{cmd_type}] MUST be set to VIRTIO_VIDEO_CMD_RESOURCE_QUEUE.
+\item[\field{stream_id}] is the ID of the stream.
+\item[\field{queue_type}] is the direction of the queue.
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
+\item[\field{result}] is
+  \begin{description*}
+    \item[VIRTIO_VIDEO_RESULT_OK] if the operation succeeded,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID] if the requested stream
+    does not exist,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT] if the \field{queue_type}
+    \field{resource_id} or \field{flags} parameters have a non-valid value,
+    \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION] if
+    VIRTIO_VIDEO_CMD_RESOURCE_ATTACH has not been successfully called on the
+    resource prior to queueing it.
+  \end{description*}
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
+  used for synchronization. For an input buffer, the device MUST set this field
+  to 0. For an output buffer, the device MUST copy the \field{timestamp} of the
+  input buffer this output buffer was produced from.
+\item[\field{data_sizes}] is the size written by the device, for each valid
+  plane of an output buffer. For an input buffer device MUST set this to 0.
+\end{description}
+
+The device MUST mark output buffers that might contain corrupted content due to
+and error with the VIRTIO_VIDEO_BUFFER_FLAG_ERR flag.
+
+It MUST mark the last buffer with the VIRTIO_VIDEO_DEQUEUE_FLAG_EOS flag to
+  denote completion of the drain sequence.
+
+In case of encoder, the device MUST mark each output buffer with one of
+VIRTIO_VIDEO_BUFFER_IFRAME, VIRTIO_VIDEO_BUFFER_PFRAME, or
+VIRTIO_VIDEO_BUFFER_BFRAME.
+
+If the processing of a buffer was stopped due to VIRTIO_VIDEO_CMD_QUEUE_CLEAR,
+  the device MUST set \field{result} to VIRTIO_VIDEO_RESULT_OK and set
+  VIRTIO_VIDEO_DEQUEUE_FLAG_ERR in \field{flags}.
+
+The driver and device MUST follow requirements about buffer ownership explained
+  in \ref{sec:Device Types / Video Device / Device Operation / Buffer
+  lifecycle}.
+
+\subsubsection{Event Virtqueue}
+
+While processing buffers, the device can send asynchronous event notifications
+to the driver. The behavior depends on the exact stream. For example, the
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
+Upon receiving a RESOLUTION_CHANGED event, the driver MUST perform the following
+sequence:
+
+\begin{itemize*}
+\item Keep queueing and receiving output buffers until an output buffer with
+VIRTIO_VIDEO_DEQUEUE_FLAG_EOS is received\footnote{Conversely, upon receiving an
+output buffer with VIRTIO_VIDEO_DEQUEUE_FLAG_EOS, the driver MUST check whether
+there is a pending resolution change event before deciding that the stream is
+over.}.
+\item Send a VIRTIO_VIDEO_CMD_QUEUE_CLEAR command on the output queue and
+    process its response,
+\item Perform a VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS to get the new stream
+    parameters, including resolution and crop,
+\item If needed, adjust the output resolution and desired output parameters
+    (like number of output buffers) using VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS,
+\item Call VIRTIO_VIDEO_CMD_RESOURCE_ATTACH on each output resource,
+\item Queue the new output resources using VIRTIO_VIDEO_CMD_RESOURCE_QUEUE and
+    resume regular operation.
+\end{itemize*}
+
+\subsubsection{Buffer life cycle}
+\label{sec:Device Types / Video Device / Device Operation / Buffer
+  lifecycle}
+
+The state machine in Figure~\ref{fig:virtio-video-buffer-lifecycle} shows the
+life cycle of a video buffer. Edges represent operations
+VIRTIO_VIDEO_CMD_RESOURCE_ATTACH, VIRTIO_VIDEO_CMD_RESOURCE_QUEUE, and
+VIRTIO_VIDEO_CMD_QUEUE_CLEAR, or the fact that a queued buffer is done being
+processed.
+
+\begin{figure}[h]
+  \centering
+  \includegraphics[width=.5\textwidth]{images/generated/video-buffer-lifecycle.png}
+  \caption{Life Cycle of a Buffer}
+  \label{fig:virtio-video-buffer-lifecycle}
+\end{figure}
+
+\drivernormative{\paragraph}{Buffer life cycle}{Device Types / Video Device /
+  Device Operation / Buffer life cycle}
+
+The following table shows whether the driver can read or write each buffer in
+each state in Figure~\ref{fig:virtio-video-buffer-lifecycle}. The driver MUST
+not read or write buffers in the state that doesn't permit.
+\begin{center}
+  \begin{tabular}{|c|c|c|}
+    \hline
+    State    & Input buffers & Output buffers \\
+    \hline
+    Init     & -             & - \\
+    Attached & Read / Write  & Read \\
+    Queued   & -             & -    \\
+    \hline
+  \end{tabular}
+\end{center}
+
+\devicenormative{\paragraph}{Buffer life cycle}{Device Types / Video
+  Device / Device Operation / Buffer life cycle}
+
+The following table shows whether the device can read or write each buffer in
+each state in Figure~\ref{fig:virtio-video-buffer-lifecycle}. The device MUST
+not read or write buffers in a non-allowed state.
+\begin{center}
+  \begin{tabular}{|c|c|c|}
+    \hline
+    State    & Input buffers & Output buffers \\
+    \hline
+    Init     & -             & - \\
+    Attached & -             & Read (for reference frames) \\
+    Queued   & Read          & Read / Write \\
+    \hline
+  \end{tabular}
+\end{center}
+
+
+\subsection{Supported formats}
+\label{sec:Device Types / Video Device / Supported formats}
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
+        le32 profile; /* VIRTIO_VIDEO_CODEC_VP8_PROFILE_* */
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
+        le32 profile; /* VIRTIO_VIDEO_CODEC_VP9_PROFILE_* */
+};
+\end{lstlisting}
-- 
2.30.0.296.g2bfb1c46d8-goog

