Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C400F02F7
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 17:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390524AbfKEQdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 11:33:14 -0500
Received: from plasma31.jpberlin.de ([80.241.56.82]:63427 "EHLO
        plasma31.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390517AbfKEQdN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 11:33:13 -0500
X-Greylist: delayed 594 seconds by postgrey-1.27 at vger.kernel.org; Tue, 05 Nov 2019 11:33:11 EST
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
        by plasma.jpberlin.de (Postfix) with ESMTP id 8B4281004E8;
        Tue,  5 Nov 2019 17:23:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.76])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id AufWEdiJyMcT; Tue,  5 Nov 2019 17:23:08 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 8444F10039C;
        Tue,  5 Nov 2019 17:23:06 +0100 (CET)
Received: from os-lin-dmo.open-synergy.com (10.25.255.1) by
 MXS02.open-synergy.com (10.25.10.18) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Tue, 5 Nov 2019 17:23:06 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     <virtio-dev@lists.oasis-open.org>
CC:     <linux-media@vger.kernel.org>, <kraxel@redhat.com>,
        <tfiga@chromium.org>, <keiichiw@chromium.org>,
        <acourbot@chromium.org>, <alexlau@chromium.org>,
        <dgreid@chromium.org>, <marcheu@chromium.org>,
        <posciak@chromium.org>, <stevensd@chromium.org>,
        <hverkuil@xs4all.nl>, <daniel@ffwll.ch>
Subject: [RFC] virtio-video: Add virtio video device specification
Date:   Tue, 5 Nov 2019 17:22:46 +0100
Message-ID: <20191105162246.165689-1-dmitry.sepp@opensynergy.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch proposes a virtio specification for a new virtio video
device.

The virtio video device is an abstract video streaming device that
operates input and/or output data buffers to share video devices with
several guests. The device uses descriptor structures to advertise and
negotiate stream formats and controls. This allows the driver to modify
the processing logic of the device on a per stream basis. The generic
nature of the device makes it possible to support the following video
functions: encoder, decoder, processor, capture, output.

Thank you in advance for any feedback.

Signed-off-by: Dmitry Sepp <dmitry.sepp@opensynergy.com>
---
 content.tex      |   1 +
 virtio-video.tex | 776 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 777 insertions(+)
 create mode 100644 virtio-video.tex

diff --git a/content.tex b/content.tex
index b1ea9b9..6990b5d 100644
--- a/content.tex
+++ b/content.tex
@@ -5698,6 +5698,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 \input{virtio-crypto.tex}
 \input{virtio-vsock.tex}
 \input{virtio-fs.tex}
