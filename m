Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 460825F3886
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 00:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiJCWCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 18:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiJCWCB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 18:02:01 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFB131DC6
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664834521; x=1696370521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rDkd5y4stzSKUTv6NyzilIRAU9N4qor8SP9sNSJ97F8=;
  b=PgN6dEssGHUKK5zQsLP8WDpWbuFY/8kkTTtiIXfZuFO5SW1u7+0f7U+P
   52y5BZGGbAiPwoWM1N0ltbqCXSwf98UOulpSue4pEFnZ4ecU6Sky1V517
   mnr92Ze/BPy7OQPOlkCmVOQUGytFolwjcQsYyGp5g5Gr6l6vDcoYNjGpC
   1h/dIsriB7Lc90knoJa3yme/B28/2Hf7NDPiPEQ9BYtNKCekD3S3YSv9L
   Yl9O7pya5OBvAdAulC48q/fuqeP32vFWqjF+3T94v3csLUoMAZC24+QbR
   R771nHmSQZWbKaaJwlPYukcYlYvbVQbLMg21nwRluahRdGCxVoYBJwozx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="282481473"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="282481473"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 15:02:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="686309436"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="686309436"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 15:01:58 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E841E20316;
        Tue,  4 Oct 2022 01:01:55 +0300 (EEST)
Date:   Mon, 3 Oct 2022 22:01:55 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v15 05/19] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <Yztb06LVmPBKf8J2@paasikivi.fi.intel.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-6-tomi.valkeinen@ideasonboard.com>
 <7b56d565-5358-67be-84b8-101a97f97f2b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b56d565-5358-67be-84b8-101a97f97f2b@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Oct 03, 2022 at 04:26:32PM +0200, Hans Verkuil wrote:
> > +#define V4L2_SUBDEV_ROUTE_FL_SOURCE		(1U << 1)
> 
> Can we rename this to _FL_INTERNAL_SOURCE? Just 'SOURCE' is very confusing
> IMHO. The name 'INTERNAL_SOURCE' makes it clear that it is generated internally,
> and so does not come from an external sink-side endpoint.
> 
> I also think that the documentation for this flag in patch 04/19 is very vague,
> I'll comment on that patch as well.

Having descriptive names is important but I think "SOURCE" as such is fine
for the purpose. Adding "INTERNAL_" adds 9 characters to what is already a
very long name, making the flag very clumsy to use in code. That's why I
would prefer to keep it as-is.

-- 
Kind regards,

Sakari Ailus
