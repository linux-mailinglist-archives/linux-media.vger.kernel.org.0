Return-Path: <linux-media+bounces-23280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4159EE3A5
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FC73287266
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7FE21018D;
	Thu, 12 Dec 2024 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="F75htJ2n";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="s32tCYMc"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7343320ADFF;
	Thu, 12 Dec 2024 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997891; cv=none; b=pwQ9O9U+L2xlWx8/KFVfPd9Vsq+PPvMP9Sk5NCINXt/82lAJNN7ORuJS66gUfeQSta+NBBj1XUCE9B8o5UkNT9qTpOjbfGc5ipOWC/BeLdVm67zoFByzQUnQKY7cpuMAvJ5BcqE0HwUuB+LLVBgzC5eIZJppD/CB5O32q0X3gZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997891; c=relaxed/simple;
	bh=MvjvJedxVi39cmufsneQCxttLPU6XQDFHmRLwf97mIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfWf8+Vtr8ZSgDwzqPxV0GHsyIcFK7z2+4cebq/p5qV53TJL56hxnoJtNXUnrycNLS+AewBWI14q08V95kNrUsFFa0o/nAZZfw3wbzbWt25+CBYe46OH0ADUglbKxAb1qpXQJUdZA7iZBvxue4xPn23gc6sbB6aUCj8bBYGlfrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=F75htJ2n; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=s32tCYMc; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 126CC25401FD;
	Thu, 12 Dec 2024 05:04:48 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 12 Dec 2024 05:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733997887;
	 x=1734084287; bh=d2j3q46wcAVx6x8kQZsDiqm5aMDx7oaUziemzmxHC4c=; b=
	F75htJ2nW9h/jSaUD4iDqqRMAPYHWqMfd2XhSDJKY0jWWCYVwi/3eMXCW0QxqwGu
	H4jeAXwLnlwgGkovQTOHHZFD9jb6tc4Wa4LDxW/lR38IvN07QTLrJq1K6jbuf1LC
	UtA6bwIDqbePfEh8rWSzadz5tVA8tKGxcb7NvrYVynuWAUJ9mGQkX5D7gfxLTzyy
	gLDa6i6Z6J84JBpnanZ/QX+eIEDft87/fceFFXKTRjscIcfP96L2sN4w4GOpeboJ
	m/JHHKLRY51hy2PNZIJ/l69//6gdJKX2aOIfgaB/eYASyPYnlq2339WIg2kDQ+fL
	/Wmuiv3lnt4fQgTuUafEVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733997887; x=
	1734084287; bh=d2j3q46wcAVx6x8kQZsDiqm5aMDx7oaUziemzmxHC4c=; b=s
	32tCYMclrhlHZQ3EHYcy60yu6/QitGebGnrbbHhM7rZD383wWWO2VhbCYE8cRr2f
	bwPyijFZM+lFOL1BCVl44ieHGsVJfjWW71R244of5fzFmKjiFVSRfK/s3+7M0io8
	LEMnXwlZf7iQOpeqIgcK5fPBzIG5us5bHLupfpYBIAAK6h6RDUyFU3W1s8MRCE5X
	BwRN2wbXhaZhzQbUmv7kU3TaOIgdbAzNWnTbYFJKl1RpAGEL/kmkqccN9ZkIrbdN
	PsshSTu3YVE2kokD7kZTK3XSqM9LoCkmkwcl9Vf2qHIEmHvm6ECISjaW0sscjqSg
	ETxubaWxP8E09RTGpmvTA==
X-ME-Sender: <xms:P7VaZ6ady-sJJGAKmS3mEerMYhd0wuDYm2WZ7WsGwB3flj9_Coz7NA>
    <xme:P7VaZ9ZfU-Z7CGYIey6n2LlEEFHULY23Wc639uQh8WubN7yBWx1lOoTyhU97CqmZ_
    xFxrF5d6az59XkQAoM>
X-ME-Received: <xmr:P7VaZ09qQt41rm1z_HQHox4VrAhY71CcdP0UMPXzKZJhZUoJ-fJMCuj32AXU2frb6fMGBPcqNf8QHuMPRwknUArZRZL5BRRBmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvle
    einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgr
    khgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmh
    gthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughi
    rgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvg
    hsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:P7VaZ8qpgRUuFj9fes9-opqCf_Pnk9EDtUEur7OMeqTxO-gYIf53uw>
    <xmx:P7VaZ1qLPJXoBDlIHomG2v92MVQmg_ek_COrboakwLQTx7q-NDHKNQ>
    <xmx:P7VaZ6TN2POousjS4MZN2yLJETmwQY0tABhyoaO48VpM3Z0FqyQXAw>
    <xmx:P7VaZ1p43tnhuNiqlTqPKwOdlxVWuNsECBrxnY9ikCLvqO3uleCJkQ>
    <xmx:P7VaZ2n4YOJ9jra2U4Q-YT3e0_VKrwVbwo0ip4PJhG4p9hGF8Rn3V5zl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Dec 2024 05:04:47 -0500 (EST)
Date: Thu, 12 Dec 2024 11:04:45 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-csi2: Update D-PHY startup on V4M
Message-ID: <20241212100445.GB878403@ragnatech.se>
References: <20241210155400.3137792-1-niklas.soderlund+renesas@ragnatech.se>
 <Z1qOr7oSdIr3R3ee@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1qOr7oSdIr3R3ee@kekkonen.localdomain>

Hej Sakari,

On 2024-12-12 07:20:15 +0000, Sakari Ailus wrote:
> Hej Niklas,
> 
> On Tue, Dec 10, 2024 at 04:54:00PM +0100, Niklas Söderlund wrote:
> > The latest datasheet (Rev.0.70) updates the D-PHY start-up sequence for
> > D-PHY operation. Unfortunately the datasheet do not add any additional
> > documentation on the magic values.
> > 
> > This have been tested together with the MAX96724 available on the single
> > board test platform and it works as expected.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> This looks like a fix. Is there a need to backport it?

It's an update to the start-up sequence. Both the old and new sequence 
works in testing. As the datasheet don't document the magic values it's 
hard to tell if this is a real fix or not.

On the other hand, the DTS changes needed to use this device on R-Car 
V4M are still pending upstream merge so we have no in-tree users of this 
device. I don't think we need to backport this change.

-- 
Kind Regards,
Niklas Söderlund

