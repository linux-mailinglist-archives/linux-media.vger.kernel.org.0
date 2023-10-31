Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80A67DD26E
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 17:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345887AbjJaQnw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 12:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345735AbjJaQns (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 12:43:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7805212A;
        Tue, 31 Oct 2023 09:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698770627; x=1730306627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7B5NIFZnAMgt5AVmwDkbgyLx7q+R9dV1QKWlaH93HYc=;
  b=eAJ/jKB3XxYX2GBdebnsIOuNISAeSsDvxOlerbvdbZpCHRHR5H9DHk98
   nDC54MYcyBa4HAg8i6smZKei6j977mua+PjuzQ3x2XDK5SM7eG476oDwk
   HZiyvMvIjsGVkfX/sw6N1uKR77KkNF44bSKBaJPEWT/Bzq4iKmhcctZJO
   k+7A5mVVyzRn0iAJWi2VCmSq92XhDWD3kaGDC9ts0QpuZvXdh0iMLVDXf
   GIwi13uVEJhgv6hwhcMFxOR6oaiCXh34FLuPo3Fj4je0/Q5fUsv1dpEXP
   41Kl/qTaewsOz3N3V9qtx0hcneGoGmidcgpvtziyllZO0krEcQlfkFwKS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="6950412"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="6950412"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 09:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1092068287"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1092068287"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 09:43:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qxrq6-0000000ACtG-3U8G;
        Tue, 31 Oct 2023 18:43:38 +0200
Date:   Tue, 31 Oct 2023 18:43:38 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 3/3] media: i2c: Add driver for THine THP7312
Message-ID: <ZUEuuqLv7p0nB9a-@smile.fi.intel.com>
References: <20231017132103.9914-4-laurent.pinchart@ideasonboard.com>
 <ZTutbU1XG_jKZbIp@valkosipuli.retiisi.eu>
 <20231027124529.GA19539@pendragon.ideasonboard.com>
 <ZTvOIQSmpytUisUD@valkosipuli.retiisi.eu>
 <20231028151858.GB20465@pendragon.ideasonboard.com>
 <ZT9kwC3abUKR9fgQ@valkosipuli.retiisi.eu>
 <20231030104241.GJ12144@pendragon.ideasonboard.com>
 <ZUDatMX10WK0bdid@valkosipuli.retiisi.eu>
 <ZUEEBXfjTPqnnL9b@smile.fi.intel.com>
 <20231031142459.GB14322@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031142459.GB14322@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 31, 2023 at 04:24:59PM +0200, Laurent Pinchart wrote:
> On Tue, Oct 31, 2023 at 03:41:25PM +0200, Andy Shevchenko wrote:
> > On Tue, Oct 31, 2023 at 10:45:32AM +0000, Sakari Ailus wrote:

...

> > I agree with Sakari. Let's reduce the scope of ACPI/OF/etc-specific functions
> > in the drivers. There are really little that have no generic counterparts.
> > And most of the usages are special cases.
> 
> Sakar has submitted a patch to add one missing fwnode function.

I have reviewed it already :-)

> If it gets accepted, I'll try it out and see if I can convert this driver.

I'm sure we can make this happen, but let's see...

> I will still not do a partial conversion if I hit any other blocker.

If any other issues, don't hesitate to report!

-- 
With Best Regards,
Andy Shevchenko


