Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF93873A078
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 14:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbjFVMD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 08:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbjFVMDl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 08:03:41 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E8E2132
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687435386; x=1718971386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0fz1Fsf0ELy03TjoaVka/LKTd8jg9PeLbIBynBpZRMg=;
  b=DqbKep5Qs2uhpxB3D9TrLvE8hEnyFi+EiU37ZAUa2RN18xyGSa/mepFe
   Bb9MqoyJTtImFLSNMSt4gulLJGt9bJN6eyj6VJGDjKg71SjBoapc1Gaq/
   VbfhL+a3kP9lIYkMG7e/RQmt9NRkTH5t4927uCI715sAU6lfpuCLHEWY1
   arl1C2By7s9XJuwC6aJAPV0y3KS+MIOz9urAerBPYXIgPp+KgpIT9wHMA
   QuqygyIYbzn1ksCNRi+mmvYgpyAQD1RUS+HfYDQ+GniqLn4xGF2cyS80U
   2A0Oxc3rq0aYpJaSBnELVcf8c8+J2JWRnQvAi3AS+uypmRTdPWiXqURMZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="345200362"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="345200362"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 05:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="827870341"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="827870341"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 05:02:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 3AD9C1202A4;
        Thu, 22 Jun 2023 15:02:08 +0300 (EEST)
Date:   Thu, 22 Jun 2023 12:02:08 +0000
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
Subject: Re: [RESEND PATCH v3 17/32] media: v4l: async: Rework internal lists
Message-ID: <ZJQ4QPCBsAxG7RtL@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-18-sakari.ailus@linux.intel.com>
 <20230530061153.GA6404@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530061153.GA6404@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, May 30, 2023 at 09:11:53AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:16:00PM +0300, Sakari Ailus wrote:
> > This patch re-arranges internal V4L2 async lists for preparation of
> > supporting multiple connections per sub-device as well as cleaning up used
> > lists.
> > 
> > The list of unbound V4L2 sub-devices is maintained for the purpose of
> > listing those sub-devices only, not for their binding status. Also, the
> > V4L2 async connections have a single list entry in the notifier's list, be
> > that either waiting or done lists, while the notifier's asc_list is
> > removed.
> 
> Please use the imperative style in commit messages. To me it's unclear
> if "is" here refers to the status before or after this patch. I need a
> clear description of what you're doing in order to check if the code
> matches the intent. Guessing the intent from the code makes review more
> difficult and less useful.

I'll reword this as:

The list of unbound V4L2 sub-devices shall be maintained for the purpose of
listing those sub-devices only, not for their bindin status. Also, the V4L2
async connections now have, instead of two list entries, a single list
entry in the notifier's list, be that either waiting or done lists, while
the notifier's asc_list is removed.

-- 
Kind regards,

Sakari Ailus
