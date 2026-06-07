Return-Path: <linux-media+bounces-64042-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TbZSJD8GJWpxCwIAu9opvQ
	(envelope-from <linux-media+bounces-64042-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 07:48:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AC864EE50
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 07:48:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZWpDIi2q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64042-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64042-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43697301D317
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 05:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26C52DAFCC;
	Sun,  7 Jun 2026 05:48:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2B4071DA;
	Sun,  7 Jun 2026 05:48:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780811315; cv=none; b=G33C7uErQVLPwiL51sH4L2JLuWGAJBPj00T41qh9Lp4PdHkgUq9FEhcXvLWpkzBM9C0B7M6VAGH7GqgykwIWYdfAsjqmGkFkKXfMmxM6BD6Pu52HPa1Eawz5dCd1+7R4QZBc09MbJ3KFESKP3o2lUw/TeV1Whclu5tpLOqQ8AbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780811315; c=relaxed/simple;
	bh=R+UJoSm8O+SDA8USCES84ydhdYK99kE7yBiR1A24i9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uaHMS0BxgyN+q9T72YUqyQf+5UvGorrEjRYifVC7tj09jogI5aR+EFp2w79R5Xn2u2ZYD8G32MovPLQyrJWZKjLlblU1oS/J3Tohe7a8hnFPHccSQgfMFXzb4lUWV1x17urRxvzOT1qQjUt1YWmvNwAwTe+MXHlmOubgncYVq8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWpDIi2q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4375F1F00893;
	Sun,  7 Jun 2026 05:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780811313;
	bh=1YIHg6jYvetr4BuVjCuxeF+1XK9JGQg2sFQoPrr+L74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZWpDIi2qs2QOGPhMIW+EhCNjcbUWhRroT1ni6Nuy1v1l8HXcpGxvimdIhrQUUv39h
	 xd8kKT1wWyq6fMiMh8xfvElRXuqda/AjvcgSbhMrtXEKHsmEY55Xc94C/PV8qfX9ct
	 XTXPUxDehucoJf72zmar2dKMK3CmY84P2tSV5PPE2u+cl9OQgxSLErSPLTCz7BaWMx
	 /KU0I/dK9wwlnKVsdeaqsdw8ZQui2vqtQwpzVcJ1AYGC/wY4cF9V9Tc+lbCoHxRWGh
	 HthiACYUB4zI0rpj09kv7CAYjnwTWfSTSKBsLSnC1IIAECmGP6idOAzVjVGCYYrlq/
	 ywNnQXw7rTu/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] media: i2c: add Aptina MT9M113 1.3 Mpx SoC
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk via B4 Relay" <devnull+github.com.herrie.org@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260607-submit-media-mt9m113-v7-2-5da397a3d2a5@herrie.org>
References: <20260607-submit-media-mt9m113-v7-2-5da397a3d2a5@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:48:32 +0000
Message-Id: <20260607054833.4375F1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,smtp.kernel.org:mid,herrie.org:email,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-64042-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+github.com.herrie.org@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:linux-media@vger.kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,github.com.herrie.org,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8AC864EE50

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] The mt9m113_ifp_registered callback triggers a Use-After-Free =
if media_create_pad_link fails.
- [High] mt9m113_remove() ignores the sensor->chip_off flag, causing double=
-decrement of clocks and regulators.
- [High] mt9m113_ifp_s_stream initiates hardware sequences without acquirin=
g sensor->lock, allowing race conditions.
- [High] The sensor structure and its associated resources are leaked if th=
e driver is unbound before the async subdev matches a bridge.
- [High] PM state mismatch on stream-start failure leads to a double power-=
off on subsequent retries.
- [High] Calling __v4l2_ctrl_handler_setup() without holding the control ha=
ndler mutex triggers lockdep assertions and data races.
- [Medium] The pixel array subdev pad operations omit the .set_fmt callback=
, breaking V4L2 TRY format verification.
- [Medium] Failing to write the test pattern disable command leaves the sof=
tware state permanently desynchronized from the running MCU.
--

commit 36cbbea6221881b8d118c066c2b7c1a0947ac0a3
Author: Herman van Hazendonk <github.com@herrie.org>
Subject: media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver

This commit adds a V4L2 subdev driver for the Aptina MT9M113 1.3 Megapixel
camera sensor. It features dual context support and single-lane MIPI CSI-2.

> diff --git a/drivers/media/i2c/mt9m113.c b/drivers/media/i2c/mt9m113.c
> new file mode 100644
> index 0000000000000..453e02e0f5b11
> --- /dev/null
> +++ b/drivers/media/i2c/mt9m113.c

[ ... ]

