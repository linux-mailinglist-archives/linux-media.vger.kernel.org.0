Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE880748684
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 16:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232501AbjGEOj3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 10:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbjGEOj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 10:39:28 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAA7CE
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688567967; x=1720103967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=puzxG+scQ9KoeesPT7DEtN/dbfcXj949wgE4RDbZ8Qc=;
  b=MguFKGl5AVhb1X6Okau3n0XtVXynIjR/rGU+1OVBwjnNvTQ7RapJlOo8
   RRnDgLdnWG3TN9rjiWENf1FC2Wa6f6tcd+pDX6KrvY+of0V2G8SIEU9sR
   r2bdU7G5uyXn6a1VUuMF3ZeABvEuH0iM3d9eVruX1besEJvzOZ0hQneE9
   cKMZiB6yGhjP5+nlQqqGdw5EvJNIRGcq7orzj/1CKR+sE5KR2vivjjxAw
   rXY3m/+/xUAx5TqskjGwoG7V/qJB2/t1lFe65cDZnInxPvwi9XNJq2g4p
   axdGjTFGdl/KIAnErI8PPT1JTTGhKvs4DhC52HLXIsFCQ4t1hYNraeOAo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="343686631"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="343686631"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 07:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="809279200"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="809279200"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 07:39:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 9CC8112023C;
        Wed,  5 Jul 2023 17:39:22 +0300 (EEST)
Date:   Wed, 5 Jul 2023 14:39:22 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 3/7] media: v4l: subdev: Support INTERNAL pads in routing
 IOCTLs
Message-ID: <ZKWAmhYnrbilaI84@kekkonen.localdomain>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
 <20230630204338.126583-4-sakari.ailus@linux.intel.com>
 <79496d4a-74c9-76c5-b7e8-c9c0db3a5e9e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79496d4a-74c9-76c5-b7e8-c9c0db3a5e9e@linaro.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

On Sun, Jul 02, 2023 at 02:57:44PM +0300, Andrey Konovalov wrote:
> Hi Sakari,
> 
> On 30.06.2023 23:43, Sakari Ailus wrote:
> > Take the new INTERNAL pad flag into account in validating routing IOCTL
> > argument. Effectively this is a SINK pad in this respect. Due to the union
> > there's no need to check for the particular name.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/v4l2-core/v4l2-subdev.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 2ec179cd1264..36886a9047c4 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1787,7 +1787,8 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
> >   		/* Validate the sink and source pad numbers. */
> >   		if (route->sink_pad >= sd->entity.num_pads ||
> > -		    !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
> > +		    !(sd->entity.pads[route->sink_pad].flags &
> > +		      MEDIA_PAD_FL_SINK)) {
> 
> This is a white space only change now, so maybe this patch could be just
> dropped?

Oops. Well, I can still do the line wrap, but the commit message needs to
change. It's no longer related to internal pads.

-- 
Regards,

Sakari Ailus
