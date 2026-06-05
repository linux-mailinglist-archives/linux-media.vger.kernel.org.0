Return-Path: <linux-media+bounces-63861-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oVKFOJRJImriUgEAu9opvQ
	(envelope-from <linux-media+bounces-63861-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:59:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41445644F9D
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:59:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BA76D90v;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63861-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63861-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17AA330179D2
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 03:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFF821883E;
	Fri,  5 Jun 2026 03:53:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1722D63E5;
	Fri,  5 Jun 2026 03:53:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780631593; cv=none; b=IfvTWrqiolg0npHWyS/ZYcqEIDK8QarfLzhkNmQorH8YZwCY7DPbQsUKaLFCSnb9vDqtwgbeq992/rIrhxLf30h8qMaVjwOL2rDeWLDk3KScNT6ujgGvGfgGChPWNuJ2TFEuFDRN+1mmaaq796TGieYTAhMYhMe2kDRHtTw9TOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780631593; c=relaxed/simple;
	bh=C9FUuTDmswaKPxDlnddwA8MGnLaPvZtOcWlmCMylSw8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ap2Tu+/HKLft85H7Fu+neQXjYkzxfbtzuwXsAyxnQ2a/UKJuTUJkSm9nl62RRcUDPs4txtq/2AWxFp7EX/nHpNfVO5lAhDQlK0S52cHOP117nyeuNKL+jZfTcMrAJ0m6Pp2kvM27EEPyLf1zAxSZs7lMg0hHWmhQO+G69m31zXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BA76D90v; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0761F00893;
	Fri,  5 Jun 2026 03:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780631591;
	bh=IURgKI9DPys9S/daN3ogAhcRv2VvLGBVWU9UPY/4VUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BA76D90v1uVXtLyNetHKHXss+cl/WBpeMNw4vnrEFqX5mrEwBmSwHPYuzDMdJp7O7
	 PtNBX95rFF/PGlIbIlJM1U986LUoxPLT8I85cz3KZYwhL3wgdfyJaEDfKnB9ErGeAq
	 HhgMN8fk+MvuO+tceWJ6sn0UCYecF4ou0d0c9yRv/WWOuw4wgBUhO4FDKdazN3+CDa
	 3CzoaNDeuX9yKnV0OfP6Fqr5ge2TNa05MrmuVOYWe3KBuQqPVcXkuEzTEnqUPOdO+D
	 5Zq4cEbYlQfqutcyw009C7lc3BE0AITiqCcm1opd4qQtArO83LleDraV23+bHhbfoR
	 LAaSLENOnta2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: add Aptina MT9M113 1.3 Mpx SoC
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk via B4 Relay" <devnull+github.com.herrie.org@kernel.org>
Cc: robh@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605-submit-media-mt9m113-v2-2-de1cc807f4cf@herrie.org>
References: <20260605-submit-media-mt9m113-v2-2-de1cc807f4cf@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 03:53:11 +0000
Message-Id: <20260605035311.7B0761F00893@smtp.kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,lists.linux.dev:replyto,vger.kernel.org:from_smtp];
	TAGGED_FROM(0.00)[bounces-63861-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+github.com.herrie.org@kernel.org,m:robh@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 41445644F9D

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] PM Runtime concurrency defeats the MCU wedge recovery power-cycle =
in `mt9m113_start_streaming()`.
- [High] Context A silently ignores the `SEQ_CMD_RUN` timeout and returns 0=
, defeating the retry logic and leaving the camera wedged.
- [Medium] Test pattern control fails to hold the MCU in boot mode if appli=
ed before streaming, and misses a refresh when disabled.
- [Medium] The pixel array subdevice (`mt9m113_pa_pad_ops`) lacks a `.set_f=
mt` pad operation, which breaks userspace pipeline configuration.
--

commit 72b95e84525e87e9da1a8e3e471cb42137c9f583
Author: Herman van Hazendonk <github.com@herrie.org>

media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver

Add a V4L2 subdev driver for the Aptina MT9M113 1.3 Megapixel SoC
image sensor (1280x1024 active pixel array) with on-chip ISP. The
sensor exposes dual context operation, single-lane MIPI CSI-2 output,
and various V4L2 controls.

