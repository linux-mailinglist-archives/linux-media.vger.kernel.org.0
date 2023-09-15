Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7C87A2B00
	for <lists+linux-media@lfdr.de>; Sat, 16 Sep 2023 01:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbjIOXdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 19:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbjIOXcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 19:32:51 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE27A1FF5
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 16:32:46 -0700 (PDT)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qhIIm-0008Ls-Rq; Sat, 16 Sep 2023 01:32:45 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qhIIm-003shP-B0; Sat, 16 Sep 2023 01:32:44 +0200
Date:   Sat, 16 Sep 2023 01:32:44 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, dan.scally@ideasonboard.com,
        gregkh@linuxfoundation.org, nicolas@ndufresne.ca,
        kernel@pengutronix.de, Jayant Chowdhary <jchowdhary@google.com>
Message-ID: <ZQTpnJvTV+8Ye1si@pengutronix.de>
References: <20230911002451.2860049-1-m.grzeschik@pengutronix.de>
 <20230911002451.2860049-3-m.grzeschik@pengutronix.de>
 <a55b3b0c-2306-4591-8613-7be4927f0d4e@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="G+VlCQh2yJUZDW0S"
Content-Disposition: inline
In-Reply-To: <a55b3b0c-2306-4591-8613-7be4927f0d4e@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:2:b01:1d::c5
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
Subject: Re: [PATCH 2/3] usb: gadget: uvc: cleanup request when not in
 correct state
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.whiteo.stw.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--G+VlCQh2yJUZDW0S
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avichal

On Mon, Sep 11, 2023 at 09:52:22PM -0700, Avichal Rakesh wrote:
>On 9/10/23 17:24, Michael Grzeschik wrote:
>> The uvc_video_enable function of the uvc-gadget driver is dequeing and
>> immediately deallocs all requests on its disable codepath. This is not
>> save since the dequeue function is async and does not ensure that the
>> requests are left unlinked in the controller driver.
>>
>> By adding the ep_free_request into the completion path of the requests
>> we ensure that the request will be properly deallocated.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/gadget/function/uvc_video.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadge=
t/function/uvc_video.c
>> index 4b6e854e30c58c..52e3666b51f743 100644
>> --- a/drivers/usb/gadget/function/uvc_video.c
>> +++ b/drivers/usb/gadget/function/uvc_video.c
>> @@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, struct usb_re=
quest *req)
>>  	struct uvc_device *uvc =3D video->uvc;
>>  	unsigned long flags;
>>
>> +	if (uvc->state =3D=3D UVC_STATE_CONNECTED) {
>> +		usb_ep_free_request(video->ep, ureq->req);
>nit: You can probably just call usb_ep_free_request with req instead of ur=
eq->req.

Thanks, thats a good point.

>> +		ureq->req =3D NULL;
>> +		return;
>> +	}
>> +
>>  	switch (req->status) {
>>  	case 0:
>>  		break;
>
>Perhaps I am missing something here, but I am not sure how this alone
>fixes the use-after-free issue. uvcg_video_enable still deallocates
>_all_ usb_requests right after calling usb_ep_dequeue, so it is still
>possible that an unreturned request is deallocated, and now it is
>possible that the complete callback accesses a deallocated ureq :(

Since the issue I saw was usually coming from the list_del_entry_valid chec=
k in
the list_del_entry of the giveback function, the issue was probably just not
triggered anymore as the complete function did exit early.

So this fix alone is actually bogus without a second patch I had in the sta=
ck.
The second patch I am refering should change the actual overall issue:

https://lore.kernel.org/linux-usb/20230915233113.2903645-1-m.grzeschik@peng=
utronix.de/T/#u

This early list_del and this patch here should ensure that the
concurrent functions are not handling already freed memory.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--G+VlCQh2yJUZDW0S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmUE6ZkACgkQC+njFXoe
LGTlQA//afZovboxruOyoIxKuqg2TmacTeKJOqfegSxM5aHWYIo+6zgKwRlLiA/z
Oa1onEQ2fnHsvvIquWw7f+GWTOvbD8+2eF+IBddj0bhhTAIhljedC5tP1sKLAi4u
Tofriu1HwzMFc5RaC2/iEf/XYy9LpXClrEks6Fc45ljVFcsDmwvgMCH3aqJzxpj9
BetDeceDMmmaIHC38FHoP0fgaw85mBKBK9A/E6F8QbvWmTc8DkXyV5/W+ORdxB3n
6/2ZoatMToWb6Tv1nymzpaspu+l2MWVM9+Oc/8Y8ouuMnt4vynZyNLf0KwxXpIoj
rqMeHTOhEeLQPPYtm4/yzRx0oLR9MY6HJK8/eW8WhX80VdXxeBUxulEgvVeHxGe7
ugNAAyjs5uFcYrQh+Uf1QBJ1xTigbW5hWMI0sS5AoIFCl0hDeF2kBG+R+5x8zzB3
PXYbQJD2cWf8TDSYIDLNf4hqm15uZejWv/XOyiMfb5FIyBNh6ceCX8uz1I0SgBe8
z0HFCrGee3Q2KXGPOeqv9MfFzQizCymEmHMJE/G5DglX/elBcT8sGAC6MhpAxJbb
NoSK7YaFSbhCpTprxwp3fvYlG6zIUfgAK/zTlezq/OIH1QvWPji5owEuUUmxK1RY
47jYKi8YDTjrjsIcaVmc2xNSNzMNecLkT+QKwFcOWXnJqrDlgSA=
=9xfX
-----END PGP SIGNATURE-----

--G+VlCQh2yJUZDW0S--
