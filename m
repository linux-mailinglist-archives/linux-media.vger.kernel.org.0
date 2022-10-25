Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A24E60D4A8
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 21:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbiJYTZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 15:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbiJYTZl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 15:25:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A679D018F
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 12:25:40 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1onPYQ-0003UL-0e; Tue, 25 Oct 2022 21:25:38 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1onPYP-00045Y-MM; Tue, 25 Oct 2022 21:25:37 +0200
Date:   Tue, 25 Oct 2022 21:25:37 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: gadget: uvc: limit isoc_sg to super speed gadgets
Message-ID: <20221025192537.GA10842@pengutronix.de>
References: <20221017221141.3134818-1-m.grzeschik@pengutronix.de>
 <Y1PVhIGlh1uMR2i/@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <Y1PVhIGlh1uMR2i/@kroah.com>
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Sat, Oct 22, 2022 at 01:35:32PM +0200, Greg KH wrote:
>On Tue, Oct 18, 2022 at 12:11:41AM +0200, Michael Grzeschik wrote:
>> The overhead of preparing sg data is high for transfers with limited
>> payload. When transferring isoc over high-speed usb the maximum payload
>> is rather small which is a good argument no to use sg. This patch is
>> changing the uvc_video_encode_isoc_sg encode function only to be used
>> for super speed gadgets.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v1 -> v2: - always setting mem and sg elements since now both is working=
 in runtime
>
>I'm guessing this is a "fix"?  If so, what commit id is this a fix for?

This is not a fix but a feature. I am working to improve it
also to work with dmabuf memory comming in as vaddr. This needs some
extra mapping. Since you already took this patch, I will send fix for
this one then.

>And any reason you aren't cc:ing me on these patches?

This was not intentional. I have my scripts that I usually recycle.
They probably need to be updatet.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmNYOC8ACgkQC+njFXoe
LGQ++Q//RCjJ89tZWPNGhuDWpfgDTHCLKrASrUIBJbrwkbOUKs69DBoLOL02YQ9y
EJnT5Sij3p+3Czqf/K9t9gCz7pxaiL4778FRClwU4ab+LoBBPE94zaUVNsTKAsXf
scQiD601XMPuS2AffbbwgNw1cZs7BodnIg7Jh4B/ekgB0Vp4hq/Rl5NDOR0oOLUW
A6epq2TCPkKYLTZ6TZoZMETW230ySin+GfGfaX9zOSozdvBEN70uWDOxu+YFR1iE
r6dp3NJ3bhLq93CPC43+cM7ojhO5FfvSFk9bDMWisH0c7pPY1H1Ziob5yU45uLno
4+A9siocTzmCl7KZLvRa9CjBh2tAAhuqU1lQSGrnarDuzoWqgqRRDyn81eMM38KR
G8mH6oEHOH6dYmq9ZBSLMncTLfxwBRBD0bab6zluCNcBxim+2HALdUKuBDgyKMXk
bk/c7Lyk9zw6VLV7H5OU1y0EIl65B0VmldZsbXbEJ3NRFpmMJcqDxq8GAzeVQT3L
7rBygtqq2lsec52Krf9PVGla7x5zfN4DRnOlOFHJnI+ZpUgsc+MTaQ1bOWrbpXKu
WfrL3Qki/yLJc2if0nuss7MMn7zVwK4CbRbawLaeQ/NPalzFcKiP1Cz3V+VqNqQF
JFPEcGv7HnSElkGnsh57dAKb3JrrBnUmzviXS94A9wdSppPDA5E=
=Bh+Y
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
