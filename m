Return-Path: <linux-media+bounces-35777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D521AE6549
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11C25404E23
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E456A28D8CA;
	Tue, 24 Jun 2025 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1rFlTPA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82AE291C02
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769047; cv=none; b=dwb5lNgk+hFK+rEN/f9Ygxbq3GNX4oiSqECl7ZBziL/pjLCGpjLAYnd3O/AxbIxPJsL3WN/LPRi5l1f8iYmhStrDfbrL0DSUehwhfbS9WCBp6+HA303t+g0zsNoJfAq60HwVOb/bMnK7sOuROo022Rt2gHW+AVEJznb8BYPMDKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769047; c=relaxed/simple;
	bh=P3LocD1eCwky2wEhPAC6v+arsQoDwp4HMDRnVhNJiro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEsr9vGT7C44wQDlfW+ph5PH0Sp7oWsh1v6XozS5yybjWatK7GaHr+qirT8FSgWEfSBL+AH85jQxDzPqFxQjYP+UOFk3tLklvkVoc5zWwJt9yjkpe14OliPmiO/1/HPodVF9DswbbMLBfJpaMjcKTY7w1qu3/j7s3zx3055SkKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1rFlTPA; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b3b250621so3510451fa.2
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750769044; x=1751373844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hnVRdHLmuerHPKjlhHnWeoOqv8Hdu5CBPQEiWgB2uo=;
        b=h1rFlTPAWPT+QkCCgHrWTiCOOW7/LWa8fMatKu1tbl/5Vyy6OR/oxgfvsmpSI7Tzc1
         Q2a8l0MwXiFAJxq1g/cf7wc7vVoh6NA/uwNS0UtgTItEx0qgZTiWuqj4U49Ngc9hu91Z
         +WHcOuPF1HZhYIkajM2WggiQWJqIe9AKXZOOK49CktZWIT8iCeOw3VazhkqZDkbncBsC
         geexKK+0yPudU2p1yz/07TDVgkT34fzcUoOyQ6p5me6avANWXS52psgooNBB248KNAtS
         vlfGIEv8BTu4pqwbM4L6OskinPzzmPA0oLfyxO322oN0ha06j3vZ/c2qYd6DZY3KSNUN
         9aDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769044; x=1751373844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hnVRdHLmuerHPKjlhHnWeoOqv8Hdu5CBPQEiWgB2uo=;
        b=oNFsPl5tjDKA4yhCTwD2P2SgLzxWXvjH1AnukB9d9oPoJtglZyjjfXK4NU4EJmiC6I
         lrVgfMCi5/a1iJQ59bRFjEoTkaJ8m4BTD2p0NLvCoPBGTqD8Xt1Him4tFm9RVrrD1mlE
         qjOzEnz+Cmfa3s6/IhmNPGpMptkLO2lgzNM+QKLs45ikJ/IGilogWXl0UDxXsGvYpvOH
         Qy/eRhxUoPZ56DHfsHXXAPYJ3JgHeuUdf+Mj+aEiCGWRyqEwTFwu84Tqjf3TKDQeZcbu
         JT7DystDBuofO/dEPuZCHT8GcOFHK+neEfxoqqa70M7DiS9OBjDua9bGcxOczr5PHtnY
         SXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRLFOgeFKLTrJ/zDemwBwldwnA2+cBnQ0ga62mWniEOnaB5cTMhiTYiCLxcXTIP6eE3ceFskhGSr9xbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZQ8mgKWjrGahcoBSoOzVmLmdNp9deXdLVTrea6n2n4mKojddL
	XG1ZkSGxUpHKwE5AksmUzm+wYh9T71xzKQYmBzSg2KdGxcsJ80EZOoeXyjJGhquI6l24eM3DqNj
	D3tB3Zd2rWR26ItqUtMV7/GCNCuKCLJE=
X-Gm-Gg: ASbGnctD5088jlzXiUHOmNtypKm8EYKFaUR0HqEHpxHEw5PeALOWtk974K+EwQLt8JO
	jj+nS5Aw+TgdPCc2kAC8jxtGScxmvGjatPvoRKivrvgMsxcRQ5gg4bakqINNkvVDaoObr41Pko5
	DkKdMuouzJvXkQLVCJpqMVwz8gpRA120Zf6yaB5J/nYA==
X-Google-Smtp-Source: AGHT+IFOX8Bz5XQlxrTBd4wK+m74bUcHywX+oZbMo2WbsSgii6Vq97Wz68BWs/mB7Ok50uCevE9u45I6XBnlALpuces=
X-Received: by 2002:a05:651c:4194:b0:32b:9652:2c36 with SMTP id
 38308e7fff4ca-32b98f07812mr35416811fa.24.1750769043591; Tue, 24 Jun 2025
 05:44:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623110035.18340-1-hansg@kernel.org> <20250623110035.18340-2-hansg@kernel.org>
In-Reply-To: <20250623110035.18340-2-hansg@kernel.org>
From: Daniel Scally <djrscally@gmail.com>
Date: Tue, 24 Jun 2025 13:43:52 +0100
X-Gm-Features: AX0GCFvRGLFPU9aXROud55_wL6v_OcUEjXE2QcqzTwR2UDgaGqpGGkVWR-7sA-o
Message-ID: <CAFLoDVHq+1LGNT505iGjLXmHxjfRsONCz2X34M_CG4Tepp+LAw@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: ov5693: Improve error logging when fwnode is
 not found
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans; trying again now that I remembered how to Reply All...

On Mon, Jun 23, 2025 at 12:00=E2=80=AFPM Hans de Goede <hansg@kernel.org> w=
rote:
>
> From: Hans de Goede <hdegoede@redhat.com>
>
> The ov5693 driver waits for the endpoint fwnode to show up in case this
> fwnode is created by a bridge-driver.
>
> It does this by returning -EPROBE_DEFER, but it does not use
> dev_err_probe() so no reason for deferring gets registered.
>
> After 30 seconds the kernel logs a warning that the probe is still
> deferred, which looks like this:
>
> [   33.951709] i2c i2c-INT33BE:00: deferred probe pending: (reason unknow=
n)
>
> Use dev_err_probe() when returning -EPROBE_DEFER to register the probe
> deferral reason changing the error to:
>
> deferred probe pending: waiting for fwnode graph endpoint
>
> Also update the comment to not refer to the no longer existing cio2-bridg=
e
> code.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov5693.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 46b9ce111676..485efd15257e 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -1222,9 +1222,14 @@ static int ov5693_check_hwcfg(struct ov5693_device=
 *ov5693)
>         unsigned int i;
>         int ret;
>
> +       /*
> +        * Sometimes the fwnode graph is initialized by the bridge driver
> +        * Bridge drivers doing this may also add GPIO mappings, wait for=
 this.
> +        */
>         endpoint =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
>         if (!endpoint)
> -               return -EPROBE_DEFER; /* Could be provided by cio2-bridge=
 */
> +               return dev_err_probe(ov5693->dev, -EPROBE_DEFER,
> +                                    "waiting for fwnode graph endpoint\n=
");
>
>         ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
>         fwnode_handle_put(endpoint);
> --
> 2.49.0
>

