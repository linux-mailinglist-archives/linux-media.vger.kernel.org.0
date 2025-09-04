Return-Path: <linux-media+bounces-41776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CBDB43D52
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 15:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0B805A1422
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 13:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F27302CA2;
	Thu,  4 Sep 2025 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="N5NgRoZN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA46253359
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756992885; cv=none; b=nEuzlE7T5IyG3a53l4YWaiG+Fno8fUOtFWdslJMGbe66blpwQsA2pUhKGgqdRa6V/Nezapra6NMvSoot6SNdHbCrUfwUT/OuNtymKNcn76WU7hSrcbYe+pQ0Vjf6WulvR2UUOgzNCF0QvRrsOkFrPYyzCMSvzVliAbKtxKhh/C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756992885; c=relaxed/simple;
	bh=dUEd39P5SbrzquwkepcqMoE+UjaKs1nbGYbhhukZov4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jlu1u5H/I5xvkalo69GcxjfPrteArqlmZF/fXqulZ+b+yjDk6+780G1bNlea9Jt20Wh+cNdTI/6c5sWuVbQtx8j+fPucCHvY9JdSdrfKJyMZb3L71G2XOh7tqmvMQmCPsi5XoCisiH6BYTfAzcYcN0LI3j//ZSAoTzSg5HxtW/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=N5NgRoZN; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b38d4de6d9so7018481cf.1
        for <linux-media@vger.kernel.org>; Thu, 04 Sep 2025 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756992882; x=1757597682; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xers2I679q5hQvL6Unsoq+KVQ+odJHrzRvjDGePd86U=;
        b=N5NgRoZN93NsJdlA4eluSUTA6/Z2pGkRIXye+6colDV6wkZVmp9OJX0llM5J1hm5Xe
         Kms4XwoMMs/dkxhJce7/QsAK2FHIPWqQtX8moxyh34+5P+LJ/LOSJxjUybQFeWkHbezT
         vSmtriOYRgob6djqTc5CxZueOJw1fCvq2OQBjWR9cC0+SzQhRldqordt1VQdrd/HSJOc
         s3mASdCArM+6SJDJBUYJ0i6HjjjNPA+pxBqDpDSpIc/jl1jP7s49cgNVihGzNYBzCssR
         2dNMkAVa7sXwA2+uv+5GAlNLFkq93I7ELYMTqPQFL87vhgKsspnzc2jYE/fys3qVIfGY
         AeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992882; x=1757597682;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xers2I679q5hQvL6Unsoq+KVQ+odJHrzRvjDGePd86U=;
        b=XXjKxJznJGnf2kzA+ss4QuB4AjDzuGfwHbyQ2/cmwnbyv2hROiK0h/41ZM/3rDe2ey
         pwOI6ZdKEXDKUD/zW/qALCwWlDA6ZiA1gr8j/62jLXaozg32JT7BbeWlKGFF0VnzYKj9
         v4O3uJi7prup6H20GXdRgqD9qYTMiOlO3nqngMDcMv68gfpNKxISlHvv5rlb0jJ/b2aS
         qSdaiZddtf4U4ajTnrVpSIonoQAGRTcxyy+HKqxhjUK40oCQSa6kSt0OXE/C5aN8EjIO
         uqJ3kKQRTTPGDC6TFEf+vp1CLBYAM7nUHN5Fugak/DkhAWbAy7rhXsCFJOHBDyb6dxQo
         pyLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZO+8YYCCf8rZJLkNpuIMiI0dxpql89o+TuqWLR7Xx2Edo6dJD4EMHc/PF+9EIuXHQFZWMVDWgpdKefw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7QdICXvEnDXfDSwSxAXp7v+CfpdBEq0ku0c91DfbB7dPul08v
	Q2/tH7oao3sYMqA6AmgNOjrLA0ZNKpoZ6RFHdl0W+GPgas1ZiA9p0Mt8Z/svq8aR8NY=
X-Gm-Gg: ASbGncvv7yaA3mYlZVGT/ao2yaDju51DEPDZkDTQdsg5nP8ShPPRouAvK8qq3UqgpNX
	/tOQYIhY2ZnqiIm43iqI2ADdHl7YcN47WiIrZDMNiAyFnhZh+MCIEfuV7RGgpNV6DNn+LJKqmvA
	VVrewoSoIpHGeVWCPjgkE99CI760nnmMId1biUGhogmtEZGk1rwB0RLSIiNFAHAHhcgpBRHWN1f
	jR9u8sLcjl7htN3KgGPwl1Xwal+4Z9VokkEyevgeacTfkOW8O0BSFzvwcBHcoJA4jRfs7eEhJ9Y
	m/dzNiyvMKeoJYkVhFB6RhLatedNjkZfOLLq2Cb9jgelQn8VkjTvLCps22TvVdU1/oFw9cbd1qp
	Iz1fdN07xHkvz5nH24fspT5MHjmc=
