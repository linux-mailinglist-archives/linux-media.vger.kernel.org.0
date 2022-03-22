Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616FA4E3E0E
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 13:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbiCVMGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 08:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbiCVMGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 08:06:41 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844BB3DDD5
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647950713; x=1679486713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F9wSfGaKkVZZ97xugnEJARloewtYfgjIIAaa9BeBYM4=;
  b=TxekyYhiPjmoXZauV4Xw1b3lEdbcerltGtsq8u4y9LLsvZeXeUvaJsb+
   hAWtZZbElRsNt3Bmzh3REZbIEFNOgW61U+NCEPE2AODls2z6cEdo+yegZ
   nI1bnGn5Z1oiG7ZksK6wT1fiyitloU4zV7c6rsiMqnpofubTJqplNAsIj
   oWkDLutOpnb1kjH9/xG+5+/esragQ57a2k1PpgVs/dXzQgme+Su22liQJ
   DhyQ31/TDd/6dSuvrIUYeq72Lg7L2RRpbWxj3Kz/e0I08MrK1K7jgMbZ1
   tafiL8oi5i7KB44tCE3d3m/8f1xZFPamZ6S2ACM0bPpP8qkNb7e71RiLM
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="237741473"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="237741473"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 05:05:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="600855884"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 05:05:09 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id AB01F2012F;
        Tue, 22 Mar 2022 14:05:07 +0200 (EET)
Date:   Tue, 22 Mar 2022 14:05:07 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: ov5640: Use runtime PM
Message-ID: <Yjm7c/7WxwAH0GAd@paasikivi.fi.intel.com>
References: <20220311111259.3220718-1-paul.elder@ideasonboard.com>
 <YjUHhp0lYqQG5rgs@pendragon.ideasonboard.com>
 <YjhaUbx1tskOwWZd@paasikivi.fi.intel.com>
 <YjhgY0wFp6kcS+z/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjhgY0wFp6kcS+z/@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 21, 2022 at 01:24:19PM +0200, Laurent Pinchart wrote:
> On Mon, Mar 21, 2022 at 12:58:25PM +0200, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Sat, Mar 19, 2022 at 12:28:22AM +0200, Laurent Pinchart wrote:
> > > > @@ -3288,6 +3256,9 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> > > >  
> > > >  	/* v4l2_ctrl_lock() locks our own mutex */
> > > >  
> > > > +	if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
> > > > +		return 0;
> > > 
> > > I'm afraid this won't work as intended :-S This function is called by
> > > v4l2_ctrl_handler_setup(), itself called from ov5640_sensor_resume(). At
> > > that point, runtime PM isn't flagged as in use yet, we're still in the
> > > process of resuming.
> > > 
> > > There are a few ways around this. The simplest one may be to move the
> > > v4l2_ctrl_handler_setup() call from ov5640_sensor_resume() to
> > > ov5640_s_stream(). Sakari, any opinion ?
> > 
> > That's one way to do it, yes.
> > 
> > The problem is that when the s_ctrl callback is run, there's no information
> > on whether it's being called from the runtime PM resume handler (which
> > powers on the device) or via another path.
> > 
> > Changing that would require changing the callback arguments, or adding a
> > new callback with that information included.
> 
> We can also add a flag in the driver-specific structure to tell if the
> device is powered or not. Delaying v4l2_ctrl_handler_setup() until
> .s_stream() seems easier though, but then maybe we should return early
> from .s_ctrl() until streaming is started, even if the device is powered
> on ?

(Finally fixed Jacopo's e-mail.)

The device is likely powered off if streaming is disabled. But it might not
be if the controls are being accessed right after stopping streaming.

You could use a driver-local information to keep the knowledge of this, but
it'd be better if drivers wouldn't have to manage such information.

-- 
Sakari Ailus
