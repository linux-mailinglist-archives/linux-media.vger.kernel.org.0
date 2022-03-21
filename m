Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1890C4E24C6
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 11:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346552AbiCULAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 07:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346527AbiCUK75 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 06:59:57 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70F61AD8E
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 03:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647860311; x=1679396311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bUTlemMrZm7di9yiGA17KZhtknSx+hJy8zy2NBmU6/0=;
  b=PszLZxDr/R9o235xMSxCCcviTTHLAzVR1gW6XJDDRaNee5pCVcG4krOH
   XGn52yaixnMbPdW2hc41TUeUPi73oMc0AsKMoldznP3awgAPNLpm0aXA/
   dZJgoWJ/RTIVRv36wLujoduVLsTCcl+/D35hwfR/8XqOKZ+df9UF3Nuly
   8cmb+evDHl+ov6zOs272IzrLOq4aCZwzO2nUE7G7bMkkIMB1bo907ifOA
   enD/gz3Sli5kRRxO08mFicjMAu72AmtB6kmbqow6XqgCD0O1Z0DsWJ3/j
   CxSfEuHtKNB8pX1vFxpZWI4MdK3j2CZXgRt31diDmV1mRXM3/7LqyZMO0
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="244996226"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; 
   d="scan'208";a="244996226"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 03:58:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; 
   d="scan'208";a="514898083"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 03:58:27 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id B06282012F;
        Mon, 21 Mar 2022 12:58:25 +0200 (EET)
Date:   Mon, 21 Mar 2022 12:58:25 +0200
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
        Jacopo Mondi <jmondi@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: ov5640: Use runtime PM
Message-ID: <YjhaUbx1tskOwWZd@paasikivi.fi.intel.com>
References: <20220311111259.3220718-1-paul.elder@ideasonboard.com>
 <YjUHhp0lYqQG5rgs@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjUHhp0lYqQG5rgs@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Mar 19, 2022 at 12:28:22AM +0200, Laurent Pinchart wrote:
> > @@ -3288,6 +3256,9 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> >  
> >  	/* v4l2_ctrl_lock() locks our own mutex */
> >  
> > +	if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
> > +		return 0;
> 
> I'm afraid this won't work as intended :-S This function is called by
> v4l2_ctrl_handler_setup(), itself called from ov5640_sensor_resume(). At
> that point, runtime PM isn't flagged as in use yet, we're still in the
> process of resuming.
> 
> There are a few ways around this. The simplest one may be to move the
> v4l2_ctrl_handler_setup() call from ov5640_sensor_resume() to
> ov5640_s_stream(). Sakari, any opinion ?

That's one way to do it, yes.

The problem is that when the s_ctrl callback is run, there's no information
on whether it's being called from the runtime PM resume handler (which
powers on the device) or via another path.

Changing that would require changing the callback arguments, or adding a
new callback with that information included.

-- 
Kind regards,

Sakari Ailus
