Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFBD6C9902
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 09:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfJCHaP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 03:30:15 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:38729 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfJCHaP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 03:30:15 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7F46720000E;
        Thu,  3 Oct 2019 07:30:12 +0000 (UTC)
Date:   Thu, 3 Oct 2019 09:31:55 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 3/3] media: ov5640: Make 2592x1944 mode only available
 at 15 fps
Message-ID: <20191003073155.4sl3jkmobnm53tm2@uno.localdomain>
References: <20191002135134.12273-1-bparrot@ti.com>
 <20191002135134.12273-4-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n5rftw743bmspsmn"
Content-Disposition: inline
In-Reply-To: <20191002135134.12273-4-bparrot@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--n5rftw743bmspsmn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Benoit,

On Wed, Oct 02, 2019 at 08:51:34AM -0500, Benoit Parrot wrote:
> The sensor data sheet clearly state that 2592x1944 only works at 15 fps
> make sure we don't try to miss configure the pll out of acceptable
> range.

The datasheet clearly indicates that 15 fps is the maximum achievable
rate with that resolution, so I guess preventing it from being set
to anything faster than that it's acceptable.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/ov5640.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 103a4e8f88e1..d5b0be2c7a0a 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1613,6 +1613,11 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
>  	    !(mode->hact == 640 && mode->vact == 480))
>  		return NULL;
>
> +	/* 2592x1944 only works at 15fps */
> +	if (fr != OV5640_15_FPS &&

As long as 15 fps is the lower framerate declared in
ov5640_framerates[] this is ok, but I would make this condition a
check for "fr  > OV5640_15_FPS" so that it's safe for future
extensions.

(And I would check for the resolution first then FPS, so you check
the most unlikely condition first, but that's really a minor
optimization).

With the above small details addressed
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> +	    (mode->hact == 2592 && mode->vact == 1944))
> +		return NULL;
> +
>  	return mode;
>  }
>
> --
> 2.17.1
>

--n5rftw743bmspsmn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2Vo+sACgkQcjQGjxah
VjyJKw/9Gz/lz6Mb9xgW4HAr0QAEBl3gR9e2mbU14RmyMNI78KyX+Ygnl9b6rllZ
FKl36MewrCwPiVFbOWcOtCTNuoCC+I4t7HZCCR+cY/sSJmSm/jspU7RvJ/5dR4xU
t4HdpbARvjSjII6jicou6wcQlEo4NCkhuQuerzZPWXoZBcJ5dq3NfadWlvcqJVcP
3RuSt65oOxchYT7FjnqTyOrVyf6+z5XLAYCmhqDweDYR3VhGeJB/+OGqYSQ0SYnz
OmWm6pvpa38+Bo0IGgK8drYCP5rzKlSV0yNnjrxy21XOvW8wLTZXvsPG/8fnupvd
OSEczRur15CJLm/J23FnTbTGrJFivvT8LqQeKr748dSvDIZRQgELO3UiDhntV5fr
Vv7rTIBx0VyGhprM8p3ZDB/JFcxE02Cz1Y/wpjV+ccbfxwXGMg4vbTSwwzCWS1/7
kYi+EX8Qc2jJ0v5KWDpn1Zbz2zH7klvD5KMcxP/KvMX/1uIOObCZMedukzDuwdwD
BCdaSKbiyW//QS8ZkCKv39NnyA1qSiBtH2gwzhKBoH6eHrplumD4JPJZXvfxoOGj
J1nJCmgQ8xUP8W6l8qe09aiE+W5jS+tY+++UrgN6vIuMONmE2kMea0TM4NkcIntZ
9lDuCK2XhHRpULsvLKfeWNgBSCnQFQgyVH6n/RaQCLKqE0qe7SM=
=r89m
-----END PGP SIGNATURE-----

--n5rftw743bmspsmn--
