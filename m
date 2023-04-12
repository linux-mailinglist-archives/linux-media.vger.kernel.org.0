Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A486DF4E2
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 14:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjDLMTf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 08:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjDLMTe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 08:19:34 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217D149FD
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 05:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681301967; x=1712837967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iZOEWO6kSCKO8plx7jSTmwIasENLFkDgsD740wiX5Tk=;
  b=ZCnpq8REhRsliIZasa6zbDEI0GP+Q4MRWcScNbwMov2bS9d3iTK7s/yN
   ILzm2BTINg5id/xJIDaf6vBwmckT64Hlg9FLMEby20DcPrctme1snzzdg
   kKhm6H+q8HbJP2eXnQ0kERjt1zuTnDYnqb75OtyQkv14EH6e871/9TOKu
   dux8hF9xe4H0xAHLWkh1kDcdwH7BOjMvki3jiZenT3Aw15/jL1RtLsdUx
   pGTwqNPJkVbkeE4Z0PRHVEvzkiXn9a9dTs0B1DEzNtRnG00GOFDFG7m/I
   xxXr45VhVengLvNVNYgjadj2AZIEgBBNwym3UD51/vtnumzwMQUkCeZ5c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="332571785"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="332571785"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 05:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="639195986"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="639195986"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 05:19:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 550ED120D2E;
        Wed, 12 Apr 2023 15:19:22 +0300 (EEST)
Date:   Wed, 12 Apr 2023 15:19:22 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: add ov01a10 image sensor driver
Message-ID: <ZDahyjzMD/LvOjlG@kekkonen.localdomain>
References: <1675941758-21433-1-git-send-email-bingbu.cao@intel.com>
 <Y+TvvbfRSGUNKBCf@kekkonen.localdomain>
 <793aa7a4-0b8b-dc55-2d91-9aa58e6735fd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <793aa7a4-0b8b-dc55-2d91-9aa58e6735fd@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Wed, Apr 12, 2023 at 07:40:19PM +0800, Bingbu Cao wrote:
> >> +static int ov01a10_set_format(struct v4l2_subdev *sd,
> >> +			      struct v4l2_subdev_state *sd_state,
> >> +			      struct v4l2_subdev_format *fmt)
> >> +{
> >> +	struct ov01a10 *ov01a10 = to_ov01a10(sd);
> >> +	const struct ov01a10_mode *mode;
> >> +	s32 vblank_def, h_blank;
> >> +
> >> +	mode = v4l2_find_nearest_size(supported_modes,
> >> +				      ARRAY_SIZE(supported_modes), width,
> >> +				      height, fmt->format.width,
> >> +				      fmt->format.height);
> >> +
> >> +	mutex_lock(&ov01a10->mutex);
> >> +	ov01a10_update_pad_format(mode, &fmt->format);
> > 
> > Could you switch to the sub-device state? That is now the preferred way to
> > serialise access to e.g. the format.
> > 
> > See e.g.
> > <URL:https://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git/tree/drivers/media/i2c/ov1063x.c?h=streams/work-v16>.
> > 
> > The control handler's mutex doubles as a sub-device state mutex.
> 
> Is it fine to use v4l2_subdev_get_fmt()? Or will it be deprecated soon?

Sure, it's fine to use it.

-- 
Sakari Ailus
