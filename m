Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C094D56D7AD
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 10:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiGKIS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 04:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiGKIS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 04:18:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43712BE05
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 01:18:57 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oAocz-00065m-UT; Mon, 11 Jul 2022 10:18:49 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oAocz-0007hd-7x; Mon, 11 Jul 2022 10:18:49 +0200
Date:   Mon, 11 Jul 2022 10:18:49 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [RESEND v7 0/4] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <20220711081849.GA8590@pengutronix.de>
References: <20220608105748.139922-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <20220608105748.139922-1-m.grzeschik@pengutronix.de>
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


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Gentle Ping!

On Wed, Jun 08, 2022 at 12:57:44PM +0200, Michael Grzeschik wrote:
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
> drivers/media/usb/uvc/uvc_driver.c      | 286 +---------------
> drivers/media/usb/uvc/uvc_v4l2.c        |  14 +-
> drivers/media/usb/uvc/uvcvideo.h        | 147 ---------
> drivers/media/v4l2-core/v4l2-common.c   |  82 +++++
> drivers/usb/gadget/function/f_uvc.c     | 270 +++++++++++++++-
> drivers/usb/gadget/function/uvc.h       |  39 ++-
> drivers/usb/gadget/function/uvc_queue.c |   3 +-
> drivers/usb/gadget/function/uvc_v4l2.c  | 412 +++++++++++++++++++++---
> drivers/usb/gadget/function/uvc_video.c |  71 +++-
> include/media/v4l2-common.h             |   4 +
> include/media/v4l2-uvc.h                | 359 +++++++++++++++++++++
> 12 files changed, 1187 insertions(+), 501 deletions(-)
> create mode 100644 include/media/v4l2-uvc.h
>
>--=20
>2.30.2
>
>
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmLL3OYACgkQC+njFXoe
LGTY3xAAjIaVLi9raXCEsPz5iykuObDLRNpBLMCLsebV7zBD02ljzLhb/+E3Etrs
73245/kcT/ZU2rA1xZFvhV2gwX/Tmq4f+O9JgQDNXF1bG09fFiRQsyvqv6lkoD63
cbubaV9ry+ErgVrxMzTzGav8BWiCVM7i7eocEaOVmg4bUxby5IT9MRIqX/l4oGcy
T+UfSLJKnRIBRFvAxx9e444qDVz8VIS/ezU1YQfReHg3/k6ZVGDtUQGzJGzDrFzX
cW/WqT3z2xBL42c1/WCeZJpZ856nCIWu7kc3mfT1QMXI6QrzQUt4TrtxY+0XfL/P
+NAVNgwbbEhxgK2VyqUdsNMFFEFtHTpfYCfDEE3veyb2o6wzfte71FSNBGOkgtDq
CZHptxNg8ubfYTlxQjnekSQZS+VHJv/jD2FiT+cFFFx/bGNyFjhlVm8yMvanFm4j
zJZeCHFbEcfTrtRtvfvQNGz8O6MJKjw98PLibEheYIWf7Qlt5lMSV51ckmAhLG7g
Tpucqs1iICIra3wsf5SAWxF7P8F6MJn3nbKe4vfIHwgPBsWquwlyznd+xkdc9wnX
EiPBlmGYJ+oGYfyR5axh9C3FB+84vwza3F7phK/alG7F3UfLC4nNMasplnuSjGdY
8eXXUJEFG1tXU9yf4rgd+In4sl0s02OYKPJab1m/xcE4HRCl2oE=
=obDb
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
