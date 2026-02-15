Return-Path: <linux-media+bounces-52829-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALBeI07ikWkxngEAu9opvQ
	(envelope-from <linux-media+bounces-52829-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 16:12:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F343513F002
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 16:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD13E30078E0
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5464260566;
	Sun, 15 Feb 2026 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bNRq6lCE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k0rF6Z7X"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243C01624C5
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168290; cv=none; b=pok22MZI3yQKis7c4GTHbY0Np5+4U15dSvjax9Ir19yIqp0pbjuWRLuXIj6AaDCd/2PqPDVS0o9Ft33mSFMzqak8v3SlCOVD4fvMEXZnI76gEIYO4Zx00oM5enMh5DJ7ozMiF4lyUvO1sqgTp7zzy/cC2k57U/4BFo/4xVxXonU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168290; c=relaxed/simple;
	bh=W2C54+4OxZAL4/sra4+fk5bBOfThcUp+Ug2hjuHm7ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIRVaGtJrX4FuOGdmrIWAy7sttCcSOXGWLq9mEcb31hZ678JeaYBORZXIOZFCC+Yi5KtIin8kz4d8kavugoQVUxxuzeUklkBaHEaseM+pd4eaaD8buOaif7yu6MrP4l0pgqJmBQkRiXyr2uGXcZX1rgsvm5Jn/LyrDR2kZOfhaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bNRq6lCE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k0rF6Z7X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771168287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzLiTMJkR5ZX4OJT/Zs6Qvq/LNL+wmcr6VfSBev3mvI=;
	b=bNRq6lCEPu1fCv4obO7lb9/KLKmTgOMk1H8/KNSDs6LpkraOkPWubQngVTI1x7wn8OMmdC
	h4LnZRElyTN4uR5x5mA+qoH+ftnw2E1CHBFAfyY8pvTkevwSae/n7PJfcpRpUhUk81C8E3
	jQb5XV/RQsxVdQkiYGskb4IzsxOAbTU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-CNeBcV1oPf26v82W_yBrlw-1; Sun, 15 Feb 2026 10:11:25 -0500
X-MC-Unique: CNeBcV1oPf26v82W_yBrlw-1
X-Mimecast-MFC-AGG-ID: CNeBcV1oPf26v82W_yBrlw_1771168285
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4362197d1easo1891118f8f.2
        for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 07:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771168285; x=1771773085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzLiTMJkR5ZX4OJT/Zs6Qvq/LNL+wmcr6VfSBev3mvI=;
        b=k0rF6Z7XU9Ko270Y+3G+9IMFnnlpieElp+V+hlF48bM2nhEDzhaUGj+BFkSscnLfRi
         2+1xr74vem0+v6jU4p+DcZdjYyPtQ8Py8stOR12qbY87FvqPBInFlSCUnwIqN+5s7cLa
         d6TPNMeGKE9ntrJl0EW+lIUkDw8LK4yDSHyBVJvFiS4KB3l1ve4zUl8hgV37RKOEbAkF
         xGFESqrOwE1/aMWDojkbftjsOMDfK6AfhDAmyqGbYxCmrvawIc+9RyQmgoc/yDIMQa2L
         pgXRitOhd4UtGHFH3DHwbXk3n/x9idLAiDy9AgA4NNZh2QSH8Nem5svxKtXdTwkY2kDe
         /1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771168285; x=1771773085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzLiTMJkR5ZX4OJT/Zs6Qvq/LNL+wmcr6VfSBev3mvI=;
        b=UtIB+mQykIKbZasBzphh+B/iV1qcpcr4yiUz2ndg4McSbnnPd4TZgmaIdwZzO2gkm6
         7ZmsT+n61kpSO40i3ks6kjGt0HrQoRi2dkwA0scHb25xIQzTHrJJFqnN2kr4YYEmVpA/
         SkoDGGyMA0cd6pvXie1RJ+Yym8IRP6n6/RJTXiadN2wgL7W2Pax05bw0DKQVVjyzjJc1
         gYw/K2r0akZjPUozF2KpiNT3pmO1hkh1soLIK+g7xINFQWkdh2y6IKy/UetBqb56lwKK
         adMBmHzhCGw+ZSQcQh4H9f5fjxe8HZ6bJpcycnITd//Mtvlm95W6w4comMRngTHTvrdk
         MIAg==
X-Forwarded-Encrypted: i=1; AJvYcCUv02XXNbZ38Y4k4q6yzyUOogUAQFE7ksgGL5XE9mLDTEGmBz32GXQ/qxa/SJdO4ChZBZ5ZmNw2BRD0QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyB2gtFAA1zpbD/sqkvotUK7QdhbBy4GCxNucoApbi+OoFkwaT
	pVWHi97OrWDzPdhECf+RlITltMZV9RaOGPyI7pxJ+iS0Gd6y/vs4KP30NuAcc6+Y75Y6dMpPROJ
	XZ6cGJLHcr5qPmlfnUct4xx0G5dx5b/f5gh14mqfRJvH2Kj+C/dhsv6i3czeHWFCV
X-Gm-Gg: AZuq6aKzp44XriJrJXjVY8DFp3dm0rPJcL1ggOG8b+1rU04ovqTwDK5+T3TqK3kEWZR
	GHcTxymmiGjhrrXg1uTQGpgaBBqMQorOR7pYdH0vUVi4p6i7lZqcPz7pi2e/Yr/kKeI1PpnZaQv
	fOKIAjK+EKM/bhONFNqFtbY6GkZAEdE5Pc4/Uw0zKOyhExV2J3onb38C22/R9ZyXnykOErOCksm
	wumGlAf55PMjr5dGp2tDLVi/0chZfH8bJdL+pICANe+julK5ZmLvpu3u1WuoYVHAYyVHTN/8QSc
	YWQa3+uWhoMF4iiqvWAPcpObLqGPZuaYLG0ZaRRYehEs+64xXQQl/CwNrfI8WeKfEOkpmO22Fh/
	zKGea0oxpV2Q+7njU08cZr9CmNj4pyHpRsjxyMEFhyMnrNQ==
X-Received: by 2002:a5d:5f47:0:b0:435:96b7:e0db with SMTP id ffacd0b85a97d-437978d195bmr14661961f8f.17.1771168284460;
        Sun, 15 Feb 2026 07:11:24 -0800 (PST)
X-Received: by 2002:a5d:5f47:0:b0:435:96b7:e0db with SMTP id ffacd0b85a97d-437978d195bmr14661736f8f.17.1771168282164;
        Sun, 15 Feb 2026 07:11:22 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a5e5sm19411062f8f.9.2026.02.15.07.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 07:11:21 -0800 (PST)
Date: Sun, 15 Feb 2026 10:11:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Albert Esteve <aesteve@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Enric Balletbo i Serra <eballetb@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Matti Moell <matti@qti.qualcomm.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v10 1/1] virtio-video: Add virtio video device
 specification
