Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6F756E2269
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjDNLjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjDNLjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:39:20 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341A64ED0
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681472360; x=1713008360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6q8oSvJZyGJ4HXK/Sz0xXVfUN9DUhoGJjCk90RIfZjs=;
  b=EmTg3+XsKrlj3Hz2x6/iap3upZUEc0FnUi5dEtqq+6V8HiN1orj89YN/
   gTibAqajJ1YU23mryWS/mXsU68SAiarvNuR6BiOO5NxL49wMrviLGwF1l
   yZSeaxu9jsPxJKYI+jIWIfOfD/X7WerUm5JuaNLxYT8nNZl051MZLc4jd
   48xlHbhJvkJ6mIMbJpCRQrSZxbLXl8NhnWuzWB1PHJwsRwxjK4RRVFTfq
   TqLkifmRScCsFGi1gmkt35zvJbaetGHsqDXXLpw6MgONCaS9gr/pV9wIW
   qt2ipRHILozmJUoocHG36vTLSDHtRzp3zmkt8/kO+h7PXQpcIgwn9HUXW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="333216205"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="333216205"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 04:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692378356"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="692378356"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 04:39:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id B4CB11223FC;
        Fri, 14 Apr 2023 14:39:13 +0300 (EEST)
Date:   Fri, 14 Apr 2023 14:39:13 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 06/18] media: v4l: async: Only pass match information for
 async subdev validation
Message-ID: <ZDk7YWW9uwpsRF5W@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-7-sakari.ailus@linux.intel.com>
 <647w6asful7m4wkjbetw33pxig7rkql66vghecafo34eggx7b2@o4ewbzx7xh3z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <647w6asful7m4wkjbetw33pxig7rkql66vghecafo34eggx7b2@o4ewbzx7xh3z>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Apr 14, 2023 at 09:15:23AM +0200, Jacopo Mondi wrote:
> >  static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
> > -				   struct v4l2_async_subdev *asd,
> > +				   struct v4l2_async_match *match,
> 
> I would have kept the asd here, but I presume having match here makes
> things easier in the next patches

The other fields won't be needed there, that's why I'd pass just the match
information.

> 
> 
> >  				   bool skip_self)
> >  {
> >  	struct device *dev =
> >  		notifier->v4l2_dev ? notifier->v4l2_dev->dev : NULL;
> >
> > -	if (!asd)
> > +	if (!match)
> >  		return -EINVAL;
> 
> Match cannot be null, as it's a member of struct v4l2_async_subdev

Indeed. I'll add another patch to drop the check, it doesn't seem to be
needed to begin with.

-- 
Kind regards,

Sakari Ailus
