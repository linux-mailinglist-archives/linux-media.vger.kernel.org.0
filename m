Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F5372E3EA
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 15:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240639AbjFMNUC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 09:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242554AbjFMNUA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 09:20:00 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F4DE6
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 06:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686662400; x=1718198400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vZEp9H0oRsjhwHXIvilGWZAZjYIAzu6CexXijcd4BK4=;
  b=d9TxXtCCBeq1/VMaH7Br0v3wE6We4SnxnUJ6OJsdLUx+jiAR5qwMa7Gq
   5hRvMCe16eIzov6kX0k47NDnp6weVzEGYd5VbxRn9GyS9L1Sv8tFBmL/E
   f3HGTfzUqoRvFVRC4j9BpBKXCgkoaybZWAE58/kWH/LV5REy8Y1ok3+b1
   Uc2coxgJuq2SdppaIFaCXTnJOPcZYz+M64OXcqbMyaADm/6cSkAHt2ud4
   1g95WgKwGPvgobIb2rejEj8OFIHhEa6tvzkC0GiF88nHEDTAM/BDe1ul9
   1aC+OP0KVyxtNXd+EtZYU5QLXdCMSmbjDfIwubWuPb2mEfnoU+1NRzfOl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386724734"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="386724734"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 06:19:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="711640442"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="711640442"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 06:19:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 66D5C11F81C;
        Tue, 13 Jun 2023 16:19:49 +0300 (EEST)
Date:   Tue, 13 Jun 2023 13:19:49 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 04/32] media: omap3isp: Don't check for the
 sub-device's notifier
Message-ID: <ZIhs9f2rKaQOeXk3@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-5-sakari.ailus@linux.intel.com>
 <20230530022323.GE21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530022323.GE21633@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review.

On Tue, May 30, 2023 at 05:23:23AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:15:47PM +0300, Sakari Ailus wrote:
> > There's no need to check for a sub-device's notifier as we only register
> > one notifier (and one V4L2 device). Remove this check and prepare for
> > removing this field in struct v4l2_subdev.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/platform/ti/omap3isp/isp.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> > index f3aaa9e76492e..c2b222f7df892 100644
> > --- a/drivers/media/platform/ti/omap3isp/isp.c
> > +++ b/drivers/media/platform/ti/omap3isp/isp.c
> > @@ -2039,9 +2039,6 @@ static int isp_subdev_notifier_complete(struct v4l2_async_notifier *async)
> >  	}
> >  
> >  	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
> > -		if (sd->notifier != &isp->notifier)
> > -			continue;
> 
> I don't think this is quite right. You could have a chain of external
> subdevs, in which case only the one connected directly to the ISP should
> be linked to the ISP.

You're right, in principle this could take place. Going forward sub-devices
may be bound to multiple notifiers so this field should go. I'll see if we
could have another test for this.

-- 
Kind regrads,

Sakari Ailus
