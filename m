Return-Path: <linux-media+bounces-64021-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3f9oIGwXJGr12wEAu9opvQ
	(envelope-from <linux-media+bounces-64021-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 14:49:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAE664D854
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 14:49:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Vne32v4p;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64021-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64021-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D3BA301E57B
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 12:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468ED3AEF35;
	Sat,  6 Jun 2026 12:49:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FD0302146;
	Sat,  6 Jun 2026 12:49:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780750182; cv=none; b=D8mCoPt1+de1y23PfdxjrrtaQIOpgNYFA7ZXnuyVXEKSSwS9z8kc+ShEjdukuV6rvzovy7jNCqdjE+Y3Fj7RrC/il2WmoBXacgyzGRETSLNzUS8+2c8ZSqMcBIWhqUbjMmAcyYhx80HAkdxvPAR09LUPDI1tm0KSV2VKkxV65Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780750182; c=relaxed/simple;
	bh=foUKfqoAO7kDFDZSsoVcguR216/NdnQe4nvJ1gsjBAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eOgBlqtqOD1k6shP3FdAyrWJtVf+hrbQ79irRLuHAMAjTtNqSNesk3Cga1pkU49BUbT2JgFnCgq81Y+qHkr3pAlE9BIp21yfsWdrjZe1fIkSR5lXvYHalVc0e4inBgBhAN6AhvToBFaiW/luna73w3n+hp1ac5Au4tUn9Qnkpsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vne32v4p; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16601F00893;
	Sat,  6 Jun 2026 12:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780750181;
	bh=aTlF+ko3wojba2peysOGp9I8KU0Gm6rkjkzwtSkbt64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vne32v4pGuewrhu6pixG0rq41amXB0uJBbgmZxun113rs99WHHIkOgtIJqLy01UU9
	 ASpHGRyCK3A6mNqKrHpUNWVQPr9ZBXIFR2LroyPZBAjNQ0XF10OVBDXx7bAo0I1mHt
	 OxhZCXhXYS5zAwHCVJDJ3LH0HrsNhTUI3k+GPE9Z8s0I+IG0+0J6lrQEsjoPzSvcul
	 85Aewg01FiI3425kHYcJKif9AhWMzQ7r/PwI8KPf0o2/Tu7dDTOtuYX+p0g47GCBLk
	 Q8vAhsBv5uo2p/bDmiU+lmWoTfAx6UNY9nZNTLq7RzBOzA80KKqGOZ5S/XIM7g0aaQ
	 OcUtOld0tdZmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: add Aptina MT9M113 1.3 Mpx SoC
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk via B4 Relay" <devnull+github.com.herrie.org@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260606-submit-media-mt9m113-v5-2-2088c7358e11@herrie.org>
References: <20260606-submit-media-mt9m113-v5-2-2088c7358e11@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 12:49:40 +0000
Message-Id: <20260606124940.F16601F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,herrie.org:email,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url];
	TAGGED_FROM(0.00)[bounces-64021-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+github.com.herrie.org@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CAE664D854

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Use-after-free of the `sensor` structure in `mt9m113_remove()`.
- [High] Use-after-free of the `link_frequencies` array via the V4L2 contro=
l handler.
- [High] Use-after-free of `devm`-managed resources (e.g., `regmap`) in `mt=
9m113_s_ctrl()`.
- [High] Runtime PM state desynchronization leading to clock and regulator =
underflows in `mt9m113_start_streaming()`.
- [Medium] Memory leak of the dynamically allocated `sensor` structure on e=
arly probe error paths.
- [Medium] V4L2 API compliance violation: incorrectly rejecting `V4L2_SUBDE=
V_FORMAT_TRY` queries while streaming.
--

commit fc8d6a3b86a58b31fdfee3e786e86929c5b8b724
Author: Herman van Hazendonk <github.com@herrie.org>
Subject: media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver

Adds a V4L2 subdev driver for the Aptina MT9M113 1.3 Megapixel SoC image=20
sensor with on-chip ISP, supporting Context A and B operation modes.

> diff --git a/drivers/media/i2c/mt9m113.c b/drivers/media/i2c/mt9m113.c
> --- /dev/null
> +++ b/drivers/media/i2c/mt9m113.c
[ ... ]
> +static int mt9m113_start_streaming(struct mt9m113 *sensor,
> +				   struct v4l2_subdev_state *state)
> +{
> +	struct device *dev =3D &sensor->client->dev;
[ ... ]
> +		ret =3D mt9m113_sensor_init(sensor);
> +		if (ret) {
> +			mt9m113_power_off(sensor);
> +			break;
> +		}
> +	}
> +
> +	/*
> +	 * Every break above leaves the chip powered off (the final attempt
> +	 * branch, the power_on failure branch and the sensor_init failure
> +	 * branch each call mt9m113_power_off before breaking). Just sync the
> +	 * PM core to SUSPENDED so a later resume re-invokes power_on, and
> +	 * drop the reference taken at the top of this function.
> +	 */
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_put_noidle(dev);
> +	return ret;
> +}

[Severity: High]
Does this cause a runtime PM state desynchronization?

Calling pm_runtime_set_suspended() here while runtime PM is still enabled=20
fails silently with -EAGAIN, leaving the PM core in the RPM_ACTIVE state.=20
Later, when the usage counter drops to zero and auto-suspend fires,=20
mt9m113_runtime_suspend() will execute and call mt9m113_power_off() a=20
second time.

Could this mismatched disable lead to clk_disable_unprepare() and=20
regulator_bulk_disable() underflow warnings?

