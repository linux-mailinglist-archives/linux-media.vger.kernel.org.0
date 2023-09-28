Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 092547B1683
	for <lists+linux-media@lfdr.de>; Thu, 28 Sep 2023 10:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbjI1Iyq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Sep 2023 04:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbjI1Iyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Sep 2023 04:54:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FF5196
        for <linux-media@vger.kernel.org>; Thu, 28 Sep 2023 01:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695891282; x=1727427282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ImzJ1zA2A2TvgeZw4MAcbWwu9kmKG2DdEwAY9zV26DA=;
  b=mXVkqQrhmqHLP2KfcWnUZelyDzDL1dv1VFtM8fZ11hrCCH6zgEMxtzuM
   IgPoMxRdalpDQJBGhnJm5jgPt9d2L2HOYaxwQYiLPkoDUSE0lGjauFpMo
   fvLIIhn3iTb7oItG6zR0i2/HgGPXMLvpDsV+fsA/WshScGaClK37plfOh
   whtteAMCJYn36/qahuiH1d/wJeMbXLIBHm3g8pdOwY3utIx0JNo/6ZbZg
   I6eJMN7eKQFrJH/jQakWzaePIxCK2yh2BwzWGbX2oWmES+XjZXMX5KVGU
   /+u4Dl4+GGTDuNt2axyxdW+T4VHYbU5diDcVQaU6sYwfP2dueo0C+0/Mk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="379289244"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="379289244"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 01:54:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="839780121"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="839780121"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 01:54:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2101211F967;
        Thu, 28 Sep 2023 11:54:38 +0300 (EEST)
Date:   Thu, 28 Sep 2023 08:54:38 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 1/1] media: Documentation: Split camera sensor
 documentation
Message-ID: <ZRU/TuZ9Ozo1Oz4G@kekkonen.localdomain>
References: <20230927115816.392215-1-sakari.ailus@linux.intel.com>
 <20230927122620.GA21444@pendragon.ideasonboard.com>
 <ZRQnzNUsvKIUdIN1@kekkonen.localdomain>
 <20230927222305.GW5854@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927222305.GW5854@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Sep 28, 2023 at 01:23:05AM +0300, Laurent Pinchart wrote:
> > I'll use this in v2:
> > 
> >     * - Driver name
> >       - File(s)
> >       - Driver type
> >       - Example topic
> >     * - CCS
> >       - ``drivers/media/i2c/ccs/``
> >       - Freely configurable
> >       - Power management (ACPI and DT), UAPI
> >     * - imx219
> >       - ``drivers/media/i2c/imx219.c``
> >       - Register list based
> >       - Power management (DT), UAPI, mode selection
> >     * - imx319
> >       - ``drivers/media/i2c/imx319.c``
> >       - Register list based
> >       - Power management (ACPI and DT)
> >     * - ov8865
> >       - ``drivers/media/i2c/ov8865.c``
> >       - Register list based
> >       - Power management (ACPI and DT)
> 
> It's not nice for developers to have to look at different drivers and
> takes bits and pieces from different places, especially if it's not
> clear which bits they should take on one side and which pieces on the
> other side. Ideally we should be able to collapse all thre register
> list based drivers into a single entry, but I understand we can't do
> that yet. Could we however list only one of the imx319 and ov8865 ?

I'm fine dropping one of them. The ov8865 is rather ugly otherwise so I'll
drop that.

-- 
Sakari Ailus
