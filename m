Return-Path: <linux-media+bounces-31657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C02AA84C3
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FED8189AB93
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 08:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195D4190685;
	Sun,  4 May 2025 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="o0DISX7Q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vSM7xYur"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAB013D2B2;
	Sun,  4 May 2025 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746346007; cv=none; b=itrV/Fr7ShlwwASd2ocJVT+5S6CobnU8FzJtvXO0gubGzAdfbDJeuiRFuPi20azeiUbDsb1AzmMpeEMGOJv6f8UK9edRoNcqDyMgxXYzvakNbKfm9V6qp5OqKUo4WPIiP7qaop69xdkuUZuQD8/4Ji5/qVyA0dA9ZMuF0dSfDbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746346007; c=relaxed/simple;
	bh=v3TBtvRHxNnnQsRJag0G+mt7Yvuj38HjU1Je9jzecDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCeLCR75PMmND3be+eXSKHIUT4RwDsKHoIJSNLl+Y3n0bdo/97VLuBr9Z0K0CmW5WBbdFB+7c9tT5xR9rMiBgAQBaSDHVVMnELmUnE5ZkT84qkLk9N4r0pu95oWXPXiBK4CxWbe9bOHbrXbXbqIsMZGyfJWzbwgVh+xOYsAsyDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=o0DISX7Q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vSM7xYur; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 882E813801DB;
	Sun,  4 May 2025 04:06:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sun, 04 May 2025 04:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746346003;
	 x=1746432403; bh=2R7ZbsROVfjg8V+iBU7mCl9Pjmaj2oVs4ld+SIepebE=; b=
	o0DISX7QCvsyoazU5+WtMhHzbT5mmTph8NyDOL1d2ooChvXZDjtLHnwJ7BQi6+rf
	2K/9mHIhjszzqwITcmgmoB/KLWPxIXCioLDyx0p4w7ChSmRogI7YONPMcrZvcHcn
	2WizZQjIpUERFhqKVvMhVOpHbk6iLp5bckPpukjPbjkKwti5rRkW/N0BJw0AfPtc
	GTsxms5cr74ieh1dKIHcEn/+nrno3IxL2n1GSRb9pgRwzBddYEdb8WZOerQc+jFt
	PBpuzR9wm+jHIbJqpQga67zOmobg44cy9n4kJjAG/TREmXnbh3abAuMhlpjx4w3s
	9hfr91vwCGZYdKxFWkYzJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746346003; x=
	1746432403; bh=2R7ZbsROVfjg8V+iBU7mCl9Pjmaj2oVs4ld+SIepebE=; b=v
	SM7xYurhoY4Lc+SXuAIwY9/1oietA5vn1NlpIC/j/DqlH4S15+d1W2cM2q1FTjtM
	kkbioQ7kdNoTHcym33L9vFpReutX9czOZXV4N5SSYRWl5w43y2O7hcozsP0iPv5f
	eoXt65YXdIlvu7XBhMPe4JbyzRtA5TScA0+Gc7Wmh+/RnZxYB4O3vqnSt5GQ+qf9
	pc2SNsy0jtSVzZbsEyLHpySGa9gSeNRpPTEN2cQGdSvhX38J34flTOSAdHlcXcYs
	LQQ8zvhebFwe6FqbDPZzFZs+5IOaVUCysVEPOtVUsUUQ86G7a5SrvMUpOO0qj7YD
	/pWQibSB87ysI8FtfINow==
X-ME-Sender: <xms:EiAXaEvbbmIsRFsxbI_oxDNX3AGSjpPqDsAdvFWjRHr76CjATs1-1A>
    <xme:EiAXaBfdUv3CLQ3LX50vTozR10-ysFaM09VgTGDTRt7pAxgXVjSBkRDsh2jfTlUii
    yTwqP87MVldYbx8_U4>
X-ME-Received: <xmr:EiAXaPwkfwkTTGr4OtXxOeTS5R4jDrh6pG3VcSvdFThOWpFBiw4cgF95Gonsi6jsQW7KEyd_CGyXtnCyThYjmz0DfLYzQMk0zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeejieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeetlefgudfhhfeviedtueeuudduteffkefhffevgfetffeiveeugfdute
    fhheekudenucffohhmrghinheplhhinhhugihtvhdrohhrghenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluh
    hnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedu
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhgsuhhlfigrhhhnsehrvgguhh
    grthdrtghomhdprhgtphhtthhopegurghvihgusehigihithdrtgiipdhrtghpthhtohep
    shgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoh
    ephhhvvghrkhhuihhlseigshegrghllhdrnhhlpdhrtghpthhtoheplhhinhhugidqmhgv
    ughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrh
    gvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggssehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskh
    hisehlihhnrghrohdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghr
    thesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:EiAXaHOTkCtvvUYaiDjJeiBKJPeLadUPz1yzuJ1KV9Mek4BjQS1VTg>
    <xmx:EiAXaE_eT1XefDSOBC5dfUkY8w5kqbUP4B0mnVEDrYviIORhMoqdKQ>
    <xmx:EiAXaPU9dwik6xmmdEgYPFYNOaogMXZBcVeIEcZ5XYzUG3a6jKUuAQ>
    <xmx:EiAXaNcQ6cIuvMkebTe-oKrqZ1UVST4cBhOr2KYQl7e5UXysrHxTxw>
    <xmx:EyAXaIpxtUK6fQRvS5-qzj3xmzd1BuRNd3LlKVTh6EGH3UHK0d36n8-_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 May 2025 04:06:41 -0400 (EDT)
Date: Sun, 4 May 2025 10:06:39 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: David Heidelberg <david@ixit.cz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in OMNIVISION OV7670
 SENSOR DRIVER
Message-ID: <20250504080639.GD2696136@ragnatech.se>
References: <20250504033502.37809-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250504033502.37809-1-lukas.bulwahn@redhat.com>

Hi Lukas,

Thanks for noticing this.

On 2025-05-04 05:35:02 +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 59b24c0047a2 ("media: dt-bindings: media: i2c: align filenames
> format with standard") renames the files in
> Documentation/devicetree/bindings/media/i2c/, but misses to adjust the file
> entry in OMNIVISION OV7670 SENSOR DRIVER.
> 
> Adjust the file entry after this renaming.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7b78a98d1f42..78872ebb1aac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18163,7 +18163,7 @@ OMNIVISION OV7670 SENSOR DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
>  T:	git git://linuxtv.org/media.git
> -F:	Documentation/devicetree/bindings/media/i2c/ov7670.txt
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov7670.txt
>  F:	drivers/media/i2c/ov7670.c
>  
>  OMNIVISION OV772x SENSOR DRIVER
> -- 
> 2.49.0
> 

-- 
Kind Regards,
Niklas Söderlund

