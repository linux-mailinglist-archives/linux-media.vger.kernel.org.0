Return-Path: <linux-media+bounces-26590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD605A3F963
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01ED87A44EC
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AD11DF751;
	Fri, 21 Feb 2025 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="IspMnppi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ewQWanvG"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D411C1D86E8;
	Fri, 21 Feb 2025 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153042; cv=none; b=OGcgkHWjj6xExoHcu+yxUNebdA9OwIrJkivaqRR59OUwwLn2LRCoMTPBao/KHRwugU5ueC0fEEV+b2GUqY1y3mYXmoc1oFAh1V3EF+laPy48welXyePFau7KOc8Iu/dx/AIX1P30C/VMIVk1QIp7UPX2cgMSHIm+UEZoViD3sRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153042; c=relaxed/simple;
	bh=EbARyPNb+jlyVzuG19efA0T9kXjZX+PQghb+2EgXcVY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Oji1VxF90Ig5BQGkKRXyJ0GJwnrP2BGsMQQ/YFz7O5L6mg8IuXk4R9a9tOom2dG4dc22ceB5UCXZlrByYyyGWmpTzsZy+7+XXpBVbYUuX0JvP+hWnbwSTa3w8KFoyURwgv8Zas6FkH1NctFOFd6humDR+nOpCMr/Dg2y1pCAt0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=IspMnppi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ewQWanvG; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id D1F6C13809B8;
	Fri, 21 Feb 2025 10:50:39 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Fri, 21 Feb 2025 10:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740153039;
	 x=1740239439; bh=pnvUqHTDw+iCr+QQH2n3hqLIs/G3GQG6dM0EjN+vId4=; b=
	IspMnppijkep1HHdVkGuB1JTz3YAWmrqb8sOlkcPogXhM9ib4MM92xHO8owlK97O
	uFozDPfvPI0Z1BSt5Yri1N7WWv4VvFV/bVl/GsKJQB/IQvxxEvJM9CAkUCHMg43C
	Nu4hV0NeTgzPslbFRULJQSPjfBoLmwr//FW5AWrZuujyYtvs+bs45PhSgjHFuLWB
	5TX9JIEetrRwR95bUuIrZXdHc8pvFyBURLCD7lAuxy5tcuASIW/RKi9HBfEALar1
	4i+v+2C8/c4FxzEj88HMlXKHiA4w0fRGEC2FOdNfEC+0BeXOOcOjkoFx4uXwqeqQ
	8PdobZSqHb++AHikSi3qqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740153039; x=
	1740239439; bh=pnvUqHTDw+iCr+QQH2n3hqLIs/G3GQG6dM0EjN+vId4=; b=e
	wQWanvGIluQ8raiRow8D1Xq2O1kWnOpTZTxsdDwD11ScXfSufg9ow4HvrH9KVaH2
	EckEDv2VUt357DCk4GzAsvDG/jIjsXbk1BKvP4UUKwgZzZ1WNbU9g2VEbynFTtbu
	y2IDO8fgqHIk/7wea7j86B6V5aZ0gzyfagvIWWgW+xdgye0N4QS6nAL5Ms1Q3bFL
	K3aPpL4rCQ9KWhcUdRxAGxxsFXMxeR6968OakMu3kKuSf5r9llVxozNFtCpDo6Ua
	jjl8jE5c1ThK2+3jKXtK3IoSHG3wAyuhb/7IwOCe0RG8z0CFI7eARbzKnuXxf9+v
	FupvcO9u3SuKgkrEu+WHQ==
X-ME-Sender: <xms:z6C4Z1Fhp67b2D-TLXC4nwJ72apoCHSpnWj5KQ6Kdb6c2CAVepujqA>
    <xme:z6C4Z6VRVfu6H7CMOl7h9Rrr0g1uBhx7Yp60LzwUuphqY-Ute72yz0Q0FUBeQJ4DB
    XzvpDTHUNYynqngQ5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejtdegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthhgvnhhsohhnghgpvddttddtse
    dukeelrdgtnhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohephhhvvghrkhhuihhlqdgtihhstghoseigshegrghllhdrnhhl
X-ME-Proxy: <xmx:z6C4Z3JZKvzjZsxdiP4uFzD42Q_CupIvIlfKE5_SuC5xcuJz_nxLWQ>
    <xmx:z6C4Z7HtXwDqIkj7RhgO5_ZyBQn9G2g2v9ivek85wLPyFfMMnxaj1w>
    <xmx:z6C4Z7X-1DGFmSG5bfB79qPDx6iruW14rQjlmJQlcZoCg_irSUJiMw>
    <xmx:z6C4Z2OtSdr9I1VDDc2VQZQo6Jc6BkMcMQQOqUa61JDhyT_OTVx3Wg>
    <xmx:z6C4ZxwuugXl---Whs_CETGVcTPyOwvcilyBtA9JyvafvoN6Jcdm9rnN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 055F12220072; Fri, 21 Feb 2025 10:50:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 21 Feb 2025 16:50:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
 "Song Chen" <chensong_2000@189.cn>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Message-Id: <5b300c49-74b2-45b2-8e2c-79476070c2c7@app.fastmail.com>
In-Reply-To: <eaf46d30-71a4-4200-b1e1-6b657372f5ef@xs4all.nl>
References: <20241203072742.191787-1-chensong_2000@189.cn>
 <9489561e-bc41-481d-b542-07fed1161a03@app.fastmail.com>
 <f552e0f5-6350-416f-89e5-e1a0e6aa2886@189.cn>
 <070175a7-1bea-4dbb-8b5b-9edee06fec79@app.fastmail.com>
 <eaf46d30-71a4-4200-b1e1-6b657372f5ef@xs4all.nl>
Subject: Re: [PATCH] drivers/media/pci/sta2x11: replace legacy GPIO APIs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Feb 20, 2025, at 14:43, Hans Verkuil wrote:
> Hi Arnd,
>
> On 12/3/24 08:52, Arnd Bergmann wrote:
>> On Tue, Dec 3, 2024, at 08:48, Song Chen wrote:
>>> ok, then remove it.
>>>
>>> what about drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c,
>>> it has the same problem, are you going to remove it as well?
>> 
>> No, that one is likely to stay around for a while. I think it
>> was actually removed before and brought back because there are
>> users. That one is just the on-chip component on certain Atom
>> SoCs.
>> 
>> The sta2x11 platform was never that widely used and I think might
>> have not been completely upstreamed.
>
> So I can drop this patch, and in the near future I guess we'll receive
> a patch from you removing this driver? Is that correct?

Yes, I have a patch that I am already planning to resend to
drop the sta2x11 platform on x86 along with some more arm32
and x86-32 platforms, followed by a series to remove all of
the orphaned drivers from that round and previous drivers
that got forgotten last time.

     Arnd

