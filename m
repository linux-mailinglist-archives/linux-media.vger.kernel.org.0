Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3316A1E0C9A
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 13:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390051AbgEYLNb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 07:13:31 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43878 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389897AbgEYLNa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 07:13:30 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 34B011C02C4; Mon, 25 May 2020 13:13:29 +0200 (CEST)
Date:   Mon, 25 May 2020 13:13:28 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>, tfiga@google.com,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v11 01/13] dt-bindings: video-interfaces: Document
 'orientation' property
Message-ID: <20200525111328.GD27989@amd>
References: <20200509090456.3496481-1-jacopo@jmondi.org>
 <20200509090456.3496481-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n2Pv11Ogg/Ox8ay5"
Content-Disposition: inline
In-Reply-To: <20200509090456.3496481-2-jacopo@jmondi.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +- orientation: The orientation of a device (typically an image sensor or=
 a flash
> +  LED) describing its mounting position relative to the usage orientatio=
n of the
> +  system where the device is installed on.
> +  Possible values are:
> +  0 - Front. The device is mounted on the front facing side of the syste=
m.
> +  For mobile devices such as smartphones, tablets and laptops the front =
side is
> +  the user facing side.
> +  1 - Back. The device is mounted on the back side of the system, which =
is
> +  defined as the opposite side of the front facing one.

Well.. except we have devices where camera is both front and back
according to this definiton.

https://www.gsmarena.com/samsung_galaxy_fold-9523.php

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--n2Pv11Ogg/Ox8ay5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7LqFgACgkQMOfwapXb+vIGvQCgoylsLQEGO0m8Rjgchsg82sBw
/jUAoIf0h2EdDgo6rM6yiLU+PoaciKII
=D/Db
-----END PGP SIGNATURE-----

--n2Pv11Ogg/Ox8ay5--
