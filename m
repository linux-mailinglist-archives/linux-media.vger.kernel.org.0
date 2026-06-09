Return-Path: <linux-media+bounces-64295-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mWL3A5wHKGp57gIAu9opvQ
	(envelope-from <linux-media+bounces-64295-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 14:31:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9932566013A
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 14:31:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=tKyEMGiS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64295-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64295-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1009F3029302
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 12:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA259416D19;
	Tue,  9 Jun 2026 12:31:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D8E3FFF80
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 12:31:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008280; cv=none; b=lfWql5JMneBvCQww839FTLYBILRe76mjgLRodMd9dENPFcM2jrPW+gMt9t1dyp+nkvwLc713twFpPCek+kBa8DcY0CZ8C2/4im5TSuiD3e7fb95ydmDC6afyNovRxnKbVx6ju4mogYyKyH+e0e2/oB81YDCx4V9/VwWo63ioZ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008280; c=relaxed/simple;
	bh=C94jN65NV1jMFkw0SiGcRO5GvFVYe28KFeiin6zr+wc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=peeJagTPo0FMLxBAExPY9LEQHhGePLxHowWSa0X+xxENI4unALZ5x6NB+fBOKmVW1KF47L8UCVGgb59F4Kph+bkTxg/lc0pP+stsYefGPC1fe1jwEA6bMPjJE7OKoH6ln2m/ZbSXOjT6YyfLi3pQIjVrzF+1TJzDUbfJ2zCAosE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=tKyEMGiS; arc=none smtp.client-ip=209.85.160.182
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5175eab3a93so42668981cf.2
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 05:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1781008277; x=1781613077; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C94jN65NV1jMFkw0SiGcRO5GvFVYe28KFeiin6zr+wc=;
        b=tKyEMGiSOMWwpgOGGQBAI7DI7fmAJup9gSG6cm6pd6A0RthtMofBOROZe5ePpFy0L/
         PNhGslkYlfkSEGCz1OKOuS+PaRZ1CY8pmfCDWU+eM/XvMSQ7RTcBxvzHjkbk3v5O5eZd
         TURIOb9h6hKRyu54oApsozMpWX573mfZAQGzJr/2HFf1ONLimI/OcAPaA9z0dwaH6RXn
         Q8+j0PaqktZ44mmrkTJlRkOqEozqG4eY4qe0XF7cK1SRuokbNYi0KdAI20F3lXk9LNR9
         EgImrBwEF2VKZ2j2/Q7Vm0qLmiubrqJtrq7U0h5RzYr/THPQlvhb8+7OPJAzeGAwQfI7
         TNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781008277; x=1781613077;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C94jN65NV1jMFkw0SiGcRO5GvFVYe28KFeiin6zr+wc=;
        b=GFdEzZzyXRdctkyxMI0TipTLHVvBaPP/0O0ckckJIIVGUJ8n+U0Qjeh26GJe0AAgnY
         hILNXI4xY+NycPc83ua7Ed0388Y4vF5V4MuwNKQXskOAT3F/SxO9yYQq9/fQuUHckEtQ
         tmUVZhgX/RFflE4r1RexcPMZScYGcLAKxkGGECTHQn7EiNaHwZYzawEbIsOR1IKZqytG
         bm5keCe7BUVeNj8w4SdzdsdsaQwCYymwpzqsTCaOqlHywGdNqVmI9mS8qchtzSr4dyMP
         HmJkQtopZIOgR2rXwPRufn1A1c2N4Okecya7Cow4RGzU9ZJyQs/mOy3Y4qxcBUkfpfiF
         mm9w==
X-Forwarded-Encrypted: i=1; AFNElJ8Ny1fEvMvbe0o1SXwm4dZqs0+UzFWwo3/gg+Ea+Zr+53cH+K4VG1w5QZmLhMhr8PJEbSIrui4F9qq4JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0SUBxVzmBX6/7alt3rjlgeDlvIpW2x8A2kpIEPk8EkfN4QqHU
	hdja3SWJCkC/pK+iEGqA/Vw7VB7d2Y8L1qi5FnIVYVZoNdadMQ09efIGvYkWfI1r3Pg=
X-Gm-Gg: Acq92OHXELhadXbzjKND+sBI/LWUbPgh0ZP3j5/bfIyFJ/lIdM5n/cqcashD1O2AmnM
	2FdX6N5cZAZxEBw2q8CfG6ntr/XIqMozcS80J5rD68zPHuxJ/l6gJwAhBodKxDwuNznafAwu+gI
	aGxHGBnvKIsxOlPPWSaXhpqpyujvgg8fYRFPBnYt1J4LYFl9g4+kihgfnWrVPWdn1ZutjDuTtvB
	5L8Tm5n7cfHfJaqB7mIXLDjjcQ9rRCfJDEQJT2MadwS3CH3msZW6e3UsTofbTuMBBARovknP1nO
	2GieJkTkjRECl8QYmlHjRW2zrhu13i/Xf22FkLjWQeSzU1w1uAtra+JWRRs3uXJ3LfB0z+7IWRK
	VlglzOLVeh0qqF8xJR1wXp1B6O8Fgo/e+zYwW/3lsBfVADXwWeBcqqEtFMwDUdpwLSqF+og2F34
	pustXn3XQB50dgkF0DvEMfz4M5AKi6FX7ImH+kHmKPvJAbljKu6RmI+vCoe8iu67EuYnJYWPTOW
	WoON9B1n5lCO5i/sw==
X-Received: by 2002:a05:622a:6203:b0:516:d781:589a with SMTP id d75a77b69052e-51795b1547amr260801071cf.22.1781008277309;
        Tue, 09 Jun 2026 05:31:17 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c297a8sm181882191cf.8.2026.06.09.05.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:31:16 -0700 (PDT)
Message-ID: <169bb3cb1d7e940c43916178cf5cb6dab2993fb4.camel@ndufresne.ca>
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal
 de-blocking edges y=4 and y=12
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Simon Wright <simon@symple.nz>, Detlev Casanova
	 <detlev.casanova@collabora.com>, linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Date: Tue, 09 Jun 2026 08:31:15 -0400
In-Reply-To: <34662f2d-cdf9-4ce8-a618-12a0f64cd03a@symple.nz>
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
	 <5797ac61-dc61-4182-ac60-cc377564ff90@collabora.com>
	 <2565c949-a558-415f-8c79-e47812db8341@symple.nz>
	 <e3b93bda-fed8-4f21-b3d8-cdf28bfaba1c@collabora.com>
	 <4358f22d-247c-43d3-89d4-27b57bbe90aa@symple.nz>
	 <66768711-6943-43f5-95fa-3d97dc638844@symple.nz>
	 <25a232dca0236788c75231c43ee8a01741148c37.camel@ndufresne.ca>
	 <34662f2d-cdf9-4ce8-a618-12a0f64cd03a@symple.nz>
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
	protocol="application/pgp-signature"; boundary="=-Ygw4GNsgwrgdfSXxFqSJ"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-64295-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:simon@symple.nz,m:detlev.casanova@collabora.com,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ndufresne.ca:mid,ndufresne.ca:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9932566013A


--=-Ygw4GNsgwrgdfSXxFqSJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 09 juin 2026 =C3=A0 20:33 +1200, Simon Wright a =C3=A9crit=C2=A0:
> So it points to the HW racing on its own deblock-context handling rather =
than
> reading stale buffer data. I couldn't reduce it to a register / RCB / clo=
ck /
> gating difference vs MPP either, which is what pushed me to the power-up =
priming.=20
> I can't claim it isn't masking something deeper, but it isn't the RCB-dat=
a case.

thanks for the feedback, and yes, sounds like a workaround is the way forwa=
rd
for the time being (or forever).

cheers,
Nicolas

--=-Ygw4GNsgwrgdfSXxFqSJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaigHkwAKCRDZQZRRKWBy
9JX2AQClZlsNAsGRuhbUXlOOhr/CR4BJx6+IviLaSFmlKtYZmgEAjeawIlFvXd0v
25iDCXueapOnlAssS7K7Qxejh/+wkQs=
=5esN
-----END PGP SIGNATURE-----

--=-Ygw4GNsgwrgdfSXxFqSJ--

