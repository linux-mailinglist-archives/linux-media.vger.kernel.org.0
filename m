Return-Path: <linux-media+bounces-45068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D6BF2F9A
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D1F94F89B7
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582212D0C70;
	Mon, 20 Oct 2025 18:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TigGdDv5"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7C11DE4E0;
	Mon, 20 Oct 2025 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760985686; cv=none; b=SAJiM6uKQeXuEo3bYl60ZEMOQZJiBasqbSSkkIQhCMkY1OxzsuAi1qNfNg5VF9CmA/3b3mMbxuO6UlqWKk9u3FJUVPNT4PlKtZnJUptvQJWqXQt8SESJfw7V/9c09Oyx6qqgJ/C/wfYuA9NydJKPSrY+vQ5YOw1DAzyiQ0en1JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760985686; c=relaxed/simple;
	bh=hZJILtLteSj2LepuA0aJL6fLxq6as3qlJoh2rFNSNdk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NPT8KOi26obzi/RkLK2H1j72CRJxU8D95hZQl0pz8IrRfIcScEXOVx6QSEYIJsDvbW4Tv466SixH2hFYb7Nl3GatyoY0GRz5ynyK01ITTQ6OgXzHLk0Pf6VPjqAlYIOGbrGQyY0pwQphBAuINkfcliCJ2vjDKZ2D55sFWATmWVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TigGdDv5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760985681;
	bh=hZJILtLteSj2LepuA0aJL6fLxq6as3qlJoh2rFNSNdk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=TigGdDv5uIgv0Cp8Hftxt+zbovjBpqStpxJD59gDL4pi0UaKcv+mx5TJBfOU5WqG/
	 sKli5Ocek7Y7kwSdP3xIiIiz2sbW4IXhVlllUlA64yoEFxplfFTvAy5+NE199d++D1
	 IMDYf/7/JBcKBqKMmrhWZJszq1GBdtOQaSYnupP3f6KBpiJudllSI1MSnD9nO5Hsxk
	 OzAHawHg+plRJdtm7ytX5AqLFPsJgqeE32I7Cx/HLhyKYvm65DaDm/uIKy1Rrli6e5
	 Yz+J2gBBg0Tjl9PvKPDmTVsjjxSVUVwD2PM8CQ43qYayVDc/MHCBJqLTgMJ7p+RkKS
	 2TT1BtNau4QfA==
