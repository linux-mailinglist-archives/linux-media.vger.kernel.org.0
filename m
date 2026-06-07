Return-Path: <linux-media+bounces-64099-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wGg/AJXrJWrdNgIAu9opvQ
	(envelope-from <linux-media+bounces-64099-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 00:07:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4994A651C8A
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 00:07:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WSCgnIar;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64099-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64099-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11F33300E715
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 22:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA4433B6DA;
	Sun,  7 Jun 2026 22:07:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECD76FC5
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 22:07:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780870027; cv=none; b=VnJ0ML/OSEHbTCACcDWCBTr9Zyxg4MWtIPFZqc2yko4DUS5ByBKmgovsK6QDswg9tDQ61AB9EuuioSFKoUkccs8XgKczYXj0q3CoyB11e0WYzlyh49CMlvDF7TdT0+STauunwEnMrGwCQqa8jO+4u+mNZo68zn19mK5TtI4OWas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780870027; c=relaxed/simple;
	bh=AJPf56RXk8I/8fuvddf8HakxidGpxsvpD79uVlrklQM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VmnP+HCE+0YSUAstSHxgAhN4+YS/WJR/6b7VZg1OK6qaJzpACkmhe1LEFhO35fTVM/Pn9rkkiq0ALB/RWMr96sTQiXlUDeFdj0ZWN8vFITcOz/Aj4FroudhtDmS2HlV2PzB8X3YR6VjJx7fXICh2sFDTxX1OgpH0RgpL96WOkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSCgnIar; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA751F00893;
	Sun,  7 Jun 2026 22:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780870025;
	bh=mPZqdNKS2UpywiGGJBE766IPUrevveDbf5M17VKm/bU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WSCgnIar83bNEchdXMyUPvIhP8mit/FdzothzuipDd7D9aFyULABHGh6GjX05CY7Z
	 ELoZ77ZC6cxcyqT0EoKy6+JGpJuxDPsJeo0v0ffZQPO+4CDbkgwQuRlPpldNsR+8Pb
	 QumjPvrKWYsEerM5djQEv5QREYC5VgpN7iVaPAYMO83dkhEjoeBoyu/QVOib+w7lD0
	 Dhovp/oYxZY6B+REEba+gxJj9juGd6WGZiCD616PPthvbPkxDKCVFO/sNpWjrYEn3L
	 pTgyp1rWCdZc2dxN33mUxhUws6REWGogF4yF6m+kTmgnxsKJSFhodqc0NtULPFZJ+0
	 t9Amw7OYKrv7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260607215356.842932-7-sakari.ailus@linux.intel.com>
References: <20260607215356.842932-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 22:07:05 +0000
Message-Id: <20260607220705.8AA751F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64099-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,intel.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4994A651C8A

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unscaled `exposure_max` allows userspace to request exposure times=
 that exceed the physical frame length during analog binning.
--

commit 5bb0595912a9dcd70c3d849b873e9a213a70ec05
Author: Sakari Ailus <sakari.ailus@linux.intel.com>

media: imx219: Fix vertical blanking and exposure for analogue binning

This commit removes a workaround that doubled the pixel rate, frame length
in lines, and exposure time for analog binning. It updates the minimum, max=
imum,
and step values for the control.

> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 3aebcbaa3fcd6..3cee31758b7e9 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
[ ... ]
> @@ -879,23 +868,25 @@ static int imx219_set_pad_format(struct v4l2_subdev=
 *sd,
>  	crop->top =3D (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> =20
>  	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
[ ... ]
>  		/* Update limits and set FPS to default */
> +		int vblank_min =3D ((int)mode->height * (1 - bin_hv) / bin_hv) +
> +			IMX219_VBLANK_MIN;
>  		ret =3D __v4l2_ctrl_modify_range(imx219->vblank,
> -					       IMX219_VBLANK_MIN * rate_factor,
> -					       (IMX219_FLL_MAX - mode->height) *
> -					       rate_factor, rate_factor,
> -					       mode->fll_def - mode->height);
> +					       vblank_min,
> +					       IMX219_FLL_MAX - mode->height, 1,
> +					       (int)(mode->fll_def / bin_hv) -
> +					       (int)mode->height);
>  		if (ret)
>  			return ret;
> =20
>  		ret =3D __v4l2_ctrl_s_ctrl(imx219->vblank,
> -					 mode->fll_def - mode->height);
> +					 (int)(mode->fll_def / bin_hv) -
> +					 (int)mode->height);
>  		if (ret)
>  			return ret;

[Severity: High]
Does this code allow userspace to request an exposure time that exceeds the
physical frame length?

When vblank is initialized via __v4l2_ctrl_s_ctrl() above, it dynamically
computes and sets the correct upper limit for the exposure control under
the hood.

However, immediately following this in imx219_set_pad_format(), the code us=
es
the unscaled mode->fll_def to modify the exposure limits:

		/* Update max exposure while meeting expected vblanking */
		exposure_max =3D mode->fll_def - IMX219_EXPOSURE_OFFSET;
		exposure_def =3D (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
				exposure_max : IMX219_EXPOSURE_DEFAULT;
		ret =3D __v4l2_ctrl_modify_range(imx219->exposure,
					       imx219->exposure->minimum,
					       exposure_max,
					       imx219->exposure->step,
					       exposure_def);

Since this patch removes the rate_factor division when writing V4L2_CID_EXP=
OSURE
to the sensor hardware in imx219_set_ctrl(), and exposure_max is not scaled
by bin_hv here, could this overwrite the safely computed hardware bound wit=
h an
unscaled maximum?

If so, userspace could successfully request an exposure value (e.g., 1703) =
while
the physical frame length is only 853, which might violate the fundamental
sensor constraint that exposure time must be less than the frame length.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607215356.8429=
32-1-sakari.ailus@linux.intel.com?part=3D6

