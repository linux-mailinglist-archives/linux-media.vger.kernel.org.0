Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1BE7CDA28
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 13:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjJRLUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 07:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjJRLUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 07:20:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E31FE
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697628007; x=1729164007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PFE0anEVRuZXgAZuV2PcRVQ7iEndkk8ryUR/Denv6oE=;
  b=L7XLeKj/ANS9Mbz0iwUEO3Xxx8SDR2J57vTpdpB7XI4Gt4V2pA9kQ43j
   S5vatDMcUxXjczZbzYZBYCzJ96wqJmSYM4ahNNqLlRf5gTsIZPbESvwmz
   0qnKgyxdv2bus2TCjAvFfXhpQmAqkUHvC0Iee9/5iWyyZ0LK6ZXOyIe7+
   3dc8OqMH4PshcLT4+OpKxp3WtCoeSBaQ6EKiHA6z3glBgn6Ia8oY4JsG0
   NEYEzJF5q+mq1aRq2yHvk9cdXGmJJjIooXDei5VsSC1E+qkEegoT65Dx1
   ogy9DxXpQMZizYLlsUbdf90K52IvUIg4OmnO7dJrBHfIsjEwYmFO2MaOs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="376363385"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="376363385"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="872993390"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="872993390"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:20:05 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0FECF11F851;
        Wed, 18 Oct 2023 14:20:03 +0300 (EEST)
Date:   Wed, 18 Oct 2023 11:20:03 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/3] media: Documentation: BT.601 is not a bus
Message-ID: <ZS+/Y2bIYYkxqdaW@kekkonen.localdomain>
References: <20231017105630.558089-1-sakari.ailus@linux.intel.com>
 <20231017105630.558089-3-sakari.ailus@linux.intel.com>
 <20231017113853.GB14832@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017113853.GB14832@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review.

On Tue, Oct 17, 2023 at 02:38:53PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Oct 17, 2023 at 01:56:29PM +0300, Sakari Ailus wrote:
> > BT.601 is not actually a bus specification, leaving parallel bus without a
> > specification to refer to. Fix this.
> 
> I'm really annoyed there's no standard name for parallel buses :-(
> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/camera-sensor.rst | 4 ++--
> >  Documentation/driver-api/media/tx-rx.rst         | 3 +--
> >  2 files changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index 0de5c86cbd1f..19f2feeecc91 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -9,8 +9,8 @@ This document covers the in-kernel APIs only. For the best practices on
> >  userspace API implementation in camera sensor drivers, please see
> >  :ref:`media_using_camera_sensor_drivers`.
> >  
> > -CSI-2 and parallel (BT.601 and BT.656) busses
> > ----------------------------------------------
> > +CSI-2 and parallel and BT.656 buses
> 
> CSI-2, parallel and BT.656 buses

Yes.

> 
> > +-----------------------------------
> >  
> >  Please see :ref:`transmitter-receiver`.
> >  
> > diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> > index e1e9258dd862..7e115e3c4735 100644
> > --- a/Documentation/driver-api/media/tx-rx.rst
> > +++ b/Documentation/driver-api/media/tx-rx.rst
> > @@ -25,9 +25,8 @@ the host SoC. It is defined by the `MIPI alliance`_.
> >  Parallel
> >  ^^^^^^^^
> >  
> > -`BT.601`_ and `BT.656`_ are the most common parallel busses.
> > +The parallel bus and its `BT.656`_ variant are the most common parallel busses.
> 
> We use "parallel" to mean explicit sync signals in many places
> (including APIs), and here it covers BT.656 too :-( This sentence is
> fairly bad.

I'll mention parallel and BT.656 separately.

> 
> >  
> > -.. _`BT.601`: https://en.wikipedia.org/wiki/Rec._601
> >  .. _`BT.656`: https://en.wikipedia.org/wiki/ITU-R_BT.656
> >  
> >  Transmitter drivers
> 

-- 
Regards,

Sakari Ailus
