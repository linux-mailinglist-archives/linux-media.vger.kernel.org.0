Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3520F5FA6D8
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 23:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiJJVEP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 17:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiJJVEM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 17:04:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391B9646B
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 14:04:02 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ohzwN-0005mn-Pf; Mon, 10 Oct 2022 23:03:59 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ohzwN-0005An-By; Mon, 10 Oct 2022 23:03:59 +0200
Date:   Mon, 10 Oct 2022 23:03:59 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: default the ctrl request interface
 offsets
Message-ID: <20221010210359.GG27626@pengutronix.de>
References: <20221010182028.402155-1-m.grzeschik@pengutronix.de>
 <Y0R+z9gtW1+Yd71d@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UKNXkkdQCYZ6W5l3"
Content-Disposition: inline
In-Reply-To: <Y0R+z9gtW1+Yd71d@kroah.com>
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


--UKNXkkdQCYZ6W5l3
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 10:21:35PM +0200, Greg KH wrote:
>On Mon, Oct 10, 2022 at 08:20:28PM +0200, Michael Grzeschik wrote:
>> For the userspace it is needed to distinguish between requests for the
>> control or streaming interface. The userspace would have to parse the
>> configfs to know which interface index it has to compare the ctrl
>> requests against. Since the interface numbers are not fixed, e.g. for
>> composite gadgets, the interface offset depends on the setup.
>>
>> The kernel has this information when handing over the ctrl request to
>> the userspace. This patch removes the offset from the interface numbers
>> and expose the default interface defines in the uapi g_uvc.h.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/gadget/function/f_uvc.c | 16 +++++++++++++---
>>  include/uapi/linux/usb/g_uvc.h      |  3 +++
>>  2 files changed, 16 insertions(+), 3 deletions(-)
>
>This is a v2, what changed from v1?

v1 - v2: - removed the extra variable in struct uvc_event
         - replacing the ctrl request bits in place
	 - included the move of the defualt interface defines to g_uvc.h

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--UKNXkkdQCYZ6W5l3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmNEiLwACgkQC+njFXoe
LGTY8w//bQS/I/2w2y1TfKIJpjU23tn30tErTle/wapy0Pg/9aZ+VB99hF/iMIx0
DSWTj4Tv5PjoCaJSD+Z3JcPDD5KD4Aq+NSIOpHINHYFgvceIbVzUp8RfFX/p7fmi
6ztz7Kf7kyEeRZDiFM4yT8EMLQ1teK6xVGbEdR+mBvGeKXdleZcZhIsDFoHUaN6O
vVd+JiN7tq1JJ5/mh2w0gVLTYeJYxfd7iP/vSFvkZa+oxCYnOy5fAJ4dK5ywTSdQ
6dNAfAlWf2Zqc20lSsOCFz/qO1V6CGyI/m6Mzb8n3/KeDqlVLhoxMPeYkQGYsiwd
poIFk/PPp4hCTWDQoLj2G5CfnFodRUyo5SWC7VYjT9WHV9dKQXK+VdD7aZaGz9b9
GhdO570nTLKK07q6cHElBwEGM0NwCNWu75IFeylfYsEG5VDwUhlt8zqVJIgiNZVh
7Uo2rkM37azmVuhK76vDOiM1wgQGiJ4gRrKtkbU45k0SaywNYGHpnTOlz4+JZ4Wd
qntCgoQUDMOCDYYtgHMl9gslF8fzn1OP1U3TVtg4Kg2URSY9qJHWSaJTkNefTUQx
H+y1N0bkEmWQ7PFeBcMUBKCE9VzDLSR85c/jkqzVDC2EcMXwArDpfSHy5gu8eATu
nA6QtEcQA1Zzd7/sG9L3jgMOKReoBar+lQsSTq+NBFdWD2wFtd4=
=b11b
-----END PGP SIGNATURE-----

--UKNXkkdQCYZ6W5l3--
