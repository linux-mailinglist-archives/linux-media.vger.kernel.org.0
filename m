Return-Path: <linux-media+bounces-64002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3xUgDS3cI2oizwEAu9opvQ
	(envelope-from <linux-media+bounces-64002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 10:37:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8209A64CF30
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 10:37:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ktBS5mr4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64002-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64002-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E6403026A8A
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 08:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E49318B96;
	Sat,  6 Jun 2026 08:31:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD042F361E;
	Sat,  6 Jun 2026 08:31:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780734675; cv=none; b=K62cX1mjmnqSI8KX8otC/WNfgf3aXCCcCJGLNKqRuLCTlBf6jlJ5W9UQ1ldOgcNa87kcpI4dwOY6oZT8fexv69WKfx9KJTufLG/4Kb3XIkOIucjQv1FPEj+XGwrfuQKAoB6BU8riJqjw68rGexUpH3Jg4kMr6uIRByl3/upjMdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780734675; c=relaxed/simple;
	bh=VVbdE4q/0Z2aRyOeM7MmDAdDZjnwnrjdudKVlAUt3P4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gDWnq1zBrR9ljfYs54NZxBRdVJe4e2P5uLr83zsiM/eZXfj0k+e5msuo73YElB4UR/MqICkQPsuAqklNeVelra6G2pTbrpTFLpe1fgosKTRH0K9tqTZtRwKH10FdnYZIcEgRgYSMo/3ut974zNtOXMqiKgmS3VbZW2oqNQjFSas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktBS5mr4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE2F1F00893;
	Sat,  6 Jun 2026 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780734673;
	bh=wDCTVaOFuCTm/GJQpTSl0rwG7lZZ4vUUkunHheOiv94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ktBS5mr4s8lttTI87ktE9M7kp5gv4kF4hehAumrwcMZb6xNAJOapIaaKObLa6clae
	 OAk/Rh3AdcefnLfB9bJHpc8fmE18yaZ3gAPtvG38tsN4Syvk42WLP9TcTuetXhSCuP
	 lNF6B5Pkn3oljm0MTyh6yOzBRg+WKzCrCN6k8iGRjm24B/ZWwY6lguVtsrzyGxxnZ5
	 xevaCAhlyPFY5lCmFbl6/RsYtpJWxFkcvw6jk3xLEUFqnp4R/QiThMxuQjLQz+FsXE
	 mVkYI79xmd+xMEnv1YV/muyYTzJhLRDJZPJlm4+1hTmOG49OCYdyNRwZ6ZavKbPoXn
	 2ohC/KkOqKwYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: add Aptina MT9M113 1.3 Mpx SoC
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk via B4 Relay" <devnull+github.com.herrie.org@kernel.org>
Cc: linux-media@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260606-submit-media-mt9m113-v4-2-046b4cbc7f94@herrie.org>
References: <20260606-submit-media-mt9m113-v4-2-046b4cbc7f94@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 08:31:12 +0000
Message-Id: <20260606083113.2CE2F1F00893@smtp.kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,herrie.org:email,smtp.kernel.org:mid];
	TAGGED_FROM(0.00)[bounces-64002-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+github.com.herrie.org@kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 8209A64CF30

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Stream-start retry loop fails to power-cycle the sensor due to PM =
device links.
- [High] Use-after-free and locking freed memory during concurrent ioctls d=
ue to missing devnode synchronization in `remove()`
- [High] mt9m113_stream_context_a ignores the SEQ_CMD_RUN timeout, defeatin=
g the stream-start retry mechanism.
- [Medium] State Desynchronization on V4L2_CID_TEST_PATTERN failure
- [Low] Missing Kconfig Dependency for V4L2_FWNODE
--

commit 2bce75457f74983c7027490425c51795edae1c92
Author: Herman van Hazendonk <github.com@herrie.org>

media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver

Add a V4L2 subdev driver for the Aptina MT9M113 1.3 Megapixel SoC
image sensor with on-chip ISP. The sensor exposes dual context operation,
single-lane MIPI CSI-2 output, and implements a stream-start retry
mechanism to recover the MCU.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
[ ... ]
> @@ -302,6 +302,18 @@ config VIDEO_MT9M111
>  	  This driver supports MT9M111, MT9M112 and MT9M131 cameras from
>  	  Micron/Aptina
> =20
> +config VIDEO_MT9M113
> +	tristate "Aptina MT9M113 sensor support"
> +	select V4L2_CCI_I2C

[Severity: Low]
Is this missing a select for V4L2_FWNODE? The driver calls
v4l2_fwnode_endpoint_alloc_parse() and v4l2_fwnode_endpoint_free() during
probe and remove. If the driver is enabled but V4L2_FWNODE is disabled,
can this cause a build failure with undefined references?

> diff --git a/drivers/media/i2c/mt9m113.c b/drivers/media/i2c/mt9m113.c
> --- /dev/null
> +++ b/drivers/media/i2c/mt9m113.c
[ ... ]
> +static int mt9m113_stream_context_a(struct mt9m113 *sensor, u16 output_c=
trl_val,
> +				    u32 code)
> +{
[ ... ]
> +	dev_dbg(dev, "MT9M113: Writing SEQ_CMD_RUN\n");
> +	ret =3D mt9m113_write_mcu_var(sensor, MT9M113_SEQ_CMD, MT9M113_SEQ_CMD_=
RUN);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D mt9m113_poll_mcu_var(sensor, MT9M113_SEQ_CMD, 0x0000, 500);
> +	if (ret < 0)
> +		dev_warn(dev, "MT9M113: SEQ_CMD_RUN did not complete\n");
> +
> +	mt9m113_reassert_output(sensor, output_ctrl_val,
> +				MT9M113_MODE_OUTPUT_FORMAT_A, code);
> +	msleep(20);
> +	return 0;
> +}

[Severity: High]
Does this code silently ignore the failure if mt9m113_poll_mcu_var() times
out? By unconditionally returning 0, the error code in ret is discarded.
Could this falsely report success back to mt9m113_start_streaming() and
completely bypass the retry mechanism for Context A, leaving the MCU
wedged?

[ ... ]
> +static int mt9m113_start_streaming(struct mt9m113 *sensor,
> +				   struct v4l2_subdev_state *state)
> +{
> +	struct device *dev =3D &sensor->client->dev;
> +	unsigned int attempt;
> +	int ret =3D 0;
[ ... ]
> +	for (attempt =3D 0; attempt < MT9M113_STREAM_START_RETRIES; attempt++) {
> +		ret =3D pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D mt9m113_stream_on(sensor, state);
> +		if (!ret) {
> +			sensor->streaming =3D true;
> +			return 0;
> +		}
> +
> +		pm_runtime_put_sync_suspend(dev);
> +		if (attempt + 1 < MT9M113_STREAM_START_RETRIES)
> +			dev_warn(dev,
> +				 "MT9M113: stream start failed (%d), power-cycle + retry %u/%u\n",
> +				 ret, attempt + 1, MT9M113_STREAM_START_RETRIES - 1);
> +	}

[Severity: High]
Does pm_runtime_put_sync_suspend() successfully suspend the sensor here?

Because V4L2 subdevices have managed device links (DL_FLAG_PM_RUNTIME)
connecting them to the host bridge, the bridge is active while calling
s_stream.

Will the PM core reject the suspend attempt with -EBUSY, preventing the
sensor from actually powering down? It seems the subsequent
pm_runtime_resume_and_get() would immediately return without invoking the
runtime_resume callback, leaving the hardware wedged and defeating the
retry loop.

[ ... ]
> +static int mt9m113_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	case V4L2_CID_TEST_PATTERN:
> +		if (ctrl->val =3D=3D 0) {
[ ... ]
> +		} else {
> +			/*
> +			 * Enable test pattern mode.
[ ... ]
> +			 */
> +			sensor->test_pattern_active =3D true;
> +			sensor->test_pattern_value =3D ctrl->val;
> +			dev_dbg(&sensor->client->dev,
> +				 "MT9M113: Enabling test pattern %d\n", ctrl->val);
> +			if (sensor->streaming)
> +				ret =3D mt9m113_apply_test_pattern(sensor,
> +								 ctrl->val);
> +		}

[Severity: Medium]
What happens if mt9m113_apply_test_pattern() fails and returns an error?
The internal state (test_pattern_active and test_pattern_value) is already
updated before verifying the hardware write succeeded.

If the I2C write fails, V4L2 will reject the control change, but wouldn't
the driver's internal state remain permanently stuck with test_pattern_acti=
ve
set to true? It looks like this would cause all subsequent V4L2 controls
to skip the required mt9m113_refresh() call because they mistakenly think
the MCU is halted for a test pattern.

[ ... ]
> +static void mt9m113_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mt9m113 *sensor =3D ifp_to_mt9m113(sd);
> +	struct device *dev =3D &client->dev;
> +
> +	v4l2_async_unregister_subdev(&sensor->ifp.sd);
> +	v4l2_subdev_cleanup(&sensor->ifp.sd);
> +	v4l2_ctrl_handler_free(&sensor->ifp.hdl);
> +	media_entity_cleanup(&sensor->ifp.sd.entity);

[Severity: High]
Is it safe to free the control handlers and rely on devres to free the
sensor structure here without waiting for active ioctls to finish?

The driver registers a devnode for userspace access via
V4L2_SUBDEV_FL_HAS_DEVNODE. While v4l2_async_unregister_subdev() calls
video_unregister_device() to mark the device as unregistered, it does not
block waiting for active ioctls to conclude.

If a userspace process has the devnode open and is executing an ioctl like
VIDIOC_S_CTRL, it holds the control handler's mutex. When the ioctl
completes, could it access freed memory and attempt to unlock a destroyed
mutex when devres frees the sensor structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-submit-med=
ia-mt9m113-v4-0-046b4cbc7f94@herrie.org?part=3D2

