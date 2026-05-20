Return-Path: <linux-media+bounces-62289-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFs/G4W+DWrH2wUAu9opvQ
	(envelope-from <linux-media+bounces-62289-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:00:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCAA58F389
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6ED423050A6F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCD13D75A0;
	Wed, 20 May 2026 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="enZIu5UC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBC63D8128
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285407; cv=none; b=B4gZ5j+Ealmm6VZwtovnrgwsJlwvkREmr1nDn3Yj0EtmyhHZ3uBfBKZncYS06J5Na4Bozko/OCZ5i1WAuHtWJ39+15JFzx3rfSgJCCLfWZFTbKWVuzC9yFWp0YgZ6hFTGOcDo6YWOPtnmhR4sOvl3ljOE/BoWbKos49rR1c7yuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285407; c=relaxed/simple;
	bh=ts3U0DRr6d9NnETLjnGWPaUJgDNKvjqhIRhVTqEgvZw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oGTPobKFbypgx5sc4Z1QYbRsdcVIxYDhPO1WA+qCeppeFRLD05pGTYC2tLB7jCvzWRCJWif/Kv+iT5lQDI6xdQHBc4+jhDB+F3U+HhrUnr9MOZSbAwz8YBHbEv0O/sRtggLu0WxX3uOLemZNC27HrEzjgZNFT+N9CSSWts5AILo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=enZIu5UC; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-90fc979d84cso321574485a.1
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1779285405; x=1779890205; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6AoVqM70l4U+qYVnKG6rb2UkmbXX7bAvSah0+zZjZcs=;
        b=enZIu5UCXb4MDCvEGooihHC8H3sSl2LVwCsfsOj4WbN8ZHyXiV5z2TBecc9nwqNvyl
         uJFYjTBjjL8Kx+LCF30SxZHTCi0huMPbzDHKl6NYYwE7Kb+iS/xID0Yt8LsWr5RfQqoD
         T5sEZc2HW2hAVf3UPhuTVp5++VrDMM88SjlGtG9WuMVxRH+eY+tH9pGqSafDZQzjW2bn
         CLTYCvq9IWl9z6Z9+nw0yID1B/xOnTPz5ehI3qMic4ppVTNZAEx64DoVdj+SNYRGZLct
         QPHWEqSKp1ammXkHBE5HUdk0G5IvvwtPOxiY3w6fTFVIfHSzROpK0MGykHfv6ovhWXc8
         rSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285405; x=1779890205;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AoVqM70l4U+qYVnKG6rb2UkmbXX7bAvSah0+zZjZcs=;
        b=oIMzn4tZ4EXwLO2MmgYv9PuIJBbjPWG1UNZVftsNSG8JTY1+zKUI3l4sS00g7lLcVC
         AJmCe/rYT+p7XiRct45lN+TnxkYWS8M/kPNSPK2Pfp0d0OOff2bU6wO9FBjqGAiu1tv3
         vkyP9u2okvm5ZCSkM8x3K1BjZHHM+3S9WwsDYzJraWyQpHa2flcRNK41CsAvEZ6LrHIl
         fua4H5q5qeBBiGBS9DqfsqNVoJxTVk5YDy64h6p6CS+hIlKsa7EcuUhKna4Ksn6riRHG
         l/TjaBK9SCK/yrj5YrkgorOW5/yI2fqbKJzgFTRZIE9vNold8S69/7Eoylhd5bEfGQFD
         hetQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tGGSlmVAJmTmWW76/rfSgMsEo/jAJS5kK8XeefY6eQAXiD4QO0yBjMuIuCuDXnQT18h8fv/TjqAd/aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFP/hZBKR67yMXXTH32kfb3biLkJFq9/ri2j1AFi73JgIEbTK
	AmE+jJ8D+2knE1I/ghEJJO+mJNvlR9bNJ9EWk/tMl6W+8GEWQ4xk8ztQZoo4y/WFqCc=
X-Gm-Gg: Acq92OEYzl9KVlLPg0PTQMOzmdEAjnYwFMtc/2ktQqZ7/R3RhLP+lNz4PQWuDdFuuZX
	mJh2ZlomGiv3A5E74N9tibDlY4pKmVzYpoJcah8oeoYOycg1I+BLhGnhdm1EnWRst9ik7BM5Fm/
	9GC0RDf/hUcEvPLaFtBm2JgC2uNJBrXipteMzP61nrMPHOJcnN13fRz6qoon2U0YQ66ARBgwZiK
	jzSWdGzBoKMpSuVWk4PmHiWUIGiQNYJB8Ilka1WJxQ8D6FxCRcvHb7QVgjPzw2We1VKAL8y4EV8
	Dl26Pc3/vOWQuuP/L9HSvVOxEOW6XOMEPFZlzsu+s4Ixe4Y/lx8ocv6d61J0i0tFej4f8lpset6
	cx1S3eVGHxmUuqw1hts/m69TP/0/HXjk6836N/doevTUNQ7hj+rA9+GrZLeuFOkFip1RBM/647k
	XPQyeqhiLapYM5e4c2FoTq35Bn3NLjr2pxw9qIeSBrT9fgxHMnD3TdQtsEtSsVcCxFRZ2o
X-Received: by 2002:a05:620a:4611:b0:912:c0b3:7d9b with SMTP id af79cd13be357-912c0b37ec9mr3183101085a.24.1779285404810;
        Wed, 20 May 2026 06:56:44 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba182535sm2144742585a.8.2026.05.20.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:56:43 -0700 (PDT)
Message-ID: <cae1117b91eb2df890c79b8f914628a38df0e2ce.camel@ndufresne.ca>
Subject: Re: [PATCHv2 2/2] media: vivid: check for vb2_is_busy() when
 toggling caps
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org
Cc: stable@vger.kernel.org, 
	syzbot+dac8f5eaa46837e97b89@syzkaller.appspotmail.com
Date: Wed, 20 May 2026 09:56:43 -0400
In-Reply-To: <ba02852937616394e2f5de34ee2effa0944d7c88.1779266182.git.hverkuil+cisco@kernel.org>
References: <cover.1779266182.git.hverkuil+cisco@kernel.org>
	 <ba02852937616394e2f5de34ee2effa0944d7c88.1779266182.git.hverkuil+cisco@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-BnYdjJtgzWi/l7jlWyDC"
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62289-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco,dac8f5eaa46837e97b89];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,syzkaller.appspot.com:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,collabora.com:email,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: CDCAA58F389
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-BnYdjJtgzWi/l7jlWyDC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 20 mai 2026 =C3=A0 10:36 +0200, Hans Verkuil a =C3=A9crit=C2=A0=
:
> The vivid_update_format_cap/out() functions must only be called if the
> capture/output queue are not busy. But for the controls that select
> the CROP/COMPOSE/SCALE capability that is not checked.
>=20
> Only when streaming starts will they be set to 'grabbed' and it is
> impossible to change the control, but between REQBUFS and STREAMON you
> are still allowed to set these controls. Since vivid_update_format_cap/ou=
t
> will change the format, this can cause unexpected results.
>=20
> Besides adding these checks, also add a WARN_ON in
> vivid_update_format_cap/out() if the queue is busy.
>=20
> I'm 90% certain that this is the cause of this syzbot bug:
>=20
> https://syzkaller.appspot.com/bug?extid=3Ddac8f5eaa46837e97b89
>=20
> But since we never have reproducers, it is hard to be certain. In any cas=
e,
> these checks are needed regardless.
>=20
> Fixes: 73c3f48230cd ("[media] vivid: add the control handling code")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+dac8f5eaa46837e97b89@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Ddac8f5eaa46837e97b89
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/test-drivers/vivid/vivid-ctrls.c=C2=A0=C2=A0 | 12 +++=
+++++++++
> =C2=A0drivers/media/test-drivers/vivid/vivid-vid-cap.c |=C2=A0 6 ++++++
> =C2=A0drivers/media/test-drivers/vivid/vivid-vid-out.c |=C2=A0 6 ++++++
> =C2=A03 files changed, 24 insertions(+)
>=20
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/med=
ia/test-drivers/vivid/vivid-ctrls.c
> index 1077445f5772..a8a134b36720 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -613,14 +613,20 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *c=
trl)
> =C2=A0			vivid_update_reduced_fps(dev);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_HAS_CROP_CAP:
> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> +			return -EBUSY;
> =C2=A0		dev->has_crop_cap =3D ctrl->val;
> =C2=A0		vivid_update_format_cap(dev, true);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_HAS_COMPOSE_CAP:
> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> +			return -EBUSY;
> =C2=A0		dev->has_compose_cap =3D ctrl->val;
> =C2=A0		vivid_update_format_cap(dev, true);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_HAS_SCALER_CAP:
> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> +			return -EBUSY;
> =C2=A0		dev->has_scaler_cap =3D ctrl->val;
> =C2=A0		vivid_update_format_cap(dev, true);
> =C2=A0		break;
> @@ -1117,14 +1123,20 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl =
*ctrl)
> =C2=A0
> =C2=A0	switch (ctrl->id) {
> =C2=A0	case VIVID_CID_HAS_CROP_OUT:
> +		if (vb2_is_busy(&dev->vb_vid_out_q))
> +			return -EBUSY;
> =C2=A0		dev->has_crop_out =3D ctrl->val;
> =C2=A0		vivid_update_format_out(dev);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_HAS_COMPOSE_OUT:
> +		if (vb2_is_busy(&dev->vb_vid_out_q))
> +			return -EBUSY;
> =C2=A0		dev->has_compose_out =3D ctrl->val;
> =C2=A0		vivid_update_format_out(dev);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_HAS_SCALER_OUT:
> +		if (vb2_is_busy(&dev->vb_vid_out_q))
> +			return -EBUSY;
> =C2=A0		dev->has_scaler_out =3D ctrl->val;
> =C2=A0		vivid_update_format_out(dev);
> =C2=A0		break;
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/m=
edia/test-drivers/vivid/vivid-vid-cap.c
> index 76e0b161c049..e20449084709 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> @@ -391,6 +391,12 @@ void vivid_update_format_cap(struct vivid_dev *dev, =
bool keep_controls)
> =C2=A0	struct v4l2_bt_timings *bt =3D &dev->dv_timings_cap[dev->input].bt=
;
> =C2=A0	u32 dims[V4L2_CTRL_MAX_DIMS] =3D {};
> =C2=A0
> +	/*
> +	 * This resets the format, so must never be called while vb2_is_busy().
> +	 */
> +	if (WARN_ON(vb2_is_busy(&dev->vb_vid_cap_q)))
> +		return;
> +
> =C2=A0	switch (dev->input_type[dev->input]) {
> =C2=A0	case WEBCAM:
> =C2=A0	default:
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/m=
edia/test-drivers/vivid/vivid-vid-out.c
> index 8c037b90833e..23e1d5a189ee 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
> @@ -214,6 +214,12 @@ void vivid_update_format_out(struct vivid_dev *dev)
> =C2=A0	unsigned size, p;
> =C2=A0	u64 pixelclock;
> =C2=A0
> +	/*
> +	 * This resets the format, so must never be called while vb2_is_busy().
> +	 */
> +	if (WARN_ON(vb2_is_busy(&dev->vb_vid_out_q)))
> +		return;
> +
> =C2=A0	switch (dev->output_type[dev->output]) {
> =C2=A0	case SVID:
> =C2=A0	default:

--=-BnYdjJtgzWi/l7jlWyDC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag29mwAKCRDZQZRRKWBy
9BrOAQDKrHnTjk3eMBXGWR0ThQbDvPgqB619//sIz2aIseBNVQD/cKgdId+LpSva
HIpSWby4TPk3Oi1KCvkA3DjiUCuFsQM=
=w5Kf
-----END PGP SIGNATURE-----

--=-BnYdjJtgzWi/l7jlWyDC--

