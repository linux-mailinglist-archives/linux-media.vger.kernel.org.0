Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F19DD5B0848
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 17:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbiIGPR3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 11:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiIGPR2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 11:17:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05E274CEC
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 08:17:27 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwnt-0000CD-PH; Wed, 07 Sep 2022 17:17:25 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwnt-0007ON-Dp; Wed, 07 Sep 2022 17:17:25 +0200
Date:   Wed, 7 Sep 2022 17:17:25 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [fixed+RESEND v8 0/4] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <20220907151725.GG18739@pengutronix.de>
References: <20220907150457.2572474-1-m.grzeschik@pengutronix.de>
 <Yxi0rYshyU6hCoWE@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AGZzQgpsuUlWC1xT"
Content-Disposition: inline
In-Reply-To: <Yxi0rYshyU6hCoWE@kroah.com>
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


--AGZzQgpsuUlWC1xT
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 05:11:41PM +0200, Greg KH wrote:
>On Wed, Sep 07, 2022 at 05:04:53PM +0200, Michael Grzeschik wrote:
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
>This really is a "v9", the use of RESEND and "fixed+" will play havoc
>with our tools.
>
>Please fix up and try a real v10.

So everyday I learn more how I can spoil your workflow though. ;)

I will send v10 then.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--AGZzQgpsuUlWC1xT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmMYtgUACgkQC+njFXoe
LGRTphAAtMgCTYlzR/bzdBDpXaWoq5D1aBttN2WIk4zJwCFY/AJZ8I1+7aYRHdEK
A86w4FrE6mKfMo8AExAqr9UmVyFySPsJvrkzr/V8t/5al4ID8ReyovDnhQRQ5IEQ
PlgnoWHmmnlDxO3w+08e0JZZgeNV/O8vlqe5rlbLKGfmhk/Sw5/TkWszQ3VY6OU4
nLKTKdmE3Wb8FKH+6NgYdfglGgo5n7X7zUlUq5yF5no3IIQvNHcfDGexiInop1YJ
vkyQ1RPUUq5d7XdJY2II13npLN5AADsRvtN4omfA66XNs6UNREoOrYxjKZ02aclF
fYt8YcD7ZQi93YAWaIJyLdbFeRWF7KEMt8P8DvGUFRbUIkTerpZ4zYCbE/ByOMbK
boBmdA9DVMnqERkXqJbRlBVW7t0TH0eg7iNPSKe0kLh1jWtwH+5xRbyj7a/3f3lX
zlRjic7AE1Bf/SCQUALLc+n0q6QWwj2etGY2NBA8vEuJBbfveZRi6lZlyxO3Sd/g
pRhhIz6az0VhR8YrU9l4e0HwnZcTFQ70E+fYYlgZP0iucioPph9XSTjYF9m2CmsV
RHfX3tcVmhQ8IBK+rSL8cAfQnWx6GCovhK9bNXVfUbTSfjJU0pwC6r0pxV6d+z9w
yB8Vra7R6MSr1PPUL99aXNWc2DFJ7Y9dVSz53wPOv+TkclxmWO8=
=O91U
-----END PGP SIGNATURE-----

--AGZzQgpsuUlWC1xT--
