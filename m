Return-Path: <linux-media+bounces-12769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17556900F14
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 03:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAA1F284C16
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 01:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ED579F3;
	Sat,  8 Jun 2024 01:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RAGC/Q7h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E827423A9
	for <linux-media@vger.kernel.org>; Sat,  8 Jun 2024 01:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717809903; cv=none; b=msh14ZIzLdtRzv5ngLZV1RvdeQ4OULqV5o3QWs3KvlMJ7rP0UbjaUZuLE2EIFa+u//whe684ANIz2gtGyf3SLLBgUpyUeAZfzIFbgCm9qm+1PvjrGQHazvjYuiY8Dg7PEIs0V7XyflnEbPkhvymJ5DcMxOzIk1hl7GBo04DHoVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717809903; c=relaxed/simple;
	bh=mtF2ALGaMtgQ3gZXu8Q6gFw7XtcpfYAITSSvBa1IqbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMAuKKL0qnbRHMV1boC+emE21BBpdDoNildW8vV2dQagfkn/VO6C7FIfgFsyE8hP60JiFDNIftfE9dQRlorrwxc5hdffZMSim7DPtM58WEP43JHjQf88783YJIHi7FtpIIABQM5JmGIN2SLWCjwHRyCH5gOUGWmeBOm3CScueDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RAGC/Q7h; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b8b638437so3040165e87.3
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 18:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717809897; x=1718414697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hc39FGJbcSqmSG7/48Tge8d4M9c3uz4x63PXvV2yrt4=;
        b=RAGC/Q7hSHYbHz0G6j+gf7672atYGvhx9g3FmbgBT9Cev5HNXxBAxcYjsG0/AgPmLP
         YK4XfCNvqFptyR8N6uy/yraQMImRsJ6fBNyYWbTrvvmjpqAMYrpmoKeBmwspJEzg3FOa
         APrhwVFfUbJ4JhnqN25rnUzDgcExQIxK1bRRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717809897; x=1718414697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hc39FGJbcSqmSG7/48Tge8d4M9c3uz4x63PXvV2yrt4=;
        b=C9S/BKJf2TTUzDG+IweuCRJZ/5OZVVdpRabLvvpsDV7WP4wL85FiLcp7P9Ft2zSnJ4
         XKgu9x9hcjbTYqIatWqnz9tn1n8+EXZELyeHlvyOjBI1RYFo2+ya3IDaAYxUM+3pHWdH
         FmiAdYHuTEPe2inNHwLvPpWaSN9MKDd1uGQWhTwGnER0UEH1X5grBg+MtvxwZ4G2KtTe
         RIRH0hIQu5k7yyOrFAXkpyNK22Ab4XxPcQ1GkCy7MCUCUaQPnUHmFXvtUC7gMLrvuHyG
         VABm9IG6qHXsQ08XrD5bMZzClhSgW2UdtobEPO5ovWyaJ2esukEnVk+RkVIhrI2ssIrl
         RmJA==
X-Forwarded-Encrypted: i=1; AJvYcCXohw+ROii1131ii4TXAm5W9gIy5qlKtN545AOa+zfImqgdrJ37Zx6Q8+o2+mUAlHmpKg/v4+n8hEm4QMB/E6ckZP75Gnxa5Nf4288=
X-Gm-Message-State: AOJu0YwfDcb3YVFKGJcKzbnCjef2GQLJnXyelalOMVvrMg9sr/4gVRym
	H2ucQpCFfh3TKrhGwNqkRgkXjgnaGxR8uP+bKxt2ym4tucIwdNERjjsvuMf4ECGFqShrsaEcsaw
	=
X-Google-Smtp-Source: AGHT+IEpDDkYgvN+tgYe1lnaU3meFmFywPs2NR6FolyHPu+JJJA6ZvanjskAtAAnumriXlSNK+JtJg==
X-Received: by 2002:a05:6512:158f:b0:51d:a87e:27ec with SMTP id 2adb3069b0e04-52bb9f5d0camr3428573e87.9.1717809896746;
        Fri, 07 Jun 2024 18:24:56 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41e1c93sm696826e87.30.2024.06.07.18.24.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 18:24:56 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52bc1ad11aeso694e87.1
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 18:24:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVfS5tBJvN0KzylUAHwvMZ5HMw1jJSjK08OthnSemJuy6cGRFnpMYMdzMzlUANM0zBge3EhXZnFCZ+M06uVAADx07hgDW/i8by0Mw=
X-Received: by 2002:ac2:4242:0:b0:52b:de5d:9fa with SMTP id
 2adb3069b0e04-52c7f2e4a85mr27711e87.3.1717809894836; Fri, 07 Jun 2024
 18:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240607080045.1337046-1-aesteve@redhat.com> <20240607080045.1337046-2-aesteve@redhat.com>
 <d39660b7-7c51-438c-9784-faa91f0c3c29@xs4all.nl>
