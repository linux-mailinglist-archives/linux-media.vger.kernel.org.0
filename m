Return-Path: <linux-media+bounces-63330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEUtAVT0HWqegAkAu9opvQ
	(envelope-from <linux-media+bounces-63330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 23:06:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B64625794
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 23:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 196CE304F228
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 21:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFE1385D79;
	Mon,  1 Jun 2026 21:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ip9u/0qA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D0B331A6E
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 21:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347972; cv=none; b=byzNI5T6Xv38pO9zgU6afwUDL4Xj9in/PvAB3ZblVVHV2l87SZx54/EZqdSxtVyYtCAsJmFwYJEu/ONyEcsbUqvfvla7wsyJsNOaR68+lezEJRG7f3xNI55gNno0Oc7OZMRJW0WQTzvfaXpIYPB5iZ/PgbiJ8Vb+16NIlYP6FfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347972; c=relaxed/simple;
	bh=T3tiETIU8jDu/RiXgw+wmz5y4rQFMCkQJpB2gT+KxAo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kMqGJhevqM9b8ON9R2RWEWDDFzckZs84Sl6VY4oLNVgDZhwxEE6PYXeU7JNaFJ6186nG7DMqD/RcEzdfp3ZzIaVnmzdMx6DCO0YKSVPBj9GbdIDbAzQF2i+0knOiWSu7IALFvrwNbok3FeliD1tYZQu9HsBjuOJS9/IEFv4OCmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ip9u/0qA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8912F1F00893;
	Mon,  1 Jun 2026 21:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780347970;
	bh=SGXhYAlKirdogka/gFnEY3yvaSmhWkM0Pgj2ID3Keg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ip9u/0qAhAYHZtwzLANg8kjWF7RW9+4bRQlKgS8Vrj8kxrx7XjtU+AKx2onlnGKSI
	 R9oJxXTZjMeCtJEnv+USjFORBLWGRURRJGG0z/EvAZq/SRmi3Wep8ACfWD8a23JMCE
	 BuEUhf2AIMb8lrFh29zI9/4m2hjwdXHZuA/oFrHJtz0KjOPgVeTpf5fIuaqWcJgZO2
	 n9YgW3Pwsmys8rETf4YrVEjB5YRs8dCr6AskLD7qryicX23y58PwVxO7tuBzvIvkRB
	 UOFG9sFlNMIGNW5YLW6ZXLdKHcjzoyoamV50AzKGmfRexz5MNZYsfw1JDAYAEEMFjP
	 ArQocMj1ly92w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] media: i2c: Pinefeat cef168 lens control board
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aliaksandr Smirnou" <asmirnou@pinefeat.co.uk>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260601204814.19148-3-asmirnou@pinefeat.co.uk>
References: <20260601204814.19148-3-asmirnou@pinefeat.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 21:06:10 +0000
Message-Id: <20260601210610.8912F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63330-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp.kernel.org:mid,pinefeat.co.uk:email]
X-Rspamd-Queue-Id: 70B64625794
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Data race on global CRC table and early userspace exposure.
- [High] Unintended hardware writes triggered from a read-only volatile get=
ter.
- [High] UAPI ABI breakage due to architecture-dependent bitfields and endi=
anness exposure.
- [High] I2C transfers performed using stack-allocated buffers.
- [High] Use-After-Free risk due to combining `devm_kzalloc` with V4L2 devi=
ce nodes.
- [Medium] Pointer cast of a packed struct member triggers warning and risk=
s unaligned access.
- [Low] Pointer signedness compiler warning in CRC function call.
--

commit b6486dc31f9f1b48eddfb7b13dda9a4b186db9ac
Author: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>

media: i2c: Pinefeat cef168 lens control board driver

Add support for the Pinefeat cef168 lens control board that provides
electronic focus and aperture control for Canon EF & EF-S lenses on
non-Canon camera bodies.

