Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F398D72E5EC
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 16:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240695AbjFMOiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 10:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234939AbjFMOiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 10:38:04 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DEBA10E6
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686667083; x=1718203083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vQUwoKCed2S1ZsdmLM24BMAoWVNEpwnu+fMFFKa91QY=;
  b=dKME+Vv48WtsF0Dp/8aNampF7B4Fke5iw4GsFQhHzfCoielpeLjuqsdG
   5NKdVdAv1Z1cXtxzJBtuABB0i/NfOdynLHhWIRKQPj/hb/i20sd9fkBoc
   ktsdb0kquTwOhXrhUHYym0Aph/EIXzsDqOSAbWX5lnwL5+CKgyU3gOXWa
   LSErdFNIjWe8I0zoMFZZaHVZBlI/+UlOZLT7sYb/jGZjmRoOXowRKWcYq
   ReMKJtuLFhWBT1sR9CxvVJYW0MN0hzJBnVLCIYx9uv4balsyJ7xqdQ2AS
   aX4oF4Cz5cdk90MW8SDXZLuS4mZAZnMi6DvNsdIw3dGfxZPFd3Ezug4n8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="424236010"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="424236010"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:38:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="835911347"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="835911347"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:37:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 9A25A11F9D2;
        Tue, 13 Jun 2023 17:37:46 +0300 (EEST)
Date:   Tue, 13 Jun 2023 14:37:46 +0000
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
Subject: Re: [RESEND PATCH v3 11/32] media: v4l: async: Only pass match
 information for async subdev validation
Message-ID: <ZIh/OgX8L+RaXNMd@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-12-sakari.ailus@linux.intel.com>
 <20230530030215.GL21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530030215.GL21633@pendragon.ideasonboard.com>
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

On Tue, May 30, 2023 at 06:02:15AM +0300, Laurent Pinchart wrote:
> > @@ -234,20 +237,18 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> >  }
> >  
> >  /* Compare two async sub-device descriptors for equivalence */
> 
> s/sub-device/match/ ?

Yes.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks!

-- 
Sakari Ailus
