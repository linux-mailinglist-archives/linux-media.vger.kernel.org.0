Return-Path: <linux-media+bounces-56906-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPNMF8rYwmllmgQAu9opvQ
	(envelope-from <linux-media+bounces-56906-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:32:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD22B31AE76
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BF95302BDEF
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948783A3E6F;
	Tue, 24 Mar 2026 18:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JIBpd44e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D043F391E79
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377150; cv=pass; b=nTSGuzhBZ5svB40vdopv5yEFeOh4t4mhW3/Du58TcBGTiseX664/CPS/+Kr6xxuF6uda0kZIV+cPJiNhUYgfFj8DyVC/QISBGFUsHKtRqEG3TZy2HKvIap5DsWLR8ZNjUgMnM6RkbDN/Er2+fxom0486SDlomO8/y3rbALqMITY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377150; c=relaxed/simple;
	bh=capQ/2P6O0wzFj3JGECHvmPV76dOzNCALYeUIxrihD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRKBTI4AUPHVxOK4L4yRXKl2EE5A2sxBO89CPQwdETB5T3P0m+CtAuksJniRSOxJVLbQBYB+H6e8rWRjldtLOc1jiYj7FJ7ExYiZJYppYmtjcNSpbyIxdsyapFo5i/D6k0ABzJ71TiUz+FKJnz2JLvXcg3aM1Xs9K58r22o6uqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JIBpd44e; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50b6c45781aso87971cf.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 11:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774377148; cv=none;
        d=google.com; s=arc-20240605;
        b=MvdIk+jV6nB6x1fLDYXWfMC+aNLTqfAvgUe9VcEFfaMaRw632+GBrIOfk0DbltiRd7
         OsOYAZrfxY470vbnIXjKbT2RCaVbKpK6hWyOJxF78GZFDJOGvjKCGCt8c2dydXaoc2cE
         vGNeE34UcdGzcwFB96Y66VEor6HOiUrVbb4pst8CmapIB5g9gTd3dLXllKm8tLwzEksO
         hNDPwiHQr2m815AD8uBrK3152BTzjgcsRIj167Imc6PVssko4L+ZVsNCO/hvI3RzHEtV
         knjSwxrA3m5b3O9tGLQPSAfNsC0/PJV+Uxn9w1E8VvPQEMWEhmA7gkHMWeZREwt7vQ17
         8P9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=capQ/2P6O0wzFj3JGECHvmPV76dOzNCALYeUIxrihD8=;
        fh=lDupzEIpAGWInQ7pV+eNp1BtPdNYbs/mlL1+y0PntiI=;
        b=GU0AprrbJ5idesluS8Xe2oD4Q/ukNaz07tpNAPERmjo236NTpDoBSOVJkATaIqzSuG
         c15W33fA0DnIr9aa+bEs4khLWO20ry7UU+QYVFo5FHzq6YMj2CYShY3mGnUyhvta7qib
         M9afWYsrtLM048fbXpSlOa9/NCGvTqhjyqNCVu7Ve9k42SxjUPJyBCKaJkcs/nNB+hbj
         E+V/3HTN51DpFWGf5953Vv88Gi/SAjEpMvSIMOOHGIQHu7dmF0vCe5jyhakTMj3F3gDa
         nOKYImtUI88U6tl5MzfhyUBDWUDgqlpH6XxiwUIfdufUrgnRefDH3Cp8rIM5sN3L47XU
         aR2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774377148; x=1774981948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=capQ/2P6O0wzFj3JGECHvmPV76dOzNCALYeUIxrihD8=;
        b=JIBpd44erjAwPIbj8mxPx5uNUcxakjhCnobKRVPRgenqiG9gKIvf8Em66ByrsQ2aK7
         NvRSCIZwQTnzFmoQS5oDl3YjNRg5vjMs1PpePD2f2PhN2BTMj7hNcC1uH7XmRHT4wRcf
         F6K4nJAtX1TIFQvnjEslr2ZQ0s36i1kbgZ+w/oZ5Pup+VwbbihkA0ucc8nqhqNHo3iOB
         sGzE8rGRUp63ubjk4+qyTQIckuP5Nmq8y9vT9nT7uChDKSei0h+ueB4+Z4trWZvtmPXb
         53OIr5RcyfYMq+EIjFUeGIO9RhNfeT43U2RlByQo2xDFq278dejTvo9QzN+cQpdC0T0k
         P8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774377148; x=1774981948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=capQ/2P6O0wzFj3JGECHvmPV76dOzNCALYeUIxrihD8=;
        b=qaRH7r8L6iFyidj2pXEWL96kamlHi08vZ1HINO4k+cgWP5B+a9v3jyFO9O0WUNFWco
         gSViKP1JsdwwNjNNGGhLuRY7R3k2ct1+GxaM6mEvDpteSHmTOgMiF+PCX3cq+YKBpyJo
         bUdVsxahna23Ba1j7nmEAXmRphNOL3G36QpNC4NxfIalndnR99BzOzATreJ9havPz0VE
         YqYSl0p+X4FCI4pwU2ghj9iIXsQcTQTpiuD0l1jyQj4OSopac/VIFWhi+k1IUjEpgb2f
         jXDlg+OOgYrEU4wk3NHKme2a8ZnDa5rnQpeiOXM2V+77ElKihrbK6RomM9W1Hqy0rydo
         ZyAw==
X-Forwarded-Encrypted: i=1; AJvYcCW8hKeun1edeyvKEacvhjGQEwa8hX7q0TMT4hxJjAyrLv/mCUWYlRYTQSbaQOqUp9E+zNzM6fnKcd8PIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwABouL4LtGx3773IoN5vOWpkUUsNPWTWDuw8fv3IDMSnWdF2YX
	IpkzVMOR33CvcX1bKE7npirg4HGTBpI3irsAIayPfXirMZ6TF4HoohJu9g6ks7CAw4I6+0xVs35
	gpE2wtkRbmQvNMleOFnBdkThmSVyMimHDBHkwlDY7
X-Gm-Gg: ATEYQzwfbix0nzn2js0+1hqgndM4ae/Rz+VgjkxwXNp/zBAYPRxTxJniD53MRbeKmGd
	acWCaw23JlpgDsKSW4n5kLyxFF5vPQaOMbpwNsMoUlyfZt3w47dmAQ3ldbExTD6Bvs8ArVLZSGN
	5N7JtXiWFpPd42rGTHBCj9KvHVYSgVv3ngq/V85BBmDlVulM3y/7TJOiY/S0F7G9G2X7tVMDEcQ
	r9lTyZS7J58Xa01yEXkrlAShv+FjDgM8u6t3eJ03R4a9NqqIcHiSMTafaeBy4v2JlAxt1rccZH1
	nfVqDTvjbn5RdwdZMNouY4DQRS6fS74JnvwPw1k=
X-Received: by 2002:a05:622a:a94a:20b0:509:14f0:bff2 with SMTP id
 d75a77b69052e-50b8221e273mr1541411cf.12.1774377147169; Tue, 24 Mar 2026
 11:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305123641.164164-1-jiri@resnulli.us> <ablV_f_l7wD2m63E@google.com>
 <20260324120057.GC8437@ziepe.ca> <CAFgf54qoFhvVR2yfROGaTJmLcjuLACswVFv=trqgJwGb_DB3zA@mail.gmail.com>
 <20260324122416.GD8437@ziepe.ca> <CAFgf54qwA2D1Xa4rnruJ4Nfp5BsB=T_pB3hzz9HBjh22TL17uA@mail.gmail.com>
 <20260324175717.GE8437@ziepe.ca>
In-Reply-To: <20260324175717.GE8437@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 24 Mar 2026 18:32:16 +0000
X-Gm-Features: AQROBzDqJGwLGVWhhqLuGOrSUtCUROoHSgJZU7HhysiSVnX9qJjxIyI0nzG2rDw
Message-ID: <CAFgf54pB1pikjtx588khBAXDg4vHne+tJL6gBqF64buX0K93mQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev, 
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org, 
	suzuki.poulose@arm.com, steven.price@arm.com, thomas.lendacky@amd.com, 
	john.allen@amd.com, ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56906-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smostafa@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD22B31AE76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 5:57=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Tue, Mar 24, 2026 at 05:36:23PM +0000, Mostafa Saleh wrote:
> > But it's not about drivers in that case, it's about many places
> > (SWIOTLB and DMA-direct) calling set_memory_decrypted() without clear
> > ownership so in some cases they step on each other's toes, and I don't
> > think that will get simpler with yet another caller in this series
>
> I don't understand how this can be, ownership is clear. SWIOTLB owns
> the buffer, dma alloc coherent owns the buffer, user owns the
> buffer. There should be no other cases, and they don't step on each
> other unless the APIs are being used wrong.
>

Logically, that's the case, but the DMA-direct code currently loses
this information and assumes it can encrypt/decrypt any memory even
the SWIOTLB one.
That's what I am fixing in my series. When I respin, I can try to
introduce some more helpers around that to make it easier to integrate
new cases.

Thanks,
Mostafa

> > I am fine with the API design you mentioned, but I believe that it
> > needs clear documentation specifying who is responsible for
> > decryption. The code should provide wrappers checking for these cases
> > instead of having is_swiotlb_for_alloc() and force_dma_unencrypted()
> > everywhere in DMA-direct.
>
> Redoingt how dma-api works internally is some other project... It
> would be nice if swiotlb would sort of recursively DMA map using the
> new flag instead of open coding it but that is pretty minor.
>
> Jason

