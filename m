Return-Path: <linux-media+bounces-63387-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6qkYGuTdHmrzWgAAu9opvQ
	(envelope-from <linux-media+bounces-63387-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:43:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F1F62E993
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:42:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WGGWEzPr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63387-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63387-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE8BD3082402
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64D43E7BB8;
	Tue,  2 Jun 2026 13:30:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91E638BF7A
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 13:29:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407001; cv=none; b=PFywyWp7mUT1+9eUvb7sJOq4oKFlMJy/R7PD4G00v1zeE7eWYQngvA9La0IPt1k9wiVkUL+0l5u3FYVZ+EQLj/gpWB2ixk2gYE8PGz6RUyr07dsmw+y6e45XHdTH4z0SXKk/HSrzDdbdRbyxEouoNsKFZav63guNgQhO78QRs8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407001; c=relaxed/simple;
	bh=H/nJlQCl0dHCnfDjBWKIuU8ssV378xo7vdO32XOl6kw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JJQn2p75y2JLLEv77onB/vRIHMP9ZaCEL5oMf6So6/wkieKydYvUg07ErS7OgWdpzkfPt9HtjXKXcZDjRIQESfGsLxRnEGS//3gXgr5JDWM8XC9g7ju/VrXf69+/GCSXjooJIJnjLoUaxM2iTVekPnr5q6zrB1M4V4L+kVGYfl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGGWEzPr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0B91F00893;
	Tue,  2 Jun 2026 13:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406999;
	bh=n3dgSi8lo7HkhZs1ysajnES/8TIaB78wJt51YhugZpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WGGWEzPrm+UxBojj/4vW687lIeZ2RfQ6GJZekvZUJjjK+9G3JyXlOYcZog58uihE5
	 HCJLgHDB9Jw/BKMsiKfs9oFcVkDgedCzPAbddS9avcv7Kc6ksItmRdQ0e3DFIE9F+D
	 V2PHtfkAaYc2LB+XKj5XQIQi6Ok39+Ev7+vOx5FG+OZK8yuIJLUNZoGDo8tp9yHYW2
	 HTWCQ5QpED6xYCb68qSmuHnFvz9Z/l0N24BXYmc7m8FYKm4mrpJs6a0qsiS36cNXt/
	 jBTHAkoiPw8FCOHaWicaYFWAgoDp0x/c+pbvy77jy7TTuaoLA5yOMYIq/KrUM28EA0
	 p8hMvMfY7B/TQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/13] media: stm32: dcmipp: addition of a dcmipp-isp
 subdev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-9-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-9-3c76b5f93157@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 13:29:58 +0000
Message-Id: <20260602132959.5D0B91F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63387-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lists.linux.dev:replyto,smtp.kernel.org:mid,vger.kernel.org:from_smtp,st.com:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55F1F62E993

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] A kernel panic can be triggered from userspace via a division =
by zero in dcmipp_isp_config_decimation() due to an improperly constrained =
minimum crop height.
- [High] Shifting `crop->top` by 12 bits without masking causes it to struc=
turally overlap with `DCMIPP_P1SRCR_CROPEN` and adjacent fields, leading to=
 hardware register corruption.
- [Medium] Missing cleanup of V4L2 subdev active state and media pads in dc=
mipp_isp_release().
- [Medium] Pad 2 format dimensions are out-of-sync after changing sink pad =
crop/compose rectangles.
- [Medium] Lockless data race and incorrect logic when checking `v4l2_subde=
v_is_streaming(sd)` for TRY formats and selections.
- [Low] Incorrect error log message when disabling streams.
--

commit af4dc8e19ff9f5d7a94a2442ffa7e909d7948584
Author: Alain Volmat <alain.volmat@foss.st.com>
media: stm32: dcmipp: addition of a dcmipp-isp subdev

The ISP subdev is the first element after input of the main pipeline.
Part (static configuration) of this block is done via this subdev while
other configuration done on a per-frame basis will be done via a output
metadata device attached to this subdev.

> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c b/=
drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c
[ ... ]
> +static int dcmipp_isp_set_fmt(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *state,
> +			      struct v4l2_subdev_format *fmt)
> +{
> +	if (v4l2_subdev_is_streaming(sd))

[Severity: Medium]
Does this code locklessly reject TRY operations when streaming is active?

These format modifications are blocked if v4l2_subdev_is_streaming(sd)
is true, but the code fails to verify whether the format being changed is
V4L2_SUBDEV_FORMAT_TRY.  Rejecting TRY operations breaks userspace tooling
that expects to safely test formats while the active stream runs.

Also, calling v4l2_subdev_is_streaming() here reads sd->enabled_pads
locklessly when invoked for TRY formats, creating a race condition against
v4l2_subdev_enable_streams().

> +		return -EBUSY;
[ ... ]
> +static void dcmipp_isp_adjust_crop(struct v4l2_rect *r,
> +				   const struct v4l2_mbus_framefmt *fmt)
> +{
> +	struct v4l2_rect src_rect =3D {
> +		.top =3D 0,
> +		.left =3D 0,
> +		.width =3D fmt->width,
> +		.height =3D fmt->height,
> +	};
> +	struct v4l2_rect crop_min =3D {
> +		.top =3D 8,

[Severity: Critical]
Does this code inadvertently set the minimum crop height to 1 instead of 8?

A typo initializes crop_min with .top =3D 8 instead of .height =3D 8.
If userspace sets the crop height to 1 and subsequently requests a compose
height of 0 via V4L2_SEL_TGT_COMPOSE, dcmipp_isp_set_compose() scales size
down to 0, which sets compose->height to 0.

Later, during streaming initialization, dcmipp_isp_config_decimation()
would evaluate crop->height / compose->height, causing a fatal division
by zero kernel panic.

> +		.left =3D 0,
> +		.width =3D fmt->width,
> +		.height =3D 1,
> +	};
[ ... ]
> +static int dcmipp_isp_set_selection(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *state,
> +				    struct v4l2_subdev_selection *s)
> +{
> +	struct dcmipp_isp_device *isp =3D v4l2_get_subdevdata(sd);
> +	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
> +	struct v4l2_rect *crop, *compose;
> +
> +	if (IS_SRC(s->pad))
> +		return -EINVAL;
> +
> +	if (v4l2_subdev_is_streaming(sd))

[Severity: Medium]
Does this code also locklessly reject TRY selections when streaming is acti=
ve?

> +		return -EBUSY;
[ ... ]
> +	/* Update the source pad size */
> +	src_fmt =3D v4l2_subdev_state_get_format(state, 1);
> +	src_fmt->width =3D s->r.width;
> +	src_fmt->height =3D s->r.height;

[Severity: Medium]
Does this code leave pad 2 with out-of-sync format dimensions?

When a crop or compose operation alters the outgoing image dimensions,
only pad 1 is updated with the new dimensions.  Pad 2 is omitted entirely,
leaving it with stale format dimensions that no longer reflect the actual
composed image size.

> +
> +	return 0;
> +}
[ ... ]
> +static void dcmipp_isp_config_decimation(struct dcmipp_isp_device *isp,
> +					 struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_rect *crop =3D v4l2_subdev_state_get_crop(state, 0);
> +	struct v4l2_rect *compose =3D v4l2_subdev_state_get_compose(state, 0);
> +	u32 decr;
> +
> +	decr =3D (fls(crop->width / compose->width) - 1) << DCMIPP_P1DECR_HDEC_=
SHIFT |
> +	       (fls(crop->height / compose->height) - 1) << DCMIPP_P1DECR_VDEC_=
SHIFT;

[Severity: Critical]
Does this cause a division by zero kernel panic if compose->height is 0?

Because dcmipp_isp_adjust_crop() mistakenly assigns .top =3D 8 instead of
.height =3D 8, userspace can set the compose height to 0, which leads to
a fatal division by zero here.

> +	if (decr)
> +		decr |=3D DCMIPP_P1DECR_ENABLE;
> +
> +	reg_write(isp, DCMIPP_P1DECR, decr);
> +}
[ ... ]
> +static int dcmipp_isp_enable_streams(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     u32 pad, u64 streams_mask)
> +{
[ ... ]
> +	/* Configure Statistic Removal */
> +	crop =3D v4l2_subdev_state_get_crop(state, 0);
> +	reg_write(isp, DCMIPP_P1SRCR,
> +		  ((crop->top << DCMIPP_P1SRCR_FIRSTLINEDEL_SHIFT) |

[Severity: High]
Does shifting crop->top by 12 bits without masking structurally overlap with
DCMIPP_P1SRCR_CROPEN and clobber adjacent register fields?

DCMIPP_P1SRCR_FIRSTLINEDEL_SHIFT is defined as 12, while DCMIPP_P1SRCR_CROP=
EN
is BIT(15).  If crop->top specifies dozens or hundreds of lines to drop,
shifting a value like 100 by 12 places it across bits 12 through 23, creati=
ng
a structural overlap with CROPEN and potentially causing hardware state
corruption.

> +		   (crop->height << DCMIPP_P1SRCR_LASTLINE_SHIFT) |
> +		   DCMIPP_P1SRCR_CROPEN));
[ ... ]
> +static int dcmipp_isp_disable_streams(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state,
> +				      u32 pad, u64 streams_mask)
> +{
[ ... ]
> +	ret =3D v4l2_subdev_disable_streams(s_subdev, s_pad->index, BIT_ULL(0));
> +	if (ret < 0) {
> +		dev_err(isp->dev,
> +			"failed to start source subdev streaming (%d)\n", ret);

[Severity: Low]
This isn't a bug, but is this error log message printing 'start' instead
of 'stop' or 'disable'?

> +		return ret;
> +	}
[ ... ]
> +static void dcmipp_isp_release(struct v4l2_subdev *sd)
> +{
> +	struct dcmipp_isp_device *isp =3D v4l2_get_subdevdata(sd);
> +
> +	kfree(isp);

[Severity: Medium]
Does this code leak the V4L2 subdev active state and media pads?

In dcmipp_isp_ent_init(), dcmipp_ent_sd_register() allocates media pads
(ved->pads) via dcmipp_pads_init() and the subdev's active state
(sd->active_state) via v4l2_subdev_init_finalize().  However, this release
callback completely omits the required dcmipp_pads_cleanup() and
v4l2_subdev_cleanup(), causing a memory leak upon device removal or unbind.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-stm32-dcmi=
pp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com?part=3D9

