Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF450641949
	for <lists+linux-media@lfdr.de>; Sat,  3 Dec 2022 22:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiLCVq3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Dec 2022 16:46:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiLCVq2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Dec 2022 16:46:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6771C90A
        for <linux-media@vger.kernel.org>; Sat,  3 Dec 2022 13:46:26 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p1aL2-0006sD-GU; Sat, 03 Dec 2022 22:46:24 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p1aL0-0002T4-Np; Sat, 03 Dec 2022 22:46:22 +0100
Date:   Sat, 3 Dec 2022 22:46:22 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
Message-ID: <20221203214622.GA15222@pengutronix.de>
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com>
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


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
>On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
>> This series improves the uvc video gadget by parsing the configfs
>> entries. With the configfs data, the userspace now is able to use simple
>> v4l2 api calls like enum and try_format to check for valid configurations
>> initially set by configfs.
>
>I've realized that this whole series got merged, despite my multiple
>attempts to explain why I think it's not a good idea. The UVC gadget
>requires userspace support, and there's no point in trying to move all
>these things to the kernel side. It only bloats the kernel, makes the
>code more complex, more difficult to maintain, and will make UVC 1.5
>support more difficult.

Those patches that got merged are already a compromise. And I think a
better one. Since the last rounds I realized that many steps that I
thought would be needed in the kernel, can indeed be made in userspace.
So beside thise code that only adds the typical vidioc functions to
parse what is configured in configfs. There is nothing that changed the
working function of the gadget. That said, it is up to you to use the
vidiocs or your application sticks with own parsing of the configfs.

So, with that said, I am unsure what you are exactly unhappy about.
Beside the points you mentioned in the previous mail.

>I'm fairly unhappy with this, it will lower my trust towards your
>patches.

If you don't trust my patches, than review them or at least nack them
with a comment so we have an object of disscussion.

>> Michael Grzeschik (4):
>>   media: v4l: move helper functions for fractions from uvc to
>>     v4l2-common
>>   media: uvcvideo: move uvc_format_desc to common header
>>   usb: gadget: uvc: add v4l2 enumeration api calls
>>   usb: gadget: uvc: add v4l2 try_format api call
>>
>>  drivers/media/usb/uvc/uvc_ctrl.c       |   1 +
>>  drivers/media/usb/uvc/uvc_driver.c     | 290 +-------------------
>>  drivers/media/usb/uvc/uvc_v4l2.c       |  14 +-
>>  drivers/media/usb/uvc/uvcvideo.h       | 147 ----------
>>  drivers/media/v4l2-core/v4l2-common.c  |  86 ++++++
>>  drivers/usb/gadget/function/f_uvc.c    |  30 +++
>>  drivers/usb/gadget/function/uvc.h      |   2 +
>>  drivers/usb/gadget/function/uvc_v4l2.c | 286 ++++++++++++++++++++
>>  include/media/v4l2-common.h            |   4 +
>>  include/media/v4l2-uvc.h               | 359 +++++++++++++++++++++++++
>>  10 files changed, 776 insertions(+), 443 deletions(-)
>>  create mode 100644 include/media/v4l2-uvc.h
>
>--=20
>Regards,
>
>Laurent Pinchart
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmOLw6wACgkQC+njFXoe
LGQldw//c6UC+KvrXTrTZDT2PoaJswrVPxxLfHR/WJrqNgylF6CKQBu1K2WqJY6e
XCe4zixGTyt10aVNg7GIePII7CPHfH2TbUEC+tQZGUq1tcZuUfy7gnpdxmMeZzJk
ggL9OeqeXz7NO+ChXbhmPp1a8m44LekE5UeNsJVtHBG5boosJj03fzZRZR2Hru7h
RjBkptdsEtFipbsUwOZR4+pYN9V5bwyWzRQtQbLWmPp3b5aFJuUuGgwmpf07KGvd
IK3MtJi2xcyaZzYOqJB1jviK+ZcDPfYtjafSKOlkY8FwQCLTFbAbVbaW3bf/cTk/
by53a8wd4e9YucoWWtEtCgkRXP8Z8f4EWZLnxzunTulkdfoDnmXIvCGMgci5lnhE
BmLtL82GylmNrh7O6gVIOwkDS3lLu+EAtSW1CYnlGZXJf3x+imVBJkw0AUzDQXeA
hAuOy9GmsmIUqpw360L1d5ko6c6BG0jjxMhX/8Pb56DaYBx2Pb/2Ck7HzWZ1SrPU
tR+HgNC2FjAjmPoHr6DurKIzy3vFRyi0qyuVVsQIj45DART4ju1CtBEVnbG1vHvw
iBCXm8SXwqxMw4JOosaJbll8+mCK1qozgm/goHcFp9akEC17gNb7J58rSX9De06i
abzgVfcLku9sUut2Uc7KOvBykScEpnIVKYOCO3jfZtuwMe9Ir20=
=7jfI
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
