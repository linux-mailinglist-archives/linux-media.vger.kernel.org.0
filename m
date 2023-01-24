Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C04679E63
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 17:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233050AbjAXQRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 11:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbjAXQRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 11:17:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B28C45F6D
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 08:17:12 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pKLyw-0005I1-HH; Tue, 24 Jan 2023 17:17:10 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pKLyv-0006Ip-Qi; Tue, 24 Jan 2023 17:17:09 +0100
Date:   Tue, 24 Jan 2023 17:17:09 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        marex@denx.de, kernel@pengutronix.de
Subject: Re: [GIT PULL FOR v6.3] uvcgadget changes
Message-ID: <20230124161709.GA23507@pengutronix.de>
References: <20230124144929.GB19219@pengutronix.de>
 <Y8/6vHUoB4WjbLk2@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <Y8/6vHUoB4WjbLk2@kroah.com>
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


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 04:35:24PM +0100, Greg KH wrote:
>On Tue, Jan 24, 2023 at 03:49:29PM +0100, Michael Grzeschik wrote:
>> The following changes since commit 82adfe34694c98f1115a7b75cff6af9c4a35d=
ba9:
>>
>>  Merge tag 'media-uvc-next-20230115' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/pinchartl/linux into media_stage (2023-01-22 08:43:14 +0100)
>>
>> are available in the Git repository at:
>>
>>  git://git.pengutronix.de/mgr/linux tags/uvc-gadget-next-20230124
>>
>> for you to fetch changes up to e88f760d0f7054f49aa68b75bf0530840f031d34:
>>
>>  usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name (2023=
-01-24 15:26:07 +0100)
>>
>> ----------------------------------------------------------------
>> Marek Vasut (1):
>>      media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
>>
>> Michael Grzeschik (4):
>>      usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
>>      usb: uvc: move uvc_fmts and uvc_format_by_guid to own compile unit
>>      usb: uvc: make uvc_format_desc table const
>>      usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name
>
>Sorry, but I can't take patches like this as a pull request.  I want to
>see the real patches and get people to review them properly that way.

I just did like Laurent suggested. Since the series was already properly
reviewed I also thought this would be fine.

https://lore.kernel.org/linux-media/Y8VdpQGcqmoKESk8@pendragon.ideasonboard=
=2Ecom/

Anyway. I can send another round with the patch from Marek in the
series.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmPQBIIACgkQC+njFXoe
LGS/5w/3ZREhp8EY4DJzXQLx5jQuKsEk/8jAxSDKkJGsY3QgayYwZbSuYcZYbUc7
PjTkhhqQBpkVg5DiAc0qxT50ZS1M29OU1w6F5q4OkO3JaQdZ/AoVoeHeE9Uki7zY
YRK8fUdXS8INw9rr5T8PjeFpEsqh4HlCjnKrozCnTlgBrrrXcjmCbGtD1fx5qrAU
hwJr7mYMwlBSqOtN6zfm1dRX8hM18XfCNd8608qUIai9AhwrbVblyWVg7LsFsLlq
BMqZLlCjiWj9HR0roR9JXu+vkVeShnzny6kYoYtDPuOB56CRePo/++7znj/i3UsB
qHzQsT4bD+VOyoNmYzHuCk2R2uUQ4qWEfOel360m6+r4CeJGLDXupllRsIgGDzx3
+f8cCjU8U6b/VFpv+NkhHUVx5bazcRBELoq35TMGvPYgZwuxqBE45bI+aBSkyWup
YwmqTROYK6+OEM3+DwlZLjzdY4Q7P6DWvnFl5QDLbQWTb1uxt4JgYqcpYpFSqTh9
P7csFE1+rd/Uvy3CoKSDI49gDr/DgMeiZ8PdxSAUjX8Xnj/0MFhXBgc8tM8E11zZ
w4d/2DPL7uF09ph8muVzpTYF2W6ojq86780RFc99DF8hM3Bvv9YT2zYBZ2EGLu6O
bilKvoeCJJ+BZg6E+FxjviEeYCQ8MxM82ktQMBWwQdKp0e3Bdg==
=lH9H
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
