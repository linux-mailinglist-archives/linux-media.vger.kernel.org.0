Return-Path: <linux-media+bounces-22503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E99E1451
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 08:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F010165311
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 07:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51BB19066B;
	Tue,  3 Dec 2024 07:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gGN0n6qE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FXjsTKct"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3077E591;
	Tue,  3 Dec 2024 07:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211171; cv=none; b=U7oZ3qABzOzWco0qcO+Lf6oKop7k+tosep88XEuaejS9h2zou2VNy5ztobxWRcHtky9N2XpeS76xrlI+TGzB8LXERjANXkL4hBCXBNcdGBoGcsDg/t4F7REXxJi/eQUtcjVO441TIv7pXs8h3/Kb64D/naTbdJ/5aFwX2AlEjTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211171; c=relaxed/simple;
	bh=daKMe2Tjs5X6R6YAAIa29MrwPaX7F9VXCKXdsu0ts0I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mzjGIvnx8wpC3xb3mLIQh+I/0eW+JiBGjNduC7QMPE6c9kj2fsBBWt9LE4b2dCX5FjnwG+WfxVnz/QxyZWoXO9g2ycuORvM0h84MnnFZ4lJ+zFRJ0BdF5i3Qf1qHSI764bt7ZeeekQVZySrQPuGttG3Ej4YIqCqaZWOo52R1UOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=gGN0n6qE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FXjsTKct; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 1E42013801C5;
	Tue,  3 Dec 2024 02:32:47 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 03 Dec 2024 02:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733211167;
	 x=1733297567; bh=dYQstFoS8Yf3fld2pUJPpYvHFftaeClvLv1ECDw9H4k=; b=
	gGN0n6qECW4bwtOL9is2LUc+XFkJx1BioNlHbCn+bqi19Zbx/0WtBKgezLQck6Ni
	CJyfLHkrNs78fDDArKsmTjj+hSHO8E/SNYhUmCRrR0LbGQA6X+vCKyLSmVaW+zRw
	Xl7EMLREyd/dPYCE7J7H6Bp8nlSupm7xsPMUY2Zo/OO4X44uQ6zH268Vo0HPOoPw
	GIErMXCmhAWW0WU027rPwNZSS6XXI9KVgS8aQ3gqamUQHGm/2X8cLo0hQw8Pv3Qy
	JHyVJjyZzbrK954h7/cKC1iVSaE/F+TS3IgCZQCHo/6Vjo6Oti9oStVsj48tlS/u
	QFeTOP5oLvWYCcZ94+DmNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733211167; x=
	1733297567; bh=dYQstFoS8Yf3fld2pUJPpYvHFftaeClvLv1ECDw9H4k=; b=F
	XjsTKctoMEchF64nBoobhzUjb53Sr2aBfrRA+w8TboOQO+sfey4HEVC9D3ts+PdY
	zzL7DVzL0z55pMvhJzSVq23LZIgYmlxHFRzhC/cgzkfiRRHuXjD+1lybEVDEfWk+
	iNkd//5emu1BQKX2JtPuxXIeFYxKd186d7Duxv7oM2I9EPHTx5b/BJlnWlOfF9Ip
	GAJvKjrfZiSogBr9P3EF0yvQeQPB73OgUIzt+tNi/3zW7oYOL0ZLg2b6VwhoThPb
	WRmeqvphK5sHhEf7I0QskJg/wTf0r9Jg5E6jSGouYIKfeBiOfrVG83CVwk+swd3A
	1cJgqOdWan2zvyVre59oQ==
X-ME-Sender: <xms:HrROZ6LWPiQQ_jtjz2QNMEuYs1BJbuyV977PSeuVp7LFyrYxzMqc4Q>
    <xme:HrROZyIL5YRY0JpBMhb7hoilUd6Y8klA22XmAwzu2sGNyXC9YkvPxBUPzoDgPhuxN
    8lCvq1eG29q2bYNh-U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddriedugddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegthhgvnhhsohhnghgpvddttddtseduke
    elrdgtnhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohephhhvvghrkhhuihhlqdgtihhstghoseigshegrghllhdrnhhl
X-ME-Proxy: <xmx:HrROZ6uhPhQLROnD443EcTak46prcKYrwRFoksfX4xecMfgnDBZ9mQ>
    <xmx:HrROZ_bjcXwZBl-Ifh7HwnJZVUR-x75pUbnjkdAL1PFUOfCfry669w>
    <xmx:HrROZxbYWAZoSyY5pjfAfnOJfWHk1z_48GVLjsOHnB2jEsN7paOfGQ>
    <xmx:HrROZ7BhJk-7i9sWDf3aHPAkLIZlNxWjIsciC-3z2K5amw0Q6rwluw>
    <xmx:H7ROZwVRwmC42UebYh0589Y47c5Y2M-BubwZ-ulOU8dtL7iC11jd511w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 740542220071; Tue,  3 Dec 2024 02:32:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 08:32:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Song Chen" <chensong_2000@189.cn>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Message-Id: <9489561e-bc41-481d-b542-07fed1161a03@app.fastmail.com>
In-Reply-To: <20241203072742.191787-1-chensong_2000@189.cn>
References: <20241203072742.191787-1-chensong_2000@189.cn>
Subject: Re: [PATCH] drivers/media/pci/sta2x11: replace legacy GPIO APIs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Dec 3, 2024, at 08:27, Song Chen wrote:
> GPIO subsystem is moving toward a descriptor-based approach
> from global GPIO numberspace, but some of legacy GPIO APIs
> callings still remain in sta2x11.
>
> This patch mainly replaces gpio_request with gpiod_get_index
> and removes including gpio.h.
>
> Signed-off-by: Song Chen <chensong_2000@189.cn>
> ---

This is a step in the right direction, but realistically we
should just remove this driver. I'm planning to send a patch
to remove the sta2x11 platform from arch/x86 in a few days
as we had discussed years ago but never actually done.

      Arnd

