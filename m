Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A668A71955F
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 10:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbjFAIV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 04:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbjFAIV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 04:21:56 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0193FAA
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 01:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685607715; x=1717143715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+4mmak/DTNTb7ZGE3JUtSREY7WWe/Fw4Sf5YNYVj8hI=;
  b=f31WOlFpHMOJhswNSM4zWItYi3Lnwkn40Bti4AlPY/4q/cI0p6WFf4pe
   EBxl8F5dFZW/Qf+5Ixt7f3rg3PtNYEQN6n0/N58c205KKkNBu8f6Tnsua
   UnSWq0dozaixFGsC9TaN2/pmNy74cE//siwzgEzJKLm+KjhVZ3cQDIC9G
   U9E/frnvQCsmgxE0Gl5+C1AEJxiWXXhLITN6nIq1W5HX9uwtnbaLE63NO
   xCJqgzdEWW/67IVgY/lTRZoGOSrgPg6F3b9RxpUdc+3NoqyMU2TsM7uBy
   IxtKLT7/SI8wYmud0BHdrGvKIWeFpeUxfBdG7+tJvOorjHE4Urtudjgnx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="441851031"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="441851031"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 01:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="710391218"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="710391218"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 01:21:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 5B6A511F9D2;
        Thu,  1 Jun 2023 11:21:52 +0300 (EEST)
Date:   Thu, 1 Jun 2023 08:21:52 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] media: tc358746: Address compiler warnings
Message-ID: <ZHhVIFYZpLq0Ju44@kekkonen.localdomain>
References: <20230530102126.2886766-1-sakari.ailus@linux.intel.com>
 <20230531081810.pprennf7riycnvsm@pengutronix.de>
 <ZHhUtV1Vt/uqynYk@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHhUtV1Vt/uqynYk@kekkonen.localdomain>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 01, 2023 at 08:20:06AM +0000, Sakari Ailus wrote:
> Hi Marco,
> 
> On Wed, May 31, 2023 at 10:18:10AM +0200, Marco Felsch wrote:
> > Hi Sakari,
> > 
> > Hans already sent a patch a few months ago:
> >  - https://lore.kernel.org/linux-media/15030a07-3615-fca0-1891-a234dc054b00@xs4all.nl/
> > 
> > It turned out that the compiler had a bug albeit the compiler listed in
> > 'Closes:' is already a gcc-12 and now the warning used is slightly
> > different.
> > 
> > I'm not again the patch but we should point out that this patch is only
> > required to make the compiler happy.
> 
> Ack, thanks. I'll drop this then. The condition isn't trivial for a
> compiler to figure out though, even I'm not quite sure this is the case for
> all parameter values.

Hans's patch actually assigns p_best to 0 which isn't a best default value
for a divisor.

-- 
Sakari Ailus
