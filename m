Return-Path: <linux-media+bounces-59418-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBH5L+Qh6mkYvAIAu9opvQ
	(envelope-from <linux-media+bounces-59418-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:43:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEEF4532D7
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1151E3082B6E
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 13:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A172FDC27;
	Thu, 23 Apr 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="mzL0bUou"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC772DCF62
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951090; cv=none; b=fbf/x282Ae8Qvl+THKL1R/FEHDykw64ZdvZ/etQRx2mD3fBmCIzgoQJvOW8sRg8JE+l7X4XQry7d4jwgzRB3tLD855tZvIikSsmFQpDKpdukaXQbTAPfJJ0NG7tDEgl8VdWAxoKP1Q2/gPhTc2lmH+/FsnvtpkGGwiBOxCM5v7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951090; c=relaxed/simple;
	bh=OkIYMUDB7SvQNczi+a/z9LNo3qE9So2rbHE3TpVf25k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AeqS0j/XnoLbgox2OytyISCERTwqJUDL51r80ZvZOTj8bl2CpMH4Bh4sSttx9kZcbA5rFn9fxc7FRJT3w6/bfyFdlbmFASIy6ZLn29ShltTUW1/99kU8k3T6rDo1RNlgO9ZbCNJTJ+H2vTwgQshL51Cuo/hzTdEIEhSzqZkEwtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=mzL0bUou; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dcdaf06498so1990274a34.2
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 06:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1776951086; x=1777555886; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OkIYMUDB7SvQNczi+a/z9LNo3qE9So2rbHE3TpVf25k=;
        b=mzL0bUouKLN3I0aQkCndIJ38GOmwswmBhqhliTOrDukwSc6mZ4cEreR0tpARsWJtda
         qiRxLAAU65wNt+T08rNsnnwraM7hPyiEe+LpXZayM5+03oBBWvFQnTPHDLo677Opy8fr
         EP+KLsS9aQ2K2Z5qQ+OMv+pVfJjRjs9Xwwj3J8YPgckwlX2/mc7B0jqNpoF6ilwbi8jI
         ddCeJ4q5YMFLSoOn5i8KAApG2U4xKhBY00ulgv9+8b0O3n9rXYLa7/Z4P2gdqTlFkUWW
         i91p1vbhgrTooBfdgRIsnlYaQ1EJIjCt2lLK5AgugFBTEwIlfJLWJx9O+hK5GVtBkbz1
         +aZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951086; x=1777555886;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkIYMUDB7SvQNczi+a/z9LNo3qE9So2rbHE3TpVf25k=;
        b=myMB7Swg8SUdaxd9VW3dgfU0R5kf9Xl9wwspM3s6NK1efl6OZMOJ+HahFqD2iX2KDv
         Fpiz1tt3vHUxTZVTURs4SiwwSyYx84azw/yiC/70TNj1a+QpB9w/ZuReNPSClJpyx1E7
         OE0EGjb/L5GD4F7Reg8iyTChu9CDmcJUe/yce3uJV1F9p3EjHPBSVxrnibjIAglDUk8c
         9Mxm519ZPLFz5t4Y4XEjlSI9QeW9bPBXbQXo0W+NanKkYHFGQ03Y+l3yKCbkNKb+uYcT
         F1dAYow7Ts/sk98AjKA39tHYRtORNfLhlRu0/u3trb/GptGrWEvJaxlwuzksNS/Z7m2h
         LZ5g==
X-Forwarded-Encrypted: i=1; AFNElJ8QON1Vat4n08Y7LfR0caMtC7HK2Yn5Cm94UOoH7CtdCiUrjzA1msnkGOeSthJ5F1EXRlvBD5pMtkH9/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVSlhW82TV4qgBXUFMrux1L8Kr5c1PtqFI0hJopl12A2OP+woV
	aDZzMvglHpD6dYhIG/M7JNcFHNAzBYeriXw44rfMsyU+WHu9gFcEqn82ntSR4liq4fs=
X-Gm-Gg: AeBDietXOUJXSoh2bHAvEfFRVN7/ro4n4O5ny6XLeKfylBZbZMOcWyS8jp+TYnvLHqf
	ev7wEJHQCo2WJ7L+Mfj9DM0Lea3rmhfWKh4MshU6duinaX6PKwdn81dxvnYZNAR9PwY7OI/HRGM
	KHMQ03peaF6e2sDdIIvvPHDEmXu27fMR4IP+w1AaE79gabXSzTIuk3zjlkNJeIbad08GKC/24mP
	oWZCLMbszRCAwuDeNHBOrdL4W9pW+QsLi6+ijd3LqtP/hOGf3Est3Q9zsf2USjF/wIeh771usCk
	yP8omeS1WBN/OiIXrxQh/vA8Ik4E3PpoK1kksoVMJ3CuIWb3fEzvFlPo9y1nz0fGmXQ8z2AB1v6
	8VRKlxGmyDt0hxkvm8tkdV9169NGJVL/RN97mk86L/RXb92HPZY61afqPUh16ybf3K4rqCTvlk0
	bJ+RI+pXtu/pHStJbhBPb0uy2ukLk9IxrBh0n0/tvrBUHlVRr8ZA==
X-Received: by 2002:a05:6830:67d5:b0:7d7:d615:3040 with SMTP id 46e09a7af769-7dc951a8f7amr17141856a34.17.1776951085943;
        Thu, 23 Apr 2026 06:31:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac462d9sm161750556d6.7.2026.04.23.06.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:31:25 -0700 (PDT)
Message-ID: <89390648a5ed37ccb61731d54b6241cfc6058882.camel@ndufresne.ca>
Subject: Re: [PATCH v2] dma-buf/udmabuf: skip redundant cpu sync to fix
 cacheline EEXIST warning
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, "Kasireddy, Vivek"
	 <vivek.kasireddy@intel.com>
Cc: "kraxel@redhat.com" <kraxel@redhat.com>, "sumit.semwal@linaro.org"	
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>,  "dri-devel@lists.freedesktop.org"	
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"	
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"	
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"	
 <stable@vger.kernel.org>
Date: Thu, 23 Apr 2026 09:31:24 -0400
In-Reply-To: <CABXGCsM8T4e8kaaO_bauHnN0yE5cxwkkcN+eAJWE8hnJ8RdSRw@mail.gmail.com>
References: <20260331061657.79983-1-mikhail.v.gavrilov@gmail.com>
	 <IA0PR11MB718531C51736C57114D6DC2CF850A@IA0PR11MB7185.namprd11.prod.outlook.com>
	 <CABXGCsM8T4e8kaaO_bauHnN0yE5cxwkkcN+eAJWE8hnJ8RdSRw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-Upe9IeD/YcP+xQYdAbXn"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59418-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MAILSPIKE_FAIL(0.00)[104.64.211.4:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DAEEF4532D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-Upe9IeD/YcP+xQYdAbXn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 23 avril 2026 =C3=A0 16:49 +0500, Mikhail Gavrilov a =C3=A9crit=C2=
=A0:
> On Wed, Apr 1, 2026 at 6:15=E2=80=AFAM Kasireddy, Vivek
> <vivek.kasireddy@intel.com> wrote:
> >=20
> > Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Will push this one to drm-misc-next soon.
> >=20
> > Thanks,
> > Vivek
>=20
> Hi Vivek,
>=20
> I see the patch landed in drm-misc-next (504e2b4ab97a, tagged
> drm-misc-next-2026-04-20), which targets 7.2.
>=20
> Since the patch has a Fixes: tag and Cc: stable, would it be
> possible to also cherry-pick it into drm-misc-next-fixes so it
> makes the 7.1 merge window that's closing soon?

That would cause the same patch to exist with two different hash, which is
generally causing trouble down the pipeline.

Nicolas

>=20
> The bug is reproducible on current mainline and affects users
> with CONFIG_DMA_API_DEBUG_SG enabled.

--=-Upe9IeD/YcP+xQYdAbXn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaeofLAAKCRDZQZRRKWBy
9LE6AP4zbpIjsamlcu/G6Lqh82xunsoqtFZgRGnace73ZbfDFAEA6PEngKC7M3Yo
K0RGNiwAl4iugWAP62doSTdmh9OX8Ac=
=JOLV
-----END PGP SIGNATURE-----

--=-Upe9IeD/YcP+xQYdAbXn--

