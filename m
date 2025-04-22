Return-Path: <linux-media+bounces-30714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A94DAA96F05
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 16:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53FA61B64FF6
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 14:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75032857F5;
	Tue, 22 Apr 2025 14:32:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A87283CB5
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332375; cv=none; b=AssVgjQBGxpUYb8FG0lpc5+i21NwGVn1P+nsfBJOiXuq1ns+kX6UXrz5KH2tmLnjgRbxeXTo1N49LhOYmhPJPo0YatJA6OZc+vlbH5FcT6tZLkgTimW5qhE2OjrCWYHt5GonLiCgAJ+cGeDRZZqPgL1HWSMkX+NSeWzVDc7U6Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332375; c=relaxed/simple;
	bh=dlQfyWF3eamqqkhsCJA5p5DGS05Fmqa6OAYGlUgez+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-Id; b=O6obWHBKBBaW1+7GLFkP1pfAsd8bBuEjC3DAmNvPd2i8RComWuHs/KerWh8PQtCeH1Zr2VqckMEa8HdZpU/vtkXXGoOHIVyZm13m9+YXhnnbHqdAqF2/KHN/6j3+yLsYkK6MyYj7eWFVz056w++CJxkj9xOV08NNkjYgAobS6tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=josuah.net; spf=pass smtp.mailfrom=josuah.net; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=josuah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=josuah.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5882C4320D;
	Tue, 22 Apr 2025 14:32:43 +0000 (UTC)
Received: from localhost (ams1.josuah.net [local])
	by ams1.josuah.net (OpenSMTPD) with ESMTPA id 50d783c6;
	Tue, 22 Apr 2025 16:32:42 +0200 (CEST)
Date: Tue, 22 Apr 2025 16:10:45 +0200
From: Josuah Demangeon <me@josuah.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
In-Reply-To: <20250325102750.GE20035@pendragon.ideasonboard.com>
Message-Id: <37CAUM9WVKFYD.32F5XTP8CVIBY@ams1.josuah.net>
User-Agent: mblaze/f363067 (2025-01-28)
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefufhgjkfgfsedttddttddtredtnecuhfhrohhmpeflohhsuhgrhhcuffgvmhgrnhhgvghonhcuoehmvgesjhhoshhurghhrdhnvghtqeenucggtffrrghtthgvrhhnpeeltefgteevgedvgffgudfghfeugeefffeuhfejjeeuuefgieffffegheegteejkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeegiedrvdefrdelgedruddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepgeeirddvfedrleegrdduvddphhgvlhhopegrmhhsuddrjhhoshhurghhrdhnvghtpdhmrghilhhfrhhomhepmhgvsehjohhsuhgrhhdrnhgvthdpnhgspghrtghpthhtohepfedprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhivghrrghnrdgsihhnghhhrghmsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhm
X-GND-Sasl: me@josuah.net
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Hello all,

First email from me on this mailing list. :)

Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you would
> like to include in the schedule. We will draft and circulate an agenda
> in the next few weeks after receiving topic proposals. If registrations
> exceed our capacity, priority will be given based on topic submissions.

I am new to libcamera, I might not have a full-fleged topic to propose.

However I would be glad to occupy an empty seat as a way to introduce myself
to libcamera to understand how it can help the Zephyr RTOS, which imported
some V4L2-style APIs lately.

https://github.com/zephyrproject-rtos/zephyr/issues/82158
https://github.com/zephyrproject-rtos/zephyr/issues/86669
https://github.com/zephyrproject-rtos/zephyr/issues/87935

I might also be able to attend the Embedded Recipes and Gstreamer events.

Looking forward for it,
Josuah

