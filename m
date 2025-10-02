Return-Path: <linux-media+bounces-43645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5554BBB4035
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 15:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2BD8169022
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 13:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C650311952;
	Thu,  2 Oct 2025 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="A3CtyCiu"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E188A2D1936;
	Thu,  2 Oct 2025 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759411159; cv=pass; b=aGBVvR6zWBkZfwkeqTLllSZnK94e5xIPb8fQpnUIWnfykRkc8dYIymUR0+VPS6QiqBigDmpasvk19gI6wBbV/0BZnEEvUO1SKjDRMlqH6HMcKuXyHlCmc7M3nymHvhAcrL8rfa/90Z1pV2VRhHkUAWUvf7t9UV7HICii2up8aF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759411159; c=relaxed/simple;
	bh=XTmLW4q7cfJmF1GIlA8/Rq0722l7Zyvhzrfzr4Yu5qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+zjcPdgfrSi8ym40eMdTAAiNTFCbHZpqfxP2z3XJrKQ3Z4DODH8A3BrCkKqUbPRR9hLywB5+lz86ZuH9WC6jG2utpJ7yKyy9K9PFnNiosIpD0q79C3L+jJ2yhy0mvuAvosdSfZFMZXK8hILU9tJ3Bpeq1WNViouWmIjmN8IsOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=A3CtyCiu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759411127; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YJgScdIEFOvtA2GkAzOXaIhzvg2blpR58HQHojl2TmiT47Gx069KQyjYZJE/DqpxHIxIE0DDI1XNij9lvq8VvYioXgnUp/M0yD55ipv3m8rRnHlyKhLOGFJmuoVDzhP5ThzoqF2rKPo4sowncRNt0XhVMPqV6uLJmlQowm6a1Ak=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759411127; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=W6BSTdVZnFTxPyRB6ZqS8dnVm1Cj7O4bo/Y5zLmoSVM=; 
	b=L4MXO4/tLN+vn2j8JD/C+u3Bo0CK3GrLOQ8OUx6ZcuKnH8oBdtMwbhkjzxTIomJ5mo3aDXdbPMXhsmfTF7uZygCmqBTwnQ7gGMKNtPK/SicS8SjahKBVse8PGnTERnpNEif6jqB6KNqKaePyjjIEHfZ1PxDKhuAltrw3ypKifIk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759411127;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=W6BSTdVZnFTxPyRB6ZqS8dnVm1Cj7O4bo/Y5zLmoSVM=;
	b=A3CtyCiuea4cdi3Y8LPB6IgL+h5FK7Le492q6ANQL++vsn6AFrClNFo9itzl+Wth
	6K/j40nCV+pj+am9lrbRfTMLzVNpSUogy1jQ0RTVS9tkO5UuaIq8hlHJ9f6TwxBtIIO
	0T1QhiPg+w0TLyxRpBMq/SD+RSVEIgNG/npaf6Ao=
Received: by mx.zohomail.com with SMTPS id 1759411125401535.0475115871203;
	Thu, 2 Oct 2025 06:18:45 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 4FB6218077C; Thu, 02 Oct 2025 15:18:41 +0200 (CEST)
Date: Thu, 2 Oct 2025 15:18:41 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, jose.abreu@synopsys.com, nelson.costa@synopsys.com, 
	shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com, kernel@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1] media: synopsys: hdmirx: Detect broken interrupt
Message-ID: <do3p4ncc6issxwqam3oeo54xtoi6jvw7maeprdbfkdn3b3aabr@ilwktxqyf4ap>
References: <20251001175044.502393-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mhs7pk4kudawg6xk"
Content-Disposition: inline
In-Reply-To: <20251001175044.502393-1-dmitry.osipenko@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/259.363.73
X-ZohoMailClient: External


--mhs7pk4kudawg6xk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] media: synopsys: hdmirx: Detect broken interrupt
MIME-Version: 1.0

Hello Dmitry,