Received: from [IPv6:2606:6d00:17:ebd3::c41] (unknown [IPv6:2606:6d00:17:ebd3::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E726817E1278;
	Mon, 20 Oct 2025 20:41:20 +0200 (CEST)
Message-ID: <351e25ea533c440e3fa5131fe44796f66bc4ff82.camel@collabora.com>
Subject: Re: [PATCH] media: chips-media: wave5: Fix Hang in Encoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Brandon Brnich <b-brnich@ti.com>, Nas Chung <nas.chung@chipsnmedia.com>,
  Jackson Lee <jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Darren Etheridge <detheridge@ti.com>
Date: Mon, 20 Oct 2025 14:41:18 -0400
In-Reply-To: <20251020173332.2271145-1-b-brnich@ti.com>
References: <20251020173332.2271145-1-b-brnich@ti.com>
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
	protocol="application/pgp-signature"; boundary="=-dC5SmXZi2xGvk8PfdOmS"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-dC5SmXZi2xGvk8PfdOmS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brandon,


Le lundi 20 octobre 2025 =C3=A0 12:33 -0500, Brandon Brnich a =C3=A9crit=C2=
=A0:
> Wave5 encoder driver only changed states to PIC_RUN in start streaming by
> making the assumption that VIDIOC STREAMON call has already been called.
> In frameworks like FFMPEG, this condition has not been met when in the
> start streaming function resulting in the application hanging. Therefore,
> job_ready and device_run need to be extended to have support for this cas=
e.

I'm afraid you will have to rework that commit message in V2, I could not m=
ake
much sense out of it. See comments below, but by spliting your patch, it mi=
ght
get easier to explain what you are trying to fix.

>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
> =C2=A0.../chips-media/wave5/wave5-vpu-enc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 74 +++++++++++++------
> =C2=A01 file changed, 51 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index a02853d42d61..3a3b585ceb8e 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -705,6 +705,11 @@ static int wave5_vpu_enc_encoder_cmd(struct file *fi=
le, void *fh, struct v4l2_en
> =C2=A0
> =C2=A0		m2m_ctx->last_src_buf =3D v4l2_m2m_last_src_buf(m2m_ctx);
> =C2=A0		m2m_ctx->is_draining =3D true;
> +
> +		if (v4l2_m2m_num_dst_bufs_ready(m2m_ctx) > 0) {

Its job_ready callback and framework task to check this, I think you can go
directly to try to schedule.

> +			dev_dbg(inst->dev->dev, "Forcing job run for draining\n");
> +			v4l2_m2m_try_schedule(m2m_ctx);

This is fair, and the decoder does the same. Though, it has nothing to do w=
ith
the transition from OPEN -> SEQ_INIT -> PIC_RUN. Do this in its own commit =
with
its own explanation.

> +		}
> =C2=A0		break;
> =C2=A0	case V4L2_ENC_CMD_START:
> =C2=A0		break;
> @@ -1411,6 +1416,34 @@ static int prepare_fb(struct vpu_instance *inst)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static int wave5_vpu_enc_prepare_cap_seq(struct vpu_instance *inst)
> +{

Factor-out in its own commit, with a message this is preparation work and w=
ith
no function changes. Its really hard to review code that moves around and m=
ay
have changes in it.

> +	int ret =3D 0;
> +
> +	ret =3D initialize_sequence(inst);
> +	if (ret) {
> +		dev_warn(inst->dev->dev, "Sequence not found: %d\n", ret);
> +		return ret;
> +	}
> +	ret =3D switch_state(inst, VPU_INST_STATE_INIT_SEQ);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The sequence must be analyzed first to calculate the proper
> +	 * size of the auxiliary buffers.
> +	 */
> +	ret =3D prepare_fb(inst);
> +	if (ret) {
> +		dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D switch_state(inst, VPU_INST_STATE_PIC_RUN);
> +
> +	return ret;
> +}
> +
> =C2=A0static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsig=
ned int count)
> =C2=A0{
> =C2=A0	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> @@ -1453,27 +1486,8 @@ static int wave5_vpu_enc_start_streaming(struct vb=
2_queue *q, unsigned int count
> =C2=A0		if (ret)
> =C2=A0			goto return_buffers;
> =C2=A0	}
> -	if (inst->state =3D=3D VPU_INST_STATE_OPEN && m2m_ctx->cap_q_ctx.q.stre=
aming) {
> -		ret =3D initialize_sequence(inst);
> -		if (ret) {
> -			dev_warn(inst->dev->dev, "Sequence not found: %d\n", ret);
> -			goto return_buffers;
> -		}
> -		ret =3D switch_state(inst, VPU_INST_STATE_INIT_SEQ);
> -		if (ret)
> -			goto return_buffers;
> -		/*
> -		 * The sequence must be analyzed first to calculate the proper
> -		 * size of the auxiliary buffers.
> -		 */
> -		ret =3D prepare_fb(inst);
> -		if (ret) {
> -			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
> -			goto return_buffers;
> -		}
> -
> -		ret =3D switch_state(inst, VPU_INST_STATE_PIC_RUN);
> -	}
> +	if (inst->state =3D=3D VPU_INST_STATE_OPEN && m2m_ctx->cap_q_ctx.q.stre=
aming)
> +		ret =3D wave5_vpu_enc_prepare_cap_seq(inst);
> =C2=A0	if (ret)
> =C2=A0		goto return_buffers;
> =C2=A0
> @@ -1598,6 +1612,14 @@ static void wave5_vpu_enc_device_run(void *priv)
> =C2=A0
> =C2=A0	pm_runtime_resume_and_get(inst->dev->dev);
> =C2=A0	switch (inst->state) {
> +	case VPU_INST_STATE_OPEN:
> +		ret =3D wave5_vpu_enc_prepare_cap_seq(inst);
> +		if (ret) {
> +			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
> +			switch_state(inst, VPU_INST_STATE_STOP);
> +			break;
> +		}
> +		fallthrough;
> =C2=A0	case VPU_INST_STATE_PIC_RUN:
> =C2=A0		ret =3D start_encode(inst, &fail_res);
> =C2=A0		if (ret) {
> @@ -1633,6 +1655,12 @@ static int wave5_vpu_enc_job_ready(void *priv)
> =C2=A0	case VPU_INST_STATE_NONE:
> =C2=A0		dev_dbg(inst->dev->dev, "Encoder must be open to start queueing M=
2M jobs!\n");
> =C2=A0		return false;
> +	case VPU_INST_STATE_OPEN:
> +		if (wave5_vpu_both_queues_are_streaming(inst)) {
> +			dev_dbg(inst->dev->dev, "Both queues have been turned on now, M2M job=
 can occur\n");
> +			return true;
> +		}
> +		return false;
> =C2=A0	case VPU_INST_STATE_PIC_RUN:
> =C2=A0		if (m2m_ctx->is_draining || v4l2_m2m_num_src_bufs_ready(m2m_ctx))=
 {
> =C2=A0			dev_dbg(inst->dev->dev, "Encoder ready for a job, state: %s\n",
> @@ -1642,9 +1670,9 @@ static int wave5_vpu_enc_job_ready(void *priv)
> =C2=A0		fallthrough;
> =C2=A0	default:
> =C2=A0		dev_dbg(inst->dev->dev,
> -			"Encoder not ready for a job, state: %s, %s draining, %d src bufs rea=
dy\n",
> +			"Encoder not ready for a job, state: %s, %s draining, %d src bufs rea=
dy, %d dst bufs ready\n",
> =C2=A0			state_to_str(inst->state), m2m_ctx->is_draining ? "is" : "is not=
",
> -			v4l2_m2m_num_src_bufs_ready(m2m_ctx));
> +			v4l2_m2m_num_src_bufs_ready(m2m_ctx), v4l2_m2m_num_dst_bufs_ready(m2m=
_ctx));
> =C2=A0		break;
> =C2=A0	}
> =C2=A0	return false;

Perhaps its going to be clear with proper commit message, but I'm still not
clear how you can endup with both queues streaming without two calls to
wave5_vpu_enc_start_streaming(). I don't deny the condition might be broken
then, but the intent is for this code to bring the driver to PIC_RUN on the
second call.

=46rom VPU_INST_STATE_NONE:

Case 1:
   STREAMON(CAP)
   	- bring it to OPEN state
   STREAMON(OUT)
   	- Initialize the sequence and prepare the FB
   	- Leaving with PIC_RUN state


Case 2:
   STREAMON(OUT)
   	- no-op
   STREAMON(CAP)
   	- To OPEN
   	- To INIT_SEQ
   	- To PIC_RUN
  =20

So in case 2, the code fails this condition:

	if (inst->state =3D=3D VPU_INST_STATE_OPEN && m2m_ctx->cap_q_ctx.q.streami=
ng) {


Basically type =3D=3D CAP, and vb2 won't be setting the .streaming state be=
fore this
function returns. A possible solution would be:

	if (inst->state =3D=3D VPU_INST_STATE_OPEN &&
	    (m2m_ctx->cap_q_ctx.q.streaming || type =3D=3D V4L2_BUF_TYPE_VIDEO_CAP=
TURE_MPLANE)) {

cheers,
Nicolas

--=-dC5SmXZi2xGvk8PfdOmS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaPaCTgAKCRDZQZRRKWBy
9BHtAP9wT6pGfGQmbY9ahgneq9FbK3McmyJAS5GoT47mauO2fAEA3P6WiOBPSjWU
3twsNYiTWc9kFvrNgVLjzwwBYolwQQ0=
=Pxcs
-----END PGP SIGNATURE-----

--=-dC5SmXZi2xGvk8PfdOmS--

