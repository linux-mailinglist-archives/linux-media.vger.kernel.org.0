Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB5D124F54
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 18:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfLRR3v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 12:29:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35364 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727025AbfLRR3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 12:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576690189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ifZew/56HBjFEx3mHmNxSzFDHVk9Wkm1VsU5fEUzOfk=;
        b=TZTkPF3eIPIjx1GhFfI8cXzhyNbIilK2gLvrTZglRJV3JGHMPu8TI7Me0DgY9eFPgv+2A/
        h2+/RdFSMRGm/x0OECG07QnIf+qPPKpr7iQLRNKO6yBM3HesdDUbm53+/JrrQGg1mxZH8z
        t2vV+dWUjDzZyB1ciBpF8VctyLk8qR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-WL61BGvoOdGob9CA1ARw3w-1; Wed, 18 Dec 2019 12:29:45 -0500
X-MC-Unique: WL61BGvoOdGob9CA1ARw3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1240107ACCC;
        Wed, 18 Dec 2019 17:29:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C80F8620DA;
        Wed, 18 Dec 2019 17:29:42 +0000 (UTC)
Received: from zmail25.collab.prod.int.phx2.redhat.com (zmail25.collab.prod.int.phx2.redhat.com [10.5.83.31])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51CC61803C32;
        Wed, 18 Dec 2019 17:29:42 +0000 (UTC)
Date:   Wed, 18 Dec 2019 12:29:40 -0500 (EST)
From:   Frediano Ziglio <fziglio@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        acourbot@chromium.org, alexlau@chromium.org, daniel@ffwll.ch,
        dgreid@chromium.org, dmitry sepp <dmitry.sepp@opensynergy.com>,
        egranata@google.com, hverkuil@xs4all.nl, kraxel@redhat.com,
        marcheu@chromium.org, posciak@chromium.org,
        spice-devel@lists.freedesktop.org, stevensd@chromium.org,
        tfiga@chromium.org, uril@redhat.com
