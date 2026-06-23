Return-Path: <linux-media+bounces-65483-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TFa3JbL0OmrcMwgAu9opvQ
	(envelope-from <linux-media+bounces-65483-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 23:03:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D35936BA2E5
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 23:03:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=NsyOM0NM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65483-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65483-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EE0F30683F6
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 21:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A233AE6E9;
	Tue, 23 Jun 2026 21:03:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7523955FD
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 21:03:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782248622; cv=pass; b=bGIcELR46k5sZF8lPd4PqrlA73v4fgwF/2agozrSJF1K7NqJs8vhH/bcLUrcm7M/SOxGFP8XZ/PQ/p5YpU/O5wfHcEspvQKZ839+dyFqTVMR4YMbyF+CsmEofqnsZbYsH7aLaNNBbYM36eOSD5s7BLIShbRgz9PBiH5OFgKWtwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782248622; c=relaxed/simple;
	bh=Slm3EEkSH4PB9RQu260syQQELF+PaB3Sj0996Hd4Y1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBqS51mgWBVzcAHSpcg7AfXZTolZZD4ce75wl+C/0FGBWK8gHpeacHz6z+C8DeweACmYHkA0qWmxuCXNwLZsq8xuBI7i97vwiOIzCyOKMzJEKztUF9Jn3mU0N/8VdSMRqNBVwR6tCe80BZkcdY1RLBAz8aYxF6JIjMS6huTcpEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NsyOM0NM; arc=pass smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49242f97da7so16745e9.0
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 14:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782248619; cv=none;
        d=google.com; s=arc-20260327;
        b=KT0HBdgd/Apt1iFpIOxabHBVkRWN/xuL1VLQZeGuRtgKmae/QfEVlzMdjiUkOvBJlJ
         nXEqcZMgVlZGUGhy0VahS9C25USQKGjDN6z4/4tVbx5zNf6pigDhBVNP1SfooH1zosqR
         fAQxGuG/P0jsQip/aLCdT7DLcNWwSE0fPIjNIF3YVwKGAxUAnf2AqLwSWIv/vrvRzj0a
         e425herplMR0R+dBMstDtuBje2v89Y2063j25ieHKt/oWc1cKFDCQ2B4O5W7gh4AqcB8
         3TmgXK4zkre3hvKmXjBLlVAuzXIOMyQ5cOKtK+71lwgIHNhwK5krK11TKIwoZvazZc55
         qL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Slm3EEkSH4PB9RQu260syQQELF+PaB3Sj0996Hd4Y1A=;
        fh=xhzx9YAIptrRbb379iWDn0wjPQoy1ApZuLkWoSla1H0=;
        b=YaHuuLhoB3X7oKv/twliCK8Z0tUYHkxoDkm7BXbVjE+Ggnj8Pr/CECJ76Kmb5PdAqm
         dDVRUpnCVs8D+9bAWpuYmKPvEYy6V6+qATlHzW4wwWhcc+8S5+22OWUzg1lMFDiKMUY9
         5yxA6c9VmC172I/7m+m4Nz7WPmU48rMMz1l2uvYXYMSX0JdQu18UH0vxgbpxJHPX9jpj
         lkT95ZA0YDqnj6M+xuxZ46zQHdiFg1ws5hibASxwbwXhg/i4BkpopRSgTCd2uEv3BEAy
         itocwo4IW/om0fEevxA/qrjz6jgllTv7bgSGckn/eHsoDRn4O34QKC+uZfxRTID9UmEa
         zulQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782248619; x=1782853419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Slm3EEkSH4PB9RQu260syQQELF+PaB3Sj0996Hd4Y1A=;
        b=NsyOM0NMQ3sDYLzFqxBKwAc6kB01W7OQqeMF4H9vWkDXngXCrwZjqp2J4IjEjW/dzy
         qqiR7sPP0WvJWCbWuuUj6JxuLFJUcE300lPS2HsXjLfLEzMAkjbe6XgMxnj+wk/4M9zR
         XT7xwuyi5upgdBK1VSjDCRDJ1Fzd7mtbZLuIITmUhXttdLuDkZarC74LRfxatbO9j7LJ
         byky2Gi3Ym3rQ5+RmyPyYX6s4RhsdeU7H7UF21u8P53YUZZ9qJ60neaXI5sOVRRJdzI5
         IUI5Jp7MI3M8RVSL+xZ7bbKXeRjJzNhS90oSWE8ybB3/YQc462W9semN2GMEY3rC8DGh
         CX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782248619; x=1782853419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Slm3EEkSH4PB9RQu260syQQELF+PaB3Sj0996Hd4Y1A=;
        b=cOkZPvgG/lx96y4oBIVTLUEHgHmNrLCqwmyfwGIamsdOZLjOPbsYhec+Mp4U0SDR5r
         oYU12XLL0XattWi+FS7SFoayDvO+gvpae9uFfJg0wKbq+r+D7bsUwyp6A3vjQBzPoOYM
         iOzZmQ22rjQmxlYpd2qhhqx8gMy9Ndu7RzGfNaMepNPtC5i0D/mqmct5kSRbf3+i6Alh
         CDFXx6TSync5NX9e1mjheL/7It26bW1KbrPgKy3E+CAlcSn6FdxyDmhlgSSi98msC2fA
         0QkuEFsARrThBjYa3Eg3P58zw+PT8mNKSEyOEKNp4ED8rqKy6LXE4qi/s33GlpZvazu5
         NFvA==
X-Forwarded-Encrypted: i=1; AFNElJ8eBV+DgbMuIDPlDi2ILDMug965TC80/tfCjBWWyYO2bnsroo3tZlETJZzQrEUM3yQdsRQgnMobq8Pmkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfh9WC+qfdTm+22yhNYjuV0Rby9y6BNQ8DLtC9jvelB+ua3OD
	zlQrqfIYasWZ8hbY6cuaeqK6QjGoslps0hE8y5lD9QXyhT62ebYUO42C8+yl/VAfVaD7DIzIEHy
	wmwGFoxrXjStCnYHri6J9CH1/PrNm08HU3duDeu4=
X-Gm-Gg: AfdE7ck1tcMP3ddnYLy3KpIta23GFkWvFbQQmOB8E07un4dPbSMN5S8+hSD9Odt40bd
	2+H/jiIpDB28exN5xAdYi0AVtZ0uQu/UEcPd+oP5/XtyKUq00ndCx1HLPZupl13iotmDDV4uhEc
	/aYpmSAgKsRPqr+2/sEGJ2OHSgmq835RFbqEXipGHtrzJRO0wQ2ycuc3sUqpcLnhAVwDhfIuwJO
	RUhJHsunSH4MNgM5Vtr8CleGIaRqyBwsqJPgXBXhwC3Ef/M2jSv/PtpFMeKw/jF6MLVqgJ9bwsg
	FYw=
X-Received: by 2002:a05:600c:16d3:b0:485:1a54:9407 with SMTP id
 5b1f17b1804b1-492603072camr290785e9.0.1782248619190; Tue, 23 Jun 2026
 14:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621222130.1667453-1-xuehaohu@google.com> <20260622091344.794e0d74@pumpkin>
 <CAPd9Lg9+d=Rw4230FdcMFd0VYfyhXhD=eju53iURR8c61iXsWw@mail.gmail.com> <20260623092501.17bef195@pumpkin>
In-Reply-To: <20260623092501.17bef195@pumpkin>
From: David Hu <xuehaohu@google.com>
Date: Tue, 23 Jun 2026 17:03:26 -0400
X-Gm-Features: AVVi8CftE4Qz-bzNimcxnNDxPCuT9w5jszdF7jgeQ4PkwmMrpP9oMduQaXpAyA0
Message-ID: <CAPd9Lg-i8Agh7_E5cd2CmtWww1cM2PW3A243qtQaHxhvHdjCQw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Split sgl by largest page-aligned chunk
To: David Laight <david.laight.linux@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com, 
	praan@google.com, kpberry@google.com, sashiko-bot <sashiko-bot@kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:kpberry@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65483-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D35936BA2E5

On Tue, Jun 23, 2026 at 4:25=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Mon, 22 Jun 2026 17:26:10 -0400
> David Hu <xuehaohu@google.com> wrote:
>
> > On Mon, Jun 22, 2026 at 4:13=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> >
> > Hi David,
> >
> > Thank you for your review. You raised many good points regarding
> > optimizations here. I'll switch to using 2G as the max entry size
> > (`SZ_2G` from `linux/sizes.h`), and remove divisions and
> > multiplications. I'll also replace the `for()` loop with `while
> > (length)`, and drop `min_t()` in favor of `min()` by casting `SZ_2G`
> > to `size_t`.
>
> You shouldn't need a cast at all.

Hi David,

You are right. It looks like `min(length, CONSTANT)` works well here
without triggering any type mismatch warnings, regardless of whether
`CONSTANT` is `SZ_1G` (`int`), `SZ_2G` (`unsigned int`), `SZ_4G`
(`unsigned long long`), or larger. I'll drop the cast and send out a
v3 shortly.

Thanks,
David

