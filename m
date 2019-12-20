Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 611D8127F3C
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 16:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfLTP1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 10:27:06 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39975 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfLTP1G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 10:27:06 -0500
Received: by mail-lj1-f194.google.com with SMTP id u1so10390553ljk.7
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2019 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fBqMAAiiPpvY+spOe/eNrcWlQq1sVieSURW/xhkXwzE=;
        b=cCMIs15Ij7jrp+9mZ/fnjg5Qg7r5SGooBTC766upsvr4YtuRp+dHKYqrpZvm4wb2Wi
         FHHq/E+DS1138P1cJc1gaS0U/jJ1++KqFDYYgk+SjyVyNofHkKN+pVmCU+I6dHQH8SNM
         sjOOs5LeHxmK2nibI7tSJ2kC5AsJDC1gi6lW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fBqMAAiiPpvY+spOe/eNrcWlQq1sVieSURW/xhkXwzE=;
        b=bZ7l0hXQHXx2dQox3pYWkFQWayyUHdMZhCso5FgR737Ar295CEDnqVBthstDwO7Pvd
         V1Ovv1+k49X4IeJDgd2lnhCG+Lb2nujY4qMFuBzG+dKCKO50DgPY0PqzmVswvbkqletI
         yZZ5YyyTzXVGPsSP/eAaiNR3g9x0zzmynRpIuEFbhb+ZpkW7788bV0gmfFkfR4x6v7FD
         JUSGSZH9IdgE+5sGaHeXLomylQ1OBi94z04tH0qEpJe93zuhMta/oRll52eFkatHLcbN
         hNYqP0gxTQ+YMLJlDODKGvMCbN/0L4hBzlsCeqenQntSO5R4pW1bj9l9ldC97oRQlh3+
         50aA==
X-Gm-Message-State: APjAAAVrMD9+Q5+huRTQV8ZbnkTk0SLEID3c13dIzbe08eLwIW5M/7c3
        Jus4lV/A4hytwrYAkEiDkWN2W0Z3mS8QRYte8uUF8w==
X-Google-Smtp-Source: APXvYqwr+bGtHRdZGUwLsru1z4L7FQQTfr7KhMNl3gmH9+tVdby1mKBfi/0PBjgqa5BuX4sCFhgEf/Ww4LJSAna3d1A=
X-Received: by 2002:a2e:824a:: with SMTP id j10mr10244863ljh.209.1576855622012;
 Fri, 20 Dec 2019 07:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <20191218130214.170703-2-keiichiw@chromium.org> <2932378.s8JBUXtX1Y@os-lin-dmo>
In-Reply-To: <2932378.s8JBUXtX1Y@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Sat, 21 Dec 2019 00:26:50 +0900
Message-ID: <CAD90VcZU_jkY=wZ21R_abTnO8BrL_Sf4AO4Rfz3NP5xZMwmaHA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] virtio-video: Add virtio video device specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,
Thanks for the feedback.

On Thu, Dec 19, 2019 at 10:28 PM Dmitry Sepp
<dmitry.sepp@opensynergy.com> wrote:
>
> Hi Keiichi,
>
> Thank you for the update. Please see some comments below.
>
> Also, we need to bring the virtio_video_control back as it is in fact used by
> the driver to enumerate supported encoder controls. But yes, it still needs to
> be documemnted, it's true.

Yeah, we need it eventually, but I'm wondering what is the difference
between values set by SET_PARAMS and ones by controls.
I saw your driver implementation has BITRATE, PROFILE and LEVEL as
controls. What's the reason why you didn't add them in
virtio_video_params?