[ ... ]
> +static int mt9m113_ifp_set_fmt(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_format *fmt)
> +{
> +	struct mt9m113 *sensor =3D ifp_to_mt9m113(sd);
[ ... ]
> +	/*
> +	 * Reject geometry/format changes while the pipeline is live.
> +	 * The sensor is only programmed in mt9m113_stream_on(); silently
> +	 * updating the active state would let userspace see one format while
> +	 * the wire still carries the previous one.
> +	 */
> +	if (sensor->streaming)
> +		return -EBUSY;

[Severity: Medium]
Is it intentional to reject V4L2_SUBDEV_FORMAT_TRY queries while streaming?

This check blocks all format changes when sensor->streaming is true, but=20
V4L2_SUBDEV_FORMAT_TRY is used by userspace to safely test formatting=20
parameters without affecting the active hardware pipeline.=20

Could this check be narrowed to allow TRY requests during streaming?

[ ... ]
> +static int mt9m113_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mt9m113 *sensor =3D container_of(ctrl->handler,
> +					       struct mt9m113, ifp.hdl);
> +	int pm_ret, ret =3D 0;
> +
> +	/*
> +	 * pm_runtime_get_if_in_use() returns >0 on success (HW active, kref
> +	 * incremented), 0 if the device is suspended, and -EINVAL when
> +	 * CONFIG_PM is disabled. Treat -EINVAL as "PM core is absent, HW is
> +	 * always on" and proceed without taking a kref (the matching put at
> +	 * the tail must then be skipped). Only 0 means "skip silently".
> +	 */
> +	pm_ret =3D pm_runtime_get_if_in_use(&sensor->client->dev);
> +	if (pm_ret =3D=3D 0)
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_HFLIP: {
> +		u64 mode_a, mode_b;
> +
> +		ret =3D mt9m113_read_mcu_var(sensor, MT9M113_SENSOR_READ_MODE_A,
> +					   &mode_a);

[Severity: High]
Can this lead to a use-after-free of devm-managed resources?

If a user-space application holds the subdevice file descriptor open and=20
calls VIDIOC_S_CTRL after unbind, mt9m113_s_ctrl() will execute. Because=20
pm_runtime_disable() was called in remove(), pm_runtime_get_if_in_use()=20
will return -EINVAL.

Since the check is exactly pm_ret =3D=3D 0, the negative error code allows =
the=20
code to proceed and access sensor->regmap to write hardware registers. At=20
this point, the devm-managed regmap has already been freed by the driver=20
core.

[ ... ]
> +static int mt9m113_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct mt9m113 *sensor;
> +	int ret;
> +
> +	sensor =3D kzalloc(sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
> +		return -ENOMEM;
> +
> +	sensor->client =3D client;
> +	/*
> +	 * Initialise to 2 so kfree(sensor) only runs after both the PA and IFP
> +	 * release callbacks have fired (i.e. all open /dev/v4l-subdev* fds have
> +	 * been closed). See mt9m113_pa_release() for the full rationale.
> +	 */
> +	atomic_set(&sensor->release_count, 2);
> +
> +	sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(sensor->regmap))
> +		return PTR_ERR(sensor->regmap);
> +
> +	ret =3D mt9m113_parse_dt(sensor);
> +	if (ret < 0)
> +		return ret;

[Severity: Medium]
Does this leak the dynamically allocated sensor structure?

The sensor struct is allocated with kzalloc() to tie its lifetime to the=20
V4L2 subdevice character devices. However, if early probe operations like=20
devm_cci_regmap_init_i2c() or mt9m113_parse_dt() fail, the driver returns=20
directly.=20

Could these error paths be updated to ensure kfree(sensor) is called?

[ ... ]
> +	v4l2_ctrl_handler_init(&sensor->pa.hdl, 2);
> +	{
> +		struct v4l2_ctrl *link_freq_ctrl;
> +
> +		link_freq_ctrl =3D v4l2_ctrl_new_int_menu(&sensor->pa.hdl, NULL,
> +				V4L2_CID_LINK_FREQ,
> +				sensor->bus_cfg.nr_of_link_frequencies - 1, 0,
> +				sensor->bus_cfg.link_frequencies);
[ ... ]
> +static void mt9m113_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mt9m113 *sensor =3D ifp_to_mt9m113(sd);
> +	struct device *dev =3D &client->dev;
[ ... ]
> +	v4l2_async_unregister_subdev(&sensor->ifp.sd);
> +
> +	v4l2_fwnode_endpoint_free(&sensor->bus_cfg);
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	if (!pm_runtime_status_suspended(dev))
> +		mt9m113_power_off(sensor);
> +	pm_runtime_set_suspended(dev);
> +}

[Severity: High]
Can this cause a use-after-free of the sensor structure?

v4l2_async_unregister_subdev() detaches the subdevices, which results in=20
the synchronous invocation of their release callbacks if no file=20
descriptors are currently open. The driver's release callbacks decrement=20
release_count and free the sensor struct.=20

When v4l2_async_unregister_subdev() returns, the driver continues to=20
access sensor->bus_cfg and passes the freed sensor pointer to=20
mt9m113_power_off(), leading to a direct use-after-free.

[Severity: High]
Could v4l2_fwnode_endpoint_free() here also cause a use-after-free of the=20
link_frequencies array via the V4L2 control handler?

During probe, the driver passes sensor->bus_cfg.link_frequencies to=20
v4l2_ctrl_new_int_menu(), which stores the array pointer directly in=20
ctrl->qmenu_int.=20

In mt9m113_remove(), v4l2_fwnode_endpoint_free() frees the=20
link_frequencies array. However, the V4L2 control handler's lifetime is=20
tied to the subdevice file descriptor. If a user-space process holds the=20
file descriptor open after the device is unbound, a subsequent=20
VIDIOC_QUERYMENU ioctl will read from the freed qmenu_int pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-submit-med=
ia-mt9m113-v5-0-2088c7358e11@herrie.org?part=3D2

