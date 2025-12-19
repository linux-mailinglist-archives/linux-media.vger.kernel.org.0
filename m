Return-Path: <linux-media+bounces-49194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A4CD079A
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDF66303BE1E
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0032349AE5;
	Fri, 19 Dec 2025 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="2/YWPEO5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556D2C0F92
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766157520; cv=none; b=ZxFB9CnrBwB28J6QenunjjpK+GSUNXOyruBar10/RpNWB31hNFsvMGKg6jsBH76J5X0iMUXPHjUw13Dx6dpPM/nFFj4eECBZGYMeogPRceKG4mo9f3/0GrDgVauqF5ajEaNVlZV/BXTtESu+P7YM1zR3sO2kP5fjvMxUP07xEr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766157520; c=relaxed/simple;
	bh=ePOl5CV57JQrRE0OHVBW+xEjLRbfQJdu22LM78xE+zM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FhrmXzIXBFLtTrBE1C7jPwlrz1N3AbG3PpkNGv8pNuDAoXBLKc9elrR4kW4UbkHgSrXYp7JSZQYlYTREosDbIXHh465Aqcv/XxHj3fa+OnkSETyoyAjYkeUpwuNC2Y2zfoZ2hbsasAOWX1jRq1aWE2bJmriACNrBHZLjJ9sQ1VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=2/YWPEO5; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b21fc25ae1so177800785a.1
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766157517; x=1766762317; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ePOl5CV57JQrRE0OHVBW+xEjLRbfQJdu22LM78xE+zM=;
        b=2/YWPEO5AkEXKVGW8gJCkou3qNR5D/kSW5rBv9qEvQZv4c9a2hFm8/F7OhzG6Mm9oH
         EWR5fUjhoL/RNOVo0BsUA1WhC02bnweLMXCuQI7APNe8Ih/7uvQcQr9M5O6LY6brW9yb
         giU03T81unkxtaudaf7xO8WZEs4t5xe1pGXDUXIUDJyhBHWD1krEPp0rLNRhQvtY0M03
         YDPDk5/MgSuJhfOX3RdSj2usDwX4J8w/ajIBhZojudMuWavUP1KD2Q/Loli2/tKditYa
         +oJS1Z7rKP/yZl1TtZVc/uwbVdB3m5rPzwf07+Of9D7K+zKAVjuXctjdyhSgSBARh4xe
         jyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766157517; x=1766762317;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePOl5CV57JQrRE0OHVBW+xEjLRbfQJdu22LM78xE+zM=;
        b=TgpBrWf74sE2re3a5/ABeBWUuwPFfrYyK/5iBYomi5b5RvsgL9EPIE7qg7io6oymMT
         GsqbGR9EsZkNs6RjO2Or1hbzecqM9XBYlCsWzcGYe3UVOgVmUHe8yw7DzdNtoeBbsC0Z
         N0H7ecTjTy4CPQeLNHLCPenrrTnAFI97BllWKkHFjieS7cta3dVxisICKpBFYByw/D8D
         vpPF0y+3sz44rGCix6GAtwQ7yeHUcUTbBi1ep+IwfKorBYf2LMJY8CJnc/076Qwpa/10
         6VNC8dblpfj6ASQgo7PsrnrbEUweXs9UY/zBCgxbelArdM/SMZphAb4N258bUfuwthxb
         PHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJx01w0x4LMsW+g3vUK2wrgwAgJnFPF+MvZdhPIW0aGcxltAJpG1WqJP9/bn58zxF6VvSvJsLs/h2Cfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXx9Hel++h/1QVmWgylXv7v94Ym3DXYXMgECxSMF1MYxp9TLOa
	2DFfs4VlYfxtiLnts+v/dCR+/wqcsOoUXSyl0m4ie24rZIkaxDiKJEzx4pM5NIWat3Y=