>
> On Mittwoch, 18. Dezember 2019 14:02:14 CET Keiichi Watanabe wrote:
> > From: Dmitry Sepp <dmitry.sepp@opensynergy.com>
> >
> > The virtio video encoder device and decoder device provide functionalities
> > to encode and decode video stream respectively.
> > Though video encoder and decoder are provided as different devices, they use
> > a same protocol.
> >
> > Signed-off-by: Dmitry Sepp <dmitry.sepp@opensynergy.com>
> > Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
> > ---
> >  content.tex      |   1 +
> >  virtio-video.tex | 579 +++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 580 insertions(+)
> >  create mode 100644 virtio-video.tex
> >
> > diff --git a/content.tex b/content.tex
> > index 556b373..9e56839 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -5743,6 +5743,7 @@ \subsubsection{Legacy Interface: Framing
> > Requirements}\label{sec:Device \input{virtio-vsock.tex}
> >  \input{virtio-fs.tex}
> >  \input{virtio-rpmb.tex}
> > +\input{virtio-video.tex}
> >
> >  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >
> > diff --git a/virtio-video.tex b/virtio-video.tex
> > new file mode 100644
> > index 0000000..30e728d
> > --- /dev/null
> > +++ b/virtio-video.tex
> > @@ -0,0 +1,579 @@
> > +\section{Video Device}\label{sec:Device Types / Video Device}
> > +
> > +The virtio video encoder device and decoder device are virtual devices that
> > +supports encoding and decoding respectively. Though the encoder and the
> > decoder +are different devices, they use the same protocol.
> > +
> > +\subsection{Device ID}\label{sec:Device Types / Video Device / Device ID}
> > +
> > +\begin{description}
> > +\item[30] encoder device
> > +\item[31] decoder device
> > +\end{description}
> > +
> > +\subsection{Virtqueues}\label{sec:Device Types / Video Device / Virtqueues}
> > +
> > +\begin{description}
> > +\item[0] controlq - queue for sending control commands.
> > +\item[1] eventq - queue for sending events happened in the device.
> > +\end{description}
> > +
> > +\subsection{Feature bits}\label{sec:Device Types / Video Device / Feature
> > bits} +
> > +\begin{description}
> > +\item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (0)] Guest pages can be used for
> > video +  buffers.
> > +\end{description}
> > +
> > +\devicenormative{\subsubsection}{Feature bits}{Device Types / Video Device
> > / Feature bits} +
> > +The device MUST offer at least one of feature bits.
> > +
> > +\subsection{Device configuration layout}\label{sec:Device Types / Video
> > Device / Device configuration layout} +
> > +Video device configuration uses the following layout structure:
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_config {
> > +        le32 max_cap_len;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{max_cap_len}] defines the maximum length of a descriptor
> > +  required to call VIRTIO_VIDEO_GET_CAPABILITY in bytes. The device
> > +  MUST set this value.
> > +\end{description}
> > +
> > +\subsection{Device Initialization}\label{sec:Device Types / Video Device /
> > Device Initialization} +
> > +\devicenormative{\subsubsection}{Device Initialization}{Device Types /
> > Video Device / Device Initialization} +
> > +The driver SHOULD query device capability by using the
> > +VIRTIO_VIDEO_T_GET_CAPABILITY and use that information for the initial
> > +setup.
> > +
> > +\subsection{Device Operation}\label{sec:Device Types / Video Device /
> > Device Operation} +
> > +The driver allocates input and output buffers and queues the buffers
> > +to the device. The device performs operations on the buffers according
> > +to the function in question.
> > +
> > +\subsubsection{Device Operation: Create stream}
> > +
> > +To process buffers, the device needs to associate them with a certain
> > +video stream (essentially, a context). Streams are created by
> > +VIRTIO_VIDEO_T_STREAM_CREATE with a default set of parameters
> > +determined by the device.
> > +
> > +\subsubsection{Device Operation: Create buffers}
> > +
> > +Buffers are used to store the actual data as well as the relevant
> > +metadata. Scatter lists are supported, so the buffer doesn't need to
> > +be contiguous in guest physical memory.
> > +
> > +\begin{itemize*}
> > +\item Use VIRTIO_VIDEO_T_RESOURCE_CREATE to create a virtio video
> > +  resource that is backed by a buffer allocated from the driver's
> > +  memory.
> > +\item Use VIRTIO_VIDEO_T_RESOURCE_DESTROY to destroy a resource that
> > +  is no longer needed.
> > +\end{itemize*}
> > +
> > +\subsubsection{Device Operation: Stream parameter control}
> > +
> > +\begin{itemize*}
> > +\item Use VIRTIO_VIDEO_T_GET_PARAMS to get the current stream parameters
> > for +  input and output streams from the device.
> > +\item Use VIRTIO_VIDEO_T_SET_PARAMS to provide new stream parameters to the
> > +  device.
> > +\item After setting stream parameters, the driver may issue
> > +  VIRTIO_VIDEO_T_GET_PARAMS as some parameters of both input and output can
> > be +  changed implicitly by the device during the set operation.
> > +\end{itemize*}
> > +
> > +\subsubsection{Device Operation: Process buffers}
> > +
> > +\begin{itemize*}
> > +\item If the function and the buffer type require so, write data to
> > +the buffer memory.
> > +\item Use VIRTIO_VIDEO_T_RESOURCE_QUEUE to queue the buffer for
> > +processing in the device.
> > +\item The request completes asynchronously when the device has
> > +finished with the buffer.
> > +\end{itemize*}
> > +
> > +\subsubsection{Device Operation: Buffer processing control}
> > +
> > +\begin{itemize*}
> > +\item Use VIRTIO_VIDEO_T_STREAM_DRAIN to ask the device to process and
> > +  return all of the already queued buffers.
> > +\item Use VIRTIO_VIDEO_T_QUEUE_CLEAR to ask the device to return back
> > +  already queued buffers from the input or the output queue. This also
> > +  includes input or output buffers that can be currently owned by the
> > +  device's processing pipeline.
> > +\end{itemize*}
> > +
> > +\subsubsection{Device Operation: Asynchronous events}
> > +
> > +While processing buffers, the device can send asynchronous event
> > +notifications to the driver. The behaviour depends on the exact
> > +stream. For example, the decoder device sends a resolution change
> > +event when it encounters new resolution metadata in the stream.
> > +
> > +\subsubsection{Device Operation: Request header}
> > +
> > +All requests and responses on the control virt queue have a fixed
> > +header using the following layout structure and definitions:
> > +
> > +\begin{lstlisting}
> > +enum virtio_video_ctrl_type {
> > +        VIRTIO_VIDEO_CTRL_UNDEFINED = 0,
> > +
> > +        /* request */
> > +        VIRTIO_VIDEO_T_GET_CAPABILITY = 0x0100,
> > +        VIRTIO_VIDEO_T_STREAM_CREATE,
> > +        VIRTIO_VIDEO_T_STREAM_DESTROY,
> > +        VIRTIO_VIDEO_T_STREAM_DRAIN,
> > +        VIRTIO_VIDEO_T_RESOURCE_CREATE,
> > +        VIRTIO_VIDEO_T_RESOURCE_DESTROY,
> > +        VIRTIO_VIDEO_T_RESOURCE_QUEUE,
> > +        VIRTIO_VIDEO_T_QUEUE_CLEAR,
> > +        VIRTIO_VIDEO_T_SET_PARAMS,
> > +        VIRTIO_VIDEO_T_GET_PARAMS,
> > +
> > +        /* response */
> > +        VIRTIO_VIDEO_S_OK = 0x0200,
> > +        VIRTIO_VIDEO_S_OK_RESOURCE_QUEUE,
> > +        VIRTIO_VIDEO_S_OK_GET_PARAMS,
> > +
> > +        VIRTIO_VIDEO_S_ERR_UNSPEC = 0x0300,
> > +        VIRTIO_VIDEO_S_ERR_OUT_OF_MEMORY,
> > +        VIRTIO_VIDEO_S_ERR_INVALID_RESOURCE_ID,
> > +        VIRTIO_VIDEO_S_ERR_INVALID_STREAM_ID,
> > +        VIRTIO_VIDEO_S_ERR_INVALID_PARAMETER,
> > +};
> > +
> > +struct virtio_video_ctrl_hdr {
> > +        le32 type;
> > +        le32 stream_id;
> > +        le32 len; /* Length of the structure in bytes. */
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{type}] is the type of the driver request or the device
> > +response.
> > +\item[\field{stream_id}] specifies a target stream.
> > +\item[\field{len}] is the length of data in bytes, which includes
> > +length of the header.
> > +\end{description}
> > +
> > +\subsubsection{Device Operation: controlq}
> > +
> > +\begin{description}
> > +
> > +\item[VIRTIO_VIDEO_T_GET_CAPABILITY] Retrieve information about
> > +supported formats.
> > +
> > +The driver uses \field{struct virtio_video_get_capability} to send a
> > +query request.
> > +
> > +\begin{lstlisting}
> > +enum virtio_video_buf_type {
> > +        VIRTIO_VIDEO_BUF_TYPE_INPUT,
> > +        VIRTIO_VIDEO_BUF_TYPE_OUTPUT,
> > +};
> I personally didn't like the previous term: pin_type. But, to be honest, I
> don't like the buf_type neither. Consider the GET/SET_PARAMS request: buf_type
> there looks a bit unnatural. We are trying to get stream parameters there, not
> some parameters of whatever buffer. Also I don't see any strict reason to mimic
> v4l2 naming scheme.
>
> I'd better rename it to PORT_TYPE or QUEUE_TYPE.

