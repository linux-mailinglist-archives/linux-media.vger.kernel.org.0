Return-Path: <linux-media+bounces-49078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B5CCD00E
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 18:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E76B93021FB2
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 17:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C2F33C53A;
	Thu, 18 Dec 2025 17:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="l0Vx/GvW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UVtmXCCE"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74749334C08
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 17:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766079785; cv=none; b=lXQPTvgYDfqP5aDlMHFBDUCNk3yUeZulu3ZJiQio2a2HgNGPO7wAqoUEYJ9zZiEsfK1zDatjl+KprpLp7iomkhnnvXn2r+pjcvwcHKFSr3aBB1euVTzxJ6eVGPb4Mr2RvMNLExCJklJl2hcT2rWhFWUDJiq16IVnO2LJHYepmlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766079785; c=relaxed/simple;
	bh=7SJ2jxawzBJqjo84feSSDek4q+rmTIq4WDkIuxdpBN0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=L2ylGe3AI1ORV529Ms6F47e/VSE1CrGsRMAVf5w6CGpvBfabD7dw7SkCrqNN6fpJrsbq8gHSRGCrJVYd6OQpI0m1Iy1iZau1mt3Hh/klURLxYhO3BZamQmNaoF0kl/n6Jh6a35hIlYNlnacJuSrcAfGmc84hEFEnqaIZF6tgkrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=l0Vx/GvW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UVtmXCCE; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id D4CEBEC00EB;
	Thu, 18 Dec 2025 12:42:59 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-05.internal (MEProxy); Thu, 18 Dec 2025 12:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1766079779; x=1766166179; bh=Ic2BlbYwf2PF/D/JGHhrWQm7kLGIgFjg
	ZzsaMQmgDeA=; b=l0Vx/GvWd5bDYXXBBJ0jlUM3Jz9NnEO0e9I5yLrLCv3GC+lC
	yxCh3OWE4SZ1OsngwhZbitttjJxUgS167w0cKD238fH5VQ3HMTze2Ap9FWJT/Bhz
	lfuc7E+Uxut+rLOEvyNCcojEUvrm2EK9/vM7IfqVbHkaZh+ZcOgYXT8F7HvePl2E
	/qbpORXm2YzEWtrx2Or7lWJqp/6jZm3qQhXQbI0I5YcRm97upRcRK7a7qHQbudcR
	SRKxny2fW6Rak64i6dsppdzXGYyCWHAk806k9YmOhsi3OS9wBAgLNvIqJ2N6mnme
	FTkD3YNaVXuzQmymYlgXvKe4QNEmhjtntMpwqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766079779; x=
	1766166179; bh=Ic2BlbYwf2PF/D/JGHhrWQm7kLGIgFjgZzsaMQmgDeA=; b=U
	VtmXCCEayumWwYfGqKY+EnYD3YuVfAFKykgo9ChEbLlLqUp6jtye5H87nTikz6sm
	CMYLu7zL66kgW5FL1aGRvMRZAulmCP6ZYUFmJwWnqEBLAdvvxDYles0/nLoU0uVt
	4OZcKu0a7f3hl5SZX2SUXy0P1PicacZZ27E2ID+9B/G1CTokiec7U6DZPps14FxF
	5Kh13afpvlreJ64UyE2QYP46ahOzrlETKmsTT5RMNKRxSu67rsKITUYvestqbbBK
	SWVsQfUV4ek1/H1ZBAofe81ry/MEJDt1eCsL7zcSyG3VZO0v8+yREoAA13crrzgd
	9wdfMtn+xN9MaVFw4VEqQ==
X-ME-Sender: <xms:Ij1EafDAc8uPrY7W-Yzz651pZnY3MF3LD0bP8HqHGKaVkspYVG0kiQ>
    <xme:Ij1EaQWab3ix0Hgak0m6Q1yGupCLmexRY1B3yMAHBxRHjtlOjuB8CUiGqxg_Bga8d
    Hk5cNhkWU8jxzFutXw2nyB_L24p-v8GYjaK275BwWKu2uMtkqqJsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegiedthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdghrghlthgv
    rhcuhggvrhhnvghrucfuvefjpffgkfffgfftfdcuoegtohhnthgrtghtsehstghhnhifrg
    hlthgvrhdrvghuqeenucggtffrrghtthgvrhhnpeevfeffuddvteejfeegvefhffetieeu
    udehvdeiheehudduvdegffevieffkefgheenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegtohhnthgrtghtsehstghhnhifrghlthgvrhdrvghu
    pdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrg
    gtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohep
    mhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrih
    hluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgv
    ughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Ij1EaQqmWoeHko8d0NtuMmA1nXsL0hOZ-8ORlAOUE4hfDhmAT8IHMw>
    <xmx:Ij1EaSH8kx541HxSDoiQ4bEbx1YxfINZmbRfF8Y2PdmNXTkJOj_Xwg>
    <xmx:Ij1EaYsT341dZfhvufcJfkaRLaH8ypnsnh6a8TMuaQDuc_ubAvqV1g>
    <xmx:Ij1EacUa23zr4M5tf56JZpJuCfyJ57_PVzcwU-2UYEdbsDM45sREBw>
    <xmx:Iz1EaeA1uRq7FihVD8v5Wk1nOZks854nXsMYfRY4MtbGy3BlLJGrO-k2>
Feedback-ID: i455149b6:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BFA9E1EA0066; Thu, 18 Dec 2025 12:42:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ALMo3NTH8JG3
Date: Thu, 18 Dec 2025 19:41:28 +0200
From: "Walter Werner SCHNEIDER" <contact@schnwalter.eu>
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>
Message-Id: <7221dcd4-fe06-450c-847f-27e4c0337d33@app.fastmail.com>
In-Reply-To: 
 <kfgaswtrsrsihiqwicvzymllg26q6s7376dfykwsn2dofjh4yh@neagce7tqpky>
References: <20251218-ov2732-driver-v1-0-0ceef92c4016@schnwalter.eu>
 <20251218-ov2732-driver-v1-1-0ceef92c4016@schnwalter.eu>
 <kfgaswtrsrsihiqwicvzymllg26q6s7376dfykwsn2dofjh4yh@neagce7tqpky>
Subject: Re: [PATCH 1/2] media: i2c: Add ov2732 image sensor driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Dec 18, 2025, at 11:00, Jacopo Mondi wrote:
> Shouldn't you power off in reverse power up order ? like
> 
>         pwdn = 1;
>         reset = 1;
> 
>         fsleep() (here or after clk_disable?)
> 
>         clk_disable
>         regulator_disable
> 
> ?

Thanks for your review. I've addressed all your comments with the exception
of this one. The clock must be disabled first and a sleep of 512 cycles is
needed before toggling the power, reset and regulators:

        clk_disable
        fsleep(512 cycles)
        pwdn = 1;
        reset = 1;
        regulator_disable

I've removed most of the delays, including the 10ms one from power down
which had the wrong duration (10ms instead of 512 cycles). Now only one
10ms delay is left and I've added a 1ms delay that fixes the intermittent
communication errors, more details in the upcoming patchset.

