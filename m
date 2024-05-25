Return-Path: <linux-media+bounces-11875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B028CF1DB
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 00:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67308B20E45
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 22:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B791292CE;
	Sat, 25 May 2024 22:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="K8T19hoD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZGnGFUur"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A288F138E;
	Sat, 25 May 2024 22:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716674877; cv=none; b=FtLOpJ33RY2vanESV9DvpRnn+Nuq6kV74dpV47pBIkKRdS2I6hUAe4T6Ts5PEzqSNEguFeQBx0r2C2Ug0WvlkARIu3WKTGZZa8zwrRonhd3pj/txx3Q1cke+Ny/aqQXz9FEazO7TLE+VQaUsTbdGpgXJa+BjoU430e3JkziLErs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716674877; c=relaxed/simple;
	bh=D++cyd23myqJmAvGTVFI5XlB7Y32eLoQevngNsZ/Qu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nVzzJdMQtOrKWToBVkXPbDV0eTFVZeq3QfWT5wdW5j9NSNx1md1NsBjj4TgrynsPsmgjHyO6Ruix3sPJBKtZbDo0L6m88bZR04Gm5QKXSI3O5ahW0MqE9PyHdtwlevbzUHRNsqPSmvEeX/PM81Sm65+XUr2fh7W776O+Oqo9Afk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=K8T19hoD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZGnGFUur; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 259A61C000AE;
	Sat, 25 May 2024 18:07:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 25 May 2024 18:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1716674871; x=1716761271; bh=gh
	vJEjFN1pc4+Ka4C90JficqAuhjmM6V8ECjsNb52P4=; b=K8T19hoDmCNRbsOdpF
	lBJOgaErXxjYVUqNKMnOD7pggWVSDl+FWCsnrIdWVJbygKp3Fb6lTOdeBYj++Z64
	qkEmC+h3/MK1oumUm8TjvIVsLL1uCdOODgFfgLLp18kzDGb0cJTryyAiMXumLi7h
	5CsO3J+X5W+EBvwuoA3nRuphepvK59ihzcrYcQBH9TC7p2A9iQVTfNFx6iyY5SeQ
	evBX4I5ync0bfaqGUn8/VpQKGNg8GTKWYQD+3bk2I9BtraTNHfc89LFzDJhOvEFr
	+bO2Gs1U4ISHcAhkit1tb7630FcVqhKdb6aoJLv6WzZCnnAjdoDDzWIdW94DcUZ5
	VE+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716674871; x=1716761271; bh=ghvJEjFN1pc4+
	Ka4C90JficqAuhjmM6V8ECjsNb52P4=; b=ZGnGFUurDu8QpmqRe68BI9VrGbytC
	VQxH/Tx61NTinFc4jfqo1i3jk6lt8/vTmhFr71zCdphBvruw+bvgamMZZPjQnjM3
	9wk+iC3TiwCPm6bDkMFpkSoQ6i4QQU0oPGDJZVQpGzFF9xusDCRpcG+SCEWD68/3
	5gkiBKPpxzj5pQmvprgG2atqnwuVyAkb2uIoJgzzi5i85BN6Cqa73ch/4trG/cg4
	XD0ZlEpbgku/PVgurZcMEvzSHMu2XxM1MvOvrAbBdKnkD+x5MIq2ygSgkN4Wyc4H
	mfA+eXCltQvllTLAshFpggKXGjBqnUPY3wMbhWcTwYwFYlhfu8P1oxgwA==
X-ME-Sender: <xms:N2FSZkAay4maTb88EMH-_aiC0vfsWZd3bvT0TXZeWdr69A6b4E7Clg>
    <xme:N2FSZmjJBSCH5JHp4xjJLfuOV8l9qfbvrdQg4P-GYS9rTYQQTmaw7kjIGtDlxWFnB
    GC111zCOA4lZsa5Bcs>
X-ME-Received: <xmr:N2FSZnmJqqgD2lBKnr00ZlhiWeax86lfVILp0c3HjT65wkFkzHJmjQ53-YKostWObOoB5PWT-sv6YfyLKVt8Aab6eF29JYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejuddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkgggtugfgsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeegfeegieefueeggfetteekudejfeej
    fedtvefgkeegheeggefgueffueejieekheenucffohhmrghinhephhhusghsphhothhush
    gvrhgtohhnthgvnhhtqdhnrgdurdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnh
    grthgvtghhrdhsvg
