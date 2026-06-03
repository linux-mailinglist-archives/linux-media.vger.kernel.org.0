Return-Path: <linux-media+bounces-63471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YRjjHiV7H2pLmQAAu9opvQ
	(envelope-from <linux-media+bounces-63471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 02:53:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B067E6333FF
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 02:53:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CQyg1wkw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63471-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63471-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 154EC302571D
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 00:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38D626E71E;
	Wed,  3 Jun 2026 00:53:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3A1DF27D
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 00:53:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780448030; cv=none; b=DKT9KQukbojMNL5rQEQoqvLHzrxvzQ9XjGGrLbiFIiHuVNXUdlP/1OPpY/3RAEU4B4jsgcbSxloEwxfGZcqD9Mgc1HZjkBMY7UyjmyYst9XemxLHWUACKF+Cl5sFvPDppI6YMvPXlwjQBI3Kk5gJVXuOhFbQWjq13SE8oxKjGTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780448030; c=relaxed/simple;
	bh=xQFC0JzMZyVNwbbgYa2Y1tI6YA4mJB0WyQDYCh5I4jQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CleqBI0flANPglKxIrs0rJe2GOeDcmP8VIkYEcikCUWjF7xw8hFPKHPzdtHBlLnsc1oSiqYV8MrBkqojElfjurOX4KVIYV7/uJx5FxCMhcRDDDP+1A0zP/nezlU0tI7wzptlnPLT6WKhEHeQEwMXL2+R2RDlOELpwW8GDoWXcBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQyg1wkw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62D21F00893;
	Wed,  3 Jun 2026 00:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780448029;
	bh=xf4c0Wr9mWTZIJlb13rpFPLY4eNtVSeylR9vBbRJ4v0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CQyg1wkw39MDu1Ei5sfZ0KtM4fPwMwpUzps91DF4o5nsa1+WQEklWI9kB2YcQ8XnO
	 kT2ZJ6Rh8wv29Uxk2NUfiypcxs1Lnh/uKnBGsuirgGeu3a+rPMl3yoLupQvlPZRZRA
	 2/cLVap6Qksv5ycDxCYW+4hPS22Ga6uNIvfwUBhJ8aAREcHxvzUDfbPsCYbbG/Z0Lk
	 siiIZo8l+vSv/T8iIT8/aUWLHqSndy9KeL5cTybRZ+87UtwCgOSzzoVzRbUIN2oWtG
	 prKvVrL0lR2qJVoUrvhGDTDRJ5rE72MP1sOQni2CA3kiJojNvEmFOS6ReOkie3Y3uU
	 jEcqesgXzPKnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-qcom-cphy-v6-7-e50de0b557a8@ixit.cz>
References: <20260603-qcom-cphy-v6-7-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 00:53:48 +0000
Message-Id: <20260603005348.D62D21F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63471-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:devnull+david.ixit.cz@kernel.org,m:linux-media@vger.kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B067E6333FF

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The link frequency calculation for C-PHY in `camss_get_link_freq()=
` uses mathematically inverted constants, resulting in a vastly incorrect a=
nd excessively high link frequency.
- [High] A guaranteed NULL pointer dereference occurs in `camss_get_link_fr=
eq()` when the pipeline is configured to use the internal Test Pattern Gene=
rator (TPG).

Pre-existing issues:
- [High] Unvalidated Device Tree endpoint port leads to an out-of-bounds po=
inter write.
--

commit 021fbf4d7c8dcb172343f7479e2fdcd4714092bc
Author: David Heidelberg <david@ixit.cz>

media: qcom: camss: Account for C-PHY when calculating link frequency

Ensure that the link frequency divider correctly accounts for C-PHY
operation. The divider differs between D-PHY and C-PHY, as described
in the MIPI CSI-2 specification.

Link: https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate

> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
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
Does this code introduce a regression when the test pattern generator is us=
ed?
When the csid is linked to the internal test pattern generator,
csiphy->cfg.csi2 is NULL because the generator is an internal virtual block.
Will this cause an invalid pointer to be evaluated here and passed to
camss_get_link_freq(), leading to a crash when it dereferences
lane_cfg->num_data?

>  	const struct csid_format_info *fmt;

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
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
Does this regression invert the multiplier and divisor constants for C-PHY?
The V4L2 documentation and standard C-PHY formula define the pixel rate
calculation as pixel_rate =3D link_freq * 2 * nr_of_lanes * 16 / 7 /
bits_per_sample.

By passing mul =3D 16 * bpp and div =3D 14 * num_lanes to v4l2_get_link_fre=
q(),
the resulting calculated frequency appears to be over 5 times higher than t=
he
correct value, which might render C-PHY unusable.

[Severity: High]
This isn't a bug introduced by this patch, but does camss_parse_endpoint_no=
de()
properly validate the Device Tree endpoint port? Currently, vep.base.port is
assigned directly to csd->interface.csiphy_id without bounds checking:

camss_parse_endpoint_node() {
    ...
    csd->interface.csiphy_id =3D vep.base.port;
    ...
}

Then later in camss_subdev_notifier_bound(), this unchecked ID is used as
an index:

camss_subdev_notifier_bound() {
    ...
    u8 id =3D csd->interface.csiphy_id;
    struct csiphy_device *csiphy =3D &camss->csiphy[id];

    csiphy->cfg.csi2 =3D &csd->interface.csi2;
    ...
}

Can a malformed Device Tree cause an arbitrary out-of-bounds pointer write
here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-qcom-cphy-=
v6-0-e50de0b557a8@ixit.cz?part=3D7

