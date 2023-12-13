Return-Path: <linux-media+bounces-2302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A91810C99
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 09:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 061FA1C20943
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 08:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9A21EB2B;
	Wed, 13 Dec 2023 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TTjkPNs4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MDsOKYf6"
X-Original-To: linux-media@vger.kernel.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9153CA5;
	Wed, 13 Dec 2023 00:39:27 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 409F13200A1B;
	Wed, 13 Dec 2023 03:39:23 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 13 Dec 2023 03:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1702456762; x=1702543162; bh=XQXN2566Zk
	ZSs+PwY8iTnHgGTH/n6ddKnPfQrv3KIgU=; b=TTjkPNs4OwJceq1YPyZ65dr5uo
	h0sDVVuBvHxssTFL9sSOYknbaQx6vvrbzsLqtpwrnkzCy3GtAFcut0NAFhtaRD+g
	IcCyFgmLIjgZBIpetFxBFMImroNdbHm2tqSMKtP/F+f05Dy/s5mASMXGhH872Efx
	DMcUN5Ka8Gdxw6d1nYWIc72GdTkz+AyGahQDntsLYS3AqbBIf1XNHXWa9PJaZYH6
	7k1gSeMefceBh3ZKHfX7Q9Pozy7GRZBCjltvFrHvFtIFLEia+Z7uNx/HW9jl3wf9
	bjT3VZbyo4Y+wl/DDCZLu5v7KQe4tl7mdO2aaMI88+cHGwhLJTuOxp+oCJ+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702456762; x=1702543162; bh=XQXN2566ZkZSs+PwY8iTnHgGTH/n
	6ddKnPfQrv3KIgU=; b=MDsOKYf62e+GpKMfkEnjnIsmCgsxq/gO7Yc97QXa/xzf
	J3O2GF/kkcA95qRqU22G7fOV7WCTjtiK2mEbMeWkRhlbM8pjazqTjXjMlWoolq5D
	h39amMWJM/hdGUIi9AIMuLIgYCFh2ZQUE5Gnh5+Mh0D6vX6Rc7y3c/bh0hHDVDXN
	yeS4mldUYfISujKscqPJZg2DDq9pW2w/3T5/B8HPFnJC+2FqwET/FhLeDgUn1GgK
	HALE5HOPD7WmzRupdRFh4RFgoBHulNyb22tzELtaltFg8KVGrTc37gnhU7rVVNHP
	L0YbGU9UvtJXMyDwsMWSP8kQnIQ4HXX2JPJ/1kfw5w==
X-ME-Sender: <xms:um15Zaif0YxiXflMl9-5JdrsX03_z0gymQQalcVYh6mCaK9crqhIyw>
    <xme:um15ZbAGiHFbF4e76DRWarLh1dOqok1mlsydJV-iFFux-_B5Xr9cop7Tn749PRLxB
    68p-Guk1lIbyhvnbvk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelhedguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:um15ZSFRjU5ny-9DioHPWXmlifRzmg-8N_TdnWuXUyCPlCM1g-rs5A>
    <xmx:um15ZTSdXhafYqYwHSOfl70hIZS4QGPxUqmLgTmeAknlxmh5rNv6Fg>
    <xmx:um15ZXxrucf_pfgNDjwpUVnAUKBUm0z9q3uOfhxtJrqmB-hVRYxZFA>
    <xmx:um15ZarlFksQD-1ZlFVSGIapOT0NtFyQ7HECxhc-gcxEoI58IoL5Dw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6149DB6008D; Wed, 13 Dec 2023 03:39:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <97a826ab-cd68-4494-884e-f7bd512a7bef@app.fastmail.com>
In-Reply-To: <ZXlmnmGepRnMyNfr@kekkonen.localdomain>
References: <20231212213625.3653558-1-arnd@kernel.org>
 <ZXlmnmGepRnMyNfr@kekkonen.localdomain>
Date: Wed, 13 Dec 2023 09:39:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>,
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] media: i2c: mt9m114: add CONFIG_COMMON_CLK dependency
Content-Type: text/plain

On Wed, Dec 13, 2023, at 09:09, Sakari Ailus wrote:
> On Tue, Dec 12, 2023 at 10:18:04PM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> With clang-16, building without COMMON_CLK triggers a range check on
>> udelay() because of a constant division-by-zero calculation:
>> 
>> ld.lld: error: undefined symbol: __bad_udelay
>> >>> referenced by mt9m114.c
>> >>>               drivers/media/i2c/mt9m114.o:(mt9m114_power_on) in archive vmlinux.a
>> 
>> Avoid this by adding a Kconfig dependency that avoids the broken build.
>
> This sounds like an odd way to fix an issue with udelay(). On which arch
> does it happen? Wouldn't it be better to fix the udelay() problem in the
> source?
>
> A quick check reveals there are about 2400 files using udelay.

I observed this on arm, but same sanity check exists on arc, m68k,
microblaze, nios2 and xtensa, all of which try to discourage
overly large constant delays busy loops. On Arm that limit is
any delay of over 2 miliseconds, at which time a driver should
generally use either msleep() to avoid a busy-loop, or (in extreme
cases) mdelay().

I first tried to rewrite the mt9m114_power_on() function to
have an upper bound on the udelay, but that didn't avoid the
link error because it still got into undefined C. Disabling
the driver without COMMON_CLK seemed easier since it already
fails to probe if mt9m114_clk_init() runs into a zero clk.

Maybe we could just fall back to the soft reset when the
clock rate is unknown?

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 0a22f328981d..88a67568edf8 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2092,6 +2092,7 @@ static void mt9m114_ifp_cleanup(struct mt9m114 *sensor)
 
 static int mt9m114_power_on(struct mt9m114 *sensor)
 {
+       long freq;
        int ret;
 
        /* Enable power and clocks. */
@@ -2104,9 +2105,10 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
        if (ret < 0)
                goto error_regulator;
 
+       freq = clk_get_rate(sensor->clk);
+
        /* Perform a hard reset if available, or a soft reset otherwise. */
-       if (sensor->reset) {
-               long freq = clk_get_rate(sensor->clk);
+       if (sensor->reset && freq) {
                unsigned int duration;
 
                /*

    Arnd

