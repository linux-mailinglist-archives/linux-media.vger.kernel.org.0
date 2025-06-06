Return-Path: <linux-media+bounces-34203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D7ACFDD6
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 09:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81D97188EB5B
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 07:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B538F284696;
	Fri,  6 Jun 2025 07:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VO0x7JZR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210AC7FD
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 07:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196680; cv=none; b=a1SCfCIwHoFkoX8/1WV5jWlb0ogWkHAUln7tQZnwF4d1a8C3RIpAvWOfXyWkhx4uUZHEq7ejoAkyGFrYc290aIX0JJUEkAGfMidp5q5VTVN7gYSoqEG8BUSWvN5esYDBJDEV9ttpaxszEw7oTbl5MEP2RQfgO3geAvTXg6HUcPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196680; c=relaxed/simple;
	bh=SEnPz+W2PK4p9sSTz4NzIk1kzd4NGjwR3bxvWp+YEBg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8HrzxkpUUfndh1Vx9m9TmCum8qOgKU6DoWffmg5CCg9XakNUA0ugkgkL38YhxVAcvtTXaF68wvcmA3C7cATypxdKgHR41QXKoo8mo3ghJL/7HPZ7hkn6Tfsu848BjRZvaoBXgpKpZtmxeh50OK3wp727NjWrBNJL7NgPfN/vzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VO0x7JZR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78254C4CEEB;
	Fri,  6 Jun 2025 07:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749196678;
	bh=SEnPz+W2PK4p9sSTz4NzIk1kzd4NGjwR3bxvWp+YEBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VO0x7JZRMQua3QfUPvKZsfjvS8dm5y2Og9/5Lb343zM9MmwevSHPctCpZCuyNOI/t
	 exx7XVyCoLUpQpdWarwbNrGypWDTikJ08D29degDWgytOFIrIQ2Anzv/mzUWyHH1Ip
	 iwjVdT2GfRwpbdXP0hJw5Tr3IYBEPXRdU9sxcboa2Pw0jUU0JzU0wxSP9UplCZtgIk
	 Dfhzx5FO31A/1XkSTzRWjEboBST7I2B8hBir4USARAQRfC4k48Q3t1RowQg5YUI7YO
	 6tLtNGSI6uu6JYEGL73V8m9OFonu61nnvTQMiIvi1u4ITRt5uQFH8uiDwDqO0Qu5Uh
	 eMY+bNZ00/YAA==
Date: Fri, 6 Jun 2025 09:57:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Yarny <Yarny@public-files.de>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Ricardo
 Ribalda <ribalda@chromium.org>
Subject: Re: Is dtv-scan-tables still maintained?
Message-ID: <20250606095754.1013225b@foz.lan>
In-Reply-To: <beb0d280-bf50-404e-884b-ac20df87b5ed@public-files.de>
References: <beb0d280-bf50-404e-884b-ac20df87b5ed@public-files.de>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 10 May 2025 06:10:00 +0000
Yarny <Yarny@public-files.de> escreveu:

> Hi linux-media,
> 
> is the dtv-scan-tables repository
> 
> > https://git.linuxtv.org/dtv-scan-tables.git  
> 
> still maintained and updated?

It is maintained, but we rely on media Patchwork to detect such patches.

Right now, there is just one patch from you with "dtv" on it there:

	https://patchwork.linuxtv.org/project/linux-media/list/?series=&submitter=&state=&q=dtv&archive=&delegate=

Also, we handle a large number of patches. It takes a while for us to
handle them. Please ensure that all patches you send are caught there.
Also, please prefix them with either:

	dtv-scan-tables:

or, even better:

	[PATCH dtv-scan-tables]

to make easier for us to identify them.

Regards,
Mauro
> 
> Several updates have been sent to this mailing list, like
> 
> > https://lore.kernel.org/linux-media/846e7968-292d-5e96-b2a4-1e2e6b131fe3@tutr.cz/  
> 
> and by myself
> 
> > https://lore.kernel.org/linux-media/6d8986ff-7df2-4ccb-b68e-088005d38f92@public-files.de/  
> 
> but none have been acted upon so far.
> The most recent commit is more than a year old.
> Nevertheless,
> 
> > https://www.linuxtv.org/wiki/index.php/Dtv-scan-tables  
> 
> and
> 
> > https://git.linuxtv.org/dtv-scan-tables.git/about/  
> 
> explicitly ask for patches to be sent to this mailing list.
> 
> Thanks and best regards -- Yarny
> 



Thanks,
Mauro

