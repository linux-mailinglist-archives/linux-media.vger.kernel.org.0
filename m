Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 781655B0F51
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 23:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiIGVm2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 17:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiIGVm1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 17:42:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FADC12F8
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 14:42:26 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oW2oR-0003mr-9X; Wed, 07 Sep 2022 23:42:23 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oW2oQ-0002c7-MO; Wed, 07 Sep 2022 23:42:22 +0200
Date:   Wed, 7 Sep 2022 23:42:22 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH v3] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Message-ID: <20220907214222.GA20956@pengutronix.de>
References: <20220720144641.3480432-1-m.grzeschik@pengutronix.de>
 <Yv9K3GPsyw6ZAEMm@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <Yv9K3GPsyw6ZAEMm@kroah.com>
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


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2022 at 10:33:32AM +0200, Greg KH wrote:
>On Wed, Jul 20, 2022 at 04:46:41PM +0200, Michael Grzeschik wrote:
>> Likewise to the uvcvideo hostside driver, this patch is changing the
>
>"Likewise" implies a previous patch being mentioned, which I do not see
>here :(

I am not referring another patch but the uvcvideo driver.

drivers/media/usb/uvc/uvc_driver.c:

206         /* Allocate a stream specific work queue for asynchronous tasks=
=2E */
207         stream->async_wq =3D alloc_workqueue("uvcvideo", WQ_UNBOUND | W=
Q_HIGHPRI,
208                                            0);

I will add a clear reference in the commit message.

>> simple workqueue to an async_wq with higher priority. This ensures that
>> the worker will not be scheduled away while the video stream is handled.
>
>How will this ensure that?  What happens if yet-another higher priority
>task comes in?  This feels like a race that will just never be won
>without fixing this properly.

There is no race between two functions calls. There is a race between users=
pace
filling the gadget isoc driver with data while the hardware is moving it
towards the kernel. To ensure no underrun, we increase the priority of the
buffer filling thread.

Okay. I will probably have to rephrase it to be clear.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmMZEDsACgkQC+njFXoe
LGRchg//S581u9Q7Rjx53g0YhNOpVFEWbF5b54l8ZGyVjEbMR3wkNOWQwf7JJO96
UR45v1KqtABiakI4erSX3EJ0Rcll2emx3afp3uzsIr+rkyP2ZLmMBD2rh4mhElfJ
4PEhGXaZWxD+yXxXdyZwF94stiDu4mrvxAy73ybFIjNFe1hADRXVK0+4a0sX27Zf
LzwOCvWbBTGZ5/11qiLtHCMwNsZrdElx6BQfKx0m3qFuipXiTSQZU7dpfi2kdYtN
qs8rrYqVNc5RXkyUe45yboE6MqmBa0UtyyQbYDv8wXvw9lo6aFHbXfp47oSRFEvC
d0hz7UvdyfsgYwAb/t1q6SGFCqPbYk+l57dO5zY1Si7lyc2hteLI/1w/Sh2uQulJ
4PFVdNUV78QXwb9rzGvNnDNeYbdCgZ1m2yBHh4dDt9p1UrL7kVVn4qtXtMiT7YyY
lq5btTSzBk5Kz6OOaXXecTDG/88OE78c6PQibfXMKXwuU1BVL9vZGl4gttRxtNu3
4hySkHAUknN8DOi2NmWERN5eeGSGN5YCErxeaxvXl6gQBx0JI6BRIhysmHCrRH9g
rxnzZmVUprzmDpEgwsfRKplS3AjygdW1A8RCFej341d7Ufh4zt1GKqpYaa6MhdQg
B7OWavuihEoEik/GISO3pCjte8KdYUjQByygOUtFBgN6u/fZ7Y8=
=JpcU
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
