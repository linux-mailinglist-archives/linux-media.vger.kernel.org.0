Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 058CBBD9E9
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 10:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634143AbfIYIcn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 04:32:43 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:39277 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634140AbfIYIcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 04:32:43 -0400
X-Originating-IP: 79.19.63.71
Received: from uno.localdomain (host71-63-dynamic.19-79-r.retail.telecomitalia.it [79.19.63.71])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2ABE6E0007;
        Wed, 25 Sep 2019 08:32:39 +0000 (UTC)
Date:   Wed, 25 Sep 2019 10:34:21 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [PATCH v6 4/7] Documentation: media: Document V4L2_CTRL_TYPE_AREA
Message-ID: <20190925083421.ronwsvmqeu5quxpx@uno.localdomain>
References: <20190920135137.10052-1-ricardo@ribalda.com>
 <20190920135137.10052-5-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jvmepk34h776iu7a"
Content-Disposition: inline
In-Reply-To: <20190920135137.10052-5-ricardo@ribalda.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--jvmepk34h776iu7a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Fri, Sep 20, 2019 at 03:51:34PM +0200, Ricardo Ribalda Delgado wrote:
> From: Ricardo Ribalda Delgado <ribalda@kernel.org>
>
> A struct v4l2_area containing the width and the height of a rectangular
> area.
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  Documentation/media/uapi/v4l/vidioc-queryctrl.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> index a3d56ffbf4cc..33aff21b7d11 100644
> --- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> @@ -443,6 +443,12 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_mpeg2_quantization`, containing MPEG-2
>  	quantization matrices for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_AREA``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_area`, containing the width and the height
> +        of a rectangular area. Units depend on the use case.

I recall Hans too was in favour of having min, max and step defined
(and applied to both width and height).

Really a minor issue from my side, feel free to keep it the way it is
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j
>      * - ``V4L2_CTRL_TYPE_H264_SPS``
>        - n/a
>        - n/a
> --
> 2.23.0
>

--jvmepk34h776iu7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2LJowACgkQcjQGjxah
Vjxe7RAAs5u7tbvDOZmmKv/xCoPoxID0YGDFn+9bzAQu2F/cUHGbIrJjLMx2oBFo
xRskqRp6wdztDyngFlVtDTaaEqvGtfhRagAJ7xe0gXvZAoKgMchCv027lWAz4KyL
wIHOFqrAFvvy3dqc4V/pzfifgzqUCC6NtMXEkyNSPopbVZG+PVOHdADfL3cDzqxT
TObImqKYGfXkEZJJCX6hYWulJr53JRf8Ks2UHrO8z5SGo5xU/hzMWZY/2GH8lo9b
vN29/q3urnCExZjwGSJyGQ7KE3HRXRywo1AO+QNvT4bnr4+zJ++HO2QmWcfemcn2
sqjkfYN3EKaCe/I0ZhO/Rb9C+kvWypGIguvLCuQuZO+mJky3Hh7sxdCW5AUUey2j
BJe+LrweRz5QIorCxWSxMg5IaU/DvS3vPiXacX+aEDncSyT2LEVrVEl1E2UJKnHr
K4F4TKNr00U73kw7wm7YNS8v4g4ZMzzrppoR6Hlrugl5FlwCsZauBDeaGDoM1joI
5EsaDPDkTUBn/4W7LbPZfipUccue1xFp+257wT6tDRhQ/S0gqax9JoRWOxMqpo7f
JtNpCpbA9zdYmT+ZuELoMnTKRc3jMRFf0SX7S8mph7p/y991gtweFPbN0iEVbZ2k
/2EinpLCT6zWw1rBQM38Wngs7tx6MUG0HJk01i3x9bJImhi0was=
=aOcf
-----END PGP SIGNATURE-----

--jvmepk34h776iu7a--
