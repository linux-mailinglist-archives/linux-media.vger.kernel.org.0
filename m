Return-Path: <linux-media+bounces-3139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7938215FB
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 01:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9100E1C20CDD
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 00:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227F6363;
	Tue,  2 Jan 2024 00:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Id3FOi7g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E55EBF
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 00:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-67f7aa55bfeso77914366d6.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jan 2024 16:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704154503; x=1704759303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIwM6KRZK3tz4EwN0J1avePE2ZDdYEFfaEyBcpZ/vcU=;
        b=Id3FOi7g1UuTMGsXjRzRj06GUk3VL3ayvv80WuD3Wu1L/rLhKzoouuJdAGS43tUwGG
         0fpHCgK8LYA0Mu7X2pVxsGocctHvzP8CoQ+V5a2YfrNoNbn3wIze5z/rPU0pQ0TfNQiz
         pQ1G7q3kTBMSk+PKINUwK3Z1fnfuUsAuyBFd9cnGrKpZFSGUfmrrbTRcYGmzQMlnbKpg
         sartA+2rLQvjKU4Py8NC/rDr+yqtc4PuCUBvQXBVtu1N9HtDhmsfgGgPLEiE/rPOh5Ij
         HPLrp7vX3vQIG6rcb7ejJLOmBMX8i3SNuO3vEo/Tqf5Pp5ocwnrUiDhLXiA0jriEagIC
         3UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704154503; x=1704759303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIwM6KRZK3tz4EwN0J1avePE2ZDdYEFfaEyBcpZ/vcU=;
        b=PVEpkZ26H122afcJ+pDFGoh6j46pJalHymyQcMo6dFS/bfL1xEBj1UNbV7HjY9Qk60
         6MvuZMGWTHeKCuHMPQ/o6t9TvbSjhWZOWWbeHL5HeVsuKpk+QjxnWaFiqO15X/Q6y7ic
         UgyVPkJCbxNZDFJQKBOdrH8/pOnLx0y2IMqhN96LqpNIupUod6tjU1AUR/XNOamqbHJc
         gGScft52+bGutYkjNsOraAxcV0smUbesvTFcBpT2gGPM0AQ7sIYv8O/PCeC+MPVMFKrW
         SVxIxyBpBrxN/OKLiWBlkbIFJxER2nPjhmMeMTtNeXyjJCskZ3Crytb/wbVMZyED5eam
         Ar2Q==
X-Gm-Message-State: AOJu0Yw1x/csZwqaZQpBQdYAcc2MBjTVXR+AZ58UCpo49bNnPwBaX/7b
	w9za+E6VegIgy+00k287JMYBAbTjw4CgSozVH/A=
X-Google-Smtp-Source: AGHT+IGgWzk5CRUI1H8y+iXsp6s9wfUFhaHnBYT3P/nZpwwAeZhSFkWSy0uBAAg10PFrOj0suCjhBDoHA+r/pjoLHpU=
X-Received: by 2002:a0c:ee8e:0:b0:67f:cceb:465a with SMTP id
 u14-20020a0cee8e000000b0067fcceb465amr16174040qvr.88.1704154503028; Mon, 01
 Jan 2024 16:15:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-2-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-2-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:14:27 +0200
Message-ID: <CAHp75Vf9pa9MsKc1YJex3sBAPMuRtYYOck8_9Ryz=RNuP5JTmA@mail.gmail.com>
Subject: Re: [PATCH 01/15] media: atomisp: Adjust for v4l2_subdev_state
 handling changes in 6.8
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> The atomisp driver emulates a standard v4l2 device, which also works
> for non media-controller aware applications.
>
> Part of this requires making try_fmt calls on the sensor when
> a normal v4l2 app is making try_fmt calls on the /dev/video# mode.
>
> With the recent v4l2_subdev_state handling changes in 6.8 this no longer
> works, fixing this requires 2 changes:
>
> 1. The atomisp code was using its own internal v4l2_subdev_pad_config
>    for this. Replace the internal v4l2_subdev_pad_config with allocating
>    a full v4l2_subdev_state for storing the full try_fmt state.
>
> 2. The paths actually setting the fmt or crop selection now need to be
>    passed the v4l2_subdev's active state, so that sensor drivers which
>    are using the v4l2_subdev's active state to store their state keep
>    working.

Two comments:
- why not 'if (!ret)' in a few cases?
- can actually v4l2 generic code define a class for
v4l2_subdev_lock_state() (and friends) via cleanup.h and hence make
those labels and unlocking calls unneeded with use of guard() /
scoped_guard()?


--=20
With Best Regards,
Andy Shevchenko

