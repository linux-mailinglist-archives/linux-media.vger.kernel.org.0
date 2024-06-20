Return-Path: <linux-media+bounces-13811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3661D91049D
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172931C23451
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 12:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2346E1ACE60;
	Thu, 20 Jun 2024 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FjwVPwrA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E05D1AC769
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718888040; cv=none; b=tmQim9ISAwJdAY3ePCza/DwH6QcNCbixWNbQsSwf6LFT5Epbvdw4dcbyJmlIXx0mkTKLzu5KdA4arVKGHQo+NrlIDHS3k/DIfjCvwmV31KsL+uhMOK0hX3S0fh9fEO3SaVFwkHvmFSTpIdEHnBvBLXtfwR5MiS1fDsmHKP/w1F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718888040; c=relaxed/simple;
	bh=t7UHhMFfQTkbWxLBMeMS/Ly/hU0VBqNnDv4KUuwcgRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJykUvsGt1E/5wzhvNjA4tnIXEKkfD31j818AaQQtzDufFdBQHUbq8Y7rTseOpvH1aRcMTFb8xP3YoukzFIYcWUegrQ/a6xKxI37IkcaCupDQAOzlSHbbfjS7L62owCNeJed22Jy1bSaQwKpk9bs9l3KNrfJ0kVJCMg7tO9CdoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FjwVPwrA; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6f7720e6e8so99757466b.3
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718888036; x=1719492836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldoYAfTG/Z3B6cFXfUKivX0gnXkc3/i8yod4Kr/ui/U=;
        b=FjwVPwrA4U1xBfo48D0kHiC8MpPR7gnvCQ9a3yXYZm48kbPHtuUenhmlFHGsZ8QNi1
         fTm6Q5coJKpxhJ2OINC2zMHC9Y8Vbte5XVRL+5XmPOtzfQQAfHNJbO0uxd4+mYONxXN8
         zwQAxnzycmjipB88j9Zvzvi3OPibPX2EUe/yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718888036; x=1719492836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldoYAfTG/Z3B6cFXfUKivX0gnXkc3/i8yod4Kr/ui/U=;
        b=DXr999s0WZT49IiMPJCj1WCKL0D6ckLybagSec7TxNQaZ3Izt0YD7Mh4YDm4ojiBft
         18SiGpGLy+ESIKEf7FuK1jFfhDZbu7cn3JaCoryN/he8GN62ZFWtlHGzvDZLHBQZxlrK
         fdPLwxe/JsBV9MKZxXOsACPBaRcVehcQsiu0/jRayXe0VfdL5gweFcvi0KKUS/EAPJ+Z
         5JR1OVSWib6focQN4dWeQp16piSSItYRnRcILmRHadj01YAhNpBfFY82twa+bYOBwsVL
         vR8YQac/SIgy9+y0CdcNabA7lW69YYXB64XRvFZmB2q41AlR04Yun86RGJrh766ebSHN
         sjsw==
X-Forwarded-Encrypted: i=1; AJvYcCW5r/xkdAZTU6zLgBvxL9Ucx3X/4KgEOitzjJVhoG1u8BFRAEnYYYUGjlOZgdg7F9X+gk03FN0Q0fmgfBy8WRRrn1gSNGcLK7H89F4=
X-Gm-Message-State: AOJu0YwoKfeiU/B2kDAIs0oEwz8PFhN1eGvAOR3Sj3+LLOB4JhqyLMSy
	Jw8ZwAlXL7gwB12R9w2QMn9NqapZ2Xaa5FrN7moZVchmF270aF33a6Q70PBw3IPMigKZ309r74M
	=
X-Google-Smtp-Source: AGHT+IERn0UOie4ZgJEKWIVFVfZGBZJ0265dKJzCzoXKE+CgIlsXil4r/nbEVSfHPDEYSuhk6E8t9A==
X-Received: by 2002:a17:907:3d8:b0:a6f:523a:8e94 with SMTP id a640c23a62f3a-a6fab64871dmr330592966b.35.1718888035506;
        Thu, 20 Jun 2024 05:53:55 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da43d0sm765278766b.4.2024.06.20.05.53.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 05:53:55 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57d00a51b71so26657a12.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 05:53:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVc+JGDnRQEVdX9ERnO+u5oZmATHzJgQrA+bOTyfWoCQk1vQmrQrj5aHUuSUsHGt6oXw0XedHeZ9ch9uZ/gg9MX84GG6kLqGuhDCmE=
X-Received: by 2002:a05:6402:13d5:b0:57c:ccef:591d with SMTP id
 4fb4d7f45d1cf-57d0d6d135emr395417a12.4.1718888034055; Thu, 20 Jun 2024
 05:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240607080045.1337046-1-aesteve@redhat.com> <20240607080045.1337046-2-aesteve@redhat.com>
 <d39660b7-7c51-438c-9784-faa91f0c3c29@xs4all.nl> <CAPBb6MV00eRGib6YhEdgTjh-_Rdo2nBwQ6VFSYfyxJcv0Vu06Q@mail.gmail.com>
 <342f5f0f-75c4-49c5-9965-42248fd06c6b@xs4all.nl>
