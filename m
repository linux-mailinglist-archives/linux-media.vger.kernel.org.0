Return-Path: <linux-media+bounces-52464-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PFILLo+imktIwAAu9opvQ
	(envelope-from <linux-media+bounces-52464-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 21:08:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E579114561
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 21:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7BB13020E81
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 20:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AE2329C5D;
	Mon,  9 Feb 2026 20:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HvKYiNEB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC2E2C11DE
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 20:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770667697; cv=pass; b=nuGMh251/nKyylfQmRLX9MbqwnjiOUX7riMoePTe3GSMKjWe9RaI77w8U68PFOy0zG3bTI2WQvNL0xz5lG23gBju6V7Roo/fNp3tkDXgmcf0TJwzydubM+lxG2LawWFTnoj4Byo1n2hMmlf/Ig+9QmPlA9DgFKJnSB4bmgnN+u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770667697; c=relaxed/simple;
	bh=87ivso5DI1kS8+gT+30C4NuY1qiQblQsyNrdFsbbIQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvB9WvGBk8Z+j81++SYvAuRDihMCnnzWmeIodfZ86WgnXlptMyv/bVa7tItP2vLUk6epLIkFFYcqHZ38bhQnFThnwIWXwGudP+P01TRPJXgDdzM85C+OBJXXJh2stwPLAiUW+1GzSdBS/LWGicu5zSefTj42QqM1itqIocfwock=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HvKYiNEB; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8849dc12f6so12235066b.1
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 12:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770667696; cv=none;
        d=google.com; s=arc-20240605;
        b=YNK/JcWIfN21bc5cGbgVFEl9jXRGm2RH73PbsvhhlTmoPALX/IImg6ZP4E/f+s6IkI
         l6oQIT0C4Flws1gXmoQAE+TxxMcyVFsawX7vsvIp7OVzizKzz0MJqCPXbC8DH5+ImeFj
         8bzIP1ju1hz5qt4eZumB2SJAse6EhFle6G9cgWb8ni/bnwTdmtMBObpG5w+5CjK5kkF7
         Va6uLIbN6ElufT9Zv4uPVlf+9GS4PF8TVuWRXjTkvaYIXCc76HwW4ak7npJ9kAgxtGk3
         URVj+pJPsETE2RxRebffxA9pp7Rx8vNbWqzH+VF9LWbVGns1o4XTxKhmbSHxeA1L4i5I
         tl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ogWTbSZ6gUFcHF4DB6Cif+r0lW3KkX6R4Nx10iOT0E=;
        fh=3d1LRo1/zgbSTraZP+HUvwT/tr27udCWvG5Q6iuQtK4=;
        b=kuoUpk4RGIFY3iGrx1gROxQJw7xhenN1m3cLT6RbsgubS3+UVxWY71hcTArfJaGIta
         chHmLvHLti12qeCSyK217wi7Qk2W8+XlTSKbKOdzwFtNu6whdtI66NNE8e6RLEeAZVsE
         EEBq1wfkPGyThL4fsPMSZ1VFeTg1ccqMJP7FnJJKZ99gbYPwktQuXUOyHGXDFYNEWInB
         AmzS4ctQX+8KZVY66tI4lvlMS3TpilXA5h4Pr8vd9w06BrmxPRQbCD0JHGQ4ftil7n7j
         nFxtA2ScBLTXwG4MT9jSqTdaXCzb+5YDxZQ2Y262ZPMLDoqeJJuygV3iUOb5Bj5lOX3s
         bgBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770667696; x=1771272496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ogWTbSZ6gUFcHF4DB6Cif+r0lW3KkX6R4Nx10iOT0E=;
        b=HvKYiNEB99bsxcHeAT+50ZKL5pjxQWJdOUO3M6ymI9G9OKYSnoKRqJj64z4rQXO88M
         ef6iY5fOWTVmudW48DmuCB/yED+afm3061mgUdbFajuC9yJOWJTfy9nS/yZPPqC63gbR
         CnDwaYBiOqJPs9nhpx+jGKW1Hnv9a0WJRV0bi3ldhv/TXEuIU7/yuB6YR8mVNa31R4Bu
         f02zaSEW8cU5f6ayZWiP+AdSPuqQIsPm0040L2BoL4voA+mjFRFW9hxIBvXFgPEDO0C8
         qnfVDO+25FfLzPj3YFS8YYo+TzJsfkjDzQ3xkKKcVRURDj9oVTwxWZ1m73jD3rVdtLoZ
         s2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770667696; x=1771272496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ogWTbSZ6gUFcHF4DB6Cif+r0lW3KkX6R4Nx10iOT0E=;
        b=q6a47fc7b2z8wzvVKoUrBnXy8SWswKA6HFtNss3cgZeKHeOFaKlQxbIW0cVqwciaza
         Hog1WgxvGJnxhORxdUJ28+TMdDryW3hGMCO14X6SGVk+ziYgWHaTYg81re+Jzn40JwlN
         XIoWiIbTyG20aceIyVfZuROv5FzRU3lHChJJEuCKkHQ7JxiOh2Q5mMIYBzwoWJlf8eDS
         3BuuTI9W0DoslXi+05/OkLE0zEO3xfCsm6Dlr+w6zWOvYZMq3ezYUvs54tp3yFKWkPNx
         N+qFf0CKYlB6JKM+2vUxNsMkLt9r2A/dyyonYPovL23L1KpfOsZhKQlp6hhKL85RKh29
         NB6w==
X-Forwarded-Encrypted: i=1; AJvYcCXFPjfnur3EesgjY3pShz/U1VS2j5Qkrd3OOEdVu8fUJxFDXQ73mdkw9Tz6JCCbK1oAMP6zYf/lFC3bdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxREfGm524D+GaqWdgBoP2uGaXWkINHzerejiAuZfCrRwx/8PpE
	JvXC/sjoINqemcQ99QX+QkcshQrc5D5H7oDzMjGOtjRYtjvc/zG3dYRT/Sb26F2I6SQmGsSUvvs
	xs+az+vF3Bo893m085CnUhEkTANOejQBKMs67xds=
X-Gm-Gg: AZuq6aJadGGDQ5aWmc1BR9BfnT548MSg5yppj5hyyCDwEU7Q0s0o7QOcRO+vO0pDJAQ
	ITy6p9jnRu1d1jBICcYi5W+tGHzwoHVTFVKURr+lLYdXLh1CfByL8hbz8PY1D6uoP8ZakbxRBBq
	uxTtQWv7b7QEB1DTljsRSyqYFRg7RrFt0yq0q7H6MNoy6sTBHgtX+xX/PnZE5hCZCHGMh8KV52w
	SaSWhKzngPZY3ZJhqC5Mh450sYQ/gIwVUs4gK/IFOx46fz8FCCqfnkHJreAFqaADUrAazL73nP+
	ohGplHBp5qJVaEZaPlk=
X-Received: by 2002:a17:907:6d0f:b0:b74:984c:a3de with SMTP id
 a640c23a62f3a-b8edf25a954mr696952366b.28.1770667695453; Mon, 09 Feb 2026
 12:08:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209153809.250835-1-jiri@resnulli.us> <20260209153809.250835-5-jiri@resnulli.us>
In-Reply-To: <20260209153809.250835-5-jiri@resnulli.us>
From: John Stultz <jstultz@google.com>
Date: Mon, 9 Feb 2026 12:08:03 -0800
X-Gm-Features: AZwV_QgqaltPSA0q99dWV0j2auNF_GQoTvkX0OemEzMtzBNfhVP0pPFcsDiXkzY
Message-ID: <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap flags
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c04:e001:36c::12fc:5321:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52464-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,209.85.218.52:received];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 2E579114561
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 7:38=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Currently the flags, which are unused, are validated for all heaps.
> Since the follow-up patch introduces a flag valid for only one of the
> heaps, allow to specify the valid flags per-heap.

