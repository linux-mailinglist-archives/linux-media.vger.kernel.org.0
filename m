Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6B272E530
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 16:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242962AbjFMOHE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 10:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242957AbjFMOGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 10:06:53 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D4A2978
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 07:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686665129; x=1718201129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J9JVn6laP3B2Rn4yVPIQI9WVv2h/U8x2FfezXbz0AmA=;
  b=bHKdMlWdXuOA/Fv5CjhwSnwqKd2gl20tHme+DcSYs4Pe3e8zmowQE6jQ
   orXPkz+5nuWqSfvF4zdy6+8raI6hRB/8N4LgEI00tAwVkoyABBeuTZ5Ss
   yHyEkATvHU/mdd94kv077EApc39gmGB6raps65G4EQzxIQ0bNE0Qz7bWA
   KThm744G8RtpsccA8qSeR96K3QRTLdRNvDQIrDulGyXLGDjiM9C6sXEDZ
   rw+bm/QhsKAvN7yyjkHTPyAfUgPzt4hYGKPkhhvgTu5vnkhSVx88Za1b6
   r+cbcfHH2cqKru4ntkweqlOOh0lQYiHTnq68b0rFmjUrSvsKOK9QNHCLy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386738880"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="386738880"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="958417496"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="958417496"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:03:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 09F6911F9D2;
        Tue, 13 Jun 2023 16:57:21 +0300 (EEST)
Date:   Tue, 13 Jun 2023 13:57:20 +0000
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
Subject: Re: [RESEND PATCH v3 06/32] media: v4l: async: Clean up testing for
 duplicate async subdevs
Message-ID: <ZIh1wOMddND5d7+s@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-7-sakari.ailus@linux.intel.com>
 <20230530024229.GG21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530024229.GG21633@pendragon.ideasonboard.com>
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

On Tue, May 30, 2023 at 05:42:29AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:15:49PM +0300, Sakari Ailus wrote:
> > There's a need to verify that a single async sub-device isn't being added
> > multiple times, this would be an error. This takes place at the time of
> > adding the async sub-device to the notifier's list as well as when the
> > notifier is added to the global notifier's list.
> > 
> > Use the pointer to the sub-device for testing this instead of an index to
> > an array that is long gone. (There was an array of async sub-devices in
> > the notifier before it was converted to a linked list by commit
> > 66beb323e4a0 ("media: v4l2: async: Remove notifier subdevs array").
> 
> Unbalanced opening and closing parentheses.
> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index c5781124337af..320fe5cbaaf41 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -520,21 +520,19 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> >  
> >  /*
> >   * Find out whether an async sub-device was set up already or
> > - * whether it exists in a given notifier before @this_index.
> > - * If @this_index < 0, search the notifier's entire @asd_list.
> > + * whether it exists in a given notifier.
> 
> Please document what the skip_self parameter does. The parameter name
> doesn't match the 'break' in the test below, I was expecting a
> 'continue'. If my expectation is wrong documentation should help, if
> it's correct, then you can fix the code :-)

I can add some, the argument will disappear later in the series though.

This patch mirrors the old functionality, nothing more. Changing the break
to continue is functionally equivalent here as this is the end of the list,
I can do that, too.

-- 
Regards,

Sakari Ailus
