Return-Path: <linux-media+bounces-3076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1181FE3A
	for <lists+linux-media@lfdr.de>; Fri, 29 Dec 2023 09:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 175831C22907
	for <lists+linux-media@lfdr.de>; Fri, 29 Dec 2023 08:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4886A749C;
	Fri, 29 Dec 2023 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arewethere.net header.i=@arewethere.net header.b="GPR1a26L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zsmOzRE8"
X-Original-To: linux-media@vger.kernel.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F38F44
	for <linux-media@vger.kernel.org>; Fri, 29 Dec 2023 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arewethere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arewethere.net
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 0156032009B5
	for <linux-media@vger.kernel.org>; Fri, 29 Dec 2023 03:44:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 29 Dec 2023 03:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arewethere.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1703839482; x=1703925882; bh=zYzHZvT2eHNaLfjh/e9BE6+ECL50GHe/
	+I32bb9rX98=; b=GPR1a26LedbUjr4ptu1kcEyNjwxrxZ5VrtsyE9XvlCOmc781
	EEFocm4GjabpQM2gJnQB/P5lcyIRgqe6qRhsDuE4nD5bEqDO6HJQZqm9iLX0/03Q
	o3zu1LJkjaANcQjnSv7ulGBYg3ArZsUJFafkIzUskDHYmj2vnSE6ffklxWHXqfrU
	TWpegRE/CxSz73iF/0R45AKs4YGcL7vpzSAL57yrUUQRE4av/oKA/jrocw3Bvbfo
	/2wv7w3W6E3uKq3Btn8ilaa4stmEqJvRs1abluesPAgyGUOhTbvdZ9Mo8ia6MAfD
	YqS0EgKTJvz2J8HTNppte+Cwi0cRI5tnmh2QJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1703839482; x=1703925882; bh=zYzHZvT2eHNaLfjh/e9BE6+ECL50GHe/+I3
	2bb9rX98=; b=zsmOzRE8OxygSMzhKUOIHzhLBQerDpkW3Apth2Bn9Evi4Ylo7qR
	tWe+oiNLLPToQdCsAqt/NV1ArvO/uW+6JFLgMNWN8DMES1jvFQUtb0yuijZ5kSQu
	t6VVDCVfMpNi/mrs6Azx+p6GelRomBVdmr+Yn3v9bUszmBOiDI6cc8lIUhfGuSo+
	3SiUp4XQxW3P44JS5ne8YkxD48lsPnQVSe6GwqgLZfD89NMX/YTBFKfWEH+IAWzU
	ZrsRUTqHZjvMaL5z+ai64fwnA767KuJs2u/Gg4hR4VPEoi/pDtrukgj74NijhJ/O
	KAiK5s9hWSJe4Q0ztsN+JB1KdDwkXWwQjnA==
X-ME-Sender: <xms:-oaOZc9eplsFwe9H-RRSwI5jPhlh-fDY51TQVCRMq3FMw68d3ZpFLA>
    <xme:-oaOZUt0zq8idhFhJiNsWTh5MUT6pVTajMbqepJG35-M-daxGUZwa8_U1T3JOL9A9
    Uy5pQ3ppD-I1sus>
X-ME-Received: <xmr:-oaOZSA-542L4zYkAzNFooRpszD__5ADecTiODSGrOH8Fj8rcr9-YCJgEoZn2znwLqAP9-NcoKA0_uGbAXayPQ6oPXe5VIZQ8iqBHdLs_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdefvddguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehttdertd
    dttddvnecuhfhrohhmpehmvgguihgrsegrrhgvfigvthhhvghrvgdrnhgvthenucggtffr
    rghtthgvrhhnpeeujeegteduveeuffevleelkeekieetgedtfeefjeefkeffhfegleffke
    ffffegleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmvgguihgrsegrrhgvfigvthhhvghrvgdrnhgvth
X-ME-Proxy: <xmx:-oaOZcefqXdXYPdSgydDYr1mwY1DlmmrwkgK6rEmq8qsfku5GMFqlQ>
    <xmx:-oaOZROWfXITNkQltoGBEuUsfUEVcCEMqNjSQvUFuJOhfqKOfSyGCg>
    <xmx:-oaOZWmUuOi7zjHjQyXxlpkfb40hbSVkbgsoyryIr1pvgJoib_YZTw>
    <xmx:-oaOZYbFcrf0O7JXNDGUi-tbkr_cwmrtAGqmyoPM3_DfGxt6lZDhAQ>
Feedback-ID: i1d8147be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-media@vger.kernel.org>; Fri, 29 Dec 2023 03:44:41 -0500 (EST)
Date: Fri, 29 Dec 2023 19:44:06 +1100
From: media@arewethere.net
To: linux-media@vger.kernel.org
Subject: regression(?) - hauppage quad card tuning
Message-ID: <20231229084406.GA302679@ubuntu.windy>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I need some help determining if there's been a regression for
one of my DVB TV cards. Details below.

I have a Hauppage QuadHD DVB card
which has two multimedia controllers:

 Conexant Systems, Inc. CX23887/8 PCIe Broadcast Audio and Video
   Decoder with 3D Comb (rev 04)

i.e. PCI ID 14f1:8880 (rev 04)

With subvendor:subdevice 0700:0x6a28.

The cards have SiLabs Si2157 tuners.

I had a working system running Debian Bullseye (linux 5.10.197-1).

After I upgraded to Debian Bookworm (running 6.1.52-1)
the tuners in this card no longer get a lock.

I also tried a 'backports' kernel, 6.5.10-1~bpo12+1.
This is based on the upstream version 6.1.66-1.
This kernel also fails to tune and get a lock.

The other symptom, which may or may not be relevant,
is 'i2cdetect -l' returns nothing, though there are
various i2c device detections on dmesg.

There is a second card in the system that tunes and locks on
just fine, with both the 6.1 and 6.5 kernels.
It is a  Philips Semiconductors SAA7164 (rev 81)
marketed as a (Hauppauge WinTV HVR-2200,
i.e. PCI ID 1131:7164, subbvendor:subdevice 0070:8953.

So I can rule out lack of signal; the signal is routed into
the quad card first and then to the working dual-tuner card.

Things I have tried

 - checking the firmware blobs are all present and loading
 - setting debug=6 on the cx23885 module
 - setting tuner_lock_debug=1 on the si2157 module
 - enabling some dynamic debug, e.g.
   echo 'file  si2157.c +p' >/sys/kernel/debug/dynamic_debug/control
 - running w_scan under strace
 - review the kernel commit logs for the cx23885 and si2157 modules

So far I am not seeing any helpful error messages or commits that
could be causing the problem.
Are there some test programs I could run to debug this further?

Any help would be welcome




