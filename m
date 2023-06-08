Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED55F727B42
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 11:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbjFHJ2M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 05:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235852AbjFHJ2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 05:28:09 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB0C2737
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 02:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686216480; x=1717752480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j4kteuDSSYwoa1Ggyg0JK0uMW653Ebm1pHzv7LwlyAs=;
  b=Z9vEVd0zyJj6G7F84IfihUADLIRrGzo2w5Cvb72TbRXJeVQxaQLfuiQT
   zvJGomzQZxY0eV6MIEy1uO78ex8X8A6rM5He5UfyJqWrp9ytbq61jSzla
   ggsoyqxsEHNRiP4ZEW1f7afXqPzbo2JHqUpADQigsx4Hm30hCLRPsYhFm
   LhReX6lhk1hROt0NMxHAucDRK/L3Q5KxWJ1IBIqGRXzNP0ZqitDLhhCXQ
   zx3LNSccrLRMuKfEK5uFbiu9p+YyjdjfqE9hij5vVdyt33EPvGNAPBnud
   PfiC8A2vxfJ7icxIkrfKjGTwBOnzkN0WiBDQ9zvCIqAt0G2lKz5EHC+6B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="356115045"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="356115045"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 02:27:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="713048606"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="713048606"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 02:27:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id D32E7120BE1;
        Thu,  8 Jun 2023 12:27:54 +0300 (EEST)
Date:   Thu, 8 Jun 2023 09:27:54 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com
Subject: Re: [PATCH v3 1/1] media: pci: ipu3-cio2: Obtain remote pad from
 endpoint
Message-ID: <ZIGfGjniYLSxqWoR@kekkonen.localdomain>
References: <20230515122127.590733-1-sakari.ailus@linux.intel.com>
 <20230602091212.GB23701@pendragon.ideasonboard.com>
 <ZHn5MH3o1l0lBhqS@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHn5MH3o1l0lBhqS@kekkonen.localdomain>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 02, 2023 at 02:14:08PM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Fri, Jun 02, 2023 at 12:12:12PM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Mon, May 15, 2023 at 03:21:27PM +0300, Sakari Ailus wrote:
> > > Use the endpoint fwnode to find out the remote pad, instead of using the
> > > first source pad found. Also improve error messages.
> > 
> > The commit message should explain *why*. Once I know why, I'll review
> > the patch :-)
> 
> I thought it'd be trivial. :-)
> 
> Using framework functions instead of open coding this in drivers, and using
> the pad related to the endpoint fwnode instead of just the first pad found.
> 
> I'll add this to the commit message.

Actually this is already in the media tree, let's see what we end up doing
with it.

-- 
Sakari Ailus
