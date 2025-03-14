Return-Path: <linux-media+bounces-28181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C7EA60B79
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D4423B1A7F
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 08:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2781C84AB;
	Fri, 14 Mar 2025 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DiLUQKv+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC91A3160
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940933; cv=none; b=kgQ0iWNtnYa90/Jbbg8Q1/s1meXHSNr5MzEfgHcqrUCYvn5tdEpTQcZ52v9BCT6bGhYwOhGkM3P9q5MuabJEn2qv45nIOtlO0rEHwZgTufStgXrCnH9/2ZOzaQdw+CnsHuebBCT4ot3lJaAwAZWpWKA59rXlUenSUAKMzkHaccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940933; c=relaxed/simple;
	bh=3beW1OCLWolT6HOjuqjnuVA3lH6Eoavs/ap0fe1G/BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPOitJJnfX4G8mvYKaQ7EC/dyJiETzrRMqXlQ5m9Sa9UpkBpIWyVn+R+F8NzudO6CGv9LSeZekawY1+gq0UZEUe3dOSHtvm4CArOrfmY1yvewOb+ip6Iu9/9nseh7JSYqsjkBMqfWvEf3j0C/Cl51xamqMKRMhTE/2RxClVfKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DiLUQKv+; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bee1cb370so19719031fa.1
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 01:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741940929; x=1742545729; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=svh2Ei3PIghL/U77TQ2sDGt373rPLDUnBNnpKbsNhmU=;
        b=DiLUQKv+kfsM3bSdrlZZq+UYtGbiTTcfGTVmMjKS34vWbv/hor63LVAX+cGNX/2ZKE
         12tBjLFipAL+6S8qD+C9dfkOAkJZtTBZsOilaBsFCDfs8YfGEVcDsloM2JaaxGSv4Vk3
         2z9akqnZYmAZh9Q3/Xcz1oxn8dyH59acoBtrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940929; x=1742545729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svh2Ei3PIghL/U77TQ2sDGt373rPLDUnBNnpKbsNhmU=;
        b=Y+BxFZ+3XJmcG7n45+aSU/32Neb5fGtDp4mjtrLZdwaHApgN+hwmNLMzhSbEqo017t
         hG7uP3UX+049QLDqsxoLL1s6qKELMWc6RK4qOfNqIXfyBDQum8T/IVoBq7Z/oci7FOXf
         B0xawXX/1bqckbtfFIryLMBw3wrq3MMGoXz0O98CsxHv/wQDFfzIJEVWw9PuGFIPxljg
         RxNSyuzMw2ve5fSa2eHgGyiEM+5Nzm8gP+zYncPSza88ENpKnv73ObyPC7NiCxH65++q
         Qul0vRU8Z8aPIPl1Nlo0vZ5rh71u8avFsBXO8WZrOpHYOUNBujCuGhQPfe7lPXqrcKgh
         DJyg==
X-Forwarded-Encrypted: i=1; AJvYcCV/g8B45+Zt0oWzZvU1R2uLI5CNQMWl4BIdb9sn8qZyzo7IYUxDh/ih8RcUYfMaIzqodGUwagzztqH2Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF6q1tI+1GK5aq/XjQwWfBJOnPhof79IDobmE3iM+ct3UlqNho
	qtabvkdbU0L4YfoFL7V+7xwqRR7Tnin10Q6bVFouhQlkM951mUNzCYqlwPe5bbTpjLrroOxa8Hm
	Mvw==
X-Gm-Gg: ASbGncsdwqOm1jdVoYAe4Pp1oA3aVA04zyIGHDG1zrutA5t3EAGaMPFO5wiZD2+EVYa
	HNmsRyHRPUjAKaiWdifZW27Q54p/Ekzrysul/BQ1TQPqL+kiff0mwxt+flEUtp9hALGHAh16Dbn
	h9gu8l+ovqnAIFC6hLUICQtw5DRiLUOwlw60DImkKCUsRaf+cwowhoqGX8FZeOlyRF/Of7bjkhb
	vsJptATsU9aK41udl6Tevdb6NtIMtcjtu6lnnOV7xica97i+dyZ6VB0bEywv2g3QioxzH3ixZt0
	hl026aw8j9yAt4axQqRdIJCe86XGjjg3liU1hr2AWJSjD5PKXCZORW2xybTureWaVCnplFoszJ0
	cRShrPvA=
X-Google-Smtp-Source: AGHT+IGe4VxnR/JNZfJtx57AHcO3qT0pWfVxtYCbIf4t0FNcfv3VzAPZ07uN4QNC3pW8VvkLLE1RKQ==
X-Received: by 2002:a05:651c:19a7:b0:30b:cd68:b6a6 with SMTP id 38308e7fff4ca-30c4a74da55mr4641321fa.6.1741940929031;
        Fri, 14 Mar 2025 01:28:49 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f11752dsm4928851fa.60.2025.03.14.01.28.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 01:28:48 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549644ae382so2081483e87.1
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 01:28:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLOg/jFqZN/YiZbeaaAEBu5fQafV5Ln79zAJIg8tx+IfD6SPideHTg4XghaHYt5rIOxr+p1YOGLjehbA==@vger.kernel.org
X-Received: by 2002:a05:6512:282c:b0:548:9786:c18a with SMTP id
 2adb3069b0e04-549c391098dmr577468e87.19.1741940927720; Fri, 14 Mar 2025
 01:28:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-uvc-metadata-v3-0-c467af869c60@chromium.org>
 <20250313-uvc-metadata-v3-3-c467af869c60@chromium.org> <20250314073456.25817a3d@foz.lan>
