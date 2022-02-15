Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACC954B76BB
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 21:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbiBOTV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 14:21:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiBOTV6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 14:21:58 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD90475E7C
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 11:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644952907; x=1676488907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KQSmqHluE84gcFO/ONR2XYH5mDITH6HxFWFHWRoJXtw=;
  b=lhzglg/K3Hn7ES7fENkEqX8ddHEmD2k5+b/WWQ1xKdmOKHXQ7kn+KZ37
   HtpY08x2YMS2592IAeYoMHtqkaaOBl+3kdRG6/r0ViDejJTLi10J0/ClC
   wVKDnkS/YOaHR6BFTwlrUVRmrzzvv64PAW1HeJHice5m61qvB3xb16NLW
   6YCRiJ7kaID5vMUaSeLXxabR2l7Eft20ST0dA6D9Om1EYnCbRF7sT/ArU
   kD+i3y7Bl6PQRZW+E8LoaW6Mpj3q0OclWoFps0QIIm+NI0+/24xdEfVgv
   PL9t0U4bRdCd/tBV956UsBjDXC52mBqPzrJtNYVQ27Bvv0Ql4bMauTQ7u
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="275011768"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="275011768"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 11:21:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="624975924"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 11:21:46 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 16E902019F;
        Tue, 15 Feb 2022 21:21:44 +0200 (EET)
Date:   Tue, 15 Feb 2022 21:21:44 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Eugen.Hristev@microchip.com
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Message-ID: <Ygv9SP2OpIHDtXfA@paasikivi.fi.intel.com>
References: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
 <20220208061129.158ba126@sal.lan>
 <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
 <YgJOqb06gmNhFw6X@pendragon.ideasonboard.com>
 <5168daa7-2f8b-fdbe-7a15-12de3428322a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5168daa7-2f8b-fdbe-7a15-12de3428322a@microchip.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Tue, Feb 08, 2022 at 11:36:16AM +0000, Eugen.Hristev@microchip.com wrote:
> I am sorry, I was referring to the get_mbus_config which was recently 
> added, which in my case uses V4L2_MBUS_CSI2_CHANNEL_* .
> Without the get_mbus_config, I wasn't supposed to use the 
> V4L2_MBUS_CSI2_CHANNEL_* at all .
> Hence my confusion in adding them into the same bucket.
> 
> My driver uses these flags because my initial implementation to get the 
> VC from the devicetree was rejected and this was suggested instead.

As noted by Laurent, this feature is not supported in mainline currently.
Beyond that, no transmitter driver uses virtual channel different from
zero, so the case for setting non-zero virtual channel in absence of
multiple streams does not exist.

Also the interfaces required to make use of multiple streams do not exist
in mainline at the moment. They will be added by the streams patchset
eventually, and adding support for them requires extra driver work.

Thus, we're not losing any functionality by dropping the defines and
potentially associated driver code. Therefore I see no reason to postpone
these patches.

-- 
Kind regards,

Sakari Ailus
