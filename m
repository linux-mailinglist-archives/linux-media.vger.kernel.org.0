Return-Path: <linux-media+bounces-35779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2AAAE654C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC5894C07AB
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8A622CBF9;
	Tue, 24 Jun 2025 12:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyqkdY+F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FFB221FD2
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769086; cv=none; b=JuGDEKBOChTYbyljRKdBK/kKOtwkGbf2isIw+7O3EpetpsCq4w7gS5DguDMT4RQGX2XhN6DQipBGELN+eKMKEfpi9HkvXAZ8zTEYORKrSulV/jQqjhYHEwMk484+pe0NcAZ8OcgkJOF/ZBbeQBralE4vTELU+it+2jf75N8lMRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769086; c=relaxed/simple;
	bh=8X9+Xs6vFZIEQdtAxh3jR+w6gy41Jj2kSfGVHG3jb9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=potQStxHWw+CAYtudC5cbM2ZW8qFkoQxTIIP46Exra6MNuhMLXPQESwTwYzWdIt1VdC/kRG4hK9U0DdeNtfaG2NcXamgPHyI8q5FNqxhnB6TVsPtkXcVv1zZ98HpY9MYxNU6dHX0RrMGdcVRa8EdgN0StFb6Z7ai6rwhlQPCbA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyqkdY+F; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30f30200b51so65379231fa.3
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 05:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750769082; x=1751373882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6v5n8GB8qHzIpA/ytTW8FiXc3iGeX3dlu8d1KBH+dU=;
        b=LyqkdY+FY6DcAowe22iYvLKcgZQrkFF53tPoTaS1d1TidaaC1tIm38ojH4PEzhfPtL
         Nr+HYwqWlgyi/n1vg6NW+zAbzbBlZhdByyM45u2tWJG2+lZRB3HQCwVXCRToAez1Gu0B
         5PQ66xGChuHqn7fkL4fDpLQko6fM8fmtY6Y3QfkgJDfob7ZEqPKn7O/jMLYyqS+5fPRn
         Vs1hbkOobjsinHbEZpDffxRP+hZZDBYNuTWKEPHBUrsHwQEOsKYbNaQL+DrRHKf4kB89
         2Kl1nAqo7p8OavVytU4KTkv4f4fMRXMX5+Trj7eoy855IHQ/kEoVfYXBrAq/uQBA+wbw
         ueTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769082; x=1751373882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6v5n8GB8qHzIpA/ytTW8FiXc3iGeX3dlu8d1KBH+dU=;
        b=ki7Oz85RAKSQ48q4cdVH1awHoHZb8rEaZZrJBJwNlWQXs2Bkzit1Y9hjC0sh/wQiar
         fdBoM76fmBlIc9PG7MOUqWTZQbjVrzhWGmkYCCrB06vaBKuQDTKbkQ+c1b778kyF3dpD
         KKMFhcAcNNHm5J0zL6aRzUIOLwWLa3ao7NGwXUraJJ4H5ZXYhP7aPgrGXD6OiM+vzNt6
         YjZlryUqTqaVqta7XvGE62+lZdOYdFfhYQ6WogftYk96p165aFOSL957YhSsonQ4NC1m
         Qu2NJ2HazLp2OkCD1jkviy5cB4R3MGl5Rhi61HQRW/SnJgmt9P5QT/fdXGseLztEfqyh
         4XBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG3KgU75BRKvP6dsFxmPpPWhU0LHxQ8PtKgjq7HL+J6H3N5xry/Ty6pUTL2OykVcwxnp64u0s+em+mCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4IywWb5/xZchnnwKQhNJkLAmTPl+kS1sn4aBu3CdKwul6iKnV
	YvYfHkUCWCqOat6ybr18ElzN/P5Ib5u+pc1iZ501D+rBt86IIpjNmvyeKoaJverDd+5GXOSNfAW
	HifzRIS8H+NtHB9yBNlW/PjNS3wccxUcc4FtO
X-Gm-Gg: ASbGncvNl9zLNpZ3/5tMdaXH6NW/Sd1R+wDhU2RATaZcSyYur/Ox8kRuW1U739kibqr
	ZQcuDJ1bn/RICR+xKQxA5V8q1SLfyDxiW4qEjVpxUht2lcJDEPSupYs3U80L4WlkYWACsedyUkp
	o21VmC0glT5yGNtu+xKHqIVfXi2eEC7PJRdUYJXg3b3Q==
X-Google-Smtp-Source: AGHT+IH9YYIhQ2kcoboqYRDMfycyNj08NRKFCI4fFbe2UUp4pOHt+BAaqViOcJBZNvLwkoYYANUPardYxyh3mJEpChM=
X-Received: by 2002:a05:651c:2206:b0:32c:a097:4141 with SMTP id
 38308e7fff4ca-32ca0974e49mr27834441fa.13.1750769081975; Tue, 24 Jun 2025
 05:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623110035.18340-1-hansg@kernel.org> <20250623110035.18340-4-hansg@kernel.org>
In-Reply-To: <20250623110035.18340-4-hansg@kernel.org>
From: Daniel Scally <djrscally@gmail.com>
Date: Tue, 24 Jun 2025 13:44:31 +0100
X-Gm-Features: AX0GCFuq-9UJLnt0mRa2xxCwp7cVuu6yx3E6pewiLmXuXtXycTcQBx9hKdXGPq8
Message-ID: <CAFLoDVEaXASPCUr6sBTSc+OwrEeDwsUQdgqmrZJLNqjkNEnA+Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: ov8865: Improve error logging when fwnode is
 not found
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 12:00=E2=80=AFPM Hans de Goede <hansg@kernel.org> w=
rote:
>
> From: Hans de Goede <hdegoede@redhat.com>
>
> The ov8865 driver waits for the endpoint fwnode to show up in case this
> fwnode is created by a bridge-driver.
>
> It does this by returning -EPROBE_DEFER, but it does not use
> dev_err_probe() so no reason for deferring gets registered.
>
> After 30 seconds the kernel logs a warning that the probe is still
> deferred, which looks like this:
>
> [   33.952061] i2c i2c-INT347A:00: deferred probe pending: (reason unknow=
n)
>
> Use dev_err_probe() when returning -EPROBE_DEFER to register the probe
> deferral reason changing the error to:
>
> deferred probe pending: waiting for fwnode graph endpoint
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov8865.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index 95ffe7536aa6..a2138f7988aa 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2991,7 +2991,8 @@ static int ov8865_probe(struct i2c_client *client)
>
>         handle =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>         if (!handle)
> -               return -EPROBE_DEFER;
> +               return dev_err_probe(dev, -EPROBE_DEFER,
> +                                    "waiting for fwnode graph endpoint\n=
");
>
>         sensor->endpoint.bus_type =3D V4L2_MBUS_CSI2_DPHY;
>
> --
> 2.49.0
>

