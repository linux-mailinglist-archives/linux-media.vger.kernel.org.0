Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE5A85B0889
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 17:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiIGP2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 11:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiIGP2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 11:28:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86725722B
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 08:28:17 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwyL-000253-4w; Wed, 07 Sep 2022 17:28:13 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwyK-0007jR-Iy; Wed, 07 Sep 2022 17:28:12 +0200
Date:   Wed, 7 Sep 2022 17:28:12 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [fixed+RESEND v10 0/4] usb: gadget: uvc: use configfs entries
 for negotiation and v4l2 VIDIOCS
Message-ID: <20220907152812.GH18739@pengutronix.de>
References: <20220907152101.2582112-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CEUtFxTsmBsHRLs3"
Content-Disposition: inline
In-Reply-To: <20220907152101.2582112-1-m.grzeschik@pengutronix.de>
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


--CEUtFxTsmBsHRLs3
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 05:20:57PM +0200, Michael Grzeschik wrote:
>This series improves the uvc video gadget by parsing the configfs
>entries. With the configfs data, the driver now is able to negotiate the
>format with the usb host in the kernel and also exports the supported
>frames/formats/intervals via the v4l2 VIDIOC interface.
>
>The uvc userspace stack is also under development. One example is an gener=
ic
>v4l2uvcsink gstreamer elemnt, which is currently under discussion. [1]
>
>[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/13=
04
>
>With the libusbgx library [1] used by the gadget-tool [2] it is now also
>possible to fully describe the configfs layout of the uvc gadget with sche=
me
>files.
>
>[2] https://github.com/linux-usb-gadgets/libusbgx/pull/61/commits/53231c76=
f9d512f59fdc23b65cd5c46b7fb09eb4
>
>[3] https://github.com/linux-usb-gadgets/gt/tree/master/examples/systemd
>
>The bigger picture of these patches is to provide a more versatile interfa=
ce to
>the uvc gadget. The goal is to simply start a uvc-gadget with the following
>commands:
>
>$ gt load uvc.scheme
>$ gst-launch v4l2src ! v4l2uvcsink
>
>--
>
>v1: https://lore.kernel.org/linux-usb/20210530222239.8793-1-m.grzeschik@pe=
ngutronix.de/
>v2: https://lore.kernel.org/linux-usb/20211117004432.3763306-1-m.grzeschik=
@pengutronix.de/
>v3: https://lore.kernel.org/linux-usb/20211117122435.2409362-1-m.grzeschik=
@pengutronix.de/
>v4: https://lore.kernel.org/linux-usb/20211205225803.268492-1-m.grzeschik@=
pengutronix.de/
>v5: https://lore.kernel.org/linux-usb/20211209084322.2662616-1-m.grzeschik=
@pengutronix.de/
>v6: https://lore.kernel.org/linux-usb/20220105115527.3592860-1-m.grzeschik=
@pengutronix.de/
>v7: https://lore.kernel.org/linux-usb/20220608105748.139922-1-m.grzeschik@=
pengutronix.de/
>v8: https://lore.kernel.org/linux-usb/20220907140254.2378109-1-m.grzeschik=
@pengutronix.de/
>v9: https://lore.kernel.org/linux-usb/20220907150457.2572474-1-m.grzeschik=
@pengutronix.de/
>
>Regards,
>Michael
>
>Michael Grzeschik (4):
>  media: v4l: move helper functions for fractions from uvc to
>    v4l2-common
>  media: uvcvideo: move uvc_format_desc to common header
>  usb: gadget: uvc: add VIDIOC function
>  usb: gadget: uvc: add format/frame handling code
>
> drivers/media/usb/uvc/uvc_ctrl.c        |   1 +
> drivers/media/usb/uvc/uvc_driver.c      | 290 +----------------
> drivers/media/usb/uvc/uvc_v4l2.c        |  14 +-
> drivers/media/usb/uvc/uvcvideo.h        | 147 ---------
> drivers/media/v4l2-core/v4l2-common.c   |  86 +++++
> drivers/usb/gadget/function/f_uvc.c     | 270 +++++++++++++++-
> drivers/usb/gadget/function/uvc.h       |  39 ++-
> drivers/usb/gadget/function/uvc_queue.c |   3 +-
> drivers/usb/gadget/function/uvc_v4l2.c  | 412 +++++++++++++++++++++---
> drivers/usb/gadget/function/uvc_video.c |  71 +++-
> include/media/v4l2-common.h             |   4 +
> include/media/v4l2-uvc.h                | 359 +++++++++++++++++++++
> 12 files changed, 1191 insertions(+), 505 deletions(-)
> create mode 100644 include/media/v4l2-uvc.h

This time I got spoiled by my own tools. :(

Just skip everything from v8, with mislabeled fixed+RESEND v8 (actually v9),
mislabeled fixed+RESEND v10 and just keep working with v11.

Thanks and sorry for the Noise,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--CEUtFxTsmBsHRLs3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmMYuIkACgkQC+njFXoe
LGSKtBAAjbfht39xscc7I2n2sOiucTDFn16m3tVUR3QtW5v9mKaJxnrvzjM93ZGH
//0rV2uE7Yqca9a2lpNlGtE9A8GYge4fwv7EcIQxbQUM/UNZpof/quytTTXGbBWY
dvDCkqHmRsxqH/h/STnJz3a/WuTOVC956nIrdrBXqa4vATGvGOKVHwXiXM61paiD
llu25alcjwldBmFAoj2gMP2RuB7W+/Djneqc+tLEJm81xQPcblSLiDl1D9gpcRLd
oOdv7cHvXG6C7PH5IKo4x+Fxc0fr9CG1ljSYF8v1KZpm/CNM2VYgZrWiOGZvNAx7
LmX7jB+vy8a3PZBVBo7xv8lIG8PNLhn6VwSS8uJ0p6odO2hHSkEAdk+GyOF799/C
YHs/AR8JgAE7CPk13lmTHtP6eRf3rUTZZPnh5MKfSstOLo1U5eBcrWYIPaGgP+Lz
FFDypj3jZLkU+5THBjxIr5Yc74jDAdFvvV7aBFPWG7qZkEo7CUueiTEz9mJYyy3e
Z/7HQfE09Av10+MUWbWZrAWfzdCWHF0iNueYkv62BeTTcrmy8t4oaqMSnxib6oWw
nfisicyYvBYL4U9OVvkmmPjAEEEJ2MCSH1UuuNgrUORenlV5v+DNWvR8wGIurxqJ
Uher7O3saqgI8RY8m69KNLnVO5x8aSubRMOkxp5721eh1f1vaZw=
=mAIU
-----END PGP SIGNATURE-----

--CEUtFxTsmBsHRLs3--
