Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C90A35B069D
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 16:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbiIGOap (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 10:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbiIGOaW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 10:30:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE8284B0CE
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 07:30:08 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVw45-0000pW-JR; Wed, 07 Sep 2022 16:30:05 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVw45-0004X9-8U; Wed, 07 Sep 2022 16:30:05 +0200
Date:   Wed, 7 Sep 2022 16:30:05 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [RESEND v7 0/4] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <20220907143005.GD18739@pengutronix.de>
References: <20220608105748.139922-1-m.grzeschik@pengutronix.de>
 <YxiclqKkPDQR8qMM@kroah.com>
 <20220907140341.GC18739@pengutronix.de>
 <YximMNDbVJMVK/iY@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Content-Disposition: inline
In-Reply-To: <YximMNDbVJMVK/iY@kroah.com>
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


--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 04:09:52PM +0200, Greg KH wrote:
>On Wed, Sep 07, 2022 at 04:03:41PM +0200, Michael Grzeschik wrote:
>> On Wed, Sep 07, 2022 at 03:28:54PM +0200, Greg KH wrote:
>> > On Wed, Jun 08, 2022 at 12:57:44PM +0200, Michael Grzeschik wrote:
>> > > This series improves the uvc video gadget by parsing the configfs
>> > > entries. With the configfs data, the driver now is able to negotiate=
 the
>> > > format with the usb host in the kernel and also exports the supported
>> > > frames/formats/intervals via the v4l2 VIDIOC interface.
>> > >
>> > > The uvc userspace stack is also under development. One example is an=
 generic
>> > > v4l2uvcsink gstreamer elemnt, which is currently under discussion. [=
1]
>> > >
>> > > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_reque=
sts/1304
>> > >
>> > > With the libusbgx library [1] used by the gadget-tool [2] it is now =
also
>> > > possible to fully describe the configfs layout of the uvc gadget wit=
h scheme
>> > > files.
>> > >
>> > > [2] https://github.com/linux-usb-gadgets/libusbgx/pull/61/commits/53=
231c76f9d512f59fdc23b65cd5c46b7fb09eb4
>> > >
>> > > [3] https://github.com/linux-usb-gadgets/gt/tree/master/examples/sys=
temd
>> > >
>> > > The bigger picture of these patches is to provide a more versatile i=
nterface to
>> > > the uvc gadget. The goal is to simply start a uvc-gadget with the fo=
llowing
>> > > commands:
>> > >
>> > > $ gt load uvc.scheme
>> > > $ gst-launch v4l2src ! v4l2uvcsink
>> >
>> > v4l developers, given a lack of review response to this series, I'm
>> > assuming that you all have no objection to this series and I can take =
it
>> > through my usb-next tree.
>>
>> Since this will not apply anymore, I just send v8 with some minor
>> changes.
>
>Thanks, I'll take that series now.

Skip this v8 please. I will have to fix first.

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmMYquoACgkQC+njFXoe
LGQpGg//QwZPgV7OzGAjNEcLC3SNArmZfwtSNTJzYHdbtAv/CkbI1iKsyvjV4LVy
lBul6nRm56qHwAEZmgDt3s9PL9oogEHtU7tK7sPmN84bh8585aQvmSnbA01z/bj4
DcIsWc4H0r7JT+I6zUn9zrnqQfFtOCaxmeQ1fsKvV/D8Ljf2/qZI2GoW9yzKIi9g
e8Jb9CcM5or8YI21u40pnqTyZs/4fzm3DWgUcaIx+BOlgrgajlJ0tm/Z7wNxZDj0
0a8AXKKgBpxa0ocHdEE2h0C4L3XykKonO2jt76rK5uonJCH90DYX7L0wsZOos4X8
cu0GjSsJyCtM2SeEALymNLj+MR3HGP8RyprNjNLQ1NEFIybZhTYStI+Wj6WvCHh4
2D5ENFgEpDKH8l04LdtXHK2gPOUnQJA7mTAzTzPvBJRESHyeVo8CROP2hWcU5ZJw
6ouSZfOWWzPwGWl3VyQwwieK4Ox6q5femR9HyhijmayS4/2pd9k7jlRUTmedNojP
nOgIgeBmaZxREYXaiwncFwyFv6pApr/uw8BxW7FdHGGDvrVeUzkyct4pnl3sDTaX
7XGjRv4MW7uWMfp6fjdIny0XL17adjFedOhjs5QCfEdsdvS3FjNm1RLVsOkf04cI
q7RAxtRnNRwXTkeXwDpjAiOt9fjQvN+MP1XxkD01wj39t+exHgo=
=laOe
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