> +static int mt9m113_stream_on(struct mt9m113 *sensor,
> +			     struct v4l2_subdev_state *state)
> +{
[ ... ]
> +	/* Apply all V4L2 controls (color effects, etc.) before streaming */
> +	ret =3D __v4l2_ctrl_handler_setup(&sensor->ifp.hdl);

[Severity: High]
Is it safe to call this underscored helper without holding the control
handler's lock first?=20

The stream-on path seems to be called from the subdev stream operation which
only holds the state lock, so this might trigger a lockdep splat and allow
data races on the control lists. Should this use v4l2_ctrl_handler_setup()
instead?

[ ... ]

> +static int mt9m113_start_streaming(struct mt9m113 *sensor,
> +				   struct v4l2_subdev_state *state)
> +	__must_hold(state->lock)
> +{
[ ... ]
> +		if (attempt + 1 >=3D MT9M113_STREAM_START_RETRIES) {
> +			/*
[ ... ]
> +			 */
> +			mt9m113_power_off(sensor);
> +			break;
> +		}

[Severity: High]
If the retry loop is exhausted, the hardware is powered down but the PM
runtime state is left active because of the external bridge reference.=20

Could a subsequent stream start attempt instantly succeed the PM resume che=
ck
and then blindly call power-off again here upon failing to talk to the chip,
causing a clock and regulator refcount underflow?

[ ... ]

> +static int mt9m113_ifp_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct mt9m113 *sensor =3D ifp_to_mt9m113(sd);
> +	struct v4l2_subdev_state *state;
> +	int ret;
> +
> +	state =3D v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	if (enable)
> +		ret =3D mt9m113_start_streaming(sensor, state);

[Severity: High]
Does this operation need to acquire the driver's internal sensor->lock?=20

Since driver removal and V4L2 control updates acquire it to serialize
hardware access, skipping it here might allow concurrent hardware sequences=
 or
an unbind during stream initialization to corrupt the MCU state.

[ ... ]

> +static const struct v4l2_subdev_pad_ops mt9m113_pa_pad_ops =3D {
> +	.enum_mbus_code =3D mt9m113_pa_enum_mbus_code,
> +	.enum_frame_size =3D mt9m113_pa_enum_framesizes,
> +	.get_fmt =3D v4l2_subdev_get_fmt,
> +	.get_selection =3D mt9m113_pa_get_selection,
> +};

[Severity: Medium]
Is there a missing set_fmt callback in this structure?=20

Without it, any try-format operations on the pixel array pad might fail
unconditionally with an unsupported ioctl error, which breaks standard
compliance tools trying to test format states.

[ ... ]

> +static int mt9m113_ifp_registered(struct v4l2_subdev *sd)
> +{
[ ... ]
> +	if (ret < 0) {
> +		dev_err(&sensor->client->dev,
> +			"Failed to link pixel array to ifp\n");
> +		v4l2_device_unregister_subdev(&sensor->pa.sd);
> +		return ret;
> +	}

[Severity: Critical]
Could this error path cause a use-after-free?=20

Unregistering the pixel array subdev here will synchronously trigger its
release callback. Since the release count is still at its initial value of 1
at this point, the callback will free the main sensor structure, leaving the
framework to clean up the partially registered ifp subdev embedded within i=
t.

[ ... ]

> +static int mt9m113_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +				if (!ret && sensor->streaming)
> +					ret =3D mt9m113_refresh(sensor);
> +				if (!ret) {
> +					sensor->test_pattern_active =3D false;
> +					sensor->test_pattern_value =3D 0;
> +				}

[Severity: Medium]
If the test pattern register write fails, the MCU is successfully unhalted =
but
the test pattern active flag remains true.=20

Would this prevent all subsequent control updates from issuing their necess=
ary
refresh commands, leaving the software state disconnected from the running
hardware?

[ ... ]

> +static void mt9m113_remove(struct i2c_client *client)
> +{
[ ... ]
> +	pm_runtime_disable(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	if (!pm_runtime_status_suspended(dev))
> +		mt9m113_power_off(sensor);

[Severity: High]
Since the start-streaming failure path sets the chip-off flag after a manual
power down, shouldn't we check that flag here before powering off?=20

Bypassing it based purely on the active PM state might trigger a double
disable of the regulators and clocks.

> +	pm_runtime_set_suspended(dev);
> +
> +	v4l2_async_unregister_subdev(&sensor->ifp.sd);
> +	/* @sensor may already be freed here; do not dereference it. */
> +}

[Severity: High]
What happens if the driver is unbound before the async subdev ever matches a
bridge?=20

In that case, the subdev was never fully registered to a v4l2 device, so
removing it from the async list won't trigger the release callback, causing
the memory for the sensor structure to be permanently leaked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607-submit-med=
ia-mt9m113-v7-0-5da397a3d2a5@herrie.org?part=3D2

