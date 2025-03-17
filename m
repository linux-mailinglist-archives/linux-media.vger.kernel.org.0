Return-Path: <linux-media+bounces-28346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18589A64A3B
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688153A80A1
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 10:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C021229B28;
	Mon, 17 Mar 2025 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="dvFZpt1L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Qek+TJG3"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E2C22257F;
	Mon, 17 Mar 2025 10:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207559; cv=none; b=b2gRMHlz6d6U43lYZi9JTVAJ+osBgskW4/NURz2lcppLYZwbVW/mlPNd/nbCBD+a35mdMn4GE1+F0JZw1eC97PY/CD6EvwkWBHs8NPWWTeIxm9dRtaSzSXNoTQYtxf9QXteB7HZ3V5FBLqGNJuspcmjEm4Boo1Zf2RbGI/jbtZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207559; c=relaxed/simple;
	bh=vzZu4WAMRGLL81phSpbjVeXSqk9CuJfl/bKeXURPSsc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bLc0h8/PhMyucqTrn5XX41t7oZilEs2uFhLL5Fd8tAaAOEkzXqwwF5CkhM1MJ31MTd9eh8jwwPm3WH0sAN+fvSMnxbiKN/rm5pfCM1WdUYmXEqyI7QtYE4uWZEAJehX2PdldvxPtV8tJ/0FwjdWbTeheMLQTTq645aXR7WzWJR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=dvFZpt1L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Qek+TJG3; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 865D111400F8;
	Mon, 17 Mar 2025 06:32:35 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Mon, 17 Mar 2025 06:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742207555;
	 x=1742293955; bh=Ncty7GAoxEjtI5Chq8+q8RAEiXBbAMmZqpU8NQN71C4=; b=
	dvFZpt1Lu3qHJeaSOEWrGPAGU0QQPKuTitblZ6YvX+4P7EHrJo2T1DtnKsgmrE+K
	WGbwyN6kVGtQVSkTHVtpAaLtS5RSpd4PrDVCVK8CC3bFeSxTw0dYkR9TjmywXk5W
	gGAdpCIBGPgmVi/7z3TOQpIs4LZr6mF0BjBCoNezfprADzgIjRrEEJ3JWXQIqikx
	xymh6L4aZQ/GIEmZOb+PW2tlMjUGfzck8wowwDs1yTySNK4/EL5bvBETgySc6N9x
	cqXsl1/rXD2lEV6jeGNdwa51wVCyu+qzVD1BAi0ocbPfD8qwAqNVRFz7+b45YrFO
	66Ze99fzijiBYyserVVXlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742207555; x=
	1742293955; bh=Ncty7GAoxEjtI5Chq8+q8RAEiXBbAMmZqpU8NQN71C4=; b=Q
	ek+TJG3qQojbH8tdjEOkUkZn+JTbtMW/m4Ic/eZZbpUX+D/Q9jpol33Sv8j9ol8S
	jwpU1AByhLd8GYw/oa1/CrrXMUuq3I8eFO3zWUYeOnjB8eYbyZfNsz9dy7cM2d5W
	tdGdf/Rl+690u1LpcdQVlil/WeoO4ZyF11qqrE3PuWPT9uyYOEn1WjyKN52UM+f4
	AUrmIzviXyrH2s5cvyMcAuYyX/lZ70vZoPo6bqhusnTITfN+0j3mf2SrN5DZV4Eh
	nph5+yoZU9o9W0HmjnHGTcdDzdZrY+2EO3mv6lw/gM2cdoOcwfWzFXq2cjO+wxE7
	HZJ/ZVwbf1+4iPo2bcO/A==
X-ME-Sender: <xms:Q_rXZ1W39aHhOTfpEuqBvN8z_4geOYp6ZGpZktWCxVLMSTGTIu32wA>
    <xme:Q_rXZ1mJp7hryMbAWqMaQWFcdV5ndzmT7JXI_Nff_8lBLf8StFJ4fK6h_qBo3TTrz
    KIAPMpgo2oZtChs_tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthh
    grrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehumhgrnhhgrdhj
    rghinhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepughonhhgtghhvg
    hnghdrhigrnhesihhnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehhvhgvrhhkuhhilhesgihsgegrlhhlrdhnlh
X-ME-Proxy: <xmx:Q_rXZxbJJ-h9TIL7IHZhIZmNJgo0U_tPiC-R-zbEvbvbpo-iEHgpjQ>
    <xmx:Q_rXZ4XOxVBN1c6539iJp_uPpg6Q9F2DtWq3LBaFYzjFEZ0OpBnIkg>
    <xmx:Q_rXZ_kwpBDBct4DhN6Z00IDLPl4s8TIBV9wX-fl4nXbIwmfhm_lJg>
    <xmx:Q_rXZ1csWy48J5PiuhlTGyUvmhuIehvvkNUeaR7QFqRdftz0NmeqDQ>
    <xmx:Q_rXZx4jU9fSIXf8_1S7l-F9SZKyO-vzGsecnypd7wPsiFmWBaCOs1or>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1DFBA2220072; Mon, 17 Mar 2025 06:32:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 17 Mar 2025 11:32:13 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans Verkuil" <hverkuil@xs4all.nl>
Cc: "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Umang Jain" <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <3bb730a9-5d8a-41c6-8a27-e099561b5890@app.fastmail.com>
In-Reply-To: <ecb959fe-69e3-4265-9e4b-326bff421153@intel.com>
References: <20250314154738.3983798-1-arnd@kernel.org>
 <ecb959fe-69e3-4265-9e4b-326bff421153@intel.com>
Subject: Re: [PATCH] media: i2c: lt6911uxe: Fix Kconfig dependencies:
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Mar 17, 2025, at 11:17, Yan, Dongcheng wrote:
> On 3/14/2025 11:46 PM, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>

>> @@ -1149,8 +1149,9 @@ config VIDEO_ISL7998X
>>  
>>  config VIDEO_LT6911UXE
>>  	tristate "Lontium LT6911UXE decoder"
>> -	depends on ACPI && VIDEO_DEV
>> +	depends on ACPI && VIDEO_DEV && I2C
>>  	select V4L2_FWNODE
>> +	select V4L2_CCI_I2C
>>  	help
>>  	  This is a Video4Linux2 sensor-level driver for the Lontium
>>  	  LT6911UXE HDMI to MIPI CSI-2 bridge.
>
> Thanks for your fix.
>
> Lkp is a bit weird to me, because it tested a warning in patch v6 likes
> below:
>
>     kismet: WARNING: unmet direct dependencies detected for V4L2_CCI_I2C
> when selected by VIDEO_LT6911UXE

What was the full warning? The only dependency I see in V4L2_CCI_I2C
is CONFIG_I2C itself, and that is what I add above.

> So I remove this select flag and passed lkp build test in patch v7.
> But now it encounters build error again, I'm curious why...

I don't currently get any more build errors with my patch
added in, and I think this should be sufficient. Can you forward
me the errors and config you get with my patch?

     Arnd

