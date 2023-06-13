Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB14172E8E2
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 18:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbjFMQ66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 12:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbjFMQ65 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 12:58:57 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E473123
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 09:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686675536; x=1718211536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tVuv6ZohR3wkOfRn5ucA2vgMiQcCx4yv8de97jzNVQw=;
  b=SyZT7SrJBCD2wxZ+GruUXnAn0V7fZjotE8xuaqq3nCO/faVNUH+gHWeW
   AMDUmKVvFHbBektNUAcCPiEVvy0R3EwpJyN/I+oj7GhEVR50SNJdDtkhh
   evZrOkxqsJY9dtSfGYr76K5k98TbjgCgqPyvRYuGGQMyxucEU0LHCL9Wu
   jbFdkLY0xwMvDaVA/4bn7/JpCEVNWXLgLCUB7GsejIAUY46C8tQ0M3jDd
   P2kou2W0GhV4Sb0bofDoUy/rimRLq5EuPa2kCK5+BpAvJ5VJW7j9qaR7t
   HqACJdFwroUfvBxEwqAAytdLGKMLL9eekQe1I4GuO5JlKcrBf6xjvNUtR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="357275855"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="357275855"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 09:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="711728453"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="711728453"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 09:58:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 5B4E5120C1C;
        Tue, 13 Jun 2023 19:58:36 +0300 (EEST)
Date:   Tue, 13 Jun 2023 16:58:36 +0000
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
Subject: Re: [RESEND PATCH v3 16/32] media: v4l: async: Drop duplicate
 handling when adding connections
Message-ID: <ZIigPPQagUyhiNwC@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-17-sakari.ailus@linux.intel.com>
 <20230530060115.GU21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530060115.GU21633@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, May 30, 2023 at 09:01:15AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, May 25, 2023 at 12:15:59PM +0300, Sakari Ailus wrote:
> > The connections are checked for duplicates already when the notifier is
> > registered. This is effectively a sanity check for driver (and possibly
> > obscure firmware) bugs. Don't do this when adding the connection.
> 
> Isn't it better to have this sanity check when the connection is added,
> instead of later when the notifier is registered ? The latter is more
> difficult to debug. If you want to avoid duplicate checks, could we drop
> the one at notifier registration time ?

I've never seen or heard this check failing. I'm therefore not very
concerned keeping it as easy to debug as possible, instead I prefer simpler
implementation.

Checking at the registration time is still necessary as the same match
could have been added to another notifier while this one was being set up.

-- 
Kind regards,

Sakari Ailus