In-Reply-To: <342f5f0f-75c4-49c5-9965-42248fd06c6b@xs4all.nl>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 20 Jun 2024 21:53:41 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWzx61QYAFFBiZdjoeE4U77W8gTsmXsvn2eetUTRqozXQ@mail.gmail.com>
Message-ID: <CAPBb6MWzx61QYAFFBiZdjoeE4U77W8gTsmXsvn2eetUTRqozXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] virtio-media: Add virtio media device specification
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Albert Esteve <aesteve@redhat.com>, Matti.Moell@opensynergy.com, cohuck@redhat.com, 
	mst@redhat.com, daniel.almeida@collabora.com, 
	Alexander.Gordeev@opensynergy.com, changyeon@google.com, 
	alex.bennee@linaro.org, gurchetansingh@google.com, ribalda@google.com, 
	nicolas.dufresne@collabora.com, eballetb@redhat.com, 
	linux-media@vger.kernel.org, virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 9:45=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 08/06/2024 03:24, Alexandre Courbot wrote:
> > Hi Hans,
> >
> > On Fri, Jun 7, 2024 at 5:43=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl=
> wrote:
> >>
> >> Hi Albert,
> >>
> >>
> >> On 07/06/2024 10:00, Albert Esteve wrote:
> >>> Virtio-media is an encapsulation of the V4L2 UAPI into
> >>> virtio, able to virtualize any video device supported
> >>> by V4L2
> >>>
> >>> Note that virtio-media does not require the use of a
> >>> V4L2 device driver or of Linux on the host or
> >>> guest side - V4L2 is only used as a host-guest protocol,
> >>> and both sides are free to convert it from/to any
> >>> model that they wish to use.
> >>
> >> I just have two notes, one minor, one more substantial:
> >>
> >>>
> >>> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> >>> ---
> >>>  conformance.tex                           |  13 +-
> >>>  content.tex                               |   1 +
> >>>  device-types/media/description.tex        | 578 ++++++++++++++++++++=
++
> >>>  device-types/media/device-conformance.tex |  11 +
> >>>  device-types/media/driver-conformance.tex |   9 +
> >>>  5 files changed, 608 insertions(+), 4 deletions(-)
> >>>  create mode 100644 device-types/media/description.tex
> >>>  create mode 100644 device-types/media/device-conformance.tex
> >>>  create mode 100644 device-types/media/driver-conformance.tex
> >>>
> >>> diff --git a/conformance.tex b/conformance.tex
> >>> index dc00e84..c369da1 100644
> >>> --- a/conformance.tex
> >>> +++ b/conformance.tex
> >>> @@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Conformanc=
e / Conformance Targets}
> >>>  \ref{sec:Conformance / Driver Conformance / Memory Driver Conformanc=
e},
> >>>  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Confo=
rmance},
> >>>  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance}=
,
> >>> -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance}=
 or
> >>> -\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}=
.
> >>> +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance}=
,
> >>> +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}=
 or
> >>> +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance=
}.
> >>> +
> >>>
> >>>      \item Clause \ref{sec:Conformance / Legacy Interface: Transition=
al Device and Transitional Driver Conformance}.
> >>>    \end{itemize}
> >>> @@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conformance=
 / Conformance Targets}
> >>>  \ref{sec:Conformance / Device Conformance / Memory Device Conformanc=
e},
> >>>  \ref{sec:Conformance / Device Conformance / I2C Adapter Device Confo=
rmance},
> >>>  \ref{sec:Conformance / Device Conformance / SCMI Device Conformance}=
,
> >>> -\ref{sec:Conformance / Device Conformance / GPIO Device Conformance}=
 or
> >>> -\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}=
.
> >>> +\ref{sec:Conformance / Device Conformance / GPIO Device Conformance}=
,
> >>> +\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}=
 or
> >>> +\ref{sec:Conformance / Device Conformance / Media Device Conformance=
}.
> >>>
> >>>      \item Clause \ref{sec:Conformance / Legacy Interface: Transition=
al Device and Transitional Driver Conformance}.
> >>>    \end{itemize}
> >>> @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conforman=
ce / Conformance Targets}
> >>>  \input{device-types/scmi/driver-conformance.tex}
> >>>  \input{device-types/gpio/driver-conformance.tex}
> >>>  \input{device-types/pmem/driver-conformance.tex}
> >>> +\input{device-types/media/driver-conformance.tex}
> >>>
> >>>  \conformance{\section}{Device Conformance}\label{sec:Conformance / D=
evice Conformance}
> >>>
> >>> @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conforman=
ce / Conformance Targets}
> >>>  \input{device-types/scmi/device-conformance.tex}
> >>>  \input{device-types/gpio/device-conformance.tex}
> >>>  \input{device-types/pmem/device-conformance.tex}
> >>> +\input{device-types/media/device-conformance.tex}
> >>>
> >>>  \conformance{\section}{Legacy Interface: Transitional Device and Tra=
nsitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Tra=
nsitional Device and Transitional Driver Conformance}
> >>>  A conformant implementation MUST be either transitional or
> >>> diff --git a/content.tex b/content.tex
> >>> index 0a62dce..59925ae 100644
> >>> --- a/content.tex
> >>> +++ b/content.tex
> >>> @@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}
> >>>  \input{device-types/scmi/description.tex}
> >>>  \input{device-types/gpio/description.tex}
> >>>  \input{device-types/pmem/description.tex}
> >>> +\input{device-types/media/description.tex}
> >>>
> >>>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >>>
> >>> diff --git a/device-types/media/description.tex b/device-types/media/=
description.tex
> >>> new file mode 100644
> >>> index 0000000..887eacf
> >>> --- /dev/null
> >>> +++ b/device-types/media/description.tex
> >>> @@ -0,0 +1,578 @@
> >>> +\section{Media Device}\label{sec:Device Types / Media Device}
> >>> +
> >>> +The virtio media device follow the same model (and structures) as V4=
L2. It
> >>> +can be used to virtualize cameras, codec devices, or any other devic=
e
> >>> +supported by V4L2. The device assumes 64-bit little-endian V4L2 stru=
ctures
> >>> +are exchanged. The complete definition of V4L2 structures and ioctls=
 can
