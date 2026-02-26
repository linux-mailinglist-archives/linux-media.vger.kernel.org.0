Return-Path: <linux-media+bounces-53489-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJWNNFIroGmLfwQAu9opvQ
	(envelope-from <linux-media+bounces-53489-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 12:15:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E407E1A4EF3
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 12:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA0BF301FD82
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDBD33C53B;
	Thu, 26 Feb 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WwvnCS9M"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0871033C50F;
	Thu, 26 Feb 2026 11:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104515; cv=none; b=Ns2kKpBy5zZI/hHDc+ZxAPlpxMSnl26u9aiIdEr8MsZjkekkHlmkQN2QSIfHd4uwZu3GG/vTmqNk1kUZHsaZPXU5HWZyyOYLAnVtNMWqTuq9mgF6ncbrHZ5a7A2KqaNGYcKS0CB7sIDoQLFpnse9+8XYFAWcMh/LsQaruJE3Sjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104515; c=relaxed/simple;
	bh=MyqUkX4A1JSSfS44POiC1CwAnTxc4+KhaIxW4f5ff5I=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=sBXOtLPPjAGwNRx0O/ZLTf4buWoXNk4TNJ0c6xqpEnP1AsYn5U3NGFaKL4awIU+n/I+qoVW1GQjkEYkewdLIeSxgUyatkOZHiGsJPo21G8SocrbTIDvQEIY1XJ/K1jcHJIWm2uLazYa0peg+/9F0tQSsJv+vzG5wBSoqvHsCTww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WwvnCS9M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8136A30;
	Thu, 26 Feb 2026 12:14:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772104446;
	bh=MyqUkX4A1JSSfS44POiC1CwAnTxc4+KhaIxW4f5ff5I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WwvnCS9Mkm9bs1u02ct4+DduLZ5uGzC9N6Xrz4is4PYBinsxgp3Z2dxtXE7BSoKVO
	 Trv7t8vjgRDZ8CcsTg1Z7CuIi9Wn9VTEqpxaRwx7IZn3kX0QDWSN+s6wjBKukv4zNk
	 /AyR22mydpx4MZumnRwMSp09rRR9bLJhGapyP5vo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260226011230.832944-1-arun.t@intel.com>
References: <20260130092431.2335363-2-arun.t@intel.com> <20260226011230.832944-1-arun.t@intel.com>
Subject: Re: [PATCH 1/2] platform/x86: int3472: Add board data for Intel nvl
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: arun.t@intel.com
Date: Thu, 26 Feb 2026 11:15:01 +0000
Message-ID: <177210450127.3376561.11357363190334702950@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53489-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E407E1A4EF3
X-Rspamd-Action: no action

Hi Arun,

Quoting Arun T (2026-02-26 01:12:28)
> The Intel Nvl O13b10 sensor with the Intel IPU8 ISP.
> The sensor is powered by a TPS68470 PMIC, and so we
> need some board data to describe how to configure the GPIOs and
> regulators to run the sensor.
>=20
> Signed-off-by: Arun T <arun.t@intel.com>

I can see that you are sending multiple patch sets to the same thread
without increasing the version number.

This makes it unclear for the maintainers which version is current or
what is expected.

Please resend as a clean thread with an increased version number and a
changelog for each patch or a cover letter to explain the updates.

--
Kieran


> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/d=
rivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..71dc0940a94b 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2=
_consumer_supplies[] =3D {
>         REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
>  };
> =20
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply int3472_core_consumer_supplies[]=
 =3D {
> +       REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_ana_consumer_supplies[] =
=3D {
> +       REGULATOR_SUPPLY("ana", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_vcm_consumer_supplies[] =
=3D {
> +       REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_vsio_consumer_supplies[]=
 =3D {
> +       REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:00"),
> +       REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:00"),
> +       REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_aux1_consumer_supplies[]=
 =3D {
> +       REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_aux2_consumer_supplies[]=
 =3D {
> +       REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:00"),
> +};
> +
>  static const struct regulator_init_data dell_7212_tps68470_core_reg_init=
_data =3D {
>         .constraints =3D {
>                 .min_uV =3D 1200000,
> @@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_tp=
s68470_aux2_reg_init_data =3D
>         .consumer_supplies =3D int3479_aux2_consumer_supplies,
>  };
> =20
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init=
_data =3D {
> +       .constraints =3D {
> +               .min_uV =3D 1200000,
> +               .max_uV =3D 1200000,
> +               .apply_uV =3D true,
> +               .always_on =3D true,
> +       },
> +       .num_consumer_supplies =3D ARRAY_SIZE(int3472_core_consumer_suppl=
ies),
> +       .consumer_supplies =3D int3472_core_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_=
data =3D {
> +       .constraints =3D {
> +               .min_uV =3D 2815200,
> +               .max_uV =3D 2815200,
> +               .apply_uV =3D true,
> +               .always_on =3D true,
> +       },
> +       .num_consumer_supplies =3D ARRAY_SIZE(int3472_ana_consumer_suppli=
es),
> +       .consumer_supplies =3D int3472_ana_consumer_supplies,
> +};
> +static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_=
data =3D {
> +       .constraints =3D {
> +               .min_uV =3D 2815200,
> +               .max_uV =3D 2815200,
> +               .apply_uV =3D true,
> +               .always_on =3D true,
> +       },
> +       .num_consumer_supplies =3D ARRAY_SIZE(int3472_vcm_consumer_suppli=
es),
> +       .consumer_supplies =3D int3472_vcm_consumer_supplies,
> +};
> +
> +/* Ensure the always-on VIO regulator has the same voltage as VSIO */
> +static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_=
data =3D {
> +       .constraints =3D {
> +               .min_uV =3D 1800600,
> +               .max_uV =3D 1800600,
> +               .apply_uV =3D true,
> +               .always_on =3D true,
> +       },
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init=
_data =3D {
> +       .constraints =3D {
> +               .min_uV =3D 1800600,
> +               .max_uV =3D 1800600,
> +               .apply_uV =3D true,
> +               .always_on =3D true,
> +       },
> +       .num_consumer_supplies =3D ARRAY_SIZE(int3472_vsio_consumer_suppl=
ies),
> +       .consumer_supplies =3D int3472_vsio_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init=
_data =3D {
> +       .constraints =3D {
> +               .min_uV =3D 2815200,
> +               .max_uV =3D 2815200,
> +               .apply_uV =3D 1,
> +               .valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +       },
> +       .num_consumer_supplies =3D ARRAY_SIZE(int3472_aux1_consumer_suppl=
ies),
> +       .consumer_supplies =3D int3472_aux1_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init=
_data =3D {
> +       .constraints =3D {
> +               .min_uV =3D 1800600,
> +               .max_uV =3D 1800600,
> +               .apply_uV =3D 1,
> +               .valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +       },
> +       .num_consumer_supplies =3D ARRAY_SIZE(int3472_aux2_consumer_suppl=
ies),
> +       .consumer_supplies =3D int3472_aux2_consumer_supplies,
> +};
> +
> +
>  static const struct tps68470_regulator_platform_data dell_7212_tps68470_=
pdata =3D {
>         .reg_init_data =3D {
>                 [TPS68470_CORE] =3D &dell_7212_tps68470_core_reg_init_dat=
a,
> @@ -232,6 +336,18 @@ static const struct tps68470_regulator_platform_data=
 dell_7212_tps68470_pdata =3D
>         },
>  };
> =20
> +static const struct tps68470_regulator_platform_data intel_nvl_tps68470_=
pdata =3D {
> +       .reg_init_data =3D {
> +               [TPS68470_CORE] =3D &intel_nvl_tps68470_core_reg_init_dat=
a,
> +               [TPS68470_ANA]  =3D &intel_nvl_tps68470_ana_reg_init_data,
> +               [TPS68470_VCM]  =3D &intel_nvl_tps68470_vcm_reg_init_data,
> +               [TPS68470_VIO] =3D &intel_nvl_tps68470_vio_reg_init_data,
> +               [TPS68470_VSIO] =3D &intel_nvl_tps68470_vsio_reg_init_dat=
a,
> +               [TPS68470_AUX1] =3D &intel_nvl_tps68470_aux1_reg_init_dat=
a,
> +               [TPS68470_AUX2] =3D &intel_nvl_tps68470_aux2_reg_init_dat=
a,
> +       },
> +};
> +
>  static struct gpiod_lookup_table surface_go_int347a_gpios =3D {
>         .dev_id =3D "i2c-INT347A:00",
>         .table =3D {
> @@ -258,6 +374,23 @@ static struct gpiod_lookup_table dell_7212_int3479_g=
pios =3D {
>         }
>  };
> =20
> +static struct gpiod_lookup_table intel_nvl_int347a_gpios =3D {
> +       .dev_id =3D "i2c-OVTI13B1:01",
> +       .table =3D {
> +               GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +               GPIO_LOOKUP("tps68470-gpio", 8, "s_idle", GPIO_ACTIVE_LOW=
),
> +               { }
> +       }
> +};
> +
> +static struct gpiod_lookup_table intel_nvl_int347e_gpios =3D {
> +       .dev_id =3D "i2c-OVTI13B1:01",
> +       .table =3D {
> +       GPIO_LOOKUP("tps68470-gpio", 7, "s_enable", GPIO_ACTIVE_LOW),
> +               { }
> +       }
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_boar=
d_data =3D {
>         .dev_name =3D "i2c-INT3472:05",
>         .tps68470_regulator_pdata =3D &surface_go_tps68470_pdata,
> @@ -287,6 +420,16 @@ static const struct int3472_tps68470_board_data dell=
_7212_tps68470_board_data =3D
>         },
>  };
> =20
> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_board=
_data =3D {
> +       .dev_name =3D "i2c-INT3472:04",
> +       .tps68470_regulator_pdata =3D &intel_nvl_tps68470_pdata,
> +       .n_gpiod_lookups =3D 2,
> +       .tps68470_gpio_lookup_tables =3D {
> +               &intel_nvl_int347a_gpios,
> +               &intel_nvl_int347e_gpios,
> +       },
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] =
=3D {
>         {
>                 .matches =3D {
> @@ -316,6 +459,13 @@ static const struct dmi_system_id int3472_tps68470_b=
oard_data_table[] =3D {
>                 },
>                 .driver_data =3D (void *)&dell_7212_tps68470_board_data,
>         },
> +       {
> +               .matches =3D {
> +                       DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporatio=
n"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Clie=
nt Platform"),
> +               },
> +              .driver_data =3D (void *)&intel_nvl_tps68470_board_data,
> +       },
>         { }
>  };
> =20
> --=20
> 2.43.0
>

