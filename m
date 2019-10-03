Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85B5DC98F5
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 09:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfJCHYa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 03:24:30 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:57675 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfJCHYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 03:24:30 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D3A3A40010;
        Thu,  3 Oct 2019 07:24:26 +0000 (UTC)
Date:   Thu, 3 Oct 2019 09:26:10 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 2/3] media: ov5640: Fix 1920x1080 mode to remove extra
 enable/disable
Message-ID: <20191003072610.2vfji5pdz5ochxvd@uno.localdomain>
References: <20191002135134.12273-1-bparrot@ti.com>
 <20191002135134.12273-3-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="j2ofayquysxcif4h"
Content-Disposition: inline
In-Reply-To: <20191002135134.12273-3-bparrot@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--j2ofayquysxcif4h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Benoit,
   good catch. I wonder why those power down/up sequences where only
set for this mode...

I also wonder which kind of power down mode do we enter, if the chip
is set in 'software power down mode' with 0x3008=0x42 at the beginning
of the register blob write sequence, and we still can successfully
program registers..

In any case, assuming 720p still works:
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

On Wed, Oct 02, 2019 at 08:51:33AM -0500, Benoit Parrot wrote:
> In the 1920x1080 register array an extra pair of reset ctrl disable
> re-enable was causing unwanted init delays.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/ov5640.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 5198dc887400..103a4e8f88e1 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -492,7 +492,6 @@ static const struct reg_value ov5640_setting_720P_1280_720[] = {
>  };
>
>  static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
> -	{0x3008, 0x42, 0, 0},
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x11, 0, 0},
> @@ -520,7 +519,7 @@ static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
>  	{0x3a0e, 0x03, 0, 0}, {0x3a0d, 0x04, 0, 0}, {0x3a14, 0x04, 0, 0},
>  	{0x3a15, 0x60, 0, 0}, {0x4407, 0x04, 0, 0},
>  	{0x460b, 0x37, 0, 0}, {0x460c, 0x20, 0, 0}, {0x3824, 0x04, 0, 0},
> -	{0x4005, 0x1a, 0, 0}, {0x3008, 0x02, 0, 0},
> +	{0x4005, 0x1a, 0, 0},
>  };
>
>  static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
> --
> 2.17.1
>

--j2ofayquysxcif4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2VopIACgkQcjQGjxah
VjwSrw/8Dp2tzyCmSdWHALdBJ7ipgw0f7ok8fy0AQjIYLWn3elVL866oMKP98c4m
pfQujjDPDPmcLb2zCH4MqvGEsy5VYw87LCSHeoEXVydWAKYEoD8QMayofHPGMOTE
LgTOIFLTptjVsscnVgeOmaN6/tFsqGBkaMJAOCnXIFO0w3ZGadrTLfu9VmmDdJuS
L7BYM10HfBVWv12E88DD0WC5mxrYu77nLNheaV5nCAuI0UprZgKLnNSMds+vXi+b
Iu4uTbDeVQgZECm8JJrgTYE5l85W5ldtt1CDCjAtVNxYqze4Fxk3uQCpEzHWIlwK
71E51UlRnxpKC7FyhgxzFzBmMjPZY8N4m42czDtkHOSUcWa4Zj1P9zVjJQ3eqN9E
Mlj6qAjTMYrdN5Dzot8UsRvTMAvn0y3qmfAL3nogy4WHYLrQNBlTM6S+g7sL3lfG
Drl7JDtq0swRKk9d2kkVu3Gy6fBQz9/BtkUG2sUFe0lv2roncXl+VtdQrOu37FKi
3by5PvyjmB17VYUdxbz1GYrk6N8gISbg4/LPUGTR3aAcuy8zUJNNQFPsTcPV10/T
mw3kbEw/nrhjZHUGxIyttqs65gop7URYBQElCGeSx855RzegjiOn5r5NXZVoJl2j
qSfoMBktqVBVmLLsupc9vVb5zFNn+hcusrkGZPpG5Ol0/DSoqDw=
=6rCH
-----END PGP SIGNATURE-----

--j2ofayquysxcif4h--