Message-ID: <718815324.16531975.1576690180746.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191218130214.170703-2-keiichiw@chromium.org>
References: <20191218130214.170703-1-keiichiw@chromium.org> <20191218130214.170703-2-keiichiw@chromium.org>
Subject: Re: [PATCH v2 1/1] virtio-video: Add virtio video device
 specification
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.33.32.29, 10.4.195.12]
Thread-Topic: virtio-video: Add virtio video device specification
Thread-Index: sv2iHEQPrGsY2WgvMxh5eGUyZHuveg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> 
> From: Dmitry Sepp <dmitry.sepp@opensynergy.com>
> 
> The virtio video encoder device and decoder device provide functionalities to
> encode and decode video stream respectively.
> Though video encoder and decoder are provided as different devices, they use
> a
> same protocol.
> 
> Signed-off-by: Dmitry Sepp <dmitry.sepp@opensynergy.com>
> Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
> ---
>  content.tex      |   1 +
>  virtio-video.tex | 579 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 580 insertions(+)
>  create mode 100644 virtio-video.tex
> 
> diff --git a/content.tex b/content.tex
> index 556b373..9e56839 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -5743,6 +5743,7 @@ \subsubsection{Legacy Interface: Framing
> Requirements}\label{sec:Device
>  \input{virtio-vsock.tex}
>  \input{virtio-fs.tex}
>  \input{virtio-rpmb.tex}
> +\input{virtio-video.tex}
>  
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  
> diff --git a/virtio-video.tex b/virtio-video.tex
> new file mode 100644
> index 0000000..30e728d
> --- /dev/null
> +++ b/virtio-video.tex
> @@ -0,0 +1,579 @@
> +\section{Video Device}\label{sec:Device Types / Video Device}
> +
> +The virtio video encoder device and decoder device are virtual devices that
> +supports encoding and decoding respectively. Though the encoder and the
> decoder
> +are different devices, they use the same protocol.
> +
> +\subsection{Device ID}\label{sec:Device Types / Video Device / Device ID}
> +
> +\begin{description}
> +\item[30] encoder device
> +\item[31] decoder device
> +\end{description}
> +
> +\subsection{Virtqueues}\label{sec:Device Types / Video Device / Virtqueues}
> +
> +\begin{description}
> +\item[0] controlq - queue for sending control commands.
> +\item[1] eventq - queue for sending events happened in the device.
> +\end{description}
> +
> +\subsection{Feature bits}\label{sec:Device Types / Video Device / Feature
> bits}
> +
> +\begin{description}
> +\item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (0)] Guest pages can be used for
> video
> +  buffers.
> +\end{description}
> +
> +\devicenormative{\subsubsection}{Feature bits}{Device Types / Video Device /
> Feature bits}
> +
> +The device MUST offer at least one of feature bits.
> +
> +\subsection{Device configuration layout}\label{sec:Device Types / Video
> Device / Device configuration layout}
> +
> +Video device configuration uses the following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_video_config {
> +        le32 max_cap_len;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{max_cap_len}] defines the maximum length of a descriptor
> +  required to call VIRTIO_VIDEO_GET_CAPABILITY in bytes. The device
> +  MUST set this value.
> +\end{description}
> +
> +\subsection{Device Initialization}\label{sec:Device Types / Video Device /
> Device Initialization}
> +
> +\devicenormative{\subsubsection}{Device Initialization}{Device Types / Video
> Device / Device Initialization}
> +
> +The driver SHOULD query device capability by using the
> +VIRTIO_VIDEO_T_GET_CAPABILITY and use that information for the initial
> +setup.
> +
> +\subsection{Device Operation}\label{sec:Device Types / Video Device / Device
> Operation}
> +
> +The driver allocates input and output buffers and queues the buffers
> +to the device. The device performs operations on the buffers according
> +to the function in question.
> +
> +\subsubsection{Device Operation: Create stream}
> +
> +To process buffers, the device needs to associate them with a certain
> +video stream (essentially, a context). Streams are created by
> +VIRTIO_VIDEO_T_STREAM_CREATE with a default set of parameters
> +determined by the device.
> +
> +\subsubsection{Device Operation: Create buffers}
> +
> +Buffers are used to store the actual data as well as the relevant
> +metadata. Scatter lists are supported, so the buffer doesn't need to
> +be contiguous in guest physical memory.
> +
> +\begin{itemize*}
> +\item Use VIRTIO_VIDEO_T_RESOURCE_CREATE to create a virtio video
> +  resource that is backed by a buffer allocated from the driver's
> +  memory.
> +\item Use VIRTIO_VIDEO_T_RESOURCE_DESTROY to destroy a resource that
> +  is no longer needed.
> +\end{itemize*}
> +
> +\subsubsection{Device Operation: Stream parameter control}
> +
> +\begin{itemize*}
> +\item Use VIRTIO_VIDEO_T_GET_PARAMS to get the current stream parameters for
> +  input and output streams from the device.
> +\item Use VIRTIO_VIDEO_T_SET_PARAMS to provide new stream parameters to the
> +  device.
> +\item After setting stream parameters, the driver may issue
> +  VIRTIO_VIDEO_T_GET_PARAMS as some parameters of both input and output can
> be
> +  changed implicitly by the device during the set operation.
> +\end{itemize*}
> +
> +\subsubsection{Device Operation: Process buffers}
> +
> +\begin{itemize*}
> +\item If the function and the buffer type require so, write data to
> +the buffer memory.
> +\item Use VIRTIO_VIDEO_T_RESOURCE_QUEUE to queue the buffer for
> +processing in the device.
> +\item The request completes asynchronously when the device has
> +finished with the buffer.
> +\end{itemize*}
> +
> +\subsubsection{Device Operation: Buffer processing control}
> +
> +\begin{itemize*}
> +\item Use VIRTIO_VIDEO_T_STREAM_DRAIN to ask the device to process and
> +  return all of the already queued buffers.
> +\item Use VIRTIO_VIDEO_T_QUEUE_CLEAR to ask the device to return back
> +  already queued buffers from the input or the output queue. This also
> +  includes input or output buffers that can be currently owned by the
> +  device's processing pipeline.
> +\end{itemize*}
> +
> +\subsubsection{Device Operation: Asynchronous events}
> +
> +While processing buffers, the device can send asynchronous event
> +notifications to the driver. The behaviour depends on the exact
> +stream. For example, the decoder device sends a resolution change
> +event when it encounters new resolution metadata in the stream.
> +
> +\subsubsection{Device Operation: Request header}
> +
> +All requests and responses on the control virt queue have a fixed
> +header using the following layout structure and definitions:
> +
> +\begin{lstlisting}
> +enum virtio_video_ctrl_type {
> +        VIRTIO_VIDEO_CTRL_UNDEFINED = 0,
> +
> +        /* request */
> +        VIRTIO_VIDEO_T_GET_CAPABILITY = 0x0100,
> +        VIRTIO_VIDEO_T_STREAM_CREATE,
> +        VIRTIO_VIDEO_T_STREAM_DESTROY,
> +        VIRTIO_VIDEO_T_STREAM_DRAIN,
> +        VIRTIO_VIDEO_T_RESOURCE_CREATE,
> +        VIRTIO_VIDEO_T_RESOURCE_DESTROY,
> +        VIRTIO_VIDEO_T_RESOURCE_QUEUE,
> +        VIRTIO_VIDEO_T_QUEUE_CLEAR,
> +        VIRTIO_VIDEO_T_SET_PARAMS,
> +        VIRTIO_VIDEO_T_GET_PARAMS,
> +
> +        /* response */
> +        VIRTIO_VIDEO_S_OK = 0x0200,
> +        VIRTIO_VIDEO_S_OK_RESOURCE_QUEUE,
> +        VIRTIO_VIDEO_S_OK_GET_PARAMS,
> +
> +        VIRTIO_VIDEO_S_ERR_UNSPEC = 0x0300,
> +        VIRTIO_VIDEO_S_ERR_OUT_OF_MEMORY,
> +        VIRTIO_VIDEO_S_ERR_INVALID_RESOURCE_ID,
> +        VIRTIO_VIDEO_S_ERR_INVALID_STREAM_ID,
> +        VIRTIO_VIDEO_S_ERR_INVALID_PARAMETER,
> +};
> +
> +struct virtio_video_ctrl_hdr {
> +        le32 type;
> +        le32 stream_id;
> +        le32 len; /* Length of the structure in bytes. */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{type}] is the type of the driver request or the device
> +response.
> +\item[\field{stream_id}] specifies a target stream.
> +\item[\field{len}] is the length of data in bytes, which includes
> +length of the header.

