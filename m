Return-Path: <linux-media+bounces-2331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB44810FC5
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 12:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 759CB1F21309
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 11:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A89423777;
	Wed, 13 Dec 2023 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="1QCd5B7U";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zTojNcPd"
X-Original-To: linux-media@vger.kernel.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F5DD5;
	Wed, 13 Dec 2023 03:23:31 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 306CD3200A55;
	Wed, 13 Dec 2023 06:23:28 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 13 Dec 2023 06:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1702466607; x=1702553007; bh=/En5sEjt65
	KfXO77kHPbHZOUSMJXhFCPZupqsrV3I3I=; b=1QCd5B7Ul9zvxrOYkMaupIByn6
	sZrfv5IM5J4xPeN9RewN5+T5Ph157PHQMd2LgEohARrUFpGptQWoQhmBCAdtn8G1
	W6j4y9uy6FPsk2dnZblrIACAYgaMXfO0t8WVc/scQuLWk7C8aKD/eg02947jbr8R
	Sc/G7jpgAmUDynh85BuH0//d/pc9Kox7yVkDyu8jxPOskljBs9paxX2NUOyT6QDW
	T5UfpkdnxI6/MRVOqZWozWp1QFMWpKSB0znN2IaRu7oN7nBQX6Qq7B7c2dh+AfSu
	rkSRnO9bh99afDX2gqzE1Z4fV/1xoNQ4i/whb1aC2TT2yL9XvtN2/0fcsgvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702466607; x=1702553007; bh=/En5sEjt65KfXO77kHPbHZOUSMJX
	hFCPZupqsrV3I3I=; b=zTojNcPdIdLGTwVWFKlBVI93ESdIUubhizGqpSAICzFZ
	cMDyMMRSU0fjtZEVd4Lu/YlbN1Hx07UqjPwyvzJNNTkcg0w2c10gsaTY6DYZc83Q
	tQ0L5eqKJkPpOTBKJyhzaVmEfIhlWITGdaFrOyjW7MgW1KMF3rF872hf0JxB+JZu
	H9kVjIn1Q5F2cEkfGQnIJ+y29JGi1Z3hZTiaRZtgWXH6KF43YH8NLBOGYZ4crv9G
	CrVXeHLE+L5Nll/UpCnW7gwN2DKg/v2FwezvIi4HIpSdT4ysUJt6rwcnljopZtA/
	tIccG3YNkJxmqb1/gMCkSfoK4jD12mS4pCmk+3XpNQ==
X-ME-Sender: <xms:L5R5ZeR8zomKP5SvVJ1FSY7v2GPAllYE1qM4v9dc4z8LJK9XJ9kIcg>
    <xme:L5R5ZTwhRlPD3slrSjbQUFIN54PBy7R-idkHe-cRgv7GclYm-Cr5b4DjtCtLz6GxQ
    J58b0zs9YG7oHB0BgU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeliedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:L5R5Zb1maBlcKKzFKlfBvWULA6XU9a5bYICvMEOrNEYAO8FMfP08xQ>
    <xmx:L5R5ZaD44H7kzj_j2ED_Kd7sVLU8mql1--OBGzed_Jbo3sW0vjQmog>
    <xmx:L5R5ZXhg7VQGw3by-jhrFltxOrwxzMqwICmHATsHfbd8Z6liQa346A>
    <xmx:L5R5ZQbII2yx4zYvuDk4x_--mplquSq2ESsCtu_mxQVXRbGN9T_kKA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 31533B6008D; Wed, 13 Dec 2023 06:23:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <1992d665-cb98-4190-bee3-e5629c7d0e8d@app.fastmail.com>
In-Reply-To: <20231213095849.GA2191@pendragon.ideasonboard.com>
References: <20231212213625.3653558-1-arnd@kernel.org>
 <ZXlmnmGepRnMyNfr@kekkonen.localdomain>
 <97a826ab-cd68-4494-884e-f7bd512a7bef@app.fastmail.com>
 <ZXl0-8VgzF3YH18i@kekkonen.localdomain>
 <20231213095849.GA2191@pendragon.ideasonboard.com>
Date: Wed, 13 Dec 2023 12:23:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>,
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] media: i2c: mt9m114: add CONFIG_COMMON_CLK dependency
Content-Type: text/plain

On Wed, Dec 13, 2023, at 10:58, Laurent Pinchart wrote:
> On Wed, Dec 13, 2023 at 09:10:19AM +0000, Sakari Ailus wrote:
>> On Wed, Dec 13, 2023 at 09:39:01AM +0100, Arnd Bergmann wrote:
>> > On Wed, Dec 13, 2023, at 09:09, Sakari Ailus wrote:
>> 
>> The datasheet says the input clock range is between 6 MHz and 54 MHz. We
>> could check that, and return an error if it's not in the range. The rate is
>> needed for other reasons, too, and the sensor is unlikely to work if it's
>> (more than little) off.
>> 
>> I wonder if this could address the Clang 16 issue, too? I'd replace
>> udelay() with fsleep() in any case, and at the very least Clang should be
>> happy with this.
>
> I'm fine with both of those changes.

I verified that the build failure is solved by either one.
I would just do the fsleep() change in that case since that
is a sensible change regardless of the undefined behavior.

I'll send a v2.

     Arnd

