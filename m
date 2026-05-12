Return-Path: <linux-media+bounces-61309-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHwXIIpnA2qa5gEAu9opvQ
	(envelope-from <linux-media+bounces-61309-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 19:46:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0ED52617D
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 19:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C94FE3083A93
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0033E075D;
	Tue, 12 May 2026 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="mEv+zTkN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1E53D5C06
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607997; cv=none; b=cHPkfZkq6xCoh8jSUF0XbNNRVvMLs02jAkSi+2qyYD5ByuwE8b5bwxl+cO4THs8wh/R3GtexLZUNUtrLI//B4+xuyKLj6Exy/gGa1Zd7Sp/uP66rSZ6yGPVxxVrVv+BXv8GI7KzLZelLd7h0gKhoYWa3e+5pg9OFwjq3i38uSBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607997; c=relaxed/simple;
	bh=Y3LXvkfeP40YhnuQMi3EnRdvaOPX/0EUrPKaHasgNRs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rqBlsttaIBNbCMQBk45o7vUBIDlcqCIB6eIguzGIhXgwafS7JHCv3v6wH2enX5Ww5YIQfgpCyY+ISjUV5mXIBc6TOfMNaC1mSJqCH3nAGSSvgU3ap+CdQvXGUKus0L4w4TtXKt8X37PvnEkYw22S2T9vfQ3bVVp6ijh+cZZhwCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=mEv+zTkN; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-90ea08cc5ceso63363885a.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778607994; x=1779212794; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jP9tWH7lEqQ6vi1mfPA7yERZk2UiFb9oifwgNqskWVM=;
        b=mEv+zTkNLkU6P4fPBt7+tEQuJPbvwGQkxZHdi4OQOJhwgeRE+fFNqgY0KvYpZJV6iF
         XRogm2avMGZyZZwZdbsfMg8BZrP/ssIIl61HggfjfjuluIcP3GSgc0H8fBoKdBBn4qFI
         C4xBSJDg6L+LGgF2fwzXvd54OnFsPAQAUoalEJVOvzgFlXeo02OMv8f782S25Kxto2se
         MLP7+Ii9u4GxHo05ZsTUI8zA2TXzlV+djmuzTWWfAct7mr3RtTXKw0GAzidgMKcubKow
         96b8dGEXnsil7bE/RL0NbrG4LMJFibXcz1tHHxT017XKx/yTmlYqoqrz5L2pTnpcFeJD
         FTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778607994; x=1779212794;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jP9tWH7lEqQ6vi1mfPA7yERZk2UiFb9oifwgNqskWVM=;
        b=oYFZ28V6L951glN3xmsf/b003T7lcZPSaJDVQU/6J79/2oD9YmNtZtSILPdn8crkxY
         VM3NL6Y0BCiBDhwZ0DIQLFoQGeTljQ8mrEAU/2yVmVfoRKwMMKeStNpcW4lfGw3iQVIi
         fizVWc2reVsICLQnjsLoyuH72MldV2FeT5sKEp1GU3ILIoVgFNuiGK34t8LIQTgavQHp
         +OduzoP+Z5rJNZpxwbVLdahpdYRiJa3NvBqSjkCweVvFGyIHG2qhCJ0L1yFEbhkCHqFU
         8yvx39/QzgRz1stqRB3cmIDehqoLgJii2mdHSk1FTKF4BQOlBZLu7t/d8nLqiTJSY8qD
         szaQ==
X-Gm-Message-State: AOJu0YwM2sa24RFF6kPE8YUe9O9nvNWCnWvwhgFROJw6Qt1iEGG7g4VK
	7e/7QnUQGD0p7x/2kAlIldwU9O4k7DkrtRWYAZgrqydrvwisZ/GxhPBT3rUrs92rFCQ=
X-Gm-Gg: Acq92OGzOa7UNAbDDCzyuHVgiTJXTgzq4HQbg+uRmf/QIDepUA7VRTEmkFTBLrGUzKB
	StzHvWePzweB0e6mF/JuGaPD/IS3oq4vXMvl6GoZPRZ27h3Smhu1UkLXxqsE7HB/c4g4nrzx2BS
	v1DVtpzBYStLdMo6BrzWaUAqvcB+L8ggUUYan7R4BAIvA0UQXKqsF8Syn0sCX/f7WXmjhvBiuCJ
	qj0iD9I8hS98XF/mclIRCSU6dGi8XRnnepQ5Fl23apBR8LTXQnwNX1eonaIrb+kr7qU+VY/aTjB
	jxN40OD5Kp5ZugNL5uo5qO5FVfvX10IRoJwN6dNq42WRECByckAg3mjkRdoZq2fYf+Ex6eMc9l2
	HwquWrSPQD26n3aDQC0NEIhTsKNscjC/Qed9Y+EX9nxZA0oOZon0/In0KWpeKcnLDmXJOTkiXXK
	VYlRLswyeWG36XOUZynmN34yWetx5s2TJwp+XWbvI=
X-Received: by 2002:a05:620a:4608:b0:8f8:8860:fbad with SMTP id af79cd13be357-90cfe7d673fmr552242385a.57.1778607994443;
        Tue, 12 May 2026 10:46:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87bd588sm1543591985a.29.2026.05.12.10.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:46:33 -0700 (PDT)
Message-ID: <ba485144c4d469c834b0f65ed3ce753a331e207a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rzv2h-ivc: Wait for frame end in stop_streaming
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally	
 <dan.scally@ideasonboard.com>, =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?=	
 <barnabas.pocze@ideasonboard.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Jacopo Mondi
	 <jacopo.mondi+renesas@ideasonboard.com>, stable@vger.kernel.org
Date: Tue, 12 May 2026 13:46:31 -0400
In-Reply-To: <20260401-ivc-stop-streaming-v1-1-b7599982c280@ideasonboard.com>
References: <20260401-ivc-stop-streaming-v1-1-b7599982c280@ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-8KgwzaVvsr4d37d+Iy32"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: DE0ED52617D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-61309-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,10bit:email,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action


--=-8KgwzaVvsr4d37d+Iy32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 01 avril 2026 =C3=A0 17:35 +0200, Jacopo Mondi a =C3=A9crit=C2=
=A0:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>=20
> The rzv2h-ivc driver fails to handle back-2-back streaming sessions that
> do not go through a peripheral reset. As the driver uses an autosuspend
> delay of 2 seconds, it is quite possible that two consecutive streaming
> sessions won't go through a suspend/resume sequence.
>=20
> If the peripheral is not reset the second streaming session hangs and no
> frames are delivered to the ISP.
>=20
> This is because the stop_streaming() procedure implemented in the driver
> doesn't match what's prescribed by the chip datasheet:
>=20
> 1) The chip manual suggests to poll the RZV2H_IVC_FM_INT_STAT_STPEND bit
> =C2=A0=C2=A0 of RZV2H_IVC_REG_FM_INT_STA instead of polling on RZV2H_IVC_=
REG_FM_STOP
> =C2=A0=C2=A0 and prescribes to clear the bit after polling has completed
>=20
> 2) More importantly: the RZV2H_IVC_REG_FM_STOP_FSTOP bit has to be set
> =C2=A0=C2=A0 on RZV2H_IVC_REG_FM_STOP -only- if a frame transfer to the I=
SP is in
> =C2=A0=C2=A0 progress. Setting the RZV2H_IVC_REG_FM_STOP_FSTOP bit when n=
o frame is
> =C2=A0=C2=A0 being transferred causes the polling routine to timeout and =
the next
> =C2=A0=C2=A0 streaming session fails to start
>=20
> As a frame transfer of an image in 1920x1080@10bi takes 5 milliseconds
> at most, it is quite possible that the frame transfer completion interrup=
t
> races with the stop procedure.
>=20
> Instead of forcing a frame transfer abort, simply wait for the
> in-progress transfer to complete by polling the ivc->vvalid_ifp status
> variable in an hand-rolled loop that allows to inspect the variable
> while holding the spinlock, to allow the irq handler to complete the
> current buffer.
>=20
> With this change, streaming back-2-back without suspending the
> peripheral works successfully.
>=20
> Cc: stable@vger.kernel.org
> Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control bl=
ock
> driver")
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
> As detailed in the commit message, re-starting a streaming session
> without going through a peripheral reset doesn't currently work.
>=20
> I initially thought this is because the stop_streaming() procedure
> implemented in the rzv2h-ivc driver does not comply with what is
> prescribed by the chip manual.
>=20
> So I went and modified it according to the manual.
>=20
> Unfortunately, even by following the suggested procedure, once
> RZV2H_IVC_REG_FM_STOP is set and a forceful frame transfer abort is
> started, the RZV2H_IVC_FM_INT_STAT_STPEND bit takes a long time to
> clear, during which is most often times the case the current in-progress
> transfer completes by itself. If this happen, then a peripheral
> reset is required to restart streaming regardless if I forcefully clear
> the RZV2H_IVC_REG_FM_STOP_FSTOP and RZV2H_IVC_FM_INT_STAT_STPEND bits.
>=20
> I have tried several strategies to properly forcefully stop an
> in-progress transfer and handle the potential race betwee the
> transfer-complete irq and the polling the RZV2H_IVC_REG_FM_INT_STA
> register (which could potentially sleep), but it's still quite easy to
> get races between frame completion and the forced stop procedure unless
> I hold on to the ivc->spinlock preventing the irq handler to run.
>=20
> Once I timed the transfer time for a 1920x1080@10bit frame to 5 milli-sec=
onds
> at most I decided to simply wait for the current in-progress transfer to
> complete, as this seems the most reliable way to be able to re-start
> streaming without resetting the peripheral.
> ---
> =C2=A0.../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c=C2=A0=C2=A0 | 31 +=
+++++++++++++++++---
> -
> =C2=A01 file changed, 26 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> index b167f1bab7ef..932fed38cf3f 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -297,12 +297,33 @@ static int rzv2h_ivc_start_streaming(struct vb2_que=
ue
> *q, unsigned int count)
> =C2=A0static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
> =C2=A0{
> =C2=A0	struct rzv2h_ivc *ivc =3D vb2_get_drv_priv(q);
> -	u32 val =3D 0;
> +	unsigned int loop =3D 5;
> =C2=A0
> -	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP,
> RZV2H_IVC_REG_FM_STOP_FSTOP);
> -	readl_poll_timeout(ivc->base + RZV2H_IVC_REG_FM_STOP,
> -			=C2=A0=C2=A0 val, !(val & RZV2H_IVC_REG_FM_STOP_FSTOP),
> -			=C2=A0=C2=A0 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
> +	/*
> +	 * If no frame transfer is in progress, we're done, otherwise, wait
> for
> +	 * the transfer to complete.
> +	 *
> +	 * Transferring a 1920x1080@10bit frame to the ISP takes less than 5
> +	 * msec so sleep for 2.5 msec (+- 25%) and give up after 5 attempts.
> +	 */
> +	for (; loop > 0; loop--) {
> +		unsigned int vvalid_ifp;
> +
> +		/*
> +		 * Inspect the ivc->vvalid_ifp variable holding the spinlock
> not
> +		 * to the race with the rzv2h_ivc_buffer_done() call in the
> irq
> +		 * handler.
> +		 */
> +		scoped_guard(spinlock_irq, &ivc->spinlock) {
> +			vvalid_ifp =3D ivc->vvalid_ifp;
> +		}
> +		if (vvalid_ifp < 2)
> +			break;
> +
> +		fsleep(2500);
> +	}
> +	if (!loop)
> +		dev_err(ivc->dev, "Failed to stop streaming\n");

Would simply using vb2_wait_for_all_buffers() worked for your use case ? Or=
 does
RZV2H_IVC_REG_FM_STOP mask off IRQ causing buffers to never be signalled ?

> =C2=A0
> =C2=A0	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
> =C2=A0	video_device_pipeline_stop(&ivc->vdev.dev);
>=20
> ---
> base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
> change-id: 20260331-ivc-stop-streaming-2c992277b050
>=20
> Best regards,

--=-8KgwzaVvsr4d37d+Iy32
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagNndwAKCRDZQZRRKWBy
9Fl5AQDbDPP5l66uW59iOzFARn4kwcdklC3/keZpGJzbWJ2ZkwD+PDGlwkBonyGD
mFsO08OF7Quw08qvOTFUjlPf8pSOIgw=
=yuTG
-----END PGP SIGNATURE-----

--=-8KgwzaVvsr4d37d+Iy32--

