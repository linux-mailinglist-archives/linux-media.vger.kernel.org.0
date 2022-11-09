Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E31EF622D2D
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 15:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbiKIOJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 09:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbiKIOJ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 09:09:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCE818391
        for <linux-media@vger.kernel.org>; Wed,  9 Nov 2022 06:06:39 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1osliu-0002Tx-Sk; Wed, 09 Nov 2022 15:06:36 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1osliu-0004vH-IJ; Wed, 09 Nov 2022 15:06:36 +0100
Date:   Wed, 9 Nov 2022 15:06:36 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: also use try_format in set_format
Message-ID: <20221109140636.GD19806@pengutronix.de>
References: <20221026182240.363055-1-m.grzeschik@pengutronix.de>
 <Y2uDHpftYLHs1amf@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mJm6k4Vb/yFcL9ZU"
Content-Disposition: inline
In-Reply-To: <Y2uDHpftYLHs1amf@kroah.com>
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


--mJm6k4Vb/yFcL9ZU
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2022 at 11:38:22AM +0100, Greg KH wrote:
>On Wed, Oct 26, 2022 at 08:22:40PM +0200, Michael Grzeschik wrote:
>> Since e219a712bc06 (usb: gadget: uvc: add v4l2 try_format api call) the
>> try_format function is available. With this function includes checks for
>> valid configurations programmed in the configfs. We use this function to
>> ensure to return valid values on the set_format callback.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>>  drivers/usb/gadget/function/uvc_v4l2.c | 72 ++++++++------------------
>>  1 file changed, 21 insertions(+), 51 deletions(-)
>
>Again, is this a fix?  And should it go to stable kernels?

You can add:

Fixes: e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")

Since uvc_v4l2_try_format was introduced with that patch.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--mJm6k4Vb/yFcL9ZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmNrs+wACgkQC+njFXoe
LGR9OQ//QREyFSU1nnXVmGlOtJSrDe8UEEJL3RGzwrhjx36sKXtzrttVb+7gSnDZ
bHiyduTqv9ZfI+onLre6viqHaQ21JztRWWY8HDMqjFWUs5t2Sn5D8Gh6JpvvvBu0
Ait20QiNffDr4bwPY1FQCBBxP3jN5sh1nO8N8toA7mIKoXNboykrbNv7MDOY+8Y6
6NiJIOlGsCsyHu9A560cLMmlfOtUE9rizHxfYC14jc0jQ5LIP40XkTo3JM6TbKX5
zP0XNTjpFdKt7z2e3xmskyq0zEgT5LCfYrzRsYh8H5KrBpBYnQ/QvUSaq7+ouEUa
lcjcl8tZyDNbl6WbyWIYFx3isXhCqdbc/hn57S1RQHr3Ut+HIozjQstyfKEZ8eFS
GqJNYszly42mVz6onL5hRBZaxzIFj+9TdtERZoyu7gQ2chd8hsvsDp3VxpFxFzau
bDpZjl9/A8B7fWBnP7IoQkGOpKbm1qV64GhBZWDs1W2EjCDKRNrvan+DeOEHszfF
WSVZtFXD5BmKFqDffmhNhBdTTQ50QIT0QE09Lhb6GHjtLtA9TIKX23xvJMp89IxC
rILBxFrQyPHtfYkvReQVe5zqkQ4H22syzXnr79NHSEHanh3Nvke/P5LWexc+azLv
2JaXSzrnZQYTNAE/+DQAWuYV04wkn88ceTQQRlFn9YqKIn3bzc0=
=WBqM
-----END PGP SIGNATURE-----

--mJm6k4Vb/yFcL9ZU--
