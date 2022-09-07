Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B285B0785
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 16:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiIGOwR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 10:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiIGOwQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 10:52:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58455A99D9
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 07:52:13 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwPN-0004J4-Ao; Wed, 07 Sep 2022 16:52:05 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwPM-0005PX-Ou; Wed, 07 Sep 2022 16:52:04 +0200
Date:   Wed, 7 Sep 2022 16:52:04 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v8 0/4] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <20220907145204.GE18739@pengutronix.de>
References: <20220907140254.2378109-1-m.grzeschik@pengutronix.de>
 <YxiqkhQl60E+tnAB@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Content-Disposition: inline
In-Reply-To: <YxiqkhQl60E+tnAB@kroah.com>
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


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 04:28:34PM +0200, Greg KH wrote:
>On Wed, Sep 07, 2022 at 04:02:50PM +0200, Michael Grzeschik wrote:
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
>>
>> --
>>
>> v1: https://lore.kernel.org/linux-usb/20210530222239.8793-1-m.grzeschik@=
pengutronix.de/
>> v2: https://lore.kernel.org/linux-usb/20211117004432.3763306-1-m.grzesch=
ik@pengutronix.de/
>> v3: https://lore.kernel.org/linux-usb/20211117122435.2409362-1-m.grzesch=
ik@pengutronix.de/
>> v4: https://lore.kernel.org/linux-usb/20211205225803.268492-1-m.grzeschi=
k@pengutronix.de/
>> v5: https://lore.kernel.org/linux-usb/20211209084322.2662616-1-m.grzesch=
ik@pengutronix.de/
>> v6: https://lore.kernel.org/linux-usb/20220105115527.3592860-1-m.grzesch=
ik@pengutronix.de/
>> v7: https://lore.kernel.org/linux-usb/20220608105748.139922-1-m.grzeschi=
k@pengutronix.de/
>
>Please say what changed somewhere :(

I addressed each patch individually.

>Anyway, this patch series does not even build properly:
>
>drivers/usb/gadget/function/uvc_v4l2.c: In function =E2=80=98uvc_v4l2_get_=
format=E2=80=99:
>drivers/usb/gadget/function/uvc_v4l2.c:258:42: error: =E2=80=98struct uvc_=
video=E2=80=99 has no member named =E2=80=98bpp=E2=80=99
>  258 |         fmt->fmt.pix.bytesperline =3D video->bpp * video->width / =
8;
>      |                                          ^~
>drivers/usb/gadget/function/uvc_v4l2.c:258:55: error: =E2=80=98struct uvc_=
video=E2=80=99 has no member named =E2=80=98width=E2=80=99
>  258 |         fmt->fmt.pix.bytesperline =3D video->bpp * video->width / =
8;
>      |                                                       ^~
>drivers/usb/gadget/function/uvc_v4l2.c:259:39: error: =E2=80=98struct uvc_=
video=E2=80=99 has no member named =E2=80=98imagesize=E2=80=99
>  259 |         fmt->fmt.pix.sizeimage =3D video->imagesize;
>      |                                       ^~
>drivers/usb/gadget/function/uvc_v4l2.c: In function =E2=80=98uvc_v4l2_try_=
format=E2=80=99:
>drivers/usb/gadget/function/uvc_v4l2.c:316:37: error: =E2=80=98bpl=E2=80=
=99 undeclared (first use in this function)
>  316 |         fmt->fmt.pix.bytesperline =3D bpl;
>      |                                     ^~~
>drivers/usb/gadget/function/uvc_v4l2.c:316:37: note: each undeclared ident=
ifier is reported only once for each function it appears in
>drivers/usb/gadget/function/uvc_v4l2.c:317:34: error: =E2=80=98imagesize=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98pa=
ge_size=E2=80=99?
>  317 |         fmt->fmt.pix.sizeimage =3D imagesize;
>      |                                  ^~~~~~~~~
>      |                                  page_size
>
>
>What did you test this with?

I rebased and tested another series than I send.
Sorry for that. I will RESEND the v8 with the proper content.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmMYsA4ACgkQC+njFXoe
LGTUmRAA0aCq3O/LYBr8pjRQ4TjjR1Jbzyr40Ubte5XwXcQwo4xa8uz/hx8Cc2m7
hxnDIc3gm9UKm+5Cz58wMQi3yEja7lvZ5o0zgTK49KY76IdExBy7obB7ckWc7PnM
HtWDMg6GGL26BXjIqBHLCEZYyaokzbea0xncMLTzWMojazGALNOfVBMVS7GK3p+9
i1NvgWGlzZylRNgp1yKioNYfT35pS2uPyw+czZQuwABgEQ33PbgbmOyoWzc6PA6q
OjFmZg8xQiY6UIlZiieeHRBsFvErfRVmpIIs7/xndWAFhRZPTozRzXhgtzV6UM3j
MwSMoTzURcaKlnpmmEMh3/fi6OOwdabyX/n45zw/iBc6TvdvVivh45fDvec2lgEE
KiG9N7WxXCWtYRm2KXALb1TqS4V0PDu7yU0ZbhwmjVgLZlaKKQhPpsSjzMGrtX/8
hgKJ0f9O/fWrDKxBfaWqslC2+keGNTNcY6LUmEFvsD3Od6gwKIAQK4AT8HKO9hTn
aHfhBgehXWzUfG1VNqnyi1jeAMuDEiFxV9yIl9b7kfTn1S+N8C8VrwSW/23eAN6N
l072Ee6bMGfMy8CTi45REyrm1qX8Nv8FmdgApP1VIpqlMViY8vcOsMSKhAD5BtvX
yarQ4hsXxebq5dDQt2qbY36yy5qG/aoPvWryq/oLDfbzHDSBG2U=
=n08K
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
