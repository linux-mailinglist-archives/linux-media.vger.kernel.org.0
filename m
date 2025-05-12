Return-Path: <linux-media+bounces-32310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BFAAB3CAD
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 17:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB4DD19E2C6E
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 15:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EC423BCF7;
	Mon, 12 May 2025 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdGzU+Kh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939A1B66E;
	Mon, 12 May 2025 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064942; cv=none; b=pSvFbRsrffiJt4HOJJILkvqedts1JnG5gvIVojPuYBFNtL/Kqwc891NlUpawWH7I/DzKjq4PtMO/dItI9+tuy98xWWzpApuZ2Z9OIi8tvvcwfb1vuHRJcOOP8bau7rvZ2CzhqgBnccz2wbPFLDP2LhQUH/Opx5GiVLlIebTwyBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064942; c=relaxed/simple;
	bh=ZxtctWw3jWkEiCBJ6DMB5IpH+iqs5G/Twj0JOx7tcsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mO+mHoYXvfXcnX2au99VVkVaey18m9vRtOoYn2OOZUwQN4G2mvjOHFFtGzRJavNubNa8271HjAe25RVKEsODTmcXxB6L2+0avdFc1GT5BTyNagDoB4ZtIftbsddhWUeKuys16bRvlWfwa1l7kINcis/Mkpo/VSbt4uUlqKkAX2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdGzU+Kh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2300e7a3b71so1398485ad.0;
        Mon, 12 May 2025 08:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747064940; x=1747669740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1toMIC5cZ80kbGTeUrqsXajhHvT1yGhs13QyNN+QB4o=;
        b=SdGzU+KhwJmH2lGeJzDlZE1Bex6/78UgyB9nuS9UdHNDMuUvRsGUdwE5qY7xojX8tQ
         eID+j9B0OCG2HHkVKZQBzXg4zCZEFMKxZyZ61GRtzSzW/YlSTB2NYHVldq1XAeaLWZOT
         kdj9P4oodkDx/eY62rtKnm1nO6a7D1EiPLGFC86ugq1VdpgWP+z5hrdmLZR97JWzHApd
         v6a5h9lN/jiQFrPs6yrZp3h4co0pvRgFGQlBsRNnD6qlW+klVERPz6n8Pk+mb9pKhhFH
         V7VlhKUsBZ90ey9pFnDsx2abQ13YqaVQRO25llkbtCvwS9iKGoi/cUZjJGAib7fkS3lC
         OypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064940; x=1747669740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1toMIC5cZ80kbGTeUrqsXajhHvT1yGhs13QyNN+QB4o=;
        b=K3BGMPXuwK1c4vj3h+oZtnBQ346W2/xjXrIqaHDCTRAHdYbLdhhoD4FoLLgcKA+LTe
         eqSOE0xz2artyZTds1vyqJMuXo6o+y5iJ2/D6eTHAJhzYQUz0XrsTDNEyxF+vDwjxK+1
         Yeyh0FXBQQUdNm/YYUYd+X7LXtLWp276QoE0AjpKo2idutFGgJahJNVnoyAwY2honNgD
         /OJJhK8DcG6rk1kS0vbQa2Y7JxN8FoXBZum103aKLNhoD5gWy+yoOL5b35anesq7pRgh
         DBcPMUMNx1Q658TvUAJbAC1H091zJ15hq2FB8cdZDsCKF+F8JJB6/rMxs/2VodfTVyMF
         GtuA==
X-Forwarded-Encrypted: i=1; AJvYcCUk5XeUxsmj14whQsIaxit6oFCc+kl07xYraWuhv+pLhQKkhoDmIzKaX6yU2uMDChOXoP6P1YqaeJg=@vger.kernel.org, AJvYcCVQB1Sia1/vru5q/kfHe9frdBuFS9GyWeOOBoSFlTWDhoiup0WjttF5kKMqhItVsT6iy63abPhRduDErUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFBLI5CPgB2JLE1NP2oH+HPpWvvz9NhribQT77bdZtk/wsZVR5
	nb7A57Fs2fwthSYfHaKrj5amXLbtCoav1cpuHPU7ZV0vKlvC4yDr7eV1Ta3rnt1FlOiiuV5q1UA
	ySE9Wzi9dZJYo6tpnRLO5fHXUqVQ=
X-Gm-Gg: ASbGncvQLd1MJmJIwyu0nZ4/5BajCNIgsgZePdob2B6RkM8fZe5A2hpFIF5GpsegnZo
	NrRkmeQ+hvmxZuMSn77B7JxJqNlf2dR05HMV0EvsZ/kpb+NjaFI+XZpE9G73eHz+RqM3lrZiHws
	lXtNy1IzJ3MftNbACJwT/bPIJuJkgxyO6wtK8n6zYjUSc=
X-Google-Smtp-Source: AGHT+IEf6tEKjFeycq+UPlsS94TJHt5DH6CFc9vHqIPjnQk1kbzxBAOujdq7+fVBzkSYWm7S9YFoxapZxqZHVDT5E44=
X-Received: by 2002:a17:902:e88d:b0:22e:5bdc:fe24 with SMTP id
 d9443c01a7336-22fc894997cmr73958435ad.0.1747064939757; Mon, 12 May 2025
 08:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512074215.40928-2-bagasdotme@gmail.com>
In-Reply-To: <20250512074215.40928-2-bagasdotme@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 May 2025 11:48:47 -0400
X-Gm-Features: AX0GCFsa3NVdD9o69w_BNRqPm2ZbQH3a8ks0cMWBhi2YgHQxsTH8KYq-3IVam30
Message-ID: <CADnq5_O9X-rTUOPdaQEh_G3DajbSBwdxoDfDLVmDiyh-YT=ptQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/gpu: Disambiguate SPI term
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux AMDGPU <amd-gfx@lists.freedesktop.org>, 
	Linux Media Subsystem <linux-media@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Rodrigo Siqueira <siqueira@igalia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 3:58=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Documentation/userspace-api/media/glossary.rst:170: WARNING: duplicate te=
rm description of SPI, other instance in gpu/amdgpu/amdgpu-glossary
>
> That's because SPI of amdgpu (Shader Processor Input) shares the same
> global glossary term as SPI of media subsystem (which is Serial
> Peripheral Interface Bus). Disambiguate the former from the latter to
> fix the warning.
>
> Note that adding context qualifiers in the term is strictly necessary
> in order to make Sphinx happy.
>
> Fixes: dd3d035a7838 ("Documentation/gpu: Add new entries to amdgpu glossa=
ry")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250509185845.60bf5e7b@canb.a=
uug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied.  Thanks.

Alex

> ---
> Also Cc: media maintainers.
>
>  Documentation/gpu/amdgpu/amdgpu-glossary.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation=
/gpu/amdgpu/amdgpu-glossary.rst
> index 2040da593b1490..30812d9d53c645 100644
> --- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> @@ -182,7 +182,7 @@ we have a dedicated glossary for Display Core at
>      SMU/SMC
>        System Management Unit / System Management Controller
>
> -    SPI
> +    SPI (AMDGPU)
>        Shader Processor Input
>
>      SRLC
>
> base-commit: afc6053d4c4b0a6be500b9e643aa17221e93a57b
> --
> An old man doll... just what I always wanted! - Clara
>

