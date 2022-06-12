Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD975479C4
	for <lists+linux-media@lfdr.de>; Sun, 12 Jun 2022 12:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236049AbiFLKbj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jun 2022 06:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232186AbiFLKbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jun 2022 06:31:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC04A6542D
        for <linux-media@vger.kernel.org>; Sun, 12 Jun 2022 03:31:37 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o0KsS-0006XB-Nf; Sun, 12 Jun 2022 12:31:28 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o0KsR-0008BT-13; Sun, 12 Jun 2022 12:31:27 +0200
Date:   Sun, 12 Jun 2022 12:31:27 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        linux-usb@vger.kernel.org, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, Dan Vacura <w36195@motorola.com>,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [RESEND v2 1/3] usb: gadget: uvc: calculate the number of
 request depending on framesize
Message-ID: <20220612103126.GC29935@pengutronix.de>
References: <20220608110339.141036-1-m.grzeschik@pengutronix.de>
 <20220608110339.141036-2-m.grzeschik@pengutronix.de>
 <YqDlP3uy33+WPphJ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline
In-Reply-To: <YqDlP3uy33+WPphJ@pendragon.ideasonboard.com>
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


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Wed, Jun 08, 2022 at 09:06:55PM +0300, Laurent Pinchart wrote:
>On Wed, Jun 08, 2022 at 01:03:37PM +0200, Michael Grzeschik wrote:
>> The current limitation of possible number of requests being handled is
>> dependent on the gadget speed. It makes more sense to depend on the
>> typical frame size when calculating the number of requests. This patch
>> is changing this and is using the previous limits as boundaries for
>> reasonable minimum and maximum number of requests.
>>
>> For a 1080p jpeg encoded video stream with a maximum imagesize of
>> e.g. 800kB with a maxburst of 8 and an multiplier of 1 the resulting
>> number of requests is calculated to 49.
>>
>>         800768         1
>> nreqs =3D ------ * -------------- ~=3D 49
>>           2      (1024 * 8 * 1)
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> Tested-by: Dan Vacura <w36195@motorola.com>
>>
>> ---
>> v1 -> v2: - using clamp instead of min/max
>>           - added calculation example to description
>> 	  - commented the additional division by two in the code
>>
>>  drivers/usb/gadget/function/uvc_queue.c | 17 ++++++++++++-----
>>  1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadge=
t/function/uvc_queue.c
>> index d25edc3d2174e1..eb9bd9d32cd056 100644
>> --- a/drivers/usb/gadget/function/uvc_queue.c
>> +++ b/drivers/usb/gadget/function/uvc_queue.c
>> @@ -44,7 +44,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>>  {
>>  	struct uvc_video_queue *queue =3D vb2_get_drv_priv(vq);
>>  	struct uvc_video *video =3D container_of(queue, struct uvc_video, queu=
e);
>> -	struct usb_composite_dev *cdev =3D video->uvc->func.config->cdev;
>> +	unsigned int req_size;
>> +	unsigned int nreq;
>>
>>  	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
>>  		*nbuffers =3D UVC_MAX_VIDEO_BUFFERS;
>> @@ -53,10 +54,16 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>>
>>  	sizes[0] =3D video->imagesize;
>>
>> -	if (cdev->gadget->speed < USB_SPEED_SUPER)
>> -		video->uvc_num_requests =3D 4;
>> -	else
>> -		video->uvc_num_requests =3D 64;
>> +	req_size =3D video->ep->maxpacket
>> +		 * max_t(unsigned int, video->ep->maxburst, 1)
>> +		 * (video->ep->mult);
>
>No need for parentheses.
>
>> +
>> +	/* We divide by two, to increase the chance to run
>> +	 * into fewer requests for smaller framesizes.
>> +	 */
>
>Could you please change the comment style to the more standard
>
>	/*
>	 * We divide by two, to increase the chance to run into fewer requests
>	 * for smaller framesizes.
>	 */
>
>(with the text reflowed to 80 columns) ?

These two things have to be fixed in a seperate patch.
Greg seems to have taken it already, as is.

>I'm however now sure where the division by 2 come from.
>
>Furthermore, as far as I understand, the reason why the number of
>requests was increased for superspeed devices (by you ;-)) was to avoid
>underruns at higher speeds and keep the queue full. This is less of a
>concern at lower speeds. Is there any drawback in increasing it
>regardless of the speed ? Increased latency comes to mind, but is it a
>problem in practice ?

This is a good question. Lets think through the case, where we set
the number of requests to an high number, just to be safe.

I think that for lower bandwidth USB you will probably not send high
resolution video. Especially if they are uncompressed. So having an
extra amount of requests available, they will probably unnecessary keep
more data than one frame in memory.

For the high bandwidth usb case we would by default also keep an extra
amount of memory available, especially if the burst and mult is set in
the upper values.

We would have to think of an resonable value for both cases.

This is why I think depending on the framesize is an good compromise.

>> +	nreq =3D DIV_ROUND_UP(DIV_ROUND_UP(sizes[0], 2), req_size);
>> +	nreq =3D clamp(nreq, 4U, 64U);
>> +	video->uvc_num_requests =3D nreq;
>>
>>  	return 0;
>>  }

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmKlwHsACgkQC+njFXoe
LGQaNg//fTkppOWIOKBd5c3S8S090w3keiJjTZkCrYIK36RWSzs7AjeGRBLYHeEZ
8cYu+TobjY77H2GA7slaT8jdNH6hdfNTxnn+4YPSrjYSNjcJ6qsD+9zZQ6d/gS8/
3EQd2D6wL9G2AI4O1whPspYntgXPliXkJjeP83jZFgZDLQ70+y1FhnEl8B1P4c5q
xb8PVXjEPZTDl93cjbMJylMPVtZyhX+WCCkqtECiyUpbrczTPgskCd9P49hHT2TA
5cNYds18JtqDLWGLhpBhMrx3ksLvG8poDLUQandcRrFK4/C9GUK6eeKBDS/TMfHi
PI3nHrto1GYtv+PhoUjDKFobBN8tE11iRBiHnhBuXCDf+vKtIAYRIRmyl97XDk/X
wl5flN4d/IpsSoKP6tk0Nn8HvyF3PwJmnRiYRnWH4h8U1el+yN+QssZDRrkwRKsR
Ql0IQIdonfu1jEzyCaUri5SoHTqzTKeKE36Rnc+XCUS04LR5+PB9Ub0MpR6/ca10
AKnS8pTh2b+7KcS3Z6ft0EpEjiwmpS0SXG079VfnN7zSkJul7xpaQV5zGcMOyFOQ
iI43p7M3AtnN8KdHx/PwEgj7jc/CZpV0vihXpNTSsOVqipRDeXWIE2hqbdzDcF1t
ikRNeY4yKTSRsl/toSuxnZdB2PvY5/aamZ6eFDPFL4j3fqpztpM=
=MZ/z
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
