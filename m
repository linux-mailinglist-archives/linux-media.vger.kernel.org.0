Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62FBD691E2E
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 12:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbjBJL1I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 06:27:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbjBJL1G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 06:27:06 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790626BAA4
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 03:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676028425; x=1707564425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DzXHqz2CeYe24S17PY8CbWRmhq9uaL6YfcGl+VJL8e8=;
  b=MbTAv0y5v+ie2Wz9hn6FojHIU7iGe2xGvvLGm7fHVWeHuTkjiGXjMEYw
   zInyccjaYWIpc3wSNi40nlb+fCt1p6YsBRKQ6wsnxd773pyueISljR6/i
   8TEa/8QnUMiP+w8jQOR4q45DhE/sXuULmtfRvBXxIZnuVdgcPNVLzQm24
   uyskt1sdSL1cxmn81ad4D6ZFM9oicKVNlWdMaU6DBx3Za1yIaQadz5G/q
   Usxv3s4nAwzz2q2Aa5ZF/qLTnzDpL/BqRx5CrPwy+pMKPAN0TDuTlPa++
   QmK2qvq9+EBGOx3lXzApXiyEPv3sa/bsV061wARYMz/ba3nywKkuQHr0t
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="314042669"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="314042669"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 03:27:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="669972152"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="669972152"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 03:27:01 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 3FB9111F9EF;
        Fri, 10 Feb 2023 13:18:12 +0200 (EET)
Date:   Fri, 10 Feb 2023 13:18:12 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+Yn9JRsZOb6ZuzW@kekkonen.localdomain>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <Y+YamxehIUdF5aU7@kekkonen.localdomain>
 <Y+Ycf4SpMaUfdR5m@pendragon.ideasonboard.com>
 <Y+Yg217HSEi4c+mP@kekkonen.localdomain>
 <Y+Yk0IaBghjj18C8@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+Yk0IaBghjj18C8@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Feb 10, 2023 at 01:04:48PM +0200, Laurent Pinchart wrote:
> > > > > > > Also, may I
> > > > > > > suggest to have a look at drivers/media/i2c/imx290.c for an example of
> > > > > > > how registers of different sizes can be handled in a less error-prone
> > > > > > > way, using single read/write functions that adapt to the size
> > > > > > > automatically ?
> > > > > > 
> > > > > > Yes I have seen this pattern in drivers/media/i2c/ov5693.c too
> > > > > > (at least I assume it is the same pattern you are talking about).
> > > > > 
> > > > > Correct. Can we use something like that to merge all the ov*_write_reg()
> > > > > variants into a single function ? Having to select the size manually in
> > > > > each call (either by picking the function variant, or by passing a size
> > > > > as a function parameter) is error-prone. Encoding the size in the
> > > > > register macro is much safer, easing both development and review.
> > > > 
> > > > I think so, too.
> > > > 
> > > > That doesn't mean we shouldn't have function variants for specific register
> > > > sizes (taking just register addresses) though.
> > > 
> > > I don't see why we should have multiple APIs when a single one works.
> > 
> > Yes, it "works", but the purpose of the API is to avoid driver code. A
> > driver accessing fixed width registers is likely to use a helper function
> > with an API that requires encoding the width into the register address.
> 
> Why not ? I don't see anything wrong with having that as a single API,
> it doesn't make life more complicated for driver authors or reviewers.

Given that the reviewers (at least me) haven't had noteworthy issues when
each driver implements their own register access functions, I'm not
concerned having ~ six register read functions instead of one or two.
Driver authors should pick the one that fits the purpose best, and not be
required to implement wrappers in drivers --- which is exactly the
situation we have today.

-- 
Regards,

Sakari Ailus
