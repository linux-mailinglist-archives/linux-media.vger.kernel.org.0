Return-Path: <linux-media+bounces-63191-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAm8JD9FHGrzLwkAu9opvQ
	(envelope-from <linux-media+bounces-63191-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 16:27:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B23B616AB5
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 16:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C048B30055C8
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 14:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B028339847;
	Sun, 31 May 2026 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdLwoBne"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA212417D1
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 14:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780237622; cv=none; b=sSj/NnpGfqh0pLSuY+cc5e36nkxW1K7qzcib1jXIwyKa1rak0BUiTl4Ick/rvT51V+Ds7dBppUCdCZkM52GbKRCKCdBJWOnhQAbWRw4ZxkBVKVWaLOKrPRUMaAeI7BcoOVpl2o7/6k152pydeTghsyd5LNfApc53AojElaH5B4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780237622; c=relaxed/simple;
	bh=JSae/BCOCgAafzVIcQqjT9OZzbZmMOD7Skqc5v3k1uA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eykxq37+Wl5gkyL9AhFA927CI4/vUq1gnQtATDEpSafMfhh2C1LDkeD4Q/eRdYbgUuAkfCV1SsNfn7/3fLZ2pi8zYiZQbTXEVXYuB6xwF26tVWlKLx766gwf4uqmu7RliwpwbhYzwB7th1RBBuHfbkf0FHti6nqWcWNc0uz5nws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdLwoBne; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B361F00893;
	Sun, 31 May 2026 14:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780237621;
	bh=NPuOWi3i0Sgnfwcc1L66YC7LhpGbZXibHR7T7X9pcv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RdLwoBneGIJ3FOlKBc24nH+HCoA8wBKBpOiKeXntmVjJdoyWfXR3lGhE+aFG6p2Kg
	 wwncuRbe1Rq6KLDBMj1A8XVzYDlwPVMmblkuiS4diNBFQpIJGze1WM3CJzmShPM9oO
	 +5mL21AyvgyrekdpbXl7ypmBjqkvrdTMe26d5WRzc92S7I6WaNhNnVBK4o1UjaLFR0
	 7z3Jg4L5jAmy/M6MGEV18Kc/AGzMtsL51X77bDzmExwWCRAFMBexkEd27SP5KcBNdH
	 +EsvcuofzSomHNaI0KtqMZowJXFAa6vXNj7Yg5ykQcVTkVztUVdxdbvorZBSu5fMD6
	 y9bzFcLhmIRhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH WIP v5 8/9] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260531-qcom-cphy-v5-8-6be0f62b4d65@ixit.cz>
References: <20260531-qcom-cphy-v5-8-6be0f62b4d65@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 14:27:00 +0000
Message-Id: <20260531142701.37B361F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63191-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,david.ixit.cz];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,ixit.cz:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7B23B616AB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Unchecked NULL pointer dereference of `csiphy->cfg.csi2` when CSID=
 is linked to the Test Pattern Generator (TPG) or left unlinked.
- [High] Incorrect C-PHY link frequency calculation due to mathematically i=
nverted ratio.

Pre-existing issues:
- [High] Pre-existing NULL pointer dereference in `csiphy` subdev when inte=
racting with an unlinked entity.
--

commit 35e192e9607e402c49c9fa16454e543318095c66
Author: David Heidelberg <david@ixit.cz>

media: qcom: camss: Account for C-PHY when calculating link frequency

Ensure that the link frequency divider correctly accounts for C-PHY
operation. The divider differs between D-PHY and C-PHY, as described
in the MIPI CSI-2 specification.

Link: https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate

> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index 8d5c872f84ed5..594f280a455ed 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -539,15 +539,18 @@ const struct csid_format_info *csid_get_fmt_entry(c=
onst struct csid_format_info
>  static int csid_set_clock_rates(struct csid_device *csid)
>  {
>  	struct device *dev =3D csid->camss->dev;
> +	struct csiphy_device *csiphy =3D &csid->camss->csiphy[csid->phy.csiphy_=
id];
> +	struct csiphy_lanes_cfg *lane_cfg =3D &csiphy->cfg.csi2->lane_cfg;
>  	const struct csid_format_info *fmt;
> +
>  	s64 link_freq;
>  	int i, j;
>  	int ret;
> =20
>  	fmt =3D csid_get_fmt_entry(csid->res->formats->formats, csid->res->form=
ats->nformats,
>  				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	link_freq =3D camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
> -					csid->phy.lane_cnt);
> +
> +	link_freq =3D camss_get_link_freq(&csid->subdev.entity, fmt->bpp, lane_=
cfg);

[Severity: High]
Does this introduce a NULL pointer dereference when the CSID is linked
to the Test Pattern Generator (TPG) or left unlinked?

If csi2 inside csiphy->cfg is NULL, deriving lane_cfg and passing it to
camss_get_link_freq() will lead to an unchecked dereference when
lane_cfg->num_data is accessed inside that function:

camss_get_link_freq()
    u8 num_lanes =3D lane_cfg->num_data;

Could we validate csi2 before deriving and passing lane_cfg?

>  	if (link_freq < 0)
>  		link_freq =3D 0;
> =20
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index ec0dc9d31b585..cd16743858d6a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -143,9 +143,8 @@ static int csiphy_set_clock_rates(struct csiphy_devic=
e *csiphy)
> =20
>  	u8 bpp =3D csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->f=
ormats->nformats,
>  				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	u8 num_lanes =3D csiphy->cfg.csi2->lane_cfg.num_data;
> =20
> -	link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lane=
s);
> +	link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, &csiphy-=
>cfg.csi2->lane_cfg);

[Severity: High]
This is a pre-existing issue, but opening the /dev/v4l-subdevX node
corresponding to the CSIPHY entity directly from userspace when no sensor
is linked triggers a NULL pointer dereference.

When no external sensor is bound to the pipeline, csiphy->cfg.csi2
is NULL. Unconditionally passing the lane_cfg derived from it here
and dereferencing it in camss_get_link_freq() causes a Kernel Oops.

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 072c428e25166..db4e14a84a95f 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
[ ... ]
> @@ -4623,20 +4631,24 @@ struct media_pad *camss_find_sensor_pad(struct me=
dia_entity *entity)
>   * camss_get_link_freq - Get link frequency from sensor
>   * @entity: Media entity in the current pipeline
>   * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @lane_cfg: CSI2 lane configuration
>   *
>   * Return link frequency on success or a negative error code otherwise
>   */
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes)
> +			struct csiphy_lanes_cfg *lane_cfg)
>  {
>  	struct media_pad *sensor_pad;
> +	u8 num_lanes =3D lane_cfg->num_data;
> +	bool cphy =3D lane_cfg->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY;
> +	unsigned int div =3D num_lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
> +						     CAMSS_DPHY_DIVISOR);
> =20
>  	sensor_pad =3D camss_find_sensor_pad(entity);
>  	if (!sensor_pad)
>  		return -ENODEV;
> =20
> -	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +	return v4l2_get_link_freq(sensor_pad, CAMSS_COMMON_PHY_DIVIDENT * bpp, =
div);

[Severity: High]
Does this calculation invert the C-PHY ratio?

The V4L2 fallback computation for link frequency calculates
pixel_rate * mul / div. For C-PHY, data is encoded at 16/7 (~2.28) bits
per symbol, meaning the symbol rate should be calculated by multiplying the
bit rate by 7 and dividing by 16.

By setting mul to 16 * bpp and div to num_lanes * 2 * 7 (keeping
the D-PHY DDR factor of 2), this applies a ratio of 16/14 (or 8/7) instead
of 7/16. This results in the computed C-PHY link frequency being
approximately 2.6 times higher than the actual symbol rate.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-qcom-cphy-=
v5-0-6be0f62b4d65@ixit.cz?part=3D8