I'm not really in this space anymore, so take my feedback with a grain of s=
alt.

While the heap allocate flags argument is unused, it was intended to
be used for generic allocation flags that would apply to all or at
least a wide majority of heaps.

It was definitely not added to allow for per-heap or heap specific
flags (as this patch tries to utilize it). That was the mess we had
with ION driver that we were trying to avoid.

The intent of dma-buf heaps is to try to abstract all the different
device memory constraints so there only needs to be a [usage] ->
[heap] mapping, and otherwise userland can be generalized so that it
doesn't need to be re-written to work with different devices/memory
types.  Adding heap-specific allocation flags prevents that
generalization.

So instead of adding heap specific flags, the general advice has been
to add a separate heap name for the flag property.

Now, there has been many discussions around "protected buffers" (which
doesn't seem to map exactly to this confidental computing primitive,
but sounds like it might be related) , which have bounced between
being a allocation flag or a device specific heap without much
resolution. I appreciate in this patch seires you've pushed your
concept down into a DMA_ATTR_, as I do feel the kernel should have a
deeper sense of protected buffers (or any general propery like this)
as a concept if it is going to be a generic allocation flag, instead
of it being a somewhat thin creation of the outer heap-driver layer.

But, it seems like the use case here is still far too narrow for a top
level allocation flag.

So I'd advocate against introducing heap-specific flags like this.

thanks
-john

