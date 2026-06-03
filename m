Return-Path: <linux-media+bounces-63625-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7UTcDV5AIGoezQAAu9opvQ
	(envelope-from <linux-media+bounces-63625-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:55:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CED1638D5E
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:55:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=me5hK6y1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63625-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63625-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39262311D39F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1893C44E05B;
	Wed,  3 Jun 2026 14:37:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEEE399D0D;
	Wed,  3 Jun 2026 14:37:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497440; cv=none; b=b+DvFqbJExHluFec7Fbu8qXdkkXX1nfogDpoglXD8mF1WOTGBgO+jS2LBUxOuMez+PKKUY/P6XGzQ2A3XDgc1imFnnUORAz1q+dwwAV8worN44ATtd6leoD38G1j8rbflJE8UVnCTHICwYHqTM+Jk08DdDle9clkqYXFneww5uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497440; c=relaxed/simple;
	bh=pWl1/RmqvpHcUDVI2tAuWXrcc8d66tisk1KWVRZbg5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DZL9Tq75rQwqDwoVyhxnbRvWwFP9//Aavo3ZiQr9BSllP9HtjIkve4n18L1rNiZo50w2SPUlibHz4ZNSweehp1xwMpjOtfY+PN3V/PHhxyYhupoVAnSzAgCBsuBYa/ZrYNf8SvX2jPiYSNQ98i4B9tHaI48kxVXVc146um5o4MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=me5hK6y1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65981F00893;
	Wed,  3 Jun 2026 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497438;
	bh=Bn56UH32ISeuaPasJihJWuyrFveRoM6qFNTcEtrTq1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=me5hK6y1FSev3el2M9/ar60cWRtOMPhXgdaNRjGm0GSQfjkADGehXEHueQzwM9yiw
	 ozdav3GsEkA9i8GmATva4FYkclCLf8ShbRTu8fdpy6yOh7AlwGDLHMlkVkItmqSqQb
	 maZr5J7sY72Elt8mmZ6hcKcpZH5Ir5ykQkkvN6CvpnIg7yYLO8n5SGeB0pW+PRlK51
	 hAmKXXgJXm9yaOZ0e9jbPT9tok652dt3xdKZGPX/Fj5LCTIKMgEZFHB9GYUV9HYUlC
	 T9tdtT7ev+6YaaupqjpDMvgeEDdl7IDs+x5mdN3EkDPySi5HjWCdopuHTLDcWRiqFB
	 H+ZJ9yafRnbRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/12] media: iris: Replace enum-indexed clock and
 power domain tables with per-block structures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260603-glymur-v7-6-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-6-afaa55d11fe0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:37:18 +0000
