Return-Path: <linux-media+bounces-65235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1z67LCtMNGqwUAYAu9opvQ
	(envelope-from <linux-media+bounces-65235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 21:51:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0BC6A267E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 21:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NLxsnCT+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65235-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65235-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CB2D3023511
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 19:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E60E346ADA;
	Thu, 18 Jun 2026 19:50:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB8F31B80D
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 19:50:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781812252; cv=pass; b=ZCQzS7kC5oPHWnVA15EIJ0KV5TtV3wuBFn17xw3OyloQCLwn9BV0730iSsSOv0Hwc+5+nfqIU5B5zgXqxAeDsuGmWBKUEO9bt0JWRwta0JE+dXgXer8vCXuiaobu6275TEsbi9j/YtPNUXF4UzGt8eNDy3kMQ0+kujbJGmB27mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781812252; c=relaxed/simple;
	bh=P9K6WR14chQp/Ykaia/hOnkHUL4bXVc8ij7gFNX9Z9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6Z07AvwkSP7oIWOzBxO28TUNdcwe53XwmTWPAMUTDftjeNd0gG31Tsoo807EfKJUcUlrek/+Lzz23HKsBnTuwe+6j7x9BaGIkGNrnCpckvGQHfVazOB41SkaR9U2xa1bJdUuv5Pi4rdSmBlK42fo63ZxRiJ2snyuYvVmhQdWt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLxsnCT+; arc=pass smtp.client-ip=209.85.167.177
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4896ae35be9so126322b6e.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 12:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781812250; cv=none;
        d=google.com; s=arc-20240605;
        b=Lj/4LJRhlSsIIkP0kizOTXG9Ex6dOhhxs1VYNs9WwM/ioDZsemhg+MPE0kSe5yyY02
         fipAr6+ksM9ex1gHWWVLRPNkXtx1G5ZpSIaY8QJnIFiLNrb2y4xLUCdDy0RCs8AQ0bo0
         tPpW/uDCtlLVuoBj6A1Rm8BHhVH/NNjbt/KqOqHPe4NnSEUppfDgGxl7sB/oAE8zvV7a
         TAXtybUS9XVsgQHp5ywAssXlLkNMMnQdwK1ZhHXZfZnz0VBkZcB1RMLPtKX0d0i8jpzy
         dVgwHGgMvuASw5xgveVL7nUtgbBhvUswaDsNvTgu2/4uglzuVLkfknfrd7laOrq2Jb+6
         u3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m8uk5CE0hl2VcGC6A9L2aPBCej9W50w25Jg10wWbW2o=;
        fh=TNtFzmQSp/8vmz1+LLYJj8Y7ORoEtxa2t//KRLhYoNI=;
        b=HN6HsEaqSur4njzS6nMI4sUPvUAl+wURHWQrXMeellQQTmVzPwv5LAqV7CdJaxzBUL
         nOH9IEid4hsEDP33kVhtV5xGgpgxnzfEuKBWhrKBYc0k4BMzTPDAjEzile1ah6Ehfdsv
         4/hewkxbYQanY/HNns3m8VF1wd6hHc0yQfg8NMbXgXlG5Msts3ZoX0oppi23fGJGcPbp
         hRkZ1EbeAvJV7fuNR7E1nC76OcxHbZaoUzzcGnlU1H40QHKec3Ws2x9Wt7lBSMThqRkc
         Jam16SVkij8PnuAjGYnfKvcFf5Ut+0zX8xeJ2jjQ3y+B8LES9/TWni/19Z8JsRUuohdk
         dYfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781812250; x=1782417050; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m8uk5CE0hl2VcGC6A9L2aPBCej9W50w25Jg10wWbW2o=;
        b=NLxsnCT+owKQf9pE1V+vntJwbRp9CQfRJMlTzKZ3tvOg/tbdIQKyvWgHsFPUeyrkN9
         QFBgeahcF1Wv3EGhN1PXruIg7YeKNamWDPEIeeGpUWERVc+0/pr6c14kY9aP7iS5kbpe
         QXk/+NuA9xknKbne7OgnUNaTpllJ0wAOAOLn0J1Za2upAKy417PbyOUQexSyMD2SszHE
         rMExqjNx4oF+KsmhSqHVuJ9zZvfQ2dsuZb3+Fz3m4+MlBa/wEmtN5cmYbsIS1lQabDp1
         oJNqYu1LZYwTAeJJ/WLGKf+ilxH9HqDC5Y/4/3TA+89WS1FYzL53dD+X/YLXrv1At8nr
         fl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781812250; x=1782417050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8uk5CE0hl2VcGC6A9L2aPBCej9W50w25Jg10wWbW2o=;
        b=XKWNvR0NEW1Jz6AZU24cbE9yNsKdqnZ6RwFf1A5Yq5cjIXObq+GAATWV+LWLMNFcNP
         DWi+45rjxiRc3dbVqaNcSRi+wcW3pxr+LuOk99auJoJfQVx6ozcM12F/5wjUyIqQWa+u
         /sqdjV8Uoc6spCUGrvgY44DQ0Xy7xHpruUf2/330WHbRI1SsC+NpCBUrC+wOVocNgwhC
         EmN2p723rQR/N4XKhlK2WuScWlCDXkVmT9od+s4SVWOMpuBi+l15SFwlxemfvOH2cGDE
         RRbWMZB9ln42ohcSM4wzmPUvpVvWmdKoClXdVYgoTaI7QmZ8Vn6unxrXbjix9oXtD9T7
         4AIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xoDjABUV/DnDL+qRH1wjJ1qi4cwLnUgGSPLqJoqsS68ttdCWkXI+XJ+Bd6hgAkQhpcn5Aog+SzcaR1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxailFUHBQKNvQ2LOfzM3cAoHtMJrUxrV/4qzvuPUkFGLqLAR60
	ksy3r1wi8d7tO0CJ1fjxrnbVW6pmsfJQNCxCgtTafV+uc5Llmrlq74gLw5RqthyMEY4bOv4gXav
	62YhpBGJJHaRC9kaVZdsresVxrUjAsjd+nQ==
X-Gm-Gg: AfdE7cnRpZhkYP61kA5lgdTwYBfJuBM94wts+PvhMaB3n8KxeXWN93p/i8Bd4g+ZPRE
	lKdmbCw9WFcyldrI9ZB9189WF0rk0BWRBvFuIp5ZA1xbFhhyIUyd1oclpccNZR/p2r8deq70mIt
	FnPIKRDPHkp/Qjk9dlQi7E/rybawqRxKpJPbCrxVoiN02BOk/K5Pq3BliJ6v0NS73Yrwye/Q2dF
	i0lqX45xMtTB/8SATiBMqpvIL/PtHbY+x9rguFshhbDnb1ZBurOxxG7HrQbowb1Wu01FMIYRNEy
	YuJ+gQPsDI6alSmD7LHupIYEDkQ=
X-Received: by 2002:a05:6809:184:10b0:489:6f90:2f2d with SMTP id
 5614622812f47-4896f9030c5mr155901b6e.20.1781812249493; Thu, 18 Jun 2026
 12:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610215649.98274-1-devnexen@gmail.com> <5663f0e9-cde5-4943-9e77-267cd92f8742@ideasonboard.com>
In-Reply-To: <5663f0e9-cde5-4943-9e77-267cd92f8742@ideasonboard.com>
From: David CARLIER <devnexen@gmail.com>
Date: Thu, 18 Jun 2026 20:50:38 +0100
X-Gm-Features: AVVi8Cc0IYNE825PggY2ZAv2H0gQHi_P04Y0cM-7LkS7GzGPut8mV1A8QGwa_sg
Message-ID: <CA+XhMqwEJxtqBxTAF4XSJxkXW_FGYgEzU1E89bydVvJofnnLRg@mail.gmail.com>
Subject: Re: [PATCH] media: mali-c55: Fix scaler factor overflow for large
 crop sizes
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65235-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE0BC6A267E

Hi Dan,

On Thu, 18 Jun 2026 at 20:35, Dan Scally <dan.scally@ideasonboard.com> wrote:
>
> Hi David, sorry this one slipped through the cracks
>
> On 10/06/2026 22:56, David Carlier wrote:
> > The horizontal and vertical scaling factors multiply the crop dimensions
> > by MALI_C55_RSZ_SCALER_FACTOR, a Q4.20 factor of (1 << 20). Both operands
> > are 32-bit, so the multiplication wraps before the result is stored in
> > the u64 scale variables. For any crop dimension of 4096 or more (the
> > maximum is 8192) the value overflows; an 8192 to 4096 downscale yields a
> > TINC of zero, so the scaler never advances and the output is corrupted.
> >
> > Cast the crop dimensions to u64 before the multiplication.
> >
> > Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> >   drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> > index c4f46651d..0713e7d43 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> > @@ -422,8 +422,8 @@ static int mali_c55_rsz_program_resizer(struct mali_c55_resizer *rsz,
> >       mali_c55_resizer_program_coefficients(rsz);
> >
> >       /* Program the V/H scaling factor in Q4.20 format. */
> > -     h_scale = crop->width * MALI_C55_RSZ_SCALER_FACTOR;
> > -     v_scale = crop->height * MALI_C55_RSZ_SCALER_FACTOR;
> > +     h_scale = (u64)crop->width * MALI_C55_RSZ_SCALER_FACTOR;
> > +     v_scale = (u64)crop->height * MALI_C55_RSZ_SCALER_FACTOR;
>
> Might be nicer to define the macro with ULL instead of a cast, what do you think?

even better, using BIT_ULL here ;) cheers.
>
> Thanks
> Dan
>
> >
> >       do_div(h_scale, scale->width);
> >       do_div(v_scale, scale->height);
>

