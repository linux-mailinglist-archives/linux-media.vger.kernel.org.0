Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 229F768EDF6
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 12:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbjBHLbZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 06:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjBHLbY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 06:31:24 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0643F3CE33
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 03:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675855884; x=1707391884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pOSyM70CQLZ5WVuxg2j8VLFtjvsopnsTbJ2uTePKOhE=;
  b=MnNkTVMj67YmzQdJiqLkDc3xTZREy8AK3/vknec6Jy7tuhi9yn+L/xNx
   MTJEFwCoGNOgyLnRVaUZGYCVOi8CflFCeSW/D/NR6Vl86tL4Qhn2BgUdS
   UlJu6GcVuOaAuXe3HVWe2e+Eqkw46N18nioCq1E9mOxxYNuNVKfnP9bar
   9cOxbUVjR+vG7GkZvErRzIYlaa2BNZlXeCFeig+2se1JiEX3CyWRygb5Z
   q9YqJ3Bu9B/GJzNMYNXIw3JQ3DnUqA3X+YhQaDVPKExMLC9XQKMM5M2fH
   FEoN/2GNLPMMTUhDbnRrdUSFvuZ6IUIyDqQBLTsqomzH6vBKRQ/5dN5xf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="313413330"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="313413330"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 03:31:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="644830489"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="644830489"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 03:31:20 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 363DB120D20;
        Wed,  8 Feb 2023 13:31:17 +0200 (EET)
Date:   Wed, 8 Feb 2023 13:31:17 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+OIBefssxY3bbmK@kekkonen.localdomain>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-29-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
> ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
> ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
> 
> as well as various "atomisp" sensor drivers in drivers/staging, *all*
> use register access helpers with the following function prototypes:
> 
> int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
>                     unsigned int len, u32 *val);
> 
> int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
>                      unsigned int len, u32 val);
> 
> To read/write registers on Omnivision OVxxxx image sensors wich expect
> a 16 bit register address in big-endian format and which have 1-3 byte
> wide registers, in big-endian format (for the higher width registers).
> 
> Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> versions of these register access helpers, so that this code duplication
> can be removed.

Ideally we'd have helpers for CCI, of which this is a subset. And on top of
regmap. I don't object adding these either though.

-- 
Kind regards,

Sakari Ailus
