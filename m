Return-Path: <linux-media+bounces-62334-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO0rL8TkDWpz4gUAu9opvQ
	(envelope-from <linux-media+bounces-62334-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:43:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 657C759257A
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCFC6327F1A4
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA1033B95E;
	Wed, 20 May 2026 15:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b="gqpKgBW+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A1B305686
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292051; cv=pass; b=oaD+xsFDfTLFKuVNWuwn68JYTMCB25Dv06fNSNXSHXD5Ub3cgF50/P2KUQWr32n72NyUXRDNTUZHQ/PPY7xUSZEOuoP3jx0fyunmpDBUD3DizN+ah4/Q9xxpBCMObcf93HTzqlIxd2Esy87rOODbtg2mQgAMMFQL/0euI8TbbPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292051; c=relaxed/simple;
	bh=AWGO8vhu+Zh92NgAY6Z9P494WPO1xIp3IJxl+CkGVDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYPV1P7fgf1+PwiRfwde9gfSFuYf4oEL+18iJiWoUHa1emhlBHsxTwJb/VO16fAhYf1K0VKpPwb1zDP3uug9sDOr6GoyYrI9RZoFqnF/CjBun9ND71DGMyRKZpMQYPZ+zLLHwxwyKeHlWPJHR4xdzzsg6ndGfszufKW8bO6IQlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b=gqpKgBW+; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-90b2fcf90a0so709715285a.1
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779292046; cv=none;
        d=google.com; s=arc-20240605;
        b=bUOTu76KyrIw3pqgDLLOuBKBwyy+ReRziA4RCd4nuXKDdrfQcs/IP+3pIEX4jfXa99
         st8aIP8Yxg0y8FSB17S7fayRQYcR88df9mENfHZxkvZy0SIM+H8/k/Ga+j9pfcilJ30v
         QHeNdvJtuUS/tYeeVukfKw8D1p09sjiMQfdFpSiaf/oE6BtD7CabN7hRhF6WQFjKZ8U1
         8C0PVldJRAIAX58zIpCRV/cCoSlAiEwZXLYNlIQHEvkaLeaKLrFOAeOgrEm22yrEckx2
         6iDF32TVtnjSGFDFRQBy/meMSKfaQJbbu+lE/griqTlA49uCPkQAZLNCnxeW0LIwwdeQ
         qpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I5uPOQqH/io7bW7wdgpurqth07a6Aq9sxwItrhNv9yI=;
        fh=s9cPxIRgnDKorkFVQse9ujF65BH9xwiXE/oW7+YB/UY=;
        b=eZmC1S689uH4UQa48K80Gh+IAmuEpxgObN0E8EMShq6um/fy7ukoW2V/lRkF8aPd2l
         mErCEH/lQRBH3Xbamhse+LR4yzqZcR2DF17kLUpAVGKDShEeBEV3wLMH6ERE6ht8YuLu
         Ys4Nx7hEcWGC5UGz3qWj6scK6CksgnS2fKacmv4rHQ5BjvjGSbu955pFyXXUAF1L2Ufk
         mubLmvCz8WVyhEreQocFHKE9K6wlLewZZ8wthQMLeeZPiA4CZMPNcCKPRntqaqtBQzLZ
         3OrOoEysPyYEuPGXzbTPA2TzzQu7i20IXK3f4kYl7jh8Zqru3L7A+ON+hzCwbODG9uFg
         5yqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20251104.gappssmtp.com; s=20251104; t=1779292046; x=1779896846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5uPOQqH/io7bW7wdgpurqth07a6Aq9sxwItrhNv9yI=;
        b=gqpKgBW+I0jN7mJrVwuYxEQK5+v8ZKgcfb/N8fKIp/DRkwO3EvYPS2Bxu7Ku5uw6Tk
         Qi5/w5VuAMFqy/BPb+nmYhAW/2Eb9V3vxfhd5hpUbnCpFi5rtnE8svDuYScomFj0hW6y
         BLh9xvzOi1j1W6o9LYHeW8vOyx1T3UdhFGWQfGj6AYwrXa+VzZgUyEa5GYtjPv3BHG9v
         hrHuAKpUx3Kl+n2Oz7fyPmC8Nm2g8FwEQKpLcTAZSdiTCDLcOWECfQ5Z5LZh3Al5CnR4
         244jcVQVaZkMsDHQQrcTzgVrf6UfMuELa0bBLfJ81miA405vsc48ZuFs3gN5HWikIZX3
         fkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292046; x=1779896846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I5uPOQqH/io7bW7wdgpurqth07a6Aq9sxwItrhNv9yI=;
        b=UepQUQFHLrCv7CATVct0yujwcEgs2DIyu/U50e3zQBANN7+J4AnCo6tOpfFMwk/GvV
         45omIx8kzCTJSZVs5YRui4PcwCCvybBhSEIsOnHvNpAASh7tGBHCW0HxTmPha/NhaNaF
         T6Wo8H2b4UYH6zbqxu0/BI/QS/pInpIqCsi6C3Qp//aMJwxx4StDVZqRaidXGT18SvYz
         phjA7fX7xWCMbf2xEtaf6uneANC8NROoJzHdUV0cOus3MDRabyub8ujPa/WuHaNkmo+J
         ZqaHoA2hacRY+frHQHOJKTskF8+3h7Yinl+Iqqk6k0HzT27WNUJVGI0VqIwzRE+hXlO3
         D9nA==
X-Forwarded-Encrypted: i=1; AFNElJ+WHV8MCB93tayMSZFr/oJkvJMcp4H5inqrTRKFBRrfUy4bv3bUshxe2hqYiEeoFfpn0P7GVVUoLSKO/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEMx+AnQoHcFTXsDqk1y2QduMrotCO32mC9Agc7IiWc4IcRdim
	PMOuNFnJFd9UEY7YDCXEgqMd1BRTZumR5vdNk1NIvelya7rAodyl9tNE9nnaQdo5nv+0Q51SzET
	D9C0ZTCWheHtE23fUOvRHGbUnIycl4Onv9cxcEO3z1A==
X-Gm-Gg: Acq92OH3ULkff2xqHuxkc8CQaz7jMcq7pZBQOlrXhfFtUyAbzTqOjdxLAaW1YpgUmrq
	rMoujOTbxzJsLf4pqZazfHWM5mkCnkxMDVjVwjZo5+GRne1/KQHhndvEePOGdURhaxJ0Say3I83
	enlIX0mZmGRKeifK5ZYmH+y+gccgcnRJ8AYnqxCWSiGmkv5H83bV33+Lqd7Y+DS0UTPToF1RE0y
	dlSVIJRJSmRvvpi8/1YOx6H2c2uBhmISP9pZEuqXLTeQzrZIxQ4MxTIohmYXZZjR1wjJjC0iRZS
	oAFwItRDgGN66VIPhA==
X-Received: by 2002:a05:620a:1d94:b0:911:fba0:6d02 with SMTP id
 af79cd13be357-914a0268c45mr5177385a.22.1779292045808; Wed, 20 May 2026
 08:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-2-b2d984c297f8@oss.qualcomm.com> <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
In-Reply-To: <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 20 May 2026 17:47:14 +0200
X-Gm-Features: AVHnY4JWUX0pXGJu6GgwPpdJDM8Jh8t09gfswovnCTuU2k-U-QKXEr_LdCOWDYs
Message-ID: <CAPsqS2Tt0JbHhJLHBsbJ2YfZW913WNfoSXpSa+8TD1T9CV8V3g@mail.gmail.com>
Subject: Re: [PATCH 02/15] accel/qda: Add QDA driver documentation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ekansh.gupta@oss.qualcomm.com, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bharath Kumar <quic_bkumar@quicinc.com>, Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, robin.clark@oss.qualcomm.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[tomeuvizoso-net.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tomeuvizoso.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62334-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomeu@tomeuvizoso.net,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[tomeuvizoso-net.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,foo:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 657C759257A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 4:12=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, May 19, 2026 at 11:45:52AM +0530, Ekansh Gupta via B4 Relay wrote=
:
> > From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >
> > Add documentation for the Qualcomm DSP Accelerator (QDA) driver under
> > Documentation/accel/qda/. The documentation covers the driver
> > architecture, GEM-based buffer management, IOMMU context bank
> > isolation, and the RPMsg transport layer.
> >
> > The user-space API section describes the DRM IOCTLs for session
> > management, GEM buffer allocation, and remote procedure invocation via
> > the FastRPC protocol, along with a typical application lifecycle
> > example. Sections for dynamic debug and basic testing are also
> > included.
> >
> > Wire the new documentation into the Compute Accelerators index at
> > Documentation/accel/index.rst.
> >
> > Assisted-by: Claude:claude-4-6-sonnet
> > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > ---
> >  Documentation/accel/index.rst     |   1 +
> >  Documentation/accel/qda/index.rst |  13 ++++
> >  Documentation/accel/qda/qda.rst   | 146 ++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 160 insertions(+)
> >
> > diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.=
rst
> > index cbc7d4c3876a..5901ea7f784c 100644
> > --- a/Documentation/accel/index.rst
> > +++ b/Documentation/accel/index.rst
> > @@ -10,4 +10,5 @@ Compute Accelerators
> >     introduction
> >     amdxdna/index
> >     qaic/index
> > +   qda/index
> >     rocket/index
> > diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qd=
a/index.rst
> > new file mode 100644
> > index 000000000000..013400cf9c25
> > --- /dev/null
> > +++ b/Documentation/accel/qda/index.rst
> > @@ -0,0 +1,13 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +accel/qda Qualcomm DSP Accelerator
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The QDA driver provides a DRM accel based interface for Qualcomm DSP o=
ffload.
> > +It uses the FastRPC protocol and integrates with DRM and GEM infrastru=
cture
> > +for device and buffer management.
> > +
> > +.. toctree::
> > +
> > +   qda
> > diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/=
qda.rst
> > new file mode 100644
> > index 000000000000..9f49af6e6acc
> > --- /dev/null
> > +++ b/Documentation/accel/qda/qda.rst
> > @@ -0,0 +1,146 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Qualcomm DSP Accelerator (QDA) Driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The QDA driver is a DRM accel driver for Qualcomm's DSPs. It provides =
a
> > +DRM accel based interface for Qualcomm DSP offload, supporting workloa=
ds
> > +such as AI inference, computer vision, audio processing, and sensor of=
fload
> > +on Qualcomm SoCs. It uses the FastRPC protocol and integrates with DRM=
 and
> > +GEM infrastructure for device and buffer management.
> > +
> > +Key Features
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +*   **DRM accel Interface**: Exposes a standard character device node
> > +    (e.g., ``/dev/accel/accel0``) via the DRM accel subsystem.
> > +*   **FastRPC Protocol**: Implements the FastRPC protocol for communic=
ation
> > +    between the application processor and the DSP.
> > +*   **GEM Buffer Management**: Uses the DRM GEM interface for buffer
> > +    allocation, lifecycle management, and DMA-BUF import/export.
> > +*   **IOMMU Isolation**: Uses IOMMU context banks to enforce memory is=
olation
> > +    between different DSP user sessions.
> > +*   **Modular Design**: Clean separation between the core DRM logic, t=
he
> > +    memory manager, and the RPMsg-based transport layer.
> > +
> > +Architecture
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The QDA driver consists of several functional blocks:
> > +
> > +1.  **Core Driver (``qda_drv``)**: Manages device registration, file o=
perations,
> > +    and DRM accel integration.
> > +2.  **Memory Manager (``qda_memory_manager``)**: A flexible memory man=
agement
> > +    layer that handles IOMMU context banks. It supports pluggable back=
ends
> > +    (such as DMA-coherent) to adapt to different SoC memory architectu=
res.
> > +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer man=
agement:
> > +
> > +    * **``qda_gem``**: Core GEM object management, including allocatio=
n, mmap
> > +      operations, and buffer lifecycle management.
> > +    * **``qda_prime``**: PRIME import functionality for DMA-BUF intero=
perability
> > +      with other kernel subsystems.
> > +
> > +4.  **Transport Layer (``qda_rpmsg``)**: Abstraction over the RPMsg fr=
amework
> > +    to handle low-level message passing with the DSP firmware.
> > +5.  **Compute Bus (``qda_compute_bus``)**: A custom virtual bus used t=
o
> > +    enumerate and manage the specific compute context banks defined in=
 the
> > +    device tree. The bus was introduced because IOMMU context banks (C=
Bs) are
> > +    synthetic constructs =E2=80=94 not real platform devices =E2=80=94=
 making a platform driver
> > +    an incorrect abstraction for them. The earlier platform-driver app=
roach also
> > +    had a race condition: device nodes were created before the RPMsg c=
hannel
> > +    resources were fully initialized, and because ``probe`` runs async=
hronously,
> > +    applications could open a CB device and attempt to start a session=
 before
> > +    the underlying transport was ready. The compute bus makes CB lifet=
ime
> > +    explicitly subordinate to the parent QDA device, closing that wind=
ow.
> > +6.  **FastRPC Core (``qda_fastrpc``)**: Implements the protocol logic =
for
> > +    marshalling arguments and handling remote invocations.
> > +
> > +User-Space API
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The driver exposes a set of DRM-compliant IOCTLs:
> > +
> > +*   ``DRM_IOCTL_QDA_QUERY``: Query DSP type (e.g., "cdsp", "adsp")
> > +    and capabilities.
> > +*   ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``: Initialize a new process =
context
> > +    on the DSP.
> > +*   ``DRM_IOCTL_QDA_REMOTE_INVOKE``: Submit a remote method invocation=
 (the
> > +    primary execution unit).
> > +*   ``DRM_IOCTL_QDA_GEM_CREATE``: Allocate a GEM buffer object for DSP=
 usage.
> > +*   ``DRM_IOCTL_QDA_GEM_MMAP_OFFSET``: Retrieve mmap offsets for memor=
y mapping.
> > +*   ``DRM_IOCTL_QDA_REMOTE_MAP`` / ``DRM_IOCTL_QDA_REMOTE_MUNMAP``: Ma=
p or unmap
> > +    buffers into the DSP's virtual address space. Each accepts a ``req=
uest``
> > +    field selecting between a legacy operation (``QDA_MAP_REQUEST_LEGA=
CY`` /
> > +    ``QDA_MUNMAP_REQUEST_LEGACY``) and an attribute-based operation
> > +    (``QDA_MAP_REQUEST_ATTR`` / ``QDA_MUNMAP_REQUEST_ATTR``).
>
> Explain, what happens in the users don't map the buffers into the DSP
> space. Will DRM_IOCTL_QDA_REMOTE_INVOKE handle the mapping or not? What
> is the difference between those two modes?
>
> Would the driver benefit from using GPUVM?
>
> > +
> > +Usage Example
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +A typical lifecycle for a user-space application:
> > +
> > +1.  **Discovery**: Open ``/dev/accel/accel*`` and use
> > +    ``DRM_IOCTL_QDA_QUERY`` to identify the DSP domain served by that
> > +    device node.
> > +2.  **Initialization**: Call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE`` t=
o
> > +    establish a session and create a process context on the DSP.
> > +3.  **Memory**: Allocate buffers via ``DRM_IOCTL_QDA_GEM_CREATE`` or i=
mport
> > +    DMA-BUFs (PRIME fd) from other drivers using ``DRM_IOCTL_PRIME_FD_=
TO_HANDLE``.
> > +4.  **Execution**: Use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to pass argumen=
ts and
> > +    execute functions on the DSP.
> > +5.  **Cleanup**: Close file descriptors to automatically release resou=
rces and
> > +    detach the session.
>
> I'd have expected the description of the actual example. I.e. clone the
> app from https://the.addr, prepare clang >=3D NN.MM, QAIC (https://foo),
> run make, run the app, check the results. I'd remind that DRM Accel has
> a very specific requirement of having the working toolhain in the
> open-source.

We have been getting submissions lately that don't fulfill that
requirement so I will point to the precise part of the documentation
that explains it:

https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-usersp=
ace-requirements

For an example of a submissions that complies, see:

https://lore.kernel.org/dri-devel/20260114-thames-v2-0-e94a6636e050@tomeuvi=
zoso.net/

Most importantly, notice how the proposed Thames Mesa driver generates
machine code for all the hardware units, and doesn't use any blob for
that.

Regards,

Tomeu

> > +
> > +Internal Implementation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Memory Management
> > +-----------------
> > +The driver's memory manager creates virtual "IOMMU devices" that map t=
o
> > +hardware context banks. This allows the driver to manage multiple isol=
ated
> > +address spaces. The implementation uses a DMA-coherent backend to ensu=
re data consistency
> > +between the CPU and DSP without manual cache maintenance in most cases=
.
>
> GEM usage?
>
> > +
> > +Debugging
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +The driver includes extensive dynamic debug support. Enable it via the
> > +kernel's dynamic debug control:
> > +
> > +.. code-block:: bash
> > +
> > +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_deb=
ug/control
> > +
> > +Testing
> > +=3D=3D=3D=3D=3D=3D=3D
> > +The QDA driver can be exercised using the ``fastrpc_test`` utility fro=
m the
> > +FastRPC userspace library. Run the test application:
>
> pointer
>
> > +
> > +.. code-block:: bash
> > +
> > +    fastrpc_test -d 3 -U 1 -t linux -a v68
> > +
> > +**Options**
> > +
> > +``-d domain``
> > +    Select the DSP domain to run on:
> > +
> > +    * ``0`` =E2=80=94 ADSP
> > +    * ``1`` =E2=80=94 MDSP
> > +    * ``2`` =E2=80=94 SDSP
> > +    * ``3`` =E2=80=94 CDSP *(default on targets with CDSP)*
> > +
> > +``-U unsigned_PD``
> > +    Select signed or unsigned protection domain:
> > +
> > +    * ``0`` =E2=80=94 signed PD
> > +    * ``1`` =E2=80=94 unsigned PD *(default)*
> > +
> > +``-t target``
> > +    Target platform: ``android`` or ``linux`` *(default: linux)*
> > +
> > +``-a arch_version``
> > +    DSP architecture version, e.g. ``v68``, ``v75`` *(default: v68)*
> >
> > --
> > 2.34.1
> >
> >
>
> --
> With best wishes
> Dmitry

