Return-Path: <linux-media+bounces-60014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICwhM2ZP8mlGpgEAu9opvQ
	(envelope-from <linux-media+bounces-60014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:35:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F4499305
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C66913113445
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2120141B361;
	Wed, 29 Apr 2026 18:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c/rVNtk/"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25543410D15;
	Wed, 29 Apr 2026 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487544; cv=none; b=p2n2feiQfLRPaBhlR1IvijQMoRVFk1dY00+2qWMX0LeqdOlb2RWNW0ux04/oBfLHZSLfiIRNiUW4pa3j6gFZa2GZFVCGzdRxxP2gf3WR15DncUGvcDiPf3TMPT8lJ0AZN5dvqqdIGXyNY+zBfnuG/aGBH67kflmlr1yrsL3T5XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487544; c=relaxed/simple;
	bh=ls8/6ghNACx90Wc1zfOiO2Mu4cjJyNzdKgBQAIshC5Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ElU6WHgSG1AB8nu5mC3CV1iutkSJdL7MD2W9AQD2P1zhJkZI2N2f91RNGN7pnYljm8olTmZp9kicI3OBQHSHAabygvbUngxQJHuUtU0RWtYLw9vx0epcN/zpek0Zxh6mg/+1oWVzpKsvFMxrbZzAF71aSc4hm87fOEfYXRL2iOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=c/rVNtk/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777487541;
	bh=ls8/6ghNACx90Wc1zfOiO2Mu4cjJyNzdKgBQAIshC5Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=c/rVNtk/toK3WMIreRIRrnXU9+3ZnS2ceuo0tw4qHhM1QQSQY3stoa+y/G2xz9uw6
	 lu2TU/UWVqmiMYxPxyxQRAQJRtkNsBF/5I8i7qLlxZWBhW/7hQW86QEdsTivYuyxya
	 HGWW4LVsTH/+GbHmvQ3YBPFc5l+4RGnwWe7gV3L9Ca+I8rIRX2QCJ226M9WZBHPBGz
	 yiiaDJSPoa9uwDOOQD/UzL69kgBZORCn9jIwPWP5cOif8ZdBkZyuDqriXPEvqLIYek
	 c/Mo2Jwtgk5MajRMBIpq57GlIfcDoE7Cv1BvkjP9pM9vBt4NzunEMLYVN2Z/HmonPT
	 q3yG6iS2MNTrw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89FBF17E1201;
	Wed, 29 Apr 2026 20:32:20 +0200 (CEST)
Message-ID: <d755f9d16f64b9c5f2e63334c5984710a6f20ddb.camel@collabora.com>
Subject: Re: [PATCH 2/2] media: chips-media: wave5: Fix Reports from Kernel
 Lock Validator
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Brandon Brnich <b-brnich@ti.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: detheridge@ti.com, mchehab@kernel.org, nas.chung@chipsnmedia.com, 
	jackson.lee@chipsnmedia.com
Date: Wed, 29 Apr 2026 14:32:19 -0400
In-Reply-To: <20260402184554.1751445-2-b-brnich@ti.com>
References: <20260402184554.1751445-1-b-brnich@ti.com>
	 <20260402184554.1751445-2-b-brnich@ti.com>
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
	protocol="application/pgp-signature"; boundary="=-V+T0VdgJOkIVaYzbxxdY"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 510F4499305
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60014-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email,collabora.com:email,collabora.com:dkim,collabora.com:mid]


--=-V+T0VdgJOkIVaYzbxxdY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 avril 2026 =C3=A0 13:45 -0500, Brandon Brnich a =C3=A9crit=C2=
=A0:
> handle_dynamic_resolution change requires that the state_lock be acquired
> based on the lockdep_assert_held. However, the
> handle_dynamic_resolution_change call in initialize_sequence does not
> properly obtain the lock before calling.
>=20
> Since the v4l2_ctrl_find and s_ctrl can sleep, they should not be called
> while a lock is already held. Store off the fbc_buf_count then properly
> update control once lock has been freed.
>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
> =C2=A0.../chips-media/wave5/wave5-vpu-dec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 50 ++++++++++++++-----
> =C2=A01 file changed, 37 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 80e1831a42e0..62b21b2c5e29 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -283,10 +283,25 @@ static void send_eos_event(struct vpu_instance *ins=
t)
> =C2=A0	inst->sent_eos =3D true;
> =C2=A0}
> =C2=A0
> +static void wave5_update_min_bufs_ctrl(struct vpu_instance *inst, u32 fb=
c_buf_count)
> +{
> +	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> +	struct v4l2_ctrl *ctrl;
> +
> +	if (!fbc_buf_count ||
> +			fbc_buf_count =3D=3D v4l2_m2m_num_dst_bufs_ready(m2m_ctx))
> +		return;
> +
> +	ctrl =3D v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
> +			V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
> +	if (ctrl)
> +		v4l2_ctrl_s_ctrl(ctrl, fbc_buf_count);
> +}
> +
> +