In-Reply-To: <d39660b7-7c51-438c-9784-faa91f0c3c29@xs4all.nl>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Sat, 8 Jun 2024 10:24:42 +0900
X-Gmail-Original-Message-ID: <CAPBb6MV00eRGib6YhEdgTjh-_Rdo2nBwQ6VFSYfyxJcv0Vu06Q@mail.gmail.com>
Message-ID: <CAPBb6MV00eRGib6YhEdgTjh-_Rdo2nBwQ6VFSYfyxJcv0Vu06Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] virtio-media: Add virtio media device specification
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Albert Esteve <aesteve@redhat.com>, virtio-dev@lists.linux.dev, 
	virtio-dev@lists.oasis-open.org, Matti.Moell@opensynergy.com, 
	cohuck@redhat.com, mst@redhat.com, daniel.almeida@collabora.com, 
	Alexander.Gordeev@opensynergy.com, changyeon@google.com, 
	alex.bennee@linaro.org, gurchetansingh@google.com, ribalda@google.com, 
	nicolas.dufresne@collabora.com, eballetb@redhat.com, 
	linux-media@vger.kernel.org, virtio-comment@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Fri, Jun 7, 2024 at 5:43=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> Hi Albert,
>
>
> On 07/06/2024 10:00, Albert Esteve wrote:
> > Virtio-media is an encapsulation of the V4L2 UAPI into
> > virtio, able to virtualize any video device supported
> > by V4L2
> >
> > Note that virtio-media does not require the use of a
> > V4L2 device driver or of Linux on the host or
> > guest side - V4L2 is only used as a host-guest protocol,
> > and both sides are free to convert it from/to any
> > model that they wish to use.
>
> I just have two notes, one minor, one more substantial:
>
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  conformance.tex                           |  13 +-
> >  content.tex                               |   1 +
> >  device-types/media/description.tex        | 578 ++++++++++++++++++++++
> >  device-types/media/device-conformance.tex |  11 +
> >  device-types/media/driver-conformance.tex |   9 +
> >  5 files changed, 608 insertions(+), 4 deletions(-)
> >  create mode 100644 device-types/media/description.tex
> >  create mode 100644 device-types/media/device-conformance.tex
> >  create mode 100644 device-types/media/driver-conformance.tex
> >
> > diff --git a/conformance.tex b/conformance.tex
> > index dc00e84..c369da1 100644
> > --- a/conformance.tex
> > +++ b/conformance.tex
> > @@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Conformance =
/ Conformance Targets}
> >  \ref{sec:Conformance / Driver Conformance / Memory Driver Conformance}=
,
> >  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conform=
ance},
> >  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
> > -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} o=
r
> > -\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
> > +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
> > +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} o=
r
> > +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.
> > +
> >
> >      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional=
 Device and Transitional Driver Conformance}.
> >    \end{itemize}
> > @@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
> >  \ref{sec:Conformance / Device Conformance / Memory Device Conformance}=
,
> >  \ref{sec:Conformance / Device Conformance / I2C Adapter Device Conform=
ance},
> >  \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
> > -\ref{sec:Conformance / Device Conformance / GPIO Device Conformance} o=
r
> > -\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.
> > +\ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
> > +\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} o=
r
> > +\ref{sec:Conformance / Device Conformance / Media Device Conformance}.
> >
> >      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional=
 Device and Transitional Driver Conformance}.
> >    \end{itemize}
> > @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conformance=
 / Conformance Targets}
> >  \input{device-types/scmi/driver-conformance.tex}
> >  \input{device-types/gpio/driver-conformance.tex}
> >  \input{device-types/pmem/driver-conformance.tex}
> > +\input{device-types/media/driver-conformance.tex}
> >
> >  \conformance{\section}{Device Conformance}\label{sec:Conformance / Dev=
ice Conformance}
> >
> > @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conformance=
 / Conformance Targets}
