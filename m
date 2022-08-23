Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72CF459ECF3
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 21:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbiHWT6x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 15:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbiHWT63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 15:58:29 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E96760D4
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 12:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661281769; x=1692817769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pI0yM+fhTjLPGp3fQXG0kvebBVTnzlQw9S0c7iybcSw=;
  b=gRPWw6VVtWbt01OYMu5NLkHJaTMs2bQ4B4W1/b/02BBLFHcAWhAkpmbW
   /QgwlE1IsbKFvHv5pijdnOTBiCJDl8KUZMi4hX5PT2t+BUN0suz6gzbfU
   zfgAs1lB0IsrEVFxRTvcdNqqQnhzenXpNj8K1sRduyW62thBpK46erPGb
   TvzeqQgRWsEQh9pfveXr9eHYbv4JySAKfpBEZDRVC/EMxMpqbB/lLJgqD
   oWaDhdzTcUyjfo7OgUtOwW12gXPnkiJfzFh4sSBe4qjBxU56vtu+/gabQ
   FhqwBvpv5hir5MH+TzHEFct1BU9EaPzo/+eifTdleU9XAhPuluh4EKl34
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="293774815"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; 
   d="scan'208";a="293774815"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 12:09:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; 
   d="scan'208";a="735600583"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 12:09:27 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 324E7201DB;
        Tue, 23 Aug 2022 22:09:25 +0300 (EEST)
Date:   Tue, 23 Aug 2022 19:09:25 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [PATCH] media: mt9p031: Increase post-reset delay
Message-ID: <YwUl5ZhMeE3TYjdP@paasikivi.fi.intel.com>
References: <20220823165723.276156-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823165723.276156-1-marex@denx.de>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On Tue, Aug 23, 2022 at 06:57:23PM +0200, Marek Vasut wrote:
> The MT9P006 sensor driver sporadically fails to probe because the sensor
> responds with a NACK condition to I2C address on the bus during an attempt
> to read the sensor MT9P031_CHIP_VERSION register in mt9p031_registered().
> 
> Neither the MT9P006 nor MT9P031 datasheets are clear on reset signal timing.
> Older MT9M034 [1] datasheet provides those timing figures in Appendix-A and
> indicates it is necessary to wait 850000 EXTCLK cycles before starting any
> I2C communication.
> 
> Add such a delay, which does make the sporadic I2C NACK go away, so it is
> likely similar constraint applies to this sensor.
> 
> [1] https://www.onsemi.com/pdf/datasheet/mt9m034-d.pdf
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/media/i2c/mt9p031.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index 45f7b5e52bc39..7c83be5b9ec9d 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -307,6 +307,7 @@ static inline int mt9p031_pll_disable(struct mt9p031 *mt9p031)
>  
>  static int mt9p031_power_on(struct mt9p031 *mt9p031)
>  {
> +	unsigned long delay;
>  	int ret;
>  
>  	/* Ensure RESET_BAR is active */
> @@ -334,7 +335,9 @@ static int mt9p031_power_on(struct mt9p031 *mt9p031)
>  	/* Now RESET_BAR must be high */
>  	if (mt9p031->reset) {
>  		gpiod_set_value(mt9p031->reset, 0);
> -		usleep_range(1000, 2000);
> +		/* Wait 850000 EXTCLK cycles before de-asserting reset. */
> +		delay = DIV_ROUND_UP(850000 * 1000, clk_get_rate(mt9p031->clk));

clk_get_rate() will return 0 if there's no clock. I guess that doesn't
happen commonly but it'd be nice to guard against that.

> +		msleep(delay);
>  	}
>  
>  	return 0;

-- 
Regards,

Sakari Ailus
