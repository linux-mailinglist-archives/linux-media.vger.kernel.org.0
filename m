Return-Path: <linux-media+bounces-48142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD268C9E9DB
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 11:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 914554E060F
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 10:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279E22E22BF;
	Wed,  3 Dec 2025 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4B5U4hN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819032DCC13
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764756018; cv=none; b=B5ZxZjGiDcqDJRA1NVfU//BRRfNqedCoNO2BbzfxIXAUBsTT5AZDURnvuRxzgYRmlY/KBe45uvtCz/3ruxezUG3xpGORnSU5TtAlDzNxzgDkxIbAMqqwgO24Pr5RwciyzwVjPNu1Lkkv4JTi4HCd4cmgfgD7JqU5ECVBWeog4BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764756018; c=relaxed/simple;
	bh=LK8jqJ4MaYv8MyokVfpKNiC90DFgpsSgegRfYBBAems=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oT639cUuqF85NJnCK8c/mtoxP7/JPQMa/CyxPSsEQLtdu24JrYdhm8o8tEOz2LyzV5BjTNQ3ZcwGg0O5PMJ91/3gQzLNS2EBI4VxRJDZvQc1nuW9hch/CCUg2B5rJsnrcLnjCPufQ3wN+hEXdlsFtMj/oxTDYeCIoL2JL3cpL9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4B5U4hN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582DBC4CEFB;
	Wed,  3 Dec 2025 10:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764756018;
	bh=LK8jqJ4MaYv8MyokVfpKNiC90DFgpsSgegRfYBBAems=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C4B5U4hN/VCJc7ZzN1BtYVA13pbIW2c6rnqYxzKlHsJp4FLTgzaKx/4+s5Y42bqCd
	 apsI9oJ9ym9GPMKXIDk/QZbFcrvHZXsz1ROQEVsHKKoj/QrA2i/W4/YD200ce+/Qes
	 2tQZOykoXDbQ3QQxQkBc+Z94fScFkNokx/jn1rLQluhMd3VEhty2erruPoCPzFKYTb
	 qD8cViUhMtWViYjmm7SJumAZjNLaJidzbZ2Kyb5z4LFRD8yQfPWQm3HMrDHD3IXi5j
	 ZyTQi7Dj/MwshyWAM7IgWKPLTb9EGv3knFX1ebAUz8lCbftqxgsGk8AGtf05zvSib/
	 CA3kh7DLWFX5g==
Date: Wed, 3 Dec 2025 11:00:13 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCHv6 1/3] docs: media: update maintainer-entry-profile for
 multi-committers
Message-ID: <20251203110013.365716b6@foz.lan>
In-Reply-To: <20251203104328.23d3139c@foz.lan>
References: <cover.1761571713.git.hverkuil+cisco@kernel.org>
	<1495ec4ccdcdfab788fa9d02e11a6028a455e31b.1761571713.git.hverkuil+cisco@kernel.org>
	<20251203104328.23d3139c@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 3 Dec 2025 10:43:28 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Mon, 27 Oct 2025 14:28:31 +0100
> Hans Verkuil <hverkuil+cisco@kernel.org> escreveu:
> 

> On your version, there are 6 types of maintainers related to media
> subsytem, plus the ones on MAINTAINERS, as one could potentially be
> a "media maintainer", a "core maintainer" or even a "subsystem maintainer",
> being responsible to update patchwork but still not having commit rights.
> 
> I don't think we want that.

Heh, I should have read it to the end...

From:
	https://hverkuil.home.xs4all.nl/spec/driver-api/maintainer-entry-profile.html#list-of-media-maintainers

it sounds that you're actually proposing exactly that: have a mix of 
maintainers with and without commit rights.

On such case, I think we need to define them as something like:

	Media Maintainers
	-----------------  

	1. Media maintainers and reviewers

	- Everyone that has an entry at MAINTAINERS for a media-related file;

	2. Media Committers

	- Subset of media maintainers that have commit rights

	3. Media Core Maintainers

	- responsible for one or more media framework;

	4. Media Core Committers

	- Subset of media core maintainers that have commit rights

	5. Media Subsystem Maintainers

	- Those have commit rights.

I won't add (1) to List of Media Maintainers session. We have already
the MAINTAINERS file to track them. Keeping two files updated with
the same data is confusing. 

Also, we need to plan a cleanup MAINTAINERS, pinging and eventually
drop or replace inactive Media Maintainers.


Thanks,
Mauro

