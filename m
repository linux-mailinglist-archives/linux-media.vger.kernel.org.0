Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACE0B63437C
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 19:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234108AbiKVSSs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 13:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbiKVSSq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 13:18:46 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C654F663F7
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 10:18:45 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oxXr1-00012C-Go; Tue, 22 Nov 2022 19:18:43 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oxXr0-0002ek-TR; Tue, 22 Nov 2022 19:18:42 +0100
Date:   Tue, 22 Nov 2022 19:18:42 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v5] usb: gadget: uvc: add validate and fix function for
 uvc response
Message-ID: <20221122181842.GG18924@pengutronix.de>
References: <20221025222657.1883922-1-m.grzeschik@pengutronix.de>
 <Y3zv8+Tqa6v1q8Jz@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline
In-Reply-To: <Y3zv8+Tqa6v1q8Jz@kroah.com>
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


--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 04:51:15PM +0100, Greg KH wrote:
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
>>
>>  drivers/usb/gadget/function/f_uvc.c    |  4 +-
>
>Does not apply to 6.1-rc6 :(
>
>Please rebase and resubmit.

This is, because it is based on

d182bf156c4c ("usb: gadget: uvc: default the ctrl request interface offsets=
")

which is currently in your usb-testing tree but not on v6.1-rc6.

Since I don't think that this is a fix but a feature. It probably be
better be also on the usb-testing tree aswell.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmN9EoAACgkQC+njFXoe
LGTILQ//UQ7vQzGAaBOdJuD/l/R2xg7YN3Zsimpx9aZ3JL1AFSrH+3O7VSo54jGI
Kcl/Q75xmkN1xR+e32tFmyYqlmQwdl95IRTkLmfa5Oc7+NpF+oAxie8GIMX2wxN5
gE2+F1/wRmDU0XGjHirIVeOKbUHzPzYvj4qHcFcqf+AtYOqiM85pdVC972P7H5LJ
hhe2BrXFxNGjYgnupTJqRVjc/FCbFZQYPkw5R+uB6DmehSyb9JzBbr461GVhnjCX
gQoY+oQWPHCK8MhnwfZtU2qqV/d2kT0lYl1QdZK93LPKxoC/zidog7aM4ngq7Fof
s0KY2OfYkXqEnpLHi5FOMOEC22dwRIh0JRLvfi7tOeNUW3KMUrrlL3SoL4Fn1xBG
a7W/359sAFNX62hL5bX1rxCgss7jkhXAkDL9IyhTBqWSeAUM2sbEikswMGH27ej3
YC4PTbHrjqAiMg0sXjtIcRSrzTp9B1jSd31kMNO4yZz1o4lp8jb/MAa96x9s4i+1
crDXnGbTuvwgezxQsPX/HD4QJYaIRt5q5hNMKUAl1pnl88RE5InaZIqJ4+izW5q3
dYbDf8pab3nT9zfbkGcKeQfuCvvZnWW+4gG3V4vo+ItlKatxxBilRgxAwbmgnPwk
omSnNhSVBSXqNM8rH2w7/T7qt2daTtIIHsa/+OT7M3sh2yLUM5Q=
=XJF1
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--