+\input{virtio-video.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/virtio-video.tex b/virtio-video.tex
new file mode 100644
index 0000000..84aade8
--- /dev/null
+++ b/virtio-video.tex
@@ -0,0 +1,776 @@
+\section{Video Device}\label{sec:Device Types / Video Device}
+
+The virtio video device is a virtual video streaming device that supports the
+following functions: encoder, decoder, capture, output.
+
+\subsection{Device ID}\label{sec:Device Types / Video Device / Device ID}
+
+TBD.
+
+\subsection{Virtqueues}\label{sec:Device Types / Video Device / Virtqueues}
+
+\begin{description}
+\item[0] controlq
+\item[1] eventq
+\end{description}
+
+\subsection{Feature bits}\label{sec:Device Types / Video Device / Feature bits}
+
+\begin{description}
+\item[VIRTIO_VIDEO_F_ENCODER (0)] Video encoder function supported.
+\item[VIRTIO_VIDEO_F_DECODER (1)] Video decoder function supported.
+\item[VIRTIO_VIDEO_F_PROCESSOR (2)] Video processor function supported.
+\item[VIRTIO_VIDEO_F_CAPTURE (3)] Video capture function supported.
+\item[VIRTIO_VIDEO_F_OUTPUT (4)] Video output function supported.
+\end{description}
+
+\subsection{Supported functions}\label{sec:Device Types / Video Device / Supported video functions}
+
+The following video functions are defined:
+
+\begin{lstlisting}
+enum virtio_video_func_type {
+	VIRTIO_VIDEO_FUNC_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_FUNC_ENCODER = 0x0100,
+	VIRTIO_VIDEO_FUNC_DECODER,
+	VIRTIO_VIDEO_FUNC_PROCESSOR,
+	VIRTIO_VIDEO_FUNC_CAPTURE,
+	VIRTIO_VIDEO_FUNC_OUTPUT,
+};
+\end{lstlisting}
+
+\subsubsection{Function description}\label{sec:Device Types / Video Device / Supported functions / Function description}
+
+The device reports its configuration using descriptors. A descriptor is a data
+structure with a defined format. Each descriptor begins with a generic virtio
+video descriptor header that contains information about the descriptor type and
+its length.
+
+\begin{lstlisting}
+enum virtio_video_desc_type {
+	VIRTIO_VIDEO_DESC_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_DESC_FRAME_RATE = 0x0100,
+	VIRTIO_VIDEO_DESC_FRAME_SIZE,
+	VIRTIO_VIDEO_DESC_PIX_FORMAT,
+	VIRTIO_VIDEO_DESC_PLANE_FORMAT,
+	VIRTIO_VIDEO_DESC_EXTRAS,
+	VIRTIO_VIDEO_DESC_CAP,
+	VIRTIO_VIDEO_DESC_FUNC,
+	VIRTIO_VIDEO_DESC_PARAMS,
+};
+
+struct virtio_video_desc {
+	__le32 type; /* One of VIRTIO_VIDEO_DESC_* types */
+	__le16 length;
+	__u8 padding[2];
+};
+\end{lstlisting}
+
+Functions describe a set of services that the device offers. In general, the
+device can transform data from one format to another
+(encoder/decoder/processor) or produce/consume data (capture/output).
+
+Functions have the descriptor type VIRTIO_VIDEO_DESC_FUNC. Each
+encoder/decoder/processor function has 2 pins, input and output. Capture
+function has only one input pin, output has only an output pin. Each pin has a
+capability that describes formats this pin can handle. Also, a function can
+have a set of control capabilities that control the process of data
+transformation/production/consumption.
+
+The capability that describes the data format consists of:
+
+\begin{itemize*}
+\item a set of pixel formats that contains one or more:
+\item supported frame sizes that contains one or more:
+\item supported frame rates.
+\end{itemize*}
+
+The description of each function looks as follows:
+
+\begin{itemize*}
+  \item capability (input pin)
+  \begin{itemize*}
+    \item pixel format
+    \begin{itemize*}
+      \item frame size
+        \begin{itemize*}
+          \item frame rate
+          \item ... (other possible frame rates)
+        \end{itemize*}
+      \item ... (other possible frame sizes) 
+      \end{itemize*}
+    \item ... (other possible pixel formats)
+    \end{itemize*}
+  \item capability (output pin)
+  \begin{itemize*}
+    \item ...
+  \end{itemize*}
+  \item ... (other capabilities, control)
+\end{itemize*}
+
+\subsubsection{Encoder specific capabilities}\label{sec:Device Types / Video Device / Supported functions / Encoder specific capabilities}
+
+TBD.
+
+\subsubsection{Decoder specific capabilities}\label{sec:Device Types / Video Device / Supported functions / Decoder specific capabilities}
+
+TBD.
+
+\subsubsection{Processor specific capabilities}\label{sec:Device Types / Video Device / Supported functions / Processor specific capabilities}
+
+TBD.
+
+\subsubsection{Capture specific capabilities}\label{sec:Device Types / Video Device / Supported functions / Capture specific capabilities}
+
+TBD.
+
+\subsubsection{Output specific capabilities}\label{sec:Device Types / Video Device / Supported functions / Output specific capabilities}
+
+TBD.
+
+\subsection{Device configuration layout}\label{sec:Device Types / Video Device / Device configuration layout}
+
+Video device configuration uses the following layout structure:
+
+\begin{lstlisting}
+struct virtio_video_config {
+	__le32 num_functions;
+	__le32 total_functions_size;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{num_functions}] specifies how many functions are supported by the
+  device.
+\item[\field{total_functions_size}] defines the maximum size of a buffer
+  required to fetch function capabilities.
+\end{description}
+
+\subsection{Device Initialization}\label{sec:Device Types / Video Device / Device Initialization}
+
+\devicenormative{\subsubsection}{Device Initialization}{Device Types / Video Device / Device Initialization}
+
+\begin{itemize*}
+\item The driver SHOULD query information about supported functions from the
+  device using the VIRTIO_VIDEO_T_GET_FUNCS command and use that information
+  for the initial setup.
+\end{itemize*}
+
+\subsection{Device Operation}\label{sec:Device Types / Video Device / Device Operation}
+
+The driver allocates input and/or output buffers (depending on the function)
+and queues the buffers to the device. The device performs operations on the
+buffers according to the function in question.
+
+\subsubsection{Device Operation: Create stream}
+
+To process buffers, the device needs to associate them with a certain video
+stream (essentially, a context).  Streams are created with a default set of
+parameters determined by the device.
+
+\begin{itemize*}
+\item Create a stream using VIRTIO_VIDEO_T_STREAM_CREATE.
+\end{itemize*}
+
+\subsubsection{Device Operation: Create buffers}
+
+Buffers are used to store the actual data as well as the relevant metadata.
+
+\begin{itemize*}
+\item create a device resource using VIRTIO_VIDEO_T_RESOURCE_CREATE.
+\item create a buffer from the driver's memory, and attach it as backing
+  storage to the resource just created using
+  VIRTIO_VIDEO_REQ_RESOURCE_ATTACH_BACKING. Scatter lists are supported, so the
+  buffer doesn't need to be contiguous in guest physical memory.
+\item set buffer metadata.
+\item create a stream using VIRTIO_VIDEO_T_STREAM_CREATE.
+\end{itemize*}
+
+\subsubsection{Device Operation: Process buffers}
+
+\begin{itemize*}
+\item if the function and the buffer type require so, write data to the buffer memory.
+\item use VIRTIO_VIDEO_T_RESOURCE_QUEUE to queue the buffer for processing in the device.
+\item the request completes asynchronously when the device has finished with the buffer.
+\end{itemize*}
+
+\subsubsection{Device Operation: Stream parameter control}
+
+\begin{itemize*}
+\item use VIRTIO_VIDEO_T_GET_PARAMS to get the current stream input or output
+  pin parameters from the device.
+\item use VIRTIO_VIDEO_T_SET_PARAMS to provide new stream input or output pin
+  parameters to the device.
+\item after setting stream parameters, the driver may issue VIRTIO_VIDEO_T_GET_PARAMS
+  as some parameters can be changed implicitly by the device during the set
+  operation.
+\end{itemize*}
+
+\subsubsection{Device Operation: Buffer processing control}
+
+\begin{itemize*}
+\item use VIRTIO_VIDEO_T_STREAM_START to start buffer processing in the device.
+\item use VIRTIO_VIDEO_T_STREAM_STOP to stop buffer processing in the device.
+\item use VIRTIO_VIDEO_T_STREAM_DRAIN to ask the device to process and return
+  all of the already queued buffers.
+\item use VIRTIO_VIDEO_T_QUEUE_CLEAR to ask the device to return back already
+  queued buffers from the input or the output queue. This also includes input or
+  output buffers that can be currently owned by the device's processing pipeline.
+\end{itemize*}
+
+\subsubsection{Device Operation: Asynchronous events}
+
+While processing buffers, the device can send asynchronous event notifications
+to the driver. The behaviour depends on the exact stream. For example, the
+decoder device sends a resolution change event when it encounters new
+resolution metadata in the stream.
+
+\subsubsection{Device Operation: Request header}
+
+All requests and responses on the control virt queue have a fixed header using
+the following layout structure and definitions:
+
+\begin{lstlisting}
+enum virtio_video_ctrl_type {
+	VIRTIO_VIDEO_CTRL_UNDEFINED = 0,
+
+	/* request */
+	VIRTIO_VIDEO_T_GET_FUNCS = 0x0100,
+	VIRTIO_VIDEO_T_STREAM_CREATE,
+	VIRTIO_VIDEO_T_STREAM_DESTROY,
+	VIRTIO_VIDEO_T_STREAM_START,
+	VIRTIO_VIDEO_T_STREAM_STOP,
+	VIRTIO_VIDEO_T_STREAM_DRAIN,
+	VIRTIO_VIDEO_T_RESOURCE_CREATE,
+	VIRTIO_VIDEO_T_RESOURCE_DESTROY,
+	VIRTIO_VIDEO_T_RESOURCE_ATTACH_BACKING,
+	VIRTIO_VIDEO_T_RESOURCE_DETACH_BACKING,
+	VIRTIO_VIDEO_T_RESOURCE_QUEUE,
+	VIRTIO_VIDEO_T_QUEUE_CLEAR,
+	VIRTIO_VIDEO_T_SET_PARAMS,
+	VIRTIO_VIDEO_T_GET_PARAMS,
+
+	/* response */
+	VIRTIO_VIDEO_S_OK = 0x0200,
+	VIRTIO_VIDEO_S_OK_RESOURCE_QUEUE,
+	VIRTIO_VIDEO_S_OK_GET_PARAMS,
+
+	VIRTIO_VIDEO_S_ERR_UNSPEC = 0x0300,
+	VIRTIO_VIDEO_S_ERR_OUT_OF_MEMORY,
+	VIRTIO_VIDEO_S_ERR_INVALID_FUNCTION_ID,
+	VIRTIO_VIDEO_S_ERR_INVALID_RESOURCE_ID,
+	VIRTIO_VIDEO_S_ERR_INVALID_STREAM_ID,
+	VIRTIO_VIDEO_S_ERR_INVALID_PARAMETER,
+};
+
+struct virtio_video_ctrl_hdr {
+	__le32 type;
+	__le32 stream_id;
+	__le32 function_id;
+	__u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{type}] the type of the driver request or the device response.
+\item[\field{stream_id}] specifies a target stream.
+\item[\field{function_id}] specifies a function the stream belongs to.
+\end{description}
+
+\subsubsection{Device Operation: controlq}
+
+\begin{description}
+
+\item[VIRTIO_VIDEO_T_GET_FUNCS] Retrieve information about supported functions.
+  No request data (just bare \field{struct virtio_video_ctrl_hdr}). The driver
+  SHOULD ignore the value of the \field{stream_id} parameter. Response type is
+  VIRTIO_VIDEO_S_OK_GET_PARAMS, response data is an array of \field{struct
+  virtio_video_function}.
+
+\begin{lstlisting}
+struct virtio_video_frame_rate {
+	struct virtio_video_desc desc;
+	__le32 min_rate;
+	__le32 max_rate;
+	__le32 step;
+	__u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{desc}] a virtio video descriptor header. The device MUST set the
+  \field{type} to VIRTIO_VIDEO_DESC_FRAME_RATE.
+\item[\field{min_rate}] minimum supported frame rate.
+\item[\field{max_rate}] maximum supported frame rate.
+\item[\field{step}] frame rate step size, if applicable. Otherwise the device
+  MUST provide \field{min_rate} equal to \field{max_rate}.
+\end{description}
+
+\begin{lstlisting}
+struct virtio_video_frame_size {
+	struct virtio_video_desc desc;
+	__le32 min_width;
+	__le32 max_width;
+	__le32 step_width;
+	__le32 min_height;
+	__le32 max_height;
+	__le32 step_height;
+	__le32 num_rates;
+	__u8 padding[4];
+	/* Followed by struct virtio_video_frame_rate frame_rates[]; */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{desc}] a virtio video descriptor header. The device MUST set the
+  \field{type} to VIRTIO_VIDEO_DESC_FRAME_SIZE.
+\item[\field{min_width}] minimum supported frame width.
+\item[\field{max_width}] maximum supported frame width..
+\item[\field{step_width}] frame width step size, if applicable. Otherwise the
+  device MUST provide \field{min_width} equal to \field{max_width}.
+\item[\field{min_height}] minimum supported frame height.
+\item[\field{max_height}] maximum supported frame height.
+\item[\field{step_height}] frame height step size, if applicable. Otherwise the
+  device MUST provide \field{min_height} equal to \field{max_height}.
+\item[\field{num_rates}] number of frame rates supported for the given frame size.
+\end{description}
+
+\begin{lstlisting}
+enum virtio_video_pixel_format {
+	VIRTIO_VIDEO_PIX_FMT_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_PIX_FMT_H264 = 0x0100,
+	VIRTIO_VIDEO_PIX_FMT_NV12,
+	VIRTIO_VIDEO_PIX_FMT_NV21,
+	VIRTIO_VIDEO_PIX_FMT_I420,
+	VIRTIO_VIDEO_PIX_FMT_I422,
+	VIRTIO_VIDEO_PIX_FMT_XBGR,
+};
+
+struct virtio_video_pix_format {
+	struct virtio_video_desc desc;
+	__le32 pixel_format;
+	__le32 num_sizes;
+	/* Followed by struct virtio_video_frame_size frame_sizes[]; */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{desc}] a virtio video descriptor header. The device MUST set the
+  \field{type} to VIRTIO_VIDEO_DESC_PIX_FORMAT.
+\item[\field{pixel_format}] data format for the pin.
+\item[\field{num_sizes}] number of frame rates supported for the given data
+  format.
+\end{description}
+
+\begin{lstlisting}
+enum virtio_video_pin_type {
+	VIRTIO_VIDEO_PIN_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_PIN_INPUT = 0x0100,
+	VIRTIO_VIDEO_PIN_OUTPUT,
+};
+
+struct virtio_video_frame_format {
+	__le32 pin_type; /* One of VIRTIO_VIDEO_PIN_* types */
+	__le32 num_formats;
+	/* Followed by struct virtio_video_pix_format pix_formats[]; */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{pin_type}] pin direction. The device MUST set the value to either
+  VIRTIO_VIDEO_PIN_INPUT or VIRTIO_VIDEO_PIN_OUTPUT.
+\item[\field{num_formats}] number of frame formats supported for the pin.
+\end{description}
+
+\begin{lstlisting}
+enum virtio_video_cap_type {
+	VIRTIO_VIDEO_CAP_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_CAP_PIN_FORMATS = 0x0100,
+	VIRTIO_VIDEO_CAP_CONTROL,
+};
+
+struct virtio_video_capability {
+	struct virtio_video_desc desc;
+	__le32 cap_type; /* One of VIRTIO_VIDEO_CAP_* types */
+	__le32 cap_id;
+	union {
+		struct virtio_video_frame_format frame_format;
+		struct virtio_video_control control;
+	} u;
+};
+\end{lstlisting}
+
+
+\begin{description}
+\item[\field{desc}] a virtio video descriptor header. The device MUST set the
+  \field{type} to VIRTIO_VIDEO_DESC_CAP.
+\item[\field{cap_type}] specifies the type of the device capability.
+\item[\field{cap_id}] internal id of the capability.
+\item[\field{u}] the actual capability description.
+\end{description}
+
+\begin{lstlisting}
+struct virtio_video_function {
+	struct virtio_video_desc desc;
+	__le32 function_type; /* One of VIRTIO_VIDEO_FUNC_* types */
+	__le32 function_id;
+	struct virtio_video_params in_params;
+	struct virtio_video_params out_params;
+	__le32 num_caps;
+	__u8 padding[4];
+	/* Followed by struct virtio_video_capability video_caps[]; */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{desc}] a virtio video descriptor header. The device MUST set the
+  \field{type} to VIRTIO_VIDEO_DESC_FUNC.
+\item[\field{function_type}] one of the supported function types.
+\item[\field{function_id}] id of the function.
+\item[\field{in_params}] default parameters for the input pin, if applicable.
+  See VIRTIO_VIDEO_T_SET_PARAMS.
+\item[\field{out_params}] default parameters for the output pin, if applicable.
+  See VIRTIO_VIDEO_T_SET_PARAMS.
+\item[\field{num_caps}] number of capabilities (i.e. formats, controls)
+  supported by the function.
+\end{description}
+
+\item[VIRTIO_VIDEO_T_STREAM_CREATE] create a video stream (context) within the
+  device.
+
+\begin{lstlisting}
+/* VIRTIO_VIDEO_T_STREAM_CREATE */
+struct virtio_video_stream_create {
+	struct virtio_video_ctrl_hdr hdr;
+	char debug_name[64];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{debug_name}] a text string for a debug purpose.
+\end{description}
+
+\item[VIRTIO_VIDEO_T_STREAM_DESTROY] destroy a video stream (context) within the
+  device.
+
+\begin{lstlisting}
+struct virtio_video_stream_destroy {
+	struct virtio_video_ctrl_hdr hdr;
+};
+\end{lstlisting}
+
+\item[VIRTIO_VIDEO_T_STREAM_START] start processing buffers in the device's
+  queue(s).
+
+\begin{lstlisting}
+struct virtio_video_stream_start {
+	struct virtio_video_ctrl_hdr hdr;
+};
+\end{lstlisting}
+
+\item[VIRTIO_VIDEO_T_STREAM_STOP] stop processing buffers in the device's
+  queue(s).
+
+\begin{lstlisting}
+struct virtio_video_stream_stop {
+	struct virtio_video_ctrl_hdr hdr;
+};
+\end{lstlisting}
+
+\item[VIRTIO_VIDEO_T_STREAM_DRAIN] ask the device to push all the queued
+  buffers through the pipeline.
+
+\begin{lstlisting}
+struct virtio_video_stream_drain {
+	struct virtio_video_ctrl_hdr hdr;
+};
+\end{lstlisting}
+
+\item[VIRTIO_VIDEO_T_RESOURCE_CREATE] create a resource descriptor within the
+  device.
+
+\begin{lstlisting}
+struct virtio_video_resource_create {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 resource_id;
+	__u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{resource_id}] internal id of the resource.
+\end{description}
+
+\item[VIRTIO_VIDEO_T_RESOURCE_DESTROY] destroy a resource descriptor within the
+  device.
+
+\begin{lstlisting}
+struct virtio_video_resource_destroy {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 resource_id;
+	__u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{resource_id}] internal id of the resource.
+\end{description}
+
+\item[VIRTIO_VIDEO_T_RESOURCE_ATTACH_BACKING] associate backing pages with a
+  resource.
+
+\begin{lstlisting}
+struct virtio_video_mem_entry {
+	__le64 addr;
+	__le32 length;
+	__u8 padding[4];
+};
+
+struct virtio_video_resource_attach_backing {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 resource_id;
+	__le32 nr_entries;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{resource_id}] internal id of the resource.
+\item[\field{nr_entries}] number of \field{struct virtio_video_mem_entry}
+  memory entries.
+\end{description}
+
+\item[VIRTIO_VIDEO_T_RESOURCE_DETACH_BACKING] Dissociate backing pages from a
+  resource.
+
+\begin{lstlisting}
+struct virtio_video_resource_detach_backing {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 resource_id;
+	__u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{resource_id}] internal id of the resource.
+\end{description}
+
+\item[VIRTIO_VIDEO_T_RESOURCE_QUEUE] Add a buffer to the device's queue.
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_MAX_PLANES 8
+
+struct virtio_video_resource_queue {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 resource_id;
+	__le32 function_id;
+	__le64 timestamp;
+	__le32 data_size[VIRTIO_VIDEO_MAX_PLANES];
+	__le32 pin_type;
+	__u8 nr_data_size;
+	__u8 padding[3];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{resource_id}] internal id of the resource.
+\item[\field{function_id}] internal id of the function.
+\item[\field{timestamp}] an abstract sequence counter that can be used for
+  synchronisation.
+\item[\field{data_size}] number of data bytes within a plane.
+\item[\field{pin_type}] pin direction.
+\item[\field{nr_data_size}] number of \field{data_size} entries.
+\end{description}
+
+\begin{lstlisting}
+enum virtio_video_buffer_flag {
+	VIRTIO_VIDEO_BUFFER_F_ERR	= 0x0001,
+	VIRTIO_VIDEO_BUFFER_F_EOS	= 0x0002,
+	/* Encoder only */
+	VIRTIO_VIDEO_BUFFER_IFRAME	= 0x0004,
+	VIRTIO_VIDEO_BUFFER_PFRAME	= 0x0008,
+	VIRTIO_VIDEO_BUFFER_BFRAME	= 0x0010,
+};
+
+struct virtio_video_resource_queue_resp {
+	struct virtio_video_ctrl_hdr hdr;
+	__le64 timestamp;
+	__le32 flags; /* One of VIRTIO_VIDEO_BUFFER_* flags */
+	__le32 size;  /* Encoded size */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{timestamp}] an abstract sequence counter that can be used for
+  synchronisation.
+\item[\field{flags}] mark specific buffers in the sequence.
+\item[\field{size}] data size in the buffer (encoder only).
+\end{description}
+
+The device sends a response to the queue request asynchronously when it has
+finished processing the buffer.
+
+The device SHOULD mark a buffer that triggered a processing error with the
+VIRTIO_VIDEO_BUFFER_F_ERR flag.
+
+The device MUST mark the last buffer with the VIRTIO_VIDEO_BUFFER_F_EOS flag to
+denote completion of the drain sequence.
+
+In case of encoder, to denote a particular frame type the devie MUST mark the
+respective buffer with VIRTIO_VIDEO_BUFFER_IFRAME, VIRTIO_VIDEO_BUFFER_PFRAME,
+VIRTIO_VIDEO_BUFFER_BFRAME.
+
+\item[VIRTIO_VIDEO_T_RESOURCE_QUEUE_CLEAR] Return already queued buffers back
+  from the input or the output queue of the device. The device SHOULD return
+  all of the buffers from the respective queue as soon as possible without
+  pushing the buffers through the processing pipeline.
+
+\begin{lstlisting}
+struct virtio_video_queue_clear {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 pin_type;
+	__u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{pin_type}] pin direction.
+\end{description}
+
+\item[VIRTIO_VIDEO_T_SET_PARAMS] Change parameters of the input or the output
+  pin of a stream.
+
+\begin{lstlisting}
+enum virtio_video_channel_type {
+	VIRTIO_VIDEO_CHANNEL_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_CHANNEL_Y = 0x0100,
+	VIRTIO_VIDEO_CHANNEL_U,
+	VIRTIO_VIDEO_CHANNEL_V,
+	VIRTIO_VIDEO_CHANNEL_UV,
+	VIRTIO_VIDEO_CHANNEL_VU,
+	VIRTIO_VIDEO_CHANNEL_YUV,
+	VIRTIO_VIDEO_CHANNEL_YVU,
+	VIRTIO_VIDEO_CHANNEL_BGR,
+	VIRTIO_VIDEO_CHANNEL_BGRX,
+};
+
+struct virtio_video_plane_format {
+	struct virtio_video_desc desc;
+	__le32 channel; /* One of VIRTIO_VIDEO_CHANNEL_* types */
+	__le32 plane_size;
+	__le32 stride;
+	__le32 padding;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{desc}] a virtio video descriptor header. The device MUST set the
+  \field{type} to VIRTIO_VIDEO_DESC_PLANE_FORMAT.
+\item[\field{channel}] describes the image channel(s) stored by the plane.
+\item[\field{plane_size}] size of the plane in bytes.
+\item[\field{stride}] stride used for the plane in bytes.
+\end{description}
+
+\begin{lstlisting}
+struct virtio_video_params {
+	struct virtio_video_desc desc;
+	__le32 pin_type; /* One of VIRTIO_VIDEO_PIN_* types */
+	__le32 frame_rate;
+	__le32 frame_width;
+	__le32 frame_height;
+	__le32 pixel_format;
+	__le32 min_buffers;
+	__le32 num_planes;
+	struct virtio_video_plane_format plane_formats[VIRTIO_VIDEO_MAX_PLANES];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{pin_type}] pin direction.
+\item[\field{frame_rate}] the value to get/set.
+\item[\field{frame_width}] the value to get/set.
+\item[\field{frame_height}] the value to get/set.
+\item[\field{pixel_format}] the value to get/set.
+\item[\field{min_buffers}] minimum buffers required to handle the format (r/o).
+\item[\field{num_planes}] number of planes used to store pixel data (r/o).
+\item[\field{plane_formats}] description of each plane.
+\end{description}
+
+\begin{lstlisting}
+struct virtio_video_set_params {
+	struct virtio_video_ctrl_hdr hdr;
+	struct virtio_video_params params;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{params}] parameters to set.
+\end{description}
+
+Setting stream parameters might have side effects within the device. For
+example, the device MAY perform alignment of width and height, change the
+number of planes it uses for the format, or do whatever changes that are
+required to continue normal operation using the updated parameters. It is up to
+the driver to check the parameter set after the VIRTIO_VIDEO_T_SET_PARAMS
+request has been issued.
+
+\item[VIRTIO_VIDEO_T_GET_PARAMS] Get parameters of the input or the output pin
+  of a stream.
+
+\begin{lstlisting}
+struct virtio_video_get_params {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 pin_type; /* One of VIRTIO_VIDEO_PIN_* types */
+};
+
+struct virtio_video_get_params_resp {
+	struct virtio_video_ctrl_hdr hdr;
+	struct virtio_video_params params;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{pin_type}] pin direction.
+\item[\field{params}] parameter values.
+\end{description}
+
+\end{description}
+
+\subsubsection{Device Operation: eventq}
+
+The device can report events on the event queue. The driver initially populates
+the queue with device-writeable buffers. When the device needs to report an
+event, it fills a buffer and notifies the driver. The driver consumes the
+report and adds a new buffer to the virtqueue.
+
+\begin{lstlisting}
+enum virtio_video_event_type {
+	VIRTIO_VIDEO_EVENT_T_UNDEFINED = 0,
+	/* Decoder only */
+	VIRTIO_VIDEO_EVENT_T_RESOLUTION_CHANGED = 0x0100,
+};
+
+struct virtio_video_event {
+	__le32 event_type; /* One of VIRTIO_VIDEO_EVENT_T_* types */
+	__le32 function_id;
+	__le32 stream_id;
+	__u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{event_type}] type of the triggered event .
+\item[\field{function_id}] id of the source function.
+\item[\field{stream_id}] id of the source stream.
+\end{description}
+
+The device MUST send VIRTIO_VIDEO_EVENT_T_RESOLUTION_CHANGED whenever it
+encounters new resolution data in the stream. This includes the case of the
+initial device configuration after metadata has been parsed and the case of
+dynamic resolution change.
+
-- 
2.23.0

