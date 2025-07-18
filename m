Return-Path: <linux-media+bounces-38058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAFDB0A1EC
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 13:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C020E189A847
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 11:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652A22D8793;
	Fri, 18 Jul 2025 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="GigmNSQu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KWPT/4/d"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1902D8392;
	Fri, 18 Jul 2025 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752838146; cv=none; b=r2qhi2xZ1Fat5OrfigfdcO5RLyc4i4ptis3nDCQ9QbQx0zsnRkVeluTDm66izyIZJM165Fgnm4ga72J9Oh8CTC6/Fk1YVr3QzccjmTHQVlr9SpfPVkfyE5rE6HVAAMnhotePev1vHQ3LYNOqABbLwRDYrh+0HIeQxaSldDgb7TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752838146; c=relaxed/simple;
	bh=wYyx6QtDqlyeE85agBM+ojy87kLrC3NYYxZc8mXHeIk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GkfNjLT8ZWCp/ZkHVN5xrOtNNKzCoZedU9qyoS9+6UqG7k8tEJA1G0lYdgQ0BxAe0te4BP/2S49O/wwjvEyxvPANRPP/+ctHM+5J4kt8R8KG1CJmmCipuag4IY+E+Ci9/i3tHkD/UxqpbSTdPtISc4upobVMaGvcCdGggW8Ob64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=GigmNSQu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KWPT/4/d; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 192FA7A0179;
	Fri, 18 Jul 2025 07:29:03 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 18 Jul 2025 07:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1752838142;
	 x=1752924542; bh=acySwlQIiWdjxBiQbTahfwgiopPILcxq1ta+XgVL72U=; b=
	GigmNSQuFcFJvfbYbaXXAVh2EcncLgc0TF990YZA9r1Jes4Kipfg1wQoNfjhhUgA
	jjJDteBVaJSsxzhnocDKTQTP1aCTFE6qPT0yfVC3dIY/HjR3s9e4VE7sDuFtMu16
	Grw7FsjGRUnm6EgAZaEyHUjfD5/cM8DDmlXpPtwCEhV/zVsQux7miDyGF6xReKpU
	jQv+8BBONM+s6kSLxgYA0+23Sl8yTUEOB3HyjXgcHfN6OOA8OBEX6vL3bKwHRMwa
	TTZhV4oY76P5mdcrMAsjctciJkWS3lK2c0+UrCZlcfiBXCV3ut3wMdY1meuklXSq
	lLxZO0Xr8WTQ15i4wer92A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752838142; x=
	1752924542; bh=acySwlQIiWdjxBiQbTahfwgiopPILcxq1ta+XgVL72U=; b=K
	WPT/4/dOcCGnnkFvuj7mhgRzF2nwyj42ww1IUVdOZRDdM7AzfR/+gb8puo3iaTQ8
	/grCi/y7HTI11+zaaPl/kjLuZ0Gl6+erhA1N7gJSpv1MbIwm/B3uC0HAOJqeWxxp
	rJiYszPtIRBsjUA8ryoyiZtLTshIo0mNkX36H/dhsvRfvzxls+nqwYsdz77Y1ynf
	yR4tfh/ZD+oTGFqo7T1O+mWIfzi+SU17YcqUnxaONEh5XABiOt3eOFQBA4VZfo6q
	yLNHAwJlLZ1bvYstrPIkAei6OpFZ8MKBIC6Mc1pvOQC2ifI/6+2i71gW9vnoXDd3
	bpbRm7ATARAH9VnrEE+6w==
X-ME-Sender: <xms:_i96aCtF8nqy1nKX9myevVmixWQ2qFbQGvw7Qz5LUT-0TRE0F1iFSA>
    <xme:_i96aHcx5lio97iMXUqNtdVmTiBBE7Iat6XYRz-WePLC2dM69dL4MvOapW_YBSiN0
    rmTq8RhS0H3xPxRgrI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeifeeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    hnuggvrhhsrdhrohigvghllheslhhinhgrrhhordhorhhgpdhrtghpthhtohepsggvnhdr
    tghophgvlhgrnhgusehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhihrghnrdhoug
    honhhoghhhuhgvsehlihhnrghrohdrohhrghdprhgtphhtthhopegurghnrdgtrghrphgv
    nhhtvghrsehlihhnrghrohdrohhrghdprhgtphhtthhopehnrghrvghshhdrkhgrmhgsoh
    hjuheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhkfhhtqdhtrhhirghgvgeslhhi
    shhtshdrlhhinhgrrhhordhorhhgpdhrtghpthhtoheprhgvghhrvghsshhiohhnsheslh
    hishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehquhhitggpughikhhshhhithgr
    sehquhhitghinhgtrdgtohhm
