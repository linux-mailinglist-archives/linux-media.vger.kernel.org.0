Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5325B3B86
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 17:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbiIIPLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 11:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232164AbiIIPLP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 11:11:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE5D915F9
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 08:11:11 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWfew-0001fC-3Z; Fri, 09 Sep 2022 17:11:10 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWfev-00074c-Fj; Fri, 09 Sep 2022 17:11:09 +0200
Date:   Fri, 9 Sep 2022 17:11:09 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v13 3/6] usb: gadget: uvc: add v4l2 enumeration api calls
Message-ID: <20220909151109.GB10416@pengutronix.de>
References: <20220908194750.3750310-1-m.grzeschik@pengutronix.de>
 <20220908194750.3750310-4-m.grzeschik@pengutronix.de>
 <93eb0860-2242-4ae4-d042-b7be88cb2ca0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
In-Reply-To: <93eb0860-2242-4ae4-d042-b7be88cb2ca0@ideasonboard.com>
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


--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, Sep 09, 2022 at 01:56:50PM +0100, Dan Scally wrote:
>On 08/09/2022 20:47, Michael Grzeschik wrote:
>>This patch adds support to the v4l2 VIDIOCs for enum_format,
>>enum_framesizes and enum_frameintervals. This way, the userspace
>>application can use these VIDIOCS to query the via configfs exported
>>frame capabilities. With thes callbacks the userspace doesn't have to
>>bring its own configfs parser.
>>
>>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>>---
>>v1 -> v13:
>>    - refactored the enum_ callbacks to this separate new patch
>>    - renamed +uvc_v4l2_enum_fmt to uvc_v4l2_enum_format
>>    - improved coding style
>>    - removed unused leftover variable uvc_video in enum functions
>>
>>  drivers/usb/gadget/function/f_uvc.c    |  32 +++++
>>  drivers/usb/gadget/function/uvc.h      |   2 +
>>  drivers/usb/gadget/function/uvc_v4l2.c | 176 +++++++++++++++++++++++++
>>  3 files changed, 210 insertions(+)
>>
>>diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fun=
ction/f_uvc.c
>>index f4f6cf75930beb..7c416170b499e0 100644
>>--- a/drivers/usb/gadget/function/f_uvc.c
>>+++ b/drivers/usb/gadget/function/f_uvc.c
>>@@ -888,6 +888,7 @@ static void uvc_free(struct usb_function *f)
>>  	struct uvc_device *uvc =3D to_uvc(f);
>>  	struct f_uvc_opts *opts =3D container_of(f->fi, struct f_uvc_opts,
>>  					       func_inst);
>>+	config_item_put(&uvc->header->item);
>>  	--opts->refcnt;
>>  	kfree(uvc);
>>  }
>>@@ -941,6 +942,7 @@ static struct usb_function *uvc_alloc(struct usb_func=
tion_instance *fi)
>>  	struct uvc_device *uvc;
>>  	struct f_uvc_opts *opts;
>>  	struct uvc_descriptor_header **strm_cls;
>>+	struct config_item *streaming, *header, *h;
>>  	uvc =3D kzalloc(sizeof(*uvc), GFP_KERNEL);
>>  	if (uvc =3D=3D NULL)
>>@@ -973,6 +975,36 @@ static struct usb_function *uvc_alloc(struct usb_fun=
ction_instance *fi)
>>  	uvc->desc.fs_streaming =3D opts->fs_streaming;
>>  	uvc->desc.hs_streaming =3D opts->hs_streaming;
>>  	uvc->desc.ss_streaming =3D opts->ss_streaming;
>>+
>>+	streaming =3D config_group_find_item(&opts->func_inst.group, "streaming=
");
>>+	if (!streaming) {
>>+		config_item_put(streaming);
>
>
>This shouldn't be necessary as it's a no-op if streaming is null
>
>>+		mutex_unlock(&opts->lock);
>>+		return ERR_PTR(-ENOMEM);
>
>
>Why ENOMEM? I wouldn't expect that error here...I think I'd expect=20
>ENOENT. You also aren't freeing uvc here so that memory would be lost.
>
>
>>+	}
>>+
>>+	header =3D config_group_find_item(to_config_group(streaming), "header");
>>+	config_item_put(streaming);
>>+	if (!header) {
>>+		config_item_put(header);
>>+		mutex_unlock(&opts->lock);
>>+		return ERR_PTR(-ENOMEM);
>>+	}
>>+
>>+	h =3D config_group_find_item(to_config_group(header), "h");
>>+	config_item_put(header);
>>+	if (!h) {
>>+		config_item_put(h);
>>+		mutex_unlock(&opts->lock);
>>+		return ERR_PTR(-ENOMEM);
>>+	}
>
>
>Similar comments for these two error paths. Given the similarity of=20
>those sections you could have something like;
>
>
>=A0=A0=A0 streaming =3D config_group_find_item(&opts->func_inst.group,=20
>"streaming");
>=A0=A0 =A0if (!streaming)
>=A0=A0 =A0=A0=A0=A0 goto err_config;
>
>=A0=A0 =A0... rest of the function ...
>
>=A0=A0 =A0return &uvc->func;
>
>err_config:
>=A0=A0 =A0mutex_unlock(&opts->lock);
>=A0=A0 =A0kfree(uvc);
>=A0=A0 =A0return -ENOENT; // or whatever is appropriate
>}
>
>>+
>>+	uvc->header =3D to_uvcg_streaming_header(h);
>>+	if (!uvc->header->linked) {
>>+		mutex_unlock(&opts->lock);
>>+		return ERR_PTR(-EBUSY);
>
>
>This path on the other hand should have config_item_put(h) I think,=20
>and would also need to kfree(uvc).

All this makes totally sense. I will fix this patch and take also patch
4/6 and create a new series. The patches 5/6 and 6/6 will become a
separate series which I will send after the first part was merged. So we
can work us through the missing peaces step by step.

Regards,
Michael

>>+	}
>>+
>>  	++opts->refcnt;
>>  	mutex_unlock(&opts->lock);
>>diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/funct=
ion/uvc.h
>>index 58e383afdd4406..641cf2e7afaf6e 100644
>>--- a/drivers/usb/gadget/function/uvc.h
>>+++ b/drivers/usb/gadget/function/uvc.h
>>@@ -133,6 +133,8 @@ struct uvc_device {
>>  	bool func_connected;
>>  	wait_queue_head_t func_connected_queue;
>>+	struct uvcg_streaming_header *header;
>>+
>>  	/* Descriptors */
>>  	struct {
>>  		const struct uvc_descriptor_header * const *fs_control;
>>diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/=
function/uvc_v4l2.c
>>index 511f106f984375..63cb5a40306c75 100644
>>--- a/drivers/usb/gadget/function/uvc_v4l2.c
>>+++ b/drivers/usb/gadget/function/uvc_v4l2.c
>>@@ -18,12 +18,92 @@
>>  #include <media/v4l2-dev.h>
>>  #include <media/v4l2-event.h>
>>  #include <media/v4l2-ioctl.h>
>>+#include <media/v4l2-uvc.h>
>>  #include "f_uvc.h"
>>  #include "uvc.h"
>>  #include "uvc_queue.h"
>>  #include "uvc_video.h"
>>  #include "uvc_v4l2.h"
>>+#include "uvc_configfs.h"
>>+
>>+static struct uvc_format_desc *to_uvc_format(struct uvcg_format *uformat)
>>+{
>>+	char guid[16] =3D UVC_GUID_FORMAT_MJPEG;
>>+	struct uvc_format_desc *format;
>>+	struct uvcg_uncompressed *unc;
>>+
>>+	if (uformat->type =3D=3D UVCG_UNCOMPRESSED) {
>>+		unc =3D to_uvcg_uncompressed(&uformat->group.cg_item);
>>+		if (!unc)
>>+			return ERR_PTR(-EINVAL);
>>+
>>+		memcpy(guid, unc->desc.guidFormat, sizeof(guid));
>>+	}
>>+
>>+	format =3D uvc_format_by_guid(guid);
>>+	if (!format)
>>+		return ERR_PTR(-EINVAL);
>>+
>>+	return format;
>>+}
>>+
>>+struct uvcg_format *find_format_by_index(struct uvc_device *uvc, int ind=
ex)
>>+{
>>+	struct uvcg_format_ptr *format;
>>+	struct uvcg_format *uformat =3D NULL;
>>+	int i =3D 1;
>>+
>>+	list_for_each_entry(format, &uvc->header->formats, entry) {
>>+		if (index =3D=3D i) {
>>+			uformat =3D format->fmt;
>>+			break;
>>+		}
>>+		i++;
>>+	}
>>+
>>+	return uformat;
>>+}
>>+
>>+struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
>>+				       struct uvcg_format *uformat,
>>+				       int index)
>>+{
>>+	struct uvcg_format_ptr *format;
>>+	struct uvcg_frame_ptr *frame;
>>+	struct uvcg_frame *uframe =3D NULL;
>>+
>>+	list_for_each_entry(format, &uvc->header->formats, entry) {
>>+		if (format->fmt->type !=3D uformat->type)
>>+			continue;
>>+		list_for_each_entry(frame, &format->fmt->frames, entry) {
>>+			if (index =3D=3D frame->frm->frame.b_frame_index) {
>>+				uframe =3D frame->frm;
>>+				break;
>>+			}
>>+		}
>>+	}
>>+
>>+	return uframe;
>>+}
>>+
>>+static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
>>+					      u32 pixelformat)
>>+{
>>+	struct uvcg_format_ptr *format;
>>+	struct uvcg_format *uformat =3D NULL;
>>+
>>+	list_for_each_entry(format, &uvc->header->formats, entry) {
>>+		struct uvc_format_desc *fmtdesc =3D to_uvc_format(format->fmt);
>>+
>>+		if (fmtdesc->fcc =3D=3D pixelformat) {
>>+			uformat =3D format->fmt;
>>+			break;
>>+		}
>>+	}
>>+
>>+	return uformat;
>>+}
>>  /* --------------------------------------------------------------------=
------
>>   * Requests handling
>>@@ -134,6 +214,99 @@ uvc_v4l2_set_format(struct file *file, void *fh, str=
uct v4l2_format *fmt)
>>  	return 0;
>>  }
>>+static int
>>+uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
>>+		struct v4l2_frmivalenum *fival)
>>+{
>>+	struct video_device *vdev =3D video_devdata(file);
>>+	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>>+	struct uvcg_format *uformat =3D NULL;
>>+	struct uvcg_frame *uframe =3D NULL;
>>+	struct uvcg_frame_ptr *frame;
>>+
>>+	uformat =3D find_format_by_pix(uvc, fival->pixel_format);
>>+	if (!uformat)
>>+		return -EINVAL;
>>+
>>+	list_for_each_entry(frame, &uformat->frames, entry) {
>>+		if (frame->frm->frame.w_width =3D=3D fival->width &&
>>+		    frame->frm->frame.w_height =3D=3D fival->height) {
>>+			uframe =3D frame->frm;
>>+			break;
>>+		}
>>+	}
>>+	if (!uframe)
>>+		return -EINVAL;
>>+
>>+	if (fival->index >=3D uframe->frame.b_frame_interval_type)
>>+		return -EINVAL;
>>+
>>+	fival->discrete.numerator =3D
>>+		uframe->dw_frame_interval[fival->index];
>>+
>>+	/* TODO: handle V4L2_FRMIVAL_TYPE_STEPWISE */
>>+	fival->type =3D V4L2_FRMIVAL_TYPE_DISCRETE;
>>+	fival->discrete.denominator =3D 10000000;
>>+	v4l2_simplify_fraction(&fival->discrete.numerator,
>>+		&fival->discrete.denominator, 8, 333);
>>+
>>+	return 0;
>>+}
>>+
>>+static int
>>+uvc_v4l2_enum_framesizes(struct file *file, void *fh,
>>+		struct v4l2_frmsizeenum *fsize)
>>+{
>>+	struct video_device *vdev =3D video_devdata(file);
>>+	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>>+	struct uvcg_format *uformat =3D NULL;
>>+	struct uvcg_frame *uframe =3D NULL;
>>+
>>+	uformat =3D find_format_by_pix(uvc, fsize->pixel_format);
>>+	if (!uformat)
>>+		return -EINVAL;
>>+
>>+	if (fsize->index >=3D uformat->num_frames)
>>+		return -EINVAL;
>>+
>>+	uframe =3D find_frame_by_index(uvc, uformat, fsize->index + 1);
>>+	if (!uframe)
>>+		return -EINVAL;
>>+
>>+	fsize->type =3D V4L2_FRMSIZE_TYPE_DISCRETE;
>>+	fsize->discrete.width =3D uframe->frame.w_width;
>>+	fsize->discrete.height =3D uframe->frame.w_height;
>>+
>>+	return 0;
>>+}
>>+
>>+static int
>>+uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>>+{
>>+	struct video_device *vdev =3D video_devdata(file);
>>+	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>>+	struct uvc_format_desc *fmtdesc;
>>+	struct uvcg_format *uformat;
>>+
>>+	if (f->index >=3D uvc->header->num_fmt)
>>+		return -EINVAL;
>>+
>>+	uformat =3D find_format_by_index(uvc, f->index + 1);
>>+	if (!uformat)
>>+		return -EINVAL;
>>+
>>+	if (uformat->type !=3D UVCG_UNCOMPRESSED)
>>+		f->flags |=3D V4L2_FMT_FLAG_COMPRESSED;
>>+
>>+	fmtdesc =3D to_uvc_format(uformat);
>>+	f->pixelformat =3D fmtdesc->fcc;
>>+
>>+	strscpy(f->description, fmtdesc->name, sizeof(f->description));
>>+	f->description[strlen(fmtdesc->name) - 1] =3D 0;
>>+
>>+	return 0;
>>+}
>>+
>>  static int
>>  uvc_v4l2_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffer=
s *b)
>>  {
>>@@ -300,6 +473,9 @@ const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops =3D {
>>  	.vidioc_querycap =3D uvc_v4l2_querycap,
>>  	.vidioc_g_fmt_vid_out =3D uvc_v4l2_get_format,
>>  	.vidioc_s_fmt_vid_out =3D uvc_v4l2_set_format,
>>+	.vidioc_enum_frameintervals =3D uvc_v4l2_enum_frameintervals,
>>+	.vidioc_enum_framesizes =3D uvc_v4l2_enum_framesizes,
>>+	.vidioc_enum_fmt_vid_out =3D uvc_v4l2_enum_format,
>>  	.vidioc_reqbufs =3D uvc_v4l2_reqbufs,
>>  	.vidioc_querybuf =3D uvc_v4l2_querybuf,
>>  	.vidioc_qbuf =3D uvc_v4l2_qbuf,
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmMbV4sACgkQC+njFXoe
LGQg2g//bPddALKM+SjzsN/ogTJE6S85GnlKnBmcb2Od2zc2Y2s9UGXd9dgBjaUk
LAzVAWBKVAJcZx/gXhR6N/54jzhI5uYqqiw6JbMMixsrexmmjLxmCYP1mgNzZUzl
cjtsZ7EVWwagHiHYTpzKjFPBwAuEeu3pCLw8uvPfBm8v9rw13YRzCBcj0xW9etOa
iu9I9PS9W04l3L9h1QGnJ8uBF/hJvSzFawKw8CY7L49YzAd5ejylxBXW2kBQ/bvw
cCbEkORrkSoU7WxQP4GSfO/ZLNpzTElz1RG90pdnnWC0izT0e7z9moBxBbRscD1Q
xb9OzhVO/q1i9D2u2CT0z1pEVkXamzM6uOb20M0SGlCYKoNGfrFObOcQdwk7tMr4
IwtcHqNHWwGU40qMLZlfggJ+fzKHHKZUT0kmB8oyy9IGzZfO/Bv+iTDmHLeiKogY
khK0jnasQnrlvPCPo5NV33J6oSZHevZwB/khI/njnUXP9zRaMg8HrJPUJWBQvNrq
Tlqeu8hPZd9h4E0PDVbPLu3M/eqoqVtzYvQFTPrRjGwJx9H4HQ1oKYRosTIKgUB3
ifCH2ZvxEHFpKxv00BKwzzsFGvNcGUlHQpc2VuHUHXEYWkQsIP31TB22KzN4pGjJ
IVR5BCXhdcRIth+2jF8zTZ5uEQRG6euAGi/49tygXnHzGj+Ukpc=
=XwxM
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
