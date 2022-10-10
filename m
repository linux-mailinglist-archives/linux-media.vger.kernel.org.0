Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8CA25FA066
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 16:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiJJOrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 10:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbiJJOrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 10:47:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4606642EB
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 07:47:06 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ohu3a-00045g-Ps; Mon, 10 Oct 2022 16:47:02 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ohu3a-0007nS-6e; Mon, 10 Oct 2022 16:47:02 +0200
Date:   Mon, 10 Oct 2022 16:47:02 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: mark the ctrl request for the
 streaming interface
Message-ID: <20221010144702.GE27626@pengutronix.de>
References: <20221009222000.1790385-1-m.grzeschik@pengutronix.de>
 <Y0O8AYjki6DFZJZ7@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RpqchZ26BWispMcB"
Content-Disposition: inline
In-Reply-To: <Y0O8AYjki6DFZJZ7@kroah.com>
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


--RpqchZ26BWispMcB
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 08:30:25AM +0200, Greg KH wrote:
>On Mon, Oct 10, 2022 at 12:20:00AM +0200, Michael Grzeschik wrote:
>> For the userspace it is needed to distinguish between reqeuests for the
>> control or streaming interace. The userspace would have to parse the
>> configfs to know which interface index it has to compare the ctrl
>> requests against, since the interface numbers are not fixed, e.g. for
>> composite gadgets.
>>
>> The kernel has this information when handing over the ctrl request to
>> the userspace. This patch adds a variable to indicate if the ctrl
>> request was meant for the streaming interface.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/gadget/function/f_uvc.c | 6 ++++++
>>  include/uapi/linux/usb/g_uvc.h      | 2 ++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fu=
nction/f_uvc.c
>> index 6e196e06181ecf..132d47798c0f13 100644
>> --- a/drivers/usb/gadget/function/f_uvc.c
>> +++ b/drivers/usb/gadget/function/f_uvc.c
>> @@ -228,6 +228,7 @@ uvc_function_setup(struct usb_function *f, const str=
uct usb_ctrlrequest *ctrl)
>>  	struct uvc_device *uvc =3D to_uvc(f);
>>  	struct v4l2_event v4l2_event;
>>  	struct uvc_event *uvc_event =3D (void *)&v4l2_event.u.data;
>> +	unsigned int interface =3D le16_to_cpu(ctrl->wIndex) & 0xff;
>>
>>  	if ((ctrl->bRequestType & USB_TYPE_MASK) !=3D USB_TYPE_CLASS) {
>>  		uvcg_info(f, "invalid request type\n");
>> @@ -246,6 +247,11 @@ uvc_function_setup(struct usb_function *f, const st=
ruct usb_ctrlrequest *ctrl)
>>  	uvc->event_length =3D le16_to_cpu(ctrl->wLength);
>>
>>  	memset(&v4l2_event, 0, sizeof(v4l2_event));
>> +
>> +	/* check for the interface number, so the userspace doesn't have to */
>> +	if (interface =3D=3D uvc->streaming_intf)
>> +		uvc_event->ctrlreq_streaming =3D 1;
>> +
>>  	v4l2_event.type =3D UVC_EVENT_SETUP;
>>  	memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
>>  	v4l2_event_queue(&uvc->vdev, &v4l2_event);
>> diff --git a/include/uapi/linux/usb/g_uvc.h b/include/uapi/linux/usb/g_u=
vc.h
>> index 652f169a019e7d..8711d706e5bfb0 100644
>> --- a/include/uapi/linux/usb/g_uvc.h
>> +++ b/include/uapi/linux/usb/g_uvc.h
>> @@ -27,6 +27,8 @@ struct uvc_request_data {
>>  };
>>
>>  struct uvc_event {
>> +	/* indicate if the ctrl request is for the streaming interface */
>> +	__u8 ctrlreq_streaming;
>
>How can you change a public api structure like this without breaking all
>existing userspace code?

Absolutely right, just skip that patch.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--RpqchZ26BWispMcB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmNEMGMACgkQC+njFXoe
LGQjuBAArGAIkgYadBrlWHSWflqO2B2ePhgN5KZWS/5e5115sYYnuR8zKzfe2e7Z
Xpi7MD6PmM/cUvZhbEQeoM37KDO1J40jLT/HvtzpZWBdy5sF+JHitZvSAL6HkTCl
1n5TAKH3mE7HNVV0C5TCmrOlKM6HFzXKXLm3XcVTG8TImQBTOhdQjakxQvG504t1
MoOvVY3w01WJ1WKyARrlav4r4wBDbY1BPnUPA1r9HUK1TqKCYyXN9h+3TEkpsmvH
tF8sjVF/xJ4dQq3reogh8l36hhCAtFoPWu1KNAkiFx3zuMa9oobYWf0tfmO2xmYy
G28lTXutAzzrnB1+zru4tJQImVMnevN9O0PyvHZsRi/GGR26q1SnuquPiBjPxAwO
HzqGIGcrkAhnBxSxzzP+GTR+S/mVv9TKx+3zMqgxdxS9gOzo8Hbp0yLl2lXPzQce
VtNOujSO9B2n3VqyP3XtuKhFUjdcJTnubcNefCM+eJj5CALbqrYZ3jm4Jn9t3nPh
AmX295zPatyX91N2Ih+XBU4cJDEyE8JbvAtACG5m7G0c5T93+ZbTIVl9HV6W1YEN
AhrOMlZU+jDu61mwr6tlTQWZ0wZexaseC4gZCdggG6BUrc7BkHN5+mhKXBe1NoTA
7iiUd1PG8QokfPRDOKL3TsoEXM+6UnARD+miXH00hmrVp4wMMiw=
=3yzy
-----END PGP SIGNATURE-----

--RpqchZ26BWispMcB--