X-ME-Proxy: <xmx:_i96aGX3dgHWHwO096OLua_KCWGSRzMAx65WtS07ERz7NtkPxNWhTw>
    <xmx:_i96aNcvBJ_WH1-6CG1MJ_mEI37Go3J_phR8R2B9VJQ2hyrOe2yv0Q>
    <xmx:_i96aEnUXdW_J6nxxapxHpFEiURWxosVrSydq9MN2d-Oejr8cA6-dQ>
    <xmx:_i96aPA2-PaMiQy21t9Cr1lc8ArYosrRQja56hVFbVcVVw-_oN9wbg>
    <xmx:_i96aJ7ITfKChApQP8Jq3BIRRHUPoKrQ6vO69ZiYzFhd-mugqOnwyx8->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 83484700068; Fri, 18 Jul 2025 07:29:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T35a041e4b132bd1e
Date: Fri, 18 Jul 2025 13:28:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 "open list" <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 "Linux Regressions" <regressions@lists.linux.dev>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Linux Media Mailing List" <linux-media@vger.kernel.org>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Anders Roxell" <anders.roxell@linaro.org>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Benjamin Copeland" <ben.copeland@linaro.org>,
 "Renjiang Han" <quic_renjiang@quicinc.com>
Message-Id: <ef216301-a7e6-4c9d-9153-8ce8b0a4111f@app.fastmail.com>
In-Reply-To: 
 <CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com>
References: 
 <CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com>
Subject: Re: arm64 dragonboard 410c Internal error Oops dev_pm_opp_put core_clks_enable
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 18, 2025, at 13:13, Naresh Kamboju wrote:
> The following Boot regressions are noticed on the Linux
> next-20250708with gcc-13 and clang-20 toolchains for the dragonboard
> 410c device.

> [   12.629924] x5 : 0000000000000002 x4 : 00000000c0000000 x3 : 
> 0000000000000001
> [   12.629939] x2 : 0000000000000002 x1 : ffffffffffffffde x0 : 
> ffffffffffffffee
> [   12.629956] Call trace:
> [   12.629962]  dev_pm_opp_put+0x24/0x58 (P)
> [   12.629981]  core_clks_enable+0x54/0x148 venus_core
> [   12.630064]  core_power_v1+0x78/0x90 venus_core
> [   12.691130]  venus_runtime_resume+0x6c/0x98 venus_core

> [   12.817608] Code: 910003fd f9000bf3 91004013 aa1303e0 (f9402821)
> All code
> ========
>    0: 910003fd mov x29, sp
>    4: f9000bf3 str x19, [sp, #16]
>    8: 91004013 add x19, x0, #0x10
>    c: aa1303e0 mov x0, x19
>   10:* f9402821 ldr x1, [x1, #80] <-- trapping instruction

It's loading from 'x1', which is an error pointer ffffffffffffffde
(-EISCONN).  The caller was modified by Renjiang Han (added to Cc)
in commit b179234b5e59 ("media: venus: pm_helpers: use opp-table
for the frequency").

The new version of the code is now  

static int core_clks_enable(struct venus_core *core)
 {
        const struct venus_resources *res = core->res;
+       struct device *dev = core->dev;
+       unsigned long freq = 0;
+       struct dev_pm_opp *opp;
        unsigned int i;
        int ret;
 
+       opp = dev_pm_opp_find_freq_ceil(dev, &freq);
+       dev_pm_opp_put(opp);
 
Where the 'opp' pointer is the error code and gets passed
into dev_pm_opp_put() without checking for the error condition.

    Arnd