I suppose is implicit that it's the size of the container structure.

> +\end{description}
> +
> +\subsubsection{Device Operation: controlq}
> +
> +\begin{description}
> +
> +\item[VIRTIO_VIDEO_T_GET_CAPABILITY] Retrieve information about
> +supported formats.
> +
> +The driver uses \field{struct virtio_video_get_capability} to send a
> +query request.
> +
> +\begin{lstlisting}
> +enum virtio_video_buf_type {
> +        VIRTIO_VIDEO_BUF_TYPE_INPUT,
> +        VIRTIO_VIDEO_BUF_TYPE_OUTPUT,
> +};
> +
> +struct virtio_video_get_capability {
> +        struct virtio_video_ctrl_hdr hdr;
> +        enum virtio_video_buf_type buf_type;

Here you used an enumeration but later you are using just le32 type
with a comment. Why this difference?

> +};
> +\end{lstlisting}
> +\begin{description}
> +\item[\field{buf_type}] is the buffer type that the driver asks
> +information about. The driver MUST set either
> +\field{VIRTIO_VIDEO_BUF_TYPE_INPUT} or \field{VIRTIO_VIDEO_BUF_TYPE_OUTPUT}.
> +\end{description}
> +
> +The device responds a capability by using \field{struct
> +virtio_video_get_capability_resp}.
> +\begin{lstlisting}
> +enum virtio_video_format {
> +        VIRTIO_VIDEO_FORMAT_UNDEFINED = 0,

Really minor: maybe you want to insert an empty line to be coherent
with other enumerations?

> +        /* Raw formats */
> +        VIRTIO_VIDEO_FORMAT_NV12 = 1,
> +        VIRTIO_VIDEO_FORMAT_YUV420,
> +        VIRTIO_VIDEO_FORMAT_YVU420,
> +
> +        /* Compressed formats */
> +        VIRTIO_VIDEO_FORMAT_H264 = 0x1001,
> +        VIRTIO_VIDEO_FORMAT_VP8 =  0x1002,
> +        VIRTIO_VIDEO_FORMAT_VP9 =  0x1003,
> +};
> +
> +enum virtio_video_profile {
> +        VIRTIO_VIDEO_PROFILE_UNDEFINED = 0,
> +
> +        /* H.264 */
> +        VIRTIO_VIDEO_PROFILE_H264_MIN = 0x100,
> +        VIRTIO_VIDEO_PROFILE_H264_BASELINE =
> VIRTIO_VIDEO_PROFILE_H264_BASELINE,

Maybe you want

VIRTIO_VIDEO_PROFILE_H264_BASELINE = VIRTIO_VIDEO_PROFILE_H264_MIN,

like others?

> +        VIRTIO_VIDEO_PROFILE_H264_MAIN,
> +        VIRTIO_VIDEO_PROFILE_H264_EXTENDED,
> +        VIRTIO_VIDEO_PROFILE_H264_HIGH,
> +        VIRTIO_VIDEO_PROFILE_H264_HIGH10PROFILE,
> +        VIRTIO_VIDEO_PROFILE_H264_HIGH422PROFILE,
> +        VIRTIO_VIDEO_PROFILE_H264_HIGH444PREDICTIVEPROFILE,
> +        VIRTIO_VIDEO_PROFILE_H264_SCALABLEBASELINE,
> +        VIRTIO_VIDEO_PROFILE_H264_SCALABLEHIGH,
> +        VIRTIO_VIDEO_PROFILE_H264_STEREOHIGH,
> +        VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
> +        VIRTIO_VIDEO_PROFILE_H264_MAX =
> VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
> +
> +        /* VP8 */
> +        VIRTIO_VIDEO_PROFILE_VP8_MIN = 0x200,
> +        VIRTIO_VIDEO_PROFILE_VP8_ANY = VIRTIO_VIDEO_PROFILE_VP8_MIN,
> +        VIRTIO_VIDEO_PROFILE_VP8_MAX = VIRTIO_VIDEO_PROFILE_VP8_ANY,
> +
> +        /* VP9 */
> +        VIRTIO_VIDEO_PROFILE_VP9_MIN = 0x300,
> +        VIRTIO_VIDEO_PROFILE_VP9_PROFILE0 = VIRTIO_VIDEO_PROFILE_VP9_MIN,
> +        VIRTIO_VIDEO_PROFILE_VP9_PROFILE1,
> +        VIRTIO_VIDEO_PROFILE_VP9_PROFILE2,
> +        VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
> +        VIRTIO_VIDEO_PROFILE_VP9_MAX = VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
> +};
> +
> +struct virtio_video_format_range {
> +        le32 min;
> +        le32 max;
> +        le32 step;
> +        u8 paddings[4];

Here you padded at 8-byte like many other structures but not for
virtio_video_ctrl_hdr. Is this expected?

> +};
> +
> +struct virtio_video_format_desc {
> +        le32 format;  /* One of VIRTIO_VIDEO_FORMAT_* types */
> +        le32 profile; /* One of VIRTIO_VIDEO_PROFILE_* types */
> +        le64 mask;

This will limit the formats to 64 while "num_descs" below is a
32 bit.

> +        struct virtio_video_format_range width;
> +        struct virtio_video_format_range height;
> +        le32 num_rates;
> +        u8 padding[4];
> +        /* Followed by struct virtio_video_frame_rate frame_rates[] */
> +};
> +
> +struct virtio_video_get_capability_resp {
> +        struct virtio_video_ctrl_hdr hdr;
> +        le32 num_descs;
> +        /* Followed by struct virtio_video_format_desc desc[] */
> +};
> +\end{lstlisting}
> +
> +The format description \field{struct virtio_video_format_desc}
> +includes the following fields:
> +\begin{description}
> +\item[\field{format}] specifies an image format. The device MUST set one
> +  of \field{enum virtio_video_format}.
> +\item[\field{profile}] specifies a profile of the compressed image format
> +  specified in \field{format}. The driver SHOULD ignore this value if
> +  \field{format} is a raw format.

