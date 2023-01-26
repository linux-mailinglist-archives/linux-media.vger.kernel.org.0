Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF6567CEF6
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 15:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbjAZOwd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 09:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232334AbjAZOw2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 09:52:28 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A813D6B983
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 06:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674744727; x=1706280727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2N5D1m4snBceSn9Sapn5bPspHgnZJJD4sfwKEEXiLhY=;
  b=QQIIOTIGCMz7s8KsPRlVPJMGLjbUeuicXqcuM6p5ufiUfgm8/DT6iKYu
   DgqdvOGWed1RyqjqwI/oGcvwi/9kvaTdFzjuJ6+pJ6iRPSKbr6XCC2l/W
   ucYZSB7xFg7pnrviHzk+D1TRwdKhMy2dSDqx/gJYw16eHM/Y3R/HLi0hC
   CKtzL8Wj4RrkYw5AOgluY9xaT3mjlDIzDPkzSJrDMSz+VeklzffkThG1i
   OtMF2JalyQUEnRSffjU1wXOB25knYrQ9h8v1tsiRNKEKuGmunGumm/lGB
   qVfwXmbyT9cz/ZmwGfCS7zEtZDupxFP+2TEK+5Fp3bFAwlK7ZfDmCVne8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="354126900"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; 
   d="scan'208";a="354126900"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 06:52:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="612820298"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; 
   d="scan'208";a="612820298"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 06:52:04 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id AF4C311F78D;
        Thu, 26 Jan 2023 16:52:01 +0200 (EET)
Date:   Thu, 26 Jan 2023 16:52:01 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Robert Mader <robert.mader@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
Message-ID: <Y9KTkSqgyxJbvsj9@kekkonen.localdomain>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Jan 17, 2023 at 11:06:00AM +0100, Jacopo Mondi wrote:
> Currently the imx258 driver requires to have the 'rotation' device node
> property specified in DTS with a fixed value of 180 degrees.
> 
> The "rotation" fwnode device property is intended to allow specify the
> sensor's physical mounting rotation, so that it can be exposed through
> the read-only V4L2_CID_CAMERA_SENSOR_ROTATION control and applications
> can decide how to compensate for that.
> 
> The imx258 driver has read-only VFLIP and HFLIP enabled, resulting in
> a 180 degrees image rotation being produced by the sensor. But this
> doesn't imply that the physical mounting rotation should match the
> driver's implementation.
> 
> I took into the series Robert's patch that register device node properties and
> on top of that register flips controls, in order to remove the hard requirement
> of the 180 degrees rotation property presence.

Reconsidering these patches after the flipping vs. rotation discussion,
they seem fine. The only thing I'd like to see, after removing the rotation
property check, would be to add support for the actual flipping controls.
I'm pretty sure they can be found in the same registers as on CCS --- the
rest of the registers look very much like that. Would you like to send a
patch? :-)

-- 
Regards,

Sakari Ailus