Message-ID: <20260215095955-mutt-send-email-mst@kernel.org>
References: <20260213085306.313348-1-alexander.gordeev@oss.qualcomm.com>
 <20260213085306.313348-2-alexander.gordeev@oss.qualcomm.com>
 <SJ0PR12MB680603C30AB26E93ECB27E2FDC6FA@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR12MB680603C30AB26E93ECB27E2FDC6FA@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52829-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lists.linux.dev,redhat.com,linaro.org,collabora.com,ideasonboard.com,gmail.com,quicinc.com,qti.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mst@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,opensynergy.com:email]
X-Rspamd-Queue-Id: F343513F002
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 10:49:22AM +0000, Parav Pandit wrote:
> 
> > From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
> > Sent: 13 February 2026 02:23 PM
> > 
> > From: Alexander Gordeev <Alexander.Gordeev@opensynergy.com>
> > 
> > Add the specification of the video decoder and encoder device, which
> > can be used to provide host-accelerated video operations to the guest.
> > 
> > Signed-off-by: Alexander Gordeev <alexander.gordeev@opensynergy.com>
> > ---
> >  conformance.tex                           |   12 +-
> >  content.tex                               |    1 +
> >  device-types/video/description.tex        | 1592 +++++++++++++++++++++
> >  device-types/video/device-conformance.tex |   22 +
> >  device-types/video/driver-conformance.tex |   20 +
> >  introduction.tex                          |   21 +
> >  6 files changed, 1664 insertions(+), 4 deletions(-)
> >  create mode 100644 device-types/video/description.tex
> >  create mode 100644 device-types/video/device-conformance.tex
> >  create mode 100644 device-types/video/driver-conformance.tex
> > 
> > diff --git a/conformance.tex b/conformance.tex
> > index 9af31e2..f34e600 100644
> > --- a/conformance.tex
> > +++ b/conformance.tex
> > @@ -37,8 +37,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >  \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
> >  \ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
> >  \ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conformance},
> > -\ref{sec:Conformance / Driver Conformance / Media Driver Conformance} or
> > -\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance}.
> > +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance},
> > +\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance} or
> > +\ref{sec:Conformance / Driver Conformance / Video Driver Conformance}.
> > 
> >      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
> >    \end{itemize}
> > @@ -68,8 +69,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >  \ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
> >  \ref{sec:Conformance / Device Conformance / CAN Device Conformance},
> >  \ref{sec:Conformance / Device Conformance / SPI Controller Device Conformance},
> > -\ref{sec:Conformance / Device Conformance / Media Device Conformance} or
> > -\ref{sec:Conformance / Device Conformance / RTC Device Conformance}.
> > +\ref{sec:Conformance / Device Conformance / Media Device Conformance},
> > +\ref{sec:Conformance / Device Conformance / RTC Device Conformance} or
> > +\ref{sec:Conformance / Device Conformance / Video Device Conformance}.
> > 
> >      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
> >    \end{itemize}
> > @@ -170,6 +172,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >  \input{device-types/spi/driver-conformance.tex}
> >  \input{device-types/media/driver-conformance.tex}
> >  \input{device-types/rtc/driver-conformance.tex}
> > +\input{device-types/video/driver-conformance.tex}
> > 
> >  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
> > 
> > @@ -264,6 +267,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >  \input{device-types/spi/device-conformance.tex}
> >  \input{device-types/media/device-conformance.tex}
> >  \input{device-types/rtc/device-conformance.tex}
> > +\input{device-types/video/device-conformance.tex}
> > 
> >  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy
> > Interface: Transitional Device and Transitional Driver Conformance}
> >  A conformant implementation MUST be either transitional or
> > diff --git a/content.tex b/content.tex
> > index 5de811f..0c13f68 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -835,6 +835,7 @@ \chapter{Device Types}\label{sec:Device Types}
> >  \input{device-types/spi/description.tex}
> >  \input{device-types/media/description.tex}
> >  \input{device-types/rtc/description.tex}
> > +\input{device-types/video/description.tex}
> > 
> >  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > 
> > diff --git a/device-types/video/description.tex b/device-types/video/description.tex
> > new file mode 100644
> > index 0000000..8945e26
> > --- /dev/null
> > +++ b/device-types/video/description.tex
> > @@ -0,0 +1,1592 @@
> > +\section{Video Device}
> > +\label{sec:Device Types / Video Device}
> > +
> > +The virtio video device provides support for host-accelerated video encoding
> > +and decoding.
> > +
> > +\subsection{Device ID}
> > +\label{sec:Device Types / Video Device / Device ID}
> > +
> > +50
> > +
> > +\subsection{Virtqueues}
> > +\label{sec:Device Types / Video Device / Virtqueues}
> > +
> > +\begin{description}
> > +      \item[0]
> > +            commandq - driver commands
> > +      \item[1]
> > +            eventq - device async responses to commands and standalone device events
> > +\end{description}
> > +
> > +\subsection{Feature bits}
> > +\label{sec:Device Types / Video Device / Feature bits}
> > +
> > +\begin{description}
> > +      \item[VIRTIO_VIDEO_F_ENCODER (0)]
> > +            The device can encode video.
> > +      \item[VIRTIO_VIDEO_F_DECODER (1)]
> > +            The device can decode video.
> > +            % Use-case: the device can support both encoding and decoding, so having both
> > +            % here can save resources.
> > +      \item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (2)]
> > +            Guest pages can be used as the backing memory of resources.
> > +      \item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (3)]
> > +            The device can use non-contiguous guest memory as the backing memory of
> > +            resources. Only meaningful if VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES is also
> > +            set.
> > +      \item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (4)]
> > +            Objects exported by another virtio device can be used as the backing memory
> > +            of resources.
> > +      \item[VIRTIO_VIDEO_F_V4L2_COMPATIBLE_LAST_BUFFER (5)]
> > +            The device releases an extra empty output buffer after a drain or DPC so that
> > +            the driver can send a buffer with V4L2_BUF_FLAG_LAST set in the V4L2 way.
> This does not seem relavant to the video device.
> It should not be attached to any V4L2 implementation.
> Can you please craft it differently?

