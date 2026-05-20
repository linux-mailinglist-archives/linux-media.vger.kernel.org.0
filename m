Return-Path: <linux-media+bounces-62288-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNVeMyS9DWrH2wUAu9opvQ
	(envelope-from <linux-media+bounces-62288-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:54:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AF73358F20B
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37D9B3008D51
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B723DFC60;
	Wed, 20 May 2026 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="ciBt23um"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4846C3A8FE8
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285264; cv=none; b=q+dDvhzJpG2euzJUz0tMbvyUpRHi4vUNaob5g3SBo4vtCIfwUiqdM8EjmlQt8WQAY2TcQ6Xk9fbbe2Y+gM/waPXfr2DQl/n4sDD+Kc9xlQ5ZpRsSvJZOlmQdVezlxFmqcX0mpjzO/AsJTUUiKkQKINuTK1fq+ww2IVhcHFJtQSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285264; c=relaxed/simple;
	bh=ZGHvqE8L/Q1fMf/MBC3tcVavJJOuOsPEetD3I3j6tyY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QgsTgMFnXMoC8WZBdJ+czcjZIyy900Ru1uAtZi/5lXuUTaOE426WDP1yU/0QHtIVASqtAPKkW+gMH4w8KFN1jH0CVhELjEW8EoSbiVy40p5E9tmY3BA11aex8+ZqvpGTVdGB8QTbNqrnZcO8aPxg4+Sy3c13WdD322Cb4tJ2qR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=ciBt23um; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8b7dccd6fe4so46956366d6.1
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1779285262; x=1779890062; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hq5fEQOH+rWn5qAZ1QCeqnZS/zieBLWV7YFbGZF1rVs=;
        b=ciBt23umUcRgY9fIvPqb5z5RklszoTnKHYmnJz+/tmnUjWvFI7U3QjZQUNbeIOnvcp
         2iyQ5aLL21sNKD8zwB7Vq+R93d8SRZclHKk53QqIsRDwr0r0bnAH0wQRONSzLwQqGFg2
         EuRK16ayEMypxn0oMcEhzQi0i4eN1w/vM+engVi8h64gz+4IDn2pWMDChfTOdz+gm2WY
         42tzwP0emUU13d8vrLFSpUjTZEFW6srcn8+Wxt9iYUhz7bVbc90PkG8bpc/4UiLfafvV
         kcgjGP5p0HmxE/z0I4KO5M85wKoG2rGr7YUyNsEenz222Cn2/AAqTL49AfsDh2S9a5ge
         S43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285262; x=1779890062;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hq5fEQOH+rWn5qAZ1QCeqnZS/zieBLWV7YFbGZF1rVs=;
        b=XUdlqMWJOEauc5LNPKFbplFrpgrMveF0C9Bd4X95oi6meGZICIsilT2B7MtTh78KTO
         CS1bWGsPDybqRA70G5UIBIDhMOr+/hFsd7HEN1Qxr3aKqj23oIxGJ+nNdGI7CVjlO9U8
         BXnqKk0F3JC/iifo1wcyThX/zDelgXZFgmjGfkLF085hjIHfJIgxEaJRp2Qg1GkYwpPK
         piBBJGRlXZXX3J8vZ2yW8X+OuGRLIqRyfudzOBs59d0BRVl+HhctySe/v/0EqPT+oTZV
         yEEWxGw9Tb82gaqjSV5c01TZN3whpVPaoj4wDengmI21M+xUsdP5Hm1zkz51K8wInuiO
         Ksvg==
X-Forwarded-Encrypted: i=1; AFNElJ/Z/1qsPw/jLysNR+jU7SxXeiTcyJINW5PyyuUtqhRgX0612eL9eFztHwvwawPTOeRQs/ewCOfDDDXK5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUouSe5rKO/NHg1SORZGXuX+KSHEpBac3wb8X/NZzUEbG6EvJ4
	pwYI6guM+v6kx3V/S4YOmw3oDS4eTzwhn5ByA0jgwwxV7fAc5S1WkEla9YiObUMPI2Adf1HPjwQ
	rlkot0Qg=
X-Gm-Gg: Acq92OHoZZHsMvmqBUppxFuWIg2XLNIONraShvhZ3OjXJrEZiPDi+FAUtRGaE69N0LW
	AVJX572cNKUPtLXJE3x/UkOcGcGpZMIYeWIVJuKak8UMtmp+JEWoqtmZt3kpQElfKLc5/u+HR4D
	dMKksSJ+0Dwja9rnNL8ap0ooECvcpq6X7FK9QzsCl2Z0W3TWAxvVsNSU214gJ/bsyf7aqJdNe2A
	bHwx+Dzl1SBoPuXceKe790YZIRbYsQCYNxk7D9hOAPrCZ9RESruW2jHGoO8545ptD/ChXTaW2Hc
	ietiMEzt1b5uRiQsqdybYqNCJcBKA8v6q7B0rv5bDb/m9CFJqQeCr3PnhKXXwfGv3efUjQx6y3i
	mPGOVxBCzHrYvoLbLM1OnRvHXx+/7MmmPPVRmzaVX57TJBJ8s45YA9wgHrynTn0zVu1Yd2vg7n5
	s9yy1e1xc1J5d59ilyhkZzimjn81+ZJDCKlIiheHZ14o4P9npOMR3pO1ZsNec8fFUnczzD
X-Received: by 2002:a0c:f08f:0:b0:8ac:a5bc:a6b4 with SMTP id 6a1803df08f44-8ca0f6f9a59mr308717706d6.36.1779285262109;
        Wed, 20 May 2026 06:54:22 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cbf144a6a1sm24074376d6.49.2026.05.20.06.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:54:21 -0700 (PDT)
Message-ID: <77a8740793ef72b672142000d2be8f6cc87b66f4.camel@ndufresne.ca>
Subject: Re: [PATCHv2 1/2] media: vivid: add vivid_update_reduced_fps()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org
Cc: stable@vger.kernel.org
Date: Wed, 20 May 2026 09:54:20 -0400
In-Reply-To: <f641f5393c2d9bc7893dd224a646d34c4e042660.1779266182.git.hverkuil+cisco@kernel.org>
References: <cover.1779266182.git.hverkuil+cisco@kernel.org>
	 <f641f5393c2d9bc7893dd224a646d34c4e042660.1779266182.git.hverkuil+cisco@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-MFHXNgnVoBlBK5lLkYu9"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62288-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne-ca.20251104.gappssmtp.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,collabora.com:email]
X-Rspamd-Queue-Id: AF73358F20B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-MFHXNgnVoBlBK5lLkYu9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 20 mai 2026 =C3=A0 10:36 +0200, Hans Verkuil a =C3=A9crit=C2=A0=
:
> Don't call vivid_update_format_cap() when switching to/from reduced fps
> for HDMI inputs: that will also reset the format, which is overkill for
> this.
>=20
> Make a new vivid_update_reduced_fps() function that just updates the
> dev->timeperframe_vid_cap.
>=20
> Fixes: c79aa6aeadb0 ("[media] vivid-capture: add control for reduced fram=
e rate")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../media/test-drivers/vivid/vivid-ctrls.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 +-
> =C2=A0.../media/test-drivers/vivid/vivid-vid-cap.c=C2=A0 | 32 +++++++++++=
--------
> =C2=A0.../media/test-drivers/vivid/vivid-vid-cap.h=C2=A0 |=C2=A0 1 +
> =C2=A03 files changed, 22 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/med=
ia/test-drivers/vivid/vivid-ctrls.c
> index f94c15ff84f7..1077445f5772 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -609,7 +609,8 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctr=
l)
> =C2=A0		break;
> =C2=A0	case VIVID_CID_REDUCED_FPS:
> =C2=A0		dev->reduced_fps =3D ctrl->val;
> -		vivid_update_format_cap(dev, true);
> +		if (dev->input_type[dev->input] =3D=3D HDMI)
> +			vivid_update_reduced_fps(dev);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_HAS_CROP_CAP:
> =C2=A0		dev->has_crop_cap =3D ctrl->val;
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/m=
edia/test-drivers/vivid/vivid-vid-cap.c
> index b95f06a9b5ae..76e0b161c049 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> @@ -364,6 +364,24 @@ static enum tpg_pixel_aspect vivid_get_pixel_aspect(=
const struct vivid_dev *dev)
> =C2=A0	return TPG_PIXEL_ASPECT_SQUARE;
> =C2=A0}
> =C2=A0
> +void vivid_update_reduced_fps(struct vivid_dev *dev)
> +{
> +	struct v4l2_bt_timings *bt =3D &dev->dv_timings_cap[dev->input].bt;
> +	unsigned int size =3D V4L2_DV_BT_FRAME_WIDTH(bt) * V4L2_DV_BT_FRAME_HEI=
GHT(bt);
> +	u64 pixelclock;
> +
> +	if (dev->reduced_fps && can_reduce_fps(bt)) {
> +		pixelclock =3D div_u64(bt->pixelclock * 1000, 1001);
> +		bt->flags |=3D V4L2_DV_FL_REDUCED_FPS;
> +	} else {
> +		pixelclock =3D bt->pixelclock;
> +		bt->flags &=3D ~V4L2_DV_FL_REDUCED_FPS;
> +	}
> +	dev->timeperframe_vid_cap =3D (struct v4l2_fract) {
> +		size / 100, (u32)pixelclock / 100
> +	};
> +}
> +
> =C2=A0/*
> =C2=A0 * Called whenever the format has to be reset which can occur when
> =C2=A0 * changing inputs, standard, timings, etc.
> @@ -372,8 +390,6 @@ void vivid_update_format_cap(struct vivid_dev *dev, b=
ool keep_controls)
> =C2=A0{
> =C2=A0	struct v4l2_bt_timings *bt =3D &dev->dv_timings_cap[dev->input].bt=
;
> =C2=A0	u32 dims[V4L2_CTRL_MAX_DIMS] =3D {};
> -	unsigned size;
> -	u64 pixelclock;
> =C2=A0
> =C2=A0	switch (dev->input_type[dev->input]) {
> =C2=A0	case WEBCAM:
> @@ -402,17 +418,7 @@ void vivid_update_format_cap(struct vivid_dev *dev, =
bool keep_controls)
> =C2=A0	case HDMI:
> =C2=A0		dev->src_rect.width =3D bt->width;
> =C2=A0		dev->src_rect.height =3D bt->height;
> -		size =3D V4L2_DV_BT_FRAME_WIDTH(bt) * V4L2_DV_BT_FRAME_HEIGHT(bt);
> -		if (dev->reduced_fps && can_reduce_fps(bt)) {
> -			pixelclock =3D div_u64(bt->pixelclock * 1000, 1001);
> -			bt->flags |=3D V4L2_DV_FL_REDUCED_FPS;
> -		} else {
> -			pixelclock =3D bt->pixelclock;
> -			bt->flags &=3D ~V4L2_DV_FL_REDUCED_FPS;
> -		}
> -		dev->timeperframe_vid_cap =3D (struct v4l2_fract) {
> -			size / 100, (u32)pixelclock / 100
> -		};
> +		vivid_update_reduced_fps(dev);
> =C2=A0		if (bt->interlaced)
> =C2=A0			dev->field_cap =3D V4L2_FIELD_ALTERNATE;
> =C2=A0		else
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.h b/drivers/m=
edia/test-drivers/vivid/vivid-vid-cap.h
> index 38a99f7e038e..d08a85927510 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.h
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
> @@ -9,6 +9,7 @@
> =C2=A0#define _VIVID_VID_CAP_H_
> =C2=A0
> =C2=A0void vivid_update_quality(struct vivid_dev *dev);
> +void vivid_update_reduced_fps(struct vivid_dev *dev);
> =C2=A0void vivid_update_format_cap(struct vivid_dev *dev, bool keep_contr=
ols);
> =C2=A0void vivid_update_outputs(struct vivid_dev *dev);
> =C2=A0void vivid_update_connected_outputs(struct vivid_dev *dev);

--=-MFHXNgnVoBlBK5lLkYu9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag29DAAKCRDZQZRRKWBy
9KUlAP4xQh9YF4/ZLi6iBB7tnLlpMphrE75nnFTFprTGzCtnUAD/biRzXxKeLixV
vza8zuP129i9xJJp8Yliz2kXqFGkrAc=
=++18
-----END PGP SIGNATURE-----

--=-MFHXNgnVoBlBK5lLkYu9--