X-Gm-Gg: AY/fxX5/8K1PdjlNjgeXWYIGfUTHLMWE44HsEbLb1pd5RE9IVC2w3gUtqaIIjQKUkik
	2P5xl1mCJzQO6olskLlZ77mbwSAgReZpx11ivAC/3ahTD8hQR3uvP+jfrAPpUrL5VQzf2TTiyh6
	y1iLW/zUajKfLXT6VjZDQeDdE/incvp7vfa5hOpgkNW7+SFDlvVzlORGONLNJpRGA8pL0R18PLr
	6JPOhMa0eMSsKEyHJuq/7VyCQLxn07IpINFGIaa/Subl3iip9Ip1xgjd3JV6iikTVjly5tOoqeH
	wQ8w0kJTMAKmqlxK+OHbEElWKECVLqU73nGPMzNvCgEVotdcJyeMPVFw3eZ9QDLSDPwp4ujpL2i
	jLGZdkFgNT1QrTlG+ETNU/IASriiWf0Lii2kfcNRDgldYicgWJFx/qm29r3+aELJ6PFVvks8XOb
	XPZ4d+nFhb+fO0+49s
X-Google-Smtp-Source: AGHT+IGau10k1eP0J6ZgC191UIoT5zL6u4IAchl+ERoj9e6cKwo0XprjejYKXEIsulZQEnpyM9HZrw==
X-Received: by 2002:a05:620a:1789:b0:8b9:7a1a:8c73 with SMTP id af79cd13be357-8c08fa99ac2mr523096585a.46.1766157517165;
        Fri, 19 Dec 2025 07:18:37 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c095b79b32sm200473985a.0.2025.12.19.07.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 07:18:36 -0800 (PST)
Message-ID: <a25fd4e7aca4f49e0793698915dbb5fe99bbe8f2.camel@ndufresne.ca>
Subject: Re: [PATCH v1] media: videobuf2: Allow applications customize data
 offsets of capture buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hirokazu Honda
	 <hiroh@chromium.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 19 Dec 2025 10:18:34 -0500
In-Reply-To: <221d3f70-b418-4f89-b352-773c544ed428@kernel.org>
References: <20220322132329.6527-1-dmitry.osipenko@collabora.com>
	 <dd22c40e-1200-42f7-8c48-63534f759045@chromium.org>
	 <5d367bbb-551f-4164-8473-a6c4b68793c0@kernel.org>
	 <CAO5uPHPKLxySgwWUi6w0Nm-PbDSPkN=OySbLK8wNKwXdp3p1Rg@mail.gmail.com>
	 <e265d412260226be67df3bfb0dd05bb74e36d551.camel@ndufresne.ca>
	 <221d3f70-b418-4f89-b352-773c544ed428@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-KSkR1bVw/bmN+66WFj60"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-KSkR1bVw/bmN+66WFj60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Le mercredi 17 d=C3=A9cembre 2025 =C3=A0 11:02 +0100, Hans Verkuil a =C3=A9=
crit=C2=A0:
> > For me, the most central issue in V4L2 is that the memory allocation/im=
portation
> > is bound to the operation queues. That brings all sort of issues such=
=C2=A0
> >=20
> > - We can't queue twice the same frame
> > - We can't mix external buffer with device allocated buffer
> > - All buffers must have the exact same stride
>=20
> The three limitations above are all technically possible to implement wit=
h the
> current vb2 framework/streaming uAPI, it's just that nobody was ever moti=
vated
> enough to add support for it.

I don't see how technically it is possible without new uAPI to support
heterogeneous strides, nor queuing twice the same frame while running in MM=
AP,
or mix device memory and externally imported memory. Please feel free to
enlighten me if you have some spare time.

Perhaps worth to mention that this is about doing this without creating gli=
tches
or jumps cause by expensive drain and streamoff/on sequences.

>=20
> > - Application is responsible for caching which memory goes to which v4l=
2_buffer
>=20
> True, but is this really a big deal?

