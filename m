Return-Path: <linux-media+bounces-26796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60496A41B0C
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 11:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 429CD3B2481
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2225D2528F8;
	Mon, 24 Feb 2025 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXxddi3L"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EF419F121
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 10:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392991; cv=none; b=CsQxlBmEee4cmPedMoumk+tN7Q4Xm6OsEVLinH/Gaht13KDPm6WyxypG51ZYFwSDwkm1+Cqu5VrBSo4aE7Vtt9oINvtIgDy64lPOKnG+qkffLszjxIOb7hpna1VHHRz84qz/8s/NAG7qZBxKDdhWq7n6u+Z3kf1HH6/28Let1ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392991; c=relaxed/simple;
	bh=gYNcLNu8iyXeWXA46NxPt3I+5KnieMEmY0jqwC+2Xkw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NxZsYTuw9r8H9gbG7WOxCYrT8TGYQUqeknRf6UqhkHirHkv+SZHgIQFqCVVUDRV0CDXNP/DKkzUANezLy4UKijaYhJDHsxgTNOjIqO/npQlchs8N+AoZUeww1SfRq/15SW+3U1UX7ZJg7eexrnfwC2wBN6CxOaxJ6hNwN/yYztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXxddi3L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B37C4CED6;
	Mon, 24 Feb 2025 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740392991;
	bh=gYNcLNu8iyXeWXA46NxPt3I+5KnieMEmY0jqwC+2Xkw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gXxddi3L2lG2ZNHytT2tPaVzeupx32UERZgkPqRIT7+Vw5pLCIf3PBlo+MThM8DWu
	 TUBBFKsldAfw5Cu+hAEhv7aP7q+PMNWSMRnzTQCy67cHkjqvVDZune9g6dyTOg/x6g
	 kUh98OxA39SoNcRwQhyLRq6kL+64EzTjEvnnU9DWSTaOv+ry4hHCrAU2gYAuVNV1eM
	 M3+w6X+8loX+nX0Taa8b2/sl9wUaeVZLfKP+VlSFUKct2lMuMs3Gfph5Mv5TEBkVTN
	 anMu4RDqwRgBIQ3N4vHx0ruewSwr4X5D8+KtbKWkzixPO7UYqEvR/lh+VQND7K59oR
	 pIXxgeCgbWSYA==
Date: Mon, 24 Feb 2025 11:29:44 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add 2nd media maintainer, fix patchwork
 link
Message-ID: <20250224112944.029218f6@sal.lan>
In-Reply-To: <cad348e9-2d0e-44b9-b105-c55b9af1992a@xs4all.nl>
References: <e7a4c286-13ae-4025-b765-ee7055476cf1@xs4all.nl>
	<Z7xDlG-2c_3SPqVg@valkosipuli.retiisi.eu>
	<cad348e9-2d0e-44b9-b105-c55b9af1992a@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 24 Feb 2025 11:16:50 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 24/02/2025 11:01, Sakari Ailus wrote:
> > Hi Mauro,
> > 
> > On Wed, Nov 27, 2024 at 12:55:59PM +0100, Hans Verkuil wrote:  
> >> Add Hans Verkuil as second media subsystem maintainer.
> >>
> >> Fix the patchwork link: we use the patchwork instance at linuxtv.org.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>  
> > 
> > This patch is not yet merged. Could you pick it?  
> 
> I'm not a full maintainer yet, so that part is premature. But there was
> another patch that just fixed the patchwork link:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/edb356f1ff58fe5938ffb275aa2574d127bed822.1733319659.git.mchehab+huawei@kernel.org/
> 
> Mauro, any objection if I pick that ^^^ one up? While it is originally part of the
> media committers model patch series, I think it can just be merged separately.
> 
> The bad patchwork link in particular is rather annoying.

Yeah, please pick this one.

> 
> Regards,
> 
> 	Hans
> 
> > 
> > Thanks.
> >   
> >> ---
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index aab0827938b6..c0491036448c 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -14353,10 +14353,11 @@ F:	drivers/media/platform/st/stm32/stm32-dcmipp/*
> >>
> >>  MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
> >>  M:	Mauro Carvalho Chehab <mchehab@kernel.org>
> >> +M:	Hans Verkuil <hverkuil@xs4all.nl>
> >>  L:	linux-media@vger.kernel.org
> >>  S:	Maintained
> >>  W:	https://linuxtv.org
> >> -Q:	http://patchwork.kernel.org/project/linux-media/list/
> >> +Q:	https://patchwork.linuxtv.org/project/linux-media/list/
> >>  T:	git git://linuxtv.org/media.git
> >>  F:	Documentation/admin-guide/media/
> >>  F:	Documentation/devicetree/bindings/media/
> >>  
> >   
> 

