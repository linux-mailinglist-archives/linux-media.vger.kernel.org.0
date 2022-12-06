Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8AB6449ED
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 18:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbiLFRHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 12:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235417AbiLFRHZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 12:07:25 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AEE2B27A
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 09:07:25 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p2bPe-0000Vf-LY; Tue, 06 Dec 2022 18:07:22 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p2bPe-0000fP-0F; Tue, 06 Dec 2022 18:07:22 +0100
Date:   Tue, 6 Dec 2022 18:07:21 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
Message-ID: <20221206170721.GB15222@pengutronix.de>
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com>
 <Y4xaXHLoiPupWM6V@kroah.com>
 <Y45f272a3aa7KXly@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline
In-Reply-To: <Y45f272a3aa7KXly@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 11:17:15PM +0200, Laurent Pinchart wrote:
>On Sun, Dec 04, 2022 at 09:29:16AM +0100, Greg KH wrote:
>> On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
>> > Hi Michael,
>> >
>> > On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
>> > > This series improves the uvc video gadget by parsing the configfs
>> > > entries. With the configfs data, the userspace now is able to use si=
mple
>> > > v4l2 api calls like enum and try_format to check for valid configura=
tions
>> > > initially set by configfs.
>> >
>> > I've realized that this whole series got merged, despite my multiple
>> > attempts to explain why I think it's not a good idea. The UVC gadget
>> > requires userspace support, and there's no point in trying to move all
>> > these things to the kernel side. It only bloats the kernel, makes the
>> > code more complex, more difficult to maintain, and will make UVC 1.5
>> > support more difficult.
>>
>> I can easily revert them, but I did not see any objections to them
>> originally and so I merged them as is the normal method :)
>
>I don't think a revert is needed. The issue I pointed out regarding the
>duplication of static const data can be solved on top. The API additions
>from this series are, in my opinion, not a good idea for the reasons I
>explained, but they don't hurt so much that we need to go nuclear on
>this.
>
>Michael, will you be addressing the static const data issue ?

Yes. I will also move the uvc_fmts[] array and uvc_format_by_guid to its
own compile unit.

I will go with drivers/media/usb/uvc.c

While at it the headerfile will better also be moved from
include/media/v4l2-uvc.h to linux/usb/uvc.h.

Thanks,
Michael


--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmOPdscACgkQC+njFXoe
LGSQpRAA0TDhxTBhQP31uBl1apiJQ0ww75RZnj6V+8o/lJKBMpEE3nYNXJnV4SoY
s0Ta3077KDxSXTQ3euOmBxTXp8kWW85oqtLTMDgF8XNwqNMk8US8K9MqtodajgmM
Dl0Wffvo/ap1QPLSLUm091f6CLgZfA5BSM6+bXLoS/AjA0xCYkpqYqrtIJ5f2sl6
yYF+PZ7aZc8r6/tZFQSVEJwjjmBDvY4MvdvEku4PypEgFQLgZyM9/hyWayc3Nmru
3d3D6ZHNsz85SQZEd2OKf1m75uoijxESQJ/pbJzLLMJ1xOvTx/bARRNscv8vnlI1
NnnLfkulPK+iLzauIND5e3vrDT5qtsgXTwJYZ7Nl6W8f1hCPAy92v8GtwujTwQhD
O/baonwjcZMRwoiF1fXQ4sXyHnvTlpqaSHdJA+qLhm/kOb4KVE0ITKSY47s+bEds
d7vzhLaaFFv6DvlmNld8oqnMOzEeOdTZ7AllF6M0SG0AEv17NHppevwlLrhiR3u5
ugb1ADgoVNo1+d0n5+ChAUC4YqM/FpXuU00//ht3bHFO1yn51Zy3+4l5qE/Rl44g
6V+pDie1PDCE0rlghz3shZxoFmufGLULHGSDHGFlNXXkLXAOO+vah3XYLTuCvt+k
a2+7qmZnC80xPAM7XxZ2iueUk4EXaaEs3AlGN3nI8NSrBxyDK3E=
=X6hF
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
