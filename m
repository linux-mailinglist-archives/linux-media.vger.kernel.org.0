Return-Path: <linux-media+bounces-17665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A57896D66F
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 12:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 443141C22117
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 10:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0894019939E;
	Thu,  5 Sep 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvPeG3Nk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA861991C1;
	Thu,  5 Sep 2024 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725533511; cv=none; b=c9Fv/T1ZEA90PFM6AsxRK6whVL1kYRE/Wuelv7lUZMPMKwLoSQbHthKkOb8ykF9lBonM8nOwQQJXKqr1Jpve2fY/mVmWm9aKHbN+M8Zjwplp3xDsgdGCaz9FWiiICeK0aAbKIIPcWcaWica/PG02GAwRot6E5uyddJ4bVXBGD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725533511; c=relaxed/simple;
	bh=O8qSPofABQ7LH3c/HHNySkDD+0oAinZOF/HKh25lY5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCwzhd6zJJZHdCUHk2gDhRNyqfGMeYy0sDwMbmxXa4taw6EmslUiQOvwLFKsZDF0U646pbkVCte+esnyvcnAMyoQMraz/z1w4WKgFfF3vUWuvmEvrtVXkCnqxtKW9gqO7b9V16XLfcxx7Q4So3/ntKZGtTc5qCk/54Q3VkrJWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvPeG3Nk; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-501204753c4so219933e0c.0;
        Thu, 05 Sep 2024 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725533509; x=1726138309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufRHGY2720QlXWb0nue8ePm0rJZQ+8VjS0VfodnKfno=;
        b=TvPeG3NkkOcNqMunGpq5HBFtkOQGqzwi31vQhdxxJZLlUUDiI/kdbty6nHpYVdQhbc
         +Qk4skCR0NiFohayJAGInJTMGCDxwOgpEDzeKbo47iAHh/47e9px+7p1f2piTh/iz1OX
         Tokko98OAE+zTlhVsk1sKm4Qola3TGgU50dn3fm9nMHPnfuje04re5Q43JXKEzK6o7dy
         S9RIxrYrundr6zBSgSfAjPfTNmww0XXK0v9wa+redHjdPf1CquxWny2enYciTrrfaUjm
         gsfoM6mPViMXOsnurtoDN6NQM/cWbcmPBmIXd4QTA9oU31HoaWjYtWkcDcbJxxjzk13P
         SHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725533509; x=1726138309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufRHGY2720QlXWb0nue8ePm0rJZQ+8VjS0VfodnKfno=;
        b=Jb0AV6acfATwAWs1bxJUT59Xnzo00gurlSW+epU1i1oDEImyqQf/TJEx99FxUJSHOG
         euRiG3qzuY/kaYvgdO53qz5P6s4QZMvXAigcExcP7HB8ul91OfDA4iNXLsXqrtHKxSAg
         z6b3dvYyDhLufxh4QqXDqAhbbZTt9BXgqFJ9J8EjeZbjHTm2pxX7Sfo+SNVVXxjNE1e6
         aDo9T1pTP8a3zYUQDgcopEFo9qGbp8DnXLwrBzARKQHwe2fkhE+m7lEzUsSNK1UWICsp
         r5L/qmNGwMy52VcAgnbvAe4jZfO3D0eDn01CUy4pGDihDC/bH/wEj5A/rFPah0f9XkQh
         0onw==
X-Forwarded-Encrypted: i=1; AJvYcCUuB9IyK8ogxFCHYLdGAXvA5ye+xgX2QiuP8Hiuh2jdJgjSX2m27Y+64dEkE207mx56eyFpSfe6rYHdCZY=@vger.kernel.org, AJvYcCVbdmQKPxDEsJIr1GibKeZ1rkBGypFBjp34NTdDcSgUy97t+uKVcAjNngDvP0UH1DH5bE8kAOmUeOsAF4xsMqxH1go=@vger.kernel.org, AJvYcCVnlhdU7PQeiu6qfnzqeAvZxt23kMhtQeAFrSy/EQpZJtAr423oLGvzPHayzSqBk6JTSHF7DKcaw3VQFQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZFDGZhHUPf05A/xJDfVgJechwOyoPkhmQpaXEeAC4CxJpatQ4
	2JxIf7tHdJWFApmC9Q//vLN9t+biNVIUd2Px1XRcrgezLha9Z6X3O+vA5s7++KegBCWEON5EjQk
	m0jmdeWgZaM5CoVLotapGbMURQOXae/4W8Eo=
X-Google-Smtp-Source: AGHT+IGwhfiEooLcuGzNShegrslROIsYlcQCM15UEMPI3svswpVNLwleZ+/VBe14t5oI+NCKxxQO57+0YTsfX+N7Cq0=
X-Received: by 2002:a05:6122:2a11:b0:4fc:eda5:6369 with SMTP id
 71dfb90a1353d-500f6c4c390mr3727042e0c.3.1725533508637; Thu, 05 Sep 2024
 03:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <3eeae62a-e22b-443a-aad4-f1a384c0a3f7@ideasonboard.com> <514490a2-181a-42ac-bc54-7a700e8d1bb9@ideasonboard.com>
 <CA+V-a8v0s8Unk3pNhR1wgBk_wqkua__Dumq3KT=n-cXUwq=6Bw@mail.gmail.com> <c928e09a-751e-45af-8e57-f105b41df2be@ideasonboard.com>
In-Reply-To: <c928e09a-751e-45af-8e57-f105b41df2be@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Sep 2024 11:51:22 +0100
Message-ID: <CA+V-a8svfVrjEjYbSko4eh6z_9kEkfwMHr0YHwaxEPWLKJBPyg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] media: ov5645: Add support for streams
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Thu, Sep 5, 2024 at 11:29=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 05/09/2024 13:27, Lad, Prabhakar wrote:
> > Hi Tomi,
> >
> > On Thu, Sep 5, 2024 at 10:11=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> > <snip>
> >>> I think you actually want 1/0->0/0 routing. The error says that the s=
ink
> >>> side device has routing which does not have a stream at stream ID 1, =
or
> >>> no routing support at all, which implies a single stream at stream ID=
 0.
> >>
> >> Looking at patch 12, there's something wrong with the approach here. A=
re
> >> you perhaps trying to define the CSI-2 VC with the streams?
> >>
> > Yes, based on the previous feedback received, I am implementing
> > virtual channels as streams. If this isn't the correct approach can
> > you please guide me on what we should be using to support virtual
> > channels?
>
> Can you describe what kind of hardware you have and how the VCs are
> supposed to be configured and used there?
>

 __________________                       ______________
    _____________________
|                                     |                     |
                |                   |
      |
| OV5645   Sensor        |                     |  RZ/G2L CSI2   |
             |  RZ/G2L CRU                 |
| 1ch out of 4x VC         |---------------> |   4x VC
|-------------->|  1Ch capture out 4xVC  |
|__________________|                      |_____________|
     |____________________|

Cheers,
Prabhakar