Message-Id: <20260603143718.A65981F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,qualcomm.com:email,sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TAGGED_FROM(0.00)[bounces-63625-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CED1638D5E

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Uninitialized stack pointer dereference when a hardware block has =
0 power domains.
- [High] Secondary hardware cores are left unpowered due to missing iterati=
on over `num_cores`.
- [High] NULL pointer dereference when optional hardware blocks are enabled=
 in hardware but missing from platform data.
- [High] Premature OPP voltage drop causes DVFS sequence violation.
- [High] Uninitialized fields in `struct dev_pm_domain_attach_data` result =
in arbitrary behavior.
- [Medium] API mismatch silently discards additional power domains if `pd_c=
nt > 1`.

Pre-existing issues:
- [High] Resource leak of Runtime PM usage counter and OPP rate on error pa=
th.
--

commit 569dbace99d0eb806398e44f1f3dd0f46e77e155
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Replace enum-indexed clock and power domain tables with per-bl=
ock structures

This patch replaces flat, enum-indexed tables for clocks and power domains =
with=20
per-hardware block structures in the iris driver. It groups devices, power=
=20
domains, and clocks together logically in the iris_power_domain struct, and=
=20
removes index lookups at runtime.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index c2dcb50a27824..681db1da9559a 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -39,15 +39,32 @@ static int iris_init_icc(struct iris_core *core)
>  	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
>  }
> =20
> -static int iris_init_power_domains(struct iris_core *core)
> +static int iris_init_power_domains_per_block(struct iris_core *core,
> +					     struct iris_power_domain *pd,
> +					     const struct iris_power_domain_data *pd_data)
>  {
> +	struct dev_pm_domain_attach_data iris_pd_data;

[Severity: High]
Does this leave fields in iris_pd_data uninitialized? Since it's allocated =
on the
stack without zero-initialization, any fields added to struct
dev_pm_domain_attach_data (like link_flags) could contain stack garbage when
passed to devm_pm_domain_attach_list().

> +	struct dev_pm_domain_list *pmdomain_tbl;
>  	int ret;
> =20
> +	iris_pd_data.pd_names =3D pd_data->pd_names;
> +	iris_pd_data.num_pd_names =3D pd_data->pd_cnt;
> +	iris_pd_data.pd_flags =3D PD_FLAG_NO_DEV_LINK;
> +
> +	ret =3D devm_pm_domain_attach_list(core->dev, &iris_pd_data, &pmdomain_=
tbl);
> +	if (ret < 0)
> +		return ret;
> +
> +	pd->dev =3D pmdomain_tbl->pd_devs[0];

[Severity: High]
If pd_data->pd_cnt is 0, devm_pm_domain_attach_list() returns 0 but does not
modify pmdomain_tbl. Does this result in an uninitialized pointer dereferen=
ce
when accessing pmdomain_tbl->pd_devs[0]?

[Severity: Medium]
Also, if the platform data specifies multiple power domains (pd_cnt > 1), d=
oes
this logic silently discard all but the first power domain? Since
PD_FLAG_NO_DEV_LINK is used, the driver has to power them on manually, which
means secondary domains might never be powered on.

> +
> +	return 0;
> +}
[ ... ]
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> index 773f6548370a2..fdc6eb68e5c78 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
[ ... ]
> @@ -70,7 +69,7 @@ int iris_opp_set_rate(struct device *dev, unsigned long=
 freq)
>  	return dev_pm_opp_set_opp(dev, opp);
>  }
> =20
> -int iris_enable_power_domains(struct iris_core *core, struct device *pd_=
dev)
> +int iris_enable_power_domain_and_clocks(struct iris_core *core, struct i=
ris_power_domain *pd)
>  {
>  	int ret;
> =20
> @@ -78,66 +77,20 @@ int iris_enable_power_domains(struct iris_core *core,=
 struct device *pd_dev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D pm_runtime_get_sync(pd_dev);
> +	ret =3D pm_runtime_get_sync(pd->dev);
>  	if (ret < 0)
>  		return ret;
> =20

[Severity: High]
This is a pre-existing issue, but does this error path permanently leak the
runtime PM usage counter and leave the global core device forced to its hig=
hest
performance state? If pm_runtime_get_sync() fails, there is no
pm_runtime_put_noidle() or iris_opp_set_rate(core->dev, 0) called before
returning.

> -	return ret;
> -}
> -
> -int iris_disable_power_domains(struct iris_core *core, struct device *pd=
_dev)
> -{
> -	int ret;
> -
> -	ret =3D iris_opp_set_rate(core->dev, 0);
> +	ret =3D clk_bulk_prepare_enable(pd->clk_cnt, pd->clocks);
>  	if (ret)
> -		return ret;
> -
> -	pm_runtime_put_sync(pd_dev);
> -
> -	return 0;
> -}
> +		pm_runtime_put_sync(pd->dev);
> =20
> -static struct clk *iris_get_clk_by_type(struct iris_core *core, enum pla=
tform_clk_type clk_type)
> -{
[ ... ]
> +	return ret;
>  }
> =20
> -int iris_disable_unprepare_clock(struct iris_core *core, enum platform_c=
lk_type clk_type)
> +void iris_disable_power_domain_and_clocks(struct iris_core *core, struct=
 iris_power_domain *pd)
>  {
> -	struct clk *clock;
> -
> -	clock =3D iris_get_clk_by_type(core, clk_type);
> -	if (!clock)
> -		return -EINVAL;
> -
> -	clk_disable_unprepare(clock);
> -
> -	return 0;
> +	clk_bulk_disable_unprepare(pd->clk_cnt, pd->clocks);
> +	iris_opp_set_rate(core->dev, 0);
> +	pm_runtime_put_sync(pd->dev);
>  }

[Severity: High]
Could dropping the OPP rate to 0 inside a block-specific helper cause issue=
s?
If multiple blocks are being torn down (for example, in
iris_vpu4x_power_off_hardware() which shuts down VPP1, VPP0, then VCODEC), =
this
would instantly drop the global controller OPP to 0 when the first block is
disabled, while other blocks' clocks are still running. Does this violate D=
VFS
constraints?

[ ... ]
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu4x.c
> index 02e100a4045fc..0feb5eaa544f9 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
[ ... ]
> @@ -158,116 +136,43 @@ static void iris_vpu4x_ahb_sync_reset_hardware(str=
uct iris_core *core)
>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>  }
> =20
> -static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32=
 efuse_value)