diff --git a/drivers/media/i2c/cef168.c b/drivers/media/i2c/cef168.c
new file mode 100644
index 0000000000000..596bf549bf255
--- /dev/null
+++ b/drivers/media/i2c/cef168.c
@@ -0,0 +1,317 @@
[ ... ]
> +struct cef168_data {
> +	__u8 lens_id;
> +	__u8 moving : 1;
> +	__u8 calibrating : 2;
> +	__u16 moving_time;
> +	__u16 focus_position_min;
> +	__u16 focus_position_max;
> +	__u16 focus_position_cur;
> +	__u16 focus_distance_min;
> +	__u16 focus_distance_max;
> +	__u8 crc8;
> +} __packed;

[Severity: High]
Does this struct definition break the UAPI ABI since it is mapped directly
to userspace later?

The C bitfields (moving, calibrating) will have different memory layouts
depending on the compiler and architecture endianness, meaning userspace
cannot reliably decode this data.

[ ... ]
> +static int cef168_i2c_write(struct cef168_device *cef168_dev, u8 cmd, u1=
6 val)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&cef168_dev->sd);
> +	int retry, ret;
> +
> +	__le16 le_data =3D cpu_to_le16(val);
> +	char tx_data[4] =3D { cmd, ((u8 *)&le_data)[0], ((u8 *)&le_data)[1] };

[Severity: High]
Can this cause memory corruption or kernel panics when CONFIG_VMAP_STACK
is enabled?

The local array tx_data is allocated on the stack and passed directly to
i2c_master_send(). If the I2C adapter driver uses DMA, passing stack
memory for DMA operations is unsafe.

Should this buffer be dynamically allocated and embedded in the
heap-allocated device structure instead?

> +
> +	tx_data[3] =3D crc8(cef168_crc8_table, tx_data, 3, CRC8_INIT_VALUE);

[Severity: Low]
Does passing a char array to crc8() trigger a -Wpointer-sign warning?

crc8() expects a const u8 *pdata. Should tx_data be declared as a u8 array
instead?

> +
> +	for (retry =3D 0; retry < 3; retry++) {
> +		ret =3D i2c_master_send(client, tx_data, sizeof(tx_data));
> +		if (ret =3D=3D sizeof(tx_data))
> +			return 0;
> +		else if (ret !=3D -EIO && ret !=3D -EREMOTEIO)
> +			break;
> +	}
[ ... ]
> +static int cef168_i2c_read(struct cef168_device *cef168_dev,
> +			   struct cef168_data *rx_data)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&cef168_dev->sd);
> +
> +	int ret =3D i2c_master_recv(client, (char *)rx_data,
> +				  sizeof(struct cef168_data));

[Severity: High]
Is this passing stack memory to the I2C core again?

rx_data references a struct cef168_data instantiated locally on the stack
in cef168_get_ctrl(). This can cause DMA corruption if the I2C adapter
uses DMA for transfers.

> +	if (ret !=3D sizeof(struct cef168_data)) {
> +		dev_err(&client->dev, "I2C read fail, ret=3D%d\n", ret);
> +		return -EIO;
> +	}
> +
> +	u8 computed_crc =3D crc8(cef168_crc8_table, (const u8 *)rx_data,
> +			       sizeof(struct cef168_data) - 1, CRC8_INIT_VALUE);
> +	if (computed_crc !=3D rx_data->crc8) {
> +		dev_err(&client->dev,
> +			"CRC mismatch calculated=3D0x%02X read=3D0x%02X\n",
> +			computed_crc, rx_data->crc8);
> +		return -EIO;
> +	}
> +
> +	rx_data->moving_time =3D le16_to_cpup((__le16 *)&rx_data->moving_time);

[Severity: Medium]
Will this pointer cast of a packed struct member cause unaligned access
issues or trigger a -Waddress-of-packed-member warning?

Casting the address of rx_data->moving_time to a __le16 pointer strips its
unaligned qualification. If the struct is allocated on an odd boundary,
this could result in an unaligned load exception.

