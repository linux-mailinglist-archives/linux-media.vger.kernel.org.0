Return-Path: <linux-media+bounces-56371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAygBeBQvGkXwwIAu9opvQ
	(envelope-from <linux-media+bounces-56371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:39:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 450082D1BC7
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3C43310D4B0
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1DB3E8662;
	Thu, 19 Mar 2026 19:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="E1OJ8CBd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0553D6CB6
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 19:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773949043; cv=none; b=XMdnqkVYGeL4US/lVgyHdTTE/tCpXkdjyE92W/ylVmunhZL4EF7WN4aeULWBPL5UX+xOjJ9JLJ78F9PPotcwlyC5lgV5Bl/Bp438Fuo2jg5rU6HNs5e/cFus1w4RZcsDgWQffEAmGy3RnrlaIMNIw2IA9WAwIIBdqxQqH1K4Iqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773949043; c=relaxed/simple;
	bh=sIOADePSVJcFuO4fkoyAaxlziMRwltT0JIWZ+psnG1I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s+7erECC1negC3tPV3/ezD2rAKGSgIocqpasD2l5GHsoQo/nOyAj+LjzjnVgpKrp39IiR6oP/W4ii4V+AMilWe2rgl9iBrPaLJLKn6jhoSjGtr81VInBHWruotot3wwLethANWWdsdCyEaZddcICPN+6ztRNHZ1qMgEkRk4FRzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=E1OJ8CBd; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cb5c9ba82bso247301385a.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 12:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773949041; x=1774553841; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=elZwqdgdHAzySAvoZcQHd4H9tUjwDv1eZnaBLEJ7r+s=;
        b=E1OJ8CBdOYLQ1JfngRlTpvHOdb+qQhOefO1tvcosrb/14fz2yiJg7M9hJ04GKp2veM
         O6pXIYxHEWIq6N7/OIrPV+e9wkqojyxFapg58gLNvaQX25Wmnrt9gYhjiUOMWJV0kg8E
         G32jrtOh8vfvbIv5ej4YACI75xGSAUwKjLtdlfVYoQhSObz7Am/SaEKqmAmJI/ymosal
         37LX62YM7wrngm8qsJWSbr66HEi3FKgE4vS/HNRHSrFzzeCSbo0EwBIF5PS52XTv8A8a
         fJa4zIxblrCo2+OJ4EwMqthSLsO99+ctR9oHKHjMrflg4XEPNanlC8fcWPKyDu/OOe5K
         G14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773949041; x=1774553841;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elZwqdgdHAzySAvoZcQHd4H9tUjwDv1eZnaBLEJ7r+s=;
        b=Xz+9eM/QNiC2X+JiREk/47+OWP0Fh0ak9jgL3LtwspFAJYygBLGagwM3IkZLf76hgi
         pd1K2YTkCgxVMFiTQ/Crxv1b+znBK/NOzjA5WzBqyD/seU1f0Nj++ZRnUWe7QLOz/q6w
         YbZj46yj3rWu16vZwTKMOkqw3pHpHoKKF2U7LiKJ+2I29ptZcyuN2zAcXKo1l37DhYWd
         QrIzaDqspAfY68qIEo30HGuWL9AaQ2PPOmB5vh5q8jxc86k7+9zdP7HoJka1+uOg6m7G
         dzOsatr4kEnpXe7Slwuh/7ozhYTmzO4RQQ9uWFWJtuVf+vFYbmztJwzvysmu0shra9VD
         szvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL9y+kn1SldStwiG/2PWoI56QLlUV33aLL8BzGt76ugZuFGtD3NCOdDUHwZlBkqx0u/fB6d2nVqMj9ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMPYnOmZ7sac3l7pkGx6kIzoP9caC8w7g1/5kkKbJQhLloJIK3
	4UEtgIGSHkpMdqWZM7hd1Sx7JP/KIe68odaAwsZrq9ywzD0XlSrPVzUxAzqtNoBX6mc=
X-Gm-Gg: ATEYQzxfG8t+/EPoA9RWP4JlydCEOPKrBcnNZxIJNGnA7Rtsm/fyT64xfVacdbX9H69
	ye6I4FiPqNjxuWrTyClGqQZU4TeTLJMhAAM1QfSeNCMhf07XO4Shzs9RcBNuoP47m1pvbBrvscK
	ymuXFkLr4Bi7K2oyFPBin5V5GfWM7TU9d2oTi4PkPdjOKcTqb6iwc+IS6/1e9rxqtSiVZQPo7CF
	4bh3yvbarIh7m6mUF8cJsHnSyH3d/tPFCSVyLKkmcGewGQF0MSr55Vj8T9LGZlsGRqL+c+fPs5Y
	BmRZEl93Ti/WY7hq4n1m6mMsxmKFYurDTc8CEBjxAKt6w+nt7EHu2Jft6zrlFih0Q+zLesM3CMC
	g2cNKU5vhsSEA8K79XtZFOX747OwpAf/dCaQA+6uNY1El5UDJI/noq8ak019bSjykbl30MJPaH/
	0UKyi93HnplIttlmCYCll7EG1iUsUQ
X-Received: by 2002:a05:620a:4686:b0:8cd:b52c:598f with SMTP id af79cd13be357-8cfc7f81186mr80365885a.59.1773949041529;
        Thu, 19 Mar 2026 12:37:21 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f94b04sm3090085a.17.2026.03.19.12.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:37:20 -0700 (PDT)
Message-ID: <7336637b7ec2f1ab61461988f59f254716897106.camel@ndufresne.ca>
Subject: Re: [PATCH] media: chips-media: wave5: add missing spinlock
 protection for handle_dynamic_resolution_change()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ziyi Guo <n7l8m4@u.northwestern.edu>, Nas Chung
 <nas.chung@chipsnmedia.com>,  Jackson Lee <jackson.lee@chipsnmedia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 	linux-kernel@vger.kernel.org
Date: Thu, 19 Mar 2026 15:37:19 -0400
In-Reply-To: <20260131221907.3313423-1-n7l8m4@u.northwestern.edu>
References: <20260131221907.3313423-1-n7l8m4@u.northwestern.edu>
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
	protocol="application/pgp-signature"; boundary="=-QF3LZ7QsIjMeM1rqfw3o"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56371-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne.ca:mid,northwestern.edu:email,collabora.com:email]
