Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEC77063D0
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 11:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjEQJQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 05:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjEQJQT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 05:16:19 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96CAA0
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684314978; x=1715850978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wiVhv/OUNNuKF0BiuMxOWVyNdjj1PJ9IOYZ/CyINDjU=;
  b=JSLcZuXg12WUHzq7PFd5yXTCgkO68RTNMm+u/7sBsWXU+arb+tfzprFh
   4inpDwYftdEgxdUuqyFnyOdwCi4TqLR4jcUrgD3piuX7hki/LLtytvfxu
   pwPSBYkKaQtGKY6IRshfRmhcuLh+tZmXA25exQKksZvPLiyZTGfBKJ0mS
   6F3IswsUP5FVsvZZRchqcXdnEMEhi1BO4fIgEoGqAka6Zn9KSGCc8IPOJ
   Sgn1WE2bD8whXkdrdUeqXmiCh0WzRJT/czIt2LTbeKyVd6Qtm0WR2m2Wv
   B7oMo4rmzUB/R2kDH4+f+9DnHEFQsJl1DOaJzeu3lynyiEga/m43dl+MA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="350543867"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="350543867"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 02:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766701941"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="766701941"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 02:16:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id D4574120279;
        Wed, 17 May 2023 12:16:12 +0300 (EEST)
Date:   Wed, 17 May 2023 09:16:12 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: Re: [PATCH v2 00/31] Separate links and async sub-devices
Message-ID: <ZGSbXGBUa9JPmRXC@kekkonen.localdomain>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
 <3501011.QJadu78ljV@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3501011.QJadu78ljV@steina-w>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

(Resending, fixed Niklas's e-mail.)

On Wed, May 17, 2023 at 09:57:59AM +0200, Alexander Stein wrote:
> Hi Sakari,
> 
> thanks for the update. That's awesome, device setup on media-ctl works again 
> on TQMa6x (i.MX6).
> For the record, below is what the media-ctl dot looks like. I was able to 
> capture data on ipu1_csi0_capture device.
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> #imx6q

Thanks for testing!

I'll wait for Niklas to test them, too. V1 inadvertly broke the adv748x
driver, that should be now fixed.

(But please avoid top posting.)

-- 
Kind regards,

Sakari Ailus
