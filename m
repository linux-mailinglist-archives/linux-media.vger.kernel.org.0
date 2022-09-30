Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC8B5F13F4
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 22:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbiI3UpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 16:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbiI3Uo5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 16:44:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F5B25EAC
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 13:44:52 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oeMsM-0002qO-2C; Fri, 30 Sep 2022 22:44:50 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oeMsL-0004Q9-OX; Fri, 30 Sep 2022 22:44:49 +0200
Date:   Fri, 30 Sep 2022 22:44:49 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, kernel@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2] usb: gadget: uvc: don't put item still in use
Message-ID: <20220930204449.GA19990@pengutronix.de>
References: <YzbZ62gq3i4n7Vhx@kroah.com>
 <20220930122839.1747279-1-m.grzeschik@pengutronix.de>
 <YzcWompDLd7iIip+@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <YzcWompDLd7iIip+@pendragon.ideasonboard.com>
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


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, Sep 30, 2022 at 07:17:38PM +0300, Laurent Pinchart wrote:
>On Fri, Sep 30, 2022 at 02:28:39PM +0200, Michael Grzeschik wrote:
>> With the patch "588b9e85609b (usb: gadget: uvc: add v4l2 enumeration api
>> calls)" the driver is keeping a list of configfs entries currently
>> configured. The list is used in uvc_v4l2 on runtime.
>
>s/on runtime/at runtime/
>
>> The driver now is giving back the list item just after it was referenced
>> with config_item_put. It also calls config_item_put on uvc_free, which
>> is the only and right place to give back the reference. This patch fixes
>> the issue by removing the extra config_item_put in uvc_alloc.
>>
>> Fixes: 588b9e85609b (usb: gadget: uvc: add v4l2 enumeration api calls)
>
>I still don't like this much :-( As shown by this fix, the additional
>complexity that it incurs on the kernel side can cause bugs, and the
>gain for userspace is quite minimal in my opinion, as parsing configfs
>(or obtaining that information out-of-band through other means) will
>still be needed anyway to handle controls properly (I think we have
>agreed that userspace needs to handle the UVC requests in any case).

I understand your objections regarding the out-of-band configfs data.
While implementing the parser in the gstreamer uvcsink element I just
stumbled over this. It still needs to parse configfs just for
bInteraceNumber of the config and streaming interfaces. So actually with
the parser in the kernel, this was no issue, since this information is
already present there. I am more and more overthinking my latest
conviction of moving the whole parsing code to userspace.

Although, I understand that an partial parsing of the events in the
kernel for the format negotiaton is not ideal, the kernel parser is
still an valid option.

In our other discussion I mentioned a proper uvc-events API where the
kernel is already preparsing the gadget messages and creates events with
well defined event types. The userspace could then just run an simple
select over the event types and decide what to do.

What do you think about that? Any other ideas what we could do to
improve the uvc gadget?

>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>> v1 -> v2: - fixed commitish to valid one from usb-next tree
>>
>>  drivers/usb/gadget/function/f_uvc.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fu=
nction/f_uvc.c
>> index e6948cf8def30b..8bc591431d153e 100644
>> --- a/drivers/usb/gadget/function/f_uvc.c
>> +++ b/drivers/usb/gadget/function/f_uvc.c
>> @@ -995,7 +995,6 @@ static struct usb_function *uvc_alloc(struct usb_fun=
ction_instance *fi)
>>  		goto err_config;
>>
>>  	uvc->header =3D to_uvcg_streaming_header(h);
>> -	config_item_put(h);
>
>Assuming we want to keep 588b9e85609b, the fix seems right.

In my opinion with this fix the topic to enumerate the formats,
framesizes and intervals with the v4l2 api is now functional and
everything but complex. So the patch 588b9e85609b is valid and should
stay.

>>  	if (!uvc->header->linked) {
>>  		mutex_unlock(&opts->lock);
>>  		kfree(uvc);
>
>--=20

You also mentioned code to merge SETUP and DATA events for control OUT
requests. Is this code anywhere available? Are you planing to send
this code anytime soon?

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmM3VTsACgkQC+njFXoe
LGSzRA//bc+YWWa1e6BEQWiQfdRt/3+A54xm1YaGT0LNOxShCMcL5k+CaAg3CycV
8Wc7U0EG0BUE998IYsF2AREFgYfuYAG6s0amTB5b4UyIN1iLfOU3V5HYh7OtB3/4
3qT+iTcDbQlrKUFU5DM+3nSPhLlVCzjgZlEZVAcOTOWIOjZZrDE6DRHBtCLamu7d
H8yx1OZnVEcpHGn4kiDd2s7ccFvCO/PGXLLYIfTmehhAxt8v28Yfj9Ab5zdrPI8x
v3pDYlmDbQtzGKfMfgFA6m3JQz6uQqziBa7nd91US3hvWlpBxICNStAfPMNg4mDl
z93wBEqJi9e+YVYmMasWoiR+59FaXg4WOy5f/1I97Nxi0cJEn/irHo7bCB9vyMVE
eLUBb1iGKmFjMhkAqBEWeiYw06OQ/iOY6qXO0BEPaY0he43jixBKIfUtGFW6RnCO
0KBmqiSwBWtdOzoZPFfNWjlp8ZDh5ouM8Q74jEwoztRlXp3lzjv/IeGyTgy9A14s
DNGnItmSCY6SuZ1+/1cdDLfx0qTGJNpM3hU5ilQxSlsrRNZXGJMhv0IrHfrPGaLG
Sbb2c9mlm1XRCttAA004eyyN9jkMz01tp7amgYIEMv3ZyugCp32wKNRkOCgB1TTw
GkWCjakFgwyXKpS1GK5BKBHTfz1JHI2uPb3HopbplOUOWcPKhqk=
=gNoB
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