My understanding is that this is a V4L2 device just like virtio input makes
the linux input layer into a device.


> > +\end{description}
> > +
> > +\devicenormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
> > +
> > +The device MUST set at least one of VIRTIO_VIDEO_F_ENCODER or VIRTIO_VIDEO_F_DECODER.
> > +
> > +The device MUST set at least one of VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES or
> > +VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT, since the absence of both bits would
> > +mean that no memory can be used at all for resources.
> > +
> > +The device MUST NOT set VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG unless it also sets
> > +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES.
> > +
> > +\drivernormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
> > +
> > +The driver MUST negotiate at least one of the VIRTIO_VIDEO_F_ENCODER and
> > +VIRTIO_VIDEO_F_DECODER features.
> > +
> > +The driver MUST negotiate at least one of the
> > +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES and VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT
> > +features.
> > +
> You wouldn't need virtio_object feature bit. It should be covered using the capability.

To be frank I'm pretty split on this. Capabilities make sense
if there are envisioned to be lots of these.
I'll let the contributor decide if that is the case.


> > +If VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES has been negotiated, but not
> > +VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG, the driver MUST use physically
> > +contiguous memory for all the buffers it allocates.
> > +
> > +\subsection{Device configuration layout}
> > +\label{sec:Device Types / Video Device / Device configuration layout}
> > +
> > +The video device configuration space uses the following layout:
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_config {
> > +        le32 max_streams;
> > +        le32 caps_length;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +      \item[\field{max_streams}]
> > +            is the maximum number of concurrent streams the device supports.
> > +      \item[\field{caps_length}]
> > +            is the minimum length in bytes that a device-writable buffer must have
> > +            in order to receive the response to VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS, see
> > +            \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}.
> > +\end{description}
> > +
> > +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Video Device / Device configuration layout}
> > +
> > +\field{max_streams} MUST be positive.
> > +
> > +\field{caps_length} MUST be set to the response size of
> > +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
> > +
> This plumbing can be easily done using 'Device and driver capabilities' located in the 'Group administration commands'.
> Please rework the patch to use the existing basic facility.
> This can also possibly eliminate plumbing device specific command q.
> More below.

