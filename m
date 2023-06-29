Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64DBB74220A
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 10:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbjF2IXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 04:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbjF2IWa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 04:22:30 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41CA294C
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 01:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688026836; x=1719562836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zFQYGzyOHnCDwS5KcIL2mZMdy+i/aGklUK8rQafGeGw=;
  b=emIc5Wja8ELTMdYqoBg+j9+UmkYWrTGWxY3JlBuIM/gvwIuEptxnG0bY
   G+oTu059p3rY+zq3350XyQ4EYXBu8nM73xSvdwvF5Kysn7eDYrDXW6Aih
   8LVPC7UO8uvy6NtcMUOW4Dm421cJVI+3jALzN7+UXcYSXxKfiXABATC1z
   uvvAX+RlQb+8R92rGnpZbyYNToOp+GwCFXpqpEvquCmCFMjVHOVOhseei
   OraUkPcaLg6+eYQgmRF6t7Zc89EpwwQ0pitwEFSs2MMGL4MxnVV6R2tY+
   aOlWIvOgaREwFJE8au7uwnTyCzmmbwHJH6OTci/gP6ET1ch3bUqha5l4o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="425724119"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="425724119"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 01:20:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="717271566"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="717271566"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 01:20:28 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 2C5031207EB;
        Thu, 29 Jun 2023 11:20:25 +0300 (EEST)
Date:   Thu, 29 Jun 2023 08:20:25 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
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
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v4 32/38] media: am437x-vpfe: Register V4L2 device early
Message-ID: <ZJ0+ybhqNv2+zgVG@kekkonen.localdomain>
References: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
 <20230622114028.908825-33-sakari.ailus@linux.intel.com>
 <CA+V-a8uHp3pAzDygSC=0iJVpoXorq1zs5utmVGBs3Mj9dwYE4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8uHp3pAzDygSC=0iJVpoXorq1zs5utmVGBs3Mj9dwYE4g@mail.gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Mon, Jun 26, 2023 at 04:23:36PM +0100, Lad, Prabhakar wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Jun 22, 2023 at 12:41 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Register V4L2 device before the async notifier.This way the device can be
> > made available to the V4L2 async framework from the notifier init time
> > onwards. A subsequent patch will add struct v4l2_device as an argument to
> > v4l2_async_nf_init().
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
> > Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
> s/Tested_by/Tested-by (exists in the entire series)

Oops. I added it manually and introduced a typo. Thanks for catching this!

> 
> > Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
> > ---
> >  .../media/platform/ti/am437x/am437x-vpfe.c    | 27 +++++++++----------
> >  1 file changed, 13 insertions(+), 14 deletions(-)
> >
> 
> Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Thanks for testing and review.

-- 
Regards,

Sakari Ailus