> >  \input{device-types/scmi/device-conformance.tex}
> >  \input{device-types/gpio/device-conformance.tex}
> >  \input{device-types/pmem/device-conformance.tex}
> > +\input{device-types/media/device-conformance.tex}
> >
> >  \conformance{\section}{Legacy Interface: Transitional Device and Trans=
itional Driver Conformance}\label{sec:Conformance / Legacy Interface: Trans=
itional Device and Transitional Driver Conformance}
> >  A conformant implementation MUST be either transitional or
> > diff --git a/content.tex b/content.tex
> > index 0a62dce..59925ae 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}
> >  \input{device-types/scmi/description.tex}
> >  \input{device-types/gpio/description.tex}
> >  \input{device-types/pmem/description.tex}
> > +\input{device-types/media/description.tex}
> >
> >  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >
> > diff --git a/device-types/media/description.tex b/device-types/media/de=
scription.tex
> > new file mode 100644
> > index 0000000..887eacf
> > --- /dev/null
> > +++ b/device-types/media/description.tex
> > @@ -0,0 +1,578 @@
> > +\section{Media Device}\label{sec:Device Types / Media Device}
> > +
> > +The virtio media device follow the same model (and structures) as V4L2=
. It
> > +can be used to virtualize cameras, codec devices, or any other device
> > +supported by V4L2. The device assumes 64-bit little-endian V4L2 struct=
ures
> > +are exchanged. The complete definition of V4L2 structures and ioctls c=
an
> > +be found under the
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index=
.html}{V4L2 UAPI documentation}.
> > +
> > +V4L2 is a UAPI that allows a less privileged entity (user-space) to us=
e video
> > +hardware exposed by a more privileged entity (the kernel). Virtio-medi=
a is an
> > +encapsulation of this API into virtio, turning it into a virtualizatio=
n API
> > +for all classes of video devices supported by V4L2, where the device p=
lays the
> > +role of the kernel and the driver the role of user-space.
> > +
> > +The device is therefore responsible for presenting a virtual device th=
at behaves
> > +like an actual V4L2 device, which the driver can control.
> > +
> > +Note that virtio-media does not require the use of a V4L2 device drive=
r or of
> > +Linux on any side - V4L2 is only used as a transport protocol,
> > +and both sides are free to convert it from/to any model that they wish=
 to use.
> > +
> > +This section relies on definitions from
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index=
.html}{V4L2 UAPI documentation}.
> > +
> > +\subsection{Device ID}\label{sec:Device Types / Media Device / Device =
ID}
> > +
> > +42
> > +
> > +\subsection{Virtqueues}\label{sec:Device Types / Media Device / Virtqu=
eues}
> > +
> > +\begin{description}
> > +\item[0] commandq - used for driver commands and device responses to t=
hese
> > +commands.
> > +\item[1] eventq - used for events sent by the device to the driver.
> > +\end{description}
> > +
> > +\devicenormative{\subsubsection}{Virtqueues}{Device Types / Media Devi=
ce / Virtqueues}
> > +
> > +The device MUST return the descriptor chains it receives on the comman=
dq as
> > +soon as possible, and must never hold them for indefinite periods of t=
ime.
> > +
> > +\drivernormative{\subsubsection}{Virtqueues}{Device Types / Media Devi=
ce / Virtqueues}
> > +
> > +The driver MUST re-queue the descriptor chains returned by the device =
on the
> > +eventq as soon as possible, and must never hold them for indefinite pe=
riods
> > +of time.
> > +
> > +\subsection{Feature Bits}\label{sec:Device Types / Media Device / Feat=
ure Bits}
> > +
> > +None
> > +
> > +\subsection{Device Configuration Layout}\label{sec:Device Types / Medi=
a Device / Device Configuration Layout}
> > +
> > +The video device configuration space uses the following layout:
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_config {
> > +    le32 device_caps;
> > +    le32 device_type;
> > +    u8 card[32];
>
> Use char instead of u8. It's always been a pain that struct v4l2_capabili=
ty
> used u8 instead of char for the character arrays. I never understood why,=
 and
> if you are making a new struct I would recommend using char.
>
> Up to you, though.
>
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{device_caps}] (driver-read-only) flags representing the d=
evice
> > +capabilities as used in
> > +\href{https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-query=
cap.html#c.v4l2_capability}{struct v4l2_capabilities}.
> > +Corresponds with the \field{device_caps} field in the \textit{struct v=
ideo_device}.
> > +\item[\field{device_type}] (driver-read-only) informs the driver of th=
e type
> > +of the video device. Corresponds with the \field{vfl_devnode_type} fie=
ld of the device.
> > +\item[\field{card}] (driver-read-only) name of the device, a NUL-termi=
nated
> > +UTF-8 string. Corresponds with the \field{card} field of the \textit{s=
truct v4l2_capability}.
> > +If all the characters of the field are used, it does not need to be NU=
L-terminated.
> > +\end{description}
> > +
> > +\subsection{Device Initialization}
> > +
> > +\begin{enumerate}
> > +\item The driver reads the \field{device_caps} and \field{device_type}=
 fields
> > +from the configuration layout to identify the device.
> > +\item The driver sets up the \field{commandq} and \field{eventq}.
> > +\item The driver may open a session to use the device and send V4L2 io=
ctls in
> > +order to receive more information about the device, such as supported
> > +formats or controls.
> > +\end{enumerate}
> > +
> > +\subsection{Device Operation}\label{sec:Device Types / Media Device / =
Device Operation}
> > +
> > +Commands are queued on the command queue by the driver for the device =
to
> > +process. The errors returned by each command are standard
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen-e=
rrors.html}{Linux kernel error codes}.
> > +For instance, a command that contains invalid options will return \tex=
tit{EINVAL}.
> > +
> > +Events are sent on the event queue by the device for the driver to han=
dle.
> > +
> > +\subsubsection{Command Virtqueue}
> > +
> > +\paragraph{Device Operation: Command headers}
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_MEDIA_CMD_OPEN 1
> > +#define VIRTIO_MEDIA_CMD_CLOSE 2
> > +#define VIRTIO_MEDIA_CMD_IOCTL 3
> > +#define VIRTIO_MEDIA_CMD_MMAP 4
> > +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> > +
> > +/* Header for all virtio commands from the driver to the device on the=
 commandq. */
