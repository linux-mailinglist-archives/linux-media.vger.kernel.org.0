Return-Path: <linux-media+bounces-10423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEDC8B6FBB
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69DD01F250F0
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12EA12C465;
	Tue, 30 Apr 2024 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkUdC8Z/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE3E12BF32;
	Tue, 30 Apr 2024 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473182; cv=none; b=CcqDn7CWeOkCxqhUTGyh7eTpzrwtiATFhi9R1h4SyX1Tou6OBNn6YPB5D9ngRIBYySgkNmCMuXTKQYSojUza0s7V4TI58NfR0sy7YVbR8yDCJsJxGYDvFgYzIMEdP7UCPHLCSEGzwitpz77BpGAaXd6zX+EYcHLpVaOpGMlBe9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473182; c=relaxed/simple;
	bh=CXx9H/lPrKs0RmMqCWhyh3H6OTVL19zf7+UNc+fbOgo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGt2AeNvTZn0kdt/ZAJe/dC6mZ1tpE3TrKyxa6IgAd31fKozryPRHaLW53wZpIoebI3Uo/ZKrlyv53GWmOGWOv/bosD/dqLhvCpP6rWtPpm6J3EO7L4cyh7zsDo1nRME0yGUg5QLog2XkIQG+b/BNBSAQmJhog7D0wUh3LyAPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkUdC8Z/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDB4C2BBFC;
	Tue, 30 Apr 2024 10:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714473181;
	bh=CXx9H/lPrKs0RmMqCWhyh3H6OTVL19zf7+UNc+fbOgo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VkUdC8Z/xaOCIS2ra1ZYdwKyVjkQMkbrzngaxgpai07QX7E7L9Zvx8NIWPdhn2Dc2
	 AsSt5BgkLXW1HJFlDbqBl8DDjqJPfJDkx3uj3SlU+dXDDV2acbnbh+mHOUbu+/fTYa
	 DMV2sfreP09ANayZeX6pCOQT9FBJUtG5eXURvBCFhndevM+jpOJMS2ICrIAMpbItOs
	 u8JDgSBHcAfZab16bzyTtSvh7axPhxHfsx4S+Lpr8nTKEVK0gx6ouDZDpon9kFREGq
	 JLv6OW/tMfYtxsdLyUpqGp7MqR0dPelyKOCsFdIfigHiesBuSH8FmzEhoAbWUmkCHy
	 mw60dcfABzhKA==
Date: Tue, 30 Apr 2024 11:32:54 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko
 <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto
 <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, Nable
 <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, Fabio Aiuto
 <fabioaiuto83@gmail.com>, Dan Scally <djrscally@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/5] media: atomisp: Add support for v4l2-async
 sensor registration
Message-ID: <20240430113254.4539f575@sal.lan>
In-Reply-To: <5dd589f7-d0a7-f453-6835-227013db09fd@redhat.com>
References: <20230525190100.130010-1-hdegoede@redhat.com>
	<5dd589f7-d0a7-f453-6835-227013db09fd@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 27 May 2023 17:54:18 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> > Patch 5 also depends on all the others, so it should also
> > get merged through my media-atomisp branch. Sakari may I have
> > your Ack for this ?  Alternatively we could delay the move to
> > the next kernel cycle and then it could be merged directly
> > into some other linux-media branch. Either way works for me.  
> 
> How to merge patch 5/5 moving the gc0310 driver from staging
> to drivers/media/i2c is still something which needs to be
> decided...

Hi Hans,

Any decision about that? patch 5/5 is still on patchwork,
marked as New:

 http://patchwork.linuxtv.org/patch/92153/

Regards,
Mauro