admin commands are kind of heavyweight, they are designed for control
path.  Question is, is this a data path or a control path thing?
If data path it is not appropriate, if control path it is.


> > +\subsection{Device Initialization}
> > +\label{sec:Device Types / Video Device / Device Initialization}
> > +\begin{enumerate}
> > +      \item
> > +            The driver reads the feature bits and negotiates the features it needs.
> > +      \item
> > +            The driver sets up the commandq and the eventq.
> > +      \item
> > +            The driver reads the \field{caps_length} field of the configuration
> > +            space, prepares a buffer of at least that size and sends the buffer on the
> > +            commandq with the VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command.
> > +      \item
> > +            The device sends a response over commandq to
> > +            VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS via used descriptors provided with the
> > +            command.
> > +      \item
> > +            The driver receives the response from the device, and parses its capabilities.
> > +\end{enumerate}
> > +
> > +\subsection{Device Operation}
> > +\label{sec:Device Types / Video Device / Device Operation}
> > +
> > +The device supports opening and operating a number of parallel streams up to
> > +\field{max_streams}. Each stream has three internal device queues: mainqX,
> > +inputqX and outputqX, where X is the stream id. Each stream command has a
> > +field that dispatches the command to the specific internal queue.
> > +
> If these queues are internal to the device it does not need exposure in the spec here. If they have a meaning to the driver,
> Than keyword 'internal' should be dropped and rephased.

I think the implication is that within each queue commands
are consumed in order?

This isn't terribly clear.


