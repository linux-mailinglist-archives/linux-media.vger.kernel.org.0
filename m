Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF623B76C0
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 11:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389054AbfISJxH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 05:53:07 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:47319 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388980AbfISJxH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 05:53:07 -0400
Received: from [IPv6:2001:983:e9a7:1:c95c:52f0:f173:9443] ([IPv6:2001:983:e9a7:1:c95c:52f0:f173:9443])
        by smtp-cloud9.xs4all.net with ESMTPA
        id At7Tim0HIz6EAAt7VivYdz; Thu, 19 Sep 2019 11:53:01 +0200
Subject: Re: [PATCH] [RFC RESEND] vdec: Add virtio video decode device
 specification
To:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org
Cc:     acourbot@chromium.org, alexlau@chromium.org, dgreid@chromium.org,
        marcheu@chromium.org, posciak@chromium.org, stevensd@chromium.org,
        tfiga@chromium.org, linux-media@vger.kernel.org
References: <20190919093404.182015-1-keiichiw@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bb079739-d8f7-9050-672f-fa2ea9184977@xs4all.nl>
Date:   Thu, 19 Sep 2019 11:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190919093404.182015-1-keiichiw@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfILSygcI+uALcgrhXjuOOFnyTq13b5uxLwP6wLsXBNXpSGO9pBbWk5J92Ev9uUpB/KAq6TS3Y75pP8ayN8BKW79zD6w9qBrhc9U22zEAIJbgbA8ztXyT
 hbchQr0Kkyms9fm8d7XBXf+WXv250r2rje3FSZasjTmLHAl2r8JoBx7gsSJrH9N6LCKjpVS4HG+J9gEC1A/zVSOmv8LHMy802sfBSy3Nbzf0Z8F5gLhUSEsu
 01/Z8zFnZ4R+Bm8WhA9+my1TNJFJpSR2aArn9syjO+0bqQfH3S8TD+fJ1t3AF+4k+jBMEBUT1e3drXeusw95kICT6DOO8Q0Pw1bhzBEJ3Xs2lo73q4tUUqal
 G32aauhVtEnVZfgdff080BOISMuJzPna53TNMbSRJoCwrfHlcRZr+7MH2o83eW7qk7WcMMgB4IRRjFmTkvEDQdRBs7oEeiYxLFvR7ivpMDtZlb8/BnkOMNOA
 8Ei82DYOyR41YjzteOagZ29djO+nLxJcy8Ot8au+u5sSoX8x3SaTkPF18mRxOx0JRLLNAXVywLM7Xzxj57aiby7AvAAw2n2Ltre49eswBS2RFaqOXlwcz0qh
 9Ec=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Keiichi,

On 9/19/19 11:34 AM, Keiichi Watanabe wrote:
> [Resending because of some issues with sending to virtio-dev. Sorry for the noise.]
> 
> This patch proposes virtio specification for new virtio video decode
> device.
> This device provides the functionality of hardware accelerated video
> decoding from encoded video contents provided by the guest into frame
> buffers accessible by the guest.
> 
> We have prototype implementation for VMs on Chrome OS:
> * virtio-vdec device in crosvm [1]
> * virtio-vdec driver in Linux kernel v4.19 [2]
>   - This driver follows V4L2 stateful video decoder API [3].
> 
> Our prototype implementation uses [4], which allows the virtio-vdec
> device to use buffers allocated by virtio-gpu device.
> 
> Any feedback would be greatly appreciated. Thank you.

I'm not a virtio expert, but as I understand it the virtio-vdec driver
looks like a regular v4l2 stateful decoder devices to the guest, while
on the host there is a driver (or something like that) that maps the
virtio-vdec requests to the actual decoder hardware, right?

What concerns me a bit (but there may be good reasons for this) is that
this virtio driver is so specific for stateful decoders.

How does this scale to stateful encoders? Stateless codecs? Other M2M
devices like deinterlacers or colorspace converters? What about webcams?

In other words, I would like to see a bigger picture here.

Note that there is also an effort for Xen to expose webcams to a guest:

https://www.spinics.net/lists/linux-media/msg148629.html

This may or may not be of interest. This was an RFC only, and I haven't
seen any follow-up patches with actual code.

There will be a half-day meeting of media developers during the ELCE
in October about codecs. I know Alexandre and Tomasz will be there.
It might be a good idea to discuss this in more detail if needed.

Regards,

	Hans

