Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E61F63CABB
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 22:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236610AbiK2V46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 16:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236772AbiK2V4w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 16:56:52 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3506C733
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 13:56:50 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p08av-0000nh-6E; Tue, 29 Nov 2022 22:56:49 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p08au-0006Hi-PH; Tue, 29 Nov 2022 22:56:48 +0100
Date:   Tue, 29 Nov 2022 22:56:48 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        kernel@pengutronix.de, Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v7] usb: gadget: uvc: add validate and fix function for
 uvc response
Message-ID: <20221129215648.GR18924@pengutronix.de>
References: <20221128103124.655264-1-m.grzeschik@pengutronix.de>
 <Y4V4IED+SBhUR7Su@pendragon.ideasonboard.com>
 <20221129102308.GO18924@pengutronix.de>
 <Y4X0unPRK7iAnfaH@pendragon.ideasonboard.com>
 <20221129152259.GQ18924@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JB7KW7Ey7eB5HOHs"
Content-Disposition: inline
In-Reply-To: <20221129152259.GQ18924@pengutronix.de>
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


--JB7KW7Ey7eB5HOHs
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 04:22:59PM +0100, Michael Grzeschik wrote:
>On Tue, Nov 29, 2022 at 02:02:02PM +0200, Laurent Pinchart wrote:
>>On Tue, Nov 29, 2022 at 11:23:08AM +0100, Michael Grzeschik wrote:
>>>On Tue, Nov 29, 2022 at 05:10:24AM +0200, Laurent Pinchart wrote:
>>>> On Mon, Nov 28, 2022 at 11:31:25AM +0100, Michael Grzeschik wrote:
>>>>> When the userspace gets the setup requests for UVC_GET_CUR UVC_GET_MI=
N,
>>>>> UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This data
>>>>> needs to be validated. Since the kernel also knows the limits for val=
id
>>>>> cases, it can fixup the values in case the userspace is setting inval=
id
>>>>> data.
>>>>
>>>> Why is this a good idea ?
>>>
>>>Why is it not? We don't want the userspace to communicate other things
>>>to the host than what is configured in the configfs. If you only object
>>>the explanation, then I will improve the commit message and send an
>>>fixed v8. If you have more objections please share your doubts, thanks.
>>
>>What bothers me is that this patch silently clamps invalid value, trying
>>to hide the gadget userspace error from the host. It may allow the host
>>to proceed one step further, but if the gadget userspace got it wrong in
>>the first place, there's a very high chance it won't do the right thing
>>in the next step anyway. This will make debugging more complicated,
>>while at the same time not bringing much value.
>
>I discussed this and we came up with a better approach. When the
>userspace will send UVCIOC_SEND_RESPONSE we can return with a negativ
>return value. Like EAGAIN if the validation was seeeing some trouble
>with the userspaces uvc_streaming_control feedback to the host.
>
>The validation code will then still fixup the data, but instead of
>transfering this manipulated answer to the host, it will return the
>changes to the application with EAGAIN. So now the userspace can
>react to it and it should even point out misconfigurations between
>kernel and userspace and so will simplify the debugging.
>
>How about that?

While implementing this I came across the problem that the
UVCIOC_SEND_RESPONSE is handled in the vidioc_default handler.
But for this handler we can not set flag INFO_FL_ALWAYS_COPY like
for common v4l2_ioctls. :(

I think this is still worth a path to go, but I am currently out
of ideas how to achieve it. Help for this is much appreciated.

Thanks,
Michael


--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--JB7KW7Ey7eB5HOHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmOGgB4ACgkQC+njFXoe
LGSe/xAAo/NslPqLmcUVcAU/QdQif5RKL4YG9F8M4CRkSd+JnhaUZQu/YmxvFmAC
CmZKtSCu5XkL3FrDUEq+djF339I8pNup5L/9FkFq+MplbWjhEiaTcz1EmMFiFjMM
iO3suWDbZBKo755KPgN/KhDe3GLjvkljK1omv0n93yLUH7lG8yML9bBrgsaSSSOt
1VvNOQXbOe7b70RpZ6oxbq6Y9EUEHlG59XpYl2Jc6YMRoL5x03d+JeCTYSw21Fps
0ulqZcmSQyXDBhu1oeCBrxFvL+ufD0Y3uewWO3AtqLyCcOBOAwpcmwunpSamoEow
DP3Qd065U7iLyhg+LMo9lTftMJr/BbW+l0Wo8MHFaRnDBWcJHaHJt+gCpuRiW4OU
prUi8m18q95WrFrkwDq+oTsZsjPqEd/hH/TCf1buxuOFjO6eoTf8ETF7a32bWGD+
BvfnHhGqSUi581ZVm/7n/ohZ4laWsirW9zD6qpzvVfBpcP/aipeQFUUOKaDY/W/T
H13gGzLu0MLZ62JcL0mEdsH7jPKKDDsVzuIpu9xnjvohdUynVZot0w6kWrgxxy/1
l8+dbRg1uBOgAJiGa/W4bjl+dOVLRmPyoIgc0422rtLSwe6fbcKKmKwkZYKkrdSG
fgEXsDFo19IB2hyYFXXUAnnD6YaMp7pBuhprkfBQvpkzS7bPkxc=
=9nNw
-----END PGP SIGNATURE-----

--JB7KW7Ey7eB5HOHs--