> >>> +be found under the
> >>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/ind=
ex.html}{V4L2 UAPI documentation}.
> >>> +
> >>> +V4L2 is a UAPI that allows a less privileged entity (user-space) to =
use video
> >>> +hardware exposed by a more privileged entity (the kernel). Virtio-me=
dia is an
> >>> +encapsulation of this API into virtio, turning it into a virtualizat=
ion API
> >>> +for all classes of video devices supported by V4L2, where the device=
 plays the
> >>> +role of the kernel and the driver the role of user-space.
> >>> +
> >>> +The device is therefore responsible for presenting a virtual device =
that behaves
> >>> +like an actual V4L2 device, which the driver can control.
> >>> +
> >>> +Note that virtio-media does not require the use of a V4L2 device dri=
ver or of
> >>> +Linux on any side - V4L2 is only used as a transport protocol,
> >>> +and both sides are free to convert it from/to any model that they wi=
sh to use.
> >>> +
> >>> +This section relies on definitions from
> >>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/ind=
ex.html}{V4L2 UAPI documentation}.
> >>> +
> >>> +\subsection{Device ID}\label{sec:Device Types / Media Device / Devic=
e ID}
> >>> +
> >>> +42
> >>> +
> >>> +\subsection{Virtqueues}\label{sec:Device Types / Media Device / Virt=
queues}
> >>> +
> >>> +\begin{description}
> >>> +\item[0] commandq - used for driver commands and device responses to=
 these
> >>> +commands.
> >>> +\item[1] eventq - used for events sent by the device to the driver.
> >>> +\end{description}
> >>> +
> >>> +\devicenormative{\subsubsection}{Virtqueues}{Device Types / Media De=
vice / Virtqueues}
> >>> +
> >>> +The device MUST return the descriptor chains it receives on the comm=
andq as
> >>> +soon as possible, and must never hold them for indefinite periods of=
 time.
> >>> +
> >>> +\drivernormative{\subsubsection}{Virtqueues}{Device Types / Media De=
vice / Virtqueues}
> >>> +
> >>> +The driver MUST re-queue the descriptor chains returned by the devic=
e on the
> >>> +eventq as soon as possible, and must never hold them for indefinite =
periods
> >>> +of time.
> >>> +
> >>> +\subsection{Feature Bits}\label{sec:Device Types / Media Device / Fe=
ature Bits}
> >>> +
> >>> +None
> >>> +
> >>> +\subsection{Device Configuration Layout}\label{sec:Device Types / Me=
dia Device / Device Configuration Layout}
> >>> +
> >>> +The video device configuration space uses the following layout:
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_config {
> >>> +    le32 device_caps;
> >>> +    le32 device_type;
> >>> +    u8 card[32];
> >>
> >> Use char instead of u8. It's always been a pain that struct v4l2_capab=
ility
> >> used u8 instead of char for the character arrays. I never understood w=
hy, and
> >> if you are making a new struct I would recommend using char.
> >>
> >> Up to you, though.
> >>
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{device_caps}] (driver-read-only) flags representing the=
 device
