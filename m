Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8385726B61
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 22:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbjFGUZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 16:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233540AbjFGUY5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 16:24:57 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42762720
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 13:24:30 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="346711466"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="346711466"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 13:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="833871966"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="833871966"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 07 Jun 2023 13:22:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q6zg8-001zne-2y;
        Wed, 07 Jun 2023 23:22:48 +0300
Date:   Wed, 7 Jun 2023 23:22:48 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 08/28] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIDnGGd2OU5sDT1G@smile.fi.intel.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-9-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607164712.63579-9-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 07, 2023 at 06:46:52PM +0200, Hans de Goede wrote:
> The CSI2 specification specifies a standard method to access camera sensor
> registers called "Camera Control Interface (CCI)".
> 
> This uses either 8 or 16 bit (big-endian wire order) register addresses
> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
> 
> Currently a lot of Linux camera sensor drivers all have their own custom
> helpers for this, often copy and pasted from other drivers.
> 
> Add a set of generic helpers for this so that all sensor drivers can
> switch to a single common implementation.
> 
> These helpers take an extra optional "int *err" function parameter,
> this can be used to chain a bunch of register accesses together with
> only a single error check at the end, rather then needing to error
> check each individual register access. The first failing call will
> set the contents of err to a non 0 value and all other calls will
> then become no-ops.

So, this version doesn't have updates we discussed previously. Is it only for
reference here?

-- 
With Best Regards,
Andy Shevchenko


