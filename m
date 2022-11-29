Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3043E63BDE7
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 11:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbiK2KXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 05:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbiK2KX3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 05:23:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D87553EEA
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 02:23:10 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ozxlc-0001ON-Ei; Tue, 29 Nov 2022 11:23:08 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ozxlc-0004hK-1l; Tue, 29 Nov 2022 11:23:08 +0100
Date:   Tue, 29 Nov 2022 11:23:08 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        kernel@pengutronix.de, Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v7] usb: gadget: uvc: add validate and fix function for
 uvc response
Message-ID: <20221129102308.GO18924@pengutronix.de>
References: <20221128103124.655264-1-m.grzeschik@pengutronix.de>
 <Y4V4IED+SBhUR7Su@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xexMVKTdXPhpRiVT"
Content-Disposition: inline
In-Reply-To: <Y4V4IED+SBhUR7Su@pendragon.ideasonboard.com>
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


--xexMVKTdXPhpRiVT
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 05:10:24AM +0200, Laurent Pinchart wrote:
>Hi Michael,
>
>(CC'ing Dan)
>
>Thank you for the patch.
>
>On Mon, Nov 28, 2022 at 11:31:25AM +0100, Michael Grzeschik wrote:
>> When the userspace gets the setup requests for UVC_GET_CUR UVC_GET_MIN,
>> UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This data
>> needs to be validated. Since the kernel also knows the limits for valid
>> cases, it can fixup the values in case the userspace is setting invalid
>> data.
>
>Why is this a good idea ?

Why is it not? We don't want the userspace to communicate other things
to the host than what is configured in the configfs. If you only object
the explanation, then I will improve the commit message and send an
fixed v8. If you have more objections please share your doubts, thanks.

Michael

>> Fixes: e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v1: -> v4:
>> - new patch
>> v4: -> v5:
>> - changed uvcg_info to uvcg_dbg for fixups, updated info strings
>> v5: -> v6:
>> - no changes
>> v6 -> v7:
>> - reworked to not need 'd182bf156c4c ("usb: gadget: uvc: default the ctr=
l request interface offsets")'
>>
>> This will apply to v6.1-rc6.
>>
>>  drivers/usb/gadget/function/f_uvc.c    |  4 ++
>>  drivers/usb/gadget/function/uvc.h      |  1 +
>>  drivers/usb/gadget/function/uvc_v4l2.c | 76 ++++++++++++++++++++++++++
>>  3 files changed, 81 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fu=
nction/f_uvc.c
>> index 6e196e06181ecf..89f0100dae60f4 100644
>> --- a/drivers/usb/gadget/function/f_uvc.c
>> +++ b/drivers/usb/gadget/function/f_uvc.c
>> @@ -248,6 +248,10 @@ uvc_function_setup(struct usb_function *f, const st=
ruct usb_ctrlrequest *ctrl)
>>  	memset(&v4l2_event, 0, sizeof(v4l2_event));
>>  	v4l2_event.type =3D UVC_EVENT_SETUP;
>>  	memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
>> +
>> +	if (interface =3D=3D uvc->streaming_intf)
>> +		uvc->streaming_request =3D ctrl->bRequest;
>> +
>>  	v4l2_event_queue(&uvc->vdev, &v4l2_event);
>>
>>  	return 0;
>> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/func=
tion/uvc.h
>> index 40226b1f7e148a..1be4d5f24b46bf 100644
>> --- a/drivers/usb/gadget/function/uvc.h
>> +++ b/drivers/usb/gadget/function/uvc.h
>> @@ -151,6 +151,7 @@ struct uvc_device {
>>  	void *control_buf;
>>
>>  	unsigned int streaming_intf;
>> +	unsigned char streaming_request;
>>
>>  	/* Events */
>>  	unsigned int event_length;
>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget=
/function/uvc_v4l2.c
>> index a189b08bba800d..a12475d289167a 100644
>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> @@ -178,6 +178,67 @@ static struct uvcg_frame *find_closest_frame_by_siz=
e(struct uvc_device *uvc,
>>   * Requests handling
>>   */
>>
>> +/* validate and fixup streaming ctrl request response data if possible =
*/
>> +static void
>> +uvc_validate_streaming_ctrl(struct uvc_device *uvc,
>> +			    struct uvc_streaming_control *ctrl)
>> +{
>> +	struct f_uvc_opts *opts =3D fi_to_f_uvc_opts(uvc->func.fi);
>> +	unsigned int iformat, iframe;
>> +	struct uvcg_format *uformat;
>> +	struct uvcg_frame *uframe;
>> +	bool ival_found =3D false;
>> +	int i;
>> +
>> +	iformat =3D ctrl->bFormatIndex;
>> +	iframe =3D ctrl->bFrameIndex;
>> +
>> +	/* Restrict the iformat, iframe and dwFrameInterval to valid values.
>> +	 * Negative values for iformat and iframe will result in the maximum
>> +	 * valid value being selected
>> +	 */
>> +	iformat =3D clamp((unsigned int)iformat, 1U,
>> +			(unsigned int)uvc->header->num_fmt);
>> +	if (iformat !=3D ctrl->bFormatIndex) {
>> +		uvcg_dbg(&uvc->func,
>> +			  "userspace set invalid format index - fixup\n");
>> +		ctrl->bFormatIndex =3D iformat;
>> +	}
>> +	uformat =3D find_format_by_index(uvc, iformat);
>> +
>> +	iframe =3D clamp((unsigned int)iframe, 1U,
>> +		       (unsigned int)uformat->num_frames);
>> +	if (iframe !=3D ctrl->bFrameIndex) {
>> +		uvcg_dbg(&uvc->func,
>> +			  "userspace set invalid frame index - fixup\n");
>> +		ctrl->bFrameIndex =3D iframe;
>> +	}
>> +	uframe =3D find_frame_by_index(uvc, uformat, iframe);
>> +
>> +	if (ctrl->dwFrameInterval) {
>> +		for (i =3D 0; i < uframe->frame.b_frame_interval_type; i++) {
>> +			if (ctrl->dwFrameInterval =3D=3D
>> +				 uframe->dw_frame_interval[i])
>> +				ival_found =3D true;
>> +		}
>> +	}
>> +	if (!ival_found) {
>> +		uvcg_dbg(&uvc->func,
>> +			  "userspace set invalid frame interval - fixup\n");
>> +		ctrl->dwFrameInterval =3D uframe->frame.dw_default_frame_interval;
>> +	}
>> +
>> +	if (!ctrl->dwMaxPayloadTransferSize ||
>> +			ctrl->dwMaxPayloadTransferSize >
>> +				opts->streaming_maxpacket)
>> +		ctrl->dwMaxPayloadTransferSize =3D opts->streaming_maxpacket;
>> +
>> +	if (!ctrl->dwMaxVideoFrameSize ||
>> +			ctrl->dwMaxVideoFrameSize >
>> +				uframe->frame.dw_max_video_frame_buffer_size)
>> +		ctrl->dwMaxVideoFrameSize =3D uvc_get_frame_size(uformat, uframe);
>> +}
>> +
>>  static int
>>  uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
>>  {
>> @@ -192,6 +253,21 @@ uvc_send_response(struct uvc_device *uvc, struct uv=
c_request_data *data)
>>
>>  	memcpy(req->buf, data->data, req->length);
>>
>> +	/* validate the ctrl content and fixup */
>> +	if (!uvc->event_setup_out) {
>> +		struct uvc_streaming_control *ctrl =3D req->buf;
>> +
>> +		switch (uvc->streaming_request) {
>> +		case UVC_GET_CUR:
>> +		case UVC_GET_MIN:
>> +		case UVC_GET_MAX:
>> +		case UVC_GET_DEF:
>> +			uvc_validate_streaming_ctrl(uvc, ctrl);
>> +		default:
>> +			break;
>> +		}
>> +	}
>> +
>>  	return usb_ep_queue(cdev->gadget->ep0, req, GFP_KERNEL);
>>  }
>>
>
>--=20
>Regards,
>
>Laurent Pinchart
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--xexMVKTdXPhpRiVT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmOF3YsACgkQC+njFXoe
LGR55BAAjCqzXYvmTY4qInfCI1CXZDEjcEyhRfYzg6Hq8SplWvhM0gULqq/xFofa
tcePG8xxgaWFQ829zkKeuWC7eRzJgCMUgB7xXITI/UyFx2kbuAgCziUlcPQ3TdeR
sH8ALoauRsFcQIKFjCIjb4qN8hveGsFS7jqqUbY56VgJ33co5jE21HWVQ4zw/lcC
AaAuV5Uel4Kkb0iqtE2JlZLZ1mxAwogIwPcUKFIpD9hv6Yx5Ag5E0U7ovIlj23Uy
AyxHOyiVOrKlTa3y17VcAyhFzWNJX9aPEKuj83YGS+NyLd8zhjh2uFLVeuAGT/je
yPMD5qDzVwzabUbFh39ubeOmeqzyd0l2WO8XS42Zje9u3Vnjkg4nv8Zyf8m5bpxg
zy/OoCjr1gBq91A0sd/HQahaOb9XiPZxirLBkGZtwzA19dvXsQ9EtMRYhVtPGQeN
4IQ2WcRIdXcgUyDEnMdlHgkxYJAX3Y07+NkzsocWGtqvB/P2Lty1nVrDJX8FkXiA
LuvGjDCEbRPijXs9tNFdbzPDoYh+4l6wkdnH8m6V/oAd3j2+bzc4+amdPG7tIoov
iDVp/AFGZW1XfhRbSwlDZEzDYBoHtCtpMZyFNElo+mpKKl3+giY4LSe9Qyz7CnSj
L8ICVwNsIvGnBa1y9xaD1HGMrWKTfacjeNqZKXdD1cDuqMLknUw=
=1jbP
-----END PGP SIGNATURE-----

--xexMVKTdXPhpRiVT--