Maybe a lesser deal, but its extra complexity for both sides. The current b=
ug
being that if you use import mode only to workaround "queuing twice" issue,=
 you
will endup with two mapping (which in some stateful codec firmware is not
allowed by firmwares). So on top of the lookup userspace is doing to match
buffer ids to their memory (have to cache pointers and fd and all), the dri=
ver
(or vb2) should also implement caching. My proposal imply solving that dual
mapping issue for both current and future stream mode.

In userspace, there is also cases, where the video buffers comes from other
process, and you don't really know if two FD values points to the same dmab=
uf.
This is the kind of scenarios the DRM subsystem had to deal in compositors,=
 in
our case that would be something such as pipewire. This caching is either m=
icro
optimization or simply to support firmware limitation, but a guarantee to h=
ave 1
memory object for one chunk is in my opinion achievable and allow reducing
complexity.

>=20
> > - Attempting to import a buffer requires a free spot in the queue
>=20
> True.
>=20
> >=20
> > This adds on top of the v4l2_buffer structure limitation we have been t=
argeting
> > so far. With the growth of modern standard API (think Vulkan Video nota=
bly), it
> > becomes apparent that the model is too inflexible. This inability to se=
parate
> > memory allocation and importation from operations creates a lot of comp=
lexity in
> > user-space, leading to complicated bugs.
> >=20
> > I've been quite about it, since until now I didn't have a solution in m=
ind, but
> > I recently come with some ideas. I'll will try develop these ideas, at =
least in
> > prose for now and come up with an RFC, hopefully somewhere beginning of=
 January
> > 2026. That my proposal is accepted or not isn't quite relevant. But hop=
efully it
> > will be a starter to go go beyond just fixing what we see. In fact, thi=
s next
> > step is for me doing to be quite decisive if I continue doing codecs in=
 V4L2 or
> > not in the long run. But I'm sure this is not just about video codecs.
>=20
> I'm looking forward to your RFC!
>=20
> What is important for me is that whatever we come up with, it is somethin=
g that
> existing drivers can easily support. A new streaming/buffer allocation uA=
PI that
> can only be supported by new drivers will need very, very good reasons fo=
r it to
> be accepted.
>=20
> The nice thing about the v4l2_buffer_ext proposal was that it can easily =
be
> supported by all drivers.
>=20
> From a technical perspective both struct v4l2_buffer and struct v4l2_form=
at have
> reached end-of-life: they are full of historical cruft, they are ineffici=
ent, the
> 32-bit/time32 compatibility code is awful and hard to maintain.

I want to get a lot further in the proposal writing before going into exten=
ded
debate, but there is absolutely nothing set in stone. I already mention tha=
t my
proposal it to create traction, and I will have no problem moving direction=
 base
on feedback.

I can reassure you that part of the plan is to be able to implement that fo=
r all
drivers. In fact, I think its a good requirement for any proposal here. My
proposal will not replace VB2 or the format. Perhaps few bits of the format=
 will
be replicated somewhere else, but not all of it. Perhaps we'll get into bre=
aking
down the gigantic "format" structure into manageable part in the future, bu=
t
this aspect of the _ext proposal, with DRM formats and modifiers is orthogo=
nal
to what I have in mind.

Also, the vast majority of what I want to proposal can be implemented insid=
e
vb2, without changing any drivers or userspace. But the full gain, I believ=
e,
will requires a new v4l2_memory type.

Feel free to think of your own ideas toward these goals, our best bet for t=
he
future is if we can combine best ideas together.

regards,
Nicolas

--=-KSkR1bVw/bmN+66WFj60
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUVsygAKCRDZQZRRKWBy
9L8/AP4zspaJwxAYdYw94fmT8EYEdyaJmWADL/NG13Gk6LJtEwD+NbMiev4MPZEx
Cgy49EWQurDh3yBGZZwVVCkgUJZx3gg=
=mUCg
-----END PGP SIGNATURE-----

--=-KSkR1bVw/bmN+66WFj60--

