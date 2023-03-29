Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033D06CF159
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 19:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjC2Rq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 13:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjC2Rqz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 13:46:55 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3E55B96
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 10:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680112013; x=1711648013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=olMmfaYG76WJaUSjtUKbOoTEBkHfPzBHtu+/8m2+LtU=;
  b=S6R5EvDJam582pNOO+XbZsA0Su6gwm7oyD3J/d7+9qBpPpkxMcm3W+Dk
   rzE7HmiGAdL8kXMZBn89JiuLISfJsiW8J2p5ag8GM1Ko5eRnQHqCec/XK
   UkrUx8GdyMc0WwFdFL8orr7M1GtlVQ+oeqguNvFh9N9CEY7J8yVECGi5q
   083yw4L7u6d0OdmNRSDT9khoBfbFJBXWpbDtfKfWiSoNjimfjNTzGsuep
   JGXTuoedCgwPK+0Ltz7sqccaSaCrwblc++UGj2XkpDdiPQPmUB6vj0FYb
   eixScl+MaXgoFqoYcBQfxc+FItd+XAWFO4Q1XpR9+l3CYJFLkThpGFHUf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427227391"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="427227391"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 10:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="773665575"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="773665575"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 10:46:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 46E8D1224D2;
        Wed, 29 Mar 2023 20:46:50 +0300 (EEST)
Date:   Wed, 29 Mar 2023 20:46:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ccs: Add V4L2 controls from properties
Message-ID: <ZCR5iuHo0Sl1qB7a@kekkonen.localdomain>
References: <20230328121625.1472037-1-sakari.ailus@linux.intel.com>
 <20230328121625.1472037-3-sakari.ailus@linux.intel.com>
 <20230329163113.uz7bcsmnhkerjtiv@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329163113.uz7bcsmnhkerjtiv@uno.localdomain>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 29, 2023 at 06:31:13PM +0200, Jacopo Mondi wrote:
> > @@ -946,10 +954,10 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
> >
> >  	sensor->hflip = v4l2_ctrl_new_std(
> >  		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
> > -		V4L2_CID_HFLIP, 0, 1, 1, default_flip);
> > +		V4L2_CID_HFLIP, 0, 1, 1, props.rotation == 180);
> 
> Ah! ignore my comments on 1/2 :)
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks, Jacopo!

Could you also check the documentation patch?

I suppose we'll be good after this one? Or are there still drivers that
have differing behaviour?

-- 
Sakari Ailus