Could this just use le16_to_cpu(rx_data->moving_time) or
get_unaligned_le16() instead?

> +	rx_data->focus_position_min =3D le16_to_cpup((__le16 *)&rx_data->focus_=
position_min);
[ ... ]
> +static int cef168_get_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct cef168_data data;
> +	struct cef168_device *dev =3D to_cef168(ctrl);
> +	int rval;
> +
> +	rval =3D cef168_i2c_read(dev, &data);
> +	if (rval < 0)
> +		return rval;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_FOCUS_ABSOLUTE:
> +		__v4l2_ctrl_modify_range(ctrl,
> +					 data.focus_position_min,
> +					 data.focus_position_max, 1, 0);

[Severity: High]
Can modifying the control range here inadvertently trigger a hardware write?

Since this is the g_volatile_ctrl callback, it executes during a read
operation. If the newly retrieved hardware limits invalidate the control's
current cached value, the V4L2 framework will automatically clamp it and
call s_ctrl(), which in turn issues an I2C command to move the lens.

This means a read-only GET ioctl could cause physical hardware changes.

> +		ctrl->val =3D data.focus_position_cur;
> +		return 0;
> +	case CEF168_V4L2_CID_CUSTOM(lens_id):
> +		ctrl->p_new.p_u8[0] =3D data.lens_id;
> +		return 0;
> +	case CEF168_V4L2_CID_CUSTOM(data):
> +		memcpy(ctrl->p_new.p_u8, &data, sizeof(data));

[Severity: High]
Does this expose in-place converted endianness and architecture-dependent
bitfields to userspace?

The struct cef168_data has had its fields modified in-place using
le16_to_cpup() during cef168_i2c_read(). Copying it directly into the U8
array means the raw bytes have an unstable, arch-dependent byte order,
making it unreliable for userspace to decode.

> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
[ ... ]
> +static int cef168_probe(struct i2c_client *client)
> +{
> +	struct cef168_device *cef168_dev;
> +	int rval;
> +
> +	cef168_dev =3D devm_kzalloc(&client->dev, sizeof(*cef168_dev),
> +				  GFP_KERNEL);

[Severity: High]
Does allocating this memory with devm_kzalloc() create a use-after-free
risk?

Since the driver registers a V4L2 subdevice node with the
V4L2_SUBDEV_FL_HAS_DEVNODE flag, userspace can hold an open file
descriptor to it. If the I2C driver is unbound via sysfs, devres will free
cef168_dev immediately.

When the file descriptor is later closed, the V4L2 core will dereference the
freed memory in v4l2_subdev_release().

Should this use dynamic allocation with a proper release callback?

> +	if (!cef168_dev)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&cef168_dev->sd, client, &cef168_ops);
> +	cef168_dev->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> +				V4L2_SUBDEV_FL_HAS_EVENTS;
> +
> +	rval =3D cef168_init_controls(cef168_dev);
> +	if (rval)
> +		goto err_cleanup;
> +
> +	rval =3D media_entity_pads_init(&cef168_dev->sd.entity, 0, NULL);
> +	if (rval < 0)
> +		goto err_cleanup;
> +
> +	cef168_dev->sd.entity.function =3D MEDIA_ENT_F_LENS;
> +
> +	rval =3D v4l2_async_register_subdev(&cef168_dev->sd);
> +	if (rval < 0)
> +		goto err_cleanup;
> +
> +	crc8_populate_msb(cef168_crc8_table, CEF_CRC8_POLYNOMIAL);

[Severity: High]
Is there a data race on the global cef168_crc8_table here?

crc8_populate_msb() modifies a shared global array. Because
v4l2_async_register_subdev() has already been called, the device is exposed
to userspace and could trigger I2C commands using an uninitialized or
partially initialized CRC table. Furthermore, if multiple devices are probed
concurrently, this will corrupt the table values.

> +
> +	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601204814.1914=
8-1-asmirnou@pinefeat.co.uk?part=3D2