> >>> +capabilities as used in
> >>> +\href{https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-que=
rycap.html#c.v4l2_capability}{struct v4l2_capabilities}.
> >>> +Corresponds with the \field{device_caps} field in the \textit{struct=
 video_device}.
> >>> +\item[\field{device_type}] (driver-read-only) informs the driver of =
the type
> >>> +of the video device. Corresponds with the \field{vfl_devnode_type} f=
ield of the device.
> >>> +\item[\field{card}] (driver-read-only) name of the device, a NUL-ter=
minated
> >>> +UTF-8 string. Corresponds with the \field{card} field of the \textit=
{struct v4l2_capability}.
> >>> +If all the characters of the field are used, it does not need to be =
NUL-terminated.
> >>> +\end{description}
> >>> +
> >>> +\subsection{Device Initialization}
> >>> +
> >>> +\begin{enumerate}
> >>> +\item The driver reads the \field{device_caps} and \field{device_typ=
e} fields
> >>> +from the configuration layout to identify the device.
> >>> +\item The driver sets up the \field{commandq} and \field{eventq}.
> >>> +\item The driver may open a session to use the device and send V4L2 =
ioctls in
> >>> +order to receive more information about the device, such as supporte=
d
> >>> +formats or controls.
> >>> +\end{enumerate}
> >>> +
> >>> +\subsection{Device Operation}\label{sec:Device Types / Media Device =
/ Device Operation}
> >>> +
> >>> +Commands are queued on the command queue by the driver for the devic=
e to
> >>> +process. The errors returned by each command are standard
> >>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen=
-errors.html}{Linux kernel error codes}.
> >>> +For instance, a command that contains invalid options will return \t=
extit{EINVAL}.
> >>> +
> >>> +Events are sent on the event queue by the device for the driver to h=
andle.
> >>> +
> >>> +\subsubsection{Command Virtqueue}
> >>> +
> >>> +\paragraph{Device Operation: Command headers}
> >>> +
> >>> +\begin{lstlisting}
> >>> +#define VIRTIO_MEDIA_CMD_OPEN 1
> >>> +#define VIRTIO_MEDIA_CMD_CLOSE 2
> >>> +#define VIRTIO_MEDIA_CMD_IOCTL 3
> >>> +#define VIRTIO_MEDIA_CMD_MMAP 4
> >>> +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> >>> +
> >>> +/* Header for all virtio commands from the driver to the device on t=
he commandq. */
> >>> +struct virtio_media_cmd_header {
> >>> +     u32 cmd;
> >>> +     u32 __padding;
> >>> +};
> >>> +
> >>> +/* Header for all virtio responses from the device to the driver on =
the commandq. */
> >>> +struct virtio_media_resp_header {
> >>> +     u32 status;
> >>> +     u32 __padding;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +A command consists of a command header \textit{virtio_media_cmd_head=
er}
> >>> +containing the following device-readable field:
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD=
_*).
> >>> +\end{description}
> >>> +
> >>> +A response consists of a response header \textit{virtio_media_resp_h=
eader}
> >>> +containing the following device-writable field:
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{status}] indicates a device request status.
> >>> +\end{description}
> >>> +
> >>> +The status field can take 0 if the command was successful, or one of=
 the
> >>> +standard Linux error codes if it was not.
> >>> +
> >>> +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Se=
ssions}{Device Types / Media Device / Device Operation / Command Virtqueue}
> >>> +
> >>> +Sessions are how the device is multiplexed, allowing several distinc=
t works to
> >>> +take place simultaneously. The driver needs to open a session before=
 it can
> >>> +perform any useful operation on the device.
> >>> +
> >>> +\paragraph{Device Operation: Open device}
> >>> +
> >>> +\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.
> >>> +
> >>> +This is the equivalent of calling \textit{open} on a V4L2 device nod=
e.
> >>> +The driver uses \textit{virtio_media_cmd_open} to send an open reque=
st.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_cmd_open {
> >>> +    struct virtio_media_cmd_header hdr;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \textit{v=
irtio_media_resp_open}.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_resp_open {
> >>> +    struct virtio_media_resp_header hdr;
> >>> +    u32 session_id;
> >>> +    u32 __padding;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{session_id}] specifies an identifier for the current se=
ssion. The
> >>> +identifier can be used to perform other commands on the session, not=
ably ioctls.
> >>> +\end{description}
> >>> +
> >>> +\devicenormative{\subparagraph}{Device Operation: Open device}{Devic=
e Types / Media Device / Device Operation / Open device}
> >>> +
> >>> +Upon success, the device MUST set a \field{session_id} in \textit{vi=
rtio_media_resp_open}
> >>> +to an integer that is NOT used by any other open session.
> >>> +
> >>> +\paragraph{Device Operation: Close device}
> >>> +
> >>> +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active sessio=
n.
> >>> +
> >>> +This is the equivalent of calling \textit{close} on a previously ope=
ned V4L2
> >>> +device node. All resources associated with this session will be free=
d.
> >>> +
> >>> +This command does not require a response from the device.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_cmd_close {
> >>> +    struct virtio_media_cmd_header hdr;
> >>> +    u32 session_id;
> >>> +    u32 __padding;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{session_id}] specifies an identifier for the session to=
 close.
> >>> +\end{description}
> >>> +
> >>> +\drivernormative{\subparagraph}{Device Operation: Close device}{Devi=
ce Types / Media Device / Device Operation / Close device}
> >>> +
> >>> +The session ID SHALL NOT be used again after queueing this command.
> >>> +
> >>> +\paragraph{Device Operation: V4L2 ioctls}
> >>> +
> >>> +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an=
 open
> >>> +session.
> >>> +
> >>> +This command asks the device to run one of the `VIDIOC_*` ioctls on =
the active
> >>> +session.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_cmd_ioctl {
> >>> +    struct virtio_media_cmd_header hdr;
> >>> +    u32 session_id;
> >>> +    u32 code;
> >>> +    /* Followed by the relevant ioctl payload as defined in the macr=
o */
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{session_id}] specifies an identifier of thesession to r=
un the ioctl on.
> >>> +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl=
 to run.
> >>> +\end{description}
> >>> +
> >>> +The code is extracted from the
> >>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l=
/videodev.html}{videodev2.h},
> >>> +header file. The file defines the ioctl's codes, type of payload, an=
d
> >>> +direction. The code consists of the second argument of the \field{_I=
O*} macro.
> >>> +
> >>> +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> >>> +
> >>> +\begin{lstlisting}
> >>> +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> >>> +\end{lstlisting}
> >>> +
> >>> +This means that its ioctl code is \textit{4}, that its payload is a
> >>> +\textit{struct v4l2_format}, and that its direction is \textit{WR} (=
i.e., the
> >>> +payload is written by both the driver and the device).
> >>> +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioc=
tls payload}
> >>> +for more information about the direction of ioctls.
> >>> +
> >>> +The payload layout is always a 64-bit representation of the correspo=
nding
> >>> +V4L2 structure.
> >>> +
> >>> +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{=
virtio_media_resp_ioctl}.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_resp_ioctl {
> >>> +    struct virtio_media_resp_header hdr;
> >>> +    /* Followed by the ioctl payload as defined in the macro */
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device =
/ V4L2 ioctls / Ioctls payload}
> >>> +
> >>> +Each ioctl has a payload, which is defined by the third argument of =
the
> >>> +\field{_IO*} macro defining it.
> >>> +
> >>> +The payload of an ioctl in the descriptor chain follows the command =
structure,
> >>> +the reponse structure, or both depending on the direction:
> >>> +
> >>> +\begin{itemize}
> >>> +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> >>> +follows the response in the device-writable section of the descripto=
r chain.
> >>> +\item \textbf{_IOW} is read-only for the device, meaning the payload
> >>> +follows the command in the driver-writable section of the descriptor=
 chain.
