Return-Path: <linux-media+bounces-66320-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YG4AEm4dRmrlKAsAu9opvQ
	(envelope-from <linux-media+bounces-66320-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 10:12:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E196F4A34
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 10:12:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mwj5zC6V;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66320-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66320-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEE5E30419C4
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 08:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B20412269;
	Thu,  2 Jul 2026 08:10:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B871409615
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 08:10:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979845; cv=none; b=gZA5+eaRRb/VezIEAceS9cHkjoPxVIgNwVcC4p1DlNm/TmhD03BL7ZLsbKMoU+Z5UM/FGwkxx28RNrIlLttPqDEuwguGg8mzcBeUCl3hPc3aVWaUcjIWC8L0Yx56J99uoBe9UdPD6UUAdKfClcqWMlIglb7u09INN74kPe2ZozY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979845; c=relaxed/simple;
	bh=ap1syISulsKRSaIRGnWZqvqO+c8TnmiIW0rxGDJ3Zus=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UzP1mW6ZKvdHuEZEdvJKgB48tP1TnD52Mg9ca5qtonGQ8Rg9xluYGR6aoew+i+Mf5NoyZh1wW41Apm4bsuEJrxmhG/gX7stD0GCqelrl09hMXnwlmrFR6kbmZbeQw+SokYM9wCgHsntErSCsguRg4SVIG3FVOpPa30IwQGSxFo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwj5zC6V; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4745492ed3aso934813f8f.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 01:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782979843; x=1783584643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIcE6G+6TDMoCdkb5TNOONacJV25dJbtV9kWeZ6u/To=;
        b=mwj5zC6V/wMYMsIx68xHW5X++kHFiON9682T+Pq7c9ZCSi8VPN10GQCpWJ+aftzzwh
         XswWKVBUEVKKR2866rzfMTKb+rrGiemjfwTieM5f2Ycv9wkBvgLt1CS4vXGE7oSqtq91
         iGO6rE09n6zKp/2aIyQecCqmW3cfmI4vswq2rKpFg4QW1cN6Yjdwy4338M/nE29k51C9
         rQ13PJIWnjS7I6w0bTRK8JLqzl1lusv52kRyvcUFT0QgonxZm0appuKDnZzksdFWbQ3O
         5BnHXR9MGywQ8BJGr6YGuYGozQry3gpWox0ynx1/cxazUWyjNoylpqZSpfktzRLGFTcc
         qgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979843; x=1783584643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIcE6G+6TDMoCdkb5TNOONacJV25dJbtV9kWeZ6u/To=;
        b=kGHRUZLoPZLhQjjg2PBFSJzmLS2f0n0EKLTQPsA3FRHQYCDiDmcc88n0Y+Y019z+52
         xjAKil8zzt+ywVAdPV392ZWuPCA26b4N0fGF8RGk0UxUmFdLfLAyeNzQ30ZhOKzTgNMi
         xV5PhCfShqqM2m+uN9XpMAqKwJv1Ks3pzfqlyF2dzsRAkEY/IaaMwk2GiXfPb0cMXwzr
         q304PbbBeG8ZfFhDrvDhlmjR4O+9JWGMh59agFQurTbqXpnoZ34bsTv9BQCh/hABiZzO
         5NuD/nMSQFzsq5rYJMZHZxSGrPuJpjLXUh69JPC5wxNysYz9t81lwtJiKP69aIWhacun
         GBmw==
X-Forwarded-Encrypted: i=1; AFNElJ/RQutDsbPrVpFApGyp7CPWJDFQs/iuOsqfS2yVm4UE0kxM8+knlO0j4xssnZUkgOWr2lZM4CN0jvGUnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAFiQokGBm1e2C/DLszvKC+s7Tr5VIyhlEfLIHDHlPtqK9TXn0
	WJq0ZBO2h5Yp4Ogp+9WztLu82jx2IAKujMoswgyWQdtDrPqwYaIaASa9
X-Gm-Gg: AfdE7cltXpIsveH8JmWMriVvMizC0RU5aRWRNaEu7HDq5M57UCmnECm2Dk1fU3olyIX
	KFhZD8BcqGJHzXrJogAcDsPl7mjQhS7jiFdBQd7SItoo1PhAeV69WsfCm+eTYTZBX38YMsxiitj
	e51rmbIprsO+QCVrGu90U6vbbGnfzUcAndOpiGhZx+TxQ+2uzSohMGRqamqzwXFKjNGr9Zhq0m8
	+HlSzdwQOPr+hav/iaVV66Ci7POmTCa97Tq1xWq0A4TIXYc8rAMkk6lS0VHBNl8MYDREg4RdtHU
	r4HS1+1P7fqCYuGtyRu4rSdYZku9liYi7CyOT74QVrFc023vT14JTwT56ARv7VOUOSJ6Tc+v6Lc
	gHVBqM17CrWJp3phzMnI4qXN5ewDJlhMWLvwy7eYuJn87RqxSpNo3uYGWU5fcFc7r3h32IsflyM
	HgZZwPPwyaSfHN1Wjwq6vf3XnAOkEPEUtcNp4TNVCs4Z1mdAmiLdoaifWT
X-Received: by 2002:a05:600c:6c95:b0:493:bc4a:fb56 with SMTP id 5b1f17b1804b1-493c2bbcb21mr53757575e9.39.1782979842538;
        Thu, 02 Jul 2026 01:10:42 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3db964sm6530093f8f.8.2026.07.02.01.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:42 -0700 (PDT)
Date: Thu, 2 Jul 2026 09:10:40 +0100
From: David Laight <david.laight.linux@gmail.com>
To: David Hu <xuehaohu@google.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Pranjal Shrivastava <praan@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Nicolin Chen <nicolinc@nvidia.com>, Leon
 Romanovsky <leon@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Ankit
 Agrawal <ankita@nvidia.com>, Alex Williamson <alex@shazbot.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, jmoroni@google.com, kpberry@google.com,
 chriscli@google.com, sashiko-bot@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] dma-buf: Split sgl into page-aligned 2G chunks
