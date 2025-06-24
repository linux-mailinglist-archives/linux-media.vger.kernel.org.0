Return-Path: <linux-media+bounces-35770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2F8AE6470
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD3A40607C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A85A29AAF5;
	Tue, 24 Jun 2025 12:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KERi0xfz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818AB299AAC;
	Tue, 24 Jun 2025 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767246; cv=none; b=ZfAn1PWxjPB92wNUA17MzBQkvJCu9lDeaPMYwp5ZryZxr4j0HY08PBaJMxQjyndXOy/So35QpoSVk0WR1GTxiEJc3/ixfrb/nTQOagAPHe/117UWk2CJN/gRSwA19PZHJZPe024tbPbr1w8NI3jey7uvF9QUApuIFQQKGcyV+y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767246; c=relaxed/simple;
	bh=ePm0jJWqGXRR7vHBFxgYXrJJtOzI3e/OKIPjCcbV0nI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLQf6XzwGYR+vgE3BvO/UiLoM6cN5PomwdxVmfzRIXEf8mvsQr2uBGIyQqppL5DKTn6hBhFHA13RTWhGpVZS+cQuSSvGiCnnIcuPAdGCuCoXasltsNAOdg0+VRlksU8o8eL6S0uOlxWAF7z8h+T8SNPuU1HF6oK+pHLGAHxJ0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KERi0xfz; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71101efedabso3756847b3.2;
        Tue, 24 Jun 2025 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750767243; x=1751372043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml9c9kjIjL4ob9bPUhkIZhRpvrm1uOprQJuOEQPEJo0=;
        b=KERi0xfzsEJxv1LL2tJai8U4qZ0Zle96JQRnqzAlx/lJCNfFtz0NeaOiFyhGVetxxC
         9fwzsNc44r7ZqAPnQ+DseygCr+iv9eXRNauoPUrykDwX0XJDIIwBKTOYK5VEq/jHB4W3
         IBSVf2pjwS4MJN16N66s5xElJo/QZtVBPqoxID6rbH8MeHW/hGfeEm9k4ODFbuQRJuL2
         nFHunGsnoIXtvcR7AsH0wqotMHtkCZJq5L7oc3XF4AD0sP3hIHpAMsVdN9jngISIyOXH
         5/tGwFe2tg224qqEgn2RLsHgnyJDe+hgQ1Yr6gJ1DoDYJ9Brpzhp9B1nZO4KcZb7mxLz
         PuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767243; x=1751372043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ml9c9kjIjL4ob9bPUhkIZhRpvrm1uOprQJuOEQPEJo0=;
        b=GZvofQhmw4tlIK4ucqqv7NR2p5CiCa6gLiuQjc6LIExYkmxhf0PfIxN0VNCYjmzhUB
         KXbRDCaO5LC5dKampB53i+57UR19mJTtbgVLvO6Vx2pcTdZu9+LiN2fQsl8514GoGPhD
         mtWch45YRUb2cm/mwVk0PZ/eSrlOorCK/VsIo5pTcnZ7dcrttUJ74c3Sg3710jZtkfpR
         VcEbik2K7CUWPxI9dG9pmiLJQ9o8/IovlRqWzJfHoQYksiP2Q35uoPxbnzSqU8ShKqIi
         nTJXtkT7U/30ZKVXUgBByKwl6DUJ785Zv31jDTkemrgdXOCrunZ3CKikFg9TM7Mlwg+8
         bJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJNTnEgdKXf1EBWRn+vpL4s0bKbHiE1uLw+aIjz88kZwzvbjv6tZECOaCjcH2dX1yA5WQmGsFMoIyCelE=@vger.kernel.org, AJvYcCXZ0T/y+/6Ga6+yG8x76eO4x4x+PFilngXjqZ4AE7uonB7awG/ZkYE2JEWII9o38pWSqr0e2Ey8KT91+Aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZUH96DgJMt9pdqrZhpJCdveitthr2UX6BDwlEmv05JvkIdtT3
	tUr7hZXXZ2YAX+VyOTXq6e1YYw9hyBBky0TNNh1yaeY8LZPLhHt8NTd5UvNd5zZyloAYfZ26RtI
	6DHa6rgIAIY1uG783I35V+MgRz8BS4O0=
