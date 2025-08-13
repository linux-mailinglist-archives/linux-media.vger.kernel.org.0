Return-Path: <linux-media+bounces-39794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A3B246F9
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99F591622C7
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 10:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BCF139D1B;
	Wed, 13 Aug 2025 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c632ckEl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611672D6E4A;
	Wed, 13 Aug 2025 10:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080166; cv=none; b=YQRuDjmGBXXRnmjttyemZOiMQXzQ5VJtkw8G17XEy4qSmbWMeE3pyQGbRa1DUoIkcVyioV9EhFfHMVx3+krK7fRm+cQxiyT7xb7hddp6EgrMhpP1sSLnsKAg0oeGUJVMpe9HNeGkVU5wZ6RmOVnvgC6XNWdZccLNyiT564qWt9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080166; c=relaxed/simple;
	bh=CfWL7rN1Qc5unQz3vGJmOT7xDk62DnANT+vxThseTQA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DQlOAfDZU4nolNhVTNX5LKC0LjmOLjuHcKZmDLQew71UzRU4oOkV598eZmTaQtyTmfuN3Riv2IiyOPY5C6k2vAPD2+wFNa5CUa6LUqTl42ExEQPNUNqGxyiVB0+nWnZH/9ATJD0on3Hq0TQPOK0hxW5Z2WTZx+ClkJtkpRCF5BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c632ckEl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 345252EC;
	Wed, 13 Aug 2025 12:15:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755080109;
	bh=CfWL7rN1Qc5unQz3vGJmOT7xDk62DnANT+vxThseTQA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=c632ckEl1nFq0XxeNqRyZP1st5GoEjYrFbhMLPp+9i28VHGmATzZGoVqh4cgp1e0b
	 CEyI+R9T9Zd69uQKZmDWBCGY5dbyF9RMOyy+izeqME548PIBaKt8G08qHo8W55LCRa
	 gsOPH/308FD2uJtmKYKkiJRlNhB9RTKbuHUVpt8c=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250813-imx335_binning-v1-3-a42b687d8541@ideasonboard.com>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com> <20250813-imx335_binning-v1-3-a42b687d8541@ideasonboard.com>
Subject: Re: [PATCH 3/6] media: imx335: Update the native pixel array width
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 13 Aug 2025 11:15:59 +0100
Message-ID: <175508015948.560048.7430206645162546917@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Jai Luthra (2025-08-13 08:20:34)
> The sensor datasheet reports actual total number of pixels as 2696x2044.

Err ...

Page 2 of the IMX335LQN-D datasheet I have says:

Total number of pixels: 2704 (H) x 2104 (V) approx 5.69 M pixels
Number of Effective Pixels: 2616 (H) x 1964 (V) approx 5.14 M pixels
Number of Active Pixels: 2616 (H) x 1964 (V) approx 5.04 M pixels

Where does 2696x2044 come from ?


Argh - then on page 8 - indeed it says
Total Number of pixels 2696(H) x 2044(V) =3D 5.51M


In imx283.c I've moved to defining these windows as a v4l2_rect. I find
that's a nicer way to convey the rectangles specifically instead of
through #defines and then they can be directly used to report crop
rectangles:

i.e.:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/dr=
ivers/media/i2c/imx283.c:

/* IMX283 native and active pixel array size. */
static const struct v4l2_rect imx283_native_area =3D {
	.top =3D 0,
	.left =3D 0,
	.width =3D 5592,
	.height =3D 3710,
};

static const struct v4l2_rect imx283_active_area =3D {
	.top =3D 40,
	.left =3D 108,
	.width =3D 5472,
	.height =3D 3648,
};

Not required - but just an idea (that obviously I like :D)


>=20
> This becomes important for supporting 2x2 binning modes that can go
> beyond the current maximum pixel array width set here.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 6369bdbd2b09ba1f89c143cdf6be061820f2d051..dbf2db4bf9cbfd792ff586526=
4c6f465eb79a43b 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -124,10 +124,10 @@
>  #define IMX335_NUM_DATA_LANES  4
> =20
>  /* IMX335 native and active pixel array size. */
> -#define IMX335_NATIVE_WIDTH            2616U
> -#define IMX335_NATIVE_HEIGHT           1964U
> -#define IMX335_PIXEL_ARRAY_LEFT                12U
> -#define IMX335_PIXEL_ARRAY_TOP         12U
> +#define IMX335_NATIVE_WIDTH            2696U

The all scan mode on page 56 doesn't show these at all.
Just 12 + 2592 + 12

But I think that's the datasheet being inconsistent/restrictive about
what it says an all scan mode could be.

It would be interesting to make a 'super resolution' output mode that
can transmit every pixel possible but not required for this series
development just for fun tests.

I'm torn here - as the datasheet changes it's points of reference to
make it's "all scan mode" essentially start at 0 which is clearly not
correct against the 'native' positions.

So ... I think I'm just going to say I think we don't believe the
datasheet as we *know* there are more pixels and we are using them so :


> +#define IMX335_NATIVE_HEIGHT           2044U
> +#define IMX335_PIXEL_ARRAY_LEFT                52U
> +#define IMX335_PIXEL_ARRAY_TOP         50U

I see you have taken the '80' extra pixels on both width and height and
divided half before and half after centering the window. I have no
information to say if it's position is otherwise so I think this is all
we can do:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>  #define IMX335_PIXEL_ARRAY_WIDTH       2592U
>  #define IMX335_PIXEL_ARRAY_HEIGHT      1944U
> =20
>=20
> --=20
> 2.50.1
>

