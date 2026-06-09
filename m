Return-Path: <linux-media+bounces-64321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L04gBiVBKGpwBAMAu9opvQ
	(envelope-from <linux-media+bounces-64321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 18:36:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA766274D
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 18:36:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=iWDq4LSo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64321-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64321-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F54633620F0
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 16:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980F83E1D1B;
	Tue,  9 Jun 2026 16:20:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A03BCD17
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 16:20:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022012; cv=pass; b=dEqaCloCA+1dmG364pb1HujWxeYtlIjlfiKGe4ZmVpwsK4qiC73Es7IMJvkeW65UiiUQ1wClmk3+9+UxSbxIDdTLrDTKzZecekKjA+OG7rlR+V/nPpuYq184nBD/S0MIpVCgJE47O9M645wFKsGGd84w/unLrZckrMRxKJY5p3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022012; c=relaxed/simple;
	bh=/HJPWGicY5u/dlbgFk0C5NmIj+GOioj715oLeRqp58E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vA3aQLJw58Iklsi+bu/IbUcnAlSgcclRd073giQj7aebkClsJcuWQf7LTXpIJh+sV3hElMe3GC1WE44deQp2StJAmEj5U+vvbw41D7uAHBpDSUpOxw0hVh3fF6ToGVdMC62zlwKFfkd2QBYHFNt1PYParu1nQhm7CPcYBqf7SpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iWDq4LSo; arc=pass smtp.client-ip=209.85.167.43
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa64afcfdfso28419e87.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 09:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781022007; cv=none;
        d=google.com; s=arc-20240605;
        b=OaSbZMLHkdjjXNTB9HEzedsY5a61cWXnFA22zPWy/XVo+wu2SuKxATKnWciQ0lMTze
         96R8f2qqcqYfvcQTOv4phgoA8a5Fx/IvI6dC7KMSpzc1Fi4xefp0ByY/3taEpxPr02a2
         bwj1VecEot4GG58h95juUwiiMKH2Lsa0eBdmaIlzmHlHCwSctkaN2SgaB6uojwFpctS7
         Q9Ok6gY6sHP/dNzrEXVPy244Prn46KJyTeEvmwogflNUXIfHHq4rIXtSsCoPXz2YlcBO
         lKyI+9+BM6ORipItPh2ml382XzPS3A8kCSYvpFo0thxOeZHPMtK7yrimCRIHntJsP3Ow
         M6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pFgomi7XLhEYHICeogk3tk52w0iSafmEFBcU9HzZqyE=;
        fh=Lp1HZIPB/daqqk8YI/GQEwGf48YuuyGM7LINFwYh/FQ=;
        b=TMtcMoKU2rwiOklzjGkcK/YUMUL8PPrMa+U3p/WwQjjcETr8dLWGRxarXNQpEnWvyH
         9SMQ5myl5cPROzkSyYA1lPUEeUEnsD1jZM/nDRn2n+Aned8aHjXyKs7cUg3HP343XMBw
         1UK6YGZw5NH/5GEPbbRqnejjFIE2I2B3ZseymWTp8tycg6LjDVU+zM/3IadFAUCwwjC9
         FqOzI2lT8aMQpgHBz+fHXmU0N4VEWZmzfUimuNfKJzIyA38P1Nx3csz6uglRyFfJN8Ll
         ObfaGmvMl+70mkYm4ix6DfVW6C32ynnPYzd8ruzegofCjQBlhw3G+wgrAJbqx5Ihmr34
         0L4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781022007; x=1781626807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFgomi7XLhEYHICeogk3tk52w0iSafmEFBcU9HzZqyE=;
        b=iWDq4LSoq5vma5XB+QXzeHrn+9b1P9U5WFr8yNXNEQnZfc8bhZ9MbWuVPRKYEHihRI
         w9G+zhw+/dI98L5EuHBny4iZuT5Cscje3krB1aDPS7urcaP8HCF2D6gSFPN1/qGFYqLO
         CIriNbTuKeZXZ3KiZKjNTFa8EgjfAaEcJbI7wl56VSDpSb3EVsVv3I2app16P5e62Ocd
         HzxtJj7o5KFeqen/FAsPGhUyAJdj+GbjLzcwqtCCYlgqABs2gQxDtbS7vYv9dY8hXfPL
         vsTy/eaU3L4qXF+oYJ1njH0umij/oCKhoCCFf12IuQUxZdtlesy/bCLybPKKemvYbSwo
         BAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022007; x=1781626807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFgomi7XLhEYHICeogk3tk52w0iSafmEFBcU9HzZqyE=;
        b=bibhqZ2SjhupkjRaXJqM+emmkuv+zMQIph2NWlwpTVXTpmqv87Xf3hknj3j2uhushn
         zAaFyQ5DTGA3f1n8j4t/yvsAWefdci1rxfdDIVysofLIRVFQ0x/vS02E66ISXYujHVI2
         nXuDZkxYOgp9cvKW09fGUE7TCEtZm7cUeYkAQArTzBhOIufNEb4f/6w+JQymPRWHm+64
         LvYFArIBQIrhgEf7kZmUzyqkjqXg3Ipi+os8fIpRURz+uHPQQio7IurwA5Ebs7WCf49f
         IKurmV98XPydXaQd+VDj1BXT02hKSXIdPBB4DLMGhIRb9ksYcSI+9qMDEtpikLJ8zf4m
         yTUg==
X-Forwarded-Encrypted: i=1; AFNElJ8lTyVxpFnpqpDhW3suXwQ2Hncdgq5miYrl8yVYZvLg/U8WN6dtbKRk2rCZ7CHaKaJ3cQg2oE4+CsmL+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy850L6251W7HE1CaQougUB3TyUOczAx/QVgE20T/tMQLMCnale
	SFc1sFxoimSz7dvh+uXch1LA28h1Ldy9RC6skiDJrXYYr/2nlqz/T9e89lnhYY2qQ1HcO6tm1XR
	N170WOU6/PqdqfoPe2p7HNGZN3TwmjRXZVkYN/oo=
X-Gm-Gg: Acq92OGvW9IXtPgLsJntzRjDU/aEhz29ipqdq++6VcarPCS/DOluA7xGApzZF6sP2Ac
	Rz0njlul23L2FiubMjw0Hw6os9VFTHC1pmZWKYGbcOpOcFlLlxC8iuB+2MNtdhHCDr7OxwcXaLc
	K99hFfWBx2I9358cjQ3O/JPVoFvVLAYPBMvX4lF/hdC6XNYxJ9dbbT2QT6reUZuXQazob4DuR+H
	A23RRtoctm38q31jDMZUrLhFRyfkEppP1SM29d68FL4pR1vUvqEp+vvRNHbjsywjpkFcyf1/iT0
	IDtHazIe9lpscM3i8KQ/tkvCcOlb0CZwnq/Aozim9tOzmOb/Gfs/4eGarQ==
X-Received: by 2002:a05:6512:33ce:b0:5aa:883f:5da6 with SMTP id
 2adb3069b0e04-5aa8864f3c8mr624107e87.13.1781022006976; Tue, 09 Jun 2026
 09:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608194321.150838-1-xuehaohu@google.com> <20260609072234.GB327369@unreal>
In-Reply-To: <20260609072234.GB327369@unreal>
From: David Hu <xuehaohu@google.com>
Date: Tue, 9 Jun 2026 12:19:54 -0400
X-Gm-Features: AVVi8CfbRleRRxp7xUhMkzyUOKJRPcnke7OqLp1gc287gSv21XbS3wDiRLvDI1I
Message-ID: <CAPd9Lg8OtW+qekntqcuL_Yz97=e9bD1gacbyB5uQijL6FpFqYw@mail.gmail.com>
Subject: Re: [PATCH v6] dma-buf: Fix silent overflow for phys vec to sgt
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com, 
	praan@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-64321-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61BA766274D

On Tue, Jun 9, 2026 at 3:22=E2=80=AFAM Leon Romanovsky <leon@kernel.org> wr=
ote:
>
> On Mon, Jun 08, 2026 at 07:43:21PM +0000, David Hu wrote:
> > diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-bu=
f-mapping.c
> > index 794acff2546a..67a8ff52fb8f 100644
> > --- a/drivers/dma-buf/dma-buf-mapping.c
> > +++ b/drivers/dma-buf/dma-buf-mapping.c
> > @@ -40,8 +41,11 @@ static unsigned int calc_sg_nents(struct dma_iova_st=
ate *state,
> >       size_t i;
> >
> >       if (!state || !dma_use_iova(state)) {
> > -             for (i =3D 0; i < nr_ranges; i++)
> > -                     nents +=3D DIV_ROUND_UP(phys_vec[i].len, UINT_MAX=
);
> > +             for (i =3D 0; i < nr_ranges; i++) {
> > +                     unsigned int added =3D DIV_ROUND_UP(phys_vec[i].l=
en, UINT_MAX);
> > +                     if (check_add_overflow(nents, added, &nents))
>
> An additional blank line should be inserted between variable initializati=
on
> and the subsequent code block.
>
> Aside from that,
> Reviewed-by: Leon Romanovsky <leon@kernel.org>

Thank you, Leon, for the review and for catching the formatting
detail. I'll add a blank line, include your Reviewed-by tag, and send
out v7 shortly.

Regards,
David

