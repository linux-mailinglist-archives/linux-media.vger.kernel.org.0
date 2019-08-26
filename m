Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5479CAE4
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 09:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730279AbfHZHpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 03:45:24 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:51375 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbfHZHpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 03:45:24 -0400
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 49EC320000C;
        Mon, 26 Aug 2019 07:45:20 +0000 (UTC)
Date:   Mon, 26 Aug 2019 09:46:51 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] Documentation: Document v4l2_ctrl_new area
Message-ID: <20190826074651.lzp6ofrrsz64alx5@uno.localdomain>
References: <20190823123737.7774-1-ribalda@kernel.org>
 <20190823123737.7774-6-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hvngfzjduokv7sbh"
Content-Disposition: inline
In-Reply-To: <20190823123737.7774-6-ribalda@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--hvngfzjduokv7sbh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Fri, Aug 23, 2019 at 02:37:36PM +0200, Ricardo Ribalda Delgado wrote:
> Helper for creating area controls.
>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>

With this squashed on 5/7 or separated if we want documentation
changes to get in separately

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  Documentation/media/kapi/v4l2-controls.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/media/kapi/v4l2-controls.rst
> index ebe2a55908be..656e9428f6a6 100644
> --- a/Documentation/media/kapi/v4l2-controls.rst
> +++ b/Documentation/media/kapi/v4l2-controls.rst
> @@ -149,6 +149,15 @@ Integer menu controls with a driver specific menu can be added by calling
>  			const struct v4l2_ctrl_ops *ops,
>  			u32 id, s32 max, s32 def, const s64 *qmenu_int);
>
> +Area controls can be added by calling
> +:c:func:`v4l2_ctrl_new_area`:
> +
> +.. code-block:: c
> +
> +	struct v4l2_ctrl *v4l2_ctrl_new_area(struct v4l2_ctrl_handler *hdl,
> +			const struct v4l2_ctrl_ops *ops,
> +			u32 id, const struct v4l2_area *area);
> +
>  These functions are typically called right after the
>  :c:func:`v4l2_ctrl_handler_init`:
>
> --
> 2.23.0.rc1
>

--hvngfzjduokv7sbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1jjmoACgkQcjQGjxah
VjxNCxAAmluieEHUxnZenyuz4HyrtOEFx3tSgMMvq7J1UImMM0McOWxPv36m2pux
Vs6yKn/yxGU5WPxwcYRO0oX5UrbZeZtUomYk0Ls9hi4eNbeDx8e/QL0/GPeTB74J
fUOAXn+w5aOvywm4ujxGroItfWkYfCcem3KCCktOJzPDQOrL6JjyCNcqJCLlrrTJ
2JOYF/dIp1Ib5TdpJXv8ioApYkXTcX2ni/Jknn8mikn5cTfT49jo6D4EwaUL28YE
45w46F0xN2gJwLz27RIL9lHIiuVG4/Ii/sEd+uP4wUBn8cNCS2YLTnrzSKHEw2lL
pxwZmGnR/iv5D8HKlvDwV/9IdHAfBz7QR7CuFGvZq/MKtzKKu6X1VfxQ/iX4nKrC
DKI9ZRYCYKI0xewiaU163XhiNdIb18Jq2GeheVZMpFHof2gzipsCgY/urxTH4DUR
DTpiB8DSEQdrkvKOd9WrbgasnmyB5TX0tnNag0FYVoAJ7Z3OgoHNMoglTGMmxZQC
QwTeXapYZqg9TqXC7SjeG+9PyREpdW9ETLKdNo1bLzdj52fPG0B4es2dUHyWnEYz
CrcyIeSLjIBSd7waNwGku4kg4PCXWNuHZgLnNhCMIDVEl48H/W+fLpZtm469p+vg
RfhPrVmfoXGdG1WsJFfhBPgdbQNmZVEcOnnBfyYiMcK8177xyl0=
=cxJO
-----END PGP SIGNATURE-----

--hvngfzjduokv7sbh--
