Return-Path: <linux-media+bounces-21072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6209C09B6
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 16:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BB181C23B1B
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 15:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30791213132;
	Thu,  7 Nov 2024 15:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CSbWQbUC"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69F4212EF7;
	Thu,  7 Nov 2024 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730992279; cv=none; b=LNyXkMxm6OBuFvue2TAuwWy7VvB7vwRXwF3S1Tqmb5FZF8Q4IRm9mduNV1A49vQeud8M7hlkhTVHq8+CehsIgP5zJqlKaPTh7WX8o1xL65q9wN0VXbelycAbbFUhPP4lZqQdx1vcihjI9z12e/6W3f0K2idb71XTWGI392wooQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730992279; c=relaxed/simple;
	bh=HBKzX96U7sDVHpeC5yhWKW4KghAqWyiEPx7ier2Dsl4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GLeqIFXkVCN8jnLUj0sroIChIoeg5LNbKwh1N8gdZExwHlo0EFlKYWBVUi6Zkie9/iWzaFsflatC3cZBug/cSCqcbEF5t9lUrCgEXfb2Hs0VsCp3utezEWRRJjj2jgUdKBk0Ij4/RQU9/CXBOUoaqoFXR0hEAsSlzB8xX4Oy7FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CSbWQbUC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730992276;
	bh=HBKzX96U7sDVHpeC5yhWKW4KghAqWyiEPx7ier2Dsl4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=CSbWQbUCv7Mj7M/sCkFxcJnd6nL74U4c5a/I92TbnfZ+L+9GCUx9Qf1R/gH6s61V5
	 1qlUthsvXGnseJKNWjOieIflZGI5ZMZfk++FmXpza56eLWHPOS5s0MtzU4tyUqxgws
	 XDlwtNvmGvvSu0ST4F38OSKMor8egsTNaFZ6/p5Bu11ZjDS5t2Uk0f8a1GFZCV3H/q
	 EQhaFIfBctZvyGzLedxBw+LzkqTHMW8HH6QuJIgRYtZ4OG1NO0EfxkxrcR27CZWnaF
	 unai/LQkFhuwyglTer65Xpq9v3x4TCfM0ojLDdvkmnNcX8V+1u2x2czjKuLazFJiWe
	 VEelvyzTu2BPw==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::580])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A859817E36AF;
	Thu,  7 Nov 2024 16:11:14 +0100 (CET)
Message-ID: <2df57a64a4736dbfc25d514faac03d8f431d83f1.camel@collabora.com>
Subject: Re: [PATCH v6 00/11] media: rkvdec: Add H.264 High 10 and 4:2:2
 profile support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Sebastian Fricke
	 <sebastian.fricke@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Alex Bee <knaerzche@gmail.com>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 07 Nov 2024 10:11:13 -0500
In-Reply-To: <7ceb8209-c292-46bc-88e4-2e19a5ed5fda@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
	 <71159f58-be8b-41a4-9fed-522e09a7a564@kwiboo.se>
	 <20241025103022.yuaepqxllwi7gghb@basti-XPS-13-9310>
	 <07674bcb4b7650c21bbb3dbe9855b2240444d4f3.camel@collabora.com>
	 <ab14cb57f3ef22c486afad9eb4aa9abec1b33dd2.camel@collabora.com>
	 <7ceb8209-c292-46bc-88e4-2e19a5ed5fda@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jonas,

Le vendredi 25 octobre 2024 à 22:13 +0200, Jonas Karlman a écrit :
> On 2024-10-25 19:47, Nicolas Dufresne wrote:
> > Le vendredi 25 octobre 2024 à 08:54 -0400, Nicolas Dufresne a écrit :
> > > Le vendredi 25 octobre 2024 à 12:30 +0200, Sebastian Fricke a écrit :
> > > > Hey Jonas,
> > > > 

[...]

> > 
> > I'm done, there is only cosmetic comment, if you respin quickly, I'm sure we can
> > get this one in soon.
> 
> Thanks!, I will respin a v7 with the nits fixed later this weekend :-)

I simply wanted to check with you if everything was going well with this V7.
Feel free to ping for help.

Nicolas

