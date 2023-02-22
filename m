Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 317C969F640
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 15:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbjBVOQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 09:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjBVOQD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 09:16:03 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF1E3771D;
        Wed, 22 Feb 2023 06:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677075362; x=1708611362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t4UAJirHllA6a0O0TQJKWgK3eM31C576g0N8858G5MI=;
  b=IEeKU5hYIy8xkDbSOwXCUvYVo+9fAfxIGgf14bSdw+PKjNfALjZRr44k
   MDn2qQABgZBtBhwO/KoIdcJY2mAnWYg7rwaGq6xFs7IB9QtMrKZehxPEg
   iKoe5k3c9F9X/0nJGUbD2tPU2JBotHdSgjb0FbYJpIh3mx0knuGCkewcs
   UhRe8AfQOA6C/Ji9PKoec/ZIR5+IVctyZVE0ZKNfgojfImOBwrTOBs2Gw
   CnIKV94K1xwR7NshiGs0tAs8ccdlR+rlti0g20SvlS+EkbnqQWOVnQJgg
   4iX3kzy6bX1txZ01evHqLlyNwtEithzuVARoVPqLNFuBj05S+iGd2rqTG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="335131450"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="335131450"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 06:15:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="674123658"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="674123658"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2023 06:15:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pUpuQ-00ARTJ-01;
        Wed, 22 Feb 2023 16:15:50 +0200
Date:   Wed, 22 Feb 2023 16:15:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v10 0/8] i2c-atr and FPDLink
Message-ID: <Y/YjlW2byyHKamxl@smile.fi.intel.com>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 22, 2023 at 03:28:59PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> You can find v9 from:
> 
> https://lore.kernel.org/all/20230216140747.445477-1-tomi.valkeinen@ideasonboard.com/
> 
> Diff to v9 included below.
> 
> Main changes in v10:
> - Switch pre-increments to post-increments
> - Add macros for FPD3_RX_ID lengths
> - Use regmap_bulk_read in 16 bit reg accessors

Thanks!
I have no more remarks, nice job!

One thing below to just look at and if you want / have time / chance update.

...

> +	ret = regmap_bulk_read(priv->regmap, reg, &__v, 2);

sizeof()

...

> +	ret = regmap_bulk_read(priv->regmap, reg, &__v, 2);

Ditto.

-- 
With Best Regards,
Andy Shevchenko


