Return-Path: <linux-media+bounces-47557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B57C782A9
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 10:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 36FEA4E8B7B
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 09:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7066733FE17;
	Fri, 21 Nov 2025 09:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdQtfl+J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEEC33F8C9
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763717559; cv=none; b=bzp33por7agIsZ4uX4tczscHY4o5a7SVe5Pg7QnMVEI+HY+7QcfI+wylH5m6De8VJ3Uz5eWhAA1RaA1fHwyB57UP83iK6v3ATmFqc7o/I3LIJCPJg1XUrwXzvc6SoJapKHwNrLhcOp/YOBUR9Vvj74scLsGZNTOj6Gkh2LI9Vag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763717559; c=relaxed/simple;
	bh=6PyDzD8CijFm7XP9JQUYHuFA8d6AifEMr9vGmysI/9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMm/GOvJS7e83bv0odx04PK4tgYezRz6cLNOzslsyL01rXMVAk3qfgVn3kCoCcXeqNfGzLBykdhH/uSGXYeOed8lImVL1G/EOeppRlL+i62ZdJT3JQz5Qly3T5H8GDtJUIGWxy8F4bYUA5j7GZ6toynwsi9glz1LpNAQZi794d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdQtfl+J; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso1529819b3a.2
        for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 01:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763717557; x=1764322357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuYEbkRINb2Wv3I/5k7ZJX5SxvEA5yNyvSqXwQJB7iQ=;
        b=HdQtfl+JCUrDNWTgk4RRAAFPs1YEtvVo92mJ+NtXCbdLNJ2Ov86S8pYN9kcz7WLYhB
         ivuMYeFi8OYc2jnR1FFgqTmk3jbfl6VMldNMOTZVU1ULyQ7UKgLTKd1Nx/EFjmPhPl+B
         ilpqtMWMahZLDPvjoXooa7hhZPAkb8Qh9cXIG1TOfxfBl2O3tYDkIbmHmWJSF0OChv3N
         d1psJ4/NQmX2PURKB+UHfTKuyczb7xj2xAOhlt1gBZQF7A8U8wda1l7LwHjc3W8i3TQc
         3H05miQcVBEg7HwTLDA0MNB8maMg+bEBNzDwJgLB8xBdKbKcuSLsRCozxSmTfzRdwbYv
         hubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763717557; x=1764322357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MuYEbkRINb2Wv3I/5k7ZJX5SxvEA5yNyvSqXwQJB7iQ=;
        b=KNluTkh3WMO0eZM6lgSwjIuodOCzel5ldl4ld0RgHX+yxhOmKVQ+1xiUbff1Nqgwzk
         f+VvdWZo1Z5XyIDEXHUp1GA79iZyXmEDc8USH9TiGFnYVGIC5GxbdUB0sxFSKeHmbJy8
         8Cf8TUb02A23YP5PjoehvFd5ZJHUxfGpBBlz3CbIzdKNDsmmfqkwqerVi48Wvpl/WVbb
         D1827tY+qRDsFTfAGWQ8Lx2ZRfhoxPFJsysg6kq5QopSeGPp8oVHvyieHkg/6j79uGQw
         oJgUnB9qFMge3KoYCMLP2WAmQxuSOiOT0OOuSOlbctUtt8eEIJ1m58QD+FSegO6Zr5HU
         pafw==
X-Gm-Message-State: AOJu0YykzDMwlxhZqL0vJj38JuS9W98V2zNn5BGpl7kgyD6MFLsAAyJz
	QZEihOhj/OxzA3p+yCnJim00/7AnStjGHYx4EPpmwujdZwwz3HdEMC+PFqQ4nnKXsmlHkmRpQzs
	3LQuLj4dyPt0t+WWhe1vmmSUR6DXr7jA=
