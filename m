Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB6D63C3A0
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 16:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235697AbiK2PX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 10:23:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235946AbiK2PXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 10:23:10 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B5D5F862
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 07:23:01 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p02Rn-0002bM-Ly; Tue, 29 Nov 2022 16:22:59 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p02Rn-0003MH-AA; Tue, 29 Nov 2022 16:22:59 +0100
Date:   Tue, 29 Nov 2022 16:22:59 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        kernel@pengutronix.de, Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v7] usb: gadget: uvc: add validate and fix function for
 uvc response
Message-ID: <20221129152259.GQ18924@pengutronix.de>
References: <20221128103124.655264-1-m.grzeschik@pengutronix.de>
 <Y4V4IED+SBhUR7Su@pendragon.ideasonboard.com>
 <20221129102308.GO18924@pengutronix.de>
 <Y4X0unPRK7iAnfaH@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="L0TNCHh3fkwjpuuE"
Content-Disposition: inline
In-Reply-To: <Y4X0unPRK7iAnfaH@pendragon.ideasonboard.com>
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


--L0TNCHh3fkwjpuuE
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 02:02:02PM +0200, Laurent Pinchart wrote:
>Hi Michael,
>
>On Tue, Nov 29, 2022 at 11:23:08AM +0100, Michael Grzeschik wrote:
>> On Tue, Nov 29, 2022 at 05:10:24AM +0200, Laurent Pinchart wrote:
>> > On Mon, Nov 28, 2022 at 11:31:25AM +0100, Michael Grzeschik wrote:
>> >> When the userspace gets the setup requests for UVC_GET_CUR UVC_GET_MI=
N,
>> >> UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This data
>> >> needs to be validated. Since the kernel also knows the limits for val=
id
>> >> cases, it can fixup the values in case the userspace is setting inval=
id
>> >> data.
>> >
>> > Why is this a good idea ?
>>
>> Why is it not? We don't want the userspace to communicate other things
>> to the host than what is configured in the configfs. If you only object
>> the explanation, then I will improve the commit message and send an
>> fixed v8. If you have more objections please share your doubts, thanks.
>
>What bothers me is that this patch silently clamps invalid value, trying
>to hide the gadget userspace error from the host. It may allow the host
>to proceed one step further, but if the gadget userspace got it wrong in
>the first place, there's a very high chance it won't do the right thing
>in the next step anyway. This will make debugging more complicated,
>while at the same time not bringing much value.

I discussed this and we came up with a better approach. When the
userspace will send UVCIOC_SEND_RESPONSE we can return with a negativ
return value. Like EAGAIN if the validation was seeeing some trouble
with the userspaces uvc_streaming_control feedback to the host.

The validation code will then still fixup the data, but instead of
transfering this manipulated answer to the host, it will return the
changes to the application with EAGAIN. So now the userspace can
react to it and it should even point out misconfigurations between
kernel and userspace and so will simplify the debugging.

How about that?

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--L0TNCHh3fkwjpuuE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmOGI9AACgkQC+njFXoe
LGSk+g/8DgiqoIHq8YqQ7alo7UnUwP6ewu9MUk8R9PeRBhhLEl9rCbS5iJrepvSc
MCcjp8dDlD8czDFrohEfY65KZu6ko36FrgEBHp3M0Eo8ALydPV9l0QKii2ajiGlO
/Zq/d5ozqvY0EFM1La4k0qQnlmUyaLNQ9iHDPcuxpdjvQZ9uY1DOyQeR2A3v/4ze
Zz/tsQbY639VH7bth634QecU8YmZ+sRvLpVque85LNYhi6V7knUQPpySW69jlAYy
qE5gtwbr9/od/iNaRsP0V+0HH0fH4jG93SY7Cyk0elUXbTYqmXnjpwrDcZ7vy7Ih
hbMNDatM2jC2zeZo7XGyTFjWJ+5ABYOH4iLpOmJmXQa/LPqmzTZPKPn/fR5q466U
S8MQfMMoeEehlRQ1wZyaRZC14aJPGjsxDcm+KZHPpdluXjwCqOV238YiG/xhkd4z
8I1mP4k7UJIV4b/J0zMhVVd6PPkBSkjCr0T9vusCaU5luMNsgwoMvmLe9c+FoCHr
ftrUgkSdOBe7PTNXSXO0fM445+XD0S3EtTf+zgjquo02KyZkWjaTcMKgGyDYjB9g
i2NpJqgkbDtWj8uZ9O6FUf/I3YdPsr+g505o6tBmKJFUDCnnhpiL8BaE2hSJqmCE
ndJPKP8ZVe51ONYnmpXheCtA6LEgOEH5lJG5AIF7TVL8091VJ7o=
=Tz9d
-----END PGP SIGNATURE-----

--L0TNCHh3fkwjpuuE--
