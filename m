Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B44579E46B
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 11:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbfH0JfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 05:35:02 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:57515 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728772AbfH0JfC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 05:35:02 -0400
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 542A420000E;
        Tue, 27 Aug 2019 09:34:58 +0000 (UTC)
Date:   Tue, 27 Aug 2019 11:36:29 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 05/10] media: v4l2-ctrls: Add
 V4L2_CID_CAMERA_SENSOR_ROTATION
Message-ID: <20190827093629.r56rsrbrvjufiarr@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-8-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="anjuokcvbfrchwle"
Content-Disposition: inline
In-Reply-To: <20190827092339.8858-8-jacopo@jmondi.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--anjuokcvbfrchwle
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Ups, please ignore this, I changed the commit message and forgot to
wipe the directory where I have formatted out the patches..

On Tue, Aug 27, 2019 at 11:23:33AM +0200, Jacopo Mondi wrote:
> Add support for the newly defined V4L2_CID_CAMERA_SENSOR_ROTATION
> read-only control used to report the camera device mounting rotation.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 2 ++
>  include/uapi/linux/v4l2-controls.h   | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index db7124494530..b7af47a25125 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -995,6 +995,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
>  	case V4L2_CID_CAMERA_SENSOR_LOCATION:	return "Camera Sensor Location";
> +	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1320,6 +1321,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
>  	case V4L2_CID_CAMERA_SENSOR_LOCATION:
> +	case V4L2_CID_CAMERA_SENSOR_ROTATION:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 387c2c8553cb..f2be7a99818e 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -917,6 +917,8 @@ enum v4l2_auto_focus_range {
>  #define V4L2_LOCATION_BACK			1
>  #define V4L2_LOCATION_EXTERNAL			2
>
> +#define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
> +
>  /* FM Modulator class control IDs */
>
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> --
> 2.23.0
>

--anjuokcvbfrchwle
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1k+Z0ACgkQcjQGjxah
VjwiGBAAp2YdtzqrFhf7cqftHBvBABwyyp3A3M3SDYCDT0qSsVMdT6esBg3/hml/
pBNMYFliXMJVMkR/dK/j0K68vT1yvWRkiom5+V7bh5JABw2yMj7KUaoy7OGA6W68
dv887f/1zXgRcDj6G6NMErg0z9O/StAzD6AAJ+HNiye8YmZOUXjWhTXkMvDjqpWL
5nL90eNFiPXk13F+4d7pldmTdWj1UfjkbNsveKZz18Tn+XdjFNSzKQ7JSos8W0gD
TrzjILEAE0Vl9VMVw+fJHfBu/VBCkm6WdwLv3KLiuPermxWAfTlwewxWIvhj9Df3
5lRnKHK4VC+zAiIaytq80lA63g+7qFSYoQz9DqQqHQM1zMGfcCc0t/+ici5CzPqL
U1/Ommp2XlipXNLvIFKBDZPxyVzimh4Q97QkGrPq27H/1QAK+uQy1zWRRSI5xJjA
RCoF8MnFRWfFgRDzkowT7gYAAB7wt8k2vTeZ9YPIwpQo+/kkkgtcHaePjamMKBuc
GjHRgNLU2TQhf9FKscrQzzJ1ISCQeonzW6xcJq4ydLobgzmd48rRNfOmp1/lM8at
K2Ze9NwNQkljbztGO7VLxc0KKkDl6ijjWULROpf+px9j3CqKssBOycIWxvmKzpW1
KzWdzZAZbyEyLWXC6XTXLvNKIUsGmbkQirhdNa5Y+ywn9UZ4zqM=
=VJtv
-----END PGP SIGNATURE-----

--anjuokcvbfrchwle--