Why not documenting that MUST be VIRTIO_VIDEO_PROFILE_UNDEFINED for
raw formats so the field could be extended in the future?

> +\item[\field{mask}] is a bitset that represents the supported
> +  combination of input and output format. If \textit{i}-th bit is set
> +  in \field{mask} of \textit{j}-th \field{struct
> +  virtio_video_format_desc} for input, the device supports encoding or
> +  decoding from the \textit{j}-th input format to \textit{i}-th output
> +  format.
> +\item[\field{width, height}] represents a range of resolutions
> +  supported by the device. If its \field{step} is not applicable, its
> +  \field{min} is equal to its \field{max}.
> +\item[\field{num_rates}] is the length of an array \field{frame_rates}. In
> case of decoder, the driver SHOULD ignore this value.
> +\item[\field{frame_rates}] is an array of supported frame rates.

I suppose here we are talking about bitrates, right? Could be confused by
FPS.

> +\end{description}
> +
> +\item[VIRTIO_VIDEO_T_STREAM_CREATE] create a video stream (context)
> +  within the device.
> +
> +\begin{lstlisting}
> +enum virtio_video_mem_type {
> +        VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES,
> +};
> +
> +struct virtio_video_stream_create {
> +        struct virtio_video_ctrl_hdr hdr;
> +        le32 in_mem_type;  /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
> +        le32 out_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
> +        char debug_name[64];
> +};

