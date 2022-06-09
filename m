Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 092015441E2
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 05:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237409AbiFID2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 23:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbiFID2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 23:28:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342CC1DE8C1
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 20:28:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCD35501;
        Thu,  9 Jun 2022 05:28:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654745295;
        bh=fAGTLKF2ZNzP1YjlkUUUbOQ+CC3gPhgM4WUstUVDMso=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DtMEcgJw477VHcI1kyRuA2RvfLej7rNA4a5Dnv9MdKGPZcenv9DBUH+jbH/swhOJ/
         5fEVrlKzWZ6/b70m9+rTRIld0EUzSuPEhbIZ+kyC3wbHwNmMfAVpTOmNpXUQnjlA9M
         JhPHTg4EftGoqXrsZIo62j5MTMygrAcLD8T0lPK8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220608174348.14244-1-laurent.pinchart@ideasonboard.com>
References: <20220608174348.14244-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: uvcvideo: Fix comment blocks style
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Thu, 09 Jun 2022 04:28:13 +0100
Message-ID: <165474529352.316514.15569879549982502900@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-06-08 18:43:48)
> The uvcvideo driver historically uses the
>=20
> /* Comment
>  * style
>  */
>=20
> for multi-line block comments, which is frowned upon. Patches for the
> driver are required to use the more standard
>=20
> /*
>  * Comment
>  * style
>  */
>=20
> style. This result in inconsistencies. Fix it by converting all
> remaining instances of the old style.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 33 ++++++----
>  drivers/media/usb/uvc/uvc_driver.c | 54 +++++++++++------
>  drivers/media/usb/uvc/uvc_isight.c | 13 ++--
>  drivers/media/usb/uvc/uvc_queue.c  |  6 +-
>  drivers/media/usb/uvc/uvc_status.c |  6 +-
>  drivers/media/usb/uvc/uvc_v4l2.c   | 15 +++--
>  drivers/media/usb/uvc/uvc_video.c  | 96 ++++++++++++++++++++----------
>  drivers/media/usb/uvc/uvcvideo.h   | 15 ++---
>  8 files changed, 156 insertions(+), 82 deletions(-)
>=20
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index 0e78233fc8a0..e1d57602bc37 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -749,7 +749,8 @@ static inline void uvc_clear_bit(u8 *data, int bit)
>         data[bit >> 3] &=3D ~(1 << (bit & 7));
>  }
> =20
> -/* Extract the bit string specified by mapping->offset and mapping->size
> +/*
> + * Extract the bit string specified by mapping->offset and mapping->size
>   * from the little-endian data stored at 'data' and return the result as
>   * a signed 32bit integer. Sign extension will be performed if the mappi=
ng
>   * references a signed data type.
> @@ -785,7 +786,8 @@ static s32 uvc_get_le_value(struct uvc_control_mappin=
g *mapping,
>         return value;
>  }
> =20
> -/* Set the bit string specified by mapping->offset and mapping->size
> +/*
> + * Set the bit string specified by mapping->offset and mapping->size
>   * in the little-endian data stored at 'data' to the value 'value'.
>   */
>  static void uvc_set_le_value(struct uvc_control_mapping *mapping,
> @@ -795,7 +797,8 @@ static void uvc_set_le_value(struct uvc_control_mappi=
ng *mapping,
>         int offset =3D mapping->offset;
>         u8 mask;
> =20
> -       /* According to the v4l2 spec, writing any value to a button cont=
rol
> +       /*
> +        * According to the v4l2 spec, writing any value to a button cont=
rol
>          * should result in the action belonging to the button control be=
ing
>          * triggered. UVC devices however want to see a 1 written -> over=
ride
>          * value.
> @@ -927,7 +930,8 @@ static int uvc_ctrl_populate_cache(struct uvc_video_c=
hain *chain,
>                             UVC_VC_EXTENSION_UNIT)
>                                 return ret;
> =20
> -                       /* GET_RES is mandatory for XU controls, but some
> +                       /*
> +                        * GET_RES is mandatory for XU controls, but some
>                          * cameras still choke on it. Ignore errors and s=
et the
>                          * resolution value to zero.
>                          */
> @@ -1522,8 +1526,10 @@ static int uvc_ctrl_add_event(struct v4l2_subscrib=
ed_event *sev, unsigned elems)
> =20
>                 uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, va=
l,
>                                     changes);
> -               /* Mark the queue as active, allowing this initial
> -                  event to be accepted. */
> +               /*
> +                * Mark the queue as active, allowing this initial event =
to be
> +                * accepted.
> +                */
>                 sev->elems =3D elems;
>                 v4l2_event_queue_fh(sev->fh, &ev);
>         }
> @@ -1596,7 +1602,8 @@ static int uvc_ctrl_commit_entity(struct uvc_device=
 *dev,
>                 if (!ctrl->initialized)
>                         continue;
> =20
> -               /* Reset the loaded flag for auto-update controls that we=
re
> +               /*
> +                * Reset the loaded flag for auto-update controls that we=
re
>                  * marked as loaded in uvc_ctrl_get/uvc_ctrl_set to preve=
nt
>                  * uvc_ctrl_get from using the cached value, and for writ=
e-only
>                  * controls to prevent uvc_ctrl_set from setting bits not
> @@ -1755,7 +1762,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                         return -ERANGE;
>                 value =3D mapping->menu_info[xctrl->value].value;
> =20
> -               /* Valid menu indices are reported by the GET_RES request=
 for
> +               /*
> +                * Valid menu indices are reported by the GET_RES request=
 for
>                  * UVC controls that support it.
>                  */
>                 if (mapping->data_type =3D=3D UVC_CTRL_DATA_TYPE_BITMASK =
&&
> @@ -1779,7 +1787,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                 break;
>         }
> =20
> -       /* If the mapping doesn't span the whole UVC control, the current=
 value
> +       /*
> +        * If the mapping doesn't span the whole UVC control, the current=
 value
>          * needs to be loaded from the device to perform the read-modify-=
write
>          * operation.
>          */
> @@ -2180,7 +2189,8 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_=
chain *chain,
>         unsigned int size;
>         unsigned int i;
> =20
> -       /* Most mappings come from static kernel data and need to be dupl=
icated.
> +       /*
> +        * Most mappings come from static kernel data and need to be dupl=
icated.
>          * Mappings that come from userspace will be unnecessarily duplic=
ated,
>          * this could be optimized.
>          */
> @@ -2389,7 +2399,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_cha=
in *chain,
>         const struct uvc_control_mapping *mend =3D
>                 mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> =20
> -       /* XU controls initialization requires querying the device for co=
ntrol
> +       /*
> +        * XU controls initialization requires querying the device for co=
ntrol
>          * information. As some buggy UVC devices will crash when queried
>          * repeatedly in a tight loop, delay XU controls initialization u=
ntil
>          * first use.
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index 6c86faecbea2..77ac5716f99d 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -329,7 +329,8 @@ static enum v4l2_ycbcr_encoding uvc_ycbcr_enc(const u=
8 matrix_coefficients)
>         return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
>  }
> =20
> -/* Simplify a fraction using a simple continued fraction decomposition. =
The
> +/*
> + * Simplify a fraction using a simple continued fraction decomposition. =
The
>   * idea here is to convert fractions such as 333333/10000000 to 1/30 usi=
ng
>   * 32 bit arithmetic only. The algorithm is not perfect and relies upon =
two
>   * arbitrary parameters to remove non-significative terms from the simple
> @@ -347,7 +348,8 @@ void uvc_simplify_fraction(u32 *numerator, u32 *denom=
inator,
>         if (an =3D=3D NULL)
>                 return;
> =20
> -       /* Convert the fraction to a simple continued fraction. See
> +       /*
> +        * Convert the fraction to a simple continued fraction. See
>          * https://mathforum.org/dr.math/faq/faq.fractions.html

Not necessarily required for this patch, but this URL doesn't work any
more.

It redirects to https://www.nctm.org/classroomresources/

But for this patch,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


>          * Stop if the current term is bigger than or equal to the given
>          * threshold.
> @@ -383,7 +385,8 @@ void uvc_simplify_fraction(u32 *numerator, u32 *denom=
inator,
>         kfree(an);
>  }
> =20
> -/* Convert a fraction to a frame interval in 100ns multiples. The idea h=
ere is
> +/*
> + * Convert a fraction to a frame interval in 100ns multiples. The idea h=
ere is
>   * to compute numerator / denominator * 10000000 using 32 bit fixed point
>   * arithmetic only.
>   */
> @@ -396,7 +399,8 @@ u32 uvc_fraction_to_interval(u32 numerator, u32 denom=
inator)
>             numerator/denominator >=3D ((u32)-1)/10000000)
>                 return (u32)-1;
> =20
> -       /* Divide both the denominator and the multiplier by two until
> +       /*
> +        * Divide both the denominator and the multiplier by two until
>          * numerator * multiplier doesn't overflow. If anyone knows a bet=
ter
>          * algorithm please let me know.
>          */
> @@ -548,7 +552,8 @@ static int uvc_parse_format(struct uvc_device *dev,
> =20
>                 format->bpp =3D buffer[21];
> =20
> -               /* Some devices report a format that doesn't match what t=
hey
> +               /*
> +                * Some devices report a format that doesn't match what t=
hey
>                  * really send.
>                  */
>                 if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
> @@ -663,7 +668,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>         buflen -=3D buffer[0];
>         buffer +=3D buffer[0];
> =20
> -       /* Parse the frame descriptors. Only uncompressed, MJPEG and frame
> +       /*
> +        * Parse the frame descriptors. Only uncompressed, MJPEG and frame
>          * based formats have frame descriptors.
>          */
>         while (buflen > 2 && buffer[1] =3D=3D USB_DT_CS_INTERFACE &&
> @@ -705,7 +711,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 }
>                 frame->dwFrameInterval =3D *intervals;
> =20
> -               /* Several UVC chipsets screw up dwMaxVideoFrameBufferSize
> +               /*
> +                * Several UVC chipsets screw up dwMaxVideoFrameBufferSize
>                  * completely. Observed behaviours range from setting the
>                  * value to 1.1x the actual frame size to hardwiring the
>                  * 16 low bits to 0. This results in a higher than necess=
ary
> @@ -717,7 +724,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>                         frame->dwMaxVideoFrameBufferSize =3D format->bpp
>                                 * frame->wWidth * frame->wHeight / 8;
> =20
> -               /* Some bogus devices report dwMinFrameInterval equal to
> +               /*
> +                * Some bogus devices report dwMinFrameInterval equal to
>                  * dwMaxFrameInterval and have dwFrameIntervalStep set to
>                  * zero. Setting all null intervals to 1 fixes the proble=
m and
>                  * some other divisions by zero that could happen.
> @@ -727,7 +735,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>                         *(*intervals)++ =3D interval ? interval : 1;
>                 }
> =20
> -               /* Make sure that the default frame interval stays between
> +               /*
> +                * Make sure that the default frame interval stays between
>                  * the boundaries.
>                  */
>                 n -=3D frame->bFrameIntervalType ? 1 : 2;
> @@ -819,7 +828,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>                 return -ENOMEM;
>         }
> =20
> -       /* The Pico iMage webcam has its class-specific interface descrip=
tors
> +       /*
> +        * The Pico iMage webcam has its class-specific interface descrip=
tors
>          * after the endpoint descriptors.
>          */
>         if (buflen =3D=3D 0) {
> @@ -918,7 +928,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>                         break;
> =20
>                 case UVC_VS_FORMAT_DV:
> -                       /* DV format has no frame descriptor. We will cre=
ate a
> +                       /*
> +                        * DV format has no frame descriptor. We will cre=
ate a
>                          * dummy frame descriptor with a dummy frame inte=
rval.
>                          */
>                         nformats++;
> @@ -1105,7 +1116,8 @@ static int uvc_parse_vendor_control(struct uvc_devi=
ce *dev,
>                 if (buffer[1] !=3D 0x41 || buffer[2] !=3D 0x01)
>                         break;
> =20
> -               /* Logitech implements several vendor specific functions
> +               /*
> +                * Logitech implements several vendor specific functions
>                  * through vendor specific extension units (LXU).
>                  *
>                  * The LXU descriptors are similar to XU descriptors
> @@ -1303,7 +1315,8 @@ static int uvc_parse_standard_control(struct uvc_de=
vice *dev,
>                         return -EINVAL;
>                 }
> =20
> -               /* Make sure the terminal type MSB is not null, otherwise=
 it
> +               /*
> +                * Make sure the terminal type MSB is not null, otherwise=
 it
>                  * could be confused with a unit.
>                  */
>                 type =3D get_unaligned_le16(&buffer[4]);
> @@ -1437,7 +1450,8 @@ static int uvc_parse_control(struct uvc_device *dev)
>         int buflen =3D alts->extralen;
>         int ret;
> =20
> -       /* Parse the default alternate setting only, as the UVC specifica=
tion
> +       /*
> +        * Parse the default alternate setting only, as the UVC specifica=
tion
>          * defines a single alternate setting, the default alternate sett=
ing
>          * zero.
>          */
> @@ -1455,7 +1469,8 @@ static int uvc_parse_control(struct uvc_device *dev)
>                 buffer +=3D buffer[0];
>         }
> =20
> -       /* Check if the optional status endpoint is present. Built-in iSi=
ght
> +       /*
> +        * Check if the optional status endpoint is present. Built-in iSi=
ght
>          * webcams have an interrupt endpoint but spit proprietary data t=
hat
>          * don't conform to the UVC status endpoint messages. Don't try to
>          * handle the interrupt endpoint for those cameras.
> @@ -2057,7 +2072,8 @@ static int uvc_scan_device(struct uvc_device *dev)
>                 if (!UVC_ENTITY_IS_OTERM(term))
>                         continue;
> =20
> -               /* If the terminal is already included in a chain, skip i=
t.
> +               /*
> +                * If the terminal is already included in a chain, skip i=
t.
>                  * This can happen for chains that have multiple output
>                  * terminals, where all output terminals beside the first=
 one
>                  * will be inserted in the chain in forward scans.
> @@ -2309,7 +2325,8 @@ static int uvc_register_terms(struct uvc_device *de=
v,
>                 if (ret < 0)
>                         return ret;
> =20
> -               /* Register a metadata node, but ignore a possible failur=
e,
> +               /*
> +                * Register a metadata node, but ignore a possible failur=
e,
>                  * complete registration of video nodes anyway.
>                  */
>                 uvc_meta_register(stream);
> @@ -2507,7 +2524,8 @@ static void uvc_disconnect(struct usb_interface *in=
tf)
>  {
>         struct uvc_device *dev =3D usb_get_intfdata(intf);
> =20
> -       /* Set the USB interface data to NULL. This can be done outside t=
he
> +       /*
> +        * Set the USB interface data to NULL. This can be done outside t=
he
>          * lock, as there's no other reader.
>          */
>         usb_set_intfdata(intf, NULL);
> diff --git a/drivers/media/usb/uvc/uvc_isight.c b/drivers/media/usb/uvc/u=
vc_isight.c
> index 2578d6ee4829..43cda5e760a3 100644
> --- a/drivers/media/usb/uvc/uvc_isight.c
> +++ b/drivers/media/usb/uvc/uvc_isight.c
> @@ -14,7 +14,8 @@
> =20
>  #include "uvcvideo.h"
> =20
> -/* Built-in iSight webcams implements most of UVC 1.0 except a
> +/*
> + * Built-in iSight webcams implements most of UVC 1.0 except a
>   * different packet format. Instead of sending a header at the
>   * beginning of each isochronous transfer payload, the webcam sends a
>   * single header per image (on its own in a packet), followed by
> @@ -65,7 +66,8 @@ static int isight_decode(struct uvc_video_queue *queue,=
 struct uvc_buffer *buf,
>                 buf->state =3D UVC_BUF_STATE_ACTIVE;
>         }
> =20
> -       /* Mark the buffer as done if we're at the beginning of a new fra=
me.
> +       /*
> +        * Mark the buffer as done if we're at the beginning of a new fra=
me.
>          *
>          * Empty buffers (bytesused =3D=3D 0) don't trigger end of frame =
detection
>          * as it doesn't make sense to return an empty buffer.
> @@ -75,7 +77,8 @@ static int isight_decode(struct uvc_video_queue *queue,=
 struct uvc_buffer *buf,
>                 return -EAGAIN;
>         }
> =20
> -       /* Copy the video data to the buffer. Skip header packets, as they
> +       /*
> +        * Copy the video data to the buffer. Skip header packets, as they
>          * contain no data.
>          */
>         if (!is_header) {
> @@ -109,7 +112,9 @@ void uvc_video_decode_isight(struct uvc_urb *uvc_urb,=
 struct uvc_buffer *buf,
>                                 urb->iso_frame_desc[i].status);
>                 }
> =20
> -               /* Decode the payload packet.
> +               /*
> +                * Decode the payload packet.
> +                *
>                  * uvc_video_decode is entered twice when a frame transit=
ion
>                  * has been detected because the end of frame can only be
>                  * reliably detected when the first packet of the new fra=
me
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uv=
c_queue.c
> index 21a907d32bb7..16fa17bbd15e 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -135,7 +135,8 @@ static void uvc_buffer_queue(struct vb2_buffer *vb)
>                 kref_init(&buf->ref);
>                 list_add_tail(&buf->queue, &queue->irqqueue);
>         } else {
> -               /* If the device is disconnected return the buffer to use=
rspace
> +               /*
> +                * If the device is disconnected return the buffer to use=
rspace
>                  * directly. The next QBUF call will fail with -ENODEV.
>                  */
>                 buf->state =3D UVC_BUF_STATE_ERROR;
> @@ -412,7 +413,8 @@ void uvc_queue_cancel(struct uvc_video_queue *queue, =
int disconnect)
> =20
>         spin_lock_irqsave(&queue->irqlock, flags);
>         uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> -       /* This must be protected by the irqlock spinlock to avoid race
> +       /*
> +        * This must be protected by the irqlock spinlock to avoid race
>          * conditions between uvc_buffer_queue and the disconnection even=
t that
>          * could result in an interruptible wait in uvc_dequeue_buffer. D=
o not
>          * blindly replace this logic by checking for the UVC_QUEUE_DISCO=
NNECTED
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/u=
vc_status.c
> index 753c8226db70..7518ffce22ed 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -202,8 +202,7 @@ static void uvc_status_complete(struct urb *urb)
>         case -ENOENT:           /* usb_kill_urb() called. */
>         case -ECONNRESET:       /* usb_unlink_urb() called. */
>         case -ESHUTDOWN:        /* The endpoint is being disabled. */
> -       case -EPROTO:           /* Device is disconnected (reported by so=
me
> -                                * host controller). */
> +       case -EPROTO:           /* Device is disconnected (reported by so=
me host controllers). */
>                 return;
> =20
>         default:
> @@ -272,7 +271,8 @@ int uvc_status_init(struct uvc_device *dev)
> =20
>         pipe =3D usb_rcvintpipe(dev->udev, ep->desc.bEndpointAddress);
> =20
> -       /* For high-speed interrupt endpoints, the bInterval value is use=
d as
> +       /*
> +        * For high-speed interrupt endpoints, the bInterval value is use=
d as
>          * an exponent of two. Some developers forgot about it.
>          */
>         interval =3D ep->desc.bInterval;
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc=
_v4l2.c
> index 648dcd579e81..b36f9cc57cd4 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -63,7 +63,8 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *c=
hain,
>                 break;
> =20
>         case V4L2_CTRL_TYPE_MENU:
> -               /* Prevent excessive memory consumption, as well as integ=
er
> +               /*
> +                * Prevent excessive memory consumption, as well as integ=
er
>                  * overflows.
>                  */
>                 if (xmap->menu_count =3D=3D 0 ||
> @@ -177,7 +178,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *=
stream,
>                 fcc[0], fcc[1], fcc[2], fcc[3],
>                 fmt->fmt.pix.width, fmt->fmt.pix.height);
> =20
> -       /* Check if the hardware supports the requested format, use the d=
efault
> +       /*
> +        * Check if the hardware supports the requested format, use the d=
efault
>          * format otherwise.
>          */
>         for (i =3D 0; i < stream->nformats; ++i) {
> @@ -191,7 +193,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *=
stream,
>                 fmt->fmt.pix.pixelformat =3D format->fcc;
>         }
> =20
> -       /* Find the closest image size. The distance between image sizes =
is
> +       /*
> +        * Find the closest image size. The distance between image sizes =
is
>          * the size in pixels of the non-overlapping regions between the
>          * requested size and the frame-specified size.
>          */
> @@ -233,7 +236,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *=
stream,
>         probe->bFormatIndex =3D format->index;
>         probe->bFrameIndex =3D frame->bFrameIndex;
>         probe->dwFrameInterval =3D uvc_try_frame_interval(frame, interval=
);
> -       /* Some webcams stall the probe control set request when the
> +       /*
> +        * Some webcams stall the probe control set request when the
>          * dwMaxVideoFrameSize field is set to zero. The UVC specification
>          * clearly states that the field is read-only from the host, so t=
his
>          * is a webcam bug. Set dwMaxVideoFrameSize to the value reported=
 by
> @@ -256,7 +260,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *=
stream,
>         if (ret < 0)
>                 goto done;
> =20
> -       /* After the probe, update fmt with the values returned from
> +       /*
> +        * After the probe, update fmt with the values returned from
>          * negotiation with the device. Some devices return invalid bForm=
atIndex
>          * and bFrameIndex values, in which case we can only assume they =
have
>          * accepted the requested format as-is.
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uv=
c_video.c
> index 6d3dfa4e0bb2..170a008f4006 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -189,7 +189,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming=
 *stream,
>                 ctrl->dwMaxVideoFrameSize =3D
>                         frame->dwMaxVideoFrameBufferSize;
> =20
> -       /* The "TOSHIBA Web Camera - 5M" Chicony device (04f2:b50b) seems=
 to
> +       /*
> +        * The "TOSHIBA Web Camera - 5M" Chicony device (04f2:b50b) seems=
 to
>          * compute the bandwidth on 16 bits and erroneously sign-extend i=
t to
>          * 32 bits, resulting in a huge bandwidth value. Detect and fix t=
hat
>          * condition by setting the 16 MSBs to 0 when they're all equal t=
o 1.
> @@ -207,7 +208,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming=
 *stream,
>                          ? ctrl->dwFrameInterval
>                          : frame->dwFrameInterval[0];
> =20
> -               /* Compute a bandwidth estimation by multiplying the frame
> +               /*
> +                * Compute a bandwidth estimation by multiplying the frame
>                  * size by the number of video frames per second, divide =
the
>                  * result by the number of USB frames (or micro-frames for
>                  * high-speed devices) per second and add the UVC header =
size
> @@ -220,7 +222,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming=
 *stream,
>                         bandwidth /=3D 8;
>                 bandwidth +=3D 12;
> =20
> -               /* The bandwidth estimate is too low for many cameras. Do=
n't use
> +               /*
> +                * The bandwidth estimate is too low for many cameras. Do=
n't use
>                  * maximum packet sizes lower than 1024 bytes to try and =
work
>                  * around the problem. According to measurements done on =
two
>                  * different camera models, the value is high enough to g=
et most
> @@ -267,7 +270,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *s=
tream,
>                 size, uvc_timeout_param);
> =20
>         if ((query =3D=3D UVC_GET_MIN || query =3D=3D UVC_GET_MAX) && ret=
 =3D=3D 2) {
> -               /* Some cameras, mostly based on Bison Electronics chipse=
ts,
> +               /*
> +                * Some cameras, mostly based on Bison Electronics chipse=
ts,
>                  * answer a GET_MIN or GET_MAX request with the wCompQual=
ity
>                  * field only.
>                  */
> @@ -279,7 +283,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *s=
tream,
>                 ret =3D 0;
>                 goto out;
>         } else if (query =3D=3D UVC_GET_DEF && probe =3D=3D 1 && ret !=3D=
 size) {
> -               /* Many cameras don't support the GET_DEF request on their
> +               /*
> +                * Many cameras don't support the GET_DEF request on their
>                  * video probe control. Warn once and return, the caller =
will
>                  * fall back to GET_CUR.
>                  */
> @@ -322,7 +327,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *s=
tream,
>                 ctrl->bMaxVersion =3D 0;
>         }
> =20
> -       /* Some broken devices return null or wrong dwMaxVideoFrameSize a=
nd
> +       /*
> +        * Some broken devices return null or wrong dwMaxVideoFrameSize a=
nd
>          * dwMaxPayloadTransferSize fields. Try to get the value from the
>          * format and frame descriptors.
>          */
> @@ -386,7 +392,8 @@ int uvc_probe_video(struct uvc_streaming *stream,
>         unsigned int i;
>         int ret;
> =20
> -       /* Perform probing. The device should adjust the requested values
> +       /*
> +        * Perform probing. The device should adjust the requested values
>          * according to its capabilities. However, some devices, namely t=
he
>          * first generation UVC Logitech webcams, don't implement the Vid=
eo
>          * Probe control properly, and just return the needed bandwidth. =
For
> @@ -493,7 +500,8 @@ uvc_video_clock_decode(struct uvc_streaming *stream, =
struct uvc_buffer *buf,
>         if (len < header_size)
>                 return;
> =20
> -       /* Extract the timestamps:
> +       /*
> +        * Extract the timestamps:
>          *
>          * - store the frame PTS in the buffer structure
>          * - if the SCR field is present, retrieve the host SOF counter a=
nd
> @@ -506,7 +514,8 @@ uvc_video_clock_decode(struct uvc_streaming *stream, =
struct uvc_buffer *buf,
>         if (!has_scr)
>                 return;
> =20
> -       /* To limit the amount of data, drop SCRs with an SOF identical t=
o the
> +       /*
> +        * To limit the amount of data, drop SCRs with an SOF identical t=
o the
>          * previous one.
>          */
>         dev_sof =3D get_unaligned_le16(&data[header_size - 2]);
> @@ -518,7 +527,8 @@ uvc_video_clock_decode(struct uvc_streaming *stream, =
struct uvc_buffer *buf,
>         host_sof =3D usb_get_current_frame_number(stream->dev->udev);
>         time =3D uvc_video_get_time();
> =20
> -       /* The UVC specification allows device implementations that can't=
 obtain
> +       /*
> +        * The UVC specification allows device implementations that can't=
 obtain
>          * the USB frame number to keep their own frame counters as long =
as they
>          * match the size and frequency of the frame number associated wi=
th USB
>          * SOF tokens. The SOF values sent by such devices differ from th=
e USB
> @@ -756,7 +766,8 @@ void uvc_video_clock_update(struct uvc_streaming *str=
eam,
>         y1 =3D NSEC_PER_SEC;
>         y2 =3D (u32)ktime_to_ns(ktime_sub(last->host_time, first->host_ti=
me)) + y1;
> =20
> -       /* Interpolated and host SOF timestamps can wrap around at slight=
ly
> +       /*
> +        * Interpolated and host SOF timestamps can wrap around at slight=
ly
>          * different times. Handle this by adding or removing 2048 to or =
from
>          * the computed SOF value to keep it close to the SOF samples mean
>          * value.
> @@ -854,7 +865,8 @@ static void uvc_video_stats_decode(struct uvc_streami=
ng *stream,
>                 stream->stats.frame.pts =3D pts;
>         }
> =20
> -       /* Do all frames have a PTS in their first non-empty packet, or b=
efore
> +       /*
> +        * Do all frames have a PTS in their first non-empty packet, or b=
efore
>          * their first empty packet ?
>          */
>         if (stream->stats.frame.size =3D=3D 0) {
> @@ -945,7 +957,8 @@ size_t uvc_video_stats_dump(struct uvc_streaming *str=
eam, char *buf,
>         unsigned int duration;
>         size_t count =3D 0;
> =20
> -       /* Compute the SCR.SOF frequency estimate. At the nominal 1kHz SOF
> +       /*
> +        * Compute the SCR.SOF frequency estimate. At the nominal 1kHz SOF
>          * frequency this will not overflow before more than 1h.
>          */
>         duration =3D ktime_ms_delta(stream->stats.stream.stop_ts,
> @@ -997,7 +1010,8 @@ static void uvc_video_stats_stop(struct uvc_streamin=
g *stream)
>   * Video codecs
>   */
> =20
> -/* Video payload decoding is handled by uvc_video_decode_start(),
> +/*
> + * Video payload decoding is handled by uvc_video_decode_start(),
>   * uvc_video_decode_data() and uvc_video_decode_end().
>   *
>   * uvc_video_decode_start is called with URB data at the start of a bulk=
 or
> @@ -1037,7 +1051,8 @@ static int uvc_video_decode_start(struct uvc_stream=
ing *stream,
>  {
>         u8 fid;
> =20
> -       /* Sanity checks:
> +       /*
> +        * Sanity checks:
>          * - packet must be at least 2 bytes long
>          * - bHeaderLength value must be at least 2 bytes (see above)
>          * - bHeaderLength value can't be larger than the packet size.
> @@ -1049,7 +1064,8 @@ static int uvc_video_decode_start(struct uvc_stream=
ing *stream,
> =20
>         fid =3D data[1] & UVC_STREAM_FID;
> =20
> -       /* Increase the sequence number regardless of any buffer states, =
so
> +       /*
> +        * Increase the sequence number regardless of any buffer states, =
so
>          * that discontinuous sequence numbers always indicate lost frame=
s.
>          */
>         if (stream->last_fid !=3D fid) {
> @@ -1061,7 +1077,8 @@ static int uvc_video_decode_start(struct uvc_stream=
ing *stream,
>         uvc_video_clock_decode(stream, buf, data, len);
>         uvc_video_stats_decode(stream, data, len);
> =20
> -       /* Store the payload FID bit and return immediately when the buff=
er is
> +       /*
> +        * Store the payload FID bit and return immediately when the buff=
er is
>          * NULL.
>          */
>         if (buf =3D=3D NULL) {
> @@ -1076,7 +1093,8 @@ static int uvc_video_decode_start(struct uvc_stream=
ing *stream,
>                 buf->error =3D 1;
>         }
> =20
> -       /* Synchronize to the input stream by waiting for the FID bit to =
be
> +       /*
> +        * Synchronize to the input stream by waiting for the FID bit to =
be
>          * toggled when the the buffer state is not UVC_BUF_STATE_ACTIVE.
>          * stream->last_fid is initialized to -1, so the first isochronous
>          * frame will always be in sync.
> @@ -1102,7 +1120,8 @@ static int uvc_video_decode_start(struct uvc_stream=
ing *stream,
>                 buf->state =3D UVC_BUF_STATE_ACTIVE;
>         }
> =20
> -       /* Mark the buffer as done if we're at the beginning of a new fra=
me.
> +       /*
> +        * Mark the buffer as done if we're at the beginning of a new fra=
me.
>          * End of frame detection is better implemented by checking the E=
OF
>          * bit (FID bit toggling is delayed by one frame compared to the =
EOF
>          * bit), but some devices don't set the bit at end of frame (and =
the
> @@ -1226,7 +1245,8 @@ static void uvc_video_decode_end(struct uvc_streami=
ng *stream,
>         }
>  }
> =20
> -/* Video payload encoding is handled by uvc_video_encode_header() and
> +/*
> + * Video payload encoding is handled by uvc_video_encode_header() and
>   * uvc_video_encode_data(). Only bulk transfers are currently supported.
>   *
>   * uvc_video_encode_header is called at the start of a payload. It adds =
header
> @@ -1450,7 +1470,8 @@ static void uvc_video_decode_bulk(struct uvc_urb *u=
vc_urb,
>         len =3D urb->actual_length;
>         stream->bulk.payload_size +=3D len;
> =20
> -       /* If the URB is the first of its payload, decode and save the
> +       /*
> +        * If the URB is the first of its payload, decode and save the
>          * header.
>          */
>         if (stream->bulk.header_size =3D=3D 0 && !stream->bulk.skip_paylo=
ad) {
> @@ -1474,7 +1495,8 @@ static void uvc_video_decode_bulk(struct uvc_urb *u=
vc_urb,
>                 }
>         }
> =20
> -       /* The buffer queue might have been cancelled while a bulk transf=
er
> +       /*
> +        * The buffer queue might have been cancelled while a bulk transf=
er
>          * was in progress, so we can reach here with buf equal to NULL. =
Make
>          * sure buf is never dereferenced if NULL.
>          */
> @@ -1483,7 +1505,8 @@ static void uvc_video_decode_bulk(struct uvc_urb *u=
vc_urb,
>         if (!stream->bulk.skip_payload && buf !=3D NULL)
>                 uvc_video_decode_data(uvc_urb, buf, mem, len);
> =20
> -       /* Detect the payload end by a URB smaller than the maximum size =
(or
> +       /*
> +        * Detect the payload end by a URB smaller than the maximum size =
(or
>          * a payload size equal to the maximum) and process the header ag=
ain.
>          */
>         if (urb->actual_length < urb->transfer_buffer_length ||
> @@ -1686,7 +1709,8 @@ static int uvc_alloc_urb_buffers(struct uvc_streami=
ng *stream,
>         if (stream->urb_size)
>                 return stream->urb_size / psize;
> =20
> -       /* Compute the number of packets. Bulk endpoints might transfer U=
VC
> +       /*
> +        * Compute the number of packets. Bulk endpoints might transfer U=
VC
>          * payloads across multiple URBs.
>          */
>         npackets =3D DIV_ROUND_UP(size, psize);
> @@ -1975,7 +1999,8 @@ static int uvc_video_start_transfer(struct uvc_stre=
aming *stream,
>                 }
>         }
> =20
> -       /* The Logitech C920 temporarily forgets that it should not be ad=
justing
> +       /*
> +        * The Logitech C920 temporarily forgets that it should not be ad=
justing
>          * Exposure Absolute during init so restore controls to stored va=
lues.
>          */
>         if (stream->dev->quirks & UVC_QUIRK_RESTORE_CTRLS_ON_INIT)
> @@ -2018,7 +2043,8 @@ int uvc_video_resume(struct uvc_streaming *stream, =
int reset)
>  {
>         int ret;
> =20
> -       /* If the bus has been reset on resume, set the alternate setting=
 to 0.
> +       /*
> +        * If the bus has been reset on resume, set the alternate setting=
 to 0.
>          * This should be the default value, but some devices crash or ot=
herwise
>          * misbehave if they don't receive a SET_INTERFACE request before=
 any
>          * other video control request.
> @@ -2071,14 +2097,16 @@ int uvc_video_init(struct uvc_streaming *stream)
> =20
>         atomic_set(&stream->active, 0);
> =20
> -       /* Alternate setting 0 should be the default, yet the XBox Live V=
ision
> +       /*
> +        * Alternate setting 0 should be the default, yet the XBox Live V=
ision
>          * Cam (and possibly other devices) crash or otherwise misbehave =
if
>          * they don't receive a SET_INTERFACE request before any other vi=
deo
>          * control request.
>          */
>         usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> =20
> -       /* Set the streaming probe control with default streaming paramet=
ers
> +       /*
> +        * Set the streaming probe control with default streaming paramet=
ers
>          * retrieved from the device. Webcams that don't support GET_DEF
>          * requests on the probe control will just keep their current str=
eaming
>          * parameters.
> @@ -2086,7 +2114,8 @@ int uvc_video_init(struct uvc_streaming *stream)
>         if (uvc_get_video_ctrl(stream, probe, 1, UVC_GET_DEF) =3D=3D 0)
>                 uvc_set_video_ctrl(stream, probe, 1);
> =20
> -       /* Initialize the streaming parameters with the probe control cur=
rent
> +       /*
> +        * Initialize the streaming parameters with the probe control cur=
rent
>          * value. This makes sure SET_CUR requests on the streaming commit
>          * control will always use values retrieved from a successful GET=
_CUR
>          * request on the probe control, as required by the UVC specifica=
tion.
> @@ -2095,7 +2124,8 @@ int uvc_video_init(struct uvc_streaming *stream)
>         if (ret < 0)
>                 return ret;
> =20
> -       /* Check if the default format descriptor exists. Use the first
> +       /*
> +        * Check if the default format descriptor exists. Use the first
>          * available format otherwise.
>          */
>         for (i =3D stream->nformats; i > 0; --i) {
> @@ -2110,7 +2140,8 @@ int uvc_video_init(struct uvc_streaming *stream)
>                 return -EINVAL;
>         }
> =20
> -       /* Zero bFrameIndex might be correct. Stream-based formats (inclu=
ding
> +       /*
> +        * Zero bFrameIndex might be correct. Stream-based formats (inclu=
ding
>          * MPEG-2 TS and DV) do not support frames but have a dummy frame
>          * descriptor with bFrameIndex set to zero. If the default frame
>          * descriptor is not found, use the first available frame.
> @@ -2187,7 +2218,8 @@ void uvc_video_stop_streaming(struct uvc_streaming =
*stream)
>         if (stream->intf->num_altsetting > 1) {
>                 usb_set_interface(stream->dev->udev, stream->intfnum, 0);
>         } else {
> -               /* UVC doesn't specify how to inform a bulk-based device
> +               /*
> +                * UVC doesn't specify how to inform a bulk-based device
>                  * when the video stream is stopped. Windows sends a
>                  * CLEAR_FEATURE(HALT) request to the video streaming
>                  * bulk endpoint, mimic the same behaviour.
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index c5b4febd2d94..d2eb107347ea 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -225,7 +225,8 @@ struct gpio_desc;
>  struct sg_table;
>  struct uvc_device;
> =20
> -/* TODO: Put the most frequently accessed fields at the beginning of
> +/*
> + * TODO: Put the most frequently accessed fields at the beginning of
>   * structures to maximize cache efficiency.
>   */
>  struct uvc_control_info {
> @@ -270,8 +271,7 @@ struct uvc_control {
>         struct uvc_entity *entity;
>         struct uvc_control_info info;
> =20
> -       u8 index;       /* Used to match the uvc_control entry with a
> -                          uvc_control_info. */
> +       u8 index;       /* Used to match the uvc_control entry with a uvc=
_control_info. */
>         u8 dirty:1,
>            loaded:1,
>            modified:1,
> @@ -289,7 +289,8 @@ struct uvc_format_desc {
>         u32 fcc;
>  };
> =20
> -/* The term 'entity' refers to both UVC units and UVC terminals.
> +/*
> + * The term 'entity' refers to both UVC units and UVC terminals.
>   *
>   * The type field is either the terminal type (wTerminalType in the term=
inal
>   * descriptor), or the unit type (bDescriptorSubtype in the unit descrip=
tor).
> @@ -308,8 +309,7 @@ struct uvc_format_desc {
> =20
>  struct uvc_entity {
>         struct list_head list;          /* Entity as part of a UVC device=
. */
> -       struct list_head chain;         /* Entity as part of a video devi=
ce
> -                                        * chain. */
> +       struct list_head chain;         /* Entity as part of a video devi=
ce chain. */
>         unsigned int flags;
> =20
>         /*
> @@ -591,7 +591,8 @@ struct uvc_streaming {
>         struct uvc_format *cur_format;
>         struct uvc_frame *cur_frame;
> =20
> -       /* Protect access to ctrl, cur_format, cur_frame and hardware vid=
eo
> +       /*
> +        * Protect access to ctrl, cur_format, cur_frame and hardware vid=
eo
>          * probe control.
>          */
>         struct mutex mutex;
>=20
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> --=20
> Regards,
>=20
> Laurent Pinchart
>