To be honest, I also wasn't satisfied with the name "buf_type".
QUEUE_TYPE sounds better.
Will rename it.

>
> > +
> > +struct virtio_video_get_capability {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +        enum virtio_video_buf_type buf_type;
> > +};
> > +\end{lstlisting}
> > +\begin{description}
> > +\item[\field{buf_type}] is the buffer type that the driver asks
> > +information about. The driver MUST set either
> > +\field{VIRTIO_VIDEO_BUF_TYPE_INPUT} or
> > \field{VIRTIO_VIDEO_BUF_TYPE_OUTPUT}. +\end{description}
> > +
> > +The device responds a capability by using \field{struct
> > +virtio_video_get_capability_resp}.
> > +\begin{lstlisting}
> > +enum virtio_video_format {
> > +        VIRTIO_VIDEO_FORMAT_UNDEFINED = 0,
> > +        /* Raw formats */
> > +        VIRTIO_VIDEO_FORMAT_NV12 = 1,
> > +        VIRTIO_VIDEO_FORMAT_YUV420,
> > +        VIRTIO_VIDEO_FORMAT_YVU420,
> Let's add some variants of RGB, like RGBA, ARGB. We need it for the encoder in
> particular .
>

Sounds good.
BTW, which "ARGB8888" or "A8R8G8B8" is preferred? While the first one
comes from DRM's FourCC, the second one comes from virtio_gpu_formats.
I personally prefer the first one, then we can have a naming convention like:
VIRTIO_VIDEO_FORMAT_<name from drm_fourcc.h>

> > +
> > +        /* Compressed formats */
> > +        VIRTIO_VIDEO_FORMAT_H264 = 0x1001,
> > +        VIRTIO_VIDEO_FORMAT_VP8 =  0x1002,
> > +        VIRTIO_VIDEO_FORMAT_VP9 =  0x1003,
> Let's add H265, MPEG4, MPEG2. We already support and use them.

Sure.

Best regards,
Keiichi

>
> Regards,
> Dmitry.
>
> > +};
> > +
> > +enum virtio_video_profile {
> > +        VIRTIO_VIDEO_PROFILE_UNDEFINED = 0,
> > +
> > +        /* H.264 */
> > +        VIRTIO_VIDEO_PROFILE_H264_MIN = 0x100,
> > +        VIRTIO_VIDEO_PROFILE_H264_BASELINE =
> > VIRTIO_VIDEO_PROFILE_H264_BASELINE, +
> > VIRTIO_VIDEO_PROFILE_H264_MAIN,
> > +        VIRTIO_VIDEO_PROFILE_H264_EXTENDED,
> > +        VIRTIO_VIDEO_PROFILE_H264_HIGH,
> > +        VIRTIO_VIDEO_PROFILE_H264_HIGH10PROFILE,
> > +        VIRTIO_VIDEO_PROFILE_H264_HIGH422PROFILE,
> > +        VIRTIO_VIDEO_PROFILE_H264_HIGH444PREDICTIVEPROFILE,
> > +        VIRTIO_VIDEO_PROFILE_H264_SCALABLEBASELINE,
> > +        VIRTIO_VIDEO_PROFILE_H264_SCALABLEHIGH,
> > +        VIRTIO_VIDEO_PROFILE_H264_STEREOHIGH,
> > +        VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
> > +        VIRTIO_VIDEO_PROFILE_H264_MAX =
> > VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH, +
> > +        /* VP8 */
> > +        VIRTIO_VIDEO_PROFILE_VP8_MIN = 0x200,
> > +        VIRTIO_VIDEO_PROFILE_VP8_ANY = VIRTIO_VIDEO_PROFILE_VP8_MIN,
> > +        VIRTIO_VIDEO_PROFILE_VP8_MAX = VIRTIO_VIDEO_PROFILE_VP8_ANY,
> > +
> > +        /* VP9 */
> > +        VIRTIO_VIDEO_PROFILE_VP9_MIN = 0x300,
> > +        VIRTIO_VIDEO_PROFILE_VP9_PROFILE0 = VIRTIO_VIDEO_PROFILE_VP9_MIN,
> > +        VIRTIO_VIDEO_PROFILE_VP9_PROFILE1,
> > +        VIRTIO_VIDEO_PROFILE_VP9_PROFILE2,
> > +        VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
> > +        VIRTIO_VIDEO_PROFILE_VP9_MAX = VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
> > +};
> > +
> > +struct virtio_video_format_range {
> > +        le32 min;
> > +        le32 max;
> > +        le32 step;
> > +        u8 paddings[4];
> > +};
> > +
> > +struct virtio_video_format_desc {
> > +        le32 format;  /* One of VIRTIO_VIDEO_FORMAT_* types */
> > +        le32 profile; /* One of VIRTIO_VIDEO_PROFILE_* types */
> > +        le64 mask;
> > +        struct virtio_video_format_range width;
> > +        struct virtio_video_format_range height;
> > +        le32 num_rates;
> > +        u8 padding[4];
> > +        /* Followed by struct virtio_video_frame_rate frame_rates[] */
> > +};
> > +
> > +struct virtio_video_get_capability_resp {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +        le32 num_descs;
> > +        /* Followed by struct virtio_video_format_desc desc[] */
> > +};
> > +\end{lstlisting}
> > +
> > +The format description \field{struct virtio_video_format_desc}
> > +includes the following fields:
> > +\begin{description}
> > +\item[\field{format}] specifies an image format. The device MUST set one
> > +  of \field{enum virtio_video_format}.
> > +\item[\field{profile}] specifies a profile of the compressed image format
> > +  specified in \field{format}. The driver SHOULD ignore this value if
> > +  \field{format} is a raw format.
> > +\item[\field{mask}] is a bitset that represents the supported
> > +  combination of input and output format. If \textit{i}-th bit is set
> > +  in \field{mask} of \textit{j}-th \field{struct
> > +  virtio_video_format_desc} for input, the device supports encoding or
> > +  decoding from the \textit{j}-th input format to \textit{i}-th output
> > +  format.
> > +\item[\field{width, height}] represents a range of resolutions
> > +  supported by the device. If its \field{step} is not applicable, its
> > +  \field{min} is equal to its \field{max}.
> > +\item[\field{num_rates}] is the length of an array \field{frame_rates}. In
> > case of decoder, the driver SHOULD ignore this value.
> > +\item[\field{frame_rates}] is an array of supported frame rates.
> > +\end{description}
> > +
> > +\item[VIRTIO_VIDEO_T_STREAM_CREATE] create a video stream (context)
> > +  within the device.
> > +
> > +\begin{lstlisting}
> > +enum virtio_video_mem_type {
> > +        VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES,
> > +};
> > +
> > +struct virtio_video_stream_create {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +        le32 in_mem_type;  /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
> > +        le32 out_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
> > +        char debug_name[64];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{in_mem_type}] is a type of buffer management for input
> > +buffers. The driver MUST set a value in \field{enum
> > +virtio_video_mem_type}.
> > +\item[\field{out_mem_type}] is a type of buffer management for output
> > +buffers. The driver MUST set a value in \field{enum
> > +virtio_video_mem_type}.
> > +\item[\field{debug_name}] is a text string for a debug purpose.
> > +\end{description}
> > +
> > +\item[VIRTIO_VIDEO_T_STREAM_DESTROY] destroy a video stream (context)
> > +  within the device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_stream_destroy {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +};
> > +\end{lstlisting}
> > +
> > +\item[VIRTIO_VIDEO_T_STREAM_DRAIN] ask the device to push all the
> > +  queued buffers through the pipeline.
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_stream_drain {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +};
> > +\end{lstlisting}
> > +
> > +\item[VIRTIO_VIDEO_T_RESOURCE_CREATE] create a resource descriptor
> > +  within the device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_mem_entry {
> > +        le64 addr;
> > +        le32 length;
> > +        u8 padding[4];
> > +};
> > +
> > +struct virtio_video_resource_create {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +        le32 resource_id;
> > +        le32 nr_entries;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{resource_id}] internal id of the resource.
> > +\item[\field{nr_entries}] number of \field{struct
> > +  virtio_video_mem_entry} memory entries.
> > +\end{description}
> > +
> > +\item[VIRTIO_VIDEO_T_RESOURCE_DESTROY] destroy a resource descriptor
> > +  within the device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_resource_destroy {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +        le32 resource_id;
> > +        u8 padding[4];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{resource_id}] internal id of the resource.
> > +\end{description}
> > +
> > +\item[VIRTIO_VIDEO_T_RESOURCE_QUEUE] Add a buffer to the device's
> > +queue.
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_VIDEO_MAX_PLANES 8
> > +
> > +struct virtio_video_resource_queue {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +        le32 buf_type;
> > +        le32 resource_id;
> > +        le64 timestamp;
> > +        le32 nr_data_size;
> > +        le32 data_size[VIRTIO_VIDEO_MAX_PLANES];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{buf_type}] buf_type of the .
> > +\item[\field{resource_id}] internal id of the resource.
> > +\item[\field{timestamp}] an abstract sequence counter that can be used
> > +  for synchronisation.
> > +\item[\field{nr_data_size}] number of \field{data_size} entries.
> > +\item[\field{data_size}] number of data bytes within a plane.
> > +\end{description}
> > +
> > +\begin{lstlisting}
> > +enum virtio_video_buffer_flag {
> > +        VIRTIO_VIDEO_BUFFER_F_ERR        = 0x0001,
> > +        VIRTIO_VIDEO_BUFFER_F_EOS        = 0x0002,
> > +        /* Encoder only */
> > +        VIRTIO_VIDEO_BUFFER_IFRAME        = 0x0004,
> > +        VIRTIO_VIDEO_BUFFER_PFRAME        = 0x0008,
> > +        VIRTIO_VIDEO_BUFFER_BFRAME        = 0x0010,
> > +};
> > +
> > +struct virtio_video_resource_queue_resp {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +        le64 timestamp;
> > +        le32 flags; /* One of VIRTIO_VIDEO_BUFFER_* flags */
> > +        le32 size;  /* Encoded size */
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{timestamp}] an abstract sequence counter that can be used
> > +  for synchronisation.
> > +\item[\field{flags}] mark specific buffers in the sequence.
> > +\item[\field{size}] data size in the buffer (encoder only).
> > +\end{description}
> > +
> > +The device sends a response to the queue request asynchronously when
> > +it has finished processing the buffer.
> > +
> > +The device SHOULD mark a buffer that triggered a processing error with
> > +the VIRTIO_VIDEO_BUFFER_F_ERR flag.
> > +
> > +The device MUST mark the last buffer with the
> > +VIRTIO_VIDEO_BUFFER_F_EOS flag to denote completion of the drain
> > +sequence.
> > +
> > +In case of encoder, to denote a particular frame type the devie MUST
> > +mark the respective buffer with VIRTIO_VIDEO_BUFFER_IFRAME,
> > +VIRTIO_VIDEO_BUFFER_PFRAME, VIRTIO_VIDEO_BUFFER_BFRAME.
> > +
> > +\item[VIRTIO_VIDEO_T_RESOURCE_QUEUE_CLEAR] Return already queued
> > +  buffers back from the input or the output queue of the device. The
> > +  device SHOULD return all of the buffers from the respective queue as
> > +  soon as possible without pushing the buffers through the processing
> > +  pipeline.
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_queue_clear {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +        le32 buf_type;
> > +        u8 padding[4];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{buf_type}] buffer type.
> > +\end{description}
> > +
> > +\item[VIRTIO_VIDEO_T_GET_PARAMS] Get parameters of the input or the
> > +  output of a stream.
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_plane_format {
> > +        le32 plane_size;
> > +        le32 stride;
> > +        u8 padding[4];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{plane_size}] size of the plane in bytes.
> > +\item[\field{stride}] stride used for the plane in bytes.
> > +\end{description}
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_params {
> > +        le32 buf_type; /* One of VIRTIO_VIDEO_BUF_TYPE_* types */
> > +        le32 fourcc;   /* One of VIRTIO_VIDEO_FOURCC_* types */
> > +        le32 frame_width;
> > +        le32 frame_height;
> > +        le32 min_buffers;
> > +        le32 max_buffers;
> > +        le32 frame_rate;
> > +        struct virtio_video_crop {
> > +                le32 left;
> > +                le32 top;
> > +                le32 width;
> > +                le32 height;
> > +        } crop;
> > +        le32 num_planes;
> > +        struct virtio_video_plane_format
> > plane_formats[VIRTIO_VIDEO_MAX_PLANES]; +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{frame_width}] the value to get/set.
> > +\item[\field{frame_height}] the value to get/set.
> > +\item[\field{pixel_format}] the value to get/set.
> > +\item[\field{min_buffers}] minimum buffers required to handle the
> > +  format (r/o).
> > +\item[\field{max_buffers}] maximum buffers required to handle the
> > +  format (r/o).
> > +\item[\field{frame_rate}] the value to get/set.
> > +\item[\field{crop}] cropping (composing) rectangle.
> > +\item[\field{num_planes}] number of planes used to store pixel data
> > +(r/o).
> > +\item[\field{plane_formats}] description of each plane.
> > +\end{description}
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_get_params {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +        le32 buf_type; /* One of VIRTIO_VIDEO_BUF_TYPE_* types */
> > +};
> > +
> > +struct virtio_video_get_params_resp {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +        struct virtio_video_params params;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{buf_type}] buffer type.
> > +\item[\field{params}] parameter values.
> > +\end{description}
> > +
> > +\item[VIRTIO_VIDEO_T_SET_PARAMS] Change parameters of a stream.
> > +
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_set_params {
> > +        struct virtio_video_ctrl_hdr hdr;
> > +        struct virtio_video_params params;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{params}] parameters to set.
> > +\end{description}
> > +
> > +Setting stream parameters might have side effects within the device.
> > +For example, the device MAY perform alignment of width and height,
> > +change the number of planes it uses for the format, or do whatever
> > +changes that are required to continue normal operation using the
> > +updated parameters. It is up to the driver to check the parameter set
> > +after the VIRTIO_VIDEO_T_SET_PARAMS request has been issued.
> > +
> > +\end{description}
> > +
> > +\subsubsection{Device Operation: eventq}
> > +
> > +The device can report events on the event queue. The driver initially
> > +populates the queue with device-writeable buffers. When the device
> > +needs to report an event, it fills a buffer and notifies the driver.
> > +The driver consumes the report and adds a new buffer to the virtqueue.
> > +
> > +\begin{lstlisting}
> > +enum virtio_video_event_type {
> > +        VIRTIO_VIDEO_EVENT_T_UNDEFINED = 0,
> > +        /* For all functions */
> > +        VIRTIO_VIDEO_EVENT_T_ERROR_UNSPEC = 0x0100,
> > +        /* For decoder only */
> > +        VIRTIO_VIDEO_EVENT_T_DECODER_RESOLUTION_CHANGED = 0x0200,
> > +};
> > +
> > +struct virtio_video_event {
> > +        le32 event_type; /* One of VIRTIO_VIDEO_EVENT_T_* types */
> > +        le32 stream_id;
> > +        u8 padding[4];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{event_type}] type of the triggered event .
> > +\item[\field{stream_id}] id of the source stream.
> > +\end{description}
> > +
> > +The device MUST send VIRTIO_VIDEO_EVENT_T_DECODER_RESOLUTION_CHANGED
> > +whenever it encounters new resolution data in the stream. This
> > +includes the case of the initial device configuration after metadata
> > +has been parsed and the case of dynamic resolution change.
>
>
