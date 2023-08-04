Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4233876F9EF
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 08:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbjHDGUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 02:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbjHDGUp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 02:20:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12505421E
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 23:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691130042; x=1722666042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/pHs0aKGk0U9K+B78rI8B+JA2MEKyAcrUG7dpcbkALk=;
  b=Ex7LrZ8oWQAHVtggJHLhcLtj3rbHDGRoN1lwXO2DqZmRGfpXubMKweT2
   /4yFCFR99AT3XmmMSp0aBuOFFlUcAfhETS0Cq0DTRaiS9gEX/uY7WZM+5
   oBaTCbEqxLZL3bEc5ASo5ebUA/eC6CWA5Z96+RBdP7rDs1M5x1XXflBcn
   FpjthiHQ3j+UWci6j38aP28JoQASuj2oWYgikpHg6kxL1DavUxNyQdZwR
   tQHqNfrwED5tsSqcDTrhG3+EEFjsDLHgokc4RYA9T1shOQzgE01MzxU1B
   UmCN7ZRBW06RxIK+L/fy582tGwBNcSktRCUW8+0h/6OpC0B7dTZmG1gFX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373724408"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="373724408"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 23:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="729921216"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="729921216"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 23:20:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 789ED11FAB1;
        Fri,  4 Aug 2023 09:20:36 +0300 (EEST)
Date:   Fri, 4 Aug 2023 06:20:36 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Wentong Wu <wentong.wu@intel.com>, hdegoede@redhat.com,
        djrscally@gmail.com, linux-media@vger.kernel.org,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        tian.shu.qiu@intel.com
Subject: Re: [PATCH v11 1/2] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <ZMyYtDOb3otZ4iWG@kekkonen.localdomain>
References: <20230803115550.1601965-1-sakari.ailus@linux.intel.com>
 <20230803115550.1601965-2-sakari.ailus@linux.intel.com>
 <20230803215842.GJ27752@pendragon.ideasonboard.com>
 <ZMwkMP/QlaKiFhsp@kekkonen.localdomain>
 <20230803220840.GE9722@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803220840.GE9722@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Aug 04, 2023 at 01:08:40AM +0300, Laurent Pinchart wrote:
