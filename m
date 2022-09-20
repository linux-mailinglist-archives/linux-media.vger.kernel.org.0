Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1691F5BDFFC
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 10:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbiITI2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 04:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbiITI1X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 04:27:23 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE903DBED
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663662318; x=1695198318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bwYoaZTMc146QZFadQ8mWnW8YpOE05mc8jCzjoS3+vU=;
  b=DrY6p243sF9LSMPUwD82U86XZ/TH6/MM9SEHy3WZNApKyHT5O7rtz/36
   z5METv2YKDOEJnc67EydLmt/BAvxoR7aq44sPU4bUj9LvJxSM/xGsHlUK
   jzpsBwWEItSSeODR1TOFX9zcG13s9xVd3hm2PU0UrEulBRhbm2/8e++Xb
   YqshkxsYirlIVOekeeQbjc/6wlf30vJ78tjVAFnlPMysf+aw8BOWoE8i3
   u6HSA3WExKlqC3QVy9tcKMqfZ3Sfg0XnEnrDHhbuv25TyZI1OZRcAKlrS
   YvA6LTxCiQtdAh0AYOFsdWRZ9pTqY8Ko3E4tQVUgJhRxkVn2/ZnlmwMGc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="298359001"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="298359001"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 01:25:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="649493079"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 01:25:15 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 58144200F1;
        Tue, 20 Sep 2022 11:25:13 +0300 (EEST)
Date:   Tue, 20 Sep 2022 08:25:13 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] media: v4l: subdev: Document s_power() callback
 is deprecated
Message-ID: <Yyl46Sgi/CIXRP3b@paasikivi.fi.intel.com>
References: <20220919221641.3801108-1-sakari.ailus@linux.intel.com>
 <YyjqvC4KVWMCxHvg@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyjqvC4KVWMCxHvg@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Sep 20, 2022 at 01:18:36AM +0300, Laurent Pinchart wrote:
> On Tue, Sep 20, 2022 at 01:16:41AM +0300, Sakari Ailus wrote:
> > Runtime PM has been around for a decade or more, there's hardly a need to
> > use the V4L2 specific s_power() callback in drivers anymore. Document this
> > in s_power() callback documentation as well.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  include/media/v4l2-subdev.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 2f80c9c818ed0..54566d139da79 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -176,7 +176,10 @@ struct v4l2_subdev_io_pin_config {
> >   * @s_register: callback for VIDIOC_DBG_S_REGISTER() ioctl handler code.
> >   *
> >   * @s_power: puts subdevice in power saving mode (on == 0) or normal operation
> > - *	mode (on == 1).
> > + *	mode (on == 1). DEPRECATED. See
> > + *	Documentation/driver-api/media/camera-sensor.rst . pre_streamon and
> 
> Extra space before '.'

That's intended. It's easier to select that way.

> 
> > + *	post_streamoff callbacks can be used for e.g. setting the bus to LP-11
> > + *	mode before s_stream is called.
> 
> Technically post_streamoff doesn't really match that description, but
> that's OK.

Hopefully we can remove this soon... there seem to be 26 users left under
drivers/media and most of them are camera sensor drivers.

> 
> >   *
> >   * @interrupt_service_routine: Called by the bridge chip's interrupt service
> >   *	handler, when an interrupt status has be raised due to this subdev,
> 

-- 
Regards,

Sakari Ailus
