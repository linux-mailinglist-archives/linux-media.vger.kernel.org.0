Return-Path: <linux-media+bounces-3951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 567A9835469
	for <lists+linux-media@lfdr.de>; Sun, 21 Jan 2024 05:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABE5BB218CE
	for <lists+linux-media@lfdr.de>; Sun, 21 Jan 2024 04:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01DE36125;
	Sun, 21 Jan 2024 04:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arewethere.net header.i=@arewethere.net header.b="P6cUOUxa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hiPvuxX6"
X-Original-To: linux-media@vger.kernel.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D43FBF0
	for <linux-media@vger.kernel.org>; Sun, 21 Jan 2024 04:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705810356; cv=none; b=RUE8tLqr0IOTK5OB7vP6ep/gmlNG6GAq79epeRZpgPEmASXbOs1gt4eJUyPQcHy4PVkm96bUM3HdgVBeTd0AJjyKaxG49xKR7MiVeCHtc6RtP4SsVxKUVdacvmwMVYNdTE+Tqdj43bAxy8konN+w9mKP6GtgEZn7afRq+P52cnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705810356; c=relaxed/simple;
	bh=kQytLbeFkLEtW7dvhyzdBEjw8igmwK4UDa/44TChFcI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEJov9PET6Ys97fmEYlJMMABatpReiJ6wvgpDXd4dVegiZeGBSCNv+u6yGoNXhRisZcARaUaz+TqFSrDHp1HKXKyV2xYW0yCoe+GMpxqUy7xgknoAKhi/k9CB3LT3tRdd1sKHJkwuGMntioFco0jFHfBFa8cg4O/MzDsem5rmpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arewethere.net; spf=pass smtp.mailfrom=arewethere.net; dkim=pass (2048-bit key) header.d=arewethere.net header.i=@arewethere.net header.b=P6cUOUxa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hiPvuxX6; arc=none smtp.client-ip=66.111.4.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arewethere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arewethere.net
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id B81525C0056
	for <linux-media@vger.kernel.org>; Sat, 20 Jan 2024 23:12:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 20 Jan 2024 23:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arewethere.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1705810352; x=1705896752; bh=kQytLbeFkL
	EtW7dvhyzdBEjw8igmwK4UDa/44TChFcI=; b=P6cUOUxa/K46TdYFu7Qpw9HTCv
	1AgD8u7HKGLYax8+4JH3g2TdK41UhScpoN5vqbHbbPzISWmGI5YQbDZpKxMORUb7
	09/F08vPz6HQJ4dwwfzM8hcEBStE1zhORQfSe0Xr1fs5wTGXe7EuHcZ40HCA4DQ2
	ZEot9G3Hwc83PSbyaiMAprFP2b/OoSSt3SxPQFv1L961ybe2TyWWmlUsiA6Y87qH
	0jzc0xK8QG7IOZej4rbz8JkxaZM1TSNzo/Rsr4aAJeWyi9nV9HatUkV+tu6JseOY
	FAENTGj8+cg7a3EklJJlr6NjjoawsgHTn/5IAoDF/VUVMG3YvNs6mdgVVGmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705810352; x=1705896752; bh=kQytLbeFkLEtW7dvhyzdBEjw8igm
	wK4UDa/44TChFcI=; b=hiPvuxX6sls2ObKwo4BONsClsN6zd/9fIkmM/adqoBl/
	YjR6yvC8fnqN8pzRDq2o4jTzTsRyXtP/vNqrIV1jI3cXtIlylHljTPZdSWawiHGp
	FHfpGXgzkNQNs2/Og3TGFBLRnDL1dEY5/OFoTHEinO20FqKX8UzDcAlTKjYkZQUh
	/LlT78nnrWn+rGThvdu63DDVzRf0PgDhw9N1zlKVhgEbfEIHX9cBkugJV9+5qVEH
	211R6ju7v0WthTgWEyzXYw0e+2vD26nKTrCJruQJ6DLBXODC+Bd+a7MMv586tXUk
	XX+hjBuGUCZ9CU8iGMV1lSDOIgO9CobJHIN5o7OtIQ==
X-ME-Sender: <xms:sJmsZXUhBDtf01IQhQWndea82t2tbqsr-h6Xe4SyJXdTwwEc5XQasg>
    <xme:sJmsZfl4o2wN3XDlGjkaq8NOmgvBErIWVhs4_E1mpTv1R9SbuH0AGJPTimqkK6X47
    WnL-CHTbxBq79ax>
X-ME-Received: <xmr:sJmsZTaQNovV61MMlevsX5ezLoQSINdtx-v-UeHEs4b0URxEmXhoziKcJy23RT_E4-XeCHu5Adk0R3wlJm2LRvt38aAA2kVdYfTqrmc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekfedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepmhgvughirgesrghrvgifvghthhgvrhgvrdhnvghtnecuggft
    rfgrthhtvghrnhepleehgfethefgvdehhfffudehjeekheeigfdthfetgeduteejieeihe
    ekheekgfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgvughirgesrghrvgifvghthhgvrhgvrdhnvght
