Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB907679C7C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 15:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233981AbjAXOuI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 09:50:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233800AbjAXOt6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 09:49:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2966D4B484
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 06:49:33 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pKKc6-0000zg-B2; Tue, 24 Jan 2023 15:49:30 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pKKc5-0007y3-VB; Tue, 24 Jan 2023 15:49:29 +0100
Date:   Tue, 24 Jan 2023 15:49:29 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     gregkh@linuxfoundation.org, linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, marex@denx.de,
        kernel@pengutronix.de
Subject: [GIT PULL FOR v6.3] uvcgadget changes
Message-ID: <20230124144929.GB19219@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline
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


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 82adfe34694c98f1115a7b75cff6af9c4a35dba9:

  Merge tag 'media-uvc-next-20230115' of git://git.kernel.org/pub/scm/linux=
/kernel/git/pinchartl/linux into media_stage (2023-01-22 08:43:14 +0100)

are available in the Git repository at:

  git://git.pengutronix.de/mgr/linux tags/uvc-gadget-next-20230124

for you to fetch changes up to e88f760d0f7054f49aa68b75bf0530840f031d34:

  usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name (2023-0=
1-24 15:26:07 +0100)

----------------------------------------------------------------
Marek Vasut (1):
      media: uvcvideo: Add GUID for BGRA/X 8:8:8:8

Michael Grzeschik (4):
      usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
      usb: uvc: move uvc_fmts and uvc_format_by_guid to own compile unit
      usb: uvc: make uvc_format_desc table const
      usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name

 drivers/media/common/Kconfig                  |   3 +
 drivers/media/common/Makefile                 |   1 +
 drivers/media/common/uvc.c                    | 183 ++++++++++++++++++++++
 drivers/media/usb/uvc/Kconfig                 |   1 +
 drivers/media/usb/uvc/uvc_ctrl.c              |   2 +-
 drivers/media/usb/uvc/uvc_driver.c            |   4 +-
 drivers/usb/gadget/Kconfig                    |   1 +
 drivers/usb/gadget/function/uvc_v4l2.c        |  16 +-
 include/{media/v4l2-uvc.h =3D> linux/usb/uvc.h} | 209 +-------------------=
------
 9 files changed, 201 insertions(+), 219 deletions(-)
 create mode 100644 drivers/media/common/uvc.c
 rename include/{media/v4l2-uvc.h =3D> linux/usb/uvc.h} (59%)

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmPP7/YACgkQC+njFXoe
LGQX3g/9FhViuHC54M/7FZKdo9hswWycQIALNZ+W9pANhvag0aF51l4sPdV7+sSB
AOIMcgwIjwh0N7gw8VCrNyTwvV3Jk0zh/yyilsoQ7Jhv0VIYiHFTVc+5qfpKgPcr
LshkrxqB4mEiwWvbZK97fXg0KDcU+d89HvsjUO4/B2+aUU7Tyje+5v71Y+0LMWZx
EiZFhAUvi3dNK1SoOoHsACq22uDLlMz7eyUMiz9ygJqPKkprmEq/TZztm9ONrj2j
QO8jBq6PozPcvpW8Ezja6M/RDAtpQj6k4bXtxad4X7ot1cI1/VB/roHrkeXnb7wl
XS1q8iRYbUmUKjAoE6OTjsXBlDCvBR6M7eN2QSr1M0tCG+LplezjY1pJ8S7DNBKX
HhbbACx10iOSQJr6JooFMRBDYZrLD63SGx4fqdm41FzOqFq0Qy625OjAc+18uumM
mKyA2qUt3Ec7W08QwMjC2vuBE6LjX4qyFs/zKGbIhC2oZCOLYHonpdkP9mMThe2M
UwcSctmQ2HcvAil5NKgtNHoVAOBT+06aDCAQjXoi39+F3XbKEpgBqt86kwtWfL7I
MHvA1+xk/YOneF9k3yAhKQzqZmNEF2qiXYkHIaAPerhj2pjTNxJhnNgW9Ojij82M
eJZ9pur8lJTizmky9uaLEkDWIkVTkwVii8NTxyhBsHwKZg6CmOs=
=bZ1T
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
