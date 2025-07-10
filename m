Return-Path: <linux-media+bounces-37245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B939AFF993
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 08:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3104C167B59
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 06:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941D4287258;
	Thu, 10 Jul 2025 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="OGdoka2c";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QydVL9wM"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD38E21FF45;
	Thu, 10 Jul 2025 06:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752128198; cv=none; b=SSIuuhpvQBpQmsRyvXjuIuRDVlgejgQU6GpC3CbBb0LYXRr/Dbp1tk+koRJrf3lAyxeprZlt202Sr5xiKXL8YCnKkSeZstNBkq4M/i1b7grkVUynfUfeEjpcDQh4akmWsaoY80I3UL+DLQ6lP/FvOGI6aIJyygbCilGLg8It9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752128198; c=relaxed/simple;
	bh=g7U9DQUpX2mTrWw0DrMHYSptf6YynulruwIa4rGj4Yk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WcIG4xwR6ObGIWamN3bvCT+5YP2LYXhfWJ6l6nOKmNVsFIqVHara39oaVuGzjC4+lrCImTJORwQO4q5J8Uykp0t+oqJh6/z0H0B1BasmLIZTapN03EtFjJkRi43pZh7IyincKZo2oqq8uGaYtLM0qTwrtXEwsXbukwh/6nGty1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=OGdoka2c; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QydVL9wM; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 95F537A00E2;
	Thu, 10 Jul 2025 02:16:34 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 10 Jul 2025 02:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752128194;
	 x=1752214594; bh=K+JG5xDYa961fGznRteNJLs7eTAxyDHTJWg/TjjZO/8=; b=
	OGdoka2c+JcGBI28jj2IQHk2WR1yL0fw5tJS0gNyBVMIlTqHSnW+QeXBdjuGdw6j
	E+TLkgg0wLsHbko1uiY2EFw21pgq5LdMN2GxJiffzB7T6ulQaVdM6oN3GCH+FJVC
	i1Qc8n6HNa1oW4uZRtzGZukziQ0yl+E5K3CCue9anE9zdEQgLVgp2ZANc2EUQBNG
	o2PMqQ84emHJlxtaRTbVR4/dxC/kMsXM8L9qWcejBA09IuQYwxI2oII79WKQADfo
	89nTMIFae2fDHlOMBywxms+MRwV0MYfeUHBI+BOZ9Fk0r6hiiXhH9acUw3tFd/1Z
	2nQQFxjon0sAiGromjcn2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752128194; x=
	1752214594; bh=K+JG5xDYa961fGznRteNJLs7eTAxyDHTJWg/TjjZO/8=; b=Q
	ydVL9wMs79+urG/WQaJ84af7uZ7HPqtYnxAbJwlBGIXOUu/vwigh2Y2gYRZGxV59
	Jl0cvcgphrdWNQPun3WZxXCMsuXtKtM9erlfqWIATjY1J/0X2rP8hnbRVjUXuiVO
	wM5YuTXpB2Ks80G3KmJSB4Sgf+1ZG4SDoQsmKpfnjWkWWTLBRnhUsIwu0mUpVSY5
	A1gDfqSBBoHQc7CiKaYQaTxun0J9+fZd05+cNVQMAMKYzt23+jvNjxdZbTDn8nwi
	Pcsr7WJjLwoiY+SnfRj/d0mlIs4PEaLqDnS2JeQLl8PWiiqhb+ocb6kKrpRJzUhJ
	DmuVl51257NpHLo68epFQ==
X-ME-Sender: <xms:wVpvaFdKUkMtuBSdUJqcyjI_DhEob4o3zMM-40N6PFLg1Xuth4Bpiw>
    <xme:wVpvaDPt_dqQovU4HjOJLKBQxj-slHn1mf8TBqurc7Qhj7XaqLZdQSGNUctH-Yam-
    A7gY2kqAjKsmjnq3Ls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefleejtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtg
    homhdprhgtphhtthhopehkihgvrhgrnhdrsghinhhghhgrmhesihguvggrshhonhgsohgr
    rhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrg
    hsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehmvghhughirdgujhgrihhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghl
    rdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wlpvaNWFyfdW8FZsWNqOYlT98RrV_UY8WiVDiX_Y3C5cNd2b4y9g8Q>
    <xmx:wlpvaGOdtZzoHZhPU-lz07q_llIl4Uf93f2EpydeRtUqKFVK30bhpw>
    <xmx:wlpvaA3I48zJ54Lo57JHIomzMk06QigekCnIlAxHA59P4wuj_XGkUg>
    <xmx:wlpvaKT2fmQPaL0Q9aM1kLb31LnLPybIMY4qSqPcNDoN8NIzpo1eng>
    <xmx:wlpvaJfF23x_8d5bijzEs8AhcN7PzJ_i9uHMSWvEf5k_kmuZqQA-qds7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DEE8B700068; Thu, 10 Jul 2025 02:16:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tc8565d759ea2a34a
Date: Thu, 10 Jul 2025 08:16:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Mehdi Djait" <mehdi.djait@linux.intel.com>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>,
 "Hans Verkuil" <hverkuil@xs4all.nl>,
 "Kieran Bingham" <kieran.bingham@ideasonboard.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans de Goede" <hdegoede@redhat.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <7bd357f9-9964-431b-a3b2-932cf159cd25@app.fastmail.com>
In-Reply-To: <aG7UWg8kYMNX32MS@kekkonen.localdomain>
References: <20250709101114.22185-1-mehdi.djait@linux.intel.com>
 <aG7UWg8kYMNX32MS@kekkonen.localdomain>
Subject: Re: [PATCH V2] media: i2c: Kconfig: Ensure a dependency on COMMON_CLK for
 VIDEO_CAMERA_SENSOR
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jul 9, 2025, at 22:43, Sakari Ailus wrote:
> On Wed, Jul 09, 2025 at 12:11:14PM +0200, Mehdi Djait wrote:

>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index e68202954a8f..98750fa5a7b6 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -27,7 +27,7 @@ config VIDEO_IR_I2C
>>  
>>  menuconfig VIDEO_CAMERA_SENSOR
>>  	bool "Camera sensor devices"
>> -	depends on MEDIA_CAMERA_SUPPORT && I2C
>> +	depends on MEDIA_CAMERA_SUPPORT && I2C && COMMON_CLK
>
> As of now, this patch makes COMMON_CLK a requirement to use camera sensors.
> I think you should depend on COMMON_CLK only on ACPI-based platforms as
> non-CCF clock implementations are still in use and these platforms do not
> use ACPI.

You are right, I mistakenly assumed that none of the HAVE_LEGACY_CLK
users supported any camera sensors, but after double-checking I see
that there are three camera sensor drivers (mt9t112, ov772x, rj54n1cb0c)
that are used on four SH772x (SH-4A) boards.

I could not find any possible use of VIDEO_CAMERA_SENSOR on
architectures that don't already mandate COMMON_CLK. There
is also no way you'd have the combination of ACPI and HAVE_LEGACY_CLK,
so it would be sufficient to check for 'depends on HAVE_CLK',
or we could limit it further using 'depends on COMMON_CLK ||
(SH && ARCH_SHMOBILE)'.

     Arnd

