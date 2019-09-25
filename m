Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD3CABD9B4
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 10:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438134AbfIYIUk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 04:20:40 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:41443 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437303AbfIYIUk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 04:20:40 -0400
Received: from uno.localdomain (host71-63-dynamic.19-79-r.retail.telecomitalia.it [79.19.63.71])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 37F5B200007;
        Wed, 25 Sep 2019 08:20:35 +0000 (UTC)
Date:   Wed, 25 Sep 2019 10:22:12 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v6 2/7] Documentation: v4l2_ctrl_new_std_compound
Message-ID: <20190925082203.b2phkyrvfyv6imfv@uno.localdomain>
References: <20190920135137.10052-1-ricardo@ribalda.com>
 <20190920135137.10052-3-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="btb5z6ghh37wnht7"
Content-Disposition: inline
In-Reply-To: <20190920135137.10052-3-ricardo@ribalda.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--btb5z6ghh37wnht7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Fri, Sep 20, 2019 at 03:51:32PM +0200, Ricardo Ribalda Delgado wrote:
> Function for initializing compound controls with a default value.
>
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  Documentation/media/kapi/v4l2-controls.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/media/kapi/v4l2-controls.rst
> index ebe2a55908be..b20800cae3f2 100644
> --- a/Documentation/media/kapi/v4l2-controls.rst
> +++ b/Documentation/media/kapi/v4l2-controls.rst
> @@ -140,6 +140,15 @@ Menu controls with a driver specific menu are added by calling
>                         const struct v4l2_ctrl_ops *ops, u32 id, s32 max,
>                         s32 skip_mask, s32 def, const char * const *qmenu);
>
> +Standard compound controls can be added by calling

Standard compound controls with a driver provided default value can be..

Or is it un-necessary to re-state it?

In any case:
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j
> +:c:func:`v4l2_ctrl_new_std_compound`:
> +
> +.. code-block:: c
> +
> +       struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> +                       const struct v4l2_ctrl_ops *ops, u32 id,
> +                       const union v4l2_ctrl_ptr p_def);
> +
>  Integer menu controls with a driver specific menu can be added by calling
>  :c:func:`v4l2_ctrl_new_int_menu`:
>
> --
> 2.23.0
>

--btb5z6ghh37wnht7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2LI7QACgkQcjQGjxah
Vjy76A/+O7gynK7SxMnxPjAsEGPHX4n74gChYAocM0BjU3hXxUh3SAlWkNrV0VFF
Yyz6OkuPrsxXOEwx6h089M/UXZ8bVwkaSJIvNSao1s24JIGhFyb0Dfm+TmrkfbMB
unXa3V+sBI1vZ+Ffxm78IfCGr4+N6XF7PoR7FAmryR0PsI9kaUlGvceg172yNhQb
k0hkzMOekKpg5GqT7drbeppwxNxzx9KCVh1W7PVE95oCArn36KFth09ioS2n72km
C/myu8IhTEejmBo3/W9V7YoR+4WPeROznHTvi1vAM/7SbQYMq8aOay3BdhZyht/i
AES5m5HdziOPemI5DU/KxkA6w6uFYAHhw33Q5EO0atkDGs4Wcqv/L6Plz0MjeFaK
uB/I1Js8KYmyPtKelUOyR6OPtyidtb8DpA4Uc003c0I620QfRiO0NFQqOj6RMM9d
kywskULvat+FDqYq4AUiEBIa0doqv5xtQQNGuK7xfR2RlVBYV5/p9g/3XPAPiDOM
X9NnG75spbml6zS7c/TXbdIk2Bmso4qZZUpxgeTQvCHiUo7MWKvyjFPJRin0W9Ll
4R1eoaINHWVDgDe+Krrh2FQdZPgJxPBCkBjJBoiLe7HFPWh/FFzect+RPn7Mjp5S
OOlRL+n3kaaxXAlIAMbtlTmsLsvKM0ESza/zM/26mGK7kq90a+k=
=OKwy
-----END PGP SIGNATURE-----

--btb5z6ghh37wnht7--