On Wed, Oct 01, 2025 at 08:50:44PM +0300, Dmitry Osipenko wrote:
> Downstream version of RK3588 U-Boot uses customized TF-A that remaps
> HDMIRX hardware interrupt, routing it via firmware that isn't supported
> by upstream driver.
>=20
> Detect broken interrupt and print a clarifying error message about a need
> to use open-source TF-A with this driver.
>=20
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 85 ++++++++++++++++++-
>  .../platform/synopsys/hdmirx/snps_hdmirx.h    |  2 +
>  2 files changed, 85 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index b7d278b3889f..faca601d72a4 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -138,6 +138,7 @@ struct snps_hdmirx_dev {
>  	struct clk_bulk_data *clks;
>  	struct regmap *grf;
>  	struct regmap *vo1_grf;
> +	struct completion cr_read_done;
>  	struct completion cr_write_done;
>  	struct completion timer_base_lock;
>  	struct completion avi_pkt_rcv;
> @@ -796,6 +797,41 @@ static int wait_reg_bit_status(struct snps_hdmirx_de=
v *hdmirx_dev, u32 reg,
>  	return 0;
>  }
> =20
> +static int hdmirx_phy_register_read(struct snps_hdmirx_dev *hdmirx_dev,
> +				    u32 phy_reg, u32 *val)
> +{
> +	struct device *dev =3D hdmirx_dev->dev;
> +	u32 status;
> +
> +	reinit_completion(&hdmirx_dev->cr_read_done);
> +	/* clear irq status */
> +	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_2_INT_CLEAR, 0xffffffff);
> +	/* en irq */
> +	hdmirx_update_bits(hdmirx_dev, MAINUNIT_2_INT_MASK_N,
> +			   PHYCREG_CR_READ_DONE, PHYCREG_CR_READ_DONE);
> +	/* write phy reg addr */
> +	hdmirx_writel(hdmirx_dev, PHYCREG_CONFIG1, phy_reg);
> +	/* config read enable */
> +	hdmirx_writel(hdmirx_dev, PHYCREG_CONTROL, PHYCREG_CR_PARA_READ_P);
> +
> +	if (!wait_for_completion_timeout(&hdmirx_dev->cr_read_done,
> +					 msecs_to_jiffies(20))) {
> +		dev_err(dev, "%s wait cr read done failed\n", __func__);
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* read phy reg value */
> +	status =3D hdmirx_readl(hdmirx_dev, PHYCREG_STATUS);
> +	if (!(status & PHYCREG_CR_PARA_DATAVALID)) {
> +		dev_err(dev, "%s cr read failed\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	*val =3D status & PHYCREG_CR_PARA_RD_DATA_MASK;
> +
> +	return 0;
> +}

Do you expect this to be used in other places in the driver? In that
case there should probably be some locking, since the hardware interface
obviously cannot handle concurrency. Otherwise maybe add a comment,
that the function may not be called if concurrency is possible?

>  static int hdmirx_phy_register_write(struct snps_hdmirx_dev *hdmirx_dev,
>  				     u32 phy_reg, u32 val)
>  {
> @@ -1814,6 +1850,13 @@ static void mainunit_2_int_handler(struct snps_hdm=
irx_dev *hdmirx_dev,
>  		*handled =3D true;
>  	}
> =20
> +	if (status & PHYCREG_CR_READ_DONE) {
> +		hdmirx_update_bits(hdmirx_dev, MAINUNIT_2_INT_MASK_N,
> +				   PHYCREG_CR_READ_DONE, 0);
> +		complete(&hdmirx_dev->cr_read_done);
> +		*handled =3D true;
> +	}
> +
>  	if (status & TMDSVALID_STABLE_CHG) {
>  		process_signal_change(hdmirx_dev);
>  		v4l2_dbg(2, debug, v4l2_dev, "%s: TMDSVALID_STABLE_CHG\n", __func__);
> @@ -2313,18 +2356,52 @@ static void hdmirx_disable_all_interrupts(struct =
snps_hdmirx_dev *hdmirx_dev)
>  	hdmirx_clear_interrupt(hdmirx_dev, CEC_INT_CLEAR, 0xffffffff);
>  }
> =20
> -static void hdmirx_init(struct snps_hdmirx_dev *hdmirx_dev)
> +static int hdmirx_detect_broken_interrupt(struct snps_hdmirx_dev *hdmirx=
_dev)
> +{
> +	int err;
> +	u32 val;
> +
> +	enable_irq(hdmirx_dev->hdmi_irq);
> +
> +	hdmirx_writel(hdmirx_dev, PHYCREG_CONFIG0, 0x3);
> +
> +	err =3D hdmirx_phy_register_read(hdmirx_dev,
> +				       HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_FSM_CONFIG,
> +				       &val);
> +
> +	disable_irq(hdmirx_dev->hdmi_irq);
> +
> +	if (err)
> +		return dev_err_probe(hdmirx_dev->dev, err,
> +				     "interrupt not functioning, open-source TF-A is required by thi=
s driver\n");
> +
> +	return 0;

I think it's better to just return err here (without dev_err_probe) [...]

> +}
> +
> +static int hdmirx_init(struct snps_hdmirx_dev *hdmirx_dev)
>  {
> +	int ret;
> +
>  	hdmirx_update_bits(hdmirx_dev, PHY_CONFIG, PHY_RESET | PHY_PDDQ, 0);
> =20
>  	regmap_write(hdmirx_dev->vo1_grf, VO1_GRF_VO1_CON2,
>  		     (HDMIRX_SDAIN_MSK | HDMIRX_SCLIN_MSK) |
>  		     ((HDMIRX_SDAIN_MSK | HDMIRX_SCLIN_MSK) << 16));
> +
> +	/*
> +	 * RK3588 downstream version of TF-A remaps HDMIRX interrupt and
> +	 * requires use of a vendor-specific FW API by the driver that we
> +	 * don't support in this driver.
> +	 */
> +	ret =3D hdmirx_detect_broken_interrupt(hdmirx_dev);

[...] and have the dev_err_probe() moved to this place, so that the
comment about the Rockchip vendor TF-A is directly in front of the
error message.

Otherwise LGTM.

Greetings,

-- Sebastian

>  	/*
>  	 * Some interrupts are enabled by default, so we disable
>  	 * all interrupts and clear interrupts status first.
>  	 */
>  	hdmirx_disable_all_interrupts(hdmirx_dev);
> +
> +	return ret;
>  }
> =20
>  /* hdmi-4k-300mhz EDID produced by v4l2-ctl tool */
> @@ -2610,6 +2687,7 @@ static int hdmirx_probe(struct platform_device *pde=
v)
>  	mutex_init(&hdmirx_dev->work_lock);
>  	spin_lock_init(&hdmirx_dev->rst_lock);
> =20
> +	init_completion(&hdmirx_dev->cr_read_done);
>  	init_completion(&hdmirx_dev->cr_write_done);
>  	init_completion(&hdmirx_dev->timer_base_lock);
>  	init_completion(&hdmirx_dev->avi_pkt_rcv);
> @@ -2623,7 +2701,10 @@ static int hdmirx_probe(struct platform_device *pd=
ev)
>  	hdmirx_dev->timings =3D cea640x480;
> =20
>  	hdmirx_enable(dev);
> -	hdmirx_init(hdmirx_dev);
> +
> +	ret =3D hdmirx_init(hdmirx_dev);
> +	if (ret)
> +		goto err_pm;
> =20
>  	v4l2_dev =3D &hdmirx_dev->v4l2_dev;
>  	strscpy(v4l2_dev->name, dev_name(dev), sizeof(v4l2_dev->name));
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.h
> index 220ab99ca611..a719439d3ca0 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
> @@ -114,6 +114,8 @@
>  #define PHYCREG_CR_PARA_WRITE_P			BIT(1)
>  #define PHYCREG_CR_PARA_READ_P			BIT(0)
>  #define PHYCREG_STATUS				0x00f4
> +#define PHYCREG_CR_PARA_DATAVALID		BIT(24)
> +#define PHYCREG_CR_PARA_RD_DATA_MASK		GENMASK(15, 0)
> =20
>  #define MAINUNIT_STATUS				0x0150
>  #define TMDSVALID_STABLE_ST			BIT(1)
> --=20
> 2.51.0
>=20

--mhs7pk4kudawg6xk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmjee60ACgkQ2O7X88g7
+poPkg/9EfkO3SmSc5rQCPAJwS7QVrzKEc9Q6r3LgcDP+DMn/4yriaBuZ3J5YNQi
tzwc9tK1u2ye+AOUGyFZ7s28B/AwIWpRVkTWguZ5ElfAbfsq8HvzGyjTjila16jT
d9Idp9xgCjv6ees1ZatWyEWx2lQ+moT1j3pKT2+XYln94R3/fBcZ2eaI67CJubPb
Wn9tPYFG4aVaImrptutHSfGjlDJe6vX7UFYLNEvxCF8bo2NfEIXvGwHeI5/Y4Pmh
pZEAvrwKt1dPS8cBWrVlq3WCCVEEvZONZzCd7UWc1JSTwf/+jdiXhhA44xoaJhQ5
UjP3fGT06s7LqbJuiCLHyBrC4Gy1hPnjGFFxRfDVy/0InyXxdstAjvCGRv3LJPAy
vMajzZPmP9FvmbfR0W0FXcRd+K+wGpekLrb49HZlilerxjIPfOU0C2+fapwb2QPf
V7jBOur4a/jfg4GQOpqleIAQAy0yozLZ76Rj5Aos7rJWZ22xUfI+K5V49cP9eruP
oMqBmvQijqJbmehY4CzR2LSrGol+ZRagdUwipCy4MP8w4MZ8YOKtOroAHJR+06Xc
Q9eELIl3jI55GwdkPkUBX8uxiCzx3VO2g1IX10Q4Z0iDqYSvVf4ffwL5sEFWEtAq
BNUJd7vHgm9125kXtjmIL+nSrPSvBCbe2DqaGFQAO/28wBN7oEc=
=2pPB
-----END PGP SIGNATURE-----

--mhs7pk4kudawg6xk--

