Return-Path: <linux-media+bounces-12959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C23903FD7
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 17:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC6328290D
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 15:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A2D208AF;
	Tue, 11 Jun 2024 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="G1I5g/of"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D5917554
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718119152; cv=none; b=HT38F5gtasrP6zbROPI8z3Lcb+WvywtvhUyuvXgOiIERka8d4uFm3zuFFfO2i3gBbUXeOZWcfpEZ37reoEx+Kev5DaJTUUfWESkTEcvU9vWUI3GD+c/BD89aal8vcLkEO3ZB36LGdVjviV3LxD6fX4jJPPemYMVNQ0MVjVX4HwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718119152; c=relaxed/simple;
	bh=nZBnie7/9yW63lBsCc3eXsSO8y38QNlz/K+eQllR9WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBLHPdPuTa8RwVtGJqxTA1n6fTwM9S/su6KOg+aNk5c6OYFpwZBU8fUnKNBwIb5sNimy41bIufax+GGSGlOGOB9ExdjCM1sElQqqJitdoRPLiQiIUQpspcRU5wMHkQtJGgnoxxZUH4/tSqKVcEw4D/RoDhAEcgjWRQ0RYEE4IKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=G1I5g/of; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfa48f505dfso6270994276.3
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 08:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1718119150; x=1718723950; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M10CbUZmXB7Dee3D7sJ9T+X7/UYDjZpP4+Wii7wbA+4=;
        b=G1I5g/ofopLBTUnpl6cUM9rW6fDK11dJ03MW6Qd44pfsMa2i38oGeG2gy8jz94cHvz
         YihGr3NM7pu0Fc5Jjr8T3hYhZ/a7ANLU95XTqlq0Ep1D+uQsyDYk0pPSyk9dOpKM28M6
         VHwG+fjoaUJVuvdnTJVFSA+IGimTenrZwnqZVHlv7W3CXYDls6CUnz57Ulyug/3FggeT
         SAud/Cu4nGPJr2PyC9K951ZIRfvaUwNtA3Ib7ZLpAYSBpR2MZS+m5xpN2CFQr4Ks8qom
         dGo5sH9z4w15EbWzFZ+3Igvs36CSgcAEZ/CsrqSj7Rrz1TxWSpjclSmj4Y5KSH7M9b43
         F1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718119150; x=1718723950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M10CbUZmXB7Dee3D7sJ9T+X7/UYDjZpP4+Wii7wbA+4=;
        b=Cw/IUNz6XqNgbIF1PwGti6Kemm+PPKqpAzwWdhCdMHbJUCBqBNRnfKOjK093akG3w1
         i2/euOzrSnBTEUew8be+6Ra1pRqAfO88/t2Yz+zaORH5cFdhJJUzLtmC1KSG2YPPcexV
         PPzddWshjRLB90fMK7rg9zmOH/XW2gJtl9XR96EZJc+wzemS++iqYWQGvtJLm+ubJMtY
         X8o/BjMgWS4r9ZquzvtKAYeJlmeJD0AJ1XfjNFp+m3CJAeR1jAJp5K9sPKpJIo8L2dwa
         70qP0ypiIEi7b7DaqCKQdvyxrR317TM2ZWuqufDg5GqaSQ12b4XgVWJhdymiECUy+98A
         a1uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS/ZAxWYVEidkkcz1zun7ZlzR6dVyqfCoSYwbOtHQ0ASmJxE3mZH7Jt/9UlUGHTeBkmUV2BzKNXvW5i1P/Fjc8yLlcrR8ajd2nzaQ=
X-Gm-Message-State: AOJu0Yx7C/qTzyHtx+N3uV8WMQYg+p8h3G0Ez1+Bj4sYrAPg4FbhLA2M
	mUbHKgo9n+gpPGdKLSwcI2FemjyUVhcvc4IqslxdCpwrHItv1+dR40TGYrgCMD0AWcXt3n0/9nK
	+noX2nJe3xCvNKTOABjvwd5P6g9Flkwy3UzAWrg==
X-Google-Smtp-Source: AGHT+IGZktdb+mXNwm5zMn5WZrRMM33fN6s00SSt7So0FNfjBJkDtcWY/jhchu4Ql1yDEY/OiyCWdDlQcY7P67hPaog=
X-Received: by 2002:a25:4982:0:b0:dfd:b3bb:ac11 with SMTP id
 3f1490d57ef6-dfdb3bbaedamr816466276.59.1718119149436; Tue, 11 Jun 2024
 08:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510100324.5961-1-abdulrasaqolawani@gmail.com>
In-Reply-To: <20240510100324.5961-1-abdulrasaqolawani@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 11 Jun 2024 16:18:53 +0100
Message-ID: <CAPY8ntCWoq6UMns04W6-BmYtCHggVr4xqZjOX1bcZtwyO-2EEg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: replacing of_node_put with __free(device_node)
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Cc: sakari.ailus@linux.intel.com, jacopo@jmondi.org, mchehab@kernel.org, 
	julia.lawall@inria.fr, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi

Thanks for the patch.

The subject should be "media: i2c: ov5647:" or just "media: ov5647" as
you're only touching the one driver.

On Fri, 10 May 2024 at 11:11, Abdulrasaq Lawani
<abdulrasaqolawani@gmail.com> wrote:
>
> Replaced instance of of_node_put with __free(device_node)
> to protect against any memory leaks due to future changes
> in control flow.
>
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> ---
>  drivers/media/i2c/ov5647.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 7e1ecdf2485f..d593dba092e3 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1360,23 +1360,19 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
>         struct v4l2_fwnode_endpoint bus_cfg = {
>                 .bus_type = V4L2_MBUS_CSI2_DPHY,
>         };
> -       struct device_node *ep;
> +       struct device_node *ep __free(device_node) = of_graph_get_endpoint_by_regs(np, 0, -1);

The media subsystem still requests a max line length of 80.
https://github.com/torvalds/linux/blob/master/Documentation/driver-api/media/maintainer-entry-profile.rst#coding-style-addendum
Break the line after the =

>         int ret;
>
> -       ep = of_graph_get_endpoint_by_regs(np, 0, -1);
>         if (!ep)
>                 return -EINVAL;
>
>         ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
>         if (ret)
> -               goto out;
> +               return ret;
>
>         sensor->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
>                               V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
>
> -out:
> -       of_node_put(ep);
> -
>         return ret;

This could be "return 0;" as you've already returned if it was non-zero.

I know very little of this new mechanism, but it looks reasonable, and
Sakari has given it a basic blessing in a previous patch set.
With the above 3 comments addressed:
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

>  }

>
> --
> 2.34.1
>

