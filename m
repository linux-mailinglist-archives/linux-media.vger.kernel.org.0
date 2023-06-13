Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 319DD72E4C3
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 16:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242238AbjFMOA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 10:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239765AbjFMOA5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 10:00:57 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A362AD1
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 07:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686664855; x=1718200855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tAh99JUXh8iN/kbv+kwo9H253p9unrV8ZU6snblfdzY=;
  b=CIgG2Lh8sRXx9INJVgatquAJbHQ4+jtj+1lAgyDCjFzlHidoZ5ifwttO
   ti8aYULYXEj/67Gxlhgx7AhkJNpljyQqWqztxWmcWf6F6p6wSMdzYRJZ2
   sGsGs5sZYBlHTa+RJvsey9X8/w5PfjpNBrcEQDxsWmLPCkYRwtM4yjKvY
   eDIsfhg9Xeqt+T2j8RyKtPQPs2CJ6f/2owLa5TcbETsehJI2XQ9PXA9MU
   25nk4pmlUtzAoDbtrvlk8euscX+x0sfACsM2I1y5cDtM4bXQNlV4eFuER
   l1deiWN2ytNPr9vL93+2KzuiIZrI+wtPnNLkYuM4n7Xuazh383GWWl9h4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="337974825"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="337974825"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:00:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="744704654"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="744704654"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:00:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 5AF5012190B;
        Tue, 13 Jun 2023 17:00:43 +0300 (EEST)
Date:   Tue, 13 Jun 2023 14:00:43 +0000
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
Subject: Re: [RESEND PATCH v3 07/32] media: v4l: async: Drop unneeded list
 entry initialisation
Message-ID: <ZIh2i7HqUsbSfZ9i@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-8-sakari.ailus@linux.intel.com>
 <20230530024650.GH21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530024650.GH21633@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, May 30, 2023 at 05:46:50AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:15:50PM +0300, Sakari Ailus wrote:
> > The list entry is initialised as a head in v4l2_async_register_subdev()
> > just before being added to the list. This isn't needed, drop the
> > initialisation.
> 
> Is this really unneeded ? Before the initialization and the list_add()
> call there are a few code paths that can access the async_list. For
> instance, the error path calls v4l2_async_cleanup(), which calls
> 
> 	list_del_init(&sd->async_list);
> 
> That won't work well on an uninitialized (or zero-initialized)
> list_head.

I think you're right, I'll drop this patch. This initialisation will be
removed in a later patch though, as the list will be redundant soon.

-- 
Regards,

Sakari Ailus
