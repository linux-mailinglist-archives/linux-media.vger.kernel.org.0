Return-Path: <linux-media+bounces-44951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7F0BECDCC
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 12:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57F05189B775
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 10:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A0B2FB974;
	Sat, 18 Oct 2025 10:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyoxoJ8z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBF32288F7;
	Sat, 18 Oct 2025 10:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760784842; cv=none; b=KYO2P3Y6kL/gzZ7VZES0TBrTGc2P5F3v9aEQUp6z/OrfaDYAg7CSWIb/3kO5DDe73Yrpla0HoOVUHQU2QhqaBOL7nIqSz5SxWUmq76KJy4MDCie/RWqLHs5EWgjFUinaiKwSBmdBOAS17YYrdm1t5BVPf4bHWqNLInF1bTZDaBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760784842; c=relaxed/simple;
	bh=1Z/hD03YVImB7lanZMyt3QIb8DmJkGRNAKcbP5nojF4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RvX4LALJTT5xwPdPLgAjCVD64XbU7PIrc7fVfC8f8kiVZ/4Iv6B03In4ik8Pos6a0RpJWQz0yTDpG0sS/2CTdaurDWNHH9sFwvTBbpXlHJNzTO+huYm4Gf4rfgTuefL07KTUwQWu1IV0m5xGm64s8PjAkGa4+dRJ6gp70hWFeeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyoxoJ8z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FB1C4CEF8;
	Sat, 18 Oct 2025 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760784841;
	bh=1Z/hD03YVImB7lanZMyt3QIb8DmJkGRNAKcbP5nojF4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NyoxoJ8zTUl+FmqSBpVMegFKlDK24FWQFMCglpdnl8XOPOh1N3l4SoKrd6Z+BmqLf
	 rVx7k/g+2Gqz4N+U+0Cijmlj3Nv79BsanLViFNZA0vXOtlkXBCTtUxqBQr8/KwxJQD
	 C6TCfCRonMUP7Qxiqd8YJ/OcHvlJJZAKLBQpx7FBFRELx6RIKZIKPdNNcF6ocTf4hF
	 2Jv1ZmHHUrZ/7wRj+qvkk7axxPCiUQO1XgCqiUY9n8l1UbJ9dHcu2PIxgEID4d4z4J
	 3b1TrEBVkVkjIqkZWlitJyS3WpSY+ZuCqGbQMaPShiTlJG7R0t8Vot8CiVJQT9Mwkr
	 URGpSDGi//+hw==
Date: Sat, 18 Oct 2025 07:53:52 -0300
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 00/23] Fix media uAPI cross references
Message-ID: <20251018075352.4f65fc94@sal.lan>
In-Reply-To: <87h5vx1ebc.fsf@trenco.lwn.net>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
	<87h5vx1ebc.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Jon,

Em Fri, 17 Oct 2025 14:08:39 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > In the past, media used Docbook to generate documentation, together
> > with some logic to ensure that cross-references would match the
> > actual defined uAPI.
> >
> > The rationale is that we wanted to automatically check for uAPI
> > documentation gaps.
> >
> > The same logic was migrated to Sphinx. Back then, broken links
> > were reported. However, recent versions of it and/or changes at
> > conf.py disabled such checks.
> >
> > The result is that several symbols are now not cross-referenced,
> > and we don't get warnings anymore when something breaks.
> >
> > This series consist on 2 parts:
> >
> > Part 1: extra patches to parse_data_structs.py and kernel_include.py;
> > Part 2: media documentation fixes.
> >
> > I'm not sure what's the best strategy to merge it, as some patches
> > belong to doc while others are media. So, they can be merged on
> > either one of the tree, or split on two series and merged in
> > separate or even being merged via a PR applied on both trees.
> >
> > IMO, the latter is the better strategy.  
> 
> OK, this series has been applied to -rc1 and is available in my
> media-uapi branch.  I've also merged it into docs-next.

Thanks!

Merged on media-committers next branch as well:

	https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/8652359fc004cbadbf0e95692c1472caac6260c2
> 
> Thanks,
> 
> jon

