Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B159167A5F5
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 23:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234589AbjAXWhN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 17:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbjAXWhL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 17:37:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBA359E6
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 14:36:39 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pKRtW-0000HY-SA; Tue, 24 Jan 2023 23:35:58 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pKRtW-0002ze-M1; Tue, 24 Jan 2023 23:35:58 +0100
Date:   Tue, 24 Jan 2023 23:35:58 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, stable <stable@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: gadget: uvc: limit isoc_sg to super speed
 gadgets
Message-ID: <20230124223558.GC7611@pengutronix.de>
References: <20221125153450.344392-1-m.grzeschik@pengutronix.de>
 <20221125153450.344392-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline
In-Reply-To: <20221125153450.344392-2-m.grzeschik@pengutronix.de>
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


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Gentle Ping!

On Fri, Nov 25, 2022 at 04:34:50PM +0100, Michael Grzeschik wrote:
>When calling uvc_video_encode_isoc_sg the function is preparing the sg pay=
load
>by setting the sglist pointers of the videobuffer for the request. The usb
>gadget driver then is parsing the sg list and uses each sg entry to send i=
n one
>urb to the host. Because of the unrelated buffer of the uvc header that bu=
ffer
>has to be send separately in an extra sg entry.
>
>When it comes to transfers with an limited payload (e.g. the maximum of 3k=
B for
>high-speed) this extra payload handling is not justified. A simple memcpy =
of
>the header and payload is usually faster and does not come with that extra
>runtime overhead.
>
>This patch is changing the uvc_video_encode_isoc_sg encode function only t=
o be
>used for super speed gadgets.
>
>Cc: stable <stable@kernel.org>
>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>---
>v1 -> v2: - left the sg assignment in uvc_buffer_sg under the test for use=
_sg
>          - rephrased the commit message
>
> drivers/usb/gadget/function/uvc_queue.c | 3 +--
> drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
> 2 files changed, 8 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/=
function/uvc_queue.c
>index 0aa3d7e1f3cc32..0abb1763faf1b6 100644
>--- a/drivers/usb/gadget/function/uvc_queue.c
>+++ b/drivers/usb/gadget/function/uvc_queue.c
>@@ -87,9 +87,8 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
> 	if (queue->use_sg) {
> 		buf->sgt =3D vb2_dma_sg_plane_desc(vb, 0);
> 		buf->sg =3D buf->sgt->sgl;
>-	} else {
>-		buf->mem =3D vb2_plane_vaddr(vb, 0);
> 	}
>+	buf->mem =3D vb2_plane_vaddr(vb, 0);
> 	buf->length =3D vb2_plane_size(vb, 0);
> 	if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
> 		buf->bytesused =3D 0;
>diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/=
function/uvc_video.c
>index dd1c6b2ca7c6f3..b6ea600b011185 100644
>--- a/drivers/usb/gadget/function/uvc_video.c
>+++ b/drivers/usb/gadget/function/uvc_video.c
>@@ -459,6 +459,9 @@ static void uvcg_video_pump(struct work_struct *work)
>  */
> int uvcg_video_enable(struct uvc_video *video, int enable)
> {
>+	struct uvc_device *uvc =3D video->uvc;
>+	struct usb_composite_dev *cdev =3D uvc->func.config->cdev;
>+	struct usb_gadget *gadget =3D cdev->gadget;
> 	unsigned int i;
> 	int ret;
>
>@@ -490,9 +493,11 @@ int uvcg_video_enable(struct uvc_video *video, int en=
able)
> 	if (video->max_payload_size) {
> 		video->encode =3D uvc_video_encode_bulk;
> 		video->payload_size =3D 0;
>-	} else
>-		video->encode =3D video->queue.use_sg ?
>+	} else {
>+		video->encode =3D (video->queue.use_sg &&
>+				 !(gadget->speed <=3D USB_SPEED_HIGH)) ?
> 			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
>+	}
>
> 	video->req_int_count =3D 0;
>
>--=20
>2.30.2
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmPQXU4ACgkQC+njFXoe
LGQC1A/+KQZpnB+87WLao4SNctHPJsqYQV9zij6Kg5wX379c2AN90+rPBw9kAvre
UUiuvf04NzvHz/cfM3zy2YmrVWrIvRihYHLP8cp/YgVurPJTMizuuG1xRbgF7THl
E9bVQI/n/SLBPDZclIqg+1RQFjqui0KTrQE9cT54FOh3Klr4zKZRgTZdc8RNfygx
yDKfnflQ7W9gXoslOihxHVxU0y+4FfWfkp9qbQtFNCWE4XC3c/K+iCjrZjUCrE/P
kend4/KzbWo4e5DbLo10yqsm6XDUs4v+29JSl97g3zQyKSZnAQF2+OmdwyZ2c+oW
tkdczAflFsIsjYDScBcXFBhKUdUWFb5jfDtJcky29rXajcxN91tsi6ulCO2F+WEi
2BxOqjmqpyWqkxOFCxlioOZOJdJUNYZNhg5kf6BtvzL4O9qjqE/XXycpzKLwTiTo
1a67AfdVCemmITaOYyrnl+GT24o767yoZBOfvPi0TQyg0NvkxKJa4dABLhTeABB/
dXDXEkMl+BnoGsed3SHNh94kLM1xX9vyUhjKtrX24kVbumZV3EWZe1pTuncX388o
NgCjRELkwbwYpxPu4PY7YM10r21EWe95bbT4i0DZul8LW1LAEKG9gBo8kb30XRJM
Klj1Q4bloUP/Xnsfmpzu69bXDrYjgf2vbZUA7Hu9KQ5r8BCM9Jo=
=gkup
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