> 
> [1] https://chromium-review.googlesource.com/q/hashtag:%22virtio-vdec-device%22+(status:open%20OR%20status:merged)
> [2] https://chromium-review.googlesource.com/q/hashtag:%22virtio-vdec-driver%22+(status:open%20OR%20status:merged)
> [3] https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-decoder.html (to be merged to Linux 5.4)
> [4] https://lkml.org/lkml/2019/9/12/157
> 
> Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
> ---
>  content.tex     |   1 +
>  virtio-vdec.tex | 750 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 751 insertions(+)
>  create mode 100644 virtio-vdec.tex
> 
> diff --git a/content.tex b/content.tex
> index 37a2190..b57d4a9 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -5682,6 +5682,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  \input{virtio-input.tex}
>  \input{virtio-crypto.tex}
>  \input{virtio-vsock.tex}
> +\input{virtio-vdec.tex}
> 
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> 
> diff --git a/virtio-vdec.tex b/virtio-vdec.tex
> new file mode 100644
> index 0000000..d117129
> --- /dev/null
> +++ b/virtio-vdec.tex
> @@ -0,0 +1,750 @@
> +\section{Video Decode Device}
> +\label{sec:Device Types / Video Decode Device}
> +
> +virtio-vdec is a virtio based video decoder. This device provides the
> +functionality of hardware accelerated video decoding from encoded
> +video contents provided by the guest into frame buffers accessible by
> +the guest.
> +
> +\subsection{Device ID}
> +\label{sec:Device Types / Video Decode Device / Device ID}
> +
> +28
> +
> +\subsection{Virtqueues}
> +\label{sec:Device Types / Video Decode Device / Virtqueues}
> +
> +\begin{description}
> +\item[0] outq - queue for sending requests from the driver to the
> +  device
> +\item[1] inq - queue for sending requests from the device to the
> +  driver
> +\end{description}
> +
> +Each queue is used uni-directionally. outq is used to send requests
> +from the driver to the device (i.e., guest requests) and inq is used
> +to send requests in the other direction (i.e., host requests).
> +
> +\subsection{Feature bits}
> +\label{sec:Device Types / Video Decode Device / Feature bits}
> +
> +There are currently no feature bits defined for this device.
> +
> +\subsection{Device configuration layout}
> +\label{sec:Device Types / Video Decode Device / Device configuration layout}
> +
> +None.
> +
> +\subsection{Device Requirements: Device Initialization}
> +\label{sec:Device Types / Video Decode Device / Device Requirements: Device Initialization}
> +
> +The virtqueues are initialized.
> +
> +\subsection{Device Operation}
> +\label{sec:Device Types / Video Decode Device / Device Operation}
> +
> +\subsubsection{Video Buffers}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Buffers}
> +
> +A virtio-vdec driver and a device use two types of video buffers:
> +\emph{bitstream buffer} and \emph{frame buffer}. A bitstream buffer
> +contains encoded video stream data. This buffer is similar to an
> +OUTPUT buffer for Video for Linux Two (V4L2) API. A frame buffer
> +contains decoded video frame data like a CAPTURE buffers for V4L2 API.
> +The driver and the device share these buffers, and each buffer is
> +identified by a unique integer called a \emph{resource handle}.
> +
> +\subsubsection{Guest Request}
> +
> +The driver queues requests to the outq virtqueue. The device MAY
> +process requests out-of-order. All requests on outq use the following
> +structure:
> +
> +\begin{lstlisting}
> +enum virtio_vdec_guest_req_type {
> +        VIRTIO_VDEC_GUEST_REQ_UNDEFINED = 0,
> +
> +        /* Global */
> +        VIRTIO_VDEC_GUEST_REQ_QUERY = 0x0100,
> +
> +        /* Per instance */
> +        VIRTIO_VDEC_GUEST_REQ_OPEN = 0x0200,
> +        VIRTIO_VDEC_GUEST_REQ_SET_BUFFER_COUNT,
> +        VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER,
> +        VIRTIO_VDEC_GUEST_REQ_ACK_STREAM_INFO,
> +        VIRTIO_VDEC_GUEST_REQ_FRAME_BUFFER,
> +        VIRTIO_VDEC_GUEST_REQ_BITSTREAM_BUFFER,
> +        VIRTIO_VDEC_GUEST_REQ_DRAIN,
> +        VIRTIO_VDEC_GUEST_REQ_FLUSH,
> +        VIRTIO_VDEC_GUEST_REQ_CLOSE,
> +};
> +
> +struct virtio_vdec_guest_req {
> +        le32 type;
> +        le32 instance_id;
> +        union {
> +                struct virtio_vdec_guest_req_open open;
> +                struct virtio_vdec_guest_req_set_buffer_count set_buffer_count;
> +                struct virtio_vdec_guest_req_register_buffer register_buffer;
> +                struct virtio_vdec_guest_req_bitstream_buffer bitstream_buffer;
> +                struct virtio_vdec_guest_req_frame_buffer frame_buffer;
> +        };
> +};
> +\end{lstlisting}
> +
> +This structure includes the following generic fields to identify the
> +request:
> +\begin{description}
> +\item[\field{type}] specifies the type of the guest request using
> +  values from \field{enum virtio_vdec_guest_req_type}.
> +\item[\field{instance_id}] specifies an instance ID. This field is
> +  ignored unless \field{type} represents a per-instance request.
> +\end{description}
> +
> +The union fields are additional per-request data used only when
> +\field{type} has a specific value:
> +
> +\begin{description}
> +\item[\field{open}] is used when \field{type} is set to
> +  VIRTIO_VDEC_GUEST_REQ_OPEN. See \ref{sec:Device Types / Video Decode
> +    Device / Device Operation / Instance Open}.
> +\item[\field{set_buffer_count}] is used when \field{type} is set to
> +  VIRTIO_VDEC_GUEST_REQ_SET_BUFFER_COUNT. See \ref{sec:Device Types /
> +    Video Decode Device / Device Operation / Set Buffer Count}.
> +\item[\field{register_buffer}] is used when \field{type} is set to
> +  VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER. See \ref{sec:Device Types /
> +    Video Decode Device / Device Operation / Buffer Registration}.
> +\item[\field{bitstream_buffer}] is used when \field{type} is set to
> +  VIRTIO_VDEC_GUEST_REQ_BITSTREAM_BUFFER. See \ref{sec:Device Types /
> +    Video Decode Device / Device Operation / Bitstream Buffer
> +    Requests}.
> +\item[\field{frame_buffer}] is used when \field{type} is set to
> +  VIRTIO_VDEC_GUEST_REQ_FRAME_BUFFER. See \ref{sec:Device Types /
> +    Video Decode Device / Device Operation / Frame Buffer Requests}.
> +\end{description}
> +
> +\subsubsection{Host Request}
> +
> +The device queues requests to the inq virtqueue. All requests on inq
> +use the following structure:
> +
> +\begin{lstlisting}
> +enum virtio_vdec_host_req_type {
> +        VIRTIO_VDEC_HOST_REQ_UNDEFINED = 0,
> +
> +        /* Global */
> +        VIRTIO_VDEC_HOST_REQ_QUERY = 0x0100,
> +
> +        /* Per instance */
> +        VIRTIO_VDEC_HOST_REQ_OPEN = 0x0200,
> +        VIRTIO_VDEC_HOST_REQ_SET_BUFFER_COUNT,
> +        VIRTIO_VDEC_HOST_REQ_REGISTER_BUFFER,
> +        VIRTIO_VDEC_HOST_REQ_BITSTREAM_BUFFER,
> +        VIRTIO_VDEC_HOST_REQ_STREAM_INFO,
> +        VIRTIO_VDEC_HOST_REQ_FRAME_BUFFER,
> +        VIRTIO_VDEC_HOST_REQ_DRAINED,
> +        VIRTIO_VDEC_HOST_REQ_FLUSHED,
> +        VIRTIO_VDEC_HOST_REQ_CLOSE,
> +        VIRTIO_VDEC_HOST_REQ_EOS,
> +
> +        /* Error response */
> +        VIRTIO_VDEC_HOST_REQ_NOTIFY_GLOBAL_ERROR = 0x1100,
> +};
> +
> +enum virtio_vdec_host_req_result {
> +        /* Success */
> +        VIRTIO_VDEC_HOST_REQ_RESULT_SUCCESS = 0,
> +
> +        /* Error */
> +        VIRTIO_VDEC_HOST_REQ_RESULT_ERROR_UNSPEC = 0x1000,
> +        VIRTIO_VDEC_HOST_REQ_RESULT_ERROR_INVALID_REQUEST,
> +};
> +
> +struct virtio_vdec_host_req {
> +        le32 type;     /* VIRTIO_VDEC_HOST_REQ_* */
> +        le32 result;   /* VIRTIO_VDEC_HOST_REQ_RESULT_ */
> +        le32 instance_id;
> +        le32 reserved; /* for 64-bit alignment */
> +        union {
> +                struct virtio_vdec_host_req_query query;
> +                struct virtio_vdec_host_req_set_buffer_count set_buffer_count;
> +                struct virtio_vdec_host_req_register_buffer register_buffer;
> +                struct virtio_vdec_host_req_bitstream_buffer bitstream_buffer;
> +                struct virtio_vdec_host_req_stream_info stream_info;
> +                struct virtio_vdec_host_req_frame_buffer frame_buffer;
> +        };
> +};
> +\end{lstlisting}
> +
> +This structure includes the following generic fields:
> +\begin{description}
> +\item[\field{type}] specifies the type of the host request using
> +  values from \field{enum virtio_vdec_host_req_type}.
> +\item[\field{result}] specifies the result of the operation using the
> +  \field{enum virtio_vdec_host_req_result}.
> +\item[\field{instance_id}] specifies an instance ID. This field is
> +  ignored unless \field{type} represents a per-instance request.
> +\end{description}
> +
> +The union fields are additional per-request data used only when
> +\field{type} has a specific value:
> +
> +\begin{description}
> +\item[\field{query}] is used when \field{type} is set to
> +  VIRTIO_VDEC_HOST_REQ_QUERY. See \ref{sec:Device Types / Video Decode
> +    Device / Device Operation / Query Capabilities}.
> +\item[\field{set_buffer_count}] is used when \field{type} is set to
> +  VIRTIO_VDEC_HOST_REQ_SET_BUFFER_COUNT. See \ref{sec:Device Types /
> +    Video Decode Device / Device Operation / Set Buffer Count}.
> +\item[\field{register_buffer}] is used when \field{type} is set to
> +  VIRTIO_VDEC_HOST_REQ_REGISTER_BUFFER. See \ref{sec:Device Types /
> +    Video Decode Device / Device Operation / Buffer Registration}.
> +\item[\field{bitstream_buffer}] is used when \field{type} is set to
> +  VIRTIO_VDEC_HOST_REQ_BITSTREAM_BUFFER. See \ref{sec:Device Types /
> +    Video Decode Device / Device Operation / Bitstream Buffer
> +    Requests}.
> +\item[\field{stream_info}] is used when \field{type} is set to
> +  VIRTIO_VDEC_HOST_REQ_STREAM_INFO. See \ref{sec:Device Types / Video
> +    Decode Device / Device Operation / Stream Information}.
> +\item[\field{frame_buffer}] is used when \field{type} is set to
> +  VIRTIO_VDEC_HOST_REQ_FRAME_BUFFER. See \ref{sec:Device Types / Video
> +    Decode Device / Device Operation / Frame Buffer Requests}.
> +\end{description}
> +
> +\subsubsection{Query Capabilities}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Query Capabilities}
> +
> +The driver can send VIRTIO_VDEC_GUEST_REQ_QUERY to query supported
> +bitstream formats and frame formats. This is similar to
> +VIDIOC_ENUM_FMT ioctl and VIDIOC_ENUM_FRAMESIZES ioctl for V4L2
> +devices.
> +
> +The device sends supported formats as VIRTIO_VDEC_HOST_REQ_QUERY with
> +the following structure:
> +
> +\begin{lstlisting}
> +struct virtio_vdec_range {
> +        le32 min;
> +        le32 max;
> +        le32 step;
> +};
> +
> +struct virtio_vdec_format_desc {
> +        le32 fourcc;
> +        le32 mask;
> +        struct virtio_vdec_range width;
> +        struct virtio_vdec_range height;
> +};
> +
> +#define VIRTIO_VDEC_NUM_FORMATS 32
> +
> +struct virtio_vdec_host_req_query {
> +        struct virtio_vdec_format_desc bitstream_formats[VIRTIO_VDEC_NUM_FORMATS];
> +        struct virtio_vdec_format_desc frame_formats[VIRTIO_VDEC_NUM_FORMATS];
> +};
> +\end{lstlisting}
> +
> +The \field{virtio_vdec_host_req_query} describes the set of supported
> +bitstream and frame formats, with corresponding ranges of image
> +resolution and compatibility mask to determine the compatibility
> +between coded and raw formats.
> +
> +\begin{description}
> +\item[fourcc] specifies a FOURCC of a supported video codec or a pixel
> +  format.
> +\item[mask] is used to represent supported combination of video codec
> +  and pixel format. If i-th bit is set in \field{mask} of the
> +  \field{bitstream_formats[j]}, the device MUST support decoding from
> +  the video codec of \field{bitstream_formats[j]} to the pixel format
> +  of \field{frame_formats[i]}.
> +\item[width/height] represents either a supported stream resolution or
> +  a supported frame buffer resolution.
> +\end{description}
> +
> +\devicenormative{\paragraph}{Query Capabilities}{Device Types / Video
> +  Decode Device / Device Operation / Query Capabilities}
> +
> +The device MUST set \field{mask} to 0 if the \field{struct
> +  virtio_vdec_format_desc} is invalid in VIRTIO_VDEC_HOST_REQ_QUERY.
> +
> +\subsubsection{Instance Open}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Instance Open}
> +
> +To acquire a decoder instance for a given coded format, the driver
> +sends a VIRTIO_VDEC_GUEST_REQ_OPEN request. The driver specifies a
> +video codec with the following structure:
> +
> +\begin{lstlisting}
> +struct virtio_vdec_guest_req_open {
> +        le32 bitstream_fourcc;
> +};
> +\end{lstlisting}
> +
> +When the guest request comes, the device allocates the instance and
> +sends a VIRTIO_VDEC_HOST_REQ_OPEN request.
> +
> +Once the driver recieves VIRTIO_VDEC_HOST_REQ_OPEN, the driver can
> +send per-instance guest requests to the opened instance by specifying
> +\field{instance_id}. The device MUST process per-instance requests
> +with a same value of \field{instance_id} in order.
> +
> +\drivernormative{\paragraph}{Instance Open}{Device Types / Video
> +  Decode Device / Device Operation / Instance Open}
> +
> +In VIRTIO_VDEC_GUEST_REQ_OPEN,
> +\begin{itemize*}
> +\item The driver MUST set \field{bitstream_fourcc} to a FOURCC of a
> +  video codec that is supported by the device.
> +\item The driver MUST set \field{instance_id} to an integer that is
> +  not used as an \field{instance_id} before.
> +\end{itemize*}
> +
> +\devicenormative{\paragraph}{Instance Open}{Device Types / Video
> +  Decode Device / Device Operation / Instance Open}
> +
> +If the device fails to allocate an instance, the device MUST set
> +\field{result} to a value other than
> +VIRTIO_VDEC_HOST_REQ_RESULT_SUCCESS.
> +
> +\subsubsection{Set Buffer Count}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Set Buffer Count}
> +
> +Once an instance is acquired, the driver and the device negotiate the
> +number of buffers to use during the decoding process by
> +VIRTIO_VDEC_GUEST_REQ_SET_BUFFER_COUNT and
> +VIRTIO_VDEC_HOST_REQ_SET_BUFFER_COUNT. These requests are similar to
> +VIDIOC_REQBUFS controls for V4L2 devices. First, the driver sends
> +VIRTIO_VDEC_GUEST_REQ_SET_BUFFER_COUNT to tell how many buffers the
> +driver needs by using the following structure:
> +
> +\begin{lstlisting}
> +enum virtio_vdec_buffer_type {
> +        VIRTIO_VDEC_GUEST_REQ_BUFFER_TYPE_BITSTREAM = 0,
> +        VIRTIO_VDEC_GUEST_REQ_BUFFER_TYPE_FRAME = 1,
> +};
> +
> +struct virtio_vdec_guest_req_set_buffer_count {
> +        le32 type;
> +        le32 buffer_count;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[type] specifies a buffer type with a value of the
> +  \field{virtio_vdec_buffer_type}.
> +\item[buffer_count] is the minimum number of buffers that the driver
> +  needs to use.
> +\end{description}
> +
> +The device responds the VIRTIO_VDEC_GUEST_REQ_SET_BUFFER_COUNT to
> +notify the number of buffers that it can accept with the following
> +structure.
> +
> +\begin{lstlisting}
> +struct virtio_vdec_host_req_set_buffer_count {
> +        le32 type;
> +        le32 buffer_count;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[type] specifies a buffer type with a value of the
> +  \field{virtio_vdec_buffer_type}.
> +\item[buffer_count] is the maximum number of buffers that the device
> +  can accept.
> +\end{description}
> +
> +\drivernormative{\paragraph}{Set Buffer Count}{Device Types / Video
> +  Decode Device / Device Operation / Set Buffer Count}
> +
> +The driver MUST set \field{buffer_count} to a non-zero value in
> +VIRTIO_VDEC_GUEST_REQ_SET_BUFFER_COUNT. The value of
> +\field{buffer_count} for frame buffers MUST match the requirement
> +given via VIRTIO_VDEC_HOST_REQ_STREAM_INFO. See \ref{sec:Device Types
> +  / Video Decode Device / Device Operation / Stream Information}.
> +
> +\devicenormative{\paragraph}{Set Buffer Count}{Device Types / Video
> +  Decode Device / Device Operation / Set Buffer Count}
> +
> +The device MUST set \field{buffer_count} to a number of buffers that
> +the device can accept. The value MAY be different from the value the
> +driver set \field{buffer_count} to in the corresponding
> +VIRTIO_VDEC_GUEST_REQ_SET_BUFFER_COUNT request.
> +
> +\subsubsection{Buffer Registration}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Buffer Registration}
> +
> +Once the number of buffers is set, the driver registers metadata of
> +buffers via the VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER with the
> +following structure:
> +
> +\begin{lstlisting}
> +#define VIRTIO_VDEC_MAX_PLANES 8
> +
> +struct virtio_vdec_guest_req_register_buffer {
> +        le32 type;
> +        le32 num_planes;
> +        struct virtio_vdec_plane {
> +                le32 handle;
> +                le32 offset;
> +                le32 length;
> +        } planes[VIRTIO_VDEC_MAX_PLANES];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[VIRTIO_VDEC_MAX_PLANES] is the maximum number of planes that a
> +  video format needs. It is similar to VIDEO_MAX_PLANES in
> +  \href{https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/videodev2.h}{include/uapi/linux/videodev2.h}
> +  in the Linux source tree.
> +\item[type] specifies a buffer type with a value of the
> +  \field{virtio_vdec_buffer_type}.
> +\item[num_planes] is the number of planes (i.e. separate memory
> +  buffers) for this format. This indicates the number of valid entries
> +  in \field{planes}.
> +\item[planes] is an array of structures describing information of each
> +  plane.
> +  \begin{description}
> +  \item[handle] is a resource handle for the buffer.
> +  \item[offset] equals to the offset in the plane to the start of
> +    data.
> +  \item[length] is the size of this plane in bytes.
> +  \end{description}
> +\end{description}
> +
> +Once the device accepts the buffer registration, the device responds
> +the VIRTIO_VDEC_HOST_REQ_REGISTER_BUFFER with the following structure.
> +
> +\begin{lstlisting}
> +struct virtio_vdec_host_req_register_buffer {
> +        le32 type;
> +        le32 handles[VIRTIO_VDEC_MAX_PLANES];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[type] specifies a buffer type with a value of the
> +  \field{virtio_vdec_buffer_type}.
> +\item[handles] is an array of resource handles from the corresponding
> +  guest request.
> +\end{description}
> +
> +\drivernormative{\paragraph}{Buffer Registration}{Device Types / Video
> +  Decode Device / Device Operation / Buffer Registration}
> +
> +The VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER requires followings:
> +
> +\begin{itemize*}
> +\item The driver MUST set \field{type}.
> +\item The driver MUST set \field{num_planes} to a non-zero value that
> +  is less than of equal to VIRTIO_VDEC_MAX_PLANES.
> +\item The driver MUST fill out the fields of \field{planes[i]} for
> +  each \(0 \le i < \field{num_planes} \).
> +\item The driver MUST NOT send VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER
> +  more than the number of times that the device requested via
> +  VIRTIO_VDEC_HOST_REQ_SET_BUFFER_COUNT.
> +\end{itemize*}
> +
> +\devicenormative{\paragraph}{Buffer Registration}{Device Types / Video
> +  Decode Device / Device Operation / Buffer Registration}
> +
> +The VIRTIO_VDEC_HOST_REQ_REGISTER_BUFFER requires followings:
> +
> +\begin{itemize*}
> +\item The device MUST set \field{type} to the value that the
> +  corresponding VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER used.
> +\item The device MUST set \field{handles[i]} to the value that equals
> +  to \field{register_buffer.planes[i].handle} in the corresponding
> +  VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER.
> +\end{itemize*}
> +
> +\subsubsection{Bitstream Buffer Requests}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Bitstream Buffer Requests}
> +
> +The driver sends VIRTIO_VDEC_GUEST_REQ_BITSTREAM_BUFFER to ask the
> +device to decode contents in a registered bitstream buffer. This
> +request is similar to the V4L2's VIDIOC_QBUF ioctl for the OUTPUT
> +buffer. The following structure is used to specify the buffer:
> +
> +\begin{lstlisting}
> +struct virtio_vdec_guest_req_bitstream_buffer {
> +        le32 handle;
> +        le32 offset;
> +        le32 length;
> +        le64 cookie;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[handle] is a resource handle for the bitstream buffer to be
> +  decoded.
> +\item[offset] is the offset in bytes to video data in the buffer.
> +\item[length] is the size of valid data in the buffer.
> +\item[cookie] is an identifier for the frame decoded from this
> +  bitstream data. This cookie will be copied to the matching frame
> +  buffer. See also \field{virtio_vdec_host_req_frame_buffer} in
> +  \ref{sec:Device Types / Video Decode Device / Device Operation /
> +    Frame Buffer Requests}.
> +\end{description}
> +
> +Once the device consumes the bitstream passed by the
> +VIRTIO_VDEC_GUEST_REQ_BITSTREAM_BUFFER request, it sends
> +VIRTIO_VDEC_HOST_REQ_BITSTREAM_BUFFER with the following structure:
> +
> +\begin{lstlisting}
> +struct virtio_vdec_host_req_bitstream_buffer {
> +        le32 handle;
> +};
> +\end{lstlisting}
> +\begin{description}
> +\item[handle] is a resource handle of the bitstream buffer that the
> +  device completed processing.
> +\end{description}
> +
> +The driver can reuse bitstream buffers that
> +VIRTIO_VDEC_HOST_REQ_BITSTREAM is sent for.
> +
> +\drivernormative{\paragraph}{Bitstream Buffer Requests}{Device Types /
> +  Video Decode Device / Device Operation / Bitstream Buffer Requests}
> +
> +\begin{itemize*}
> +\item The driver MUST use \field{handle} which is already registered
> +  by the VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER.
> +\end{itemize*}
> +
> +\subsubsection{Stream Information}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Stream Information}
> +
> +To obtain the information required to allocate frame buffers
> +(resolution, etc.), the driver registers bitstream buffers first and
> +proceeds with queuing VIRTIO_VDEC_GUEST_REQ_BITSTREAM_BUFFER requests
> +until stream information is received via a
> +VIRTIO_VDEC_HOST_REQ_STREAM_INFO host request. The
> +VIRTIO_VDEC_HOST_REQ_STREAM_INFO is also sent when a run-time
> +resolution change is detected. This request is similar to
> +V4L2_EVENT_SOURCE_CHANGE events for V4L2 devices.
> +
> +The following structure is used for the
> +VIRTIO_VDEC_HOST_REQ_STREAM_INFO:
> +
> +\begin{lstlisting}
> +struct virtio_vdec_host_req_stream_info {
> +        le32 frame_fourcc;
> +        le32 fb_width;
> +        le32 fb_height;
> +        le32 min_frame_buffer_count;
> +        le32 max_frame_buffer_count;
> +        struct virtio_vdec_host_req_stream_crop {
> +                le32 left;
> +                le32 top;
> +                le32 width;
> +                le32 height;
> +        } crop;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[frame_fourcc] indicates the pixel format that the video is
> +  decoded to.
> +\item[fb_width] is the width of a required frame buffer.
> +\item[fb_height] is the height of a required frame buffer.
> +\item[min_frame_buffer_count] is the minimum number of frame buffers
> +  that the device requires.
> +\item[max_frame_buffer_count] is the maximum number of frame buffers
> +  that the device can accept.
> +\item[crop] indicates video cropping information.
> +    \begin{description}
> +    \item[left] is the horizontal offset of the left-most valid pixel
> +      of the video in pixels.
> +    \item[top] is the vertical offset of the top-most valid line of
> +      the video in lines.
> +    \item[width] is the width of the rectangle in pixels.
> +    \item[height] is the height of the rectangle in pixels.
> +    \end{description}
> +\end{description}
> +
> +The driver responds the VIRTIO_VDEC_GUEST_REQ_ACK_STREAM_INFO once it
> +processes the incoming stream information.
> +
> +\devicenormative{\paragraph}{Stream Information}{Device Types / Video
> +  Decode Device / Device Operation / Stream Information}
> +
> +\begin{itemize*}
> +\item After the device send the VIRTIO_VDEC_HOST_REQ_STREAM_INFO, the
> +  device MUST empty its list of registered frame buffers and skip any
> +  pending VIRTIO_VDEC_GUEST_REQ_FRAME_BUFFER requests until a
> +  VIRTIO_VDEC_GUEST_REQ_ACK_STREAM_INFO request is received.
> +\end{itemize*}
> +
> +\drivernormative{\paragraph}{Stream Information}{Device Types / Video
> +  Decode Device / Device Operation / Stream Information}
> +
> +\begin{itemize*}
> +\item The driver MUST send the VIRTIO_VDEC_GUEST_REQ_ACK_STREAM_INFO
> +  once it processes a VIRTIO_VDEC_HOST_REQ_STREAM_INFO.
> +\item If VIRTIO_VDEC_HOST_REQ_STREAM_INFO came when the driver is
> +  waiting for a VIRTIO_VDEC_HOST_REQ_FRAME_BUFFER request, the driver
> +  MUST enqueue the corresponding VIRTIO_VDEC_GUEST_REQ_FRAME_BUFFER
> +  again after sending the VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER for a
> +  frame buffer with new stream information.
> +\end{itemize*}
> +
> +\subsubsection{Frame Buffer Requests}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Frame Buffer Requests}
> +
> +The driver provides frame buffers via
> +VIRTIO_VDEC_GUEST_REQ_FRAME_BUFFER, in which the device will fill
> +decoded frames. This request is similar to V4L2's VIDIOC_QBUF ioctl
> +for CAPTURE buffers. The following structure is used for the request:
> +
> +\begin{lstlisting}
> +struct virtio_vdec_guest_req_frame_buffer {
> +        struct virtio_vdec_frame_buffer_plane {
> +                le32 handle;
> +                le32 offset;
> +                le32 stride;
> +                le32 length;
> +        } planes[VIRTIO_VDEC_MAX_PLANES];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[planes] is an array of planes that a frame buffer consists of.
> +    \begin{description}
> +    \item[handle] is a resource handle to indicate the buffer for a
> +      plane.
> +    \item[offset] is the offset in bytes to the place where decoded
> +      frame is filled in.
> +    \item[stride] is the line stride.
> +    \item[length] is the length of plane where the device can fill in
> +      decoded data.
> +    \end{description}
> +\end{description}
> +
> +When the device fills the buffer with decoded frame data, the device
> +notifies to the driver by VIRTIO_VDEC_HOST_REQ_FRAME_BUFFER with the
> +following structure:
> +
> +\begin{lstlisting}
> +struct virtio_vdec_host_req_frame_buffer {
> +        le32 handle[VIRTIO_VDEC_MAX_PLANES];
> +        le64 cookie;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[handles] is an array of handles passed via the
> +  \field{virtio_vdec_guest_req_frame_buffer} in the corresponding
> +  VIRTIO_VDEC_GUEST_REQ_FRAME_BUFFER.
> +\item[cookie] is a \field{cookie} passed via a
> +  VIRTIO_VDEC_GUEST_REQ_BITSTREAM_BUFFER. This indicates a bitstream
> +  buffer which a frame was decoded from.
> +\end{description}
> +
> +\drivernormative{\paragraph}{Frame Buffer Requests}{Device Types /
> +  Video Decode Device / Device Operation / Frame Buffer Requests}
> +
> +\begin{itemize*}
> +\item Before the driver sends the VIRTIO_VDEC_GUEST_REQ_FRAME_BUFFER
> +  for a frame buffer, the driver MUST have sent the
> +  VIRTIO_VDEC_GUEST_REQ_REGISTER_BUFFER for the buffer.
> +\item The driver MUST send the VIRTIO_VDEC_GUEST_REQ_FRAME_BUFFER for
> +  a frame buffer that satisfies the restriction passed by
> +  VIRTIO_VDEC_HOST_REQ_STREAM_INFO.
> +\end{itemize*}
> +
> +\devicenormative{\paragraph}{Frame Buffer Requests}{Device Types /
> +  Video Decode Device / Device Operation / Frame Buffer Requests}
> +
> +When the device successfully processed the frame buffer, it MUST set
> +\field{cookie} to a value that is passed via a
> +VIRTIO_VDEC_GUEST_REQ_BITSTREAM_BUFFER request that provided the
> +corresponding bitstream.
> +
> +\subsubsection{Drain}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Drain}
> +
> +To ensure that any pending requests are processed and decoded frames
> +returned in appropriate replies, the driver MAY issue a
> +VIRTIO_VDEC_GUEST_REQ_DRAIN request. The device will continue
> +processing the requests as usual, but once all the requests of given
> +context preceding the DRAIN request are processed, the device will
> +issue a VIRTIO_VDEC_HOST_REQ_DRAINED host request to notify the driver
> +of this fact.
> +
> +\devicenormative{\paragraph}{Drain}{Device Types / Video Decode Device
> +  / Device Operation / Drain}
> +
> +\begin{itemize*}
> +\item When VIRTIO_VDEC_GUEST_REQ_DRAIN comes, the device MUST process
> +  all pending guest requests. After processing them, the device MUST
> +  send VIRTIO_VDEC_HOST_REQ_DRAINED to the driver.
> +\item While processing a drain request, the device MUST ignore any
> +  guest requests other than Flush and Close requests. See
> +  \ref{sec:Device Types / Video Decode Device / Device Operation / Flush}
> +  and
> +  \ref{sec:Device Types / Video Decode Device / Device Operation / Instance
> +    Close}.
> +\end{itemize*}
> +
> +\subsubsection{Flush}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Flush}
> +
> +To drop any pending decode requests and decoded frames pending on
> +output buffers, the driver MAY issue a VIRTIO_VDEC_GUEST_REQ_FLUSH
> +request. Any frames that would result from the previously enqueued
> +bitstream data will be dropped and the device will not write to any of
> +the frame buffers provided earlier.
> +
> +\devicenormative{\paragraph}{Flush}{Device Types / Video Decode Device
> +  / Device Operation / Flush}
> +
> +\begin{itemize*}
> +\item The device MUST send VIRTIO_VDEC_HOST_REQ_FLUSHED when finishing
> +  the flush process.
> +\item If VIRTIO_VDEC_GUEST_REQ_FLUSH comes while processing guest
> +  requests, the device MUST stop them.
> +\item The device MUST NOT process any guest request that comes after
> +  VIRTIO_VDEC_GUEST_REQ_FLUSH until it sends
> +  VIRTIO_VDEC_HOST_REQ_FLUSHED.
> +\item The device MUST dequeue all unread requests in outq when
> +  VIRTIO_VDEC_GUEST_REQ_FLUSH comes.
> +\end{itemize*}
> +
> +\subsubsection{EOS Notification}
> +\label{sec:Device Types / Video Decode Device / Device Operation / EOS Notification}
> +
> +The device sends VIRTIO_VDEC_HOST_REQ_EOS when the end of a stream
> +(EOS) is reached while decoding.
> +
> +This request is similar to the V4L2_EVENT_EOS for V4L2 devices.
> +
> +\subsubsection{Instance Close}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Instance Close}
> +
> +If a decoding instance is no longer needed, the driver SHOULD issue a
> +VIRTIO_VDEC_GUEST_REQ_CLOSE request. This will trigger an implicit
> +flush operation (as in a VIRTIO_VDEC_GUEST_REQ_FLUSH request; without
> +a following host request) and free the instance ID and any associated
> +resources on the device side.
> +
> +The instance is successfully terminated once the device responds to
> +the request. After that, it is guaranteed that any buffers registered
> +by the driver to given instance will no longer be accessed by the
> +device (unless also provided to another instance).
> +
> +\subsubsection{Error Reporting}
> +\label{sec:Device Types / Video Decode Device / Device Operation / Error Reporting}
> +
> +The device has two ways of reporting errors to the driver: one is for
> +errors associated with a host request, the other is for global errors.
> +
> +If an error is associated with a host request, the device sets
> +\field{type} to the host request and \field{result} to a value of
> +\field{virtio_vdec_host_req_result} describing the error in
> +\field{virtio_vdec_host_req}.
> +
> +If the device cannot proceed decoding due to an error which is not
> +associated with any requests, the device MUST send the
> +VIRTIO_VDEC_HOST_REQ_NOTIFY_GLOBAL_ERROR. In such case, the driver
> +MUST stop sending decoding requests.
> --
> 2.23.0.237.gc6a4ce50a0-goog
> 

