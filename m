Return-Path: <linux-media+bounces-20817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E7D9BC17C
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 00:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 424911C21CE9
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 23:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB181FE0F0;
	Mon,  4 Nov 2024 23:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEYyyhcA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421561ABEBA;
	Mon,  4 Nov 2024 23:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730763198; cv=none; b=l5kbQJQW+kYaJyhXKtlYl0uaK0z301kpZHifUX66uNHw8UK9pnES7lrn3wqjKqtXyC8zeGS6qTnhfZjx3UMxSgn3YDKM/WZpvqaabA655Kl45F0izL1AiD7oeC6oMoPXHUbssbF7LpTjkgSLidWq5WkkLR7E9lnezEd6aKN0iPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730763198; c=relaxed/simple;
	bh=Fj2bYG6FcMCww0Ge+minjrzZfzDdtI57/INSV+aooZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u45K/uoYZp44yWSJMU1SJmsxhzyO6SpU52hg7YF3pOI+IBYRIk5tq2UiN+MR1YO8Wof/9jspukn0Lx3l0Em/cIlo+VvoE8tQWPmIuYK/bzGPF691ozObdHmR4oRvCPppBormivqsots0rAFI/0efSA/y1wYAchluYqz2sRdQSpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEYyyhcA; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-50d487a93a5so1517214e0c.3;
        Mon, 04 Nov 2024 15:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730763196; x=1731367996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fj2bYG6FcMCww0Ge+minjrzZfzDdtI57/INSV+aooZ4=;
        b=TEYyyhcA2vQFH76VBY3SwO+mG2Ux7mxTYwZRMjvbsfSijPbFcN+HV7DrbEkBiDnuwO
         MdgBMeiZLqIjLK25hqBjCsL9AKU4n7je+oZdv+1dfBOGNU4LCDKgDbhaVwSp9TNCKfKn
         TImI+jmRVmvEwlBYaWylW2Zf1AkqABUVSh1lb+nbmjcJfy9C0dsFxN3TfhFgUWPC/Aid
         aH+6FepwiHsCY1ZFpuAOr2ocRk7wi6UrIJjVppkr46Bi2ynDp1XlkBRqhcfhJXx6Mvop
         6Qb5uDBwUl/TsolE9PT7xtYXZinEHBN+eTFxZOb/yBQIQ7LGZMFBMkVQGrJhqvFduwSx
         6BnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730763196; x=1731367996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fj2bYG6FcMCww0Ge+minjrzZfzDdtI57/INSV+aooZ4=;
        b=G8HYYTpx2D7WZQbM++m0sWZpfAqNjqvQQFx0pWCOCvVD0zoUvMBxbwZ8xlaBjkkmbc
         YZ9sZZxZhU+KKW1+AKcvPJ2ntts61FyFmRxt0VV5jJh6x6xhefEF+fh/nc8YT9bBjZLG
         Ah6/GBbRp1m9PdQrkHCU6hIcMX/4kgqBDl0vdJ0gFwenfyoE9ByLE+Y/1kWH5erDxaT2
         6I8EndE7cP/KbtwZjVLZMp3ZY4wkcgymQ5w3K+3tFffvy3cZ0AE5tc6B1qISPjppE4Nt
         SSA+1XWtpS7JgMAEwa0I+nkbodE63l8nrz0xOzKMXF3LMArT4dKjTUQJqQfWJfGaFdv0
         6MFA==
X-Forwarded-Encrypted: i=1; AJvYcCUV5b1bWYX/hKBstLowz3swL7xrqMGotIfiVDB9CwwCnxeOPH89STOxm7yZ4jXqLyCX9czGnH3qWgsoYSg=@vger.kernel.org, AJvYcCX3SZX2h5vrSV2RoX5neboXVwfN8SRtu73lSYkyOjTO6YKUFzaEDt94KMsl2Zd24CJFMOZOnMgalc4xPGM=@vger.kernel.org, AJvYcCXkYU+PtNdGKK5TEK5A9S59MVjDSn236OBRjziIuP8V4VTAioHjXmRe5zNMQT3Du+ApUTeeCdZ6OIu0WLmR0q/8Rgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIX32DdCLpXmIWcziP84WbSIhC1VxLlr4J+Ue32SKE2wjvt9rJ
	iG6XzG0r/a69ylgMuHzqie3X6NRoOJzyLvqUF4N6mnpDNzmjzavGuh3Hhht4wprjKBY3Qw7WwZ0
	MoHtZ/clAbcqohDKQCsuHHbpopgxQng==
X-Google-Smtp-Source: AGHT+IFvgNkqZGYasJTkQj8pzA6zOGykr1Pkw+CulQ8YFpPlste9cs800OBg9wnXKilsGNgu4lKYyCa1wNafUlQNICw=
X-Received: by 2002:a05:6122:a18:b0:50d:3ec1:1531 with SMTP id
 71dfb90a1353d-510150e1e84mr31312275e0c.8.1730763195970; Mon, 04 Nov 2024
 15:33:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241020223923.GB14328@pendragon.ideasonboard.com> <CA+V-a8uwWb982N71vRarPZ1VyeuY58=cWpSREmVc2cFccKzZaw@mail.gmail.com>
In-Reply-To: <CA+V-a8uwWb982N71vRarPZ1VyeuY58=cWpSREmVc2cFccKzZaw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 4 Nov 2024 23:32:50 +0000
Message-ID: <CA+V-a8utuzW62wopTyvmbOZ06wcMU4R8sw8Bmq1wsSu1F9BARg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] media: ov5645: Add support for streams
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon, Oct 21, 2024 at 9:06=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Laurent,
>
> On Sun, Oct 20, 2024 at 11:39=E2=80=AFPM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Prabhakar,
> >
> > Thank you for the patches.
> >
> > I think patch 01/10 should be dropped in favour of
> > https://lore.kernel.org/r/20241020164354.GG7770@pendragon.ideasonboard.=
com
> > ("[PATCH v2] media: v4l2-subdev: Refactor events"). Patches 02/10 to
> > 08/10 seem ready, should we merge them without waiting for 09/10 and
> > 10/10 ?
> >
> Agreed, for patch 9/10 and 10/10 I'll give a nudge when the
> appropriate core patches have been merged in.
>
Gentle ping.

Cheers,
Prabhakar