> -{
[ ... ]
> -}
> -
>  static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>  {
>  	u32 efuse_value =3D readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>  	int ret;
> =20
> -	ret =3D iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRI=
S_HW_POWER_DOMAIN]);
> +	ret =3D iris_enable_power_domain_and_clocks(core, core->vcodec);
>  	if (ret)
>  		return ret;
> =20
>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
> -		ret =3D iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
> -						[IRIS_VPP0_HW_POWER_DOMAIN]);
> +		ret =3D iris_enable_power_domain_and_clocks(core, core->vcodec_vpp0);

[Severity: High]
If the hardware efuse indicates VPP0 is present, but the platform data omits
vcodec_vpp0_data, core->vcodec_vpp0 will not be allocated during probe. Does
this result in a NULL pointer dereference here since
iris_enable_power_domain_and_clocks() accesses pd->dev?

>  		if (ret)
>  			goto disable_hw_power_domain;
>  	}
> =20
[ ... ]
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers=
/media/platform/qcom/iris/iris_vpu_common.c
> index 23a7ce3ecb2d0..f35754ef53ed1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
[ ... ]
>  int iris_vpu_power_on_hw(struct iris_core *core)
>  {
> -	int ret;
> -
> -	ret =3D iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRI=
S_HW_POWER_DOMAIN]);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D iris_prepare_enable_clock(core, IRIS_HW_CLK);
> -	if (ret)
> -		goto err_disable_power;
> -
> -	ret =3D iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
> -	if (ret && ret !=3D -ENOENT)
> -		goto err_disable_hw_clock;
> -
> -	ret =3D iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
> -	if (ret && ret !=3D -ENOENT)
> -		goto err_disable_hw_ahb_clock;
> -
> -	return 0;
> -
> -err_disable_hw_ahb_clock:
> -	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> -err_disable_hw_clock:
> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> -err_disable_power:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_PO=
WER_DOMAIN]);
> -
> -	return ret;
> +	return iris_enable_power_domain_and_clocks(core, core->vcodec);
>  }

[Severity: High]
Does this fail to power on any secondary hardware cores? The probe function
dynamically allocates core->vcodec as an array based on num_cores, but this=
 only
passes the pointer to the first element to
iris_enable_power_domain_and_clocks(), without iterating over the remaining
cores.

> =20
>  int iris_vpu_set_hwmode(struct iris_core *core)
>  {
> -	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWE=
R_DOMAIN], true);
> +	return dev_pm_genpd_set_hwmode(core->vcodec->dev, true);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-glymur-v7-=
0-afaa55d11fe0@oss.qualcomm.com?part=3D6