X-Gm-Gg: ASbGncuCZg+nVJ9Qfgu1FKLdBMFFZKpr0DSM2Dsvk+dHcl9D57xlpxa00XvXsVS8IEu
	L7SzSt6ez7EbkKqLo4xBJFLZPvqzCDGnwXKgWehXAixSStM5cTyI58aFZ2MKM47vTrVFoMd8Fn+
	PsPWZpxOo7Ykh+BuZQKrLKZ+nekbCjrNpvjWef5FHxbNqRHOK924Hi8ylP94u7TcS60OhpQPyKm
	qHYY9k52bo9u70vZ5OfYboRUGdmvhX4b7qDQzhjTZxSbBKV4mhHgwG/2rU8kxS2BiuucA==
X-Google-Smtp-Source: AGHT+IGJ9l7LM/cmvFqp6VMJS0iaY+Ctu1F8qada78oVHFJxOezPTDCIZ7/ebocfX/WvtsUsPkL7iXTCmBptB5jhWwU=
X-Received: by 2002:a05:7022:6b93:b0:11b:9386:825a with SMTP id
 a92af1059eb24-11c9d87a52fmr477468c88.47.1763717557154; Fri, 21 Nov 2025
 01:32:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027195638.481129-1-hoff.benjamin.k@gmail.com> <b38c4013-fabb-4469-bfa9-9296a88d244a@kernel.org>
In-Reply-To: <b38c4013-fabb-4469-bfa9-9296a88d244a@kernel.org>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Fri, 21 Nov 2025 04:32:25 -0500
X-Gm-Features: AWmQ_bnPnNHz2ukL275wX1-IwhQGUN7FSg7OHDTtrG8DMo89y1DSDKZvEJnG5hM
Message-ID: <CAMSzxxQyuF5pE6bwU9+1cyA-0_0facswdNqOnKNV1jxa-0sVcw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/2] media: pci: AVMatrix HWS capture driver refresh
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mchehab@kernel.org, hverkuil@kernel.org, lukas.bulwahn@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Thanks for the review and for the guidance =E2=80=94 much appreciated.

> 1. wait until you finish the audio validation, or
> 2. make this a staging driver=E2=80=A6

Thanks for the pointers. I=E2=80=99ll wait until I have the audio paths ful=
ly
validated before sending v1. I=E2=80=99ll be running extended testing at th=
at
point, so it makes sense to submit the driver once the capture and
audio paths are both stable.

> Can you add a URL to the driver?

Yes =E2=80=94 this is a rework of the vendor=E2=80=99s GPL out-of-tree driv=
er. I=E2=80=99ll
include a link to the original source (or the widely mirrored version
if that is the only available copy) in the commit log of the main
driver patch.

> Is the vendor involved?

At the moment the vendor is not directly involved; I took their GPL
driver as the starting point and restructured it to follow V4L2/ALSA
idioms, add runtime PM, and bring it closer to what is expected
upstream. I=E2=80=99ll note that explicitly in the cover letter for v1.

> Please include v4l2-compliance output=E2=80=A6

Will do. I=E2=80=99ll regenerate the results using the latest v4l-utils (bu=
ilt
from git) and include the full report in the v1 cover letter.

Thanks again for the review =E2=80=94 I=E2=80=99ll follow up with a cleaned=
-up v1 once
I fold in this feedback.


On Mon, Nov 3, 2025 at 9:57=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel.=
org> wrote:
>
> Hi Ben,
>
> Thank you for working on this!
>
> On 27/10/2025 20:56, Ben Hoff wrote:
> > Hi all,
> >
> > This RFC series significantly refactors the downstream AVMatrix HWS PCI=
e
> > capture driver so it is maintainable in-tree and aligns with upstream
> > media driver expectations. The new implementation follows V4L2 and ALSA
> > subsystem patterns, splits the hardware plumbing across focused source
> > files, and introduces proper runtime PM and interrupt handling. The goa=
l
> > is to keep future maintenance manageable while providing a direct path =
for
> > existing users of the vendor tree.
> >
> > Current status / open items:
> >   - Audio capture paths have been refactored from the vendor driver but=
 have
