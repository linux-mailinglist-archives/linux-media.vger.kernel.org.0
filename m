Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082EC5B091F
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 17:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiIGPrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 11:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiIGPrb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 11:47:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4DFBB02E
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 08:47:15 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVxGj-0004au-CU; Wed, 07 Sep 2022 17:47:13 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVxGi-000093-V4; Wed, 07 Sep 2022 17:47:12 +0200
Date:   Wed, 7 Sep 2022 17:47:12 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v8 4/4] usb: gadget: uvc: add format/frame handling code
Message-ID: <20220907154712.GI18739@pengutronix.de>
References: <20220907140254.2378109-1-m.grzeschik@pengutronix.de>
 <20220907140254.2378109-5-m.grzeschik@pengutronix.de>
 <YxiztqqkMbWzMiVl@pendragon.ideasonboard.com>
 <20220907151516.GF18739@pengutronix.de>
 <Yxi5ed6u7hnFCKl6@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tctmm6wHVGT/P6vA"
Content-Disposition: inline
In-Reply-To: <Yxi5ed6u7hnFCKl6@pendragon.ideasonboard.com>
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


--tctmm6wHVGT/P6vA
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 06:32:09PM +0300, Laurent Pinchart wrote:
>Hi Michael,
>
>On Wed, Sep 07, 2022 at 05:15:16PM +0200, Michael Grzeschik wrote:
>> On Wed, Sep 07, 2022 at 06:07:34PM +0300, Laurent Pinchart wrote:
>> > On Wed, Sep 07, 2022 at 04:02:54PM +0200, Michael Grzeschik wrote:
>> >> The Hostside format selection is currently only done in userspace, as
>> >> the events for SET_CUR and GET_CUR are always moved to the application
>> >> layer. Since the v4l2 device parses the configfs data, the format
>> >> negotiation can be done in the kernel. This patch adds the functions =
to
>> >> set the current configuration while continuing to forward all unknown
>> >> events to the userspace level.
>> >
>> > Why do you think this is better done in kernel space, given that
>> > userspace has to process the event anyway ? It's more complexity in the
>> > kernel side, for little added value as far as I can see. It will also
>> > make it more difficult to handle different UVC versions (in particular
>> > UVC 1.5). I'd rather not go in this direction if there's no clear
>> > benefit.
>>
>> The current case is to set configfs from userspace to ensure
>> the host sees only what we configured. Then the userspace has to parse
>> this configfs again, to be sure not to allow something on
>> SET_CUR/GET_CUR that is not valid from configfs configuration. Since the
>> configfs-Setup could be done from another application comming from
>> somewhere in the userspace this limit will always stay.
>
>That really depends on the architecture of the userspace stack, when the
>same userspace application configures the gadget and handles the runtime
>operations, it won't have to parse configfs. I'd also argue that in
>practical use cases, the application will likely need to know the list
>of formats and resolutions that are exposed by the gadget in order to
>prepare for supporting them properly (for instance, allocating buffers
>large enough to store the largest resolution is common when you want to
>lower stream start delays if your system is not memory-constrained).

The userspace can for sure can do resolution and format parsing that
is exposed by the gadget. Even more standardized, now with the simple
v4l2 API, without having to parse the whole configfs again.

>> Since the kernel knows the configfs-setup it was given in the beginning
>> it can ensure that SET_CUR/GET_CUR will only handle valid setups.
>>
>> When done in Kernel, we can also use simple v4l2 API calls like try_form=
at to
>> ask the driver what the host side did configure. So we can use simple
>> abstracion-libs like gstreamer for this.
>
>This will cause trouble when extending support to UVC 1.5 as the
>complexity will grow on the kernel side. Furthermore, by handling the
>video probe and commit control in kernel space, you'd removing the
>possibility for userspace to decide on how to handle the bHint flags, or
>how to negociate dwFrameInterval key frame rate, compression quality, or
>the additional fields specific to UVC 1.5. This effectively hardcodes
>one particular policy in the driver, and that shouldn't be the role of
>the kernel.

When you look closely, you will see that for later user cases, I decided
the userspace appliaction will still be able to subscribe for DATA and
SETUP.

It will only fall back to the kernel side of operation if there is
nobody that is able to operate. In those cases, it will take over. I
tested this with your uvc-gadget appliaction. Since it subscribes more
than STREAMON and STREAMOFF, it is still working like before with this
patchstack applied.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--tctmm6wHVGT/P6vA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmMYvP4ACgkQC+njFXoe
LGR3xhAAjQtAZ1K407DsGsKj+aeqDPSkiW0wcWj806BTuxO5zZw348+0a98sEfak
jQcopSWW8CicCo2JIC1o+WwpUqcoFul2g0QOUasnDHFl+g15wFGztmgpzEea2vTF
v8HI4YYeaEtd2xaQtO0A8tfEgPeknvNg/pIurdl+9KLLLVL7riDctksqohv+ZUSR
TiGRRG3Ub5NZlOiIbIlNp8nmmTqXweju7xG4xmI3/7Fbc8xERaxzcypmjloqR5d9
ZYu/f2+cLfLjUstiSJFFwp9VVCSnB0hSzM5uzooJ+Vc6eD48HgUvRX9zk+1FDIDO
21F+oQnekCK6IIL6jKbGk60SOWA5TubkUCf9/QV4/OJ8ge5L43tAYcc+lbtmyd1x
nmkq+dNkmDzdMZW9guPoTtRiFyEobJ5dCYMGxlKs9vOog5sVAaI1rKHegeB5dvYH
f1SdNaveRqom7cU844fObWMBil2nWHvW/ktqZdLgVmsrftW6nQLDJr/Kuyej2U2c
d+Iq9aizndy4QwgxDmuj3UIRwDP7Yfe29do3lwijWVN3aHwmUCDaKtqJOCMw3GlJ
EruPfoQWTRWwSJTsQ7lKrxIlaOjAMb1rHo2laKOSyFnOvMPSXl2D09w7aGOX3kgw
6qD963c3+FB8AxfyEWepQr7zoQ5OrEo5Bmks3FrDDxRc8hnIQWc=
=7R8Z
-----END PGP SIGNATURE-----

--tctmm6wHVGT/P6vA--