I might have to drop that extra line, but I'll take care.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =C2=A0static int handle_dynamic_resolution_change(struct vpu_instance *in=
st)
> =C2=A0{
> =C2=A0	struct v4l2_fh *fh =3D &inst->v4l2_fh;
> -	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> =C2=A0
> =C2=A0	static const struct v4l2_event vpu_event_src_ch =3D {
> =C2=A0		.type =3D V4L2_EVENT_SOURCE_CHANGE,
> @@ -305,14 +320,6 @@ static int handle_dynamic_resolution_change(struct v=
pu_instance *inst)
> =C2=A0
> =C2=A0	inst->needs_reallocation =3D true;
> =C2=A0	inst->fbc_buf_count =3D initial_info->min_frame_buffer_count + 1;
> -	if (inst->fbc_buf_count !=3D v4l2_m2m_num_dst_bufs_ready(m2m_ctx)) {
> -		struct v4l2_ctrl *ctrl;
> -
> -		ctrl =3D v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
> -		if (ctrl)
> -			v4l2_ctrl_s_ctrl(ctrl, inst->fbc_buf_count);
> -	}
> =C2=A0
> =C2=A0	if (p_dec_info->initial_info_obtained) {
> =C2=A0		const struct vpu_format *vpu_fmt;
> @@ -439,19 +446,24 @@ static void wave5_vpu_dec_finish_decode(struct vpu_=
instance *inst)
> =C2=A0	if ((dec_info.index_frame_display =3D=3D DISPLAY_IDX_FLAG_SEQ_END =
||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 dec_info.sequence_changed)) {
> =C2=A0		unsigned long flags;
> +		u32 fbc_buf_count =3D 0;
> =C2=A0
> =C2=A0		spin_lock_irqsave(&inst->state_spinlock, flags);
> =C2=A0		if (!v4l2_m2m_has_stopped(m2m_ctx)) {
> =C2=A0			switch_state(inst, VPU_INST_STATE_STOP);
> =C2=A0
> -			if (dec_info.sequence_changed)
> +			if (dec_info.sequence_changed) {
> =C2=A0				handle_dynamic_resolution_change(inst);
> -			else
> +				fbc_buf_count =3D inst->fbc_buf_count;
> +			} else {
> =C2=A0				send_eos_event(inst);
> +			}
> =C2=A0
> =C2=A0			flag_last_buffer_done(inst);
> =C2=A0		}
> =C2=A0		spin_unlock_irqrestore(&inst->state_spinlock, flags);
> +
> +		wave5_update_min_bufs_ctrl(inst, fbc_buf_count);
> =C2=A0	}
> =C2=A0
> =C2=A0	if (inst->sent_eos &&
> @@ -1583,6 +1595,8 @@ static const struct vpu_instance_ops wave5_vpu_dec_=
inst_ops =3D {
> =C2=A0static int initialize_sequence(struct vpu_instance *inst)
> =C2=A0{
> =C2=A0	struct dec_initial_info initial_info;
> +	unsigned long flags;
> +	u32 fbc_buf_count;
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	memset(&initial_info, 0, sizeof(struct dec_initial_info));
> @@ -1605,7 +1619,12 @@ static int initialize_sequence(struct vpu_instance=
 *inst)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	spin_lock_irqsave(&inst->state_spinlock, flags);
> =C2=A0	handle_dynamic_resolution_change(inst);
> +	fbc_buf_count =3D inst->fbc_buf_count;
> +	spin_unlock_irqrestore(&inst->state_spinlock, flags);
> +
> +	wave5_update_min_bufs_ctrl(inst, fbc_buf_count);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -1647,6 +1666,7 @@ static void wave5_vpu_dec_device_run(void *priv)
> =C2=A0		ret =3D initialize_sequence(inst);
> =C2=A0		if (ret) {
> =C2=A0			unsigned long flags;
> +			u32 fbc_buf_count =3D 0;
> =C2=A0
> =C2=A0			spin_lock_irqsave(&inst->state_spinlock, flags);
> =C2=A0			if (wave5_is_draining_or_eos(inst) &&
> @@ -1655,14 +1675,18 @@ static void wave5_vpu_dec_device_run(void *priv)
> =C2=A0
> =C2=A0				switch_state(inst, VPU_INST_STATE_STOP);
> =C2=A0
> -				if (vb2_is_streaming(dst_vq))
> +				if (vb2_is_streaming(dst_vq)) {
> =C2=A0					send_eos_event(inst);
> -				else
> +				} else {
> =C2=A0					handle_dynamic_resolution_change(inst);
> +					fbc_buf_count =3D inst->fbc_buf_count;
> +				}
> =C2=A0
> =C2=A0				flag_last_buffer_done(inst);
> =C2=A0			}
> =C2=A0			spin_unlock_irqrestore(&inst->state_spinlock, flags);
> +
> +			wave5_update_min_bufs_ctrl(inst, fbc_buf_count);
> =C2=A0		} else {
> =C2=A0			set_instance_state(inst, VPU_INST_STATE_INIT_SEQ);
> =C2=A0		}

--=-V+T0VdgJOkIVaYzbxxdY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJOswAKCRDZQZRRKWBy
9AHgAP9K9ZY7zpEUGRKJKiYxo1Xnun9y6cZHwTTEod/51ThYZwEA66vVy1r7WWUb
xkhl5W43ijpS8lnSY7drtVc95OpZCQk=
=uoXh
-----END PGP SIGNATURE-----

--=-V+T0VdgJOkIVaYzbxxdY--

