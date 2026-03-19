Return-Path: <linux-media+bounces-56370-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKYnAoRQvGkXwwIAu9opvQ
	(envelope-from <linux-media+bounces-56370-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:37:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 632A72D1B92
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8CE8317B025
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D743E0C66;
	Thu, 19 Mar 2026 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="b8cRrGJz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797630EF82
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 19:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773948960; cv=none; b=OwdcF6v06YsAHQsyyim5skidbkSZN8SKqkfdfGCvH3pl5ohS4TBjiG7gdHCXXfxK0Qee1Y2Tqcfug4+bF4SShP50FlJcd/qoU75WHm1F79ufwOTEruqwSJgwK3ZQDVcfPxgxck1xw5PqC21koOmxE2cpHlCSBi8C2PISsoyPB+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773948960; c=relaxed/simple;
	bh=BZeeMyg3MgQFLp/o47Mn+Ncd1/GIBnX4UFlw4hnpPtI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PN4VYt0UriikaLYxBZNev6UfpaZv4Wh93r+jay0SLLn554n4o4zyUdAyvrtaRsDCbwYI7f6wRLbeUMlAM3YbQcVB14U7ft/txpVo9PLhHAT/m4QmOOoyLkpkDjt/OcQTX2eD9iXBraHITkpCnxKFpWZ7WW88CQvNxdFXPKK7+YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=b8cRrGJz; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-509217e84a3so11328911cf.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773948957; x=1774553757; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wGpQ4Ug6IKmeHAE5nzee2RgistUShNOIrRfVj3D0dS0=;
        b=b8cRrGJzD96FaMmlWD0FfheDpf+lHVAU32+/7OGq9HALVUJdpueeuGI7DHxTvwq5Qt
         Z2R852L0bbWPQy6G1tgnoGnBOi86o2RzgVee8MQ1xUmbJHlcMB3iszY1gTvOb+XwyrMi
         PHkLYCMMeMwR75pRRoi22barrtDhN88BTJZgyXgipIPL6kxSEs3Klsf6cx8FCqgmLcWN
         /mXtvyucsPEIRY1Nk3106cp/aKEAGmVaIBQZotoDNm5gfR3/5pWfKpaPq4aXes0QEEkz
         u/azfQLwvTZ/+Qp1lzeRXsW7fh41XXR1iae0+CUn1wp5o8FkM52WkY5AUsFII3S9rAna
         8+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773948957; x=1774553757;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGpQ4Ug6IKmeHAE5nzee2RgistUShNOIrRfVj3D0dS0=;
        b=nnCQJqqdkMumMqY1+sdKgsx3158jdLhNRF7UWeuFGgKL8nIiaGtLNVUtT/fZ7zZbpS
         7rbU1xjfs/2ptPBHJ3jyDQH77zC6GSUrvZlQUuxlsW6OgDG3vNxCHf505zzMGQf4gMMJ
         d++qR4UCvKk9v6MeXgFJQUU3Aegq4flNAo7majVCXOVHnF0L2Wtj5pCSWYqRhcYmLVC9
         V4uYFcO0NzYwp/7edaGkPa7Goi9Cuh92Juv844ZwKaGj0JSft5gSfx962XLFnawpCBK1
         JWvkLkmZt6nM3YB+lPfQ0mCi2GQrq954HudK8aNjNYQbXrxHao7wCLN+Kzv3MF7TV+Sq
         f7Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU5vmO66WKtBp24bGYb3hC+UrQ07RxuvCPLMrxAkR9pw+BIkgQ21SVcfPIyLBDWWF8jsE1C8mYfRqzdNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ/hqX25fwePgx8+ZJc/0LjgySVVOVl+SwoFqPQbZxBJgt4W51
	k6wB+3uDBiUDJ0Vuo655Yj40C+aZZCpzBdlgx96d7uAflzaNJQNyw8gg1Ju1k5rnEgM=
X-Gm-Gg: ATEYQzxUohzfR2Xi6mlzwNHwLo/NWxLgDACixLpm0/Jqhe03aJ4WtyQT/1WaXqNjEpM
	ycHiTn54HkTyt8d9iPRBzKbY/RV/G8J1r6k9LD9/sO7TYjrWv6PmDDfR0yneRJj/ylXJ8+qUArp
	8gpW+djgbXWw+qoN1rGyfrlz0dUJHLfGLeRsblWYNhO3ksoq0K7k5qaHvX8M0AWWrWr3PQnSirA
	XU+T0ZnpKTk4cquOBs1cJE7s2OYkMUHM8ShEvNPgjcN5i+AP5Fj36yO9FlpSpGYAw+97L6CVI5i
	i1TrbZhVis67KjGw1GMLKkfQcxki82I4HdyzrLNBQAqS+l8Tt8sVYpwsUdakgbkuaMLg0uKCUt5
	i3ghhuM+xPHsojgliQtt2ejSPuMhXlTARxzXwrdX/UtFK3MGDlwYzdxMe3rZmLCYcpCECCSvDXb
	HdCnnREo6/dfUA9kTegn9GBkddxVOX
X-Received: by 2002:ac8:5ad4:0:b0:509:4294:d18b with SMTP id d75a77b69052e-50b3750273dmr6257911cf.54.1773948957540;
        Thu, 19 Mar 2026 12:35:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36b50fa8sm5980621cf.0.2026.03.19.12.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:35:56 -0700 (PDT)
Message-ID: <f982e176820a443edc63cd5d5c2d4dff409557df.camel@ndufresne.ca>
Subject: Re: [PATCH] media: chips-media: wave5: add missing spinlock
 protection for send_eos_event()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ziyi Guo <n7l8m4@u.northwestern.edu>, Nas Chung
 <nas.chung@chipsnmedia.com>,  Jackson Lee <jackson.lee@chipsnmedia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 	linux-kernel@vger.kernel.org
Date: Thu, 19 Mar 2026 15:35:55 -0400
In-Reply-To: <20260131220323.3296745-1-n7l8m4@u.northwestern.edu>
References: <20260131220323.3296745-1-n7l8m4@u.northwestern.edu>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-xrhDoUDFFqVTsQknfNLA"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56370-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 632A72D1B92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-xrhDoUDFFqVTsQknfNLA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 31 janvier 2026 =C3=A0 22:03 +0000, Ziyi Guo a =C3=A9crit=C2=A0:
> wave5_vpu_dec_buf_queue_dst() and streamoff_output() call send_eos_event(=
)
> without holding inst->state_spinlock. However, send_eos_event() has
> lockdep_assert_held(&inst->state_spinlock) indicating that callers must
> hold this lock.
>=20
> Other callers of send_eos_event() properly acquire the spinlock:
> - wave5_vpu_dec_finish_decode() acquires lock at line 431
> - wave5_vpu_dec_encoder_cmd() acquires lock at line 821
> - wave5_vpu_dec_device_run() acquires lock at line 1592
>=20
> Add spin_lock_irqsave()/spin_unlock_irqrestore() around send_eos_event()
> calls in the VB2 buffer queue and streamoff callbacks to fix the missing
> lock protection.

I'll simply move this paragraph first to follow the imperative mood rules. =
It
effectively endup being, tell us what the patch do first, and explain after=
.

>=20
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../media/platform/chips-media/wave5/wave5-vpu-dec.c=C2=A0 | 11 +++=
+++++++-
> =C2=A01 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index e3038c18ca36..986feff34f22 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1264,13 +1264,17 @@ static void wave5_vpu_dec_buf_queue_dst(struct
> vb2_buffer *vb)
> =C2=A0
> =C2=A0	if (vb2_is_streaming(vb->vb2_queue) &&
> v4l2_m2m_dst_buf_is_last(m2m_ctx)) {
> =C2=A0		unsigned int i;
> +		unsigned long flags;
> =C2=A0
> =C2=A0		for (i =3D 0; i < vb->num_planes; i++)
> =C2=A0			vb2_set_plane_payload(vb, i, 0);
> =C2=A0
> =C2=A0		vbuf->field =3D V4L2_FIELD_NONE;
> =C2=A0
> +		spin_lock_irqsave(&inst->state_spinlock, flags);
> =C2=A0		send_eos_event(inst);
> +		spin_unlock_irqrestore(&inst->state_spinlock, flags);
> +
> =C2=A0		v4l2_m2m_last_buffer_done(m2m_ctx, vbuf);
> =C2=A0	} else {
> =C2=A0		v4l2_m2m_buf_queue(m2m_ctx, vbuf);
> @@ -1413,8 +1417,13 @@ static int streamoff_output(struct vb2_queue *q)
> =C2=A0	inst->codec_info->dec_info.stream_rd_ptr =3D new_rd_ptr;
> =C2=A0	inst->codec_info->dec_info.stream_wr_ptr =3D new_rd_ptr;
> =C2=A0
> -	if (v4l2_m2m_has_stopped(m2m_ctx))
> +	if (v4l2_m2m_has_stopped(m2m_ctx)) {
> +		unsigned long flags;
> +
> +		spin_lock_irqsave(&inst->state_spinlock, flags);
> =C2=A0		send_eos_event(inst);
> +		spin_unlock_irqrestore(&inst->state_spinlock, flags);
> +	}
> =C2=A0
> =C2=A0	/* streamoff on output cancels any draining operation */
> =C2=A0	inst->eos =3D false;

--=-xrhDoUDFFqVTsQknfNLA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxQGwAKCRDZQZRRKWBy
9MieAP0b39H2D97BT6R29VGtH6C/3jxCxoscJ27AhKQSk4LAegEA/owkfT9t6DE7
9iCgiSzOvIIRCL16jhctmD97gAHtngM=
=6trs
-----END PGP SIGNATURE-----

--=-xrhDoUDFFqVTsQknfNLA--

