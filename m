Return-Path: <linux-media+bounces-37001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFFEAFB480
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79B42189134C
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFA727587D;
	Mon,  7 Jul 2025 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUGrLI0G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618201E22FC;
	Mon,  7 Jul 2025 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894812; cv=none; b=ogzTwLApgM2WcIkl8TLaLn3mPSIRTUBEMX4BWWbJhsmuHnGrA4ylW6QNZjROLrD4BCWNRroOMp/y1v99dSHogTd0vh4rX9GmDt5bTGLLX3xAT9472SkukEDGOOcCqZF8XbdnUqL2LkV7fAkGMeK8D0ONn2kzN7OZO6MCeGJkjyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894812; c=relaxed/simple;
	bh=+eDQoI7Ih5xCp1XC5oM2SFOUr5/BpsbWEEV8qr+fx7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGdzFVp9Jwdpw/L0RrJDqcqMnzDq9SLxrVgkmjMxVc6oBRA4VvqqPk9jw5Knk9cuTRjU8i0xiQOM3bZiKz2OcQxdyRg1A4dHZ4PsXfJe5eayn+lJt4cMFPEab8zoA3gNvf+gzZ+YqCINK4slsMXRt340Bj3MPdsfBrQwzeypUK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUGrLI0G; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e81881bdd55so350285276.0;
        Mon, 07 Jul 2025 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751894810; x=1752499610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eDQoI7Ih5xCp1XC5oM2SFOUr5/BpsbWEEV8qr+fx7s=;
        b=jUGrLI0G21ULBTd6mLvIvoCLEDDgfzrvHlqU52K4SsaQZUZ9pVzeSl0CmvHeUhOUNL
         kza4xQUl9AK9Byh7BCnhKQDP+ncm6WjPJ240HJx8YGq9iQVh3/sGDd0IkJCp5rptvpzK
         ZF8E28HM6xYeq0MjkT20eSz94WWL8H2d0LLob3sAoxiBbzIhtxlKF2wgX10R6mLthC0p
         cnn2JLa9FtrbPBTJwzp9jOef/FaVdwauXywf/+VUndVP391Qk9TatS6PdTL2r3eNbmRS
         cNuF0G4Og4B1keCtk/WmjG/Kb2OWVrBv93xtjuebwLzQ3VhJEVpWtRTuDPi/8tNu1rub
         gPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751894810; x=1752499610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eDQoI7Ih5xCp1XC5oM2SFOUr5/BpsbWEEV8qr+fx7s=;
        b=Dtxx+yPqvH93k0ccULKskPl05o/iX05R6/VqKGUi29+Pv31FHdy4xSbqEuOIukaRLJ
         sMXgAFQ+9XuwK8SpxObQLxtFIvH82UJOQ0K/0ZdU6slGJxgyOWAnzbJAiPjidhvntaV/
         Jg5xcR+Q/4jeEvVN9a1+IvshzZ7VjwU3NwEtQ1EjOmXtVLfTqGRartn8kcGLiV9cafGF
         gzqEhMQ7kAhB38XisArPIiUT6BLwzd0TAwO5BvBCZzPnSrrVIh5V74zPluSb8hOEmSBG
         /eMG+4i97lnejchOXsXvU9ia83yYDFWM5IR4s9zMnghSTH6oUDCvTroJEw1Rz7U2lehi
         qzVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO4KIeBP8q7sw9uulh8OPOstWB+FoK4YLCXWIe8orykNtdidRcJZb6n90xt+rDySXzQEW5hwlwl6GA6Co=@vger.kernel.org, AJvYcCWeiRhgIBIJ+LCT7Dormz53T9vO2dBSkKV4zcHVR8Yl+geeXxV6aNmpJyYEbtjZhF5+Jj1wn701680XDPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyogY6r3am+0Cg5epPzUtmRioUIO7T/aW7QghEP8lj/MntWfbfc
	wQ4L5qENPkrpEUqusaY34UDTSQX6H4MmMDRi3Y1jYzBvklX1+6HTuz/bVWDNviMCoe/cb31JXuq
	be5k/s68jRQu4+bTlpnf1HdiyVwFHvxs=
X-Gm-Gg: ASbGnct5qJYIQgs7V4/huGV5XYBVt6XT3PKg4lHZS9fruXdGJ3tkns0KCI9Jl7h0rlS
	hlRRFO512M7zOqBdmE88ySPFvdsYU36U0EBJj08i+Oz9ktNZMe8OStsduI5MOWHpSFWloegWxck
	bWRqggNlKKS7v3A1KTZAnFe/sAriQ9L2tHDwrP1U6tyQM=
X-Google-Smtp-Source: AGHT+IEsKVW5JtW0RfRAq3tfnMDl8JVZLWNsI8dc7R+PLM4F6s/NZqeVQ76z6bAd0IbxM3Q0haEdHbKUvGerwwkKP3s=
X-Received: by 2002:a05:690c:6713:b0:714:305:7c74 with SMTP id
 00721157ae682-71669ed6b45mr81445977b3.3.1751894810104; Mon, 07 Jul 2025
 06:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
 <aGPYZhK65LaD0wVO@smile.fi.intel.com> <836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org>
 <CAGn2d8NBEwWm0mQ0YQ3KZ+V1Zon84zusfsQQV2foVmUTBAzEAQ@mail.gmail.com> <fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org>
In-Reply-To: <fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Mon, 7 Jul 2025 16:26:38 +0300
X-Gm-Features: Ac12FXzBqmNuWj7ejiaKXMMV8TVKT4LYL9tFZe6Npx2f8doOsoH6QUPVop8Pawo
Message-ID: <CAGn2d8M5+5ErZd0YF_hQ75j5FWEFC60qCPX6U7G5j2HgDmz1PA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Hans de Goede <hansg@kernel.org>, hdegoede@redhat.com, andy@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans, Andy

On Sun, Jul 6, 2025 at 9:25=E2=80=AFPM Hans de Goede <hansg@kernel.org> wro=
te:
>
> Hi, Abdelrahman
>
> On 1-Jul-25 5:45 PM, Abdelrahman Fekry wrote:
> > Hi Hans,
> >
> > On Tue, Jul 1, 2025 at 4:54=E2=80=AFPM Hans de Goede <hansg@kernel.org>=
 wrote:

> * And maybe you'll find more possible cleanups while working on this

I was working on some cleanups and i found something that i really
don't understand.
how is the error checking of hmm_alloc is handled , some functions are
checking the
returning value of it using mmgr_NULL and other use mmgr_EXCEPTION
while in fact, when __hm_alloc fails it doesn't return either
mmgr_EXCEPTION or mmgr_NULL in
most cases.

> Regards,
>
> Hans
>
>
Best,
Abdelrhaman Fekry

