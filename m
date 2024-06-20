Return-Path: <linux-media+bounces-13816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A25910643
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 15:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2B64B270FD
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 13:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA781B1403;
	Thu, 20 Jun 2024 13:33:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AB01E497;
	Thu, 20 Jun 2024 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718890428; cv=none; b=Pe4LsMdhsHWnijAVlQratAr0C015uJA+PtGne2hJFup6jCqhtHPE8NzXpMB7L0Aj5/SVWcdVbY1P7UYWRmw+ACCKwiMV52UtZ0XQ0TIWpiXQmtK3miXo1fGMl3swQe1yy8JT7y9smcg8JYdM0hQPmbhPKxOdT1QYidEY7O0tnD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718890428; c=relaxed/simple;
	bh=Qc1xaabrfdKfn0iSntCY98WoP/4c9vUJfrqYnjkdLh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttBZTHcHhbEEVyjxiMYDU9ZD8yuvslZd/lHbfmhxz+RRlDTLMautDGXZxP09uPrxb0QjEAHgs1zy6c3zBWNuRSFhcv9QpUJB4gO4GFl+qmg7e9Vc36l/TTrGv6UvQAmLggkkvdHoFMLX1XUp57ib0/ULNfvLsCofDti1Jw6zR5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E01C32786;
	Thu, 20 Jun 2024 13:33:44 +0000 (UTC)
Message-ID: <4afc9639-21f3-4c40-bd86-823b8a43433d@xs4all.nl>
Date: Thu, 20 Jun 2024 15:33:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] virtio-media: Add virtio media device
 specification
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Albert Esteve <aesteve@redhat.com>, Matti.Moell@opensynergy.com,
 cohuck@redhat.com, mst@redhat.com, daniel.almeida@collabora.com,
 Alexander.Gordeev@opensynergy.com, changyeon@google.com,
 alex.bennee@linaro.org, gurchetansingh@google.com, ribalda@google.com,
 nicolas.dufresne@collabora.com, eballetb@redhat.com,
 linux-media@vger.kernel.org, virtio-comment@lists.linux.dev
References: <20240607080045.1337046-1-aesteve@redhat.com>
 <20240607080045.1337046-2-aesteve@redhat.com>
 <d39660b7-7c51-438c-9784-faa91f0c3c29@xs4all.nl>
 <CAPBb6MV00eRGib6YhEdgTjh-_Rdo2nBwQ6VFSYfyxJcv0Vu06Q@mail.gmail.com>
 <342f5f0f-75c4-49c5-9965-42248fd06c6b@xs4all.nl>
 <CAPBb6MWzx61QYAFFBiZdjoeE4U77W8gTsmXsvn2eetUTRqozXQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CAPBb6MWzx61QYAFFBiZdjoeE4U77W8gTsmXsvn2eetUTRqozXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/06/2024 14:53, Alexandre Courbot wrote:
