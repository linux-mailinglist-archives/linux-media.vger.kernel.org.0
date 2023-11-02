Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DD87DF2FB
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 13:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376347AbjKBM51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 08:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjKBM50 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 08:57:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D32CC125;
        Thu,  2 Nov 2023 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929837; x=1730465837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RMDM7reEs0Ot39FWgYWerv/kjGQiEL5fgEgqqZjutMA=;
  b=DWJAgOBrY3I0eQCvjb/wje15jXF4wynPU6U+XnT4mo8ybMtUnvGlC1cm
   jAw9/j2eyOrj0WvE2SGaZmSg3kqIS/bKn6oaDqEQsJ0aC9e46xldOE4Ld
   EV8vu6yBUC3IelUCck0+d2pNEiq1dP3xQzXRkCu7tu/tiAnnTKR/fIo9g
   JYlcmY3YpFBFekgphGBPhdOPhCgNnBpWuiX1fCzQvVCnAmaY3YL6c3KcV
   ADiUoCxr8zh8e9cLA2zYfk5OimqCELYfcvWqvPPslIZTfrbMiqwLioQc4
   CXprpoSXe1XqyQULIMuqCqzxsXJcc2xjefKsc3/k3b/7CVWqUFVmFEGpb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="368910188"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="368910188"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="904999992"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="904999992"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:57:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qyXG2-0000000Agsi-2RZT;
        Thu, 02 Nov 2023 14:57:10 +0200
Date:   Thu, 2 Nov 2023 14:57:10 +0200
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
Message-ID: <ZUOcpr01VRWdBL-E@smile.fi.intel.com>
References: <20231101072729.1142578-1-sakari.ailus@linux.intel.com>
 <ZUIfSIWze4llNJfd@smile.fi.intel.com>
 <ZUIhr1Wiy96PMEKx@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUIhr1Wiy96PMEKx@kekkonen.localdomain>
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

On Wed, Nov 01, 2023 at 10:00:15AM +0000, Sakari Ailus wrote:
> On Wed, Nov 01, 2023 at 11:50:00AM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 01, 2023 at 09:27:29AM +0200, Sakari Ailus wrote:

...

> > > - Use size_t type for len.
> > 
> > Strictly speaking it should be ptrdiff_t according to the code.
> 
> It'll be compared to size_t right after. ptrdiff_t is signed and we know we
> have a positive number here so size_t seems like a better choice.

Yeah, this is downsides of C language and typing system.
But diff between pointers returns ptrdiff_t result.

...

> > > + * the comparison to either '\0' or '@' character
> > 
> > NUL is a human-readable substitution to less parsable '\0'.
> 
> I can send v3 with that but I'll wait a bit if there are more comments.

Why not? You got tags, so I'll give mine with this being addressed.

-- 
With Best Regards,
Andy Shevchenko