X-Gm-Gg: ASbGncu5pcCBfhItOJZW19YFQy+OfrRXDrvd4NnYqeKx3PQy5tW+E9JVNNNe2Xp9yqO
	Y7T2kUCqxlGwshbcSRRnq8y0YhflFEjPB0LCqZC5zQ/c5YVqdZaEUkE2P9+8fPtr3svzZDwLg9g
	MVDso6QYKdRgn3fcMLZYgP1tqkLyn8rIAOqbjsV6g2KYB7
X-Google-Smtp-Source: AGHT+IGJneseQd34valjwD4g7qXNUGa5fvh5W4dFNyk2R9RoiDvyW7yd9lajATYT7lSlzYjGnEFNumQ7oA81TwA56nw=
X-Received: by 2002:a05:690c:a0a8:10b0:712:c14a:a363 with SMTP id
 00721157ae682-712c5fecc20mr77351027b3.0.1750767243031; Tue, 24 Jun 2025
 05:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com> <7852d6ac-95f0-41ec-8365-d23a2b16b208@kernel.org>
In-Reply-To: <7852d6ac-95f0-41ec-8365-d23a2b16b208@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 24 Jun 2025 15:13:51 +0300
X-Gm-Features: Ac12FXzFNhMuUIJFqi8IDai0efhsfCqHPuMbewzkMoJuG_hD0-sw55sonDvBegw
Message-ID: <CAGn2d8MfaEpfc2a0MbuuGQ8_Z6HjTRLQVLk9AvqxWuSJSo43QA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Hans de Goede <hansg@kernel.org>
Cc: andy@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 9:31=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi,
> As Andy already mentioned you really should try to first better understan=
d
> the code before changing it.
>
> In this case this code is used for 2 custom sysfs attributes called
> "active_bo" and "free_bo".
>
> sysfs attributes are custom userspace API and we really want to remove
> all custom userspace APIs from this driver before moving it out of
> drivers/staging
>
> Instead everything should be done through existing standard kernels
> API, mostly the standard v4l2 API.
>
> Note this is already mentioned in drivers/staging/media/atomisp/TODO
> although these specific sysfs attributes are not named:
>
> """
> TODO
> =3D=3D=3D=3D
>
> 1. Items which MUST be fixed before the driver can be moved out of stagin=
g:
>
> * Remove/disable private IOCTLs
>
> * Remove/disable custom v4l2-ctrls
>
> * Remove custom sysfs files created by atomisp_drvfs.c
> """
>
> In this case the "active_bo" and "free_bo" sysfs attributes seem
> to be there for debugging purposes only and they can simply be removed.
>
> So instead of replacing scnprintf you should write a new patch
> removing everything starting at:
>
> <--- start removing code here --->
> /*
>  * p: private
>  * v: vmalloc
>
> ...
>
> static struct attribute_group atomisp_attribute_group[] =3D {
>         {.attrs =3D sysfs_attrs_ctrl },
> };
> <--- end removing code here --->
>
> and then also remove the sysfs_create_group() and
> sysfs_remove_group() calls.
>
> After writing that patch maybe you can also take a look at tackling
> the "Remove custom sysfs files created by atomisp_drvfs.c" TODO
> list item?
>
> Regards,
>
> Hans
>

Thank you so much Hans for this informative feedback , i now see the
whole picture ,
i will submit a new patch that removes the two custom attributes
active_bo and free_bo
and then will proceed with the TODO list item " Remove custom sysfs
files created by atomisp_drvfs.c"

