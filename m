Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECE47DDEB1
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 10:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjKAJuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 05:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjKAJuO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 05:50:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB37BED;
        Wed,  1 Nov 2023 02:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698832209; x=1730368209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zDiWeh0tO0Ei/h8vXh3lQTonMfi7WIE4tqSqr/o3WIQ=;
  b=cbEYbcudVGSn6XziMFLlRyKNyrMPNlOk9tmxdJJU6S7mqpgv8nz8r3tj
   4a6L41+rAizg+sVhMUnVi/9gHGirrTPMfPMII+/oUsF7aRB5Rz0IHsToV
   NcRITrt0ZtM8/wfZbsVTVDNVFKj5k+Nj7h23NQVMVk/QOMr9gNOPtnaSw
   BXQ8vrLz5MR3L5MmK/avjUG84U8PosbHtw+njh3ZWoF+wOkPI/fk1RPkg
   KdscAvTotPlzHGtKvnCJOKjhFUFcmOc/3OfWOLoabsDxsK4FCZqvIueaq
   MWbetcos6viZVJI33MkTj8hUtuLQ2Hr/GwBXZRgX8UZSirMwNb44unLfU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388287349"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="388287349"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 02:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="904594825"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="904594825"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 02:50:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qy7rM-0000000APbY-2ezT;
        Wed, 01 Nov 2023 11:50:00 +0200
Date:   Wed, 1 Nov 2023 11:50:00 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org,
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
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        rafael@kernel.org
Subject: Re: [PATCH v2 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUIfSIWze4llNJfd@smile.fi.intel.com>
References: <20231101072729.1142578-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101072729.1142578-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 01, 2023 at 09:27:29AM +0200, Sakari Ailus wrote:
> Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> on fwnode property API. The same convention of ending the comparison at
> '@' (besides '\0') is applied on also both ACPI and swnode. The function
> is intended for comparing unit address-less node names on DT and firmware
> or swnodes compliant with DT bindings.

...

> - Use size_t type for len.

Strictly speaking it should be ptrdiff_t according to the code.

...

> + * the comparison to either '\0' or '@' character

NUL is a human-readable substitution to less parsable '\0'.

-- 
With Best Regards,
Andy Shevchenko