X-ME-Proxy: <xmx:sJmsZSVXd1Zv4hS5uwfMH-civZQzArhnBN7EDlqcAOq3ID6EGEV81Q>
    <xmx:sJmsZRkde7HP95nCHCyhkrDtatNxyoJ74nESBdzDAO6U7954jq4Jeg>
    <xmx:sJmsZfd1gi-o9EUn210Rh7-BiIjbACANGl0epdvJE0Ghhj7tTmPDcA>
    <xmx:sJmsZfRx9hvHR4fOTfMNKKd8r0rAPNZiothX9RRLmjEyskG6SlQJ5Q>
Feedback-ID: i1d8147be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-media@vger.kernel.org>; Sat, 20 Jan 2024 23:12:31 -0500 (EST)
Date: Sun, 21 Jan 2024 15:12:25 +1100
From: media@arewethere.net
To: linux-media@vger.kernel.org
Subject: Re: regression(?) - hauppage quad card tuning
Message-ID: <20240121041025.GA354725@ubuntu.windy>
References: <20231229084406.GA302679@ubuntu.windy>
 <20240104073711.GC319291@ubuntu.windy>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104073711.GC319291@ubuntu.windy>

To close this out, in case anyone hits it.

The machine I was working on was remote and I was not able to do try
the ancient solution of turning the box off and turning it off again,
i.e. a proper cold boot. When I was able to try this, it worked.

However I observed an interesting behaviour in the process.
From a warm boot I get this sequence in dmesg

[ 21.283374] si2157 2-0060: Silicon Labs Si2157 successfully attached
[ 21.283374] si2157 2-0060: Silicon Labs Si2157 successfully attached
[ 21.295307] si2157 2-0062: Silicon Labs Si2157 successfully attached
[ 21.295307] si2157 2-0062: Silicon Labs Si2157 successfully attached
[ 22.392453] si2157 7-0060: Silicon Labs Si2157 successfully attached
[ 22.392453] si2157 7-0060: Silicon Labs Si2157 successfully attached
[ 22.405506] si2157 7-0062: Silicon Labs Si2157 successfully attached
[ 22.405506] si2157 7-0062: Silicon Labs Si2157 successfully attached


from a cold boot I get this

[ 21.780082] si2157 2-0060: Silicon Labs Si2157 successfully attached
[ 21.780082] si2157 2-0060: Silicon Labs Si2157 successfully attached
[ 21.791839] si2157 2-0062: Silicon Labs Si2157 successfully attached
[ 21.791839] si2157 2-0062: Silicon Labs Si2157 successfully attached
[ 22.888459] si2157 7-0060: Silicon Labs Si2157 successfully attached
[ 22.888459] si2157 7-0060: Silicon Labs Si2157 successfully attached
[ 22.901286] si2157 7-0062: Silicon Labs Si2157 successfully attached
[ 22.901286] si2157 7-0062: Silicon Labs Si2157 successfully attached
[ 44.152638] si2157 2-0060: found a 'Silicon Labs Si2157-A30 ROM 0x50'
[ 44.152638] si2157 2-0060: found a 'Silicon Labs Si2157-A30 ROM 0x50'
[ 44.152672] si2157 2-0060: firmware: failed to load dvb_driver_si2157_rom50.fw (-2)
[ 44.152842] si2157 2-0060: firmware: failed to load dvb_driver_si2157_rom50.fw (-2)
[ 44.237515] si2157 2-0060: firmware: direct-loading firmware dvb-tuner-si2157-a30-01.fw
[ 44.237662] si2157 2-0060: downloading firmware from file 'dvb-tuner-si2157-a30-01.fw'
[ 44.801622] si2157 7-0060: found a 'Silicon Labs Si2157-A30 ROM 0x50'
[ 44.801622] si2157 7-0060: found a 'Silicon Labs Si2157-A30 ROM 0x50'
[ 44.801684] si2157 7-0060: firmware: failed to load dvb_driver_si2157_rom50.fw (-2)
[ 44.801798] si2157 7-0060: firmware: failed to load dvb_driver_si2157_rom50.fw (-2)
[ 44.802109] si2157 7-0060: downloading firmware from file 'dvb-tuner-si2157-a30-01.fw'
[ 44.805562] si2157 7-0062: found a 'Silicon Labs Si2157-A30 ROM 0x50'
[ 44.805562] si2157 7-0062: found a 'Silicon Labs Si2157-A30 ROM 0x50'
[ 44.805589] si2157 7-0062: firmware: failed to load dvb_driver_si2157_rom50.fw (-2)
[ 44.805697] si2157 7-0062: firmware: failed to load dvb_driver_si2157_rom50.fw (-2)
[ 44.805944] si2157 7-0062: downloading firmware from file 'dvb-tuner-si2157-a30-01.fw'
[ 45.514028] si2157 2-0060: firmware version: 3.0.5
[ 47.444562] si2157 7-0060: firmware version: 3.0.5
[ 47.448329] si2157 7-0062: firmware version: 3.0.5

From this it seems that on a warm boot, we are only calling
si2157_probe(), but this is insufficient for proper operation.

On a cold boot, si2157_find_and_load_firmware() is also called,
which generates the extra output.

Not sure this can be called a bug, but certainly a 'misfeature'.
In any case I don't think there's a regression wrt the 5.10 kernels,
I was probably just lucky with happening to cold-boot the host.

