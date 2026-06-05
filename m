Return-Path: <linux-media+bounces-63924-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fn+iCqLYImpueQEAu9opvQ
	(envelope-from <linux-media+bounces-63924-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:09:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FC4648BC1
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:09:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DsETrok9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63924-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63924-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 392783073752
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 14:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD73634E741;
	Fri,  5 Jun 2026 14:00:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AF32D29C7
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 14:00:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668030; cv=none; b=alBDWr0csYBVt4brO2+Y2Xx80/6LemarmRUb0Y5oe0XT2iAW78V/wUdu5nnKseBvdw2aFHhx3DB3gwR6MbgePUsBuc16Z7lmfgdkO2VR4x2rJLMZoWslUV/4kCqiFUasLgbxKWp+bRs6Wq+/ffO0b97Hpkz4yQtEW2/SGEsw/tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668030; c=relaxed/simple;
	bh=kp0K4vYFNoKXVQXjgtPFYjlzTfrsiv2oLmJQ5m7wkK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S644njQJph68IHlDh1ljJVM5IzT4W1f0dVxewH1zhnaB/Q5GSdAFLtq1BpYzXY+1CdeMf7pecMy3zmyOip415qn6UkU/6eNAxG2iBh0hMVzUxrCWvMxJM3A/HuTDsrwljBYy3NoFh4DJrSXgMH8CXyEe1WoCNLIeItCyc7QuS3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsETrok9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2A31F00893;
	Fri,  5 Jun 2026 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780668029;
	bh=brOWVqBs9kCm1nIaOoJMHofkH7pHY2J78VAQO3p8QWc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DsETrok9OxUsh9e26yztMbTWI4mmwIxhpt8y6dWmCsz1mg+uwjUaAmbVraHuimLyB
	 iJ+JyPRG/cYonjyjwMPj31GdfJEjHegbDjP4hVrOoySRXdejEglmUVNm6zdhX4ab0l
	 i/DBayRWbl9l+kWK2SdYgPHi+TYlrG+TjyYVj8uAIQaLvJqTNWMxeDfAM59O/ENr0g
	 /oo1j22poUUNAR80bV6/GO+teEPueeYFfPMsYJl1pJ3vKCK1/88ZA2eC2Sl4JoDMp/
	 UE76OVkD6kdEM7Q8Fpzy49iU6OvDYxUncJGsdfJ7EjcVAwQN1xiVQXNLsNn5zVgtlP
	 f5GRWiAA3RfsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260605-qcom-cphy-v7-7-426c37e9008f@ixit.cz>
References: <20260605-qcom-cphy-v7-7-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 14:00:28 +0000
Message-Id: <20260605140028.DD2A31F00893@smtp.kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63924-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:devnull+david.ixit.cz@kernel.org,m:linux-media@vger.kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,david.ixit.cz];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,ixit.cz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74FC4648BC1

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Deterministic NULL pointer dereference when calculating link frequ=
ency for the CSID linked to the internal Test Pattern Generator (TPG).
- [High] The C-PHY link frequency calculation inverses the symbol rate rati=
o, resulting in a severely inflated link frequency.
--

commit 0a60c2346d24cbca656cf347fe3da5342c1b9381
Author: David Heidelberg <david@ixit.cz>

media: qcom: camss: Account for C-PHY when calculating link frequency

Ensure that the link frequency divider correctly accounts for C-PHY
operation. The divider differs between D-PHY and C-PHY, as described
in the MIPI CSI-2 specification.

Link: https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate

> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index bcc34ac9dd212..7415e811082da 100644
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

[Severity: High]
Will this cause a NULL pointer dereference when the CSID is linked to the
internal Test Pattern Generator (TPG)?

When the CSID is linked to the internal TPG, csid->phy.csiphy_id is set to
the TPG index, and the pipeline does not have a sensor bound. If
csiphy->cfg.csi2 is NULL, lane_cfg evaluates to an invalid pointer (an
offset from NULL).

This invalid pointer is then passed to camss_get_link_freq(), which
unconditionally dereferences lane_cfg->num_data before verifying if a sensor
pad actually exists. This would trigger a kernel panic. Before this patch,
the code passed csid->phy.lane_cnt by value, safely returning -ENODEV for
TPG and gracefully defaulting to a zero fallback frequency.

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
Does this calculation invert the C-PHY link frequency ratio?

According to the MIPI C-PHY specification and V4L2 documentation, 16 bits e=
ncode
into 7 symbols, meaning the symbol rate (link frequency) should be:
(pixel_rate * bpp * 7) / (16 * num_lanes).

Here, the multiplier passed to v4l2_get_link_freq() is (16 * bpp), and the
divisor is (num_lanes * 2 * 7) for C-PHY. This effectively multiplies by 16
and divides by 14, instead of multiplying by 7 and dividing by 16.

This logic appears to inflate the calculated link frequency for C-PHY by a
factor of roughly 2.6x, which could lead to pixel clock configuration failu=
res
or physical hardware malfunction.

>  }
> =20
>  /*

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-qcom-cphy-=
v7-0-426c37e9008f@ixit.cz?part=3D7

