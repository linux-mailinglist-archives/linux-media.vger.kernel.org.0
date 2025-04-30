Return-Path: <linux-media+bounces-31438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC46FAA49B7
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 13:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5C279A55AB
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78AE20C00C;
	Wed, 30 Apr 2025 11:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="oQir8fgV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="epkj3pYE"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2E121ADA9;
	Wed, 30 Apr 2025 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012121; cv=none; b=dBQIKQdi7GH+9GMUrgKFmiW10O+VUNrbsrmGuha5YWR4pRewuWyGdgTIGv5204Ahv6fFo2L0raMZBIEA5T57/djrV9Bol1g796VxnisLt6B7Oc/+EbmR5rNvU5U2WTQWDX4ULBwwLu7TBBjzSdLB7z/OXhZojOXyuaeN/QomY9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012121; c=relaxed/simple;
	bh=RGb5L0+VgpBHNR1U4XWPo+FG2R6wZr4JfsDFFkgVLuY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sMKGG4VoeGQIH/nfYdt2DCBxjmMLlZ3gVGKUiJ+TT4a1zxZQm5Vx5cqsIlwvjBmoyEJR3XvzkHSK93chQzQnuDwG1WA1if5VTqdDTdM8C2Jo4P+ADutX1eCHtEH3Q3mVnfS0wJWNiWsPtpP8Yxgyxhzjm9IcjLC831RlaTuiSVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=oQir8fgV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=epkj3pYE; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 4FA79114019F;
	Wed, 30 Apr 2025 07:21:57 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Wed, 30 Apr 2025 07:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746012117;
	 x=1746098517; bh=Z36oSXGGg9ROETNVwCaDsohdP4hkvVRdz8OKv4+l4DE=; b=
	oQir8fgVlfyzBRFRrY5mlQjiosTuk2eLgV+/x8DGY246lQ5nlxxWo0TqE1Q2/qGT
	Y6E1OpCkgzRFarpaY6Zm+c4tQqnT6auc2KnqD19+hT9iQSDsn1sSHPtcoCoY0stP
	Kd9IGowSaoGqfTUnXDiORCKzoQ1NiuNlaCwXYwvdBczXOWIl8zCJlVRF3yPByuwp
	Ax5j8KfNgTZ4hx++AZMjdTbmMpR/yaBVMivUK90Xo2XRiCzz6YcoamAc0b4amNCZ
	ff31ZS0BnKg7hxhDssQBYiG89rzm8EdTl2UYmkA6geooCXuWVa3c7dBRilyLHE+8
	yTxMa3xvlwNoOPlwJMLr/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746012117; x=
	1746098517; bh=Z36oSXGGg9ROETNVwCaDsohdP4hkvVRdz8OKv4+l4DE=; b=e
	pkj3pYE3QQwms9iB5yGK0gntBq6AXIWgEIrdiqbtQ8eZMxlymwwzXhkAbD2IA8M6
	2uOXnWZPTaZfEiuayGHgVhlfTu1cXAS9ZT+AYwYRMik750FWp6pketwzuvQnPC7V
	EVkfqhYfWFU4YHJpgOcxJccyKwrVtz1+0lcngrUvJkyANUABbqtBCj7ApIaIiu3/
	dV6efHLFDk/6kwHfLXUcHlo2rN8SSYORsz4DEfsBxtX1hnJyhdm5r+rhMC60ylwm
	h9BL/Pc552TiDc1tWJ1fH0pPf1xPzkIg7TgPE2pMu2lx1BwGrrVqsw2qOar3/ZeN
	LuLKDzHyBRxmy5zWWNHUQ==
X-ME-Sender: <xms:1AcSaLxInYCjZBc64eWNMkRyTuDaWBo84LzmU94AX1FFh-pPkIV-Kg>
    <xme:1AcSaDT8lm9w0f2ELUVsaw3WrrFZth8IKDtjJxsC0_NpPBJXBPYS_ZcNQxgOLcmj_
    2Zx1Vnd0K5n2-qE_bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeiheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephefggfeiveekvdejkeelkeelgfehfefgkeeg
    hfduudfhgfettddvhfetieejfeefnecuffhomhgrihhnpehlihhnuhigthhvrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgu
    segrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehumhgrnhhgrdhjrghinhesihguvggrshhonhgsohgrrh
    gurdgtohhmpdhrtghpthhtohepughonhhgtghhvghnghdrhigrnhesihhnthgvlhdrtgho
    mhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthh
    gvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhs
    sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughi
    rgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilhesgi
    hsgegrlhhlrdhnlh
X-ME-Proxy: <xmx:1AcSaFVyMLnqOGIFKlSJbszbKqyimnEMVG9AjOVdxa9tDnpfXauyvg>
    <xmx:1AcSaFh4mMGbh41gyFR_ZB3RDYkmmbbM9sXXflRgylCnDfmXh108pw>
    <xmx:1AcSaNARbucmFlg4KQvmzd2Um2plWCtSXPMGXZX_zmQLuFNkHAySow>
    <xmx:1AcSaOIRhbrrEh3rUFZLEnNi9k8DdbMiliD_5KnVVjKZCVYt7PNBSw>
    <xmx:1QcSaBLepTdmwAR0Kn65F5QPYioaLHOm64DIDnrDEZjCCKppHSJltkOP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B45292220073; Wed, 30 Apr 2025 07:21:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T028766a2c840bd23
Date: Wed, 30 Apr 2025 13:21:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Hans Verkuil" <hverkuil@xs4all.nl>,
 "Dongcheng Yan" <dongcheng.yan@intel.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>
Cc: "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Umang Jain" <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <9586ec8a-ea48-4586-89f1-3ff118809223@app.fastmail.com>
In-Reply-To: <0eb40ff7-7123-477f-a477-6d537195346b@xs4all.nl>
References: <20250314154738.3983798-1-arnd@kernel.org>
 <ecb959fe-69e3-4265-9e4b-326bff421153@intel.com>
 <3bb730a9-5d8a-41c6-8a27-e099561b5890@app.fastmail.com>
 <0eb40ff7-7123-477f-a477-6d537195346b@xs4all.nl>
Subject: Re: [PATCH] media: i2c: lt6911uxe: Fix Kconfig dependencies:
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Mar 18, 2025, at 14:51, Hans Verkuil wrote:
> On 3/17/25 11:32, Arnd Bergmann wrote:
>> On Mon, Mar 17, 2025, at 11:17, Yan, Dongcheng wrote:
>> 
>>> So I remove this select flag and passed lkp build test in patch v7.
>>> But now it encounters build error again, I'm curious why...
>> 
>> I don't currently get any more build errors with my patch
>> added in, and I think this should be sufficient. Can you forward
>> me the errors and config you get with my patch?
>
> FYI: I plan to take Arnd's patch tomorrow to be in time for the merge window.
>
> If more issues are found, then they can be on top later.

Not sure what happened: I see that my patch was in next-20250424
and earlier but is now missing again, so the link failure returned.

It was in git://linuxtv.org/media-ci/media-pending.git at the
time along with two more patches that are now also missing:

d51adf038ebe media: cec: tda9950: add back i2c dependency
118b34092e37 media: i2c: lt6911uxe: add two selects to Kconfig
0dce5b44bd38 media: platform: synopsys: VIDEO_SYNOPSYS_HDMIRX should depend on ARCH_ROCKCHIP

      Arnd

