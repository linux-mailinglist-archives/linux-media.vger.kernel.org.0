Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9797B622D4A
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 15:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbiKIOQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 09:16:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbiKIOQx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 09:16:53 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E342604
        for <linux-media@vger.kernel.org>; Wed,  9 Nov 2022 06:16:51 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oslsn-0003oC-Pt; Wed, 09 Nov 2022 15:16:49 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oslsn-0005ge-DY; Wed, 09 Nov 2022 15:16:49 +0100
Date:   Wed, 9 Nov 2022 15:16:49 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v5] usb: gadget: uvc: add validate and fix function for
 uvc response
Message-ID: <20221109141649.GE19806@pengutronix.de>
References: <20221025222657.1883922-1-m.grzeschik@pengutronix.de>
 <Y2t/jskm7y1lDyBn@kroah.com>
 <20221109140412.GC19806@pengutronix.de>
 <Y2u076AZb+1O1tAf@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="10jrOL3x2xqLmOsH"
Content-Disposition: inline
In-Reply-To: <Y2u076AZb+1O1tAf@kroah.com>
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--10jrOL3x2xqLmOsH
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2022 at 03:10:55PM +0100, Greg KH wrote:
>On Wed, Nov 09, 2022 at 03:04:12PM +0100, Michael Grzeschik wrote:
>> On Wed, Nov 09, 2022 at 11:23:10AM +0100, Greg KH wrote:
>> > On Wed, Oct 26, 2022 at 12:26:57AM +0200, Michael Grzeschik wrote:
>> > > When the userspace gets the setup requests for UVC_GET_CUR UVC_GET_M=
IN,
>> > > UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This da=
ta
>> > > needs to be validated. Since the kernel also knows the limits for va=
lid
>> > > cases, it can fixup the values in case the userspace is setting inva=
lid
>> > > data.
>> > >
>> > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> > >
>> > > ---
>> > > v1: -> v4:
>> > > - new patch
>> > > v4: -> v5:
>> > > - changed uvcg_info to uvcg_dbg for fixups, updated info strings
>> >
>> > What commit id does this fix?  Validating userspace data is a good
>> > thing, so shouldn't this also go to stable kernels?
>>
>> This patch makes use of the uvc_get_frame_size function, which was
>> introduced with in v6.0.
>>
>> "e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")
>>
>> So this should not go in as a stable patch.
>
>So why wouldn't 6.0 and 6.1 need this?

It would apply, but since it is a feature I would not tag it as a fix.

However you can add:

Fixes: e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--10jrOL3x2xqLmOsH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmNrtk4ACgkQC+njFXoe
LGR1mA/+NEuC6VScXEV8qXl+Jjr5RDtWyqU/1oy5xU88IeFZ7fQOBpLmvNqoI0yn
q9CZPsT5NkAsFal/ieQq+gJiTd/m1WWqk2gDnvnl5GoWpHNjKzNWDsLmGpbeLxRp
3lvXkx7zZbXLB9sw+PI+xnL8c5GNcvaDKG1yZSkY76JMe2kpTUCn032/vQlE/AVu
Op74ylfG9dbcMkCu7SArLGxaW5Mg+XE1AmxhiKd37iIzoywZDleURVeHfCNfdebN
EjqQUB0/QVD98EEkx5jSo+I6HKd8Q6EG5jcL5wwcYA2a7HDGaBD4xc7YOTf1vOnI
ZV8cuHLzJFobCPIcjBwxgk0qYm4UnC8Slui/vwfKJAZWlsN/rNmfzsRqXk6yOTrv
WHhFy+K17+4qIwE0TtXRGlITMD0bLtYr5xQ378ddBw7d258gyZulBO/DedqmN4k+
GUHApypFThesVf8D0PTLqMHprU5mHETdO66sNOL8a4wEefGcVUSasV+Wwih3N/3/
NTbxSn2Fe//fxudA/cCsmzpLQtH+5yuJD74RUh3qD7TkkBog0CooOQqtchvbK/UC
G1evetsWMXmkZdNhWHWhE+bS4HOkIs0ib4614ZDiR+NqXpeURvuKNl6VE0tj3v+L
f8LbWDDKzSXTNslpqvBoPpG3Bp1c+K76orJXeLbgBIStqhXG/mo=
=pqG8
-----END PGP SIGNATURE-----

--10jrOL3x2xqLmOsH--