This structure has a size not multiple of 8-bytes. Not an issue, but
the same apply to other structures that instead are padded to 8-byte size.

> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{in_mem_type}] is a type of buffer management for input
> +buffers. The driver MUST set a value in \field{enum
> +virtio_video_mem_type}.
> +\item[\field{out_mem_type}] is a type of buffer management for output
> +buffers. The driver MUST set a value in \field{enum
> +virtio_video_mem_type}.
> +\item[\field{debug_name}] is a text string for a debug purpose.

Must be NUL-terminated ? UTF-8 ?

> +\end{description}
> +
> +\item[VIRTIO_VIDEO_T_STREAM_DESTROY] destroy a video stream (context)
> +  within the device.
> +
> +\begin{lstlisting}
> +struct virtio_video_stream_destroy {
> +        struct virtio_video_ctrl_hdr hdr;
> +};
> +\end{lstlisting}
> +
> +\item[VIRTIO_VIDEO_T_STREAM_DRAIN] ask the device to push all the
> +  queued buffers through the pipeline.
> +
> +\begin{lstlisting}
> +struct virtio_video_stream_drain {
> +        struct virtio_video_ctrl_hdr hdr;
> +};
> +\end{lstlisting}
> +
> +\item[VIRTIO_VIDEO_T_RESOURCE_CREATE] create a resource descriptor
> +  within the device.
> +
> +\begin{lstlisting}
> +struct virtio_video_mem_entry {
> +        le64 addr;
> +        le32 length;
> +        u8 padding[4];
> +};
> +
> +struct virtio_video_resource_create {
> +        struct virtio_video_ctrl_hdr hdr;
> +        le32 resource_id;
> +        le32 nr_entries;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{resource_id}] internal id of the resource.

Is it input or output?

> +\item[\field{nr_entries}] number of \field{struct
> +  virtio_video_mem_entry} memory entries.

I suppose that the structure is followed by an array of
virtio_video_mem_entry after a padding of 4-bytes for
alignment.

> +\end{description}
> +
> +\item[VIRTIO_VIDEO_T_RESOURCE_DESTROY] destroy a resource descriptor
> +  within the device.
> +
> +\begin{lstlisting}
> +struct virtio_video_resource_destroy {
> +        struct virtio_video_ctrl_hdr hdr;
> +        le32 resource_id;
> +        u8 padding[4];

Is this padding for future extensions?

> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{resource_id}] internal id of the resource.
> +\end{description}
> +
> +\item[VIRTIO_VIDEO_T_RESOURCE_QUEUE] Add a buffer to the device's
> +queue.
> +
> +\begin{lstlisting}
> +#define VIRTIO_VIDEO_MAX_PLANES 8
> +
> +struct virtio_video_resource_queue {
> +        struct virtio_video_ctrl_hdr hdr;
> +        le32 buf_type;
> +        le32 resource_id;
> +        le64 timestamp;

I suppose you would like this field aligned to avoid
hidden paddings.

> +        le32 nr_data_size;
> +        le32 data_size[VIRTIO_VIDEO_MAX_PLANES];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{buf_type}] buf_type of the .
> +\item[\field{resource_id}] internal id of the resource.
> +\item[\field{timestamp}] an abstract sequence counter that can be used
> +  for synchronisation.
> +\item[\field{nr_data_size}] number of \field{data_size} entries.
> +\item[\field{data_size}] number of data bytes within a plane.
> +\end{description}
> +
... omissis ...
> --
> 2.24.1.735.g03f4e72817-goog
> 
> 

Frediano

