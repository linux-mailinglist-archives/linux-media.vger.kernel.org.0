Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFEB56E22B0
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjDNLyM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjDNLyL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:54:11 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE4430FA
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681473251; x=1713009251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D+SDV6iDDmcEh5jJJG+REtSMXEZMp7Wns5wbmCv7uAM=;
  b=h/u+o8+w9hGpF9eSceC8NMXut+UkqoMf62X0q0Mn+WPi4USB908TgQnK
   nWUhSO1CrOvYLoTEoIlK6Ev4dw57Vba8ODXFgrR+AukihINSL4qYy8CYI
   qKoUSmMtwrjuszMZUPhm+s4oN2UnBADhbHTFGmHWP45ovKQ4tVp5/hlVY
   jAEeIVOLorYoyrPiNXWgsuAnllSSFmS3Q6BTm+aAApYQrfOHDhnKxn8+p
   2E76Ownej6CM2Q+M1Qcqduk+ZvTnIjLAZMqBJNR0Cwie1beFbMy4a1Gso
   5SmrdghnzfT6JWB6Hrt+tn0ifZR7dM4kz6Swvjxq0pqWjIpQsGkp9Mcpm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="324797183"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="324797183"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 04:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="833530068"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="833530068"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 04:54:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 6FACE1223FC;
        Fri, 14 Apr 2023 14:54:05 +0300 (EEST)
Date:   Fri, 14 Apr 2023 14:54:05 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 07/18] media: v4l: async: Clean up list heads and entries
Message-ID: <ZDk+3aKiZrjDXDNU@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-8-sakari.ailus@linux.intel.com>
 <muutiamv7h32mwd2yq3mlkegrohlm2qj4yq2566nx4rsnhxvai@jubl5vdbbpuh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <muutiamv7h32mwd2yq3mlkegrohlm2qj4yq2566nx4rsnhxvai@jubl5vdbbpuh>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Apr 14, 2023 at 09:26:21AM +0200, Jacopo Mondi wrote:
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index 0c4cffd081c9..425280b4d387 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -68,7 +68,7 @@ struct v4l2_async_match {
> >   * @match:	struct of match type and per-bus type matching data sets
> >   * @asd_list:	used to add struct v4l2_async_subdev objects to the
> >   *		master notifier @asd_list
> > - * @list:	used to link struct v4l2_async_subdev objects, waiting to be
> > + * @waiting_list: used to link struct v4l2_async_subdev objects, waiting to be
> >   *		probed, to a notifier->waiting list
> 
> notifier->waiting_head

Thanks, I'll fix these for v2.

-- 
Sakari Ailus
