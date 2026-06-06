Return-Path: <linux-media+bounces-64029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k72XOVZxJGql6gEAu9opvQ
	(envelope-from <linux-media+bounces-64029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 21:13:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6A64E183
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 21:13:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aVOnVEIl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64029-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64029-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A5803019803
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 19:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA4C3B7779;
	Sat,  6 Jun 2026 19:13:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD163B5314;
	Sat,  6 Jun 2026 19:13:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780773190; cv=none; b=NHd6ub/qmfqGVvkDfppZX9cyKI6KWx1bNrzcCXejcuSMbTasJbwFdnFX3GQZwTUwtz7+4qNUslPGc13ZabzqBmm8ydhcnJrgbgOds0Pe0nXk+AAu0ZKIhfiN+GRNWPg4X4PQNL8R3y7PAwFcFWri13QRX3fmozzjaTG51IIMQFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780773190; c=relaxed/simple;
	bh=noMB+ePnB9H9kuCxlgqLw6ucylWZoq7R3EbSq8liaH0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n0660qbwd1Q6KIuDSresHF1J49mYoO7WNsXR6D1YjSbTRvlUKciqA9zQb6Tsq//Kh1i2cioXTnSpe2BEeJjBqlu/XzcBFy9QU2Ig7QxYUoKZ5OS9LtrrbONmJvoQzXWJa53t158QztskoDVxHDJpN8Xef2wEkKQGhMxSpV2ToSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVOnVEIl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884C41F00893;
	Sat,  6 Jun 2026 19:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780773188;
	bh=SHH2cil3xPmegNJkbefYpPtqE9n6STIGuriAlPk5B/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aVOnVEIlGIZXPZ0FSSeVn9DDfLkD6Ffiw0EsIMLADKitLqHiEwFdP8N6P0qgQMHjz
	 9sY8BVxK92g7gMtApj88t1o3KyrAKilJYfO+Xb3CKeqNI2sQUvgQFSQ0CVeVTqblOJ
	 Ovw9Hn//Rmj+0dWZnzl/jqcRf4UEO4OYoxhgiF+mBBLisNy07whVikYHyzU3kiyfiD
	 SG5OqnWVzgS2C1hkBhNiwydw/GMoWJk14azqGSppMiEEMfiyDfoIdkdBXiviB5bV6q
	 H5TObGvzcDpmxEo7K89pYsGBhMl5i4OGFKFF/4hyQjw+W4ZnKKfKAEsgyCMN/0qmbY
	 SA6NLnvpWaVYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: add Aptina MT9M113 1.3 Mpx SoC
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk via B4 Relay" <devnull+github.com.herrie.org@kernel.org>
Cc: conor+dt@kernel.org, linux-media@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260606-submit-media-mt9m113-v6-2-8f6d0f79f4d1@herrie.org>
References: <20260606-submit-media-mt9m113-v6-2-8f6d0f79f4d1@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 19:13:08 +0000
Message-Id: <20260606191308.884C41F00893@smtp.kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,sashiko.dev:url,vger.kernel.org:from_smtp,herrie.org:email,pa.sd:url];
	TAGGED_FROM(0.00)[bounces-64029-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+github.com.herrie.org@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 3DC6A64E183

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `mt9m113_start_streaming()` error path explicitly powers off t=
he hardware but leaves the PM state as `RPM_ACTIVE`. Subsequent operations =
(like STREAMON retries, `s_ctrl`, or `remove`) trust the active PM state an=
d perform illegal operations, causing clk/regulator refcount underflows and=
 I2C timeouts.
- [High] Tying the allocation lifetime of the sensor structure to V4L2 subd=
ev `.release` callbacks introduces a memory leak on unbound initialization =
and a Use-After-Free during bridge unbind.
- [High] Concurrency between `VIDIOC_S_CTRL` / `VIDIOC_STREAMON` ioctls and=
 `mt9m113_remove()` causes Use-After-Free on devres-managed resources (e.g.=
, `regmap`, `clk`).
--

commit f0fc2c67299ebd9a65a3dfa2e680f9a4ff64a2cb
Author: Herman van Hazendonk <github.com@herrie.org>

    media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver
   =20
    Add a V4L2 subdev driver for the Aptina MT9M113 1.3 Megapixel SoC
    image sensor (1280x1024 active pixel array) with on-chip ISP.

> diff --git a/drivers/media/i2c/mt9m113.c b/drivers/media/i2c/mt9m113.c
> --- a/drivers/media/i2c/mt9m113.c
> +++ b/drivers/media/i2c/mt9m113.c
> @@ -1876,14 +1876,8 @@ static int mt9m113_start_streaming(struct mt9m113 =
*sensor,
[ ... ]
>  	sensor->chip_off =3D true;
>  	pm_runtime_put_noidle(dev);
>  	return ret;
>  }

[Severity: High]
Does this leave the PM state as RPM_ACTIVE while the hardware is physically
powered off?

If the retry loop exhausts all attempts, the hardware is explicitly powered
down. However, because the PM state is left active, subsequent operations
like ioctls or remove() will trust the PM state and attempt hardware access=
es
or call power down again.

Could this lead to clock and regulator refcount underflows in remove() or
I2C timeouts in s_ctrl() since they believe the chip is powered on?

[ ... ]

> @@ -2293,12 +2293,7 @@ static int mt9m113_ifp_registered(struct v4l2_subd=
ev *sd)
>  {
>  	struct mt9m113 *sensor =3D ifp_to_mt9m113(sd);
>  	int ret;
> =20
>  	ret =3D v4l2_device_register_subdev(sd->v4l2_dev, &sensor->pa.sd);

[ ... ]

> @@ -3246,26 +3246,12 @@ static void mt9m113_remove(struct i2c_client *cli=
ent)
[ ... ]
>  	pm_runtime_disable(dev);
>  	pm_runtime_dont_use_autosuspend(dev);
>  	if (!pm_runtime_status_suspended(dev))
>  		mt9m113_power_off(sensor);

[Severity: High]
Can the sensor structure be freed before remove() is called or leaked
entirely?

The allocation lifetime of the sensor structure is tied to the V4L2 subdev
release callbacks, using an atomic release_count initialized to 2. However,
the pixel array subdev pa.sd is only registered in mt9m113_ifp_registered()
when a bridge attaches.

If the module is unloaded before a bridge binds, pa.sd is never registered,
its release callback never runs, and the sensor structure leaks.

Conversely, if a bridge unbinds, v4l2_device_unregister_subdev() invokes
the release callbacks for both subdevs, freeing the sensor structure. A
subsequent execution of remove() would then dereference the already freed
sensor when calling mt9m113_power_off() and v4l2_async_unregister_subdev().

Could this result in a use-after-free?

>  	pm_runtime_set_suspended(dev);
> =20
>  	v4l2_async_unregister_subdev(&sensor->ifp.sd);

[Severity: High]
Does this remove process leave devres-managed resources vulnerable to a
use-after-free from concurrent ioctls?

By deferring the freeing of the sensor structure to the subdev release
callbacks, the control handlers can outlive remove() if an application holds
an open file descriptor.

Hardware resources like sensor->regmap and sensor->clk are managed by devres
and are automatically freed when remove() returns.

If an ioctl like VIDIOC_S_CTRL successfully calls pm_runtime_get_if_in_use()
just before remove() calls pm_runtime_disable(), will the control handler
thread attempt to use the regmap structure after devres has already destroy=
ed
it?

>  	/* @sensor may already be freed here; do not dereference it. */
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-submit-med=
ia-mt9m113-v6-0-8f6d0f79f4d1@herrie.org?part=3D2

