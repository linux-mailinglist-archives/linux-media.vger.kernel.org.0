Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18EFD7DD8A0
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 23:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344871AbjJaWxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 18:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344196AbjJaWxA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 18:53:00 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B44C9
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 15:52:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qxxbU-0005Es-RH; Tue, 31 Oct 2023 23:52:56 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qxxbU-005fRk-6n; Tue, 31 Oct 2023 23:52:56 +0100
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qxxbT-0004rR-TZ; Tue, 31 Oct 2023 23:52:55 +0100
Date:   Tue, 31 Oct 2023 23:52:55 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        stable <stable@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: gadget: uvc: limit isoc_sg to super speed
 gadgets
Message-ID: <ZUGFR7JYbvd4QPBW@pengutronix.de>
References: <20221125153450.344392-1-m.grzeschik@pengutronix.de>
 <20221125153450.344392-2-m.grzeschik@pengutronix.de>
 <be391e47-afe2-e7f6-93c8-7135b399598c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jk5G+1bNph3qgNq3"
Content-Disposition: inline
In-Reply-To: <be391e47-afe2-e7f6-93c8-7135b399598c@ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--jk5G+1bNph3qgNq3
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 24, 2023 at 01:47:09PM +0100, Dan Scally wrote:
>On 25/11/2022 15:34, Michael Grzeschik wrote:
>>When calling uvc_video_encode_isoc_sg the function is preparing the sg pa=
yload
>>by setting the sglist pointers of the videobuffer for the request. The usb
>>gadget driver then is parsing the sg list and uses each sg entry to send =
in one
>>urb to the host. Because of the unrelated buffer of the uvc header that b=
uffer
>>has to be send separately in an extra sg entry.
>>
>>When it comes to transfers with an limited payload (e.g. the maximum of 3=
kB for
>>high-speed) this extra payload handling is not justified. A simple memcpy=
 of
>>the header and payload is usually faster and does not come with that extra
>>runtime overhead.
>
>
>Sorry for the delay with this one. I don't suppose you benchmarked
>this at all? I'd be curious to see the effect.

No, I don't think that this was benchmarked. However since the last
discussions about overall smaller request sizes to increase the
performance on the fifo side of the usb-controller this whole
topic needs to be rethought. I will look over this once we have
a solution for the worker/queue_req situation as discussed in this
thread:

https://lore.kernel.org/linux-usb/ZToOJhyOFeGCGUFj@pengutronix.de/T/#t


>>This patch is changing the uvc_video_encode_isoc_sg encode function only =
to be
>>used for super speed gadgets.
>>
>>Cc: stable <stable@kernel.org>
>>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>---
>>v1 -> v2: - left the sg assignment in uvc_buffer_sg under the test for us=
e_sg
>>           - rephrased the commit message
>>
>>  drivers/usb/gadget/function/uvc_queue.c | 3 +--
>>  drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
>>  2 files changed, 8 insertions(+), 4 deletions(-)
>>
>>diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget=
/function/uvc_queue.c
>>index 0aa3d7e1f3cc32..0abb1763faf1b6 100644
>>--- a/drivers/usb/gadget/function/uvc_queue.c
>>+++ b/drivers/usb/gadget/function/uvc_queue.c
>>@@ -87,9 +87,8 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>>  	if (queue->use_sg) {
>>  		buf->sgt =3D vb2_dma_sg_plane_desc(vb, 0);
>>  		buf->sg =3D buf->sgt->sgl;
>>-	} else {
>>-		buf->mem =3D vb2_plane_vaddr(vb, 0);
>>  	}
>>+	buf->mem =3D vb2_plane_vaddr(vb, 0);
>>  	buf->length =3D vb2_plane_size(vb, 0);
>>  	if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
>>  		buf->bytesused =3D 0;
>>diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget=
/function/uvc_video.c
>>index dd1c6b2ca7c6f3..b6ea600b011185 100644
>>--- a/drivers/usb/gadget/function/uvc_video.c
>>+++ b/drivers/usb/gadget/function/uvc_video.c
>>@@ -459,6 +459,9 @@ static void uvcg_video_pump(struct work_struct *work)
>>   */
>>  int uvcg_video_enable(struct uvc_video *video, int enable)
>>  {
>>+	struct uvc_device *uvc =3D video->uvc;
>>+	struct usb_composite_dev *cdev =3D uvc->func.config->cdev;
>>+	struct usb_gadget *gadget =3D cdev->gadget;
>>  	unsigned int i;
>>  	int ret;
>>@@ -490,9 +493,11 @@ int uvcg_video_enable(struct uvc_video *video, int e=
nable)
>>  	if (video->max_payload_size) {
>>  		video->encode =3D uvc_video_encode_bulk;
>>  		video->payload_size =3D 0;
>>-	} else
>>-		video->encode =3D video->queue.use_sg ?
>>+	} else {
>>+		video->encode =3D (video->queue.use_sg &&
>>+				 !(gadget->speed <=3D USB_SPEED_HIGH)) ?
>>  			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
>>+	}
>
>
>I think it'd be better to just set video->queue.use_sg n=20
>uvcg_queue_init() by checking cdev->gadget->speed as well as=20
>cdev->gadget->sg_supported; can we do that?

Yes, this is the better place to check this.

In case this patch will be send again, I will work this in sure.

>>  	video->req_int_count =3D 0;

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--jk5G+1bNph3qgNq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmVBhUMACgkQC+njFXoe
LGRXxw/5AZp7ihGjRG67Kjbri+PofS0Rc+8nEI5DTWoVqLD7o4KScuD+F/VJgdwj
VHpd5ndHMJcZ+XIVqLF3pU1OICvasKzHYQT6AhGmOiz/Rc6sqF9ytzV9NkG4yU5D
6SCOfAQay62key6pcAdegV45+dNCGP1uTwlgCKqwbzsJOxnFV4xWWxfo42BYw7g8
z2BicclEyRlBiIQfdHDeLfz9VNq8pXxKPhpfRWz6PTKO4duBvjbLptdYfdNU5kyQ
lg/kWICkdAlsV7l+Qm6DT8tGURfBj1Gg2OLC63uCoSR8SoB/Xbaxr0CAlz1meBkn
KaMYdr2GRFQOMyt9WmyRlYGcUSwfBGUulwd9Z3HaLa7j6CZP59y27oTxju8Dxr/R
snszRk+dwg+zlDg8AsxrFxioXHwR1fn+K9naEOfDbGTwj+liu0a4VVP21oz/MTLj
Ihdvw6FVa+PqF+t4zFnLeuku9r3OBC8uIFM6uidWUUJjeSI6kyvKa5P+6AAMuuOI
GtvojgmUyvg0kgjDxUQQzDJjoIo4au+BSoCpj8S0qr0jmueZrs4f9zsxapMhFvdU
r1gUStcmG68VAz+VHY0N5zllw3dPmfT0aYC1leoJSBSaAr1AIrGpuK4cAIxGFZ09
Yc8DVfC5fbz+TFS7rC0EbmpuUd++WEx3mcc+vSwrvv8QLiL7M3U=
=sn2U
-----END PGP SIGNATURE-----

--jk5G+1bNph3qgNq3--
