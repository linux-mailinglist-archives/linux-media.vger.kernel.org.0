Return-Path: <linux-media+bounces-63820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2AbjI7CPIWqzIwEAu9opvQ
	(envelope-from <linux-media+bounces-63820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:46:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 27245641034
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:46:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ozq0NrQd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63820-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63820-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F10E9301179E
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 14:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254E63988F9;
	Thu,  4 Jun 2026 14:33:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2068B156F45;
	Thu,  4 Jun 2026 14:33:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583635; cv=none; b=EO1KTtSnCIDmhoQEiribO7pH0Fq8xBXDnlc7lFqv1AvP8/5woaTVmeQbgNHMEHOVDf0zeXTnsyrkaXN3gJBGE2oEvjHmFjNLfsc/3Oi+Zjy5qrV0GCyvWA9JsM11lOIKK8SfgmmnUwitogyM9mXoHtWHGMwrRpB/NxFrVTO50Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583635; c=relaxed/simple;
	bh=yIZ3GhdP8/NJuK5SmlMqHq7Xk/QBSNHeEtohq0fbCZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ow7jVti0o1+qySxxsAtNT3SndGRQhpihYKN4nHhXACSqfg18TuTQcP/rOsIcrcWxFTw41BSlz3FKMxr4JP9oYEpCGzZpT2QtYk6h36/iNwuYqZ2nggWtpVR9qfgkTaMPB0W40jzTO1QCHfUQnef0MwvDG05gR7l0IxTmSKQQqM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozq0NrQd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1021F00898;
	Thu,  4 Jun 2026 14:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780583633;
	bh=MTi6dYHV1xRYkYqHS8d3nLjqRKAmztFynVjYGFs/uHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ozq0NrQd4rkBWp+J/o/PAZGy0Ny8FMMlB3shDp1pO9q+w6+iP6EnOkXYCw7Su0Nro
	 9LZ/3t/iHqwQb4/Iz/7fHsTgrsmR8kL3zxpTmwkTBsd6I1QP7xmj3w5w9dCGlZi1d1
	 hQVv+yVIVm3N1WtiR04zoUo7N3gXAsToqR0inWa8tiPsxlmbUa3T3MhJyVxr1x5518
	 mAE54wr0Pxsj5dnw2JHdpqs5YuvqnsCoQgN65bvFmQCJ8ofLGxqSwd5RtoHrusx/aZ
	 v9OGC0R365aeX5BDdMdv7aJ7glDZxP20emFJu1P2Zmi+HB0eUaQ8GHiokMXFjXUe4/
	 maMjxbIfBvT0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 14/22] media: i2c: add Maxim GMSL2/3 serializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: conor+dt@kernel.org, linux-media@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-gmsl2-3_serdes-v13-14-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-14-9d8a4919983b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:33:53 +0000