X-Google-Smtp-Source: AGHT+IFJXgXUcVFsu1NH4mZ7DQEdVfqgg4l25+Ql95DStib2FxOL1bHyzuLPNi7Gn6fpgR498c5n7w==
X-Received: by 2002:a05:622a:2a18:b0:4b3:8d4d:bfa5 with SMTP id d75a77b69052e-4b38d4de64fmr129330391cf.11.1756992881992;
        Thu, 04 Sep 2025 06:34:41 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f660361sm28267001cf.17.2025.09.04.06.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:34:41 -0700 (PDT)
Message-ID: <a8775c16be8a904b94b62df5cf530321f7424c95.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Use spinlock for context
 list protection lock
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Tomasz Figa <tfiga@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@xs4all.nl>, Yunfei Dong <yunfei.dong@mediatek.com>, Matthias
 Brugger	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Fei Shao	
 <fshao@chromium.org>
Date: Thu, 04 Sep 2025 09:34:40 -0400
In-Reply-To: <CAAFQd5B=0Zyyi2yJ5xD41LDBVYvAWoLu-oM_2XQORWgTDWo3uA@mail.gmail.com>
References: <20250820075405.1041838-1-wenst@chromium.org>
	 <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
	 <CAGXv+5GgGs5LEGJV4fpUpxOXC=_Fvo3CA4S10zZGxes9C2HrEQ@mail.gmail.com>
	 <CAAFQd5B=0Zyyi2yJ5xD41LDBVYvAWoLu-oM_2XQORWgTDWo3uA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-YoA0CYrdj42Ik9SspLDx"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-YoA0CYrdj42Ik9SspLDx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 04 septembre 2025 =C3=A0 15:39 +0900, Tomasz Figa a =C3=A9crit=C2=
=A0:
> On Thu, Sep 4, 2025 at 3:18=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >=20
> > Ping?
> >=20
> > On Wed, Aug 20, 2025 at 6:37=E2=80=AFPM Fei Shao <fshao@chromium.org> w=
rote:
> > >=20
> > > On Wed, Aug 20, 2025 at 3:54=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> > > >=20
> > > > Previously a mutex was added to protect the encoder and decoder con=
text
> > > > lists from unexpected changes originating from the SCP IP block, ca=
using
> > > > the context pointer to go invalid, resulting in a NULL pointer
> > > > dereference in the IPI handler.
> > > >=20
> > > > Turns out on the MT8173, the VPU IPI handler is called from hard IR=
Q
> > > > context. This causes a big warning from the scheduler. This was fir=
st
> > > > reported downstream on the ChromeOS kernels, but is also reproducib=
le
> > > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even th=
ough
> > > > the actual capture format is not supported, the affected code paths
> > > > are triggered.
> > > >=20
> >=20
> > We really should get this in as this triggers a very large and scary
> > warning every time the encoder or decoder is used.
>=20
> Just to clarify, it does actually cause BUG_ON() panics, so if the
> original change is already present in a stable kernel, this fix should
> be merged to stable as well.

Pulled by Linus in 6.9 it seems, I will CC stable.

Nicolas

commit 9875c0beb8adaab602572b983fb59dbd761d5882
Merge: fe5b5ef836c8 d353c3c34af0
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Apr 10 13:38:35 2024 -0700

    Merge tag 'media/v6.9-2' of git://git.kernel.org/pub/scm/linux/kernel/g=
it/mchehab/linux-media
   =20
    Pull media fixes from Mauro Carvalho Chehab:
   =20
     - some fixes for mediatec vcodec encoder/decoder oopses
   =20
    * tag 'media/v6.9-2' of git://git.kernel.org/pub/scm/linux/kernel/git/m=
chehab/linux-media:
      media: mediatek: vcodec: support 36 bits physical address
      media: mediatek: vcodec: adding lock to protect encoder context list
      media: mediatek: vcodec: adding lock to protect decoder context list
      media: mediatek: vcodec: Fix oops when HEVC init fails
      media: mediatek: vcodec: Handle VP9 superframe bitstream with 8 sub-f=
rames



>=20
> Best,
> Tomasz

--=-YoA0CYrdj42Ik9SspLDx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLmVcAAKCRDZQZRRKWBy
9PouAP0ekHH3471rlAmon6D95TEYDnWiFxjRkRkmsQMiAwnxfQEAu4hBVxecyTXK
rWWNSWSrG6H6l4tO4LtVI/aSxxWfNQQ=
=fvsp
-----END PGP SIGNATURE-----

--=-YoA0CYrdj42Ik9SspLDx--

