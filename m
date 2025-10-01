Return-Path: <linux-media+bounces-43456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5379ABAFB5F
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 10:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D4C33C722E
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 08:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B1F284681;
	Wed,  1 Oct 2025 08:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="iwORFL9c"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456CE1DE2AD
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759308290; cv=none; b=WVe+eVWDEtz4A1zz/75yq4jl9b6EYrcOsKv6itrAyk0AgeulIXdNhzr/mbnInc8kb0XfwKrRwgWfL71Exgd2pENB/Md917tfTsrOQDUjIiRCb8Dz2I7ll4K7HSe3BDME30hJ17nEcoFaOxPCXkG7d4A1Do5ppqPno1uWEbT4ooo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759308290; c=relaxed/simple;
	bh=J5AzrTdLaD4rKVERDhXmfWes7QmBw6rGlNTaYLtXe54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxoVh7p6T3Y/ky5cfOD5THdMD6mijSc/h4nRaMG66tv27f8Z23P8z73HKJKOQpcAJzxBaEYSvFErhFbtPuLJHHic1ij/bN4f//YQyKFUev0i/PXMYEt9B8BOQEW4SK/4qOk9cGWvDFQix3gHMP3zwYJkNTAzGyo0r6Xe+9zvXMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=iwORFL9c; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1759307734; bh=J5AzrTdLaD4rKVERDhXmfWes7QmBw6rGlNTaYLtXe54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwORFL9cJ3oO2ucM6CxH/8CfT+WzGSFIqkGy/23Y28GiK0mPgEEjEMwCAgLyMOy06
	 fe+HUj96geai21F2kmndN/uy5VOkMbCvoy4n9TOZLI1bUcrKwwlkhWRVdSGWMdRFcQ
	 7F2MSFwIR7qJE/aPpBpqbg9y65kHHl9/Vz1HYxs64LY8qHB3qw2MrGn0od6h/gOKvz
	 QPg63AprJnP7tG8ozmcbVhqgKGsKAcpin+oOrEnlzPie66frQZEaf8MIN2Rb3z66vw
	 JruT7GS4J8ZqJ1qxWxwJNq9NSYlsIHw1RRDE7pIR1CWUni53Pev/dELc5YlGU5Qqbc
	 kceE7vw2j5ZjQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 9BF6D1003B9; Wed,  1 Oct 2025 09:35:34 +0100 (BST)
Date: Wed, 1 Oct 2025 09:35:34 +0100
From: Sean Young <sean@mess.org>
To: Gregor Jasny <gjasny@googlemail.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Time for a new v4l-utils release?
Message-ID: <aNzn1sPPJaKbO4IQ@gofer.mess.org>
References: <63e94c28-4013-41c9-8354-bd5a2b9393e9@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63e94c28-4013-41c9-8354-bd5a2b9393e9@googlemail.com>

On Tue, Sep 30, 2025 at 08:01:18PM +0200, Gregor Jasny wrote:
> Hello,
> 
> do you have any objections or blockers for a new v4l-utils release on the
> upcoming weekend?

Ideally it would be nice to have this resolved before a new release:

https://salsa.debian.org/debian/libv4l/-/merge_requests/7

I'm a bit stuck on how this should be implemented correctly though :(

Having said that, it's not a good reason to hold up a release.

Thanks,

Sean