Message-Id: <20260604143353.7F1021F00898@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,lists.linux.dev:replyto,vger.kernel.org:from_smtp,entry.stream:url];
	TAGGED_FROM(0.00)[bounces-63820-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+dumitru.ceclan.analog.com@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media,dumitru.ceclan.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27245641034

Thank you for your contribution! Sashiko AI review found 16 potential issue=
(s) to consider:
- [Critical] Kernel stack buffer overflow when processing routing tables wi=
th many active routes.
- [High] Incorrect V4L2 initialization and cleanup ordering causing potenti=
al NULL pointer dereferences and use-after-free risks.
- [High] Fwnode handle reference leak in `max_ser_i2c_adapter_deinit()`.
- [High] Fwnode handle reference leak for remote endpoints in `max_ser_pars=
e_sink_dt_endpoint()`.
- [High] Abuse of devres (`devm_*`) allocations in runtime stream control p=
aths.
- [High] `max_ser_wait_for_multiple` returns 0 (success) even when it times=
 out waiting for the device.
- [High] Numerator and denominator arguments are incorrectly swapped when s=
earching for TPG entries.
- [High] ENUM_FRAME_INTERVAL uses an uninitialized output field as a search=
 filter.
- [High] Incorrect active state tracking allows format and routing changes =
while streaming.
- [High] Mutex leak on error path in `max_ser_log_status`.
- [High] Silent failure on partial I2C transfers allows consumption of unin=
itialized data.
- [High] The I2C read transaction maps the exact same stack buffer concurre=
ntly for both `DMA_TO_DEVICE` and `DMA_FROM_DEVICE`.
- [High] The pipeline BPP configuration is zeroed out if all active streams=
 share the same BPP.
- [Medium] TPG pattern V4L2 control (`V4L2_CID_TEST_PATTERN`) changes are i=
gnored during and across streaming.
- [Medium] `set_fmt` and `set_frame_interval` incorrectly return `-EINVAL` =
for unsupported configurations.
- [Medium] Data race between the I2C ATR framework and the V4L2 `VIDIOC_LOG=
_STATUS` ioctl on the `ser->i2c_xlates` array.
--

commit 4003fdce86d0155a6beac0ddb8c7f998849fff75
Author: Cosmin Tanislav <demonsingur@gmail.com>
Subject: media: i2c: add Maxim GMSL2/3 serializer framework

Adds a common framework for Maxim GMSL2/3 serializers supporting full
Streams API, ATR, automatic GMSL link version negotiation, automatic
VC remapping, and other features.

> diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c=
/maxim-serdes/max_ser.c
> new file mode 100644
> index 0000000000000..a193381435e63
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_ser.c
[ ... ]
> +static void max_ser_i2c_adapter_deinit(struct max_ser_priv *priv)
> +{
> +	if (device_get_named_child_node(priv->dev, "i2c-gate"))
> +		max_ser_i2c_mux_deinit(priv);

[Severity: High]
Does this code leak the fwnode handle?

device_get_named_child_node() increments the reference count of the returned
handle. If it returns a valid fwnode, the code immediately calls
max_ser_i2c_mux_deinit() but discards the handle without calling
fwnode_handle_put().

> +	else
> +		max_ser_i2c_atr_deinit(priv);
> +}
> +
> +static int max_ser_set_tpg_fmt(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_format *format)
> +{
[ ... ]
> +	entry =3D max_ser_find_tpg_entry(ser, 0, fmt->width, fmt->height,
> +				       fmt->code, 0, 0);
> +	if (!entry)
> +		return -EINVAL;

[Severity: Medium]
Should this function adjust the requested format to the closest supported
configuration rather than returning an error?

The V4L2 API specifies that format and interval configuration ioctls must
adjust unsupported values to supported ones instead of returning an error
when no exact match is found.

> +
> +	in =3D v4l2_subdev_state_get_interval(state, format->pad, format->strea=
m);
> +	if (!in)
> +		return -EINVAL;
[ ... ]
> +static int max_ser_log_status(struct v4l2_subdev *sd)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_subdev_state *state;
> +	unsigned int i, j;
> +	int ret;
> +
> +	state =3D v4l2_subdev_lock_and_get_active_state(&priv->sd);
> +
> +	v4l2_info(sd, "mode: %s\n", max_serdes_gmsl_mode_str(ser->mode));
[ ... ]
> +	if (ser->ops->log_status) {
> +		ret =3D ser->ops->log_status(ser);
> +		if (ret)
> +			return ret;

[Severity: High]
Can this lead to a mutex leak?

When the log_status operation returns an error code, the function returns
immediately. This bypasses the v4l2_subdev_unlock_state(state) call located
at the out_unlock label, leaving the V4L2 subdevice active state lock
perpetually held.

> +	}
> +	v4l2_info(sd, "i2c_xlates:\n");
> +	for (i =3D 0; i < ser->ops->num_i2c_xlates; i++) {

[Severity: Medium]
Is there a potential data race here?

This loop iterates over the i2c_xlates array holding only the V4L2
active state lock. Meanwhile, the I2C ATR framework can modify this same ar=
ray
under the I2C ATR lock, potentially causing torn reads during a
VIDIOC_LOG_STATUS ioctl.

> +		v4l2_info(sd, "\ten: %u, src: 0x%02x dst: 0x%02x\n",
> +			  ser->i2c_xlates[i].en, ser->i2c_xlates[i].src,
> +			  ser->i2c_xlates[i].dst);
> +		if (!ser->i2c_xlates[i].en)
> +			break;
> +	}
[ ... ]
> +static int max_ser_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct max_ser_priv *priv =3D ctrl_to_priv(ctrl->handler);
> +	struct max_ser *ser =3D priv->ser;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		ser->tpg_pattern =3D ctrl->val;
> +		return 0;

[Severity: Medium]
Does this V4L2 control actually update the hardware?

The handler updates the internal tpg_pattern variable but doesn't appear
to push the pattern change to the device hardware here.

> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int max_ser_enum_frame_interval(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *state,
> +				       struct v4l2_subdev_frame_interval_enum *fie)
> +{
> +	struct max_ser_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	const struct max_serdes_tpg_entry *entry;
> +
> +	if (!max_ser_pad_is_tpg(ser, fie->pad) ||
> +	    fie->stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -ENOTTY;
> +
> +	entry =3D max_ser_find_tpg_entry(ser, fie->index, fie->width, fie->heig=
ht,
> +				       fie->code, fie->interval.denominator,
> +				       fie->interval.numerator);

[Severity: High]
Are the numerator and denominator arguments swapped here?

max_ser_find_tpg_entry() expects the arguments in the order of numerator
followed by denominator, but they seem to be passed in reverse.

Also, does this function use uninitialized memory for its search filter?

The interval field in the v4l2_subdev_frame_interval_enum structure is typi=
cally
an output parameter for the VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL ioctl, meaning
userspace might pass uninitialized values in fie->interval.denominator and
fie->interval.numerator, which are then used for filtering.

> +	if (!entry)
> +		return -EINVAL;
[ ... ]
> +static int max_ser_get_frame_desc_state(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					struct v4l2_mbus_frame_desc *fd,
> +					unsigned int pad)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_subdev_route *route;
> +	int ret;
> +
> +	if (!max_ser_pad_is_source(ser, pad))
> +		return -ENOENT;
> +
> +	fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_ser_route_hw hw;
> +
> +		if (pad !=3D route->source_pad)
> +			continue;
> +
> +		ret =3D max_ser_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		hw.entry.stream =3D route->source_stream;
> +
> +		fd->entry[fd->num_entries++] =3D hw.entry;

[Severity: Critical]
Can this loop trigger a stack buffer overflow?

The fd->entry array is strictly bounded to V4L2_FRAME_DESC_ENTRY_MAX (8)
elements. If userspace configures a routing table with more than 8 active
routes on the source pad, this unbounded increment will write past the
end of the fd->entry array, which is often allocated on the stack.

> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int max_ser_get_pipe_mode(struct max_ser_priv *priv,
> +				 struct v4l2_subdev_state *state,
> +				 struct max_ser_pipe *pipe,
> +				 struct max_ser_pipe_mode *mode)
> +{
[ ... ]
> +	if (doubled_bpp)
> +		mode->soft_bpp =3D min_bpp;
> +
> +	if (min_bpp !=3D max_bpp || force_set_bpp)
> +		mode->bpp =3D max_bpp;

[Severity: High]
Will this logic leave the pipeline BPP as zero if all streams share the same
BPP value?

The mode variable is zero-initialized. If a pipeline contains a single stre=
am,
or multiple streams with identical BPP settings, the condition
min_bpp !=3D max_bpp will be false. If force_set_bpp is also false, mode->b=
pp
is never assigned and evaluates to 0, which could cause serialization
failures.

> +
> +	return 0;
> +}
[ ... ]
> +static int max_ser_update_pipe(struct max_ser_priv *priv,
> +			       struct max_ser_pipe *pipe,
> +			       struct v4l2_subdev_state *state,
> +			       u64 *streams_masks)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	struct max_ser_pipe_mode mode =3D { 0 };
> +	unsigned int num_dts;
> +	unsigned int *dts;
> +	unsigned int vcs;
> +	int ret;
> +
> +	if (!ser->ops->num_dts_per_pipe)
> +		return 0;
> +
> +	dts =3D devm_kcalloc(priv->dev, ser->ops->num_dts_per_pipe, sizeof(*dts=
),
> +			   GFP_KERNEL);

[Severity: High]
Is it safe to use devm_kcalloc() in a runtime hotpath?

This memory is allocated at runtime during V4L2 pad operations like
.enable_streams. Using the devres API outside of probe-time setup forces
traversals under the devres_lock spinlock, which can cause severe lock
contention and fragmentation.

> +	if (!dts)
> +		return -ENOMEM;
[ ... ]
> +static int max_ser_update_tpg(struct max_ser_priv *priv,
> +			      struct v4l2_subdev_state *state,
> +			      u64 *streams_masks)
> +{
> +	const struct max_serdes_tpg_entry *entry =3D NULL;
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_subdev_route *route;
> +	int ret;
[ ... ]
> +	if (entry =3D=3D ser->tpg_entry)
> +		return 0;
> +
> +	ret =3D ser->ops->set_tpg(ser, entry);

[Severity: Medium]
Does this prevent test pattern changes from taking effect if the video form=
at
hasn't changed?

If the V4L2_CID_TEST_PATTERN control is changed while streaming or between
streams, returning early here because the video format (entry) hasn't
changed means the new pattern won't be pushed to the hardware.

> +	if (ret)
> +		return ret;
[ ... ]
> +static int max_ser_update_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  u32 pad, u64 updated_streams_mask, bool enable)
> +{
> +	struct max_ser_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int num_pads =3D max_ser_num_pads(ser);
> +	u64 *streams_masks;
> +	int ret;
[ ... ]
> +	if (enable) {
> +		ret =3D max_ser_enable_disable_streams(priv, state, pad,
> +						     updated_streams_mask, enable);
> +		if (ret)
> +			goto err_revert_phys_update;
> +	}
> +
> +	devm_kfree(priv->dev, priv->streams_masks);

[Severity: High]
Does this devm_kfree() cause lock contention during runtime?

Calling devm_kfree() on operations like .disable_streams forces O(N) traver=
sals
under the devres_lock spinlock, which should generally be avoided in runtime
streaming paths.

> +	priv->streams_masks =3D streams_masks;
> +	ser->active =3D !!streams_masks[pad];

[Severity: High]
Does this incorrectly overwrite the global active state?

Assigning ser->active based only on the streams_masks of the current pad
means that if multiple pads are active and one is disabled, the global state
becomes false even if the other pad is still streaming. This could bypass
the -EBUSY checks in pipeline configuration ioctls.

> +
> +	return 0;
> +
> +err_revert_phys_update:
[ ... ]
> +static int max_ser_v4l2_register(struct max_ser_priv *priv)
> +{
> +	struct v4l2_subdev *sd =3D &priv->sd;
> +	struct max_ser *ser =3D priv->ser;
> +	void *data =3D i2c_get_clientdata(priv->client);
> +	unsigned int num_pads =3D max_ser_num_pads(ser);
> +	unsigned int i;
> +	int ret;
[ ... ]
> +	ret =3D media_entity_pads_init(&sd->entity, num_pads, priv->pads);
> +	if (ret)
> +		goto err_free_ctrl;
> +
> +	ret =3D max_ser_v4l2_notifier_register(priv);
> +	if (ret)
> +		goto err_media_entity_cleanup;
> +
> +	ret =3D v4l2_subdev_init_finalize(sd);

[Severity: High]
Is it safe to register the async notifier before finalizing the subdevice
initialization?

Registering the notifier here exposes the subdevice to async binding before
its active state is fully initialized via v4l2_subdev_init_finalize(), which
could lead to NULL pointer dereferences if it is bound immediately.

> +	if (ret)
> +		goto err_nf_cleanup;
> +
> +	ret =3D v4l2_async_register_subdev(sd);
[ ... ]
> +static void max_ser_v4l2_unregister(struct max_ser_priv *priv)
> +{
> +	struct v4l2_subdev *sd =3D &priv->sd;
> +
> +	max_ser_v4l2_notifier_unregister(priv);
> +	v4l2_async_unregister_subdev(sd);

[Severity: High]
Could this cleanup ordering cause a use-after-free?

max_ser_v4l2_notifier_unregister() is called before the main subdevice is
unregistered. Destroying the notifier and its links while the subdevice is
still exposed to userspace creates a race condition.

> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +}
> +
> +static int max_ser_parse_sink_dt_endpoint(struct max_ser_priv *priv,
> +					  struct max_ser_phy *phy,
> +					  struct max_serdes_source *source,
> +					  struct fwnode_handle *fwnode)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	u32 pad =3D max_ser_phy_to_pad(ser, phy);
> +	struct v4l2_fwnode_endpoint v4l2_ep =3D { .bus_type =3D V4L2_MBUS_CSI2_=
DPHY };
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep =3D fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
> +	if (!ep)
> +		return 0;
> +
> +	source->ep_fwnode =3D fwnode_graph_get_remote_endpoint(ep);

[Severity: High]
Does this code leak the remote endpoint fwnode reference?

fwnode_graph_get_remote_endpoint() acquires a reference that is stored in
source->ep_fwnode. While this is later passed to v4l2_async_nf_add_fwnode()
(which takes its own reference), the original reference in source->ep_fwnode
doesn't seem to ever be released via fwnode_handle_put().

> +	if (!source->ep_fwnode) {
> +		fwnode_handle_put(ep);
> +		dev_err(priv->dev,
[ ... ]
> +static int max_ser_read_reg(struct i2c_adapter *adapter, u8 addr,
> +			    u16 reg, u8 *val)
> +{
> +	u8 buf[2] =3D { reg >> 8, reg & 0xff };
> +	struct i2c_msg msg[2] =3D {
> +		{
> +			.addr =3D addr,
> +			.flags =3D 0,
> +			.buf =3D buf,
> +			.len =3D sizeof(buf),
> +		},
> +		{
> +			.addr =3D addr,
> +			.flags =3D I2C_M_RD,
> +			.buf =3D buf,
> +			.len =3D 1,
> +		},
> +	};

[Severity: High]
Can this overlap cause DMA corruption?

Both the TX and RX messages point to the exact same stack buffer (buf).
If the underlying I2C adapter utilizes DMA, it will simultaneously map the
identical memory address for both DMA_TO_DEVICE and DMA_FROM_DEVICE,
which violates the DMA API and can trigger debug warnings.

Also, does the I2C framework permit DMA transactions mapped directly from
stack-allocated buffers?

> +	int ret;
> +
> +	ret =3D i2c_transfer(adapter, msg, ARRAY_SIZE(msg));
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D buf[0];

[Severity: High]
Does this properly handle partial I2C transfers?

i2c_transfer() returns the number of successfully completed messages. If on=
ly
the first message succeeds, it will return a positive value (1). The check
if (ret < 0) bypasses this error, leading to the function returning success
while passing back uninitialized data in buf[0].

> +
> +	return 0;
> +}
[ ... ]
> +int max_ser_wait_for_multiple(struct i2c_adapter *adapter, u8 *addrs,
> +			      unsigned int num_addrs, u8 *current_addr)
> +{
> +	unsigned int i, j;
> +	int ret =3D 0;
> +	u8 val;
> +
> +	for (i =3D 0; i < 10; i++) {
> +		for (j =3D 0; j < num_addrs; j++) {
> +			ret =3D max_ser_read_reg(adapter, addrs[j], MAX_SER_REG0, &val);
> +			if (!ret && val) {
> +				*current_addr =3D addrs[j];
> +				return 0;
> +			}
> +
> +			msleep(100);
> +		}
> +	}
> +
> +	return ret;

[Severity: High]
Does this loop return 0 even when it times out?

If the loop exhausts all 10 tries without val becoming non-zero, it finishes
the loop and returns ret. Since ret is 0 from the last successful read,
callers will think the device became ready, which could lead to failures
since *current_addr is never updated.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-gmsl2-3_se=
rdes-v13-0-9d8a4919983b@analog.com?part=3D14

