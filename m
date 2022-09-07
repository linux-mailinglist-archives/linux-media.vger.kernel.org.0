Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424335B0603
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 16:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbiIGODr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 10:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbiIGODo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 10:03:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010097AC2B
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 07:03:43 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVveX-0004hj-Q0; Wed, 07 Sep 2022 16:03:41 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVveX-0003al-GV; Wed, 07 Sep 2022 16:03:41 +0200
Date:   Wed, 7 Sep 2022 16:03:41 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [RESEND v7 0/4] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <20220907140341.GC18739@pengutronix.de>
References: <20220608105748.139922-1-m.grzeschik@pengutronix.de>
 <YxiclqKkPDQR8qMM@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline
In-Reply-To: <YxiclqKkPDQR8qMM@kroah.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 03:28:54PM +0200, Greg KH wrote:
>On Wed, Jun 08, 2022 at 12:57:44PM +0200, Michael Grzeschik wrote:
>> This series improves the uvc video gadget by parsing the configfs
>> entries. With the configfs data, the driver now is able to negotiate the
>> format with the usb host in the kernel and also exports the supported
>> frames/formats/intervals via the v4l2 VIDIOC interface.
>>
>> The uvc userspace stack is also under development. One example is an gen=
eric
>> v4l2uvcsink gstreamer elemnt, which is currently under discussion. [1]
>>
>> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/=
1304
>>
>> With the libusbgx library [1] used by the gadget-tool [2] it is now also
>> possible to fully describe the configfs layout of the uvc gadget with sc=
heme
>> files.
>>
>> [2] https://github.com/linux-usb-gadgets/libusbgx/pull/61/commits/53231c=
76f9d512f59fdc23b65cd5c46b7fb09eb4
>>
>> [3] https://github.com/linux-usb-gadgets/gt/tree/master/examples/systemd
>>
>> The bigger picture of these patches is to provide a more versatile inter=
face to
>> the uvc gadget. The goal is to simply start a uvc-gadget with the follow=
ing
>> commands:
>>
>> $ gt load uvc.scheme
>> $ gst-launch v4l2src ! v4l2uvcsink
>
>v4l developers, given a lack of review response to this series, I'm
>assuming that you all have no objection to this series and I can take it
>through my usb-next tree.

Since this will not apply anymore, I just send v8 with some minor
changes.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmMYpLoACgkQC+njFXoe
LGS1aA/6AqiMK4xjbdP6FpioTR2k9e44hI5dpUlr1QYZk+RwYSCpvvESNB2vIaM5
kauDtintQsHVLnZcob0z0sdDYhqu7HryhekSVdfDW+CtfMog+RgQJsKTuhCpiQ/4
2szX2s6rNuF0eRMHCOMiYFOret5ypaTSw5Oiq3GkAn8w1vluruZj8cP1NcRFr//w
u15jrZVPar/pZTVZdFuw1ei+OPheb+2rPJpaW5FhlaHJV21BGBwTmJRecjX9RrhU
dJLiaWix46kH450GntLehALeiSTHl0fZkwlRz7NjZuxl8RV50hQkWXntCu0O/E2s
9HqiyTzVZdtnIuaaayKomt7RKm7UQk71h+X4mcm7iGrwgHyGXqijr3Sgc3TSuPcp
8zxo0K7mLsAd1IVAxOv8u+RjmNp4EKk8ILoKn+Zy1XOucDHAd+QaihRmx68EKmFv
+MnGZP/ASv0iFVQmJdGZqhbXM+9aeecTB6nmtVQoC9etZjt9VP2M+hZSKJ2lv9IO
zsiIaxfCDUkF0KUn/xej32rYdaUlMlDQswxiF+du2k9OWBKX4RX+Xkl5Q9vCi9ph
8XmF6O83Z5T/FI05w9c84H6YBYWZMK1JiotBPHH0cSq8VZnBWoMBLri13Hwl0gF6
OF9LYCtI8LGmZjbdxiECo8TsE8gdTBFv1U2C3sogVvFVQruAC8A=
=4VDN
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--
