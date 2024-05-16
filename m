Return-Path: <linux-media+bounces-11561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2798C7926
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 17:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 797DFB21552
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 15:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79D714D45B;
	Thu, 16 May 2024 15:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O9jJV8Y1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA9614D451
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 15:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872621; cv=none; b=LZnW1qtHyQx/WLafNPqT53aiUZlzPxefk2aegAnxzvhfbsKTNJx2x/vKd7+EcYrjiVSpOfXYmCJEeSebAQOXS63qjBVLdgSiwTgifr+gx2k9mfJjsEmwzQiwJpM3/Rwbzx/1XSGgffwqd2NdzS0sB5OHzFgFMh4c1vis5rlEkPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872621; c=relaxed/simple;
	bh=ZXs22x8gjkyO5FvWfIYFnYooRXNq/Z5RnIzauYycA2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHjGvHV4sx/LtuYV066NCaJy+Cxhu5xHxOPjMq+vkbb5ybV5xc4I1MDUvld/u01NMkPhb8oFFWrt38WnGhGXYVx4dbuXsnEVxepf2m1OcxepiBWCZkDF1vYPycjdjSZ1oBMWtFj8608q3PkL9fvNnf0tzD2XtjjKgK5Blszi8gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O9jJV8Y1; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-572a1b3d6baso50511a12.1
        for <linux-media@vger.kernel.org>; Thu, 16 May 2024 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715872618; x=1716477418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4aYJn/xV/PKWXs5PNzajPV5h6iws4xgG9CE/ZAuxU8=;
        b=O9jJV8Y1NfSroH7pVBI1a0MwoviYauaTDffLSrwHr2ANL2cwvNsI96mZEZwTI9pAds
         gCiIFDAwYiSSz5n2BPRulynH+x9aB+dmA0l7Aus8N3mCNcaEmDeJ3MGVXzRyWKjnQ1/S
         j6sbtkwDE0FGG6Gf98vXQpR3lkExREtyhz+oNSEeewpK/vx0tlJqXKjqeKuPXxt/dFPL
         aA4WFw7MphbIdnuGKeOcPnITQdPmN8ogDcpVB/mtYBU5nnYfi2kMMsduzLGjN4Ab/wJT
         giZYJCUD2uoyWBYbd6iuSFMFFtn6w5V8tfTh+lV1f8OwmgQ+yie8V19JMnOSuhgCvjy7
         yMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872618; x=1716477418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4aYJn/xV/PKWXs5PNzajPV5h6iws4xgG9CE/ZAuxU8=;
        b=Vs/7PTtPEQUl2JGtXM8EvlimqlpjuEYnPIvCcaT+pCL18U8GGZAYSNzsS9zExVfKE1
         7IdO4li8iSPIAO6UcjLVFiIM1JOHjHpVqspy+D0cgwGkDI2vKgEoJkp44sU8j2Xl8US5
         1EB5wwazP5dhIqV95DKiynjo7avqUgULOxxDg0sF4oaXMTRajwt9eatGuUkGO2LH8LjB
         PhdZJL4aM4zjXEei+PMmTZSmWSAcW1uOBl8JKQiVFHM1QapfSQdxUewKqHLLDQAR8IB7
         RnOUeRO5vRhzVdFqB4cBb555gYInG/Q0UmOu10HdLsx7ibT3CuP6TeIyubD84ueySiHO
         +wmA==
X-Forwarded-Encrypted: i=1; AJvYcCVjTCaYTRParArq3WFZRJg4Bn9pPfHTUSH5deLCTLkp8oTcNhduKPdAmHWDXOGxzAwwuZ/Yapv8o++jo4IyBVoVsnXhHqUskRBbt+Y=
X-Gm-Message-State: AOJu0YxMMey9ha292beaTXBs6QvX5m/wXmoVngSd7LCYRh4OppcumYRA
	cIuTt+rqMQvjylclikRMaVanRfmp+qFaHHMnl+QzllR3fFxd9hisCwtFD+wGXRCRYUKjphUevMH
	1UqDjOfLztTd9In9TetclHY3R46+br4PlHkpP
X-Google-Smtp-Source: AGHT+IHMNTC40XpTvgL1XTSP35Cv+n/Rhk6HldIuh2H5A/OEKFOgYm6M15rG805D9tnLx4WQjYkOJaxE+AAac13kuWk=
X-Received: by 2002:a50:c90b:0:b0:572:a33d:437f with SMTP id
 4fb4d7f45d1cf-5743a0a4739mr1000638a12.2.1715872617792; Thu, 16 May 2024
 08:16:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20210416180427.1545645-1-dlatypov@google.com> <b7155efb-e99c-f385-3bf3-3ffcdefd1260@ti.com>
In-Reply-To: <b7155efb-e99c-f385-3bf3-3ffcdefd1260@ti.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 16 May 2024 08:16:44 -0700
Message-ID: <CAGS_qxoSgEGThm3RfSc2jXrCUFwSs6HnfNcsg+EMMvWYWRbKWw@mail.gmail.com>
Subject: Re: [PATCH v6] lib: add basic KUnit test for lib/math
To: Devarsh Thakkar <devarsht@ti.com>
Cc: andriy.shevchenko@linux.intel.com, brendanhiggins@google.com, 
	davidgow@google.com, linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 3:19=E2=80=AFAM Devarsh Thakkar <devarsht@ti.com> w=
rote:
>
> Hi Daniel, Andy,
>
> On 16/04/21 23:34, Daniel Latypov wrote:
> > Add basic test coverage for files that don't require any config options=
:
> > * part of math.h (what seem to be the most commonly used macros)
> > * gcd.c
> > * lcm.c
> > * int_sqrt.c
> > * reciprocal_div.c
> > (Ignored int_pow.c since it's a simple textbook algorithm.)
> >
> > These tests aren't particularly interesting, but they
> > * provide short and simple examples of parameterized tests
> > * provide a place to add tests for any new files in this dir
> > * are written so adding new test cases to cover edge cases should be ea=
sy
> >   * looking at code coverage, we hit all the branches in the .c files
> >
> > Signed-off-by: Daniel Latypov <dlatypov@google.com>
> > Reviewed-by: David Gow <davidgow@google.com>
>
> Just checking if something else was pending on this patch-set for this no=
t
> getting merged?
>
> I needed this patch-set for adding tests for new macros I am adding in ma=
th.h
> as suggested in this thread [1], so wanted to pull this in my series and =
add
> changes on top of that for new macros.
>
> Kindly let me know your thoughts on this.

This patch just fell through the cracks for me.
I had (wrongly) inferred that Andy might have had some lingering
reservations about this patch (that it was too contrived, might not be
useful to have tests for stuff like abs(), etc.).

Feel free to pull this into your series.

Looking over the code itself, I think this still looks valid and
stylistically correct with regard to KUnit.
I haven't gone and validated that it still compiles and runs just yet, thou=
gh.
But if you do run into any problems, let me know and I can help send
you a fixed version.

Thanks for picking this up,
Daniel

