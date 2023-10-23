Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B0A7D3D0F
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 19:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbjJWRH4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 13:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjJWRH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 13:07:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B253494
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698080874; x=1729616874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zxvM+rmhkTYcjU5IFIWKIgsyUEluKNQA6BScCsulWIY=;
  b=DIvXTJykS+vKH1c0zoYhk7LOsh1Vh7MwgA+k4HDrbYsuXJCNuqWySDqk
   Zis4V9hihRC/cHKgPUGVXxPJQKjgelQiT9EhWOgfDAOSTfoDbajJG3BaV
   tbn6THCvHaiGln2DvFsU/QdKSTJBWj20ZAtz3hyv0BN8EGSY6dF6+m3Ma
   eJ5eL2zCTBmxumBSlQO+sf6dRsQ2w0FO8U8CrSvH2HyRzvf4i8TNF+Rzg
   AOkfAM+ILgxmQUWytfcXL7kIFHOH9PCVX67gjFg+DOojOqEFEcjpKwlTu
   tqK11F55IrFYhvk/Ae7rjigy+sKsamxor4ExPVtisnGN0h9vywqXYU9c1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="386696731"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="386696731"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="708005828"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="708005828"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:07:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E579611F82E;
        Mon, 23 Oct 2023 20:07:48 +0300 (EEST)
Date:   Mon, 23 Oct 2023 17:07:48 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 1/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <ZTaoZIG6-eWIjiYZ@kekkonen.localdomain>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
 <20231023123308.782592-2-sakari.ailus@linux.intel.com>
 <20231023132902.GQ3336@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023132902.GQ3336@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Oct 23, 2023 at 04:29:02PM +0300, Laurent Pinchart wrote:
> > +		return NULL;
> > +
> > +	if (state->pads) {
> > +		if (stream)
> > +			return NULL;
> > +
> > +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> > +			pad = 0;
> > +
> > +		return &state->pads[pad].try_fmt;
> > +	}
> > +
> >  	lockdep_assert_held(state->lock);
> 
> Can we move towards proper locking for all callers ?

This was never done in the existing pad ops. That's certainly a good idea,
but it belongs to a new patch. I'll add one.

-- 
Regards,

Sakari Ailus