> > +struct virtio_media_cmd_header {
> > +     u32 cmd;
> > +     u32 __padding;
> > +};
> > +
> > +/* Header for all virtio responses from the device to the driver on th=
e commandq. */
> > +struct virtio_media_resp_header {
> > +     u32 status;
> > +     u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
> > +A command consists of a command header \textit{virtio_media_cmd_header=
}
> > +containing the following device-readable field:
> > +
> > +\begin{description}
> > +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD_*=
).
> > +\end{description}
> > +
> > +A response consists of a response header \textit{virtio_media_resp_hea=
der}
> > +containing the following device-writable field:
> > +
> > +\begin{description}
> > +\item[\field{status}] indicates a device request status.
> > +\end{description}
> > +
> > +The status field can take 0 if the command was successful, or one of t=
he
> > +standard Linux error codes if it was not.
> > +
> > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Sess=
ions}{Device Types / Media Device / Device Operation / Command Virtqueue}
> > +
> > +Sessions are how the device is multiplexed, allowing several distinct =
works to
> > +take place simultaneously. The driver needs to open a session before i=
t can
> > +perform any useful operation on the device.
> > +
> > +\paragraph{Device Operation: Open device}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.
> > +
> > +This is the equivalent of calling \textit{open} on a V4L2 device node.
> > +The driver uses \textit{virtio_media_cmd_open} to send an open request=
.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_open {
> > +    struct virtio_media_cmd_header hdr;
> > +};
> > +\end{lstlisting}
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \textit{vir=
tio_media_resp_open}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_open {
> > +    struct virtio_media_resp_header hdr;
> > +    u32 session_id;
> > +    u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] specifies an identifier for the current sess=
ion. The
> > +identifier can be used to perform other commands on the session, notab=
ly ioctls.
> > +\end{description}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Open device}{Device =
Types / Media Device / Device Operation / Open device}
> > +
> > +Upon success, the device MUST set a \field{session_id} in \textit{virt=
io_media_resp_open}
> > +to an integer that is NOT used by any other open session.
> > +
> > +\paragraph{Device Operation: Close device}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active session.
> > +
> > +This is the equivalent of calling \textit{close} on a previously opene=
d V4L2
> > +device node. All resources associated with this session will be freed.
> > +
> > +This command does not require a response from the device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_close {
> > +    struct virtio_media_cmd_header hdr;
> > +    u32 session_id;
> > +    u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] specifies an identifier for the session to c=
lose.
> > +\end{description}
> > +
> > +\drivernormative{\subparagraph}{Device Operation: Close device}{Device=
 Types / Media Device / Device Operation / Close device}
> > +
> > +The session ID SHALL NOT be used again after queueing this command.
> > +
> > +\paragraph{Device Operation: V4L2 ioctls}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an o=
pen
> > +session.
> > +
> > +This command asks the device to run one of the `VIDIOC_*` ioctls on th=
e active
> > +session.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_ioctl {
> > +    struct virtio_media_cmd_header hdr;
> > +    u32 session_id;
> > +    u32 code;
> > +    /* Followed by the relevant ioctl payload as defined in the macro =
*/
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] specifies an identifier of thesession to run=
 the ioctl on.
