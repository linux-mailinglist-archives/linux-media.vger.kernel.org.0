Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39EA6278C7
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 10:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbiKNJMK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 04:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236907AbiKNJMF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 04:12:05 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A176F34
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 01:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668417125; x=1699953125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/DM+TXx1zGBRIpxKzXsgAsUu7FPIsjyWRC/gXWMSxws=;
  b=njSVu5KB4+CCrIm7P2kvJwKJ2QMSC/+GX9uGpylYDKvxU4HwHMNVl981
   JSiZFc2OII82KjYdMw7/puWnb51Nhe1JxtbZT06v2zznOM4Gu5Qmi03WK
   nfGsDlUjfg3BtNat1yVLFDuFjHJiploK/R28dTKc6D96+2AnvEvGCm50+
   7T2btKcRVYMMij7RkYFPF7txPY3TTdrlcOEwLY1Ct0wZLu9yrd0+a6XVy
   EtvFgOJDRk3uaCpCy1YiJuocH6RiHV1tBy2irFD1vepAlnCYvnejA0mtc
   QL6PMs5hcyN/U1UpwnYdPl0a6DG+07q8lgTAxL+77j6rT8Wpvg1mPbpSR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="291637514"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="291637514"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 01:12:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="640696791"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="640696791"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 01:12:03 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1F17E20106;
        Mon, 14 Nov 2022 11:12:01 +0200 (EET)
Date:   Mon, 14 Nov 2022 09:12:01 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/3] Documentation: media: camera-sensor: Correct frame
 interval
Message-ID: <Y3IGYaOUC4SB9Dv+@paasikivi.fi.intel.com>
References: <20221107204959.37691-1-jacopo@jmondi.org>
 <20221107204959.37691-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107204959.37691-2-jacopo@jmondi.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Nov 07, 2022 at 09:49:57PM +0100, Jacopo Mondi wrote:
> The formula to compute the frame interval uses the analogue crop
> rectangle dimensions to compute the total frame size in conjunction with
> blankings.
> 
> Horizontal and vertical blankings are realized by extending the time
> interval during which no valid pixels are sent on the bus between
> visible lines and between consecutive frames, whose size is smaller than
> the analogue crop rectangle if any additional cropping or pixel
> subsampling is applied on the sensor processing pipeline.
> 
> Correct the documentation to use the visible line length and frame
> height instead of the analogue crop dimensions.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/driver-api/media/camera-sensor.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index c7d4891bd24e..bb7d62db4cd1 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -87,12 +87,11 @@ less all modern raw camera sensors.
>  
>  The frame interval is calculated using the following equation::
>  
> -	frame interval = (analogue crop width + horizontal blanking) *
> -			 (analogue crop height + vertical blanking) / pixel rate
> +	frame interval = (visible width + horizontal blanking) *
> +			 (visibile height + vertical blanking) / pixel rate
>  
>  The formula is bus independent and is applicable for raw timing parameters on
> -large variety of devices beyond camera sensors. Devices that have no analogue
> -crop, use the full source image size, i.e. pixel array size.
> +large variety of devices beyond camera sensors.

This would break frame interval computation for CCS and possibly for some
other devices as well. Analogue crop effectively means leaving some parts
of the pixel array unread, which is why it affects sensor timing. Digital
crop, on the other hand, involves throwing out data later in the process
and so it does not have such an effect on timing.

There are two ways the issue could be addressed for drivers exposing a
single sub-device:

1) adding FLL and LLP controls that are independent of analogue crop or

2) adding a special analogue crop rectangle.

I think 1) is preferred, as it always has been somewhat cumbersome that you
have to find the size the blanking controls are related using another
interface.

Some drivers could take digital crop into account in blanking values
already but that is just working around the problem, although for single
sub-device drivers there haven't been proper solutions provided either.

>  
>  Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
>  ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control

-- 
Kind regards,

Sakari Ailus
