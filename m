Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0382E622D1D
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 15:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiKIOES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 09:04:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiKIOEQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 09:04:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D09117069
        for <linux-media@vger.kernel.org>; Wed,  9 Nov 2022 06:04:15 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oslgb-0001zO-BL; Wed, 09 Nov 2022 15:04:13 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oslga-0004mT-U1; Wed, 09 Nov 2022 15:04:12 +0100
Date:   Wed, 9 Nov 2022 15:04:12 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v5] usb: gadget: uvc: add validate and fix function for
 uvc response
Message-ID: <20221109140412.GC19806@pengutronix.de>
References: <20221025222657.1883922-1-m.grzeschik@pengutronix.de>
 <Y2t/jskm7y1lDyBn@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Content-Disposition: inline
In-Reply-To: <Y2t/jskm7y1lDyBn@kroah.com>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2022 at 11:23:10AM +0100, Greg KH wrote:
>On Wed, Oct 26, 2022 at 12:26:57AM +0200, Michael Grzeschik wrote:
>> When the userspace gets the setup requests for UVC_GET_CUR UVC_GET_MIN,
>> UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This data
>> needs to be validated. Since the kernel also knows the limits for valid
>> cases, it can fixup the values in case the userspace is setting invalid
>> data.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v1: -> v4:
>> - new patch
>> v4: -> v5:
>> - changed uvcg_info to uvcg_dbg for fixups, updated info strings
>
>What commit id does this fix?  Validating userspace data is a good
>thing, so shouldn't this also go to stable kernels?

This patch makes use of the uvc_get_frame_size function, which was
introduced with in v6.0.

"e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")

So this should not go in as a stable patch.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmNrs1oACgkQC+njFXoe
LGR8eg/8Chh6kF0PKQhAFYF0OaRMummhmrftNTBYgUz6tLr7MHP37r3/vwC8f7U3
GlbwJtbtte8JnnqK9lKrVIGhbBsXFFx8zuSmMUr6fCEqy+shHkf88Y8byQXrTmAt
IrHGKq7BfZOL81ZFPeU7Si9FQI85U9Oh49WLV/L9j7C3qDM1lbvsJPOxyl7hN/Bb
wecA2oLkd3i2sbzTZ5tQzxPpwuRCSCfDw6i4G4obAqzA0AZsGA0QXgW+X/Uslivr
6QQ9QOlQIHeABDyh504Gd5Ocv8xBMXhOnWKK3QoJ41WlZtd+LYUVzIuzqAMhdfmW
c8uHZAYaCHH+wmRRPMMGuiG6OsMSjRlaVn/rdp8nNwva8WmupGrqm6IcMh0tzGKS
eQ6oBbsQIxvbCiiTm92o4UlEFYc/rM3aPfuA0sQ8z4DN84bwC2x2v76GYec0pSXh
k9xucCWeZL8wzzYmuc621pqMP9ghxEp6I5k+uh/T65605a8JnoTwiwHUz/ld3Hlj
vuZUOq1ewsVdHN3uxFNcHkbBusgI16ftWkNZtQYGrv8Ojhb7YyHtt+i196sRiQWD
8NVDUVnVnl392IDtiMr8tRAh2EifjvDA7r5LejzV7eiJQLhVfrKeL045li3HCXGd
Yr7CvoQSGYl6BdTRoB40AoJakmqNyE8LnCisF+tN2f424C2wpk8=
=941F
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
