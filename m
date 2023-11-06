Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5877E2002
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 12:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbjKFL3e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 06:29:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjKFL3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 06:29:33 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3043BB;
        Mon,  6 Nov 2023 03:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699270170; x=1730806170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dVbgGjQlfi/ag2GwhO/7mrluIesj2NDfOw+Ao81CCzM=;
  b=LNFB0DSQAY5z8PBu1ya2aw1pjbI3+BXOrd/i4jmjgm+CgbGcZ/UPHGf4
   2xmsADEfoolGvIKzoPNFwWRnxx38AeZhV4ETJ6Y97498ienrjmU8YIO+s
   78D+JCde5iqKNsqvaXt7TGVCpuABNTkmGPsgMLSC/z36zLqxiZj14CB8L
   csIn95LzcuU5kodBqsVIpsXO1GIMcp5Uw+vmsgR1theE/NXGlQK3LiWM/
   zTEp+0MXwUkOk0aPMuCkEVROweNNZ7WdC/Gu7b5+5lrCasPZGQggTrxrj
   3MU/VeaTVHA8NMIFnZgR1VkNRzBrlANowkvnWCmByvOivvW+KUN8XNaYY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="386431930"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="386431930"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 03:29:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762294686"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="762294686"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 03:29:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qzxnH-0000000BmAW-0nCG;
        Mon, 06 Nov 2023 13:29:23 +0200
Date:   Mon, 6 Nov 2023 13:29:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, rafael@kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
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
Subject: Re: [PATCH v4 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUjOEsQSjom4SdOg@smile.fi.intel.com>
References: <20231103070631.1223643-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103070631.1223643-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 03, 2023 at 09:06:31AM +0200, Sakari Ailus wrote:
> Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> on fwnode property API. The same convention of ending the comparison at
> '@' (besides NUL) is applied on also both ACPI and swnode. The function
> is intended for comparing unit address-less node names on DT and firmware
> or swnodes compliant with DT bindings.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I believe I gave already the tag...

-- 
With Best Regards,
Andy Shevchenko


