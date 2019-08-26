Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03C659CAB9
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 09:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730051AbfHZHjd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 03:39:33 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43115 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729911AbfHZHjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 03:39:32 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CD4C8FF805;
        Mon, 26 Aug 2019 07:39:28 +0000 (UTC)
Date:   Mon, 26 Aug 2019 09:40:59 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] Documentation: media: Document V4L2_CTRL_TYPE_AREA
Message-ID: <20190826074059.bby3k6vr25axfbqc@uno.localdomain>
References: <20190823123737.7774-1-ribalda@kernel.org>
 <20190823123737.7774-3-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zva7b4lovy23jea4"
Content-Disposition: inline
In-Reply-To: <20190823123737.7774-3-ribalda@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zva7b4lovy23jea4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Fri, Aug 23, 2019 at 02:37:33PM +0200, Ricardo Ribalda Delgado wrote:
> A struct v4l2_area containing the width and the height of a rectangular
> area.
>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/media/uapi/v4l/vidioc-queryctrl.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> index a3d56ffbf4cc..c09d06ef2b08 100644
> --- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> @@ -443,6 +443,12 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_mpeg2_quantization`, containing MPEG-2
>  	quantization matrices for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_AREA``
> +      - n/a

Can an area be negative ?
I would set these fields to ">= 0" ">= 1" and ">= 0" respectively.

Thanks
   j

> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_area`, containing the width and the height
> +        of a rectangular area.
>      * - ``V4L2_CTRL_TYPE_H264_SPS``
>        - n/a
>        - n/a
> --
> 2.23.0.rc1
>

--zva7b4lovy23jea4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1jjQsACgkQcjQGjxah
VjyoIRAAo/e1dYjiD2z9wTWYXdQQjrFeTggpSQRhz4gr+KvSYkVg1zp/xCbDTU+7
6K/FIkOQapDSOD7AweI+uEITyKVKUlJs3DSN1XdQVna+uB1U1mDHOIl0SFaw64CO
FeBqU3vldLQv8yirsgT+lh/Jv1jpHUPI7blI+b4dx+LIV8Kedy1TT0nmIE+wVlfF
tc7qHYmYxuVn2HDk5XVGDRM15hJOzRs6mAEOsotdbeMF094mRCCDEEFQM4bHvmTF
GBePheZBbLLVNJKdAQX18cit48oK+7r27QiCQFMkAJoWZ9QsacWtC6kFtZPftybK
XMmPg8gS9XO7Q4ug6cA/Gn6hc+mLc5RbYz16cZbjegezexoN5j6j5bppq1HExfUq
r3NFtsLURs0wD7lzS2t1jKujYx4eIbJ0ODf4pde3Y3yQiVE7es1A5vx5HUmFzf71
DJjqxqItf4jZaa0tyt0sj3QxrmbCDCB6SLcXxnOrOuZmv8Jjqxb7kQd/fcf0WQlf
ZhppmsmDkq0oIBYdaBGRbHe2+/ly/XgGNYX0+Kis2yWSmwgct37gBUOpXVyNV1D7
5VP95WWlUNL1WpaJ+KZw0P+Iw3jbHjhqQF2Y01/7enj38SHUHHgY+WsL0BFIz4pb
1JhdJwwnUUKzrp37cS/BZE6t17aIvtnSORZIfdNMgfm+cFZ6o1s=
=iHfL
-----END PGP SIGNATURE-----

--zva7b4lovy23jea4--
