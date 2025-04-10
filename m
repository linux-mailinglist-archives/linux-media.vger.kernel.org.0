Return-Path: <linux-media+bounces-29977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC14A84D67
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 21:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E34EA1888A02
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 19:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6140028FFEF;
	Thu, 10 Apr 2025 19:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NsJBDvIu"
X-Original-To: linux-media@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E9D1E7C0E;
	Thu, 10 Apr 2025 19:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314199; cv=none; b=kzd+hDEeY5UTAOEVZu/eQ8THV9nD9Ze8AvPIDIWPJFx/+StFohdPXhA18ZKoG2NrdwQiRR3y3cXfJMbj5LcF8i8/Fhg3/sPgCLR+VPguYGlbw5rT5Kupoz1rp6esurPpUm9MnTpyVQecimJeV2v8xafWgmYNLLUsgQYj3nIMZvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314199; c=relaxed/simple;
	bh=wRQyz4IQuOeobQ6+oWOWLytkPWi2sHqUHE81JMBwjcA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IIc3/05kEai1uhPp7Lgj//NhiVEBsSP/YY3bKl1AV/7/QbcYsEpR60D7Oh35ix0UodPy01jPGe7Hbe6BUO6xRBRf4ETPC6+pjwTYiu3ZE5CNLfO0NOhyUvSnP8IGZ9s6vqPgwxeubuoV1q/2Af3hKV4gHBIpJ7WBdTGyUObxsdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NsJBDvIu; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F27EB443B0;
	Thu, 10 Apr 2025 19:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744314189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRQyz4IQuOeobQ6+oWOWLytkPWi2sHqUHE81JMBwjcA=;
	b=NsJBDvIu5HgVDtgdbpqvi5KJSF7Bf3whpBHJOApK7CqmAHv7DqBuJWvm0ikL/NZ3VfCW76
	5tGKBB/wrh4JhP1jMuUirq6gfm0d/NEJVnkhGCMXYVFLCKb4Ysnr6qOeupdiwpZVdwCCHz
	3QPp9O0WhKb5Ykg3K1cLuWiTqAq2x3/xNPfZcuVWex57eM9PI9zypo4c1QC1mk1sqCkUUk
	DQ7JbEk0+SBS8OLbyGZATZ/fr1zyK5CpHCFWoP9OX1bo02zAeBMgu5b8NhW1ld7OVpsrhk
	Bm+RGe7ryoX+z6xdGhJZw9TC6/3f2cHSM7ASkhaVXZt0Vw3Y487+8NYppbKLSQ==
Date: Thu, 10 Apr 2025 21:43:07 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA
 addresses.
Message-ID: <20250410214307.361e373f@windsurf>
In-Reply-To: <09a5beeb-bae3-4a00-9aff-66adf68064e6@amd.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
	<09a5beeb-bae3-4a00-9aff-66adf68064e6@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeljeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudelmeekleegsgemheehtddtmedvudgtvgemsggvheeimegrsgefvdemtggrrggvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeelgegsmeehhedttdemvddutggvmegsvgehieemrggsfedvmegtrggrvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnrghrohdqmhhmqdhsihhgsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com

Hello Christian,

Thanks for your feedback!

On Thu, 10 Apr 2025 18:29:12 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> > Many UIO users performing DMA from their UIO device need to access the
> > DMA addresses of the allocated buffers. There are out-of-tree drivers
> > that allow to do it but nothing in the mainline. =20
>=20
> Well that basically disqualifies this patch set in the first paragraph.
>=20
> To justify some kernel change we always need an in kernel user of the
> interface, since this is purely for out-of-tree drivers this is a
> no-go to begin with.

I'm not sure to understand your comment here. This patch series is
about extending the UIO interface... which is a user-space interface.
So obviously it has no "in-kernel user" because it's meant to be used
from user-space. Could you clarify what you meant here?


> What you could potentially do is to create an UIO driver which
> imports DMA-bufs, pins them and then provide the DMA addresses to
> userspace.
>=20
> But please be aware that DMA-fences are fundamentally incompatible
> with UIO. So you won't be able to do any form of synchronization
> which probably makes the implementation pretty limited.

Could you clarify why DMA-fences would be needed here, and for what
synchronization?

The DMA buffers allocated here are DMA coherent buffers. So the
user-space application that uses UIO will allocate such buffers once at
application start, retrieve their DMA address, and then program DMA
transfers as it sees fit using the memory-mapped registers accessible
through UIO. I'm not sure which synchronization you are referring to.
We are not "chaining" DMA transfers, with for example a camera
interface feeding its DMA buffers to an ISP or something like that. The
typical use case here is some IP block in an FPGA that does DMA
transfers to transfer data to/from some sort of specialized I/O
interface. We get an interrupt when the transfer is done, and we can
re-use the buffer for the next transfer.

If you could clarify here as well, it would definitely help in
understanding the shortcomings/limitations.

Thanks a lot!

Thomas Petazzoni
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

