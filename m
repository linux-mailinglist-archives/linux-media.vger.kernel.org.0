Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD8D7D42C1
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 00:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjJWWlN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 18:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjJWWlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 18:41:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87ED10C
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 15:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698100869; x=1729636869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+V2Yi/NlNzptBYIR4mTzCdDA3vIRpC0IN+pnId1b6UI=;
  b=dMWsDHxtuhwKfLNrfL2RJQRC15jFfU5igzq6czTrF44CByI9dy30P9Pz
   FrpLZaKSGrvsxsC8lqSx5ccGqmZomwa4gsFF0LWUcYisCnx2WL3a3NmGy
   4dGzcl9sGwESqdWzYXcamGrrq1CsCH9KURSU1lPTDpBErOAQqxlY+tyz6
   gyXrTA814I4NVZSZNrv4mK3Z0AVauGdT2OXYW6SptAj0HOnbYpM3ZAHcm
   keO1YS5sN2dgTOMo5EhrRRvs7G/IrFIuQJiGMn0ieupF6wYA9pNoYNZVh
   fXKOXkWV5vZw74ioh7w6dyTjoAXZ5T1AYxcI2jHtVXNl7EjFW/SZ5tRsf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377319139"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="377319139"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 15:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="848918931"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="848918931"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 15:41:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 3100111F830;
        Tue, 24 Oct 2023 01:33:11 +0300 (EEST)
Date:   Mon, 23 Oct 2023 22:33:11 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 8/8] media: v4l: subdev: Also assert acquired mutex
 for non-stream drivers
Message-ID: <ZTb0p4CH2eEO5Lqu@kekkonen.localdomain>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-9-sakari.ailus@linux.intel.com>
 <20231023221453.GG18687@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023221453.GG18687@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Oct 24, 2023 at 01:14:53AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Oct 23, 2023 at 08:44:08PM +0300, Sakari Ailus wrote:
> > Assert mutex is taken by drivers that are not stream-aware.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Do you expect the assertions to trigger ?

Good question.

We should actually probably postpone this patch for now and test more
before merging. Drivers that have not been converted to sub-device state
also use these functions on subdev ops where the framework doesn't take the
state lock such as s_stream. The drivers use their own locks to serialise
access to the data but because the state lock hasn't been acquired, there's
going to be a warning.

The best option would probably be to also acquire the lock for s_stream but
that's not a trivial change as multiple sub-devices may use the same lock
so special handling will be required.

-- 
Regards,

Sakari Ailus