Message-ID: <20260702091040.35eff00c@pumpkin>
In-Reply-To: <CAPd9Lg9uY1RZvYUtcbKUg=VdWM61M2f3aqmS5veUg_8M_Ce80g@mail.gmail.com>
References: <20260621222130.1667453-1-xuehaohu@google.com>
	<20260623015459.1153884-1-xuehaohu@google.com>
	<20260623094446.4a8fc2ed@pumpkin>
	<ajryxMaT5evDUxaq@google.com>
	<20260623235350.6540eaa2@pumpkin>
	<20260630124252.GD7525@ziepe.ca>
	<CAPd9Lg9uY1RZvYUtcbKUg=VdWM61M2f3aqmS5veUg_8M_Ce80g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:xuehaohu@google.com,m:jgg@ziepe.ca,m:praan@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:kpberry@google.com,m:chriscli@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66320-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ziepe.ca:email,pumpkin:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9E196F4A34

On Thu, 2 Jul 2026 00:56:40 -0400
David Hu <xuehaohu@google.com> wrote:

> On Tue, Jun 30, 2026 at 8:42=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wr=
ote:
> >
> > On Tue, Jun 23, 2026 at 11:53:50PM +0100, David Laight wrote:
> > =20
> > > > If we restrict incoming dmabuf transfers to fit within VFS-centric
> > > > limits (2GB), we impose unnecessary overhead on the RDMA stack, for=
cing
> > > > it to manage a significantly higher number of memory registrations.=
 By
> > > > cleanly splitting these massive contiguous device buffers into
> > > > page-aligned SGL entries, we directly improve the efficiency of P2P
> > > > transfers and memory registration. =20
> > >
> > > But a divide by '4G - PAGE_SIZE' is also non-trivial and (I think aff=
ects
> > > a lot of io) when the quotient is always 1.
> > > Splitting into 2G chunks is a lot cheaper. =20
> >
> > Doesn't matter this isn't fast path stuff. It is better to use fewer
> > SGL entries, IHMO.
> > =20
> > > > Since this change doesn't seem to have a negative impact on standar=
d file
> > > > I/O or break existing VFS constraints, I'm curious why we shouldn't
> > > > support splitting these >4GB P2P transfers? Am I missing something?=
 =20
> > >
> > > I was only wondering whether it was needed...
> > > It does bring up the question of why the >4GB transfers even need spl=
itting.
> > > But that is another question. =20
> >
> > SGL can only store an unsigned int size, so any large physical range
> > has to be split down.
> >
> > rdma now a days has code to process the sgl and restore back the > 4G
> > sizes since mode RDMA HW can accept that.
> >
> > commit 486055f5e09df959ad4e3aa4ee75b5c91ddeec2e
> > Author: Michael Margolin <mrgolin@amazon.com>
> > Date:   Mon Feb 17 14:16:23 2025 +0000
> >
> >     RDMA/core: Fix best page size finding when it can cross SG entries
> >
> > So whatever this produces needs to be compatible with that to undo it. =
=20
>=20
> Thank you everyone. It looks like most open issues are sorted out.
> I'll wait for maintainers to weigh in before sending out v3 (which
> will remove the type cast for min() per David L.'s feedback, and
> revert to ALIGN_DOWN(UINT_MAX, PAGE_SIZE) per Jason's feedback).

Does this code get used a lot for 'normal' transfers?
I'm away from my normal systems and can't check.
But if pretty much all of the fragments are small (< 4G) then
it is probably worth adding a check for 'size < limit' before
anything else and optimising that case.

	David

>=20
> Hi Jason,
>=20
> Thank you for your feedback. I took a closer look at the commit to
> ensure compatibility. This patch is perfectly complementary, and
> actually prevents a failure in an edge case for the latest
> `ib_umem_find_best_pgsz` [1].
>=20
> Regards,
> David
>=20
> [1] For dma-buf split with `0xFFFFFFFF`, in case of a discontinguity
> in later buffers, we will hit this code path in
> `ib_umem_find_best_pgsz`
>=20
> ```
> if (i !=3D 0)
>     mask |=3D va;
> ```
> (*After `va` had been incremented by `0xFFFFFFFF`, due to `va +=3D
> sg_dma_len(sg) - pgoff`)
> (*Which will set the lowest bit of `mask` to 1)
>=20
> Because `count_trailing_zeros(mask) returns 0`,
> `ib_umem_find_best_pgsz()` will always return 0 in such cases.


