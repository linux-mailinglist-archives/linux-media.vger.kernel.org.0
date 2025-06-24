Return-Path: <linux-media+bounces-35778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B04AE654A
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728DF192232F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902C0291C1C;
	Tue, 24 Jun 2025 12:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yz5XQTTt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4711A01B9
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 12:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769066; cv=none; b=nBUGQciqByHCzDMCzVoGBHg0qK8XouNOxOX61c1lLImipPOnJ8oCAXn1pslFOI0Bo8jtOWg5F6t4kSen0G1FEC5UdaY9Sbp6cL6TzrSWTQCLw9QK7zzoPSDdDjHPxNKZsDa+svKkBKBODIaYaKxNyCuVC2iVAlpk4R6qrf5/KfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769066; c=relaxed/simple;
	bh=5lZz1RbMP6u8JXo19bewpSw/NjpcyQCIgr1DNvl87MM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fg4HOcRjECgJFGLY8R0HpuROWGyOyfMPz0qHyqRuLbtsn7hy7wKTixoY0qwzAvzx+MgcRSpcJs4dkJ6+UyjIJ6pO0HEks90LtIPQjzzlQyvoRCI2bSTZI2Zx40tS20cOARHGPmVVNTty5BVdeBZpJ0GmY8FFAN1Cr7NxkpTCjKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yz5XQTTt; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b3b250621so3512931fa.2
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750769062; x=1751373862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtbynKyytB3di5m8QvQIDiAM/JhUY/5xbkZoGkHcNzY=;
        b=Yz5XQTTtm/Ybf39NDN9HELamnfp59ugBwFTts6wFxHYqguewkKtbmvGftB9U2zMMG/
         j9/6IHi//Mi1cQlCytNTVVlXKUEflDba9lH5zEg79Nxn5QjjOVSm3/eVkq7YzgSYh88Q
         j7HC00XCZMKktW7/LwwBbkyws1RpaaXIMMGdIDeJ/EWrGyawtUmSxN4q0ItoEiiB8CLk
         pWlfuDXGm7G5KIFDO4+V0M6hDOcUBdh9Xo8YAHj7CbXZzWRRJWTrRRNF96oiZbt/dZh6
         nOKwUid9DWOd+uo9/LpVjYaxmpKKqhdM8JShS0uKItq2JjzsAfSNVyu2TqjwaLvHNwFr
         u7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769062; x=1751373862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtbynKyytB3di5m8QvQIDiAM/JhUY/5xbkZoGkHcNzY=;
        b=Qb7xGGJclet8m7Y9O0s2iZcQTYaMGr2eEsG7pXtnaTU7cEZXOAA33a93SBKZS0f043
         ixwE3IMIZz56T0iddcpmuUhhoTtkUOAkJ89O5CwyhjjE1ys0410H3JElojmtb+riDZwU
         tCvaR4jq5esE7cAq1i4+Re2E70bX3lxj4BRMiuuigwUUmWPzKAhUYTpDrxkUKp+mwrsI
         HN6C5rcUn31nhwqsrG/QIOAnDeLWW5ZnBvBWZsnv5ORYavyRiJV8pM9fV/uNIoUHGl4q
         kSodnFiub/8QqlCM2NBntCPmqiTmDAEuUB6iqqBtHEwE5vR0IQghAW9W9lX04WUqYEF3
         j00Q==
X-Forwarded-Encrypted: i=1; AJvYcCWp6vAUkkBdstubDwxDpGTlMLdHN4RvkbmSQZCBBa1EQR7bPxwurvOytTS7x/o1lBkTLtGW5enPtPCHbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFPmH0k4Houlx/uEpCfJ3NJM+f/ULyxCUMzclSiYAjz1GfdE0Z
	w+tB9cH+i3iXCZaW77mv8w056o0f5huxMKRvexFzF7seBEqUvv5sEUb52QWRt1MRPJAnzqJwGgw
	Z2MfTRuv54P+5aCW7dj94WKKf0NiCpqI=
X-Gm-Gg: ASbGnct+ZZ1IABYLSHgWYTFnFxnU0gyl+Aje6qa7Bg6lJw7c8QN5DJ2+f403m6ZdvgT
	nVcJ76X6JfKxoX93qf3bbKBUpB7JsUVr0fDKj7XWtSXjDXyrpK31VUQyPQp8RXlwZY6WD7OZdpR
	hVwBav02jN3Y6v9Q54uFcKlIk6cUMK7xTijHSdjvK2vA==
X-Google-Smtp-Source: AGHT+IGLyK4pVymc/p+fQP4XCE8eV4XoRVULBoVud7QzjJuxisXohXxj8NSRPX1sBdjGUmRmk4QnRucX0eXxbkr41yY=
X-Received: by 2002:a05:651c:111b:b0:32b:2fe7:afd0 with SMTP id
 38308e7fff4ca-32b98e735f0mr39537601fa.17.1750769062343; Tue, 24 Jun 2025
 05:44:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623110035.18340-1-hansg@kernel.org> <20250623110035.18340-3-hansg@kernel.org>
In-Reply-To: <20250623110035.18340-3-hansg@kernel.org>
From: Daniel Scally <djrscally@gmail.com>
Date: Tue, 24 Jun 2025 13:44:11 +0100
X-Gm-Features: AX0GCFu0bkYlQghwAEhDo8QDM6K_1_G7XgzHRVXzCweier3CqwhnldwjlfVCekg
Message-ID: <CAFLoDVGTwLCoG1HTcqPsPunit5mjV28SH2qznm1=cMBfx6+Q3A@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: ov7251: Improve error logging when fwnode is
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
> The ov7251 driver waits for the endpoint fwnode to show up in case this
> fwnode is created by a bridge-driver.
>
> It does this by returning -EPROBE_DEFER, but it does not use
> dev_err_probe() so no reason for deferring gets registered.
>
> After 30 seconds the kernel logs a warning that the probe is still
> deferred, which looks like this:
>
> [   33.952052] i2c i2c-INT347E:00: deferred probe pending: (reason unknow=
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
>  drivers/media/i2c/ov7251.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index 3226888d77e9..31a42d81e970 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -1486,9 +1486,14 @@ static int ov7251_check_hwcfg(struct ov7251 *ov725=
1)
>         unsigned int i, j;
>         int ret;
>
> +       /*
> +        * Sometimes the fwnode graph is initialized by the bridge driver
> +        * Bridge drivers doing this may also add GPIO mappings, wait for=
 this.
> +        */
>         endpoint =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
>         if (!endpoint)
> -               return -EPROBE_DEFER; /* could be provided by cio2-bridge=
 */
> +               return dev_err_probe(ov7251->dev, -EPROBE_DEFER,
> +                                    "waiting for fwnode graph endpoint\n=
");
>
>         ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
>         fwnode_handle_put(endpoint);
> --
> 2.49.0
>

