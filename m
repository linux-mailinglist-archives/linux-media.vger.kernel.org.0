Return-Path: <linux-media+bounces-64707-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +yQ6N4gjLGplMAQAu9opvQ
	(envelope-from <linux-media+bounces-64707-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:19:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ED767A7BD
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:19:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b="ozIkE3/0";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64707-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64707-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC3CB3166BEA
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5387B332614;
	Fri, 12 Jun 2026 15:18:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610235C613;
	Fri, 12 Jun 2026 15:18:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781277499; cv=none; b=mDW5+LlAO3bQ6yRyMpTKeX8BPIH1Q3ys8S3rXZs4yosOzd/p2gEewOE74d82D90YrG6v8F8vWtzU6w5JtPhWJIVY/UqSz5mrl6AVmdyaNOcdEu4WZ9eGTJQHKqKZ9whyB7ZfXTEvOwru3NlDaHzADRwIralcHl3AVRU1mLy2i4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781277499; c=relaxed/simple;
	bh=6xbD8aQ3up4WIV6rG60y3LImpjgsKA8s0n+Dpk5aWVM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R4jAfhCyN0WziJMivXJnzzTA7QHzjJPTr0UL0wFKXbHEkcagbRBgn1zwD+VKREnovq3L31hrQlCi9/++B/q6q9gvWeUWzJvKw009G5bHhpXpF3bXUJPP/WHBluyXbj5efWU1Ed9hOutym4bCleBH/jU236vawPk7O0KC0k3vx/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ozIkE3/0; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781277496;
	bh=6xbD8aQ3up4WIV6rG60y3LImpjgsKA8s0n+Dpk5aWVM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ozIkE3/0JnbwzCPlRXuVb6V9XB5EbgymbBxzqBQ10HOohwxtJxwuitP9IxHHEeXfC
	 hPsfbQBKwKkdcxfRBzWecKeVbZCOEieLKkbol+tWYNkCahoSrg2VbEKJxTDmet5U1W
	 t9INS/IjUJ7MldDYXPo3GfAeljmFYsGdHbv7BvnVNKDAOOSMJnpIyoweGHzdPaU2UL
	 MqIcvdm+9GkhEwDS9V3UhJI/plwSNKftm5r+3TJPokX1if7m6pqCGmFMrUx+cDsAMX
	 3JdqS0SxCAT0OqGLQG/lqD0VcVo8YZnypOB5ki4G1qdy2EDpAJ3oezCatB2+HuYWDN
	 ZDxu2asMlmhtQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6B4217E02F1;
	Fri, 12 Jun 2026 17:18:15 +0200 (CEST)
Message-ID: <a83b7ce30ffc423128e3a3b7d5a03baa8cba6216.camel@collabora.com>
Subject: Re: [PATCH 3/3] media: hantro: add per-context fdinfo usage stats
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, Christopher Healy
	 <healych@amazon.com>
Date: Fri, 12 Jun 2026 11:18:13 -0400
In-Reply-To: <20260612-v4l2-add-fdinfo-v1-3-723211abc861@collabora.com>
References: <20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabora.com>
	 <20260612-v4l2-add-fdinfo-v1-3-723211abc861@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Hs12ap8MaWObVYCUBqZM"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-64707-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:detlev.casanova@collabora.com,m:mchehab@kernel.org,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:healych@amazon.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53ED767A7BD


--=-Hs12ap8MaWObVYCUBqZM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 12 juin 2026 =C3=A0 10:26 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:
> From: Christopher Healy <healych@amazon.com>
>=20
> Add per-file-descriptor hardware utilization tracking to the Hantro
> VPU stateless codec driver, exposed via /proc/<pid>/fdinfo/<fd>.
>=20
> Record a ktime timestamp when each job is submitted to hardware in
> device_run(), and accumulate the elapsed nanoseconds when the job
> completes in hantro_job_finish(). Report the accumulated time along
> with the current clock frequency through the new V4L2 show_fdinfo
> callback.
>=20
> The output uses a media- key prefix with the following keys:
> =C2=A0 media-driver:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 driver name
> =C2=A0 media-engine-<eng>:=C2=A0=C2=A0=C2=A0=C2=A0 accumulated busy time =
in nanoseconds
> =C2=A0 media-maxfreq-<eng>:=C2=A0=C2=A0=C2=A0 maximum engine frequency in=
 Hz
> =C2=A0 media-curfreq-<eng>:=C2=A0=C2=A0=C2=A0 current engine frequency in=
 Hz
>=20
> Where <eng> is "decoder" or "encoder" depending on the context.
>=20
> This enables userspace monitoring tools to compute per-process decoder
> and encoder utilization. The current and max frequency keys report the
> same value today since the driver lacks devfreq support, but will
> diverge once DVFS is added, allowing userspace to approximate true
> capacity utilization without any fdinfo code changes. A future series
> can add hardware cycle counter support (via media-cycles-<eng>) for
> exact utilization under DVFS, with no changes to the existing uAPI.
>=20
> Signed-off-by: Christopher Healy <healych@amazon.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 5 +++++
> =C2=A0drivers/media/platform/verisilicon/hantro_drv.c | 22 ++++++++++++++=
++++++++
> =C2=A02 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index 0353de154a1e..10287e5cebac 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -16,6 +16,7 @@
> =C2=A0#include <linux/videodev2.h>
> =C2=A0#include <linux/wait.h>
> =C2=A0#include <linux/clk.h>
> +#include <linux/ktime.h>
> =C2=A0#include <linux/reset.h>
> =C2=A0
> =C2=A0#include <media/v4l2-ctrls.h>
> @@ -268,6 +269,10 @@ struct hantro_ctx {
> =C2=A0	struct hantro_postproc_ctx postproc;
> =C2=A0	bool need_postproc;
> =C2=A0
> +	/* Statistics for debugging and performance measurements. */
> +	ktime_t start_time;
> +	u64 total_ns;
> +
> =C2=A0	/* Specific for particular codec modes. */
> =C2=A0	union {
> =C2=A0		struct hantro_h264_dec_hw_ctx h264_dec;
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 2e81877f640f..139c2e6a83aa 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -90,6 +90,8 @@ static void hantro_job_finish(struct hantro_dev *vpu,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hantro_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum vb2_buffer_state result)
> =C2=A0{
> +	ctx->total_ns +=3D ktime_to_ns(ktime_sub(ktime_get(), ctx->start_time))=
;
> +
> =C2=A0	pm_runtime_put_autosuspend(vpu->dev);
> =C2=A0
> =C2=A0	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> @@ -186,6 +188,8 @@ static void device_run(void *priv)
> =C2=A0
> =C2=A0	v4l2_m2m_buf_copy_metadata(src, dst);
> =C2=A0
> +	ctx->start_time =3D ktime_get();
> +
> =C2=A0	if (ctx->codec_ops->run(ctx))
> =C2=A0		goto err_cancel_job;
> =C2=A0
> @@ -701,10 +705,28 @@ static int hantro_release(struct file *filp)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static void hantro_show_fdinfo(struct seq_file *m, struct file *f)
> +{
> +	struct hantro_ctx *ctx =3D file_to_ctx(f);
> +	struct hantro_dev *vpu =3D ctx->dev;
> +
> +	seq_printf(m, "media-driver:\t%s\n", DRIVER_NAME);
> +	seq_printf(m, "media-engine-%s:\t%llu ns\n",
> +		=C2=A0=C2=A0 ctx->is_encoder ? "encoder" : "decoder",
> +		=C2=A0=C2=A0 ctx->total_ns);
> +	seq_printf(m, "media-maxfreq-%s:\t%lu Hz\n",
> +		=C2=A0=C2=A0 ctx->is_encoder ? "encoder" : "decoder",
> +		=C2=A0=C2=A0 clk_get_rate(vpu->clocks[0].clk));
> +	seq_printf(m, "media-curfreq-%s:\t%lu Hz\n",
> +		=C2=A0=C2=A0 ctx->is_encoder ? "encoder" : "decoder",
> +		=C2=A0=C2=A0 clk_get_rate(vpu->clocks[0].clk));

Similar to what was done in DRM helpers, I would create a common structure,
maybe in a v4l2-stats library (or some better name). The driver would fill =
that
structure directly, or through helpers (such as software timer helper, cycl=
e
count translation helper), and finally, this show_fd_info() would be a one
liners, just like DRM do.

This will ensure full consistency in the trace, and avoid possible future
unresolvable compatibility issue due to past mistakes. If we ever let a bug
through (of course we won't :-D) all driver will have the same bug, and it =
will
be easier to not break userspace.

Nicolas

> +}
> +
> =C2=A0static const struct v4l2_file_operations hantro_fops =3D {
> =C2=A0	.owner =3D THIS_MODULE,
> =C2=A0	.open =3D hantro_open,
> =C2=A0	.release =3D hantro_release,
> +	.show_fdinfo =3D hantro_show_fdinfo,
> =C2=A0	.poll =3D v4l2_m2m_fop_poll,
> =C2=A0	.unlocked_ioctl =3D video_ioctl2,
> =C2=A0	.mmap =3D v4l2_m2m_fop_mmap,

--=-Hs12ap8MaWObVYCUBqZM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaiwjNQAKCRDZQZRRKWBy
9E+lAP9FfI8OiuJMiE0RMhsH5hDMHf+MNirfEN8UHi4ZsaEBLwD7Bbm/F4oa8Lu4
yFEuWJKs+e/J5TLkPu4ui4bzBCNeIww=
=pbku
-----END PGP SIGNATURE-----

--=-Hs12ap8MaWObVYCUBqZM--