> > +% Use-case: there might be different real-time requirements for different
> > +% streams, so more virtqueues can be added in the future if necessary.
> > +% The internal queues don't change, the data formats don't change, only the
> > +% mapping of streams/internal queues to particular virtqueues changes.
> > +
> > +The mainqX is used to open a stream with VIRTIO_VIDEO_CMD_STREAM_OPEN,
> > +close a stream with VIRTIO_VIDEO_CMD_STREAM_CLOSE, reset inputqX or outputqX
> > +using VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET, set some of the stream parameters out
> > +of band with high priority with VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, unblock
> > +the outputqX with VIRTIO_VIDEO_CMD_STREAM_UNBLOCK if it gets blocked for
> > +format negotiation.
> > +
> > +The inputqX and outputqX are used to queue input or output resources using
> > +VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE. Additionally inputqX is used to set input and
> > +output parameters using VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, to complete
> > +processing of all queued input resources and make the resulting output
> > +resources available to the driver using VIRTIO_VIDEO_CMD_STREAM_DRAIN.
> > +
> > +All the stream commands start async operations, return the results
> > +using async responses over eventq.
> > +The eventq is used by the device to send the device's async responses to
> > +stream commands and the device's standalone events.
> > +
> > +% This way eventq becomes the single source of truth about the device's state,
> > +% the driver doesn't have to tediously synchronize commandq's and eventq's
> > +% used queues the way it was necessary in the past (similarly to V4L2's DQBUF
> > +% and DQEVENT). One more benefit is that commandq is processed fast and
> > +% strictly in order, so commandq descriptors exhaustion should never happen in
> > +% practice.
> > +
> Video device should be implementable without any V4L2 binding/description etc.
> 
> > +Parameters allow the driver to configure the stream including setting up the
> > +resources. Available parameters depend on the device type, see
> > +\ref{sec:Device Types / Video Device / Device capabilities and parameters}.
> > +
> > +A resource is a set of memory buffers that contain a unit of data that
> > +the device can process or produce. Most resources have only one buffer,
> > +raw frames using a multi-planar format can have several.
> > +Input resources are filled by the driver with compressed (coded) video data
> > +for a decoder and raw frames for an encoder, output resources are filled by
> > +the device as the result of processing the input resources with decoded raw
> > +frames for a decoder and compressed (encoded) data for an encoder.
> > +Resources from inputqX and outputqX are consumed independently, not in pairs.
> > +One input resource can result in zero to many produced output resources.
> > +A decoder device dequeues the output decoded frames in presentation order.
> > +An encoder device dequeues the output decoded frames in decoding order.
> > +The driver can reuse a queued resource after receiving a corresponding async
> > +response. Dequeued output resources can still be used by the device as
> > +reference frames, so the driver can't write to them.
> > +
> > +% TODO: maybe send the second RESOURCE_QUEUE async response, when the dequeued
> > +% output resource is not used by the device anymore and therefore becomes
> > +% writeable?
> > +
> > +The device can detect standalone stream-related events: errors and dynamic
> > +parameters changes that require intervention from the driver (e.g.
> > +reallocating backing memory of output resources to fit the new parameters).
> > +The events are signalled on the eventq, see
> > +\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
> > +
> > +\devicenormative{\subsubsection}{Device Operation}{Device Types / Video Device / Device Operation}
> > +
> > +The device MUST set to zero all unused, disabled or padding bits in its
> > +responses.
> > +
> > +\subsubsection{Device Operation: Command Virtqueue}
> > +\label{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
> > +
> > +This section lists the commands that can be sent by the driver to commandq.
> > +
> > +Different structures are used for each command and response. A command
> > +structure starts with the requested command code, defined as follows:
> > +
> > +\begin{lstlisting}
> > +/* Device */
> > +#define VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS      0x100
> > +
> > +/* Stream */
> > +#define VIRTIO_VIDEO_CMD_STREAM_OPEN            0x200
> > +#define VIRTIO_VIDEO_CMD_STREAM_CLOSE           0x201
> You can craft the stream using a existing basic facility of resource object.
> Where each stream is just a resource object, that be queried or modified.
> 
> > +#define VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS      0x202
> > +#define VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS      0x203
> > +#define VIRTIO_VIDEO_CMD_STREAM_UNBLOCK         0x204
> > +#define VIRTIO_VIDEO_CMD_STREAM_DRAIN           0x205
> > +#define VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET     0x206
> > +#define VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE  0x207
> > +\end{lstlisting}
> > +
> > +Stream commands start with a header:
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_VIDEO_QUEUE_TYPE_MAIN    0
> > +#define VIRTIO_VIDEO_QUEUE_TYPE_INPUT   1
> > +#define VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT  2
> > +
> > +struct virtio_video_stream_cmd_header {
> > +        le32 type; /* One of VIRTIO_VIDEO_CMD_STREAM_* */
> > +        le32 stream_id;
> > +        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* */
> > +        le32 async_response_cookie;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +      \item[\field{async_response_cookie}]
> > +            is an async response cookie provided by the driver, that allows
> > +            to relate an async response to the previously submitted command.
> > +\end{description}
> > +
> > +\subsubsection{Device Operation: Event Virtqueue}
> > +\label{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
> > +
> > +The eventq is used by the device to send async responses to commands queued
> > +by the driver on commandq and standalone events. Stream errors and dynamic
> > +parameters changes are caused by changes in the device's state, not by
> > +commands, still they are delivered as responses to implicit
> > +VIRTIO_VIDEO_CMD_STREAM_CLOSE and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS,
> > +respectively.
> > +
> > +Events start with a header:
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_VIDEO_EVENT_FLAG_ERROR              (1 << 0)
> > +#define VIRTIO_VIDEO_EVENT_FLAG_STANDALONE         (1 << 1)
> > +#define VIRTIO_VIDEO_EVENT_FLAG_CANCELED           (1 << 2)
> > +#define VIRTIO_VIDEO_EVENT_FLAG_BLOCKED            (1 << 3)
> > +
> > +struct virtio_video_event_header {
> > +        le32 event_type; /* VIRTIO_VIDEO_CMD_STREAM_* */
> > +        le32 stream_id;
> > +        le32 async_response_cookie;
> > +        le32 event_flags; /* Bitmask of VIRTIO_VIDEO_EVENT_FLAG_* */
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +      \item[\field{event_type}]
> > +            is the type of the event.
> > +      \item[\field{stream_id}]
> > +            is the ID of a valid stream.
> > +      \item[\field{async_response_cookie}]
> > +            is an async response cookie provided by the driver, that allows
> > +            to relate the event to a previously submitted command.
> > +      \item[\field{event_flags}]
> > +            is a bitmask of VIRTIO_VIDEO_EVENT_FLAG_* flags
> > +
> > +            \begin{description}
> > +                  \item[VIRTIO_VIDEO_EVENT_FLAG_ERROR]
> > +                        is set if the command finished with an error due to an
> > +                        invalid argument or for other reasons.
> > +                  \item[VIRTIO_VIDEO_EVENT_FLAG_STANDALONE]
> > +                        is set for standalone events, see
> > +                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
> > +                  \item[VIRTIO_VIDEO_EVENT_FLAG_CANCELED]
> > +                        is set if the command has been canceled by another
> > +                        command, that has higher priority. Doesn't make sense
> > +                        for standalone events.
> > +                  \item[VIRTIO_VIDEO_EVENT_FLAG_BLOCKED]
> > +                        is set if the command triggered a block on the
> > +                        outputqX to allow output format negotiation.
> > +                        When the negotiation is finished the block has to be
> > +                        removed using VIRTIO_VIDEO_CMD_STREAM_UNBLOCK
> > +                        command, see
> > +                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}.
> > +            \end{description}
> > +\end{description}
> > +
> > +The particular data structure representing the event is selected according to
> > +the \field{event_type}.
> > +
> > +\drivernormative{\paragraph}{Device Operation: Event Virtqueue}{Device Types / Video Device / Device Operation / Device Operation:
> > Event Virtqueue}
> > +
> > +The driver MUST at any time have at least one descriptor with a used
> > +buffer large enough to contain a \field{struct virtio_video_event}
> > +queued on the eventq.
> > +
> > +The driver MUST NOT put device-readable descriptors into the eventq.
> > +
> > +The driver MUST account for the fact that the async responses to commands
> > +might come out-of-order (i.e. after other commands sent to the device),
> > +and that some of them can be cancelled.
> > +
> > +The driver SHOULD wait for an async response of command A, that caused
> > +cancellation of command B, before queueing the command B again.
> > +
> > +\subsubsection{Device Operation: TLV format}
> > +\label{sec:Device Types / Video Device / Device Operation / Device Operation: TLV format}
> > +
> > +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS/
> > +VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS
> > +commands represent device capabilities and corresponding device parameters
> > +in the form of TLV (Type-Length-Value):
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_tlv {
> > +        le32 type;
> > +        le32 length;
> > +        u8 value[length];
> > +};
> > +\end{lstlisting}

will cause all kind of padding mischief if length is not a multiple of
4.


