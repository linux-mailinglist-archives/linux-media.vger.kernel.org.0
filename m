Return-Path: <linux-media+bounces-5356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 219F18590BC
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 17:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A8B0B21787
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 16:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152097CF13;
	Sat, 17 Feb 2024 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ub09LUBa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3E97C6D2
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708185613; cv=none; b=sr8opseyVOBmC66CgI+8vuuLrdXxhA2NvlcRMYwuWTt23QEUhQhkzUOVI0h3E70COHpvQkxUV/xU8Z5vEvr9JPAwEsxEjfcspEZQCBwfz8PL3RiwXDX5jC+vtm9TcLY6deOCi87gm8ZdhgQZwt49jtxv3I4iBSPJszmYYRpGF5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708185613; c=relaxed/simple;
	bh=tcmVjcmYkBwgueRO+vmbHnHJZNEwAI7lNK5doJdSTeo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=A9LNc6foEUuCGkUVMj897QhrViCCJheSLaBJxtRE3xRzxc9WYzNk8agGr12VYfmI49pek5BjRjqizvKs0kdJQCtaXE143vlyi7AJ7W1t2moU2I3rrA40/iy6WRhbLHV9RTpGU1OU/26gVZOzv4rdxl41JeNZd5UiXxS6bZVVgFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ub09LUBa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A080D13AC;
	Sat, 17 Feb 2024 17:00:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708185604;
	bh=tcmVjcmYkBwgueRO+vmbHnHJZNEwAI7lNK5doJdSTeo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ub09LUBaFWCssTZJ0dnL0J89lSZUN1TPPQxHNvrTB9jDsP7NKECKlVG2isBRH2cby
	 eRUWJCrKsmsR51F1N6pzvfZIbjz09NT1gomF/R8sTWs6fx1m2e3pcrv+8emFJdsshc
	 v2xbYMYycUD0JCmIx3DfWoztyWGRfmPD2w46iigs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240217112438.15240-8-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com> <20240217112438.15240-8-hdegoede@redhat.com>
Subject: Re: [PATCH 7/9] media: atomisp: Change ISP subdev name to "ATOM ISP"
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 16:00:07 +0000
Message-ID: <170818560760.1206667.14199319396527835603@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-17 11:24:36)
> Change the generic "ATOMISP_SUBDEV" name to "ATOM ISP" to make clear
> that this is the subdev for the ISP itself.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers=
/staging/media/atomisp/pci/atomisp_subdev.c
> index 8253b6faf8cd..822fe7d129e2 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -799,7 +799,7 @@ static int isp_subdev_init_entities(struct atomisp_su=
b_device *asd)
>         int ret;
> =20
>         v4l2_subdev_init(sd, &isp_subdev_v4l2_ops);
> -       sprintf(sd->name, "ATOMISP_SUBDEV");
> +       sprintf(sd->name, "ATOM ISP");

Pure bikeshedding, but I'd probably lower the shouting to just=20
	"Atom ISP"

Either way saying it's a subdev on a subdev isn't much of a value add so=20

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>         v4l2_set_subdevdata(sd, asd);
>         sd->flags |=3D V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEV=
NODE;
> =20
> --=20
> 2.43.0
>

