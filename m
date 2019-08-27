Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEC679E462
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 11:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbfH0Jeq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 05:34:46 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:45845 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbfH0Jep (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 05:34:45 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6DC8AFF812;
        Tue, 27 Aug 2019 09:34:42 +0000 (UTC)
Date:   Tue, 27 Aug 2019 11:36:09 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 04/10] media: v4l2-ctrls: Add
 V4L2_CID_CAMERA_SENSOR_LOCATION
Message-ID: <20190827093609.ae6wv6yazxqbvpvh@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-6-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="savr4ekm5vpvfriz"
Content-Disposition: inline
In-Reply-To: <20190827092339.8858-6-jacopo@jmondi.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--savr4ekm5vpvfriz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Ups, please ignore this, I changed the commit message and forgot to
wipe the directory where I have formatted out the patches..

On Tue, Aug 27, 2019 at 11:23:31AM +0200, Jacopo Mondi wrote:
> Add support for the newly defined V4L2_CID_CAMERA_SENSOR_LOCATION
> read-only control used to report the camera device mounting position.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 2 ++
>  include/uapi/linux/v4l2-controls.h   | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 1d8f38824631..db7124494530 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -994,6 +994,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
> +	case V4L2_CID_CAMERA_SENSOR_LOCATION:	return "Camera Sensor Location";
>
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1318,6 +1319,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		break;
>  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
> +	case V4L2_CID_CAMERA_SENSOR_LOCATION:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index a2669b79b294..387c2c8553cb 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -912,6 +912,11 @@ enum v4l2_auto_focus_range {
>  #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
>  #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
>
> +#define V4L2_CID_CAMERA_SENSOR_LOCATION		(V4L2_CID_CAMERA_CLASS_BASE+34)
> +#define V4L2_LOCATION_FRONT			0
> +#define V4L2_LOCATION_BACK			1
> +#define V4L2_LOCATION_EXTERNAL			2
> +
>  /* FM Modulator class control IDs */
>
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> --
> 2.23.0
>

--savr4ekm5vpvfriz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1k+YQACgkQcjQGjxah
Vjw9/g/9HeZDETvrXt02OZWUmFfQZ+9zSJtr/M5LEy142dOexUP1aaC0VPfG5OMc
0FN2iDJ5sYMO7JS8DgjpXapdDh93yesf2lG87v8UvPZjIXLrfbrScHNXDxRLzn+K
UMKrh0nVswwj417p+Ciz65b2Y8iyzBxJ3N7f4lDCSs+qzpsf5KwTjeewF5csJpff
Vagy3ERZQwCvI0My2qcxOuis5bwENsXPrVrgPakALLpw+NTNFHylUBwMGKY1eyJe
VkkZvqDzUV8kDa1eLur4GTxWUgLn33VWbp0RMibgFxYdmINBQJ00F2HlKB2MG1j9
edh28EfdlPT7rt/E8/MxfQReL3xcIVfCbnHT87922rFlK6eNnxo1Li0xziSujPye
v/9OGXrEyDZSPIUMzeYAmXAQUOQMY8DIkh62h35R3Lu7yogc3m62wM7MDSyY3CpO
xppO6eVNjMOK1Fc3mmulf7cv5uRpgBDapzTpLtyBwU/EHWjKoZtRYmilgSgbgphK
cGExxbZKsoP1yPZIbAhAo/ikMuDv/7aBPIlCmX3bTJ2fjQ8m99jRfv7ONJpSQboS
8E+WluWxHBf+DIrloKWiX5O/vwzLUuHfZvmesphSfchx/16fBy+jtc3yzu/iO8lq
jSPcV/o0HR5+ouUb7q/sAYKZ+MSVwdIUXqLmlETn0nE7GG+lWno=
=pWR6
-----END PGP SIGNATURE-----

--savr4ekm5vpvfriz--
