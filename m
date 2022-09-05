Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D06465AD244
	for <lists+linux-media@lfdr.de>; Mon,  5 Sep 2022 14:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237434AbiIEMSJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 08:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236255AbiIEMSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 08:18:08 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8375E5E664
        for <linux-media@vger.kernel.org>; Mon,  5 Sep 2022 05:18:03 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 69331100004;
        Mon,  5 Sep 2022 12:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1662380281;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jzdP7OoCNDNfrX/zCfTjut2DkzwVDtUGB1M55FU9NHc=;
        b=cLotvlI1scELI3DxZfsUJ+5G6EkA4ljr6J5qOozZGypa1W0u3O8j2sDQPpI7oWtk8nt+Ek
        zB39zZwaZCu+QUc6rDSGNJ11iepZr/GH9/RFL3+Q2eVba0J61/RwLCRdm9oKnlA+7hGk0R
        OoIsB/CGHc1WKWo64+tshA6Cy7TJrfrT2BHUOcDrDu4K77sBTlAofAem+xIwfxN9EJuRw8
        IcUN/1T3R8MWbaMYYw51IjKVccOcX61REy5SsF72JFiz4NPtetEfRcYKg+d2hxoRugUHgt
        1ekzVzoL5KBfNjS+d3BN+kN1FpX7mdwsOs+VRg/441o5QEF9h2diopO0kEYnag==
Date:   Mon, 5 Sep 2022 14:17:55 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     mripard@kernel.org, linux-media@vger.kernel.org
Subject: Re: Cedrus -- video encoding on PinePhone?
Message-ID: <YxXo8+Bjqp6JknqA@aptenodytes>
References: <20220902134039.GA27386@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0zzNEqjiKQfB9Mf5"
Content-Disposition: inline
In-Reply-To: <20220902134039.GA27386@duo.ucw.cz>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--0zzNEqjiKQfB9Mf5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pavel,

On Fri 02 Sep 22, 15:40, Pavel Machek wrote:
> AFAICT... PinePhone should support hw-accelerated encoding of JPEGs
> and h.264...? But driver is in staging, support for encoding is not
> there, and userland support is partly available for decoding but not
> encoding?

That sums up the situation yes. Also we don't have accelerated JPEG decoding
either although the hardware is there too IIRC.

> I guess that adding the encoding support and the userland stuff is not
> a stuff for weekend? Main camera sensor does have JPEG support, so
> MJPEG video is possible without cedrus, but h.264 should provide
> better compression and there's no JPEG support on selfie camera.

Indeed supporting the encoder is really not an easy task.
There's significant difficulty due to lack of knowledge about the hardware,
but also due to the lack of proper userspace API for stateless encoders.

I gave a talk on this topic some time ago and there should also be a video
(probably on YouTube):
https://bootlin.com/pub/conferences/2020/elce/kocialkowski-supporting-hw-ac=
celerated-video-encoding-with-mainline/kocialkowski-supporting-hw-accelerat=
ed-video-encoding-with-mainline.pdf

Encoding in MJPEG doesn't seem very viable, or maybe only for very short cl=
ips.
Also note that a big factor for encoding videos from cameras is the reducti=
on
of noise: the usual level of noise coming out of the sensor makes it very
difficult to get reasonable compression rates.

On Allwinner there's an ISP that can be used for denoising in real-time.
I've been writing a driver for it, which is currently under review and will=
 make
it to the mainline tree eventually. I've only tested it with Bayer input, b=
ut
the hardware should also support YUV input. Denoising is also supported in =
the
driver. There are lots of other blocks that are currently not supported tho=
ugh.

See this talk on the general topic of the ISP:
https://bootlin.com/pub/conferences/2021/elc/kocialkowski-advanced-camera-s=
upport-allwinner-socs-mainline-linux/kocialkowski-advanced-camera-support-a=
llwinner-socs-mainline-linux.pdf

I hope that gives you enough pointers to have a clear idea of the situation!

Feel free to let me know if you have follow-up questions!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--0zzNEqjiKQfB9Mf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmMV6PMACgkQ3cLmz3+f
v9EUxwf+PiPzcZbvwQwobP06UcPgshAYlZKvfF4iFptwP0m6i0e7uehU68umg5Kv
46su49BVnx8JVJeCZPqo3KXDFJklL3YdIJTpEXRrfIT35WURwKAgwZODvTyJjUUn
zoumKaSIAiHbDIjzTuSMyN7lZulG/gBXNZ2nkEUbRrskwLlhcCNE22pnnPCcR+J6
w5SnRx9Zls7n7vJ2Cb23nMDG7V3KkoqXrXF6e66JKPkNTKC0OsBixJiCInk5Toi3
n8eEDUKFkcUFj75x4lpWrmPeKFSfPBFjQIIKajYZLRZBp2rubwlzauZjbSjaQwQN
JvDXYeyCLy4X+wieu3Y3ZrHpX8HQDQ==
=6qAJ
-----END PGP SIGNATURE-----

--0zzNEqjiKQfB9Mf5--
