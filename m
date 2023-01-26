Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDE567D87F
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 23:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbjAZWea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 17:34:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjAZWeR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 17:34:17 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE94B728C1
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 14:33:37 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLAoF-0007bJ-8o; Thu, 26 Jan 2023 23:33:31 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLAoE-0000lb-Nw; Thu, 26 Jan 2023 23:33:30 +0100
Date:   Thu, 26 Jan 2023 23:33:30 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     marex@denx.de, gregkh@linuxfoundation.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v6.3] uvcgadget changes
Message-ID: <20230126223330.GI7611@pengutronix.de>
References: <20230124144929.GB19219@pengutronix.de>
 <Y8/6vHUoB4WjbLk2@kroah.com>
 <20230124161709.GA23507@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iRjOs3ViPWHdlw/I"
Content-Disposition: inline
In-Reply-To: <20230124161709.GA23507@pengutronix.de>
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


--iRjOs3ViPWHdlw/I
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, Jan 24, 2023 at 05:17:09PM +0100, Michael Grzeschik wrote:
>On Tue, Jan 24, 2023 at 04:35:24PM +0100, Greg KH wrote:
>>On Tue, Jan 24, 2023 at 03:49:29PM +0100, Michael Grzeschik wrote:
>>>The following changes since commit 82adfe34694c98f1115a7b75cff6af9c4a35d=
ba9:
>>>
>>> Merge tag 'media-uvc-next-20230115' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/pinchartl/linux into media_stage (2023-01-22 08:43:14 +0100)
>>>
>>>are available in the Git repository at:
>>>
>>> git://git.pengutronix.de/mgr/linux tags/uvc-gadget-next-20230124
>>>
>>>for you to fetch changes up to e88f760d0f7054f49aa68b75bf0530840f031d34:
>>>
>>> usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name (2023=
-01-24 15:26:07 +0100)
>>>
>>>----------------------------------------------------------------
>>>Marek Vasut (1):
>>>     media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
>>>
>>>Michael Grzeschik (4):
>>>     usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
>>>     usb: uvc: move uvc_fmts and uvc_format_by_guid to own compile unit
>>>     usb: uvc: make uvc_format_desc table const
>>>     usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name
>>
>>Sorry, but I can't take patches like this as a pull request.  I want to
>>see the real patches and get people to review them properly that way.
>
>I just did like Laurent suggested. Since the series was already properly
>reviewed I also thought this would be fine.
>
>https://lore.kernel.org/linux-media/Y8VdpQGcqmoKESk8@pendragon.ideasonboar=
d.com/
>
>Anyway. I can send another round with the patch from Marek in the
>series.

I am unsure how to proceed here.

I could send the series again and hope for Greg to take them. But
without Mauros merge of your changes underneath, Greg will not be
able to apply my series.


Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--iRjOs3ViPWHdlw/I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmPS/7cACgkQC+njFXoe
LGQRHQ//VOag6XPHtBfWGshyKaMGUnIiFzr7DzxKphcEkiSUDtNpwt7O/YRJkarV
JzmPXwNmyRoyCJCNyV/oU3XxanxN/wMlaNW10XVr6n7jaaUIGmiaHR5caZ0w/1gS
j90gGo5lcvmlhaPgIJLeIFIfR/5X8mMV8+JmFsqVpDWQQF/BQtGHgcHXpkYg9MMs
AB5xr4PVcwKlrWsi6fD6AWHfQKgJts/YgMRg7HzmMNL0gZYaqBTk2qF5ZU0jV0Vy
rNWUkc/JNZXS9H46pIpJDQ+JQimcAqIRZ9MgBE8qFIjA/kWd0VYoUJp+qqMtDpOZ
fOSfxTxr0h/Cc4nu0I7vBtyYiHh6qIdPyaSOZAPcagNQgmtyBf05QuFeRWIeHXHB
bD8y96wdW16CZSfYwaRRnQuNiB75CouwdSW4rQYvQsbRJcdPxwVqfYakKh6nkE2m
k3D6G9w82gIKFDYBgrABzN/nVMm4NUKsvHKWiaENItGZLifmFdaW8Vwz6ZBSnabX
SIBnEGuFkN/GxplXWYPIBrseoVdRbhDN1AWR4OymIN6asxbhVALllDYIQ3IHs95b
Y5fvbddOJd1P7Ltuc+J+NQcHWrxTUj19QbBb58Zo9a/U/6ns8W4JnSxBBOZshygR
S4XbdOLnsTxeBYkuv2IgOnHHW1bPF16yp7yNgH4oBtvI3zoejPk=
=RhpI
-----END PGP SIGNATURE-----

--iRjOs3ViPWHdlw/I--
