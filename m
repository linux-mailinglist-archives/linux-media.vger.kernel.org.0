Return-Path: <linux-media+bounces-63872-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eINFC9t3Imq9XwEAu9opvQ
	(envelope-from <linux-media+bounces-63872-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:16:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B258A645DC8
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:16:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="H8J3pL/A";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63872-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63872-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58AA93046DEA
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 07:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DFA46AEDD;
	Fri,  5 Jun 2026 07:16:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F5837AA72;
	Fri,  5 Jun 2026 07:16:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643789; cv=none; b=oktXiW8oYreverBkdOzeeOGPxCav+9bzxn6cgAk47GGjy3qL2EkdeF0RTtN/vcfUQ05Alwr6wePUmZJ7OFV92XkrLFQl028fbRoUsSpoU1ohDhM7kn91dRkSke8V2GplCuxVkjuTgIVA0YFfjpEE5TKUxQe71Oa2PDA09ZOzdqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643789; c=relaxed/simple;
	bh=x84W0xz9I1F+gmZ6rJuxsqoSwNv/9znj53etFTTFSbs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rtdQ5a0CXCV0haoF/9yCm2yZFCfoB3ylReNi5GD8OUHAi2MFKBuB4oVLT4kPj3UqEotJjbuQ9PBRsCr52qGSfniECfYCXaea9QqhTHfYfcshZCjbFpaM7InARZ2YN4MosUgydENDKiOTNLrSGXqKbSc4nmrowHtGbN3JI/Iqfdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8J3pL/A; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2E61F00893;
	Fri,  5 Jun 2026 07:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780643786;
	bh=rV1kjHB4MCSq6/UaoZZ7SlNO7NPDs/519Z4ho1WldpA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H8J3pL/A82LZfSJsHPm149FsusvOVcws/Sp4btfYkcINrQe+doIm0QTCnLukZeowJ
	 mwdoAi6OqvqulS/q8pN4kjVaM4l8r9YCGtrqsL9ruPinrO6vJ7LDEYrQsCcETRVb37
	 Jn7MFbAYPoQbb2wyUO8hC0YxzdlNfZ6ljCwu90TnNEzXTF6658Hva5CnQq0A7fnwJ0
	 ZN5IngIrty4CkUEcBkWQCTjfpuHtB6BJeLiSP/auud/wkDaJgJAX9OOU3E/OBuwGZ0
	 YBPqxrt/Mk2i4Vs72jwWeL6aU22ZAiYPOAJrP/B4s36AxBi8g3DAh7HmzvYxxKbskF
	 Ia1muAZnX5E+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: add Aptina MT9M113 1.3 Mpx SoC
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk via B4 Relay" <devnull+github.com.herrie.org@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260605-submit-media-mt9m113-v3-2-dc3e07d5d70b@herrie.org>
References: <20260605-submit-media-mt9m113-v3-2-dc3e07d5d70b@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 07:16:26 +0000
Message-Id: <20260605071626.9D2E61F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid,herrie.org:email,vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto];
	TAGGED_FROM(0.00)[bounces-63872-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B258A645DC8

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The test pattern implementation has critical state machine flaws t=
hat prevent it from activating on stream start and break the video stream w=
hen disabled.
- [High] V4L2 controls silently fail to apply when CONFIG_PM is disabled.
- [Medium] Modifying V4L2 controls while the test pattern is active causes =
1-second stalls and false-positive timeout warnings.
--

commit 089f461b38f980bbf1bb0f31d1f94bb7bd1d0721
Author: Herman van Hazendonk <github.com@herrie.org>

media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver

This commit adds a V4L2 subdev driver for the Aptina MT9M113 1.3 Megapixel
SoC image sensor. It supports dual contexts (preview and capture), various
V4L2 controls, and test patterns. The driver also includes a workaround for
intermittent MCU wedges during stream start by using runtime-PM retries.

> diff --git a/drivers/media/i2c/mt9m113.c b/drivers/media/i2c/mt9m113.c
> new file mode 100644
> index 0000000000000..7a4a8a50822d3
> --- /dev/null
> +++ b/drivers/media/i2c/mt9m113.c
[ ... ]
> +static int mt9m113_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mt9m113 *sensor =3D container_of(ctrl->handler,
> +					       struct mt9m113, ifp.hdl);
> +	int ret =3D 0;
> +
> +	/*
> +	 * pm_runtime_get_if_in_use() returns >0 on success, 0 if not active,
> +	 * and -EINVAL if runtime PM is disabled.  Both 0 and -EINVAL mean we
> +	 * must not touch the hardware (and must not pair with a put), so the
> +	 * defensive comparison is "<=3D 0" rather than the naive "!ret".
> +	 */
> +	if (pm_runtime_get_if_in_use(&sensor->client->dev) <=3D 0)
> +		return 0;

[Severity: High]
Does this code silently ignore V4L2 control updates when CONFIG_PM is
disabled?

When CONFIG_PM is not enabled, pm_runtime_get_if_in_use() will return
-EINVAL. By treating -EINVAL the same as an inactive state (0), all hardware
control updates such as exposure, gain, saturation, and flip will be
skipped, while still returning success to userspace. Should the driver treat
-EINVAL as an active state to ensure controls are applied?

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_HFLIP: {
[ ... ]
> +		/* Only refresh if streaming - otherwise MCU may not be ready */
> +		if (!ret && sensor->streaming)
> +			mt9m113_refresh(sensor);
> +		break;

[Severity: Medium]
Will this result in 1-second stalls and false-positive timeout warnings if a
control is modified while the test pattern is active?

When the test pattern is active, the MCU is halted (BOOT_MODE =3D 1). If a
standard control like V4L2_CID_HFLIP is changed, mt9m113_s_ctrl() attempts
to call mt9m113_refresh(), which tries to send SEQ_CMD_REFRESH. Because the
MCU is halted, it cannot process the command, leading to two 500ms timeouts
in mt9m113_poll_mcu_var(). Should the driver check if the MCU is halted by
the test pattern before attempting a refresh?

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

[Severity: High]
Can disabling the test pattern permanently freeze the camera stream?

When userspace disables the test pattern while streaming, writing 0 to
MT9M113_MCU_BOOT_MODE releases the halt and reboots the MCU. However, the
driver does not appear to reapply the sensor configuration (such as the init
table, output dimensions, and AE) or issue SEQ_CMD_RUN afterward. Will the
stream remain frozen without these initialization steps?

> +		} else {
> +			/*
> +			 * Enable test pattern mode.
> +			 * Per datasheet: "Disabling the MCU is recommended
> +			 * before enabling test patterns."
[ ... ]
> +			sensor->test_pattern_active =3D true;
> +			dev_dbg(&sensor->client->dev,
> +				 "MT9M113: Enabling test pattern %d\n", ctrl->val);
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

[Severity: High]
Does the test pattern fail to activate if it is set before streaming starts?

If the test pattern is configured before streaming begins,
__v4l2_ctrl_handler_setup() (called from mt9m113_stream_on()) applies this
control while sensor->streaming is still false. This skips halting the MCU
with BOOT_MODE =3D 1. When mt9m113_stream_on() then starts the normal
sequencer, the test pattern settings will be overwritten by the normal
streaming configuration. How should the test pattern state be maintained
across stream starts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-submit-med=
ia-mt9m113-v3-0-dc3e07d5d70b@herrie.org?part=3D2