> >     not yet been validated on real hardware. I would appreciate guidanc=
e
> >     on whether you would prefer that I drop the ALSA pieces from the
> >     initial submission and stage them as a follow-up once I finish
> >     validation.
> >   - `v4l2-compliance` passes for each video node, and I have exercised
> >     basic capture in OBS. I still plan to do heavier soak testing acros=
s
> >     all inputs and audio channels, as well as cover the suspend/resume
> >     paths.
> >
> > Any feedback on the overall structure, subsystem integration, and in
> > particular the best way to stage the audio support would be very welcom=
e.
>
> I think you have two options:
>
> 1) wait until you finish the audio validation, or
> 2) make this a staging driver (drivers/staging/media), add the audio part
>    later and then move it to drivers/media/pci.
>
> Regarding this driver: I gather that this is a rework of a GPL out-of-tre=
e
> driver? Can you should at least add a URL that driver? That should defini=
tely
> be part of the commit log of the driver.
>
> Is the vendor involved in this upstream driver work? Or you just took the=
ir
> code and made it suitable for mainlining? Just curious.
>
> Finally, for the next v1 please include the v4l2-compliance output in the
> cover letter. And make sure you compile v4l2-compliance from the v4l-util=
s
> git repo so you are using the latest and greatest version.
>
> Regards,
>
>         Hans
>
> > Once I hear back on the preferred direction I will respin this as a
> > formal v1 submission.
> >
> > Thanks for taking a look!
> >
> > Ben
> >
> > Ben Hoff (2):
> >   media: pci: add AVMatrix HWS capture driver
> >   MAINTAINERS: add entry for AVMatrix HWS driver
> >
> >  MAINTAINERS                            |    6 +
> >  drivers/media/pci/Kconfig              |    1 +
> >  drivers/media/pci/Makefile             |    1 +
> >  drivers/media/pci/hws/Kconfig          |   13 +
> >  drivers/media/pci/hws/Makefile         |    4 +
> >  drivers/media/pci/hws/hws.h            |  194 +++
> >  drivers/media/pci/hws/hws_audio.c      |  571 +++++++++
> >  drivers/media/pci/hws/hws_audio.h      |   22 +
> >  drivers/media/pci/hws/hws_irq.c        |  281 +++++
> >  drivers/media/pci/hws/hws_irq.h        |   12 +
> >  drivers/media/pci/hws/hws_pci.c        |  708 +++++++++++
> >  drivers/media/pci/hws/hws_reg.h        |  142 +++
> >  drivers/media/pci/hws/hws_v4l2_ioctl.c |  576 +++++++++
> >  drivers/media/pci/hws/hws_v4l2_ioctl.h |   32 +
> >  drivers/media/pci/hws/hws_video.c      | 1542 ++++++++++++++++++++++++
> >  drivers/media/pci/hws/hws_video.h      |   24 +
> >  16 files changed, 4129 insertions(+)
> >  create mode 100644 drivers/media/pci/hws/Kconfig
> >  create mode 100644 drivers/media/pci/hws/Makefile
> >  create mode 100644 drivers/media/pci/hws/hws.h
> >  create mode 100644 drivers/media/pci/hws/hws_audio.c
> >  create mode 100644 drivers/media/pci/hws/hws_audio.h
> >  create mode 100644 drivers/media/pci/hws/hws_irq.c
> >  create mode 100644 drivers/media/pci/hws/hws_irq.h
> >  create mode 100644 drivers/media/pci/hws/hws_pci.c
> >  create mode 100644 drivers/media/pci/hws/hws_reg.h
> >  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
> >  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
> >  create mode 100644 drivers/media/pci/hws/hws_video.c
> >  create mode 100644 drivers/media/pci/hws/hws_video.h
> >
>

