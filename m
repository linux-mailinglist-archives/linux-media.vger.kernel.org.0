Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C356772E6C2
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 17:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239782AbjFMPK4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 11:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236388AbjFMPKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 11:10:55 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939B8173C
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 08:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686669052; x=1718205052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eRZObogH/MfsEuLcSx3n66N8BQCM28Pih9tZEg2TIZo=;
  b=B0qgve26WBD1k4sLnaCvnos5cAQTXcBFdOpXivzmOljG9s4cSAFNe/0n
   qyrvjZPQsQ00zoD8zgPYKIOqIIfx02etOjo7XkaP3xHY5sKqpr6q5ET/4
   NCjHu0adNOZH/I/cUqZ3QUkIcZam3G0C0Sw1sjwmSBKxAzGZIOj0xMzV+
   bkftGo3Yfjynd/uLy5B5kcxQm/1OcYcdAUwSWJBZ3Bo6B+VjOzforgx2D
   MPdtILZ9VnngQgw7moijl/xAuJRzQEpnffcKeA9auG0Jj+KIGPGu/+tfm
   5mxqGHUsqqgNxZn/9GVaQ+l4OgpuznSqlrusmJeRDgNliyJty1Ox/+pzR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="357241297"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="357241297"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 08:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="689058412"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="689058412"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 08:10:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id B79B2121526;
        Tue, 13 Jun 2023 18:10:26 +0300 (EEST)
Date:   Tue, 13 Jun 2023 15:10:26 +0000
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
Subject: Re: [RESEND PATCH v3 13/32] media: v4l: async: Simplify async
 sub-device fwnode matching
Message-ID: <ZIiG4hag+hn9w1Q/@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-14-sakari.ailus@linux.intel.com>
 <20230530050848.GR21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530050848.GR21633@pendragon.ideasonboard.com>
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

On Tue, May 30, 2023 at 08:08:48AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:15:56PM +0300, Sakari Ailus wrote:
> > V4L2 async sub-device matching originally used the device nodes only.
> > Endpoint nodes were taken into use instead as using the device nodes was
> > problematic for it was in some cases ambiguous which link might have been
> > in question.
> > 
> > There is however no need to use endpoint nodes on both sides, as the async
> > sub-device's fwnode can always be trivially obtained using
> > fwnode_graph_get_remote_endpoint() when needed while what counts is
> > whether or not the link is between two device nodes, i.e. the device nodes
> > match.
> > 
> > This will briefly break the adv748x driver but it will be fixed later in
> > the set, by patch "media: adv748x: Return to endpoint matching".
> 
> I'm afraid I don't like this. This series is complex and has a high risk
> of causing tricky issues. I would like to be able to bisect the changes.

As we discussed separately, this has been tested on both rcar-vin + adv748x
and i.MX6, I'm not overly concerned of this.

-- 
Kind regards,

Sakari Ailus
