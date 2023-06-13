Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD0972E54C
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 16:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242684AbjFMOJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 10:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242793AbjFMOJi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 10:09:38 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE65B1732
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 07:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686665353; x=1718201353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XEkYNKkdh42x1yAn+L9Xi/AKLnshZUGDUIOVvVLGRkE=;
  b=CaPHRDtkdJ+ID2GOanp3nVA1wckEhv7uF9YnUD+OJQxyZ7tPGEiv7GDN
   KGVwF1SAn4PPrqIqD6VDhzehIKXdUafydvdRq3O5h/rA3N+CPgZp/db8o
   HgOMDV+YYbrMuhTo2cT5nWE4jjPCmNDfCLv5PtIfcef0nTGMx0NWb3VZ1
   KxW0wsSPs9Cjv+/WEnSdT5QcfpQ4WxsJEQSxkyColXIn4CA7rV8z2RwWQ
   K3oCkHKVnM/l/tHA9otx5k18yEFwE6pdcbDdPvAlTmX1Cwp7dPUK1ZPDW
   to3q3Mc2ldSJBxvyNB3zOP9Z82sldkwDS4Yq7fTeLwkcPg14ihcCvKdw4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="343029524"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="343029524"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="958418114"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="958418114"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:08:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id D677E11F9D2;
        Tue, 13 Jun 2023 17:08:38 +0300 (EEST)
Date:   Tue, 13 Jun 2023 14:08:38 +0000
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
Message-ID: <ZIh4ZnLx3sbYX9D+@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-8-sakari.ailus@linux.intel.com>
 <20230530024650.GH21633@pendragon.ideasonboard.com>
 <ZIh2i7HqUsbSfZ9i@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIh2i7HqUsbSfZ9i@kekkonen.localdomain>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 13, 2023 at 02:00:43PM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Tue, May 30, 2023 at 05:46:50AM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Thu, May 25, 2023 at 12:15:50PM +0300, Sakari Ailus wrote:
> > > The list entry is initialised as a head in v4l2_async_register_subdev()
> > > just before being added to the list. This isn't needed, drop the
> > > initialisation.
> > 
> > Is this really unneeded ? Before the initialization and the list_add()
> > call there are a few code paths that can access the async_list. For
> > instance, the error path calls v4l2_async_cleanup(), which calls
> > 
> > 	list_del_init(&sd->async_list);
> > 
> > That won't work well on an uninitialized (or zero-initialized)
> > list_head.
> 
> I think you're right, I'll drop this patch. This initialisation will be
> removed in a later patch though, as the list will be redundant soon.

Actually the list and the field remains, although it becomes unnecessary to
initialise it. I'll see if this patch would be meaningful later on in the
series or squashed to another patch.

-- 
Sakari Ailus
