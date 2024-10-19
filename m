Return-Path: <linux-media+bounces-19916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F08099A4B95
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2024 08:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97A461F21667
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2024 06:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34561DD0DE;
	Sat, 19 Oct 2024 06:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfyitq0g"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B771D47BC;
	Sat, 19 Oct 2024 06:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729319959; cv=none; b=B8/0IhToHm1dX9cgpiBTJSMQa3pd1Cx73CX3xrKU6ZVoQ8DimdbiAYz7uysNF+iQ3ZiPHs0/TM3V5EY9Bzvws10H3cThCNELeTEAt+yXuVQRX5g10ldUqvssbrx64hoUY1OdLPZa0TVtcc8553mB4gZ3DGk8SblAMigmCTvRFiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729319959; c=relaxed/simple;
	bh=2OMqzVV1EHVYDVSMR6YrmRol1GFScxEW2/cG43gGBZA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FV9vNHFYsyTySHM01oGkLtZR8xhFuvzWX79tZmvXDxMrgtBfj2Vmxdx2vtE94rFXKRkAFGooVxJ5QBQ2U+pBOVETxqFsrl0X2cwaQHknqt9O+bdqYEpHdj/r46w/DoZQ+DePspvDN2Sua1QqfA9qwptb7H209GYNDa0/fv0DLt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfyitq0g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC56C4CEC5;
	Sat, 19 Oct 2024 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729319958;
	bh=2OMqzVV1EHVYDVSMR6YrmRol1GFScxEW2/cG43gGBZA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kfyitq0g+eNsCUvGPY8UFb64I29nqIMBVUJzAQRMaqe4govc4ekAzCVaZIM1Mm5t2
	 De0baG0JRk5Sn7wiCQ/7DP9qIxE9IOX66phqXAbTxfGl/+xLyJWgEJnoQLqRMq9UtA
	 8ZSCn+wnkydfst9+wfhl65xq0XV+pPhqBTLQcISZ5bFFGklAABtuxJn6FjY5NRez8p
	 kylw+jHNRfImc7tAhWZe3CaA5LazyF31QuE+GG/l0KLwdhP1kEcE/9QD/c6ZTmJX9A
	 sE3zys05kgQmnkOwZk+LYit6abp39oWgKhJ0U7cPpLfnyNg2K91zARhVTRMeUM0Kqo
	 j2xHUvH03rodg==
Date: Sat, 19 Oct 2024 08:39:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Philipp Stanner <pstanner@redhat.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Kevin Hao <haokexin@gmail.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Kees Cook
 <keescook@chromium.org>
Subject: Re: [PATCH v2 04/13] media: dvb_frontend: don't play tricks with
 underflow values
Message-ID: <20241019083913.5fb953ac@foz.lan>
In-Reply-To: <4D0C7D12-C645-4766-B7B1-0B34B2129579@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
 <8d6193ed8d53ce94d595cb431627bbc7783c0e4c.1729230718.git.mchehab+huawei@kernel.org>
 <ab51f981844c700d4e66b366c8d2abde7c5947bf.camel@redhat.com>
 <4D0C7D12-C645-4766-B7B1-0B34B2129579@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Fri, 18 Oct 2024 07:37:52 -0700
Kees Cook <kees@kernel.org> escreveu:

> On October 18, 2024 4:44:20 AM PDT, Philipp Stanner <pstanner@redhat.com>=
 wrote:
> >On Fri, 2024-10-18 at 07:53 +0200, Mauro Carvalho Chehab wrote: =20
> >> fepriv->auto_sub_step is unsigned. Setting it to -1 is just a
> >> trick to avoid calling continue, as reported by Coverity.
> >>=20
> >> It relies to have this code just afterwards:
> >>=20
> >> 	if (!ready) fepriv->auto_sub_step++;
> >>=20
> >> Simplify the code by simply setting it to zero and use
> >> continue to return to the while loop.
> >>=20
> >> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") =20
> >
> >Oh wow, back to the big-bang-commit ^^'
> >
> >So is this a bug or not? It seems to me that the uint underflows to
> >UINT_MAX, and then wrapps around to 0 again through the ++..
> >
> >I take the liberty of ++CCing Kees, since I heard him talk a lot about
> >overflowing on Plumbers.
> >
> >If it's not a bug, I would not use "Fixes". If it is a bug, it should
> >be backported to stable, agreed?

There is a long thread about Fixes: tag at ksummit ML.

	https://lore.kernel.org/all/20240714192914.1e1d3448@gandalf.local.home/T/

My conclusions for it is that:

1. Fixes: !=3D Cc: stable.
   This is even somewhat stated at
   Documentation/process/stable-kernel-rules.rst when it defines additional
   rules for Cc: stable;

2. As result of (1), all Cc: stable need fixes, but not all fixes: need=20
   a Cc: stable. Btw, I double-checked it with a -stable maintainer
   (Greg);

3. It seems that most of people at ksummit discussion (including me)=20
   use Fixes: when the patch is not doing an improvement.

> >Plus, is there a report-link somewhere by Coverty that could be linked
> >with "Closes: "? =20

Coverity issues are not publicly visible (and IMO it shouldn't).=20
We should not add closes: to something that only the ones with access
to it may see.

> Yeah, this is "avoid currently harmless overflow" fix. It is just avoidin=
g depending on the wrapping behavior, which is an improvement but not reall=
y a "bug fix"; more a code style that will keep future work of making the k=
ernel wrapping-safe.

It is a fix in the sense that it solves an issue reported by Coverity.

> >> =C2=A0		if (!ready) fepriv->auto_sub_step++; =20
> > =20
>=20
> But this change seems incomplete. The above line is no longer needed.

Yes, this is now a dead code.

> And I actually think this could be refractored to avoid needing "ready" a=
t all?

Yeah, it sounds a good idea to place the zig-zag drift calculus on a
separate function, doing some cleanups in the process.

I'll add it to my todo list.

Thanks,
Mauro

