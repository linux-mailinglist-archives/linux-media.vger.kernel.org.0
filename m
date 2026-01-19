Return-Path: <linux-media+bounces-51058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C28D3AA02
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 14:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 468F930E7906
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 13:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A053659F4;
	Mon, 19 Jan 2026 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lS1Gx0+N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D41A364EB7
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828226; cv=none; b=Vqzwkw3pob/IHlfQpzqGmDCafn+MTmFEgiQ/n8R4MtVAiQyYkcO0bcGcN8QqouVfDxESFpw94dEIvRCKyOedypU5XCmB2rrPv2IOf+KSpFivqLBnokyvxhdnvj3fZXL9GwxNHF4yD+eTIHVLBZSGvSamMVhxYEeqyekzb5JSNP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828226; c=relaxed/simple;
	bh=K1MPZnZ8koQKv01vcxXzQIb9F3ndZB6UBQVxaX9WgFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYr7Y3U6li0M7M2iE2FuE7jNb9EvnxnsLkwChIakhtcYpqdcY+VhF6bKYKxaoMk+uoal4nmkMrE3+TsFu5Kz4vim0AQdczqND49+dtazM4Fj/uvri8rdayf0x5LvwCm2ecBp6sJkMHUOmwPdtyyOhjxf79KKriamX1fBscKT4kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lS1Gx0+N; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-655af782859so6074466a12.2
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768828223; x=1769433023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1MPZnZ8koQKv01vcxXzQIb9F3ndZB6UBQVxaX9WgFU=;
        b=lS1Gx0+N1Prt8VBce5NGm1CrfJuTX9HqwQQofOPhbE3wLBSNfmJHYVoTF08MLj1jqR
         YWg5YXGvy6fFj8AQFZ0U/DRo15GeUc92YtJMCEyCuZYn7LO5oxFDifwCeJT+lXoQB5rL
         PdHOOiYzs8WZ+dNhXBvZeRG+F9WelxN+JeNIDBq0r1AsrYgkzPstW719y2QBpywsMiWQ
         4nEHdhuT/ynUzpzMapT8HSVXGFr33dINdN7M+aynSQVNEs7skA7zLQbRl1d9ozw3bBrl
         lutI5kGAGaDPv+Qn1HC8FlDrGl8Z48kq7Xz345dTkz4r5j9fg8RqI5UTD/IU4FH//kk5
         X0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828223; x=1769433023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K1MPZnZ8koQKv01vcxXzQIb9F3ndZB6UBQVxaX9WgFU=;
        b=Ye0aJLxj1ales8arlKcn0MB5Lq1fDfK5N5H3yPw14tW/IJPHaUZHtMEqBvntrA5k2Y
         fqo40N/Wg+JCTdPMVK/xh+9fFyC31ZjZUli2+VL83yHa4TCkSAcRfZ7/j1cHCGF9cWis
         cPpnz3y20z3v0J87yJm3Bt7ueN3b7mWpbByc7qfIf1bgxSngIdpjrexg+BBXAWzIWFXp
         KgsxoXrIcQiZgdiUGvrbJ0PSguxJi2WyNesbMCAsCAHB4+T00PpCa63+DCY0d4ASejJ6
         duMVokZ7/47yoLHAl+LDhZB3dB0K9PJjdpNwm6GWqbvBlj7m+eoIFpi03XUaGEJcK8yA
         uSxg==
X-Forwarded-Encrypted: i=1; AJvYcCV7i+6DEI4TwNEesvsM2tT8KRBR3bs3d53YZ7a3oAmcGAt6ZUlC4v6Jcar2OMx1w+IpfG7zJr5FgQ2mJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/iWagnbSsOo/o8UxKD3wZWfNoeo+8vk+go4QA0rSqziVf3Dof
	39PKEtN46pwI0LMcRyrwQQeLjn3n+HaChKSN3GNAZOdvd+uE+LXjaMmNfe1pYAVl+dpCLi//p/O
	XmlPCvr/axbZVJ2s6V4JUiKbv/YXA0QwYlaH2SvfSag==
X-Gm-Gg: AY/fxX5yi85SrMA4ieXtt+B5h5c+jCCT565gNV9AWtLxaS0p6FfiChKatuq2R8Rv8GQ
	20yAXm2lv74n545SZUeZLg6Q4kYBe2pop2rXIUYhXDwtUUVGcz/P1cyqubECcHM/4x9/UsBD6RG
	uR0cPZm6bdWRa0n7Ti2SV8vvdbz8KP3h533uGMq14oUmmLUyN9D8N7OhaRPh20YP81FzYrDaYHL
	0EXmcqZA/JMROxv9NIcQaMOPrRk1Xrs7gi61gKHeAJJdQLIwtU0UNdF57NNbDrR0J5k0nrHk2eo
	mm4UxZaJ4ApQsZBbeRcuArpbe50=
X-Received: by 2002:a17:907:9713:b0:b76:f090:777b with SMTP id
 a640c23a62f3a-b8792f683f7mr935886366b.22.1768828223465; Mon, 19 Jan 2026
 05:10:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
 <20260116-dmabuf-heap-system-memcg-v3-1-ecc6b62cc446@redhat.com>
 <CABdmKX1ZCkF2N1Esi6Uo=jK=soXZe_eWhSSxHtMTcRWs-ZUYog@mail.gmail.com> <c3d66415-0e2e-4945-917f-4c47f16bf743@amd.com>
In-Reply-To: <c3d66415-0e2e-4945-917f-4c47f16bf743@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 19 Jan 2026 18:40:12 +0530
X-Gm-Features: AZwV_QiZpslj_Ee2HW4MjCooEBtBdxf_RatAeMZm3MxIfz-ec0_Zxj32USNQwfc
Message-ID: <CAO_48GE5F=_8s8vJfOy0x-FQj++=BZ_rf1yiNa3hyFj+aUzLLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dma-buf: heaps: add parameter to account
 allocations using cgroup
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Eric Chanudet <echanude@redhat.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Mon, 19 Jan 2026 at 15:19, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 1/16/26 23:36, T.J. Mercier wrote:
> > On Fri, Jan 16, 2026 at 12:06=E2=80=AFPM Eric Chanudet <echanude@redhat=
.com> wrote:
> >>
> >> Add a parameter to enable dma-buf heaps allocation accounting using
> >> cgroup for heaps that implement it. It is disabled by default as doing
> >> so incurs caveats based on how memcg currently accounts for shared
> >> buffers.
> >>
> >> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> >
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
LGTM as well.
>
> Should I push that into drm-misc-next or does anybody else has commit acc=
ess?
>
I will push it to drm-misc-next tonight. Thanks for your review!
> Regards,
> Christian.

Best,
Sumit.

