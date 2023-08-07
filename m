Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA881771DF7
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 12:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbjHGK1J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 06:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbjHGK1H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 06:27:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE0610F6
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 03:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691404026; x=1722940026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qAwzq455/SgCTO97IJOXvurI7M/7iCz0QXZVEXlDDcM=;
  b=PbSi+wKknG3qdiU5iT6BvUKsPcv/cKIknz1SQixKdbxSDhhx+EmSowVH
   TNoc8V3GY/h/NLC78cy556dc/dfEiqpKQ+05LqGhoZXgIFmSTLcwvVQZ0
   eN05+kiYSwgNslHuZc5Jcc3hdsohOE44kqGiDEPly04A88/Ykm1/XVteM
   69eHdZYF3ywcnJ47foUDpLIph3X7T8dSCyY4YegE+ZlABe2jPRFY3LzmM
   9h9t+TKTs7rJBWLwUSy0IGMGV2UH0hLpCD3QzHu0kHBpMscHXUC8FariF
   gQbkPif3QKa0WoN9TQqvYbWMnsBySOtxB0emlcs+h6L84gAiqPJjfoQ/J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="456891385"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="456891385"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 03:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="734043414"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="734043414"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 03:27:04 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 192D411F854;
        Mon,  7 Aug 2023 13:27:02 +0300 (EEST)
Date:   Mon, 7 Aug 2023 10:27:02 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, wentong.wu@intel.com
Subject: Re: [PATCH v2 1/1] media: ivsc: Improve Kconfig help text
Message-ID: <ZNDG9rGMAdUCFoZC@kekkonen.localdomain>
References: <20230807074059.3028144-1-sakari.ailus@linux.intel.com>
 <20230807100951.GK12951@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807100951.GK12951@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Aug 07, 2023 at 01:09:51PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Aug 07, 2023 at 10:40:59AM +0300, Sakari Ailus wrote:
> > Improve the Kconfig help text to convey the ACE is for changing camera
> > sensor ownership and CSI for configuring the CSI-2 rx and tx.
> > 
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> > 
> > - Reworded most of the help text.
> > 
> >  drivers/media/pci/intel/ivsc/Kconfig | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
> > index 9535ac10f4f7..ec4ade92f583 100644
> > --- a/drivers/media/pci/intel/ivsc/Kconfig
> > +++ b/drivers/media/pci/intel/ivsc/Kconfig
> > @@ -7,6 +7,12 @@ config INTEL_VSC
> >  	help
> >  	  This adds support for Intel Visual Sensing Controller (IVSC).
> >  
> > -	  Enables the IVSC firmware services required for controlling
> > -	  camera sensor ownership and CSI-2 link through Image Processing
> > -	  Unit(IPU) driver of Intel.
> > +	  The IVSC support is split into two devices, ACE (Algorithm
> > +	  Context Engine) and CSI (Camera Serial Interface), each of which
> > +	  have their own drivers. The ACE is used to select the ownership
> > +	  of the sensor between the IVSC and the host CPU while the CSI is
> > +	  used to both select the routing destination for the data the
> > +	  sensor transmits over the CSI-2 bus between the IVSC and the
> > +	  host CPU and to configure the CSI-2 bus itself.
> > +
> > +	  The modules will be called ivsc-ace and ivsc-csi.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Side question though: as those two modules are always used together,
> could they be squashed into a single module ?

It's uncommon to have multiple drivers in a single module. I'd keep them
separate, even if you wouldn't use one without the other.

-- 
Kind regards,

Sakari Ailus