> > +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl t=
o run.
> > +\end{description}
> > +
> > +The code is extracted from the
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/v=
ideodev.html}{videodev2.h},
> > +header file. The file defines the ioctl's codes, type of payload, and
> > +direction. The code consists of the second argument of the \field{_IO*=
} macro.
> > +
> > +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> > +
> > +\begin{lstlisting}
> > +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> > +\end{lstlisting}
> > +
> > +This means that its ioctl code is \textit{4}, that its payload is a
> > +\textit{struct v4l2_format}, and that its direction is \textit{WR} (i.=
e., the
> > +payload is written by both the driver and the device).
> > +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctl=
s payload}
> > +for more information about the direction of ioctls.
> > +
> > +The payload layout is always a 64-bit representation of the correspond=
ing
> > +V4L2 structure.
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{vi=
rtio_media_resp_ioctl}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_ioctl {
> > +    struct virtio_media_resp_header hdr;
> > +    /* Followed by the ioctl payload as defined in the macro */
> > +};
> > +\end{lstlisting}
> > +
> > +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device / =
V4L2 ioctls / Ioctls payload}
> > +
> > +Each ioctl has a payload, which is defined by the third argument of th=
e
> > +\field{_IO*} macro defining it.
> > +
> > +The payload of an ioctl in the descriptor chain follows the command st=
ructure,
> > +the reponse structure, or both depending on the direction:
> > +
> > +\begin{itemize}
> > +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> > +follows the response in the device-writable section of the descriptor =
chain.
> > +\item \textbf{_IOW} is read-only for the device, meaning the payload
> > +follows the command in the driver-writable section of the descriptor c=
hain.
> > +\item \textbf{_IOWR} is writable by both the device and driver,
> > +meaning the payload must follow both the command in the driver-writabl=
e section
> > +of the descriptor chain, and the response in the device-writable secti=
on.
> > +\end{itemize}
> > +
> > +A common optimization for \textit{WR} ioctls is to provide the payload=
 using
> > +descriptors that both point to the same buffer. This mimics the behavi=
or of
> > +V4L2 ioctls where the data is only passed once and used as both input =
and
> > +output by the kernel.
> > +
> > +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device =
Types / Media Device / Device Operation / V4L2 ioctls}
> > +
> > +In case of success of a device-writable ioctl, the device MUST always =
write the
> > +payload in the device-writable part of the descriptor chain.
> > +
> > +In case of failure of a device-writable ioctl, the device is free to w=
rite the
> > +payload in the device-writable part of the descriptor chain or not. So=
me errors
> > +may still result in the payload being updated, and in this case the de=
vice is
> > +expected to write the updated payload. If the device has not written t=
he
> > +payload after an error, the driver MUST assume that the payload has no=
t been
> > +modified.
> > +
> > +\subparagraph{Handling of pointers in ioctl payload}
> > +
> > +A few structures used as ioctl payloads contain pointers to further
> > +data needed for the ioctl. There are notably:
> > +
> > +\begin{itemize}
> > +\item The \field{planes} pointer of
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/b=
uffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> > +which size is determined by the length member.
> > +\item The \field{controls} pointer of \textit{struct v4l2_ext_controls=
}, which
> > +size is determined by the count member.
> > +\end{itemize}
> > +
> > +If the size of the pointed area is determined to be non-zero, then the=
 main
