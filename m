Return-Path: <linux-media+bounces-63942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dInKIhrwImrlfQEAu9opvQ
	(envelope-from <linux-media+bounces-63942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:49:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AE364978F
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:49:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fiJts0aO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63942-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63942-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A93C63087D2D
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 15:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738F139C63D;
	Fri,  5 Jun 2026 15:37:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F652FF17A;
	Fri,  5 Jun 2026 15:37:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673849; cv=none; b=BdL+uwNxr2m4zfbCLX+AoFDAs9bPh5fCum3e8XzOGohycS6yER4oRF4aJinl4xAgUNT49g9wgiD629bV4bnjncstCIxseb7iaOR69WoS9UGLfsU7Ez5eV63MFq+9ieiIQEwP/YxR0f7OrMt5VRF+df7wHgX5qwDjQ2n7Xh09GnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673849; c=relaxed/simple;
	bh=Ia3OmfQkRg229yhgyXh0R1VI2VXlBYz1hzswS/rxZHE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sN5joUKAcren7lx5rOfjhTQ1jBTgGl1TQH5LsweCBDpJG4p7tM3eN7Ye4Los5WuN2Z7COhikGx2N8n9BZJFABSIJAgM8xKRHpkQnDdqx+g259P54DVPu6y3nam9SyY2JoVcYhoHm4nAmIKiI/VeG41/G6iXp8yEZR/SWOn3nGU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiJts0aO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD4B1F00893;
	Fri,  5 Jun 2026 15:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780673848;
	bh=4Cbi9og2jszaDLJIh83+7TVoXinJPiUS+nFYSzC5rQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fiJts0aOPpH/z5HAxuoSfX/vAQBa8GTDYPovAIJJUH3YACsmDJhiJv5uu/wOJrYvW
	 vLfWUbwS62M//PugDzQFxXFwSQ9J+pILz45fEhm5/wfcqFT+NBWLpXoDkEyxFCIRJx
	 PfSygkQd3cENdC9DXD0szO2UdnKGTAL2dZcCUTH7E6v6LlMSi2AHnIDYpvaPE4abim
	 Hc3rrwSvax16+Kymr1TWR4FWc8MMIq1Idb0Bq+WowXkNXHNDu8WNl2/PPwLGrOaewS
	 YY4GfGw8BF2H/jsfsqBVnDmARTcR9wd1a7MlliOkvWuLupQLdksCJVUSSzWcCwA3yj
	 T21RBOKzdyw3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: imx678: Add driver for Sony IMX678
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605-imx678-v4-2-58e57c67143d@ideasonboard.com>
References: <20260605-imx678-v4-2-58e57c67143d@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 15:37:27 +0000
Message-Id: <20260605153728.3BD4B1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,ideasonboard.com:email,lists.linux.dev:replyto];
	TAGGED_FROM(0.00)[bounces-63942-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:linux-media@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2AE364978F

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The sensor is inadvertently left in STREAMING mode after reading t=
he module ID during driver probe.
- [High] Bitwise OR is incorrectly used to accumulate negative error codes,=
 corrupting the returned errno.
- [High] Use-After-Free or NULL pointer dereference of `sd->active_state` d=
ue to incorrect cleanup ordering in `imx678_remove()`.
- [Medium] Possible incorrect power-on sequence: clock is enabled after rel=
easing reset.
--

commit 1ad323ded3946b2792a6c7a76f8ee5e9e8fb96df
Author: Jai Luthra <jai.luthra@ideasonboard.com>

media: i2c: imx678: Add driver for Sony IMX678

This commit adds a V4L2 subdev driver for the Sony IMX678 image sensor. It
provides support for MIPI RAW12 output, framerate control, flip, analog
gain, exposure control, and test patterns.

> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> new file mode 100644
> index 0000000000000..a5bdf15c503ef
> --- /dev/null
> +++ b/drivers/media/i2c/imx678.c
[ ... ]
> +static int imx678_set_framing_limits(struct imx678 *imx678,
> +				     const struct v4l2_mbus_framefmt *format)
> +{
[ ... ]
> +	ret =3D __v4l2_ctrl_modify_range(imx678->hblank, hblank, max_hblank,
> +				       IMX678_PIX_PER_CLK, hblank);
> +	ret |=3D __v4l2_ctrl_s_ctrl(imx678->hblank, hblank);
> +
> +	vblank =3D imx678->vmax - format->height;
> +	ret |=3D __v4l2_ctrl_modify_range(imx678->vblank, vblank,
> +					IMX678_VMAX_MAX - format->height, 2,
> +					vblank);
> +	ret |=3D __v4l2_ctrl_s_ctrl(imx678->vblank,
> +				  IMX678_VMAX_DEFAULT - format->height);
> +
> +	ret |=3D __v4l2_ctrl_modify_range(imx678->exposure, IMX678_EXPOSURE_MIN,
> +					imx678->vmax - IMX678_SHR_MIN, 1,
> +					IMX678_EXPOSURE_DEFAULT);

[Severity: High]
Does this code incorrectly accumulate negative error codes using a bitwise =
OR?

Since V4L2 control functions return standard errnos like -EINVAL, using
bitwise OR corrupts the returned errno. This could cause VIDIOC_S_FMT to
return nonsensical error codes to userspace instead of the intended errno.

[ ... ]
> +static int imx678_power_on(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct imx678 *imx678 =3D to_imx678(sd);
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(imx678_supply_name),
> +				    imx678->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable regulators\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	fsleep(1); /* Tlow > 500ns */
> +
> +	gpiod_set_value_cansleep(imx678->reset_gpio, 0);
> +
> +	fsleep(1); /* T3 > 1us */
> +
> +	ret =3D clk_prepare_enable(imx678->xclk);

[Severity: Medium]
Is this power-on sequence enabling the clock after releasing the reset?

Standard initialization for IMX sensors generally requires the external clo=
ck
to be stable before de-asserting the reset line. Could releasing reset
without an active clock place the sensor into an undefined state?

[ ... ]
> +static int imx678_identify_model(struct imx678 *imx678)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> +	const struct imx678_model_info *info;
> +	enum imx678_type detected;
> +	int ret =3D 0;
> +	u64 val =3D 0;
> +
> +	info =3D device_get_match_data(&client->dev);
> +
> +	/*
> +	 * This sensor's ID registers become accessible 80ms after coming out
> +	 * of STANDBY mode.
> +	 */
> +	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, 0, &ret);
> +	fsleep(IMX678_MODULE_ID_DELAY);
> +
> +	cci_read(imx678->cci, IMX678_REG_MODULE_ID, &val, &ret);

[Severity: High]
Does this leave the sensor inadvertently in STREAMING mode after reading
the module ID?

The code writes 0 (IMX678_MODE_STREAMING) to wake the sensor, but does
not restore IMX678_MODE_STANDBY before returning. If PM runtime is
disabled, the sensor might stream unconditionally over the MIPI bus after
probe.

[ ... ]
> +static void imx678_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct imx678 *imx678 =3D to_imx678(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(imx678->sd.ctrl_handler);

[Severity: High]
Could this cleanup ordering lead to a use-after-free or NULL pointer
dereference?

Calling v4l2_subdev_cleanup() destroys sd->active_state without acquiring
the control handler lock. Since v4l2_ctrl_handler_free() is called after,
V4L2 controls remain accessible.=20

If a concurrent VIDIOC_S_CTRL ioctl invokes imx678_set_ctrl(), it might fet=
ch
the freed or NULL active_state and dereference it in
v4l2_subdev_state_get_format().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-imx678-v4-=
0-58e57c67143d@ideasonboard.com?part=3D2

