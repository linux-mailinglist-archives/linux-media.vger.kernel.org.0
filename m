Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2094CBDD8
	for <lists+linux-media@lfdr.de>; Thu,  3 Mar 2022 13:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbiCCMeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 07:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbiCCMeW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 07:34:22 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022B0179259
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 04:33:36 -0800 (PST)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id BD4DA1C0003;
        Thu,  3 Mar 2022 12:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646310814;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NfCyLvH75LI978wRkQUrVxF2aaBtfNdARPDjso3yvQY=;
        b=Nv9FCfbg/9QgO4MhrtbO+9kKeDNpABU7HWZY1ofnm9OnHZQNEZScrFoQ35s6qoZPhz2OXk
        kcB5vnr5WWX8FgMVEORpdcfzjlebVQU3Lp6sSJ9K1Xxjwmy5J8QjPfNBMVMF/8/LIYAtne
        OQQmUgI5CqO+O7I5yXfCvt7OAuz2uqBVnhe1VxMCALsfnDRTTBaHmCp3h/jsPTJ8mw1eVG
        JStW4NCjiAMSK/C2l0/cGSjb49x3Y1wbZbT8qWke2gGjPce1KJVwuYGN5gjgItOYBWaYjV
        8hYq8x8S/ywbhdcP4XExSmOytbH4RjyoQIY6V1Wg+H4eYrtbSlaPAfbF2VDmNA==
Date:   Thu, 3 Mar 2022 13:33:33 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com
Subject: Re: [PATCH v2] media: i2c: Fix pixel array positions in ov8865
Message-ID: <YiC1nYxqF5albMDm@aptenodytes>
References: <20220302222448.1373765-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EBrRJxaT5WMqgZzi"
Content-Disposition: inline
In-Reply-To: <20220302222448.1373765-1-djrscally@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--EBrRJxaT5WMqgZzi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed 02 Mar 22, 22:24, Daniel Scally wrote:
> The ov8865's datasheet gives the pixel array as 3296x2528, and the
> active portion as the centre 3264x2448. This makes for a top offset
> of 40 and a left offset of 16, not 32 and 80.

Thanks for this new version!

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul
=20
> Fixes: acd25e220921 ("media: i2c: Add .get_selection() support to ov8865")
>=20
> Reported-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v2:
>=20
>     - Swapped the ordering of the lines so the left offset is first (Paul)
>=20
>  drivers/media/i2c/ov8865.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index cfc726e0ed1e..b8f4f0d3e33d 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -457,8 +457,8 @@
> =20
>  #define OV8865_NATIVE_WIDTH			3296
>  #define OV8865_NATIVE_HEIGHT			2528
> -#define OV8865_ACTIVE_START_TOP			32
> -#define OV8865_ACTIVE_START_LEFT		80
> +#define OV8865_ACTIVE_START_LEFT		16
> +#define OV8865_ACTIVE_START_TOP			40
>  #define OV8865_ACTIVE_WIDTH			3264
>  #define OV8865_ACTIVE_HEIGHT			2448
> =20
> --=20
> 2.25.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--EBrRJxaT5WMqgZzi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmIgtZ0ACgkQ3cLmz3+f
v9HjGAgAhUJtBb2PZqojV3GTHC5ZyYwy3deipA7GWKwn1+9Tiinky9ianxBCsiGe
jA8v+5YR0+On1+1XQ/JJvpLY5rcg4F9aMlX9sA977kjg54lvGeSJW3n2U1R87C0P
NGWlhuYbNpR7vQCJOi0tOLp0gFZiP1zbCTxg0xbFhI9dmeEcmX837eJYfuCv+oU9
2mTQ+JEHkFE2wJhPLOA5cDeqE42O8Hwh+3jeEvN8cOODWA/EBvKLgg7ciR/QkoXi
wj4rt7pbGYcri9R7WCC77+NmwAFdNO22QrbRcT1HHeJ95CmFw1I8lXBfe8dHMA48
5KcTxK1pF6/A9ycxNoG0pvcbkHjA6A==
=hy6w
-----END PGP SIGNATURE-----

--EBrRJxaT5WMqgZzi--