> > +payload is immediately followed by the pointed data in their order of
> > +appearance in the structure, and the pointer value itself is ignored b=
y the
> > +device, which must also return the value initially passed by the drive=
r.
> > +
> > +\subparagraph{Handling of pointers to userspace memory}
> > +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace memor=
y}
> > +
> > +A few pointers are special in that they point to userspace memory in t=
he
> > +original V4L2 specification. They are:
> > +
> > +\begin{itemize}
> > +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} and
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/b=
uffer.html#struct-v4l2-plane}{struct v4l2_plane}
> > +(technically an unsigned long, but designated a userspace address).
> > +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> > +\end{itemize}
> > +
> > +These pointers can cover large areas of scattered memory, which has th=
e
>
> Actually, only m.userptr can cover a large area. The other two are limite=
d.
> See my comment about USERPTR support below.
>
> > +potential to require more descriptors than the virtio queue can provid=
e. For
> > +these particular pointers only, a list of \textit{struct virtio_media_=
sg_entry}
> > +that covers the needed amount of memory for the pointer is used instea=
d of
> > +using descriptors to map the pointed memory directly.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_sg_entry {
> > +     u64 start;
> > +     u32 len;
> > +     u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
> > +For each such pointer to read, the device reads as many SG entries as =
needed
> > +to cover the length of the pointed buffer, as described by its parent
> > +structure (\field{length} member of \textit{struct v4l2_buffer} or
> > +\textit{struct v4l2_plane} for buffer memory, and \field{size} member =
of
> > +\textit{struct v4l2_ext_control} for control data).
> > +
> > +Since the device never needs to modify the list of SG entries, it is o=
nly
> > +provided by the driver in the device-readable section of the descripto=
r chain,
> > +and not repeated in the device-writable section, even for WR ioctls.
> > +
> > +\subparagraph{Unsupported ioctls}
> > +
> > +A few ioctls are replaced by other, more suitable mechanisms.
> > +
> > +\begin{itemize}
> > +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configuratio=
n area
> > +(see \ref{sec:Device Types / Media Device / Device Configuration Layou=
t}).
> > +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
> > +(see \ref{sec:Device Types / Media Device / Device Operation / Dequeue=
 buffer}).
> > +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
> > +(see \ref{sec:Device Types / Media Device / Device Operation / Emit an=
 event}).
> > +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are de=
precated
> > +and replaced by the controls of the JPEG class.
> > +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shall =
not be
> > +implemented by the device.
> > +\end{itemize}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Unsupported ioctls}{=
Device Types / Media Device / Device Operation / Unsupported ioctls}
> > +
> > +If being requested an unsupported ioctl, the device MUST return the sa=
me
> > +error response as it would for an unknown ioctl, i.e. \textit{ENOTTY}.
> > +
> > +\paragraph{Device Operation: Mapping a MMAP buffer}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer into =
the
> > +driver's address space.
> > +
> > +Shared memory region ID 0 is used to map MMAP buffers with
> > +the \textit{VIRTIO_MEDIA_CMD_MMAP} command.
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
> > +
> > +struct virtio_media_cmd_mmap {
> > +     struct virtio_media_cmd_header hdr;
> > +     u32 session_id;
> > +     u32 flags;
> > +     u64 offset;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{flags}] is the set of flags for the mapping. \field{VIRTI=
O_MEDIA_MMAP_FLAG_RW}
> > +can be set if a read-write mapping is desired. Without this flag the m=
apping
> > +will be read-only.
> > +\item[\field{offset}] corresponds to the \field{mem_offset} field of t=
he
> > +\textit{union v4l2_plane} for the plane to map. This field can be obta=
ined
> > +using the \textit{VIDIOC_QUERYBUF} ioctl.
> > +\end{description}
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \textit{vir=
tio_media_resp_mmap}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_mmap {
> > +    struct virtio_media_resp_header hdr;
> > +    u64 offset;
> > +    u64 len;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{offset}] offset into SHM region ID 0 of the start of the =
mapping.
> > +\item[\field{len}] length of the mapping as indicated by the \textit{s=
truct v4l2_plane}
> > +the buffer belongs to.
> > +\end{description}
> > +
> > +\paragraph{Device Operation: Unmapping a MMAP buffer}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously mapped=
 using \field{VIRTIO_MEDIA_CMD_MMAP}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_munmap {
> > +    struct virtio_media_cmd_header hdr;
> > +    u64 offset;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{offset}] offset into SHM region ID 0 previously returned =
by
> > +\textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been previously=
 mapped.
> > +\end{description}
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with \textit{v=
irtio_media_resp_munmap}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_munmap {
> > +    struct virtio_media_resp_header hdr;
> > +};
> > +\end{lstlisting}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP buf=
fer}{Device Types / Media Device / Device Operation / Unmapping a MMAP buff=
er}
> > +
> > +The device MUST keep mappings performed using \textit{VIRTIO_MEDIA_CMD=
_MMAP}
> > +valid until \textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the bu=
ffers or
> > +session they belong to are released or closed by the driver.
> > +
> > +\paragraph{Device Operation: Memory Types}
> > +
> > +The semantics of the three V4L2 memory types (\textit{MMAP}, \textit{U=
SERPTR}
> > +and \textit{DMABUF}) can easily be mapped to both driver and device co=
ntext.
> > +
> > +\subparagraph{MMAP}
> > +
> > +In virtio-media, \textit{MMAP} buffers are provisioned by the device, =
just like
> > +they are by the kernel in regular V4L2. Similarly to how userspace can=
 map a