> On Thu, Jun 20, 2024 at 9:45 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 08/06/2024 03:24, Alexandre Courbot wrote:
>>> Hi Hans,
>>>
>>> On Fri, Jun 7, 2024 at 5:43 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>
>>>> Hi Albert,
>>>>
>>>>
>>>> On 07/06/2024 10:00, Albert Esteve wrote:
>>>>> Virtio-media is an encapsulation of the V4L2 UAPI into
>>>>> virtio, able to virtualize any video device supported
>>>>> by V4L2
>>>>>
>>>>> Note that virtio-media does not require the use of a
>>>>> V4L2 device driver or of Linux on the host or
>>>>> guest side - V4L2 is only used as a host-guest protocol,
>>>>> and both sides are free to convert it from/to any
>>>>> model that they wish to use.
>>>>
>>>> I just have two notes, one minor, one more substantial:
>>>>
>>>>>
>>>>> Signed-off-by: Albert Esteve <aesteve@redhat.com>
>>>>> ---
>>>>>  conformance.tex                           |  13 +-
>>>>>  content.tex                               |   1 +
>>>>>  device-types/media/description.tex        | 578 ++++++++++++++++++++++
>>>>>  device-types/media/device-conformance.tex |  11 +
>>>>>  device-types/media/driver-conformance.tex |   9 +
>>>>>  5 files changed, 608 insertions(+), 4 deletions(-)
>>>>>  create mode 100644 device-types/media/description.tex
>>>>>  create mode 100644 device-types/media/device-conformance.tex
>>>>>  create mode 100644 device-types/media/driver-conformance.tex
>>>>>
>>>>> diff --git a/conformance.tex b/conformance.tex
>>>>> index dc00e84..c369da1 100644
>>>>> --- a/conformance.tex
>>>>> +++ b/conformance.tex
>>>>> @@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>>>  \ref{sec:Conformance / Driver Conformance / Memory Driver Conformance},
>>>>>  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conformance},
>>>>>  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
>>>>> -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} or
>>>>> -\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
>>>>> +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
>>>>> +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} or
>>>>> +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.
>>>>> +
>>>>>
>>>>>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>>>>>    \end{itemize}
>>>>> @@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>>>  \ref{sec:Conformance / Device Conformance / Memory Device Conformance},
>>>>>  \ref{sec:Conformance / Device Conformance / I2C Adapter Device Conformance},
>>>>>  \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
>>>>> -\ref{sec:Conformance / Device Conformance / GPIO Device Conformance} or
>>>>> -\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.
>>>>> +\ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
>>>>> +\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} or
>>>>> +\ref{sec:Conformance / Device Conformance / Media Device Conformance}.
>>>>>
>>>>>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>>>>>    \end{itemize}
>>>>> @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>>>  \input{device-types/scmi/driver-conformance.tex}
>>>>>  \input{device-types/gpio/driver-conformance.tex}
>>>>>  \input{device-types/pmem/driver-conformance.tex}
>>>>> +\input{device-types/media/driver-conformance.tex}
>>>>>
>>>>>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
>>>>>
>>>>> @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>>>  \input{device-types/scmi/device-conformance.tex}
>>>>>  \input{device-types/gpio/device-conformance.tex}
>>>>>  \input{device-types/pmem/device-conformance.tex}
>>>>> +\input{device-types/media/device-conformance.tex}
>>>>>
>>>>>  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
>>>>>  A conformant implementation MUST be either transitional or
>>>>> diff --git a/content.tex b/content.tex
>>>>> index 0a62dce..59925ae 100644
>>>>> --- a/content.tex
>>>>> +++ b/content.tex
>>>>> @@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}
>>>>>  \input{device-types/scmi/description.tex}
>>>>>  \input{device-types/gpio/description.tex}
>>>>>  \input{device-types/pmem/description.tex}
>>>>> +\input{device-types/media/description.tex}
>>>>>
>>>>>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>>>>
>>>>> diff --git a/device-types/media/description.tex b/device-types/media/description.tex
>>>>> new file mode 100644
>>>>> index 0000000..887eacf
>>>>> --- /dev/null
>>>>> +++ b/device-types/media/description.tex
>>>>> @@ -0,0 +1,578 @@
>>>>> +\section{Media Device}\label{sec:Device Types / Media Device}
>>>>> +
>>>>> +The virtio media device follow the same model (and structures) as V4L2. It
>>>>> +can be used to virtualize cameras, codec devices, or any other device
>>>>> +supported by V4L2. The device assumes 64-bit little-endian V4L2 structures
>>>>> +are exchanged. The complete definition of V4L2 structures and ioctls can
>>>>> +be found under the
>>>>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index.html}{V4L2 UAPI documentation}.
>>>>> +
>>>>> +V4L2 is a UAPI that allows a less privileged entity (user-space) to use video
>>>>> +hardware exposed by a more privileged entity (the kernel). Virtio-media is an
>>>>> +encapsulation of this API into virtio, turning it into a virtualization API
>>>>> +for all classes of video devices supported by V4L2, where the device plays the
>>>>> +role of the kernel and the driver the role of user-space.
>>>>> +
>>>>> +The device is therefore responsible for presenting a virtual device that behaves
>>>>> +like an actual V4L2 device, which the driver can control.
>>>>> +
>>>>> +Note that virtio-media does not require the use of a V4L2 device driver or of
>>>>> +Linux on any side - V4L2 is only used as a transport protocol,
>>>>> +and both sides are free to convert it from/to any model that they wish to use.
>>>>> +
>>>>> +This section relies on definitions from
>>>>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index.html}{V4L2 UAPI documentation}.
>>>>> +
>>>>> +\subsection{Device ID}\label{sec:Device Types / Media Device / Device ID}
>>>>> +
>>>>> +42
>>>>> +
>>>>> +\subsection{Virtqueues}\label{sec:Device Types / Media Device / Virtqueues}
>>>>> +
>>>>> +\begin{description}
>>>>> +\item[0] commandq - used for driver commands and device responses to these
>>>>> +commands.
>>>>> +\item[1] eventq - used for events sent by the device to the driver.
>>>>> +\end{description}
>>>>> +
>>>>> +\devicenormative{\subsubsection}{Virtqueues}{Device Types / Media Device / Virtqueues}
>>>>> +
>>>>> +The device MUST return the descriptor chains it receives on the commandq as
>>>>> +soon as possible, and must never hold them for indefinite periods of time.
>>>>> +
>>>>> +\drivernormative{\subsubsection}{Virtqueues}{Device Types / Media Device / Virtqueues}
>>>>> +
>>>>> +The driver MUST re-queue the descriptor chains returned by the device on the
>>>>> +eventq as soon as possible, and must never hold them for indefinite periods
>>>>> +of time.
>>>>> +
>>>>> +\subsection{Feature Bits}\label{sec:Device Types / Media Device / Feature Bits}
>>>>> +
>>>>> +None
>>>>> +
>>>>> +\subsection{Device Configuration Layout}\label{sec:Device Types / Media Device / Device Configuration Layout}
>>>>> +
>>>>> +The video device configuration space uses the following layout:
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +struct virtio_media_config {
>>>>> +    le32 device_caps;
>>>>> +    le32 device_type;
>>>>> +    u8 card[32];
>>>>
>>>> Use char instead of u8. It's always been a pain that struct v4l2_capability
>>>> used u8 instead of char for the character arrays. I never understood why, and
>>>> if you are making a new struct I would recommend using char.
>>>>
>>>> Up to you, though.
>>>>
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +\begin{description}
>>>>> +\item[\field{device_caps}] (driver-read-only) flags representing the device
>>>>> +capabilities as used in
>>>>> +\href{https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-querycap.html#c.v4l2_capability}{struct v4l2_capabilities}.
>>>>> +Corresponds with the \field{device_caps} field in the \textit{struct video_device}.
>>>>> +\item[\field{device_type}] (driver-read-only) informs the driver of the type
>>>>> +of the video device. Corresponds with the \field{vfl_devnode_type} field of the device.
>>>>> +\item[\field{card}] (driver-read-only) name of the device, a NUL-terminated
>>>>> +UTF-8 string. Corresponds with the \field{card} field of the \textit{struct v4l2_capability}.
>>>>> +If all the characters of the field are used, it does not need to be NUL-terminated.
>>>>> +\end{description}
>>>>> +
>>>>> +\subsection{Device Initialization}
>>>>> +
>>>>> +\begin{enumerate}
>>>>> +\item The driver reads the \field{device_caps} and \field{device_type} fields
>>>>> +from the configuration layout to identify the device.
>>>>> +\item The driver sets up the \field{commandq} and \field{eventq}.
>>>>> +\item The driver may open a session to use the device and send V4L2 ioctls in
>>>>> +order to receive more information about the device, such as supported
>>>>> +formats or controls.
>>>>> +\end{enumerate}
>>>>> +
>>>>> +\subsection{Device Operation}\label{sec:Device Types / Media Device / Device Operation}
>>>>> +
>>>>> +Commands are queued on the command queue by the driver for the device to
>>>>> +process. The errors returned by each command are standard
>>>>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen-errors.html}{Linux kernel error codes}.
>>>>> +For instance, a command that contains invalid options will return \textit{EINVAL}.
>>>>> +
>>>>> +Events are sent on the event queue by the device for the driver to handle.
>>>>> +
>>>>> +\subsubsection{Command Virtqueue}
>>>>> +
>>>>> +\paragraph{Device Operation: Command headers}
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +#define VIRTIO_MEDIA_CMD_OPEN 1
>>>>> +#define VIRTIO_MEDIA_CMD_CLOSE 2
>>>>> +#define VIRTIO_MEDIA_CMD_IOCTL 3
>>>>> +#define VIRTIO_MEDIA_CMD_MMAP 4
>>>>> +#define VIRTIO_MEDIA_CMD_MUNMAP 5
>>>>> +
>>>>> +/* Header for all virtio commands from the driver to the device on the commandq. */
>>>>> +struct virtio_media_cmd_header {
>>>>> +     u32 cmd;
>>>>> +     u32 __padding;
>>>>> +};
>>>>> +
>>>>> +/* Header for all virtio responses from the device to the driver on the commandq. */
>>>>> +struct virtio_media_resp_header {
>>>>> +     u32 status;
>>>>> +     u32 __padding;
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +A command consists of a command header \textit{virtio_media_cmd_header}
>>>>> +containing the following device-readable field:
>>>>> +
>>>>> +\begin{description}
>>>>> +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD_*).
>>>>> +\end{description}
>>>>> +
>>>>> +A response consists of a response header \textit{virtio_media_resp_header}
>>>>> +containing the following device-writable field:
>>>>> +
>>>>> +\begin{description}
>>>>> +\item[\field{status}] indicates a device request status.
>>>>> +\end{description}
>>>>> +
>>>>> +The status field can take 0 if the command was successful, or one of the
>>>>> +standard Linux error codes if it was not.
>>>>> +
>>>>> +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Sessions}{Device Types / Media Device / Device Operation / Command Virtqueue}
>>>>> +
>>>>> +Sessions are how the device is multiplexed, allowing several distinct works to
>>>>> +take place simultaneously. The driver needs to open a session before it can
>>>>> +perform any useful operation on the device.
>>>>> +
>>>>> +\paragraph{Device Operation: Open device}
>>>>> +
>>>>> +\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.
>>>>> +
>>>>> +This is the equivalent of calling \textit{open} on a V4L2 device node.
>>>>> +The driver uses \textit{virtio_media_cmd_open} to send an open request.
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +struct virtio_media_cmd_open {
>>>>> +    struct virtio_media_cmd_header hdr;
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \textit{virtio_media_resp_open}.
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +struct virtio_media_resp_open {
>>>>> +    struct virtio_media_resp_header hdr;
>>>>> +    u32 session_id;
>>>>> +    u32 __padding;
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +\begin{description}
>>>>> +\item[\field{session_id}] specifies an identifier for the current session. The
>>>>> +identifier can be used to perform other commands on the session, notably ioctls.
>>>>> +\end{description}
>>>>> +
>>>>> +\devicenormative{\subparagraph}{Device Operation: Open device}{Device Types / Media Device / Device Operation / Open device}
>>>>> +
>>>>> +Upon success, the device MUST set a \field{session_id} in \textit{virtio_media_resp_open}
>>>>> +to an integer that is NOT used by any other open session.
>>>>> +
>>>>> +\paragraph{Device Operation: Close device}
>>>>> +
>>>>> +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active session.
>>>>> +
>>>>> +This is the equivalent of calling \textit{close} on a previously opened V4L2
>>>>> +device node. All resources associated with this session will be freed.
>>>>> +
>>>>> +This command does not require a response from the device.
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +struct virtio_media_cmd_close {
>>>>> +    struct virtio_media_cmd_header hdr;
>>>>> +    u32 session_id;
>>>>> +    u32 __padding;
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +\begin{description}
>>>>> +\item[\field{session_id}] specifies an identifier for the session to close.
>>>>> +\end{description}
>>>>> +
>>>>> +\drivernormative{\subparagraph}{Device Operation: Close device}{Device Types / Media Device / Device Operation / Close device}
>>>>> +
>>>>> +The session ID SHALL NOT be used again after queueing this command.
>>>>> +
>>>>> +\paragraph{Device Operation: V4L2 ioctls}
>>>>> +
>>>>> +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an open
>>>>> +session.
>>>>> +
>>>>> +This command asks the device to run one of the `VIDIOC_*` ioctls on the active
>>>>> +session.
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +struct virtio_media_cmd_ioctl {
>>>>> +    struct virtio_media_cmd_header hdr;
>>>>> +    u32 session_id;
>>>>> +    u32 code;
>>>>> +    /* Followed by the relevant ioctl payload as defined in the macro */
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +\begin{description}
>>>>> +\item[\field{session_id}] specifies an identifier of thesession to run the ioctl on.
>>>>> +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl to run.
>>>>> +\end{description}
>>>>> +
>>>>> +The code is extracted from the
>>>>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/videodev.html}{videodev2.h},
>>>>> +header file. The file defines the ioctl's codes, type of payload, and
>>>>> +direction. The code consists of the second argument of the \field{_IO*} macro.
>>>>> +
>>>>> +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +This means that its ioctl code is \textit{4}, that its payload is a
>>>>> +\textit{struct v4l2_format}, and that its direction is \textit{WR} (i.e., the
>>>>> +payload is written by both the driver and the device).
>>>>> +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctls payload}
>>>>> +for more information about the direction of ioctls.
>>>>> +
>>>>> +The payload layout is always a 64-bit representation of the corresponding
>>>>> +V4L2 structure.
>>>>> +
>>>>> +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{virtio_media_resp_ioctl}.
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +struct virtio_media_resp_ioctl {
>>>>> +    struct virtio_media_resp_header hdr;
>>>>> +    /* Followed by the ioctl payload as defined in the macro */
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device / V4L2 ioctls / Ioctls payload}
>>>>> +
>>>>> +Each ioctl has a payload, which is defined by the third argument of the
>>>>> +\field{_IO*} macro defining it.
>>>>> +
>>>>> +The payload of an ioctl in the descriptor chain follows the command structure,
>>>>> +the reponse structure, or both depending on the direction:
>>>>> +
>>>>> +\begin{itemize}
>>>>> +\item \textbf{_IOR} is read-only for the driver, meaning the payload
>>>>> +follows the response in the device-writable section of the descriptor chain.
>>>>> +\item \textbf{_IOW} is read-only for the device, meaning the payload
>>>>> +follows the command in the driver-writable section of the descriptor chain.
>>>>> +\item \textbf{_IOWR} is writable by both the device and driver,
>>>>> +meaning the payload must follow both the command in the driver-writable section
>>>>> +of the descriptor chain, and the response in the device-writable section.
>>>>> +\end{itemize}
>>>>> +
>>>>> +A common optimization for \textit{WR} ioctls is to provide the payload using
>>>>> +descriptors that both point to the same buffer. This mimics the behavior of
>>>>> +V4L2 ioctls where the data is only passed once and used as both input and
>>>>> +output by the kernel.
>>>>> +
>>>>> +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device Types / Media Device / Device Operation / V4L2 ioctls}
>>>>> +
>>>>> +In case of success of a device-writable ioctl, the device MUST always write the
>>>>> +payload in the device-writable part of the descriptor chain.
>>>>> +
>>>>> +In case of failure of a device-writable ioctl, the device is free to write the
>>>>> +payload in the device-writable part of the descriptor chain or not. Some errors
>>>>> +may still result in the payload being updated, and in this case the device is
>>>>> +expected to write the updated payload. If the device has not written the
>>>>> +payload after an error, the driver MUST assume that the payload has not been
>>>>> +modified.
>>>>> +
>>>>> +\subparagraph{Handling of pointers in ioctl payload}
>>>>> +
>>>>> +A few structures used as ioctl payloads contain pointers to further
>>>>> +data needed for the ioctl. There are notably:
>>>>> +
>>>>> +\begin{itemize}
>>>>> +\item The \field{planes} pointer of
>>>>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
>>>>> +which size is determined by the length member.
>>>>> +\item The \field{controls} pointer of \textit{struct v4l2_ext_controls}, which
>>>>> +size is determined by the count member.
>>>>> +\end{itemize}
>>>>> +
>>>>> +If the size of the pointed area is determined to be non-zero, then the main
>>>>> +payload is immediately followed by the pointed data in their order of
>>>>> +appearance in the structure, and the pointer value itself is ignored by the
>>>>> +device, which must also return the value initially passed by the driver.
>>>>> +
>>>>> +\subparagraph{Handling of pointers to userspace memory}
>>>>> +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
>>>>> +
>>>>> +A few pointers are special in that they point to userspace memory in the
>>>>> +original V4L2 specification. They are:
>>>>> +
>>>>> +\begin{itemize}
>>>>> +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} and
>>>>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.html#struct-v4l2-plane}{struct v4l2_plane}
>>>>> +(technically an unsigned long, but designated a userspace address).
>>>>> +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
>>>>> +\end{itemize}
>>>>> +
>>>>> +These pointers can cover large areas of scattered memory, which has the
>>>>
>>>> Actually, only m.userptr can cover a large area. The other two are limited.
>>>> See my comment about USERPTR support below.
>>>>
>>>>> +potential to require more descriptors than the virtio queue can provide. For
>>>>> +these particular pointers only, a list of \textit{struct virtio_media_sg_entry}
>>>>> +that covers the needed amount of memory for the pointer is used instead of
>>>>> +using descriptors to map the pointed memory directly.
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +struct virtio_media_sg_entry {
>>>>> +     u64 start;
>>>>> +     u32 len;
>>>>> +     u32 __padding;
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +For each such pointer to read, the device reads as many SG entries as needed
>>>>> +to cover the length of the pointed buffer, as described by its parent
>>>>> +structure (\field{length} member of \textit{struct v4l2_buffer} or
>>>>> +\textit{struct v4l2_plane} for buffer memory, and \field{size} member of
>>>>> +\textit{struct v4l2_ext_control} for control data).
>>>>> +
>>>>> +Since the device never needs to modify the list of SG entries, it is only
>>>>> +provided by the driver in the device-readable section of the descriptor chain,
>>>>> +and not repeated in the device-writable section, even for WR ioctls.
>>>>> +
>>>>> +\subparagraph{Unsupported ioctls}
>>>>> +
>>>>> +A few ioctls are replaced by other, more suitable mechanisms.
>>>>> +
>>>>> +\begin{itemize}
>>>>> +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configuration area
>>>>> +(see \ref{sec:Device Types / Media Device / Device Configuration Layout}).
>>>>> +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
>>>>> +(see \ref{sec:Device Types / Media Device / Device Operation / Dequeue buffer}).
>>>>> +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
>>>>> +(see \ref{sec:Device Types / Media Device / Device Operation / Emit an event}).
>>>>> +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are deprecated
>>>>> +and replaced by the controls of the JPEG class.
>>>>> +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shall not be
>>>>> +implemented by the device.
>>>>> +\end{itemize}
>>>>> +
>>>>> +\devicenormative{\subparagraph}{Device Operation: Unsupported ioctls}{Device Types / Media Device / Device Operation / Unsupported ioctls}
>>>>> +
>>>>> +If being requested an unsupported ioctl, the device MUST return the same
>>>>> +error response as it would for an unknown ioctl, i.e. \textit{ENOTTY}.
>>>>> +
>>>>> +\paragraph{Device Operation: Mapping a MMAP buffer}
>>>>> +
>>>>> +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer into the
>>>>> +driver's address space.
>>>>> +
>>>>> +Shared memory region ID 0 is used to map MMAP buffers with
>>>>> +the \textit{VIRTIO_MEDIA_CMD_MMAP} command.
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
>>>>> +
>>>>> +struct virtio_media_cmd_mmap {
>>>>> +     struct virtio_media_cmd_header hdr;
>>>>> +     u32 session_id;
>>>>> +     u32 flags;
>>>>> +     u64 offset;
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +\begin{description}
>>>>> +\item[\field{flags}] is the set of flags for the mapping. \field{VIRTIO_MEDIA_MMAP_FLAG_RW}
>>>>> +can be set if a read-write mapping is desired. Without this flag the mapping
>>>>> +will be read-only.
>>>>> +\item[\field{offset}] corresponds to the \field{mem_offset} field of the
>>>>> +\textit{union v4l2_plane} for the plane to map. This field can be obtained
>>>>> +using the \textit{VIDIOC_QUERYBUF} ioctl.
>>>>> +\end{description}
>>>>> +
>>>>> +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \textit{virtio_media_resp_mmap}.
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +struct virtio_media_resp_mmap {
>>>>> +    struct virtio_media_resp_header hdr;
>>>>> +    u64 offset;
>>>>> +    u64 len;
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +\begin{description}
>>>>> +\item[\field{offset}] offset into SHM region ID 0 of the start of the mapping.
>>>>> +\item[\field{len}] length of the mapping as indicated by the \textit{struct v4l2_plane}
>>>>> +the buffer belongs to.
>>>>> +\end{description}
>>>>> +
>>>>> +\paragraph{Device Operation: Unmapping a MMAP buffer}
>>>>> +
>>>>> +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously mapped using \field{VIRTIO_MEDIA_CMD_MMAP}.
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +struct virtio_media_cmd_munmap {
>>>>> +    struct virtio_media_cmd_header hdr;
>>>>> +    u64 offset;
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +\begin{description}
>>>>> +\item[\field{offset}] offset into SHM region ID 0 previously returned by
>>>>> +\textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been previously mapped.
>>>>> +\end{description}
>>>>> +
>>>>> +The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with \textit{virtio_media_resp_munmap}.
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +struct virtio_media_resp_munmap {
>>>>> +    struct virtio_media_resp_header hdr;
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP buffer}{Device Types / Media Device / Device Operation / Unmapping a MMAP buffer}
>>>>> +
>>>>> +The device MUST keep mappings performed using \textit{VIRTIO_MEDIA_CMD_MMAP}
>>>>> +valid until \textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the buffers or
>>>>> +session they belong to are released or closed by the driver.
>>>>> +
>>>>> +\paragraph{Device Operation: Memory Types}
>>>>> +
>>>>> +The semantics of the three V4L2 memory types (\textit{MMAP}, \textit{USERPTR}
>>>>> +and \textit{DMABUF}) can easily be mapped to both driver and device context.
>>>>> +
>>>>> +\subparagraph{MMAP}
>>>>> +
>>>>> +In virtio-media, \textit{MMAP} buffers are provisioned by the device, just like
>>>>> +they are by the kernel in regular V4L2. Similarly to how userspace can map a
>>>>> +\textit{MMAP} buffer into its address space using mmap and munmap, the
>>>>> +virtio-media driver can map device buffers into the driver space by queueing the
>>>>> +\textit{struct virtio_media_cmd_mmap} and \textit{struct virtio_media_cmd_munmap}
>>>>> +commands to the commandq.
>>>>> +
>>>>> +\subparagraph{USERPTR}
>>>>> +
>>>>> +In virtio-media, \textit{USERPTR} buffers are provisioned by the driver, just
>>>>> +like they are by userspace in regular V4L2. Instances of \textit{struct v4l2_buffer}
>>>>> +and \textit{struct v4l2_plane} of this type are followed by a list of
>>>>> +\textit{struct virtio_media_sg_entry}. For more information, see
>>>>> +\ref{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
>>>>> +
>>>>> +The device must not alter the pointer values provided by the driver, i.e.
>>>>> +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
>>>>> +\textit{struct v4l2_plane} must be returned to the driver with the same value
>>>>> +as it was provided.
>>>>
>>>> I very, very strongly recommend that you drop USERPTR support for virtio.
>>>> MMAP and DMABUF are sufficient.
>>>>
>>>> It's a pain to support, and we discourage it for new drivers.
>>>>
>>>> If memory serves, there is at least one chromeos driver that is stuck to
>>>> USERPTR support for some reason (I can't remember the details), and that is
>>>> (I think) the only reason USERPTR support is part of virtio. But that is
>>>> really a chromeos issue that they need to fix, IMHO.
>>>
>>> I am wondering if the concerns about USERPTR should apply to the
>>> host/guest context.
>>>
>>> In virtio-media, the USERPTR memory type just means that the buffer
>>> memory has been allocated by the guest and the addresses passed are
>>> guest physical addresses. It doesn't necessarily mean that the memory
>>> has been allocated with the USERPTR type by the guest user-space.
>>
>> Ah, OK. But then USERPTR is a really confusing name for people with a
>> V4L2 background.
>>
>> Regardless, this needs to be explained better.
> 
> We can certainly do that and use a different name, as Albert suggested
> we do for DMABUF. I agree it can be confusing,
> 
>>
>>> For instance, say the guest user-space allocated memory using memfd,
>>> and is passing the FDs to the guest driver as DMABUF buffers. From the
>>> guest kernel point of view, these buffers will still resolve into
>>> guest physical memory, so the USERPTR memory type will be used by
>>> guest/host communication to indicate that fact. I don't know of any
>>> formal way to resolve guest DMABUFs into proper virtio resources
>>> unfortunately.
>>>
>>> Without the ability to communicate buffers as guest physical memory,
>>> the only kinds of DMABUFs supported by the guest driver would be those
>>> coming from another virtio driver, like virtio-gpu. Granted, in
>>> practice that's probably where these will come from anyway, but I
>>> think it would be nice to be able to support memfd, at least for
>>> testing purposes.
>>>
>>> But to answer what I think your concern is, if you prefer that the
>>> guest driver does not advertise support for USERPTR memory type to the
>>> guest userspace, we can certainly enforce that (either absolutely or
>>> through an option).
>>
>> I think I would like that.
> 
> Acknowledged - memfd + DMABUF can cover the same use-cases anyway.
> Just for my erudition, is the reason for eschewing USERPTR documented
> somewhere?

No. Basically DMABUF is a much better and cleaner approach. USERPTR is old
(it predates DMABUF) and is fairly complex to support. It is basically there
for legacy drivers, and new drivers should just enable MMAP and DMABUF only.

Regards,

	Hans