X-Rspamd-Queue-Id: 450082D1BC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-QF3LZ7QsIjMeM1rqfw3o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 31 janvier 2026 =C3=A0 22:19 +0000, Ziyi Guo a =C3=A9crit=C2=A0:
> initialize_sequence() calls handle_dynamic_resolution_change() without
> holding inst->state_spinlock. However, handle_dynamic_resolution_change()
> has lockdep_assert_held(&inst->state_spinlock) indicating that callers
> must hold this lock.
>=20
> Other callers of handle_dynamic_resolution_change() properly acquire the
> spinlock:
> - wave5_vpu_dec_finish_decode()
> - wave5_vpu_dec_device_run()
>=20
> Add spin_lock_irqsave()/spin_unlock_irqrestore() around the
> handle_dynamic_resolution_change() call in initialize_sequence() to fix
> the missing lock protection.

Same paragraph danse, I'll take care.

>=20
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index e3038c18ca36..73f21f60e7f5 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1533,6 +1533,7 @@ static int initialize_sequence(struct vpu_instance
> *inst)
> =C2=A0{
> =C2=A0	struct dec_initial_info initial_info;
> =C2=A0	int ret =3D 0;
> +	unsigned long flags;
> =C2=A0
> =C2=A0	memset(&initial_info, 0, sizeof(struct dec_initial_info));
> =C2=A0
> @@ -1554,7 +1555,9 @@ static int initialize_sequence(struct vpu_instance
> *inst)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	spin_lock_irqsave(&inst->state_spinlock, flags);
> =C2=A0	handle_dynamic_resolution_change(inst);
> +	spin_unlock_irqrestore(&inst->state_spinlock, flags);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}

--=-QF3LZ7QsIjMeM1rqfw3o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxQcAAKCRDZQZRRKWBy
9KKDAQCmQYwEM+xsiq3F9PVZubTyOpDi0N1gG9Zo6szCraHmbgEAryBgV0l9QmFs
3vPps3A2V7w04NKyh8A5+JfmqwwnUQM=
=imPg
-----END PGP SIGNATURE-----

--=-QF3LZ7QsIjMeM1rqfw3o--

