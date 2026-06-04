Return-Path: <linux-media+bounces-63823-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iInbIVKQIWrkIwEAu9opvQ
	(envelope-from <linux-media+bounces-63823-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:48:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 241466410B7
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:48:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dLzuqPmm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63823-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63823-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB70E30DF406
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 14:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A09C480953;
	Thu,  4 Jun 2026 14:40:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4303E0083;
	Thu,  4 Jun 2026 14:40:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584010; cv=none; b=EnwWzPpoX2xfADQYysAPiLuT0pLRPo7SLqIZzZB56gjSJsU6AbiTZbs7ffOrLZz3/EswZ3yzETgNOu9PbD6kS8pDwWf+9hhfaESr1ktvwFnm1x0syFiN6vwr//CEoNqTdSN8wRWWhnfJEVK4Ca/khjfqRFtG+WW5dDjFs1icibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584010; c=relaxed/simple;
	bh=+o7Aw44wN+yPG8vjSPSShJh5bPl92tSZ91C8n7QuH+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mjf0WjdqnSLnTy+aTusonlV4Xcg8hokaCd+XvtYlaSzod2wGy59gN2Zha39MxLTBQoN+RymvBYlP/UZasKI4Q10SQwF/kWKbNWVpKP71tePcn1tNflWIgX0+aC/M/d9aVs0Wfvp9iR6/xltncv4Ied77GSXHpXbFgDIC/GO9R/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLzuqPmm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4219B1F00898;
	Thu,  4 Jun 2026 14:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780584008;
	bh=8hOnLnfbm81DrOnjK1RrFIJfMgQ6Qfa3N8h/N+q+D1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dLzuqPmmfF4Lp2zZ9VozOUZTORxHeL+zXHsO2z9oqwwKFr45oHptv0sL+oBHo7ygt
	 2hT9v3IFmu0RpxER0b+7y6okmQQGOvV2wsksEbKtgi0Ji6bkYjTU+ePOvuzr9zsabm
	 gE+p+5zxld5/HK+F7wR1qtUrEfhMlNMoMO4w3rMuZ8i55PP3JnPVuovODbEbp9/9WM
	 WI63aTidsJqgvj3d7T/sUMZC1DHRwd4Cw7xkURN73whEk2FuN6OJK1WTGPu6YqHkHL
	 8g1bgn42KXPezc7MotidJikvI7q3mNamkPh+BOFI34AH4xDPyrYdulS9MPSrUiDTMh
	 08b8uE7J6CzsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 15/22] media: i2c: add Maxim GMSL2/3 deserializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260604-gmsl2-3_serdes-v13-15-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-15-9d8a4919983b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:40:07 +0000
Message-Id: <20260604144008.4219B1F00898@smtp.kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[entry.stream:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid,csi2.vc:url];
	TAGGED_FROM(0.00)[bounces-63823-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+dumitru.ceclan.analog.com@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media,dumitru.ceclan.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 241466410B7

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] Missing bounds check in `max_des_get_frame_desc_state` allows =
a stack buffer overflow when writing to `fd->entry`.
- [High] Fwnode endpoint reference leaks on probe error paths.
- [High] Asynchronous I2C client binding notifier incorrectly assumes the f=
irst bound client is the serializer, blocking other I2C devices.
- [High] Hardware pipes 4-7 will never be used due to a flawed 1:1 lookup m=
apping in `max_des_find_link_pipe`.
- [High] Bypassing I2C mux/ATR locking in `max_des_init_link_ser_xlate` lea=
ds to I2C bus corruption.
- [High] Unprotected access to `pipe->remaps` and `pipe->vc_remaps` during =
the `VIDIOC_LOG_STATUS` ioctl.
- [High] TOCTOU race on `hw.source->sd` allows dereferencing a NULL or free=
d subdev pointer during stream updates.
- [High] Invalid validation check of physical data lane indices against the=
 active lane count in `max_des_parse_src_dt_endpoint`.
- [Medium] `max_des_set_fmt` rejects format changes for unrouted streams, v=
iolating the V4L2 subdev API contract.
- [Medium] Returning `-EINVAL` on unsupported formats and intervals violate=
s the V4L2 specification.
- [Medium] Use of `devm_kcalloc` and `devm_kfree` in hotpaths causes severe=
 devres list traversal overhead.
- [Medium] The `V4L2_CID_TEST_PATTERN` control does not immediately apply t=
o the hardware, and stream restarts ignore the change.
- [Medium] Returning early on `regulator_disable` failure in `max_des_updat=
e_pocs` aborts cleanup for remaining POC supplies.
--

commit 10b6032537ce5fb1d90f4cb0131ac25ff19cabea
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: add Maxim GMSL2/3 deserializer framework

This commit introduces a common framework for Maxim GMSL2/3 deserializers. =
It
adds support for the Streams API, I2C ATR, automatic GMSL link version
negotiation, stream ID selection, VC remapping, and multiple other hardware
features across all supported chips.

> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c=
/maxim-serdes/max_des.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_des.c
[ ... ]
> +static struct max_des_pipe *
> +max_des_find_link_pipe(struct max_des *des, struct max_des_link *link)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < des->info->num_pipes; i++) {
> +		struct max_des_pipe *pipe =3D &des->pipes[i];
> +
> +		if (pipe->link_id =3D=3D link->index)
> +			return pipe;
> +	}
> +
> +	return NULL;
> +}

[Severity: High]
Does this force a 1:1 mapping between links and pipes? Since the assignment
uses a modulo operation elsewhere to map multiple pipes to a single link,
returning on the first match appears to prevent pipes 4-7 from ever being
selected. Can this break demultiplexing for multiple streams on the same li=
nk?

[ ... ]
> +static int max_des_set_modes(struct max_des_priv *priv,
> +			     struct max_des_mode_context *context)
> +{
[ ... ]
> +	for (i =3D 0; i < des->info->num_links; i++) {
> +		struct max_des_link_hw hw;
> +		u32 pipe_double_bpps =3D 0;
[ ... ]
> +		if (!hw.source->sd)
> +			continue;
> +
> +		pipe_double_bpps =3D context->pipes_double_bpps[hw.pipe->index];
> +
> +		ret =3D max_ser_set_double_bpps(hw.source->sd, pipe_double_bpps);

[Severity: High]
Does this access contain a time-of-check to time-of-use race?

The subdev pointer is checked for NULL, but the async notifier unbind
callback can clear this pointer concurrently without holding the state lock.

Could the pointer become NULL just before it is used?

[ ... ]
> +static int max_des_update_pipe_remaps(struct max_des_priv *priv,
> +				      struct max_des_remap_context *context,
> +				      struct max_des_pipe *pipe,
> +				      struct v4l2_subdev_state *state,
> +				      u64 *streams_masks)
> +{
[ ... ]
> +	remaps =3D devm_kcalloc(priv->dev, des->info->num_remaps_per_pipe,
> +			      sizeof(*remaps), GFP_KERNEL);
> +	if (!remaps)
> +		return -ENOMEM;
[ ... ]
> +	if (pipe->remaps)
> +		devm_kfree(priv->dev, pipe->remaps);
> +
> +	pipe->remaps =3D remaps;
> +	pipe->num_remaps =3D num_remaps;

[Severity: Medium]
Is it safe to use device-managed allocations in this hotpath?

Allocating and freeing memory via the devres API during stream state changes
forces a traversal of the device resource list every time. Could this cause
severe overhead and lock contention?

[ ... ]
> +static int max_des_init_link_ser_xlate(struct max_des_priv *priv,
> +				       struct max_des_link *link,
> +				       struct i2c_adapter *adapter,
> +				       u8 power_up_addr, u8 new_addr)
> +{
[ ... ]
> +	ret =3D des->ops->select_links(des, BIT(link->index));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_ser_wait_for_multiple(adapter, addrs, ARRAY_SIZE(addrs),
> +					&current_addr);

[Severity: High]
Can this sequence cause I2C bus corruption?

The code modifies the hardware mux state directly via select_links and
performs transfers on the parent adapter without acquiring the I2C mux core
lock.

If another thread initiates a transfer on an already-bound child adapter
concurrently, could its traffic be routed to the wrong hardware link?

[ ... ]
> +static int max_des_ser_attach_addr(struct max_des_priv *priv, u32 chan_i=
d,
> +				   u16 addr, u16 alias)
> +{
[ ... ]
> +	if (link->ser_xlate.en) {
> +		dev_err(priv->dev, "Serializer for link %u already bound\n",
> +			link->index);
> +		return -EINVAL;
> +	}

[Severity: High]
Does this logic unintentionally block other I2C devices from binding?

Once the serializer binds, this returns an error for any subsequent device
like a camera sensor on the same link. Could this prevent the ATR core from
successfully allocating aliases for those devices?

[ ... ]
> +static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					struct v4l2_mbus_frame_desc *fd,
> +					unsigned int pad)
> +{
[ ... ]
> +		hw.entry.bus.csi2.vc =3D dst_vc_id;
> +		hw.entry.stream =3D route->source_stream;
> +
> +		fd->entry[fd->num_entries++] =3D hw.entry;
> +	}

[Severity: Critical]
Is there a bounds check missing for the array access here?

The entry array has a fixed capacity, but userspace can configure a large
number of routes. If more active streams map to the same source pad than the
array can hold, could this write out of bounds on the stack?

[ ... ]
> +static int max_des_set_tpg_fmt(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_format *format)
> +{
[ ... ]
> +	entry =3D max_des_find_tpg_entry(des, 0, fmt->width, fmt->height,
> +				       fmt->code, 0, 0);
> +	if (!entry)
> +		return -EINVAL;

[Severity: Medium]
Does returning an error for unsupported formats violate the V4L2 API
contract? The specification mandates that unsupported requested formats
should be adjusted to the closest valid match rather than rejected.

[ ... ]
> +static int max_des_set_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state,
> +			   struct v4l2_subdev_format *format)
> +{
[ ... ]
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;

[Severity: Medium]
Does returning an error for unrouted streams violate the V4L2 API contract?

The specification mandates that format configuration should succeed
independently of the routing table.

[ ... ]
> +static int max_des_set_frame_interval(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state,
> +				      struct v4l2_subdev_frame_interval *fi)
> +{
[ ... ]
> +	entry =3D max_des_find_tpg_entry(des, 0, fmt->width, fmt->height,
> +				       fmt->code, fi->interval.denominator,
> +				       fi->interval.numerator);
> +	if (!entry)
> +		return -EINVAL;

[Severity: Medium]
Similar to the format configuration, does returning an error for unsupported
intervals violate the V4L2 API contract? The specification mandates that
drivers adjust unsupported intervals instead of rejecting them.

[ ... ]
> +static int max_des_log_status(struct v4l2_subdev *sd)
> +{
[ ... ]
> +		if (des->ops->set_pipe_remap) {
> +			v4l2_info(sd, "\tremaps: %u\n", pipe->num_remaps);
> +			for (j =3D 0; j < pipe->num_remaps; j++) {
> +				struct max_des_remap *remap =3D &pipe->remaps[j];

[Severity: High]
Can this loop dereference freed memory?

The log status callback executes without holding the subdev state lock. If
another thread concurrently triggers a stream update, it might free and
replace the remaps array while it is being read here.

[ ... ]
> +static int max_des_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct max_des_priv *priv =3D ctrl_to_priv(ctrl->handler);
> +	struct max_des *des =3D priv->des;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		des->tpg_pattern =3D ctrl->val;
> +		return 0;
> +	}

[Severity: Medium]
Does this control handler fail to apply the test pattern to the hardware?
It updates the software state but does not seem to invoke the hardware
callback.

[ ... ]
> +static int max_des_update_tpg(struct max_des_priv *priv,
> +			      struct v4l2_subdev_state *state,
> +			      u64 *streams_masks)
> +{
[ ... ]
> +	if (entry =3D=3D des->tpg_entry)
> +		return 0;
> +
> +	ret =3D des->ops->set_tpg(des, entry);

[Severity: Medium]
Does this stream restart optimization ignore pending test pattern changes?

Because the code returns early if the format has not changed, it appears a =
new
test pattern selected via userspace will not be applied to the hardware unt=
il
the resolution is also modified.

[ ... ]
> +static int max_des_update_pocs(struct max_des_priv *priv, bool enable)
> +{
[ ... ]
> +		if (enable)
> +			ret =3D regulator_enable(priv->pocs[i]);
> +		else
> +			ret =3D regulator_disable(priv->pocs[i]);
> +
> +		if (ret) {
> +			dev_err(priv->dev,
> +				"Failed to set POC supply to %u: %u\n",
> +				enable, ret);
> +			if (!enable)
> +				return ret;

[Severity: Medium]
Is it safe to return early when disabling regulators?

If one regulator fails to disable during driver unbind or system suspend,
this breaks out of the loop and leaves all subsequent regulators perpetually
powered on.

[ ... ]
> +static int max_des_parse_src_dt_endpoint(struct max_des_priv *priv,
> +					 struct max_des_phy *phy,
> +					 struct fwnode_handle *fwnode)
> +{
[ ... ]
> +	for (i =3D 0; i < mipi->num_data_lanes; i++) {
> +		if (mipi->data_lanes[i] > mipi->num_data_lanes) {
> +			dev_err(priv->dev, "Invalid data lane %u on port %u\n",
> +				mipi->data_lanes[i], pad);
> +			return -EINVAL;
> +		}
> +	}

[Severity: High]
Is this validation comparing the physical lane index against the active lane
count?

The array holds physical pin numbers, while the active count dictates the
number of used lanes. If a board routes higher numbered pins but uses fewer
total lanes, this check seems to erroneously reject valid physical
configurations.

[ ... ]
> +static int max_des_parse_dt(struct max_des_priv *priv)
> +{
[ ... ]
> +	for (i =3D 0; i < des->info->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +		struct max_serdes_source *source;
> +
> +		source =3D max_des_get_link_source(priv, link);
> +		source->index =3D i;
> +
> +		ret =3D max_des_parse_sink_dt_endpoint(priv, link, source, fwnode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Do the error paths in probe leak the fwnode endpoint references?

When the parse sink endpoint function acquires a reference, it seems the
cleanup only happens on successful driver teardown. If initialization fails
in this loop or later in probe, the acquired references are not released.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-gmsl2-3_se=
rdes-v13-0-9d8a4919983b@analog.com?part=3D15

