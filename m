Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9B85B0DA7
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 22:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiIGUBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 16:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiIGUBX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 16:01:23 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F028B9A2
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 13:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662580883; x=1694116883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eXyOgHwc2KXCxHe0mPDRdaZJVaX9FgFFJLZdpPtP+dk=;
  b=nU3+NWnVaV1qlpDkfAe2tiYdjih06V+Oi4LaNW6HcvUTFW1Wq14kibO2
   aqCR3emAXvKDkl+ugwQWnRTzejALHgBnR8fEwgdbGUumheYl8FAbj1E9c
   841z7vTfZ+IABvS8GOv48IFeY+BG5MyhW7cJkNTGHpnIRKsWWe8IgdyYM
   dPg2+OTJhbk0WL/TKm1FVNTG+IWRRIgLAf9uq300HJeRck1DlVBSU8a2D
   fSjz+bwCgIsHKZ4DlzDKfrhzrDb6KcoDhisuxF56gWZXtLmyCJAtzQR4X
   rPxdTIOC48xkl/iPz8pi23QK2FNUNlxYmGLrRi7Yf0jmK8iO1xdaNdKtY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="360947223"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="360947223"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 13:01:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="644767225"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 13:01:20 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id C4FFE20127;
        Wed,  7 Sep 2022 23:01:18 +0300 (EEST)
Date:   Wed, 7 Sep 2022 20:01:18 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        tian.shu.qiu@intel.com, tomi.valkeinen@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/1] ipu3-imgu: Fix NULL pointer dereference in active
 selection access
Message-ID: <Yxj4jmCQ4zvKN3sp@paasikivi.fi.intel.com>
References: <20220825190351.3241444-1-sakari.ailus@linux.intel.com>
 <db44a24b-2a9a-6682-4825-eedc4ecb1340@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db44a24b-2a9a-6682-4825-eedc4ecb1340@gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maximilian,

On Wed, Sep 07, 2022 at 03:44:44PM +0200, Maximilian Luz wrote:
> Hi,
> 
> On Thu, 25 Aug 2022 22:03:51 +0300, Sakari Ailus  wrote:
> > What the IMGU driver did was that it first acquired the pointers to active
> > and try V4L2 subdev state, and only then figured out which one to use.
> > 
> > The problem with that approach and a later patch (see Fixes: tag) is that
> > as sd_state argument to v4l2_subdev_get_try_crop() et al is NULL, there is
> > now an attempt to dereference that.
> > 
> > Fix this.
> 
> Thank you for this fix, this however only addresses
> imgu_subdev_get_selection(), but the issue is also present in
> imgu_subdev_set_selection(). I assume that a similar fix is needed for that.
> I've added a diff for that below. Feel free to squash that into your patch or
> let me know if I should submit this separately.

I've already sent a PR that includes it. Could you send this one as a
patch, please?

-- 
Sakari Ailus
