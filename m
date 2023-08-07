Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24F09771B69
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 09:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbjHGHZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 03:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjHGHZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 03:25:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09420A7
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 00:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691393104; x=1722929104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PIlDaKCu2b6XMctQHqG1hQlNRMrYp6DvNb5wM4NIMoQ=;
  b=LqBqN+EPFiT2lnOtacBQvsJVqg94fvYtzSy/QdWjjEQRzJtrVZxo3HC2
   XTAmxMZyu9c1VxnFtLTP7ikZhPku1AkL26hMQRJiUMza1eapbaJvl3Lnb
   sWU2Ev1+acuGbKUUwssOQbOfjNESlTrcdiowhxJDDe7UNuFD8qbQtesvZ
   /YUVi79q2FNnZev+HDJgi5U2xufmsHRxFykiqoWBaOxwE1xEwU1sT8nmr
   lFt93crqjlPqVRYOq4Yd6TFlOYa6GKbINyO7zhYM5xUAvNPRS7yWLgUlN
   PoFvDsiWJdeTKTE4cEPjzGDfyniWaUbPDQusE3idSsVvfLLuktsavVHF1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="434324022"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="434324022"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 00:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="800845850"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="800845850"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 00:25:02 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C1B3C11FBE7;
        Mon,  7 Aug 2023 10:24:59 +0300 (EEST)
Date:   Mon, 7 Aug 2023 07:24:59 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, wentong.wu@intel.com
Subject: Re: [PATCH 1/1] media: ivsc: Improve Kconfig help text
Message-ID: <ZNCcSzR2+SRVeI49@kekkonen.localdomain>
References: <20230804105226.3022473-1-sakari.ailus@linux.intel.com>
 <20230804134825.GF12951@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804134825.GF12951@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Aug 04, 2023 at 04:48:25PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Aug 04, 2023 at 01:52:26PM +0300, Sakari Ailus wrote:
> > Improve the Kconfig help text to convey the ACE is for changing camera
> > sensor ownership and CSI for configuring the CSI-2 rx and tx.
> > 
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ivsc/Kconfig | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
> > index 9535ac10f4f7..e9d94dbb4305 100644
> > --- a/drivers/media/pci/intel/ivsc/Kconfig
> > +++ b/drivers/media/pci/intel/ivsc/Kconfig
> > @@ -8,5 +8,9 @@ config INTEL_VSC
> >  	  This adds support for Intel Visual Sensing Controller (IVSC).
> >  
> >  	  Enables the IVSC firmware services required for controlling
> > -	  camera sensor ownership and CSI-2 link through Image Processing
> > -	  Unit(IPU) driver of Intel.
> > +	  camera sensor ownership between IVSC and host CPU (ACE) as well
> 
> What does ACE stand for ?
> 
> > +	  as configuring the CSI-2 link (CSI) towards the Image Processing
> > +	  Unit (IPU) driver of Intel.
> 
> If I understand things correctly, this is about routing the data from
> the sensor to the IVSC output towards the host. Is that right ? If so,
> let's make that explicit.

Yes, I'll add that for v2.

> 
> > +
> > +	  The modules will be called ivsc-csi and ivsc-ace.
> > +
> 

-- 
Regards,

Sakari Ailus