> >>> +\item \textbf{_IOWR} is writable by both the device and driver,
> >>> +meaning the payload must follow both the command in the driver-writa=
ble section
> >>> +of the descriptor chain, and the response in the device-writable sec=
tion.
> >>> +\end{itemize}
> >>> +
> >>> +A common optimization for \textit{WR} ioctls is to provide the paylo=
ad using
> >>> +descriptors that both point to the same buffer. This mimics the beha=
vior of
> >>> +V4L2 ioctls where the data is only passed once and used as both inpu=
t and
> >>> +output by the kernel.
> >>> +
> >>> +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Devic=
e Types / Media Device / Device Operation / V4L2 ioctls}
> >>> +
> >>> +In case of success of a device-writable ioctl, the device MUST alway=
s write the
> >>> +payload in the device-writable part of the descriptor chain.
> >>> +
> >>> +In case of failure of a device-writable ioctl, the device is free to=
 write the
> >>> +payload in the device-writable part of the descriptor chain or not. =
Some errors
> >>> +may still result in the payload being updated, and in this case the =
device is
> >>> +expected to write the updated payload. If the device has not written=
 the
> >>> +payload after an error, the driver MUST assume that the payload has =
not been
> >>> +modified.
> >>> +
> >>> +\subparagraph{Handling of pointers in ioctl payload}
> >>> +
> >>> +A few structures used as ioctl payloads contain pointers to further
> >>> +data needed for the ioctl. There are notably:
> >>> +
> >>> +\begin{itemize}
> >>> +\item The \field{planes} pointer of
> >>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l=
/buffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> >>> +which size is determined by the length member.
> >>> +\item The \field{controls} pointer of \textit{struct v4l2_ext_contro=
ls}, which
> >>> +size is determined by the count member.
> >>> +\end{itemize}
> >>> +
> >>> +If the size of the pointed area is determined to be non-zero, then t=
he main
> >>> +payload is immediately followed by the pointed data in their order o=
f
> >>> +appearance in the structure, and the pointer value itself is ignored=
 by the
> >>> +device, which must also return the value initially passed by the dri=
ver.
> >>> +
> >>> +\subparagraph{Handling of pointers to userspace memory}
> >>> +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace mem=
ory}
> >>> +
> >>> +A few pointers are special in that they point to userspace memory in=
 the
