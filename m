Return-Path: <linux-media+bounces-30153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C2A87FC4
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B31516B54E
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A8629B20D;
	Mon, 14 Apr 2025 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IhGYi+h7"
X-Original-To: linux-media@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDC4293B7A;
	Mon, 14 Apr 2025 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631561; cv=none; b=YPCOxKmRADKZeN3XPkRpRhBSsa77me8udoUT16M5OUo25EQ0khg5PykS1qbiN8gNwfjwG/rQM0L0RcAN3PDyXmY2aPWO3AS+4Cs39macttB9v4+B+3GCzC8aRwXlS6JGj6PBKp6mnhMQ/KCOu5tMa+jS0DdWsGad0Vg0Adm18aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631561; c=relaxed/simple;
	bh=O7fwWD1mrXhcYE+62v3u8tACzz3xgehepQ421SFC7Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uav0O1drH2tkzKf7uin8BL80c3FJ+FHegdqWb7c0Kuz7DT1lu7w3hduq3B4jz6Qo1fAvTBavNOEB/OYJH9zkVCs/z+4D7KdM+wUurwZUPvnQTjhhwpprXWvxAeDfhYYIIbiZEgpywnZGVi6xAzDW94eruQ31wOnS99LVsQAnrUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IhGYi+h7; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FFE91FCE8;
	Mon, 14 Apr 2025 11:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744631551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7fwWD1mrXhcYE+62v3u8tACzz3xgehepQ421SFC7Y4=;
	b=IhGYi+h78AvbQGLD5cEOJulxIDP+2+4l3nLgXrIGuxmV9DsjjL+7P340iwkXJSV2LUV7s4
	THBdzmeFxAxisAiks8R2gwmyUqgB0BhN/Q2+9xb1u/UIC4a6sVgDua9OjJPr7PEVRRrPzE
	EOw7dha9QqISuFU89I981uZaI8/YnLtAScOsAzcPDenHsWofgNSyRcERL9EwI8icCeVx4A
	oU9/uF4aKTrzuvOWxiah8ItsZLI4AjH26n/gm4N10FqxvhiW9COuZ9TpL9Q6JG//LVuPkh
	zJFRriURbRjyzsUfjkkRQ/VFT3bZtAZtTrhjQ/QN9Z4/FGZoIuL2HsfKUNBoTQ==
Date: Mon, 14 Apr 2025 13:52:28 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Christoph Hellwig <hch@infradead.org>, Bastien Curutchet
 <bastien.curutchet@bootlin.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA
 addresses.
Message-ID: <20250414135228.600c13e6@windsurf>
In-Reply-To: <29eb3698-7dc2-4c32-b636-8ef0ee6d1f47@amd.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
	<Z_yjNgY3dVnA5OVz@infradead.org>
	<20250414102455.03331c0f@windsurf>
	<29eb3698-7dc2-4c32-b636-8ef0ee6d1f47@amd.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehhtghhsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsggrshhtihgvn
 hdrtghurhhuthgthhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsuhhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhgrrhhoqdhmmhdqshhigheslhhishhtshdrlhhinhgrrhhordhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com

Hello Christian,

On Mon, 14 Apr 2025 11:11:48 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Maybe I should try to better explain the concern here. The question
> is "Where is the source code of your FPGA driver?".
>=20
> I mean that you are trying to replace the out-of-tree solution is
> rather welcomed, but the out-of-tree solutions are out-of-tree
> because they don't fit with requirements to be added to the core
> Linux tree.
>=20
> And one of those requirements is that you need to provide the source
> code of the userspace user of this interface, in this case here that
> is your FPGA driver. An MIT/X11 license is usually sufficient, GPL is
> of course seen as better and it must not be a toy application, but
> rather the real thing.

Where is this requirement for UIO? The UIO subsystem does not have such
a requirement, unlike indeed some other kernel subsystems such as DRM.

But the practical situation is different: for DRM it makes a lot of
sense to enforce having open-source code in user-space, as we want to
force GPU vendors to open their OpenGL/Vulkan implementations. However,
for UIO it makes little sense, because UIO is typically used to control
some super-specific FPGA IP blocks that are totally irrelevant outside
of the very specific product they are included in. Most likely if those
drivers were open-sourced and tried to be upstream they would be
rejected because their usefulness in the upstream kernel is basically
zero (but they would have an on-going maintenance effort for the whole
community).

> And that is what people usually don't want and that's why no in-tree
> solution exists for this.

And that doesn't make sense because UIO already exists, and allows to
achieve 95% of what people already need, to the exception of this DMA
issue.

Thomas
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

