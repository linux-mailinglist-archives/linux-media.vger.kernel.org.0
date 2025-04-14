Return-Path: <linux-media+bounces-30152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9091CA87F91
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55B7F3B0A51
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3451B198E77;
	Mon, 14 Apr 2025 11:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JgU96GVi"
X-Original-To: linux-media@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1D219924E;
	Mon, 14 Apr 2025 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631326; cv=none; b=GJrSmICxUCaLCFgH/ULd4wuqJfhfIvL1AQqojHowTuaMuPsV8/6/AL9QNKrXggYwojqJzuYaG6N/lLAfHXjIzKOz8GaISVhdkE1Tx0eY10S9iNqPF+GBz/fHiDt90VtWlP/A7fQf+/M4XoGPcP5NWt4DlpoQ1afd0/QQR1mPhG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631326; c=relaxed/simple;
	bh=iSPshvzpE8zoSw79jci9fdSoHi9dXqSVQIl2Q2vgGbE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H4vOtkQMb/PKE9yQLkj4iaE9WvvmFz7uKWWSbLwxktrFCviTpKzHJca7XnV1/aL7G/aSabXfMyF6HqxP7MT/sbZ5TaxueIOSLwfWqPjgKhP+Cd2GO9wmfqAo/IJYCLJR6dOpk58Yc1qqG+Pgm0Ionv7nht7OxA8FEhcDF2yDbvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JgU96GVi; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFCA14397C;
	Mon, 14 Apr 2025 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744631315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6CpKHYE4RH4SAXoypcVbA2iREoZ4cwFDGsOs3AGUT8=;
	b=JgU96GViuEpr6Ee/o8L3t8o0PE+3idNIeLwwIP+gM42sBs3YvHKEoIHSuMQJflU1fbAdH1
	ohhsDbozYc/YFec+Wa2vCrTZ5qPOMsIE2GUnsbl7j9yBSODLxQO3gHeDgbk/MjMnCPCmtA
	pS8QFNNZBW8OJcCHj+0gUafNDCLuMZCt6K7tqC3J0BoLVmO8hLYcHVWuj8EB/xY63fJiWh
	UO3swrUc/eO+2LWv7BN3t4jI9aj3v8t+shXVgPcMJ4wuo8Xe6OGy3EWgkbX6Fl2mpUcYTH
	vy8dOVkDpKHYl/x1RP4ULFadCcmKe+OjU02KymlZZqHjlrVakzkNrUJpeL2bhQ==
Date: Mon, 14 Apr 2025 13:48:31 +0200
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
Message-ID: <20250414134831.20b04c77@windsurf>
In-Reply-To: <Z_zwZYBO5Txz6lDF@infradead.org>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
	<Z_yjNgY3dVnA5OVz@infradead.org>
	<20250414102455.03331c0f@windsurf>
	<Z_zwZYBO5Txz6lDF@infradead.org>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehhtghhsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsggrshhtihgvnhdrtghurhhuthgthhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsu
 hhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhgrrhhoqdhmmhdqshhigheslhhishhtshdrlhhinhgrrhhordhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com

Hello Christoph,

On Mon, 14 Apr 2025 04:24:21 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Mon, Apr 14, 2025 at 10:24:55AM +0200, Thomas Petazzoni wrote:
> > What this patch series is about is to add new user-space interface to
> > extend the existing UIO subsystem.  
> 
> Which as I explained to you is fundamentally broken and unsafe.  If you
> need to do DMA from userspae you need to use vfio/iommufd.

I'm still unclear as to why it is more "broken and unsafe" than UIO
already is. As I already replied in this thread: UIO allows to remap
MMIO registers into a user-space application, which can then do
whatever it wants with the IP block behind those MMIO registers. If
this IP block supports DMA, it already means that _today_ with the
current UIO subsystem as it is, the user-space application can program
a DMA transfer to read/write to any location in memory.

Therefore, providing a way to cleanly allocate DMA buffers and get
their physical address will not make things any better or worse in
terms of safety.

The fact that it is reasonably safe is solely based on access control
to the UIO device, done using usual Unix permissions, and that is
already the case today.

> > I am not sure how this can work in our use-case. We have a very simple
> > set of IP blocks implemented in a FPGA, some of those IP blocks are
> > able to perform DMA operations. The register of those IP blocks are
> > mapped into a user-space application using the existing, accepted
> > upstream, UIO subsystem. Some of those registers allow to program DMA
> > transfers. So far, we can do all what we need, except program those DMA
> > transfers. Lots of people are having the same issue, and zillions of
> > ugly out-of-tree solutions flourish all over, and we're trying to see
> > if we can constructively find a solution that would be acceptable
> > upstream to resolve this use-case. Our platform is an old PowerPC with
> > no IOMMU.  
> 
> Then your driver design can't work and you need to replace it with a
> proper in-kernel driver.

See above: your point is moot because providing capabilities to
allocate a buffer and get its physical address so that a UIO-based
user-space application can do DMA transfer does not make things any
more unsafe than they already are.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

