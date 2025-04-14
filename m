Return-Path: <linux-media+bounces-30193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE9A88C38
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 21:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C46B1889127
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 19:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689A928DEE5;
	Mon, 14 Apr 2025 19:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EoEQDZuW"
X-Original-To: linux-media@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A13828A1C9;
	Mon, 14 Apr 2025 19:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658492; cv=none; b=M+up9dVLDHHekLyFYL+zDy26fvYGSIaYgdxPviEFNRAuK6BjZi6KWCNkvJ8Clr8XuiaZAMVpl/3QD6kjD2hg5HS/WE4pPmPZ5xFTiy4aptCnqxfXaqaFji5jRFD8cxd6dUgWQlXyPexCvaYUHvU1hpmGK6i4V4dn/e9DWR2gDec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658492; c=relaxed/simple;
	bh=KEB78xiO8S8KyZq4+E0nFd+GD2Mhv67xJLJE03UULAE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iK0RtUHmktLM1rxBxR9NUhYKNbqny3b9FAKm/ER0VC7e6bM83liWWvnB7j09sAkDZzBrn2JXCMVjGpx3BpCHh03cTNnG2cHS1io0Y1EHnMfCmKyyiGyVkd/UOAzaAyW+pFUXpyOht4Cgp6sjbgfvqVUmijtYxSHyWRj3HnZDm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EoEQDZuW; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A714A43B87;
	Mon, 14 Apr 2025 19:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744658487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5GTu46taMVNxHpTDe1teTJEFAE0ftANyUse/UH9TgI=;
	b=EoEQDZuWm/YFxLogtslK/wvSP90b71yi6k3yAgSkFaq1eyiOvFAO0AZwteNO1jxBIiH14c
	6ywnyjrkBdxEvcYxzdL2AaC2O9tBOis7LvxlYJfB9mmYPcYnO8jjJQHwuC+M1IVe6s9OmN
	mlqsJs1U1o2UPUFWZj3rvzZEYD+BCNsC+Ed07UrTm05B4xG795lHfg+EKAfd0oGvYE5V1S
	5HV77zJHOhECQ05uuRvl7yoHfXPkYWHB5kW5xFyKEnNUlHf4WRifcNmQ1Cf3EcXxlk/Cqg
	plpAtDX9I+vTjiFP8y8iHcYMybhC51TFA36OCqQiCQvNwo7ACUHu/lDclcV3FA==
Date: Mon, 14 Apr 2025 21:21:25 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: Christoph Hellwig <hch@infradead.org>, Bastien Curutchet
 <bastien.curutchet@bootlin.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA
 addresses.
Message-ID: <20250414212125.4b3e6f33@windsurf>
In-Reply-To: <8f55367e-45c0-4280-b1ed-7ce9160c1fad@ti.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
	<Z_yjNgY3dVnA5OVz@infradead.org>
	<20250414102455.03331c0f@windsurf>
	<Z_zwZYBO5Txz6lDF@infradead.org>
	<20250414134831.20b04c77@windsurf>
	<8f55367e-45c0-4280-b1ed-7ce9160c1fad@ti.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddufeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohephhgthhesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsrghsthhivghnrdgtuhhruhhttghhvghtsegso
 hhothhlihhnrdgtohhmpdhrtghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com

Hello Andrew,

On Mon, 14 Apr 2025 12:08:44 -0500
Andrew Davis <afd@ti.com> wrote:

> "UIO is a broken legacy mess, so let's add more broken things
> to it as broken + broken => still broken, so no harm done", am I
> getting that right?

Who says UIO is a "broken legacy mess"? Only you says so. I don't see
any indication anywhere in the kernel tree suggesting that UIO is
considered a broken legacy mess.

Keep in mind that when you're running code as root, you can load a
kernel module, which can do anything on the system security-wise. So
letting UIO expose MMIO registers of devices to userspace applications
running as root is not any worse than that.

> If your FPGA IP can do DMA then you should not be using UIO in
> the first place, see UIO docs:
> 
> > Please note that UIO is not an universal driver interface. Devices that
> > are already handled well by other kernel subsystems (like networking or
> > serial or USB) are no candidates for an UIO driver.  
> 
> The DMA subsystem already handles DMA devices, so write a DMA driver.

My FPGA IP block is not a DMA controller that would fit the dmaengine
kernel subsystem. It's a weird custom device that doesn't fit in any
existing subsystem, and that happens to do "peripheral DMA" (i.e the IP
block is DMA-capable itself, without relying on a separate DMA
controller). So this (very valid) recommendation from the UIO
documentation doesn't apply to my device.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