> diff --git a/drivers/media/i2c/mt9m113.c b/drivers/media/i2c/mt9m113.c
> new file mode 100644
> index 0000000000000..7a4a8a50822d3
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
Does this silently ignore the timeout error?

If mt9m113_poll_mcu_var() returns -ETIMEDOUT, the function logs a warning
but proceeds to return 0.

This tricks mt9m113_stream_on() into succeeding and bypasses the retry logic
in mt9m113_start_streaming(), leaving the camera wedged.

[ ... ]
> +static int mt9m113_start_streaming(struct mt9m113 *sensor,
> +				   struct v4l2_subdev_state *state)
> +{
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
Is this retry path vulnerable to PM runtime concurrency?

If another context holds a PM runtime reference, the usage counter will not
drop to zero.

The call to pm_runtime_put_sync_suspend() will return -EAGAIN without
suspending, meaning the sensor is never physically power-cycled and the
wedge recovery fails.

[ ... ]
> +static const struct v4l2_subdev_pad_ops mt9m113_pa_pad_ops =3D {
> +	.enum_mbus_code =3D mt9m113_pa_enum_mbus_code,
> +	.enum_frame_size =3D mt9m113_pa_enum_framesizes,
> +	.get_fmt =3D v4l2_subdev_get_fmt,
> +	.get_selection =3D mt9m113_pa_get_selection,
> +};

[Severity: Medium]
Is the set_fmt callback missing here?

V4L2 requires a set_fmt callback even for fixed-format pads so that it can
force the state to the fixed format.

Without it, userspace tools configuring the pipeline will receive
-ENOIOCTLCMD and fail to negotiate the format link.

[ ... ]
> +static int mt9m113_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	case V4L2_CID_TEST_PATTERN:
> +		if (ctrl->val =3D=3D 0) {
[ ... ]
> +			if (sensor->test_pattern_active) {
> +				dev_dbg(&sensor->client->dev,
> +					 "MT9M113: Disabling test pattern, restarting MCU\n");
> +				cci_write(sensor->regmap, MT9M113_MCU_BOOT_MODE,
> +					  0x0000, &ret);
> +				if (!ret) {
> +					usleep_range(10000, 15000);
> +					ret =3D mt9m113_write_mcu_var(sensor,
> +								    MT9M113_CAM_MODE_SELECT,
> +								    MT9M113_CAM_MODE_SELECT_NORMAL);
> +				}
> +				if (!ret)
> +					sensor->test_pattern_active =3D false;
> +			}

[Severity: Medium]
Does disabling the test pattern miss a refresh call?

The driver writes MT9M113_CAM_MODE_SELECT_NORMAL but does not call
mt9m113_refresh(), so the MCU might ignore the request to switch back to
normal mode.

> +		} else {
[ ... ]
> +			ret =3D mt9m113_write_mcu_var(sensor,
> +						    MT9M113_CAM_MODE_TEST_PATTERN_SELECT,
> +						    mt9m113_test_pattern_value[ctrl->val - 1]);
> +			if (!ret)
> +				ret =3D mt9m113_write_mcu_var(sensor,
> +							    MT9M113_CAM_MODE_SELECT,
> +							    MT9M113_CAM_MODE_SELECT_TEST_PATTERN);
> +			if (!ret && sensor->streaming) {
> +				mt9m113_refresh(sensor);
> +				dev_dbg(&sensor->client->dev,
> +					 "MT9M113: Stopping MCU for test pattern\n");
> +				cci_write(sensor->regmap, MT9M113_MCU_BOOT_MODE,
> +					  0x0001, &ret);
> +			}
> +		}
> +		break;

[Severity: Medium]
If V4L2_CID_TEST_PATTERN is set before streaming starts,
__v4l2_ctrl_handler_setup() applies it while sensor->streaming is still
false.

Will this cause the driver to skip putting the MCU in boot mode
(MT9M113_MCU_BOOT_MODE =3D 0x0001)? The free-running MCU would then override
the test pattern.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-submit-med=
ia-mt9m113-v2-0-de1cc807f4cf@herrie.org?part=3D2