> > > > +static int mei_csi_set_fmt(struct v4l2_subdev *sd,
> > > > +			   struct v4l2_subdev_state *sd_state,
> > > > +			   struct v4l2_subdev_format *format)
> > > > +{
> > > > +	struct v4l2_mbus_framefmt *source_mbusformat;
> > > > +	struct v4l2_mbus_framefmt *mbusformat;
> > > > +	struct mei_csi *csi = sd_to_csi(sd);
> > > > +	struct media_pad *pad;
> > > > +
> > > > +	mbusformat = mei_csi_get_pad_format(sd, sd_state, format->pad,
> > > > +					    format->which);
> > > > +	if (!mbusformat)
> > > > +		return -EINVAL;
> > > > +
> > > > +	source_mbusformat = mei_csi_get_pad_format(sd, sd_state, CSI_PAD_SOURCE,
> > > > +						   format->which);
> > > > +	if (!source_mbusformat)
> > > > +		return -EINVAL;
> > > > +
> > > > +	v4l_bound_align_image(&format->format.width, 1, 65536, 0,
> > > > +			      &format->format.height, 1, 65536, 0, 0);
> > > > +
> > > > +	switch (format->format.code) {
> > > > +	case MEDIA_BUS_FMT_RGB444_1X12:
> > > > +	case MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE:
> > > > +	case MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE:
> > > > +	case MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE:
> > > > +	case MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE:
> > > > +	case MEDIA_BUS_FMT_RGB565_1X16:
> > > > +	case MEDIA_BUS_FMT_BGR565_2X8_BE:
> > > > +	case MEDIA_BUS_FMT_BGR565_2X8_LE:
> > > > +	case MEDIA_BUS_FMT_RGB565_2X8_BE:
> > > > +	case MEDIA_BUS_FMT_RGB565_2X8_LE:
> > > > +	case MEDIA_BUS_FMT_RGB666_1X18:
> > > > +	case MEDIA_BUS_FMT_RBG888_1X24:
> > > > +	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> > > > +	case MEDIA_BUS_FMT_BGR888_1X24:
> > > > +	case MEDIA_BUS_FMT_GBR888_1X24:
> > > > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > > > +	case MEDIA_BUS_FMT_RGB888_2X12_BE:
> > > > +	case MEDIA_BUS_FMT_RGB888_2X12_LE:
> > > > +	case MEDIA_BUS_FMT_ARGB8888_1X32:
> > > > +	case MEDIA_BUS_FMT_RGB888_1X32_PADHI:
> > > > +	case MEDIA_BUS_FMT_RGB101010_1X30:
> > > > +	case MEDIA_BUS_FMT_RGB121212_1X36:
> > > > +	case MEDIA_BUS_FMT_RGB161616_1X48:
> > > > +	case MEDIA_BUS_FMT_Y8_1X8:
> > > > +	case MEDIA_BUS_FMT_UV8_1X8:
> > > > +	case MEDIA_BUS_FMT_UYVY8_1_5X8:
> > > > +	case MEDIA_BUS_FMT_VYUY8_1_5X8:
> > > > +	case MEDIA_BUS_FMT_YUYV8_1_5X8:
> > > > +	case MEDIA_BUS_FMT_YVYU8_1_5X8:
> > > > +	case MEDIA_BUS_FMT_UYVY8_2X8:
> > > > +	case MEDIA_BUS_FMT_VYUY8_2X8:
> > > > +	case MEDIA_BUS_FMT_YUYV8_2X8:
> > > > +	case MEDIA_BUS_FMT_YVYU8_2X8:
> > > > +	case MEDIA_BUS_FMT_Y10_1X10:
> > > > +	case MEDIA_BUS_FMT_UYVY10_2X10:
> > > > +	case MEDIA_BUS_FMT_VYUY10_2X10:
> > > > +	case MEDIA_BUS_FMT_YUYV10_2X10:
> > > > +	case MEDIA_BUS_FMT_YVYU10_2X10:
> > > > +	case MEDIA_BUS_FMT_Y12_1X12:
> > > > +	case MEDIA_BUS_FMT_UYVY12_2X12:
> > > > +	case MEDIA_BUS_FMT_VYUY12_2X12:
> > > > +	case MEDIA_BUS_FMT_YUYV12_2X12:
> > > > +	case MEDIA_BUS_FMT_YVYU12_2X12:
> > > > +	case MEDIA_BUS_FMT_UYVY8_1X16:
> > > > +	case MEDIA_BUS_FMT_VYUY8_1X16:
> > > > +	case MEDIA_BUS_FMT_YUYV8_1X16:
> > > > +	case MEDIA_BUS_FMT_YVYU8_1X16:
> > > > +	case MEDIA_BUS_FMT_YDYUYDYV8_1X16:
> > > > +	case MEDIA_BUS_FMT_UYVY10_1X20:
> > > > +	case MEDIA_BUS_FMT_VYUY10_1X20:
> > > > +	case MEDIA_BUS_FMT_YUYV10_1X20:
> > > > +	case MEDIA_BUS_FMT_YVYU10_1X20:
> > > > +	case MEDIA_BUS_FMT_VUY8_1X24:
> > > > +	case MEDIA_BUS_FMT_YUV8_1X24:
> > > > +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> > > > +	case MEDIA_BUS_FMT_UYVY12_1X24:
> > > > +	case MEDIA_BUS_FMT_VYUY12_1X24:
> > > > +	case MEDIA_BUS_FMT_YUYV12_1X24:
> > > > +	case MEDIA_BUS_FMT_YVYU12_1X24:
> > > > +	case MEDIA_BUS_FMT_YUV10_1X30:
> > > > +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> > > > +	case MEDIA_BUS_FMT_AYUV8_1X32:
> > > > +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> > > > +	case MEDIA_BUS_FMT_YUV12_1X36:
> > > > +	case MEDIA_BUS_FMT_YUV16_1X48:
> > > > +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> > > > +	case MEDIA_BUS_FMT_JPEG_1X8:
> > > > +	case MEDIA_BUS_FMT_AHSV8888_1X32:
> > > > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > > > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > > > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > > > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > > > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > > > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > > > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > > +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> > > > +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> > > > +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> > > > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > > > +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> > > > +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> > > > +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> > > > +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> > > > +	case MEDIA_BUS_FMT_SBGGR16_1X16:
> > > > +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> > > > +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> > > > +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> > > > +		break;
> > > > +	default:
> > > > +		format->format.code = MEDIA_BUS_FMT_Y8_1X8;
> > > > +		break;
> > > > +	}
> > > 
> > > I wonder if we should simply accept all formats. The IVSC doesn't seem
> > > to cara.
> > 
> > The video mux needs something similar. I was thinking of adding a generic
> > helper for such functions, perhaps with flags to suggest which formats to
> > accept.
> 
> What would be the drawbacks of accepting all formats ?

Also the ones that aren't defined at the moment?

They're not valid, although in practice there might not be issues, as they
are compared across links in any case.

I guess there should also be support for enum_mbus_codes, and for that we
need a list of some sort.

-- 
Sakari Ailus
