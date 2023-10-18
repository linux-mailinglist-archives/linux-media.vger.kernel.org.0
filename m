Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 206D17CDDC7
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 15:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344726AbjJRNsf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 09:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjJRNse (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 09:48:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAC110D
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697636912; x=1729172912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5aRy++bx2l2qt0wkma6stlmuqsXV2lL3TwpYqdRW0mY=;
  b=XmODVGnkb7d9yW7krdO104V/zmnSC01hH2dLJ6CUG+ddUp+L9Mvx4cE7
   3InMd5uGDqYlMcfLpb1AfPtPcyjqJyKyEaf7wxW95dXGHKgX3D6IIDEW1
   D97TKfJKs0P0dvxMTVU6lKXrbiz285wsrnoewBJuUQOWEIqzAhXt3HSQE
   f0vBW/RIZFCd8PcRgFycK86ldk6BP7gwdEzCzLRFeO04jFLFYOZL3w0+c
   /9P+oLx8xbEMkIVafbr/WnaTECkPoyU89+9cVSvU3y/lVYEy5e4XLu48c
   EDLMsortv10SnFkatA9w5l6CUONeCRucusYulFp3DP//Tk+Ts+1nM0rPH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389891203"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="389891203"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 06:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="756594192"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="756594192"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 06:48:30 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 56A3C11F851;
        Wed, 18 Oct 2023 16:48:27 +0300 (EEST)
Date:   Wed, 18 Oct 2023 13:48:27 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] media: css: Write LINE_LENGTH_PCK correctly
Message-ID: <ZS/iK+I6xbXbNUbQ@kekkonen.localdomain>
References: <20231018131729.1022521-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018131729.1022521-1-umang.jain@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi Umang,

On Wed, Oct 18, 2023 at 06:47:29PM +0530, Umang Jain wrote:
> According to MIPI CCS v1.1 specification, the LINE_LENGTH_PCK
> units is in VT pixel clocks (Section 8.2.6).
> 
> To compute how many pixel clocks it takes, simply divide the
> VT pixel clock frequency by the number of pixels in a single line.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
> Testing:
> 
> The patch is tested using IMX519 with CCS.
> This patch makes the frame buffer being filled to the fullest
> (instead of getting 1/3rd only previously) - without any workarounds.
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 16de66a37fad..12c75a843dfe 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -734,9 +734,11 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  
>  		break;
>  	case V4L2_CID_HBLANK:
> -		rval = ccs_write(sensor, LINE_LENGTH_PCK,
> -				 sensor->pixel_array->crop[CCS_PA_PAD_SRC].width
> -				 + ctrl->val);
> +		/* LINE_LENGTH_PCK units are in VT pixel clocks. */
> +		u16 line_length_pck =
> +			sensor->pll.vt_bk.pix_clk_freq_hz /
> +			(sensor->pixel_array->crop[CCS_PA_PAD_SRC].width + ctrl->val);

The time of processing one pixel in the pixel array takes a single VT pixel
clock. This register configures how many you have per line, i.e. analogue
crop width + horizontal blanking --- which is what the driver does without
this patch.

I'm still not suggesting the default value for LINE_LENGTH_PCK CCS driver
programs is correct value for this device. The issue is still almost
certainly in the related limit register values in the sensor's register
address space, and that should be addressed by using CCS static data.

> +		rval = ccs_write(sensor, LINE_LENGTH_PCK, line_length_pck);
>  
>  		break;
>  	case V4L2_CID_TEST_PATTERN:

-- 
Regards,

Sakari Ailus
