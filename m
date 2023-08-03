Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C9876E3CB
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 10:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234922AbjHCI6n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 04:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234889AbjHCI6b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 04:58:31 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7671716
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 01:58:27 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3738w3t3129881;
        Thu, 3 Aug 2023 03:58:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1691053083;
        bh=yqmUKaQcFDvtcj130y5CWNavo9WcO/eGmSFurPPaJ18=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=aIlIkuJBRM0c4WvjU5Da8Ye9HH7R0F6kx3mA1U175fq5mLrtl9tsX7//nMG3/dtJm
         +OsiV51XOAjzB/reGowezmKcMW897irALIKGAl3KLltz5apWovcAud4iiIfQnKovAo
         9k0DeAHfZeeOa5muDhFWVlvgSSMwhwMZ7jFnrrbw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3738w39G082632
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Aug 2023 03:58:03 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 3
 Aug 2023 03:58:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 3 Aug 2023 03:58:01 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3738w0os015752;
        Thu, 3 Aug 2023 03:58:01 -0500
Date:   Thu, 3 Aug 2023 14:28:05 +0530
From:   Jai Luthra <j-luthra@ti.com>
To:     Marek Vasut <marex@denx.de>
CC:     <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Aishwarya Kothari <aishwarya.kothari@toradex.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Marcel Ziswiler <marcel@ziswiler.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v2] media: ov5640: Enable MIPI interface in
 ov5640_set_power_mipi()
Message-ID: <dxagorolo3qkq3oqqosjl7ljkrdw5wgzafteumcueoonl5gtjj@jrmdi4ho5b5w>
References: <20230802144725.34099-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="quo6hak4ga76txec"
Content-Disposition: inline
In-Reply-To: <20230802144725.34099-1-marex@denx.de>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--quo6hak4ga76txec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Thanks for the patch.

On Aug 02, 2023 at 16:47:25 +0200, Marek Vasut wrote:
> Set OV5640_REG_IO_MIPI_CTRL00 bit 2 to 1 instead of 0, since 1 means
> MIPI CSI2 interface, while 0 means CPI parallel interface.
>=20
> In the ov5640_set_power_mipi() the interface should obviously be set
> to MIPI CSI2 since this functions is used to power up the sensor when
> operated in MIPI CSI2 mode. The sensor should not be in CPI mode in
> that case.
>=20
> This fixes a corner case where capturing the first frame on i.MX8MN
> with CSI/ISI resulted in corrupted frame.
>=20
> Fixes: aa4bb8b8838f ("media: ov5640: Re-work MIPI startup sequence")
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Tested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com> # [Test on imx6q]

Tested-by: Jai Luthra <j-luthra@ti.com> # [Test on bplay, sk-am62]

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Aishwarya Kothari <aishwarya.kothari@toradex.com>
> Cc: Francesco Dolcini <francesco@dolcini.it>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
> Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Cc: Jai Luthra <j-luthra@ti.com>
> Cc: Marcel Ziswiler <marcel@ziswiler.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Steve Longerbeam <slongerbeam@gmail.com>
> Cc: linux-media@vger.kernel.org
> ---
> V2: - Update commit message to mention this fixes the first corrupted fra=
me
>     - Collect RB/TB
>     - Expand CC list
> ---
>  drivers/media/i2c/ov5640.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index ff0aef915fca5..5fe85aa2d2ec4 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2539,9 +2539,9 @@ static int ov5640_set_power_mipi(struct ov5640_dev =
*sensor, bool on)
>  	 *		  "ov5640_set_stream_mipi()")
>  	 * [4] =3D 0	: Power up MIPI HS Tx
>  	 * [3] =3D 0	: Power up MIPI LS Rx
> -	 * [2] =3D 0	: MIPI interface disabled
> +	 * [2] =3D 1	: MIPI interface enabled
>  	 */
> -	ret =3D ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
> +	ret =3D ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x44);
>  	if (ret)
>  		return ret;
> =20
> --=20
> 2.40.1
>=20
>=20

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--quo6hak4ga76txec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmTLbBwACgkQQ96R+SSa
cUXDnw/5AfvHkaXIMHJBhvnD8RQjAsCOiiwoG0S640EyAQNpKHeBX+pbBOqYL/bc
llG2Tqr/saLQ58PEnqNBXP5g6xnV47MUPuM/hYo+hhpLxJiCstMb1CcD0DHBjWDw
PC5hpxYn7tPbDsh0VSlZROJoYZ3TErG45UZag+RBzW/W/7b7DKO/nDJG5vIbn0+P
64SdzIOlsgM4LRqzsQkunkhZMqTz7t42zhEat6JuHIjoYUGae3f6QX+zQopPnrOr
Uk9L3TjVlMLb6j2/PQRl6QhUSW9Yd3yGycruXCobj49XPMsVZDn0SxEFr+vhwyk+
o6kPEQnqf0rMZKseYgQoPuaRfCitjQhAcqzdAmxK6ctNy9XExZiaNPMqzG6BhwsQ
gO5v7bFuOpCqrxW9X2i9KNnE+Vfs3Jc0V7LrCWA6+1wp58NXfaHtAulgHJ62vpMr
T4BGlv1aZxkSsTZpRm38EVTtaMGClhKNtx5l4qKESO57HrJr/bQUzn3Szog/6jx0
Id74s5nYkCRnCk3rvxwpGiKgwaiTguyr5jK4FabhO71aKQtpKcS3mR3cF3Gnw5kN
DNgxkQv6ggZhKFzkHBjsqtXlXR0ZavIka4uJzepr3ZchUyEnYXhN7ls1/gjTuYpc
mZhSKP5zkpI3kXCXygGMJNtVd+sFH6zU7P69TrrmrHAw3XPCpwM=
=QFEG
-----END PGP SIGNATURE-----

--quo6hak4ga76txec--