X-ME-Proxy: <xmx:N2FSZqyqjvbdAjjK4uGDxcTh0-ingrmfNleMOvtKs7NBLKkm7hNYvQ>
    <xmx:N2FSZpT36OIaHqGUFj28Yl-aVM3CUDja-73fefSODnk2Kg1cPUQyvA>
    <xmx:N2FSZlb-9gCwt8RhGNIeoqPzEXfZRYzq3VZVWKSBWaPKAZOtG-2D_g>
    <xmx:N2FSZiQgkc_oGL2V23Zt_01LxjE4CBlNacxU141vVA0ptO8ocz6ArA>
    <xmx:N2FSZm_Ok6r0hZ-Pfj2ioZLImoW7k1APr0gnMCU06nloZlb81TQjB2Oq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 May 2024 18:07:50 -0400 (EDT)
Date: Sun, 26 May 2024 00:07:47 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFC] dt-bindings: media: video-interfaces: How to describe physical
 lanes for CSI-2 C-PHY
Message-ID: <20240525220747.GD1900917@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello,

I'm trying to figure out how to best describe the ordering of the three 
physical copper (?) lanes that make up a logical lane in MIPI CSI-2 
C-PHY. As far as I can tell there is no generic binding for this yet.

Background:

A logical lane in the MIPI CSI-2 C-PHY specification is created from 
three physical lanes on the SoC. The three physical lanes are commonly 
referred to as lane A, B and C.

One or more logical lanes can be used to create a CSI-2 C-PHY bus. These 
logical lanes are commonly referred to in numerical incremental order.

I don't have access to the MIPI CSI-2 C-PHY specification as that is 
available to MIPI members only. But I found these slides which I think 
can help illustrate the setup.

https://2384176.fs1.hubspotusercontent-na1.net/hubfs/2384176/MIPI-C-PHY-Introduction-From-Basic-to-Implementation.pdf

Problem:

There is generic DT properties in video-interfaces.yaml to describe the 
logical lanes, 'data-lanes'. This property is used to describe how many 
logical lanes exists, and the order which they are connected. The order 
is important as logical lanes might be swapped between sender and 
receiver, and the sender and/or receiver can correct for this using 
software configuration.

There are however no generic DT property in video-interfaces.yaml to 
describe the order of the A, B and C physical lanes that make up a 
logical lane. But just as the logical lanes these can be swapped between 
sender and receiver, and the device on either end of the link needs to
correct for this with software configuration.

For MIPI CSI-2 D-PHY lanes the same problem exists but is made simpler 
as each logical lane in D-PHY mode is made up of a differential pair of 
only two physical lanes. And the generic property 'lane-polarities' is
used to describe if the P and N physical lanes have been swapped.

  lane-polarities:
    $ref: /schemas/types.yaml#/definitions/uint32-array
    minItems: 1
    maxItems: 9
    items:
      enum: [ 0, 1 ]
    description:
      An array of polarities of the lanes starting from the clock lane and
      followed by the data lanes in the same order as in data-lanes. Valid
      values are 0 (normal) and 1 (inverted). The length of the array should be
      the combined length of data-lanes and clock-lanes properties. If the
      lane-polarities property is omitted, the value must be interpreted as 0
      (normal). This property is valid for serial busses only.

How to best do something similar for the three physical lanes used for 
C-PHY which can be configured as either ABC, CBA, ACB, CAB, BAC or BCA?

Any solutions I can think of feels wrong, but for different reasons.

1. We could add a new generic property to fulfill the 'lane-polarities' 
   function for C-PHY, 'lane-polarities-mipi-cphy'. That would only be 
   valid for C-PHY buses.

   The structure would be the same as for lane-polarities but the items 
   enum would allow a value from 0-5 for each entry in the array. And we 
   could define mappings in dt-bindings/media/video-interfaces.h to 
   allow names in DTS, MEDIA_BUS_CSI2_CPHY_{ABC,CBA,ACB,CAB,BAC,BCA}?

   This feels wrong as we already have 'lane-polarities' and it is used 
   for CSI-2 D-PHY configurations already.

2. We could extend the 'lane-polarities' property to accept values 0-5 
   and in video-interfaces.yaml describe that values other than 0 and 1 
   are only valid for CSI-2 C-PHY buses. We could still define the 
   descriptive names in video-interfaces.h.

   This feels wrong as we would lose the ability to validate DTS files 
   for D-PHY configurations only contain values 0 or 1.

3. We could use vendor specific properties to deal with C-PHY lane 
   polarities.

   This just feels wrong as this is not a vendor specific issue.

Maybe I'm overlooking a better solution? Any feedback on this problem 
would be appreciated.

My current feeling for the least bad option is number 2 as it aligns how 
CSI-2 C-PHY and D-PHY are described. Unless a better idea comes along, 
or I'm educated on why this is a bad idea I will create a patch for this 
and see how it works out.

-- 
Kind Regards,
Niklas Söderlund

