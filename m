Return-Path: <linux-media+bounces-26456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878E0A3D9B7
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 13:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E12C17CA7A
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 12:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E041F236E;
	Thu, 20 Feb 2025 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="K+UIOMIm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ccz0z+l5"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292781F1527
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 12:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740053921; cv=none; b=k2VtgWIOOUUNYI5MHzOPJ48zFPvP1xVFtVDTvRlmzkNuvGyvGODE1Xl7fGuaO5ivOcPmiSxT0tHRggbaP85QZXZyAFbA1tjEcTOqJClGQV4bRrfoQJjZKL0AdiduhE0K/uitoQ1mb1C2jf7bbHdCDHkQ9KgQwHXPgW3KvxL1p30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740053921; c=relaxed/simple;
	bh=spsmHAL8TTu5Mi/c2bc2SaKszpuTpGgLjTLec3n2DLc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=msZOjNMPh3lMOsuyIA/l2s+ABHXs0eDbC+ePNQbHVYP2PNIkrjI8NUClAV+sNS3VA1nIiqWrY0xAZ3qCp2rGMtFl23AxmOH/7ha8wj6AdV9+nnfD/Pv8xn2LY7hIxYI4vFSEd9mCeLwqMq8kIN3TP/Y01ychYDKL8MV6R/+nZSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=K+UIOMIm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ccz0z+l5; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2D780114019D;
	Thu, 20 Feb 2025 07:18:38 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Thu, 20 Feb 2025 07:18:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740053918;
	 x=1740140318; bh=IhPaoNu38Tu0uvZG6/scQD1YbIIjuL3trPnifXE0rh0=; b=
	K+UIOMIm/1NrxU/sByEI24chw6FvuCM4HQdEfmar5TNDWELWbTH1BBcty42hxVyB
	5iPvDN2NcNIBvvRbWBoP9o51O10QiRdkIpII6905G9FQwnCm2TEdGdGE5w6gPrkQ
	GJH2lRbpKqBB9VCBJH36mEWSMyp9uK3Y9z/PevnQEsH1pfPs123nz+7G6Ew1+Si+
	+W2tNqf9z5j0JXIyFH6H6bzcnVYDb4TPIUIVxAqX6VI6taHk+ZmOCoExA7gHIMEi
	Uif/gam2+aw3BiRar/xkDEPOAU8G8HloQ4Ut1p+iZei/BS82KmE8w/b8oHpGgofm
	IRIMJy+fxw9jxquSsgtrOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1740053918; x=
	1740140318; bh=IhPaoNu38Tu0uvZG6/scQD1YbIIjuL3trPnifXE0rh0=; b=c
	cz0z+l5i+yyc9kiXxY9Cx2zpnYi2lD2khkh3Ign4vUQpKFyJp1g2t36zdxJ39MYF
	n0HZpXi0OGDAH2Wyat3KfIDAKwMQo7/CU65TQiU2s1xF9df5mptuqCfZ81epkf11
	7hR2tC66kgiY9gJnG+UMHBsDvGbV0Xydc5PEmRc6cf9kRTvKRG6LjLx0Gj6C4uIy
	DSlDtvuevAIOQFMxtW7dtEgQMg/LhVbga4kfWUJd/aRQiJqHdNwjehP8xNSt8cPU
	K/dupRB06hYTUBQr/eHvLPl901ttlti4qVt+jDbCd0AYZyW9NNupOUSRTgeUIm1F
	e5PF5kEkAzx2mDJ0HVM/w==
X-ME-Sender: <xms:nR23Z_tBvZRvooBxYF5tC-EBs-JNzcooeRyiVBn6ZkHEEGXW74RQ1g>
    <xme:nR23Zwe2NiMdXyWPRFHAiFRkyo_lE0gJsGQD4VEqemTv15uh_Muu4CNgZoK8ysvot
    1r330J1C_9u-51TYVM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijeduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeehgffgieevkedvjeekleeklefgheefgfekgefh
    udduhffgtedtvdfhteeijeeffeenucffohhmrghinheplhhinhhugihtvhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehsvggsrghsthhirghnrdhfrhhitghkvgestgholhhlrggsohhrrgdrtgho
    mhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhs
    rdhlihhnuhigrdguvghvpdhrtghpthhtohepnhhitgholhgrshesnhguuhhfrhgvshhnvg
    drtggrpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehhvhgvrhhkuhhilhesgihsgegrlhhlrdhnlh
X-ME-Proxy: <xmx:nR23Zywjqv2bVrys51u62IdCIy2LFbP0_EcF5QjeSdm10ouCnMiWLg>
    <xmx:nR23Z-PtfbYaiPJih8ph6iHRft89diXqMfqlA50iwAi9VNZ0sQ-lSw>
    <xmx:nR23Z___3zpYUhWeW-ZSDkkhDREonQmKxHybYAgvlUsBtyPUQhnj_A>
    <xmx:nR23Z-W1WfM-mIbljksMpsAXKYkDiDCNyIto9aWNPlRTuYi_l_K5ng>
    <xmx:nh23Z_wbu--orGk3gMoFP2V_LqK4-N9mnBsKFIP7dfiFnzwyxJLNqEcA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B62222220072; Thu, 20 Feb 2025 07:18:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 20 Feb 2025 13:18:16 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Hans Verkuil" <hverkuil@xs4all.nl>,
 "Sebastian Fricke" <sebastian.fricke@collabora.com>
Cc: linux-media@vger.kernel.org, "Nicolas Dufresne" <nicolas@ndufresne.ca>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, llvm@lists.linux.dev,
 "Nathan Chancellor" <nathan@kernel.org>
Message-Id: <88a2bdaa-17e4-4465-877b-1e010733dd0b@app.fastmail.com>
In-Reply-To: <2108d667-243b-4d0f-bf78-5a90e9a8efb1@xs4all.nl>
References: <20241213151415.7opofgiz25lpmn5m@basti-XPS-13-9310>
 <88b4fb25-64a2-462d-b40e-eae675ea83f3@xs4all.nl>
 <2108d667-243b-4d0f-bf78-5a90e9a8efb1@xs4all.nl>
Subject: Re: [GIT PULL FOR 6.13] FIXES: Vcodec fixes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Feb 20, 2025, at 12:01, Hans Verkuil wrote:
> On 20/02/2025 11:15, Hans Verkuil wrote:
>> Hi Sebastian, Arnd,
>> 
>> While cleaning up patchwork I stumbled on this PR.
>> 
>> The odd thing is that the second patch (noinline) is committed, but not the first (avoid warning).
>> 
>> Is it still needed? I'm not sure what happened here.
>> 
>> The patch is still marked as 'New' in patchwork:
>> 
>> https://patchwork.linuxtv.org/project/linux-media/patch/20241018152127.3958436-1-arnd@kernel.org/
>
> Apparently this just got lost somehow. I'll delegate this patch to me 
> and queue it up
> for v6.15. I don't think this needs to go to v6.14 since I understand 
> it just kills
> a warning.

Thanks!

I checked my local tree again, and this is indeed the last patch
I have pending that addresses any -Wenum-compare-conditional
warning.

We have recently moved -Wenum-enum-conversion from W=1 to W=2,
ideally we can move -Wenum-compare-conditional from W=1 to default
once this patch is in.

It's probably also a good time for me to switch my daily
testing over from gcc to clang and see if any other
-Wenum-compare-conditional warnings have come up.

    Arnd

