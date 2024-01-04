Return-Path: <linux-media+bounces-3204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BA0823CCF
	for <lists+linux-media@lfdr.de>; Thu,  4 Jan 2024 08:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B23F287086
	for <lists+linux-media@lfdr.de>; Thu,  4 Jan 2024 07:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053821EB35;
	Thu,  4 Jan 2024 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arewethere.net header.i=@arewethere.net header.b="njrI97fM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qRZmsW1n"
X-Original-To: linux-media@vger.kernel.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777741EB2F
	for <linux-media@vger.kernel.org>; Thu,  4 Jan 2024 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arewethere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arewethere.net
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 447A93200B5F
	for <linux-media@vger.kernel.org>; Thu,  4 Jan 2024 02:37:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 04 Jan 2024 02:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arewethere.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1704353836; x=1704440236; bh=baduvvA+uC
	J2IdaqpJN5XiT2tVGvANnYkFFgo6YSahM=; b=njrI97fMGy/njMZ595T/ee2Iyb
	I04m4Du7yopJi4yFxBTfzJHcZx7pdi1uz2X/5jYF+0v3aniaSmzwkNunbeaZqdnj
	69AbxnUtjDDvyk54vo6Ag6jsXIrTd7ZMRw9zFbRYzmHuY/w1qkIWuf92mLTU1Dxa
	l6VTOdwgPFawjLbhnVFK+6okPsmXzGw1p4KxxvI9WBEyDHI7Xt7sGcjN2fohehzi
	gANF4ECfm+N0knFdXakjc74Bw+VKvU9nkwssg9hNSYhiXPsMzegs/ugn56ZxdQ1w
	KBL2rKw2AUGkVyn4Tgsqy9EEnSaQHhSSBox5USyJ1X1jxodO+HIQq47pYAmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704353836; x=1704440236; bh=baduvvA+uCJ2IdaqpJN5XiT2tVGv
	ANnYkFFgo6YSahM=; b=qRZmsW1nLJ2wFkhrHmmhW5fn9mNxjYEeM6wRRLxz2hzu
	5SFtHZSbHY3kBTN5fKDC/xOmv5bd9DBWTbdATR/nUoagTotBwuXQnNewEEoaU27R
	GGPVJd0Olfi/70WubXCzcwza3cYZBv0E4QeWXkJOxWiSyujA1DwRO7dOWJ3vJWxa
	DPW3cZsKXN2H1Wlrz4HZBwl9lU/OBhoaBM7sqPD25ubxbu6WFtzlqzlTY66s0GLc
	SR0gxzJxib6f8L+DyccbKP8PZirPlFnZdOu3CwD8J3m6r7LHEreRXeWv3WS1etXW
	M7cGLdLP1R6L0xJEunqSOi7f5JyQUqgWsRESJtFKpQ==
X-ME-Sender: <xms:LGCWZeV5AbqThuG3l79Wt1XA0KsWRxyjX03ONlHzFs5rcQ9pV8T63Q>
    <xme:LGCWZanANsPUTot_UtlI82dqgMDyfVoZcj6QhleVpiUOVXoE5w_gMTwJDntU8zQto
    w4anZ0z6u60Y-Rd>
X-ME-Received: <xmr:LGCWZSY2lHA92GOm_m4xE7H_-oEQrsIxNqJBIwL4lv-5glSlxakhNho2yOKawedAVwb31BHWllVqDoP3mSWZykei8pXJyX2lTbTOzZoEeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegiedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpehmvgguihgrsegrrhgvfigvthhhvghrvgdrnhgvthenucgg
    tffrrghtthgvrhhnpeelhefgteehgfdvhefhffduheejkeehiefgtdfhteegudetjeeiie
    ehkeehkefgjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmvgguihgrsegrrhgvfigvthhhvghrvgdrnhgvth
X-ME-Proxy: <xmx:LGCWZVWerDt1XuMhowv48FLySvPr4pq-hv3AOsv0ICwEuF9DsbMyBQ>
    <xmx:LGCWZYmMX2dAoMaslo-rOAa7ZLcufbXA8e1clsWnHMaocF2LoEY_iw>
    <xmx:LGCWZaeIJLlmeDrLq0uMXSaTqZ5Ioml31zVK8NWYLm1QlAHluX-olA>
    <xmx:LGCWZaT_6GrFdY_MuWYSyVrxIIIWDz1c_23c5yo-hkQPH-uAfg2w-w>
Feedback-ID: i1d8147be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-media@vger.kernel.org>; Thu, 4 Jan 2024 02:37:15 -0500 (EST)
Date: Thu, 4 Jan 2024 18:37:11 +1100
From: media@arewethere.net
To: linux-media@vger.kernel.org
Subject: Re: regression(?) - hauppage quad card tuning
Message-ID: <20240104073711.GC319291@ubuntu.windy>
References: <20231229084406.GA302679@ubuntu.windy>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231229084406.GA302679@ubuntu.windy>

On Fri, Dec 29, 2023 at 07:44:06PM +1100, media@arewethere.net wrote:
>
> I also tried a 'backports' kernel, 6.5.10-1~bpo12+1.
> This is based on the upstream version 6.1.66-1.
> This kernel also fails to tune and get a lock.

oops, paste error there: this is based on upstream version 6.5.10-1

Any suggestions?


