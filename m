Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF407DD892
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 23:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234505AbjJaWqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 18:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjJaWqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 18:46:16 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2FDF9
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 15:46:14 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qxxUx-0003rp-Lf; Tue, 31 Oct 2023 23:46:11 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qxxUw-005fR8-Tr; Tue, 31 Oct 2023 23:46:10 +0100
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qxxUw-0004pG-Kd; Tue, 31 Oct 2023 23:46:10 +0100
Date:   Tue, 31 Oct 2023 23:46:10 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        stable <stable@kernel.org>
Subject: Re: [PATCH v2 1/2] media: videobuf2-dma-sg: fix vmap and vunmap
 callbacks
Message-ID: <ZUGDsqO/QXL+q8Vq@pengutronix.de>
References: <20221125153450.344392-1-m.grzeschik@pengutronix.de>
 <20230124223453.GB7611@pengutronix.de>
 <481daff2-ee22-e0a9-3583-a3ee828c5c43@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6UN7E6yBpuvB3vW5"
Content-Disposition: inline
In-Reply-To: <481daff2-ee22-e0a9-3583-a3ee828c5c43@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6UN7E6yBpuvB3vW5
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Jul 18, 2023 at 10:40:57AM +0200, Hans Verkuil wrote:
>I'm going through some old patches in patchwork and found this one.
>Is this patch specifically for the uvc gadget driver, or is it a
>generic fix? If it is the latter (I suspect it is), then can you
>post this as a v3 by itself and rebased to the latest kernel?

I will just send v3 then. It is totally working without other
dependencies. This is long overdue.

>The fact that it was combined with the uvc gadget patch in the patch
>series is the main reason for this delay (see also my upcoming reply
>to patch 2/2).

I will look into this aswell.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--6UN7E6yBpuvB3vW5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmVBg6kACgkQC+njFXoe
LGSDJg/+KCMWzKyb1EQ17aEEVhV6Nq9s0od/IO2w9PNnXa7EhJIX3HmQg0ThdkWG
suVhdAvGmtKZBp0cXx2UfW3QhK3cPSxbTR7UPZwjbMQXiNdRmHud2EMbn4rNW+sl
NsaE8xiquzTuLviiUEI1AKf4PUN8krO8nlrZsxJOgl4bzPGtogL3edKCHC3GRCjg
6kGm0V9JNRSX5xlH4dtykgQRMaxa7XyFynmso7mV1T3WRBEkflVkJjbDk4+VEWC6
4FOgr3buJHiUDyS0vlU2AoKlcR28SD2zgyl6vNiU4LDJZA15DgifZu+le2uaAzY5
4jsjgvAUHQpYfbEOO065WsfS8NLBdDlvDsWdErnzezyjpI6QDQ9Zboy3pAp1Ym2u
1fTI+gshPR2KDKclXTdTNLh5aVdKIMMll/gO5SkTMAK83/ML3Z6MqWsyB7eFTyhp
nXQi2LdWjch1zsdzsNcDo5D4Wxzh9UHCYRVO+5tVvu8q5AGM7FzFryVq559ssiWH
3gGnyUm834rZO4WpWx7fSoXGd9g9Cspp6uEe6ZFfvnnxMnsuQU4OxugF+h7JZuiZ
nJ1dbjDJ2cDGZiQqTFkl5goghhIUhEu8EUxvBPjo7oLB/t2SMgx6OUuMcV35Uflt
+iVBF6OFHwP/9UysMfSnEC9dMu/SmLDrVQ/GlfBwEKGx2e9lo24=
=pxqZ
-----END PGP SIGNATURE-----

--6UN7E6yBpuvB3vW5--
