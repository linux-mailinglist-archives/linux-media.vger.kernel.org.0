Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFB76B24D3
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 14:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbjCINCM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 08:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbjCINBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 08:01:46 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086E4F221B
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 05:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678366844; x=1709902844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2B8zTqrcbGjqD/OpJHKc8hUpK7D3pRoIueaeFUzffZo=;
  b=hWGt6t0DtIbthzoR0B+9/CHMii8Ddc+QtrGZ1uTeRCk3wmIY34YsCXT/
   IaTJ2gg5XY/S2JUfmH/T2buVbPaIITX6LifLqdQR0mcxUERi5IQrvcczy
   BioXO9dJrg1DzVLtp8sJYOXtchsQsd0olurqT0ZV2yzLMoYiKKrc5zC1j
   rUEGPEFxbf3PtdIumscmxt28WlJyK+SYMg8G4kr54l/ZKtEK5OH57qf3W
   7LJM4z9Y1uGpe9uLJQhu2Ja286jgAw4zxrFj881Y34gAu/VjLgJB4UBaR
   8Zwu1yOz0PV5Vn9HqiKzUFwxHcreIaEmyU048CU3ZdQsI52V/FVY+m2Gy
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320266453"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="320266453"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 05:00:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="654738972"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="654738972"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 05:00:22 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 91987120C21;
        Thu,  9 Mar 2023 15:00:19 +0200 (EET)
Date:   Thu, 9 Mar 2023 15:00:19 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Message-ID: <ZAnYY32TyVKyaKhb@kekkonen.localdomain>
References: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
 <89823804-7d23-334a-91b2-ea3c819232fd@redhat.com>
 <ZAnXe9H3xg3g/f55@kekkonen.localdomain>
 <c1c67b80-1c7b-18c1-0d42-66978910db5b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1c67b80-1c7b-18c1-0d42-66978910db5b@ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 09, 2023 at 02:57:52PM +0200, Tomi Valkeinen wrote:
> On 09/03/2023 14:56, Sakari Ailus wrote:
> > On Thu, Mar 09, 2023 at 01:43:50PM +0100, Hans de Goede wrote:
> > > Hi Sakari,
> > > 
> > > On 3/9/23 13:27, Sakari Ailus wrote:
> > > > Link validation currently accesses invalid pointers if the link passed to it
> > > > is not between two sub-devices. This is of course a driver bug.
> > > > 
> > > > Ignore the error but print a debug message, as this is how it used to work
> > > > previously.
> > > > 
> > > > Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> > > > Reported-by: Hans de Goede <hdegoede@redhat.com>
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>
> > > 
> > > FWIW you have my Reported-by in there twice now ...
> > 
> > Ah, thanks. I'll drop the first tag.
> 
> $ git grep Reported-and-tested-by Documentation/
> Documentation/process/maintainer-tip.rst:Please do not use combined tags, e.g. ``Reported-and-tested-by``, as

Uh-oh. Well, I'll just split that. Thanks.

-- 
Sakari Ailus
