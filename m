Return-Path: <linux-media+bounces-30119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F23A7A87B5D
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1160A16957C
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028CE25E821;
	Mon, 14 Apr 2025 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="poaIFy94"
X-Original-To: linux-media@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF5125E47F;
	Mon, 14 Apr 2025 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621436; cv=none; b=EJ1ChB1fXAtkZP8mdMQQXMN95r9yizPc7VAMYimIrWVxckyeL9F6KlGGlMo8YFbPhmIKhst7C10+/eTUBZmpFeqWyDLzghGDyirVtfcpwvBjRjJVxZMdp2mADscf07VZceNbnHDxWfh/v0mKYAkffw2pBmou71hqG0MbAMQqjwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621436; c=relaxed/simple;
	bh=xwnf/Sjvj94ax/559YbhINvgBbLxXB5CI2acSsKhuwg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pAzq5QfpNWlIPTd05LuXgZaKFdZfKd09IcHHW4nbIQYQXo8hJpMUAu0MnbImp95zXtUKCaBJ8xWEuzrDZhndUR5N8m9rT0f5NYobOZDtgRbVsMonWS6GpxjvEzJkmj2eonYIwlYeXbHKvQvxZIpwBmI9DZ4YmLmLwYJgJZyf4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=poaIFy94; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id A5B105801A3;
	Mon, 14 Apr 2025 08:25:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E06943212;
	Mon, 14 Apr 2025 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744619097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dMI+QJBZXFdwaOEwENZ/Wk7G4tgkYRiH7f6+ILsCAQ8=;
	b=poaIFy94nV/ZDFtWFFz/IhlAKQTc56qy9O2lmr9DKz7Ogo7mebp9fESIlxDMuPTmfvcOWd
	bgApjJNukM6+c9KmnIMZFunUkHpIBq8A8/JlBmY9OGhpcAcLPhWDaO4yaiNup+V+88LQiQ
	hDohe2thkdmiOZIMn8295bCaUFivcSUjKlQFJi3lqmLakNJkIVLJ6tPfnO/jf4qZ2SKqtD
	qXLiyDirqI+j0pzwCN/lI9Vssw81/NfShVSi5c6KU3Tj5BzWzxc66fqEc4ZlHGtGGuP/Oc
	QUmacvOMU5r2CoawdpddXHXxcMNhsiz5X8NkL3FJZBq0E6ZhmbLjnccYOlLdXQ==
Date: Mon, 14 Apr 2025 10:24:55 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA
 addresses.
Message-ID: <20250414102455.03331c0f@windsurf>
In-Reply-To: <Z_yjNgY3dVnA5OVz@infradead.org>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
	<Z_yjNgY3dVnA5OVz@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddttdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehhtghhsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsggrshhtihgvnhdrtghurhhuthgthhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsu
 hhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhgrrhhoqdhmmhdqshhigheslhhishhtshdrlhhinhgrrhhordhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com

Hello Christoph,

On Sun, 13 Apr 2025 22:55:02 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Thu, Apr 10, 2025 at 04:53:17PM +0200, Bastien Curutchet wrote:
> > Hi all,
> > 
> > Many UIO users performing DMA from their UIO device need to access the
> > DMA addresses of the allocated buffers. There are out-of-tree drivers
> > that allow to do it but nothing in the mainline.  
> 
> In which case it does not matter at all for mainline.

It is impressive how "out-of-tree" triggers kernel maintainers, and
then end up not even reading what the patch series is all about (but I
forgive you, because it triggers me in the same way).

This patch series is NOT about adding new kernel APIs meant to be used
by out-of-tree drivers, which of course would be bad, and we would have
never proposed.

What this patch series is about is to add new user-space interface to
extend the existing UIO subsystem. What my colleague Bastien was
mentioning about out-of-tree drivers is that there are a LOT of
out-of-tree drivers extending UIO to allow user-space applications to
do DMA, and our proposal is that considering how many people need that
and implement ugly out-of-tree drivers to solve this issue, we suggest
the mainline kernel should have a built in solution.

Please re-read again, and realize that we are NOT adding new kernel
APIs for out-of-tree drivers.

> FYI the proper and safe way to do DMA from userspace is to use
> vfio/iommufd.

I am not sure how this can work in our use-case. We have a very simple
set of IP blocks implemented in a FPGA, some of those IP blocks are
able to perform DMA operations. The register of those IP blocks are
mapped into a user-space application using the existing, accepted
upstream, UIO subsystem. Some of those registers allow to program DMA
transfers. So far, we can do all what we need, except program those DMA
transfers. Lots of people are having the same issue, and zillions of
ugly out-of-tree solutions flourish all over, and we're trying to see
if we can constructively find a solution that would be acceptable
upstream to resolve this use-case. Our platform is an old PowerPC with
no IOMMU.

Note that the safety argument doesn't hold: UIO already allows to map
registers into user-space applications, which can already program DMA
transfers to arbitrary locations in memory. The safety comes from the
fact that such UIO devices are associated with permissions that the
system administrator controls, to decide which applications are safe
enough to be granted access to those UIO devices. Therefore, providing
access through UIO of the physical address of well-defined DMA buffers
properly allocated through a sane API is not reducing the safety of
anything compared to what UIO already allows today.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