In-Reply-To: <20250314073456.25817a3d@foz.lan>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 14 Mar 2025 09:28:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCuNzwqhYOORqY+PGUbK8=tqxm6stpzQC3BFYF7pxgRG6w@mail.gmail.com>
X-Gm-Features: AQ5f1JoCE_oXYK2iy5ZNefUSZDoSx_Ql3eqvm2Z0KbemciKPzVrpZ_OR0bJVOPU
Message-ID: <CANiDSCuNzwqhYOORqY+PGUbK8=tqxm6stpzQC3BFYF7pxgRG6w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: uvcvideo: Introduce V4L2_META_FMT_UVC_CUSTOM
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mauro

On Fri, 14 Mar 2025 at 07:35, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Thu, 13 Mar 2025 12:06:27 +0000
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
>
> > The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> > V4L2_META_FMT_D4XX. The only difference between the two of them is that
> > V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> > V4L2_META_FMT_D4XX copies the whole metadata section.
> >
> > Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> > devices, but it is useful to have the whole metadata section for any
> > device where vendors include other metadata, such as the one described by
> > Microsoft:
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> >
> > This patch introduces a new format V4L2_META_FMT_UVC_CUSTOM, that is
> > identical to V4L2_META_FMT_D4XX but it is available to all the UVC
> > devices.
> >
> > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
> >  .../userspace-api/media/v4l/metafmt-uvc-custom.rst | 31 +++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  drivers/media/usb/uvc/uvc_metadata.c               | 40 ++++++++++++++++++----
> >  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
> >  include/uapi/linux/videodev2.h                     |  1 +
> >  6 files changed, 69 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > index 86ffb3bc8ade2e0c563dd84441572ecea1a571a6..9fd83f4a3cc8509702a2a9f032fdc04bf6c6d1bc 100644
> > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > @@ -19,6 +19,7 @@ These formats are used for the :ref:`metadata` interface only.
> >      metafmt-pisp-fe
> >      metafmt-rkisp1
> >      metafmt-uvc
> > +    metafmt-uvc-custom
> >      metafmt-vivid
> >      metafmt-vsp1-hgo
> >      metafmt-vsp1-hgt
> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9f150fc2b6f379cc4707ff45041dd014956ae11a
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst
> > @@ -0,0 +1,31 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _v4l2-meta-fmt-uvc-custom:
> > +
> > +*********************************
> > +V4L2_META_FMT_UVC_CUSTOM ('UVCC')
> > +*********************************
> > +
> > +UVC Custom Payload Metadata.
> > +
> > +
> > +Description
> > +===========
> > +
> > +V4L2_META_FMT_UVC_CUSTOM buffers follow the metadata buffer layout of
> > +V4L2_META_FMT_UVC with the only difference that it includes all the UVC
> > +metadata, not just the first 2-12 bytes.
> > +
> > +The most common metadata format is the one proposed by Microsoft(R)'s UVC
> > +extension [1_], but other vendors might have different formats.
> > +
> > +Applications might use information from the Hardware Database (hwdb)[2_] to
> > +process the camera's metadata accordingly.
>
> Having something like that at the userspace API shouldn't be handled
> lightly. This sounds to me that passing a blank check for vendors to stream
> whatever they want without any requirements to provide and sort of
> documentation for the usersace to decode it.

As HdG previously mentioned, all the processing is done in the camera
so the metadata is not going to hide highly secret required for
processing:
https://lore.kernel.org/linux-media/67c1a857-7656-421f-994c-751709b6ae01@redhat.com/

>
> Also, it would be hard for userspace to distinguish what metatata
> is contained for a random UVC camera. Please let's not do that.

Userspace will use hwdb info to properly parse the metadata.


>
> As the specific issue here is to support an already known extension,
> which is already documented, Just add an specific format for it, e.g.
> you could add something like that at the documentation:

The problem here is how do we know from the driver if a device
supports V4L2_META_FMT_MSXU_UVC_1_5 or not.

In Windows it seems that vendors add that information to the device
.inf file. That is equivalent to the hwdb proposal.
In ChromeOS we are trying to push vendors to use an extension saying
if there is metadata or not. But that will take some time to land and
there are thousands of modules out there not ChromeOS compliant.


>
>         V4L2_META_FMT_MSXU_UVC_1_5
>            Microsoft extensions to USB Video Class 1.5 specification.
>
>            For more details, see: https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
>
> And then add the corresponding format to V4L2 API.
>
> Regards,
> Mauro



-- 
Ricardo Ribalda

