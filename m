Return-Path: <linux-media+bounces-2307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D03F810D12
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 10:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A45FBB20C4D
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 09:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1435A1EB56;
	Wed, 13 Dec 2023 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRG1auie"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD97AD;
	Wed, 13 Dec 2023 01:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702458626; x=1733994626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NK5CGOWZzJtFJ+tQVFBiqQ0S1RcmUfzssbY3bSCif/4=;
  b=FRG1auieslK682NORMlXcVAxYy4AXf6kcUFdSr+vm9PLjStXMxayizPx
   NxF42bS/ZO4bL/2xtuYO2V+8B3j4GjEextBHroqPEYbaJ9leIOC+eFKPD
   BU8huyDsigoL85Q6TYFETkM7sdJ7T3G636wbbdfnquhXH8p8d7R+81stH
   U4lf2jAGeUMxqfyqVsHk+gj4viH4dD3ZRGQ9pZ9Z7EbZMOorkwqusD4Bm
   25qdMwVLvXSaZniqYzkQF9+MPakI4GmzT4n/MKVCzzd9+nC2koPsid21j
   Z3RMo1peSgJd8d+QJweYOgxJxh6aYaG4eoom7Ovcxst1tpqyfxXXb0zs1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="481136912"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="481136912"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 01:10:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="844238327"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="844238327"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 01:10:22 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8768D11F7E4;
	Wed, 13 Dec 2023 11:10:19 +0200 (EET)
Date: Wed, 13 Dec 2023 09:10:19 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] media: i2c: mt9m114: add CONFIG_COMMON_CLK dependency
Message-ID: <ZXl0-8VgzF3YH18i@kekkonen.localdomain>
References: <20231212213625.3653558-1-arnd@kernel.org>
 <ZXlmnmGepRnMyNfr@kekkonen.localdomain>
 <97a826ab-cd68-4494-884e-f7bd512a7bef@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97a826ab-cd68-4494-884e-f7bd512a7bef@app.fastmail.com>

Hi Arnd,

On Wed, Dec 13, 2023 at 09:39:01AM +0100, Arnd Bergmann wrote:
> On Wed, Dec 13, 2023, at 09:09, Sakari Ailus wrote:
> > On Tue, Dec 12, 2023 at 10:18:04PM +0100, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> With clang-16, building without COMMON_CLK triggers a range check on
> >> udelay() because of a constant division-by-zero calculation:
> >> 
> >> ld.lld: error: undefined symbol: __bad_udelay
> >> >>> referenced by mt9m114.c
> >> >>>               drivers/media/i2c/mt9m114.o:(mt9m114_power_on) in archive vmlinux.a
> >> 
> >> Avoid this by adding a Kconfig dependency that avoids the broken build.
> >
> > This sounds like an odd way to fix an issue with udelay(). On which arch
> > does it happen? Wouldn't it be better to fix the udelay() problem in the
> > source?
> >
> > A quick check reveals there are about 2400 files using udelay.
> 
> I observed this on arm, but same sanity check exists on arc, m68k,
> microblaze, nios2 and xtensa, all of which try to discourage
> overly large constant delays busy loops. On Arm that limit is
> any delay of over 2 miliseconds, at which time a driver should
> generally use either msleep() to avoid a busy-loop, or (in extreme
> cases) mdelay().
> 
> I first tried to rewrite the mt9m114_power_on() function to
> have an upper bound on the udelay, but that didn't avoid the
> link error because it still got into undefined C. Disabling
> the driver without COMMON_CLK seemed easier since it already
> fails to probe if mt9m114_clk_init() runs into a zero clk.
> 
> Maybe we could just fall back to the soft reset when the
> clock rate is unknown?

The datasheet says the input clock range is between 6 MHz and 54 MHz. We
could check that, and return an error if it's not in the range. The rate is
needed for other reasons, too, and the sensor is unlikely to work if it's
(more than little) off.

I wonder if this could address the Clang 16 issue, too? I'd replace
udelay() with fsleep() in any case, and at the very least Clang should be
happy with this.

> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 0a22f328981d..88a67568edf8 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -2092,6 +2092,7 @@ static void mt9m114_ifp_cleanup(struct mt9m114 *sensor)
>  
>  static int mt9m114_power_on(struct mt9m114 *sensor)
>  {
> +       long freq;
>         int ret;
>  
>         /* Enable power and clocks. */
> @@ -2104,9 +2105,10 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
>         if (ret < 0)
>                 goto error_regulator;
>  
> +       freq = clk_get_rate(sensor->clk);
> +
>         /* Perform a hard reset if available, or a soft reset otherwise. */
> -       if (sensor->reset) {
> -               long freq = clk_get_rate(sensor->clk);
> +       if (sensor->reset && freq) {
>                 unsigned int duration;
>  
>                 /*
> 
>     Arnd

-- 
Regards,

Sakari Ailus