> >>> +original V4L2 specification. They are:
> >>> +
> >>> +\begin{itemize}
> >>> +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} an=
d
> >>> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l=
/buffer.html#struct-v4l2-plane}{struct v4l2_plane}
> >>> +(technically an unsigned long, but designated a userspace address).
> >>> +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> >>> +\end{itemize}
> >>> +
> >>> +These pointers can cover large areas of scattered memory, which has =
the
> >>
> >> Actually, only m.userptr can cover a large area. The other two are lim=
ited.
> >> See my comment about USERPTR support below.
> >>
> >>> +potential to require more descriptors than the virtio queue can prov=
ide. For
> >>> +these particular pointers only, a list of \textit{struct virtio_medi=
a_sg_entry}
> >>> +that covers the needed amount of memory for the pointer is used inst=
ead of
> >>> +using descriptors to map the pointed memory directly.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_sg_entry {
> >>> +     u64 start;
> >>> +     u32 len;
> >>> +     u32 __padding;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +For each such pointer to read, the device reads as many SG entries a=
s needed
> >>> +to cover the length of the pointed buffer, as described by its paren=
t
> >>> +structure (\field{length} member of \textit{struct v4l2_buffer} or
> >>> +\textit{struct v4l2_plane} for buffer memory, and \field{size} membe=
r of
> >>> +\textit{struct v4l2_ext_control} for control data).
> >>> +
> >>> +Since the device never needs to modify the list of SG entries, it is=
 only
> >>> +provided by the driver in the device-readable section of the descrip=
tor chain,
> >>> +and not repeated in the device-writable section, even for WR ioctls.
> >>> +
> >>> +\subparagraph{Unsupported ioctls}
> >>> +
> >>> +A few ioctls are replaced by other, more suitable mechanisms.
> >>> +
> >>> +\begin{itemize}
> >>> +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configurat=
ion area
> >>> +(see \ref{sec:Device Types / Media Device / Device Configuration Lay=
out}).
> >>> +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
> >>> +(see \ref{sec:Device Types / Media Device / Device Operation / Deque=
ue buffer}).
> >>> +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
> >>> +(see \ref{sec:Device Types / Media Device / Device Operation / Emit =
an event}).
> >>> +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are =
deprecated
> >>> +and replaced by the controls of the JPEG class.
> >>> +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shal=
l not be
> >>> +implemented by the device.
> >>> +\end{itemize}
> >>> +
> >>> +\devicenormative{\subparagraph}{Device Operation: Unsupported ioctls=
}{Device Types / Media Device / Device Operation / Unsupported ioctls}
> >>> +
> >>> +If being requested an unsupported ioctl, the device MUST return the =
same
> >>> +error response as it would for an unknown ioctl, i.e. \textit{ENOTTY=
}.
> >>> +
> >>> +\paragraph{Device Operation: Mapping a MMAP buffer}
> >>> +
> >>> +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer int=
o the
> >>> +driver's address space.
> >>> +
> >>> +Shared memory region ID 0 is used to map MMAP buffers with
> >>> +the \textit{VIRTIO_MEDIA_CMD_MMAP} command.
> >>> +
> >>> +\begin{lstlisting}
> >>> +#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
> >>> +
> >>> +struct virtio_media_cmd_mmap {
> >>> +     struct virtio_media_cmd_header hdr;
> >>> +     u32 session_id;
> >>> +     u32 flags;
> >>> +     u64 offset;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{flags}] is the set of flags for the mapping. \field{VIR=
TIO_MEDIA_MMAP_FLAG_RW}
> >>> +can be set if a read-write mapping is desired. Without this flag the=
 mapping
> >>> +will be read-only.
> >>> +\item[\field{offset}] corresponds to the \field{mem_offset} field of=
 the
> >>> +\textit{union v4l2_plane} for the plane to map. This field can be ob=
tained
> >>> +using the \textit{VIDIOC_QUERYBUF} ioctl.
> >>> +\end{description}
> >>> +
> >>> +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \textit{v=
irtio_media_resp_mmap}.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_resp_mmap {
> >>> +    struct virtio_media_resp_header hdr;
> >>> +    u64 offset;
> >>> +    u64 len;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{offset}] offset into SHM region ID 0 of the start of th=
e mapping.
> >>> +\item[\field{len}] length of the mapping as indicated by the \textit=
{struct v4l2_plane}
> >>> +the buffer belongs to.
> >>> +\end{description}
> >>> +
> >>> +\paragraph{Device Operation: Unmapping a MMAP buffer}
> >>> +
> >>> +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously mapp=
ed using \field{VIRTIO_MEDIA_CMD_MMAP}.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_cmd_munmap {
> >>> +    struct virtio_media_cmd_header hdr;
> >>> +    u64 offset;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{offset}] offset into SHM region ID 0 previously returne=
d by
> >>> +\textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been previous=
ly mapped.
> >>> +\end{description}
> >>> +
> >>> +The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with \textit=
{virtio_media_resp_munmap}.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_resp_munmap {
> >>> +    struct virtio_media_resp_header hdr;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP b=
uffer}{Device Types / Media Device / Device Operation / Unmapping a MMAP bu=
ffer}
> >>> +
> >>> +The device MUST keep mappings performed using \textit{VIRTIO_MEDIA_C=
MD_MMAP}
> >>> +valid until \textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the =
buffers or
> >>> +session they belong to are released or closed by the driver.
> >>> +
> >>> +\paragraph{Device Operation: Memory Types}
> >>> +
> >>> +The semantics of the three V4L2 memory types (\textit{MMAP}, \textit=
{USERPTR}
> >>> +and \textit{DMABUF}) can easily be mapped to both driver and device =
context.
> >>> +
> >>> +\subparagraph{MMAP}
> >>> +
> >>> +In virtio-media, \textit{MMAP} buffers are provisioned by the device=
, just like
> >>> +they are by the kernel in regular V4L2. Similarly to how userspace c=
an map a
> >>> +\textit{MMAP} buffer into its address space using mmap and munmap, t=
he
> >>> +virtio-media driver can map device buffers into the driver space by =
queueing the
> >>> +\textit{struct virtio_media_cmd_mmap} and \textit{struct virtio_medi=
a_cmd_munmap}
> >>> +commands to the commandq.
> >>> +
> >>> +\subparagraph{USERPTR}
> >>> +
> >>> +In virtio-media, \textit{USERPTR} buffers are provisioned by the dri=
ver, just
> >>> +like they are by userspace in regular V4L2. Instances of \textit{str=
uct v4l2_buffer}
> >>> +and \textit{struct v4l2_plane} of this type are followed by a list o=
f
> >>> +\textit{struct virtio_media_sg_entry}. For more information, see
> >>> +\ref{sec:Device Types / Media Device / V4L2 ioctls / Userspace memor=
y}
> >>> +
> >>> +The device must not alter the pointer values provided by the driver,=
 i.e.
> >>> +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
> >>> +\textit{struct v4l2_plane} must be returned to the driver with the s=
ame value
> >>> +as it was provided.
> >>
> >> I very, very strongly recommend that you drop USERPTR support for virt=
io.
> >> MMAP and DMABUF are sufficient.
> >>
> >> It's a pain to support, and we discourage it for new drivers.
> >>
> >> If memory serves, there is at least one chromeos driver that is stuck =
to
> >> USERPTR support for some reason (I can't remember the details), and th=
at is
> >> (I think) the only reason USERPTR support is part of virtio. But that =
is
> >> really a chromeos issue that they need to fix, IMHO.
> >
> > I am wondering if the concerns about USERPTR should apply to the
> > host/guest context.
> >
> > In virtio-media, the USERPTR memory type just means that the buffer
> > memory has been allocated by the guest and the addresses passed are
> > guest physical addresses. It doesn't necessarily mean that the memory
> > has been allocated with the USERPTR type by the guest user-space.
>
> Ah, OK. But then USERPTR is a really confusing name for people with a
> V4L2 background.
>
> Regardless, this needs to be explained better.

We can certainly do that and use a different name, as Albert suggested
we do for DMABUF. I agree it can be confusing,

>
> > For instance, say the guest user-space allocated memory using memfd,
> > and is passing the FDs to the guest driver as DMABUF buffers. From the
> > guest kernel point of view, these buffers will still resolve into
> > guest physical memory, so the USERPTR memory type will be used by
> > guest/host communication to indicate that fact. I don't know of any
> > formal way to resolve guest DMABUFs into proper virtio resources
> > unfortunately.
> >
> > Without the ability to communicate buffers as guest physical memory,
> > the only kinds of DMABUFs supported by the guest driver would be those
> > coming from another virtio driver, like virtio-gpu. Granted, in
> > practice that's probably where these will come from anyway, but I
> > think it would be nice to be able to support memfd, at least for
> > testing purposes.
> >
> > But to answer what I think your concern is, if you prefer that the
> > guest driver does not advertise support for USERPTR memory type to the
> > guest userspace, we can certainly enforce that (either absolutely or
> > through an option).
>
> I think I would like that.

Acknowledged - memfd + DMABUF can cover the same use-cases anyway.
Just for my erudition, is the reason for eschewing USERPTR documented
somewhere?

Thanks,
Alex.

>
> Regards,
>
>         Hans
>
> >
> > Cheers,
> > Alex.
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>> +
> >>> +\subparagraph{DMABUF}
> >>> +
> >>> +In virtio-media, \textit{DMABUF} buffers are provisioned by a virtio=
 object,
> >>> +just like they are by a \textit{DMABUF} in regular V4L2. Virtio obje=
cts are
> >>> +16-bytes UUIDs and do not fit in the placeholders for file descripto=
rs, so
> >>> +they follow their embedding data structure as needed and the device =
must
> >>> +leave the V4L2 structure placeholder unchanged.
> >>> +
> >>> +Contrary to \textit{USERPTR} buffers, virtio objects UUIDs need to b=
e added in
> >>> +both the device-readable and device-writable section of the descript=
or chain.
> >>> +
> >>> +Device-allocated buffers with the \textit{V4L2_MEMORY_MMAP} memory t=
ype can also
> >>> +be exported as virtio objects for use with another virtio device usi=
ng the
> >>> +\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of \textit{v4l2_exp=
ortbuffer}
> >>> +means that space for the UUID needs to be reserved right after that =
structure
> >>> +
> >>> +\subsubsection{Event Virtqueue}
> >>> +
> >>> +Events are a way for the device to inform the driver about asynchron=
ous events
> >>> +that it should know about. In virtio-media, they are used as a repla=
cement for
> >>> +the \textit{VIDIOC_DQBUF} and \textit{VIDIOC_DQEVENT} ioctls and the=
 polling
> >>> +mechanism, which would be impractical to implement on top of virtio.
> >>> +
> >>> +\paragraph{Device Operation: Event header}
> >>> +
> >>> +\begin{lstlisting}
> >>> +#define VIRTIO_MEDIA_EVT_ERROR 0
> >>> +#define VIRTIO_MEDIA_EVT_DQBUF 1
> >>> +#define VIRTIO_MEDIA_EVT_EVENT 2
> >>> +
> >>> +/* Header for events queued by the device for the driver on the even=
tq. */
> >>> +struct virtio_media_event_header {
> >>> +    u32 event;
> >>> +    u32 session_id;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{event}] one of \field{VIRTIO_MEDIA_EVT_*}.
> >>> +\item[\field{session_id}] ID of the session the event applies to.
> >>> +\end{description}
> >>> +
> >>> +\paragraph{Device Operation: Device-side error}
> >>> +
> >>> +\textbf{VIRTIO_MEDIA_EVT_ERROR} Upon receiving this event, the sessi=
on
> >>> +mentioned in the header is considered corrupted and automatically cl=
osed by
> >>> +the device.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_event_error {
> >>> +    struct virtio_media_event_header hdr;
> >>> +    u32 errno;
> >>> +    u32 __padding;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{errno}] error code describing the kind of error that oc=
curred.
> >>> +\end{description}
> >>> +
> >>> +\paragraph{Device Operation: Dequeue buffer}
> >>> +\label{sec:Device Types / Media Device / Device Operation / Dequeue =
buffer}
> >>> +
> >>> +\textbf{VIRTIO_MEDIA_EVT_DQBUF} Signals that a buffer is not being u=
sed anymore
> >>> +by the device and is returned to the driver.
> >>> +
> >>> +A \textit{struct virtio_media_event_dqbuf} event is queued on the ev=
entq by the
> >>> +device every time a buffer previously queued using the \textit{VIDIO=
C_QBUF}
> >>> +ioctl is done being processed and can be used by the driver again. T=
his is like
> >>> +an implicit \textit{VIDIOC_DQBUF} ioctl.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_event_dqbuf {
> >>> +    struct virtio_media_event_header hdr;
> >>> +    struct v4l2_buffer buffer;
> >>> +    struct v4l2_plane planes[VIDEO_MAX_PLANES];
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{buffer}] \textit{struct v4l2_buffer} describing the buf=
fer that has been dequeued.
> >>> +\item[\field{planes}] array of \textit{struct v4l2_plane} containing=
 the plane information for multi-planar buffers.
> >>> +\end{description}
> >>> +
> >>> +Pointer values in the \textit{struct v4l2_buffer} and \textit{struct=
 v4l2_plane}
> >>> +are meaningless and must be ignored by the driver. It is recommended=
 that the
> >>> +device sets them to NULL in order to avoid leaking potential device =
addresses.
> >>> +
> >>> +Note that in the case of a \field{USERPTR} buffer, the \textit{struc=
t v4l2_buffer}
> >>> +used as event payload is not followed by the buffer memory: since th=
at memory
> >>> +is the same that the driver submitted with the \textit{VIDIOC_QBUF},=
 it would
> >>> +be redundant to have it here.
> >>> +
> >>> +\paragraph{Device Operation: Emit an event}
> >>> +\label{sec:Device Types / Media Device / Device Operation / Emit an =
event}
> >>> +
> >>> +\textbf{VIRTIO_MEDIA_EVT_EVENT} Signals that a V4L2 event has been e=
mitted for a session.
> >>> +
> >>> +A \textit{struct virtio_media_event_event} event is queued on the ev=
entq by the
> >>> +device every time an event the driver previously subscribed to using=
 the
> >>> +\textit{VIDIOC_SUBSCRIBE_EVENT} ioctl has been signaled. This is lik=
e an
> >>> +implicit \textit{VIDIOC_DQEVENT} ioctl.
> >>> +
> >>> +\begin{lstlisting}
> >>> +struct virtio_media_event_event {
> >>> +    struct virtio_media_event_header hdr;
> >>> +    struct v4l2_event event;
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{event}] \textit{struct v4l2_event} describing the event=
 that occurred.
> >>> +\end{description}
> >>> diff --git a/device-types/media/device-conformance.tex b/device-types=
/media/device-conformance.tex
> >>> new file mode 100644
> >>> index 0000000..3338822
> >>> --- /dev/null
> >>> +++ b/device-types/media/device-conformance.tex
> >>> @@ -0,0 +1,11 @@
> >>> +\conformance{\subsection}{Media Device Conformance}\label{sec:Confor=
mance / Device Conformance / Media Device Conformance}
> >>> +
> >>> +A Media device MUST conform to the following normative statements:
> >>> +
> >>> +\begin{itemize}
> >>> +\item \ref{devicenormative:Device Types / Media Device / Virtqueues}
> >>> +\item \ref{devicenormative:Device Types / Media Device / Device Oper=
ation / Open device}
> >>> +\item \ref{devicenormative:Device Types / Media Device / Device Oper=
ation / V4L2 ioctls}
> >>> +\item \ref{devicenormative:Device Types / Media Device / Device Oper=
ation / Unsupported ioctls}
> >>> +\item \ref{devicenormative:Device Types / Media Device / Device Oper=
ation / Unmapping a MMAP buffer}
> >>> +\end{itemize}
> >>> \ No newline at end of file
> >>> diff --git a/device-types/media/driver-conformance.tex b/device-types=
/media/driver-conformance.tex
> >>> new file mode 100644
> >>> index 0000000..058b812
> >>> --- /dev/null
> >>> +++ b/device-types/media/driver-conformance.tex
> >>> @@ -0,0 +1,9 @@
> >>> +\conformance{\subsection}{Media Device Conformance}\label{sec:Confor=
mance / Driver Conformance / Media Driver Conformance}
> >>> +
> >>> +A Media device MUST conform to the following normative statements:
> >>> +
> >>> +\begin{itemize}
> >>> +\item \ref{drivernormative:Device Types / Media Device / Virtqueues}
> >>> +\item \ref{drivernormative:Device Types / Media Device / Device Oper=
ation / Command Virtqueue}
> >>> +\item \ref{drivernormative:Device Types / Media Device / Device Oper=
ation / Close device}
> >>> +\end{itemize}
> >>> \ No newline at end of file
> >>
>