> > +\textit{MMAP} buffer into its address space using mmap and munmap, the
> > +virtio-media driver can map device buffers into the driver space by qu=
eueing the
> > +\textit{struct virtio_media_cmd_mmap} and \textit{struct virtio_media_=
cmd_munmap}
> > +commands to the commandq.
> > +
> > +\subparagraph{USERPTR}
> > +
> > +In virtio-media, \textit{USERPTR} buffers are provisioned by the drive=
r, just
> > +like they are by userspace in regular V4L2. Instances of \textit{struc=
t v4l2_buffer}
> > +and \textit{struct v4l2_plane} of this type are followed by a list of
> > +\textit{struct virtio_media_sg_entry}. For more information, see
> > +\ref{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
> > +
> > +The device must not alter the pointer values provided by the driver, i=
.e.
> > +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
> > +\textit{struct v4l2_plane} must be returned to the driver with the sam=
e value
> > +as it was provided.
>
> I very, very strongly recommend that you drop USERPTR support for virtio.
> MMAP and DMABUF are sufficient.
>
> It's a pain to support, and we discourage it for new drivers.
>
> If memory serves, there is at least one chromeos driver that is stuck to
> USERPTR support for some reason (I can't remember the details), and that =
is
> (I think) the only reason USERPTR support is part of virtio. But that is
> really a chromeos issue that they need to fix, IMHO.

I am wondering if the concerns about USERPTR should apply to the
host/guest context.

In virtio-media, the USERPTR memory type just means that the buffer
memory has been allocated by the guest and the addresses passed are
guest physical addresses. It doesn't necessarily mean that the memory
has been allocated with the USERPTR type by the guest user-space.

For instance, say the guest user-space allocated memory using memfd,
and is passing the FDs to the guest driver as DMABUF buffers. From the
guest kernel point of view, these buffers will still resolve into
guest physical memory, so the USERPTR memory type will be used by
guest/host communication to indicate that fact. I don't know of any
formal way to resolve guest DMABUFs into proper virtio resources
unfortunately.

Without the ability to communicate buffers as guest physical memory,
the only kinds of DMABUFs supported by the guest driver would be those
coming from another virtio driver, like virtio-gpu. Granted, in
practice that's probably where these will come from anyway, but I
think it would be nice to be able to support memfd, at least for
testing purposes.

But to answer what I think your concern is, if you prefer that the
guest driver does not advertise support for USERPTR memory type to the
guest userspace, we can certainly enforce that (either absolutely or
through an option).

Cheers,
Alex.

>
> Regards,
>
>         Hans
>
> > +
> > +\subparagraph{DMABUF}
> > +
> > +In virtio-media, \textit{DMABUF} buffers are provisioned by a virtio o=
bject,
> > +just like they are by a \textit{DMABUF} in regular V4L2. Virtio object=
s are
> > +16-bytes UUIDs and do not fit in the placeholders for file descriptors=
, so
> > +they follow their embedding data structure as needed and the device mu=
st
> > +leave the V4L2 structure placeholder unchanged.
> > +
> > +Contrary to \textit{USERPTR} buffers, virtio objects UUIDs need to be =
added in
> > +both the device-readable and device-writable section of the descriptor=
 chain.
> > +
> > +Device-allocated buffers with the \textit{V4L2_MEMORY_MMAP} memory typ=
e can also
> > +be exported as virtio objects for use with another virtio device using=
 the
> > +\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of \textit{v4l2_expor=
tbuffer}
> > +means that space for the UUID needs to be reserved right after that st=
ructure
> > +
> > +\subsubsection{Event Virtqueue}
> > +
> > +Events are a way for the device to inform the driver about asynchronou=
s events
> > +that it should know about. In virtio-media, they are used as a replace=
ment for
> > +the \textit{VIDIOC_DQBUF} and \textit{VIDIOC_DQEVENT} ioctls and the p=
olling
> > +mechanism, which would be impractical to implement on top of virtio.
> > +
> > +\paragraph{Device Operation: Event header}
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > +#define VIRTIO_MEDIA_EVT_EVENT 2
> > +
> > +/* Header for events queued by the device for the driver on the eventq=
. */
> > +struct virtio_media_event_header {
> > +    u32 event;
> > +    u32 session_id;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{event}] one of \field{VIRTIO_MEDIA_EVT_*}.
> > +\item[\field{session_id}] ID of the session the event applies to.
> > +\end{description}
> > +
> > +\paragraph{Device Operation: Device-side error}
> > +
> > +\textbf{VIRTIO_MEDIA_EVT_ERROR} Upon receiving this event, the session
> > +mentioned in the header is considered corrupted and automatically clos=
ed by
> > +the device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_event_error {
> > +    struct virtio_media_event_header hdr;
> > +    u32 errno;
> > +    u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{errno}] error code describing the kind of error that occu=
rred.
> > +\end{description}
> > +
> > +\paragraph{Device Operation: Dequeue buffer}
> > +\label{sec:Device Types / Media Device / Device Operation / Dequeue bu=
ffer}
> > +
> > +\textbf{VIRTIO_MEDIA_EVT_DQBUF} Signals that a buffer is not being use=
d anymore
> > +by the device and is returned to the driver.
> > +
> > +A \textit{struct virtio_media_event_dqbuf} event is queued on the even=
tq by the
> > +device every time a buffer previously queued using the \textit{VIDIOC_=
QBUF}
> > +ioctl is done being processed and can be used by the driver again. Thi=
s is like
> > +an implicit \textit{VIDIOC_DQBUF} ioctl.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_event_dqbuf {
> > +    struct virtio_media_event_header hdr;
> > +    struct v4l2_buffer buffer;
> > +    struct v4l2_plane planes[VIDEO_MAX_PLANES];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{buffer}] \textit{struct v4l2_buffer} describing the buffe=
r that has been dequeued.
> > +\item[\field{planes}] array of \textit{struct v4l2_plane} containing t=
he plane information for multi-planar buffers.
> > +\end{description}
> > +
> > +Pointer values in the \textit{struct v4l2_buffer} and \textit{struct v=
4l2_plane}
> > +are meaningless and must be ignored by the driver. It is recommended t=
hat the
> > +device sets them to NULL in order to avoid leaking potential device ad=
dresses.
> > +
> > +Note that in the case of a \field{USERPTR} buffer, the \textit{struct =
v4l2_buffer}
> > +used as event payload is not followed by the buffer memory: since that=
 memory
> > +is the same that the driver submitted with the \textit{VIDIOC_QBUF}, i=
t would
> > +be redundant to have it here.
> > +
> > +\paragraph{Device Operation: Emit an event}
> > +\label{sec:Device Types / Media Device / Device Operation / Emit an ev=
ent}
> > +
> > +\textbf{VIRTIO_MEDIA_EVT_EVENT} Signals that a V4L2 event has been emi=
tted for a session.
> > +
> > +A \textit{struct virtio_media_event_event} event is queued on the even=
tq by the
> > +device every time an event the driver previously subscribed to using t=
he
> > +\textit{VIDIOC_SUBSCRIBE_EVENT} ioctl has been signaled. This is like =
an
> > +implicit \textit{VIDIOC_DQEVENT} ioctl.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_event_event {
> > +    struct virtio_media_event_header hdr;
> > +    struct v4l2_event event;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{event}] \textit{struct v4l2_event} describing the event t=
hat occurred.
> > +\end{description}
> > diff --git a/device-types/media/device-conformance.tex b/device-types/m=
edia/device-conformance.tex
> > new file mode 100644
> > index 0000000..3338822
> > --- /dev/null
> > +++ b/device-types/media/device-conformance.tex
> > @@ -0,0 +1,11 @@
> > +\conformance{\subsection}{Media Device Conformance}\label{sec:Conforma=
nce / Device Conformance / Media Device Conformance}
> > +
> > +A Media device MUST conform to the following normative statements:
> > +
> > +\begin{itemize}
> > +\item \ref{devicenormative:Device Types / Media Device / Virtqueues}
> > +\item \ref{devicenormative:Device Types / Media Device / Device Operat=
ion / Open device}
> > +\item \ref{devicenormative:Device Types / Media Device / Device Operat=
ion / V4L2 ioctls}
> > +\item \ref{devicenormative:Device Types / Media Device / Device Operat=
ion / Unsupported ioctls}
> > +\item \ref{devicenormative:Device Types / Media Device / Device Operat=
ion / Unmapping a MMAP buffer}
> > +\end{itemize}
> > \ No newline at end of file
> > diff --git a/device-types/media/driver-conformance.tex b/device-types/m=
edia/driver-conformance.tex
> > new file mode 100644
> > index 0000000..058b812
> > --- /dev/null
> > +++ b/device-types/media/driver-conformance.tex
> > @@ -0,0 +1,9 @@
> > +\conformance{\subsection}{Media Device Conformance}\label{sec:Conforma=
nce / Driver Conformance / Media Driver Conformance}
> > +
> > +A Media device MUST conform to the following normative statements:
> > +
> > +\begin{itemize}
> > +\item \ref{drivernormative:Device Types / Media Device / Virtqueues}
> > +\item \ref{drivernormative:Device Types / Media Device / Device Operat=
ion / Command Virtqueue}
> > +\item \ref{drivernormative:Device Types / Media Device / Device Operat=
ion / Close device}
> > +\end{itemize}
> > \ No newline at end of file
>

