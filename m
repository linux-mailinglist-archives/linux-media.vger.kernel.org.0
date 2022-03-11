Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88C0A4D6240
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 14:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345965AbiCKNVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 08:21:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240397AbiCKNVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 08:21:20 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0990D1C2D97
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 05:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647004816; x=1678540816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l3dLo5DLb1hWUMneviDU6icBHP/BKULhNtM8YyV+jLg=;
  b=ksciWgkxcOT5UTUY77ZW5fyJ9mn+nkrYzedL0ZoqlbZ+Z5MZam4RXrBj
   0rcJPbPpJJzfOd6jy28mpBFvv1IBJSiLLLDNeXzsH1ofKX2xjIPhzn1Jn
   FBoJcM1zUD2VaY3jESv7/N2RtPOd4JMQUa0T2qZRFVBoxQghc0DTHmNvh
   ApfWEqnZoMeff11YK3dhoiiOzboU9kDObPnF8rCht1xVhNrr2RQlztBaJ
   XgGkW0wpesDia+6JD9z3hvQaporaMRTypS24NG/hgwcxBxLjk/Q926lhQ
   vyEIFoJOiL12pxrSpp39kDDcg6lyA0Ls5fakleuaLYnVxjwGYLbSETTyn
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="236173000"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="236173000"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 05:20:15 -0800
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="642976382"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 05:20:12 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 032C22036B;
        Fri, 11 Mar 2022 15:20:11 +0200 (EET)
Date:   Fri, 11 Mar 2022 15:20:11 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: imx: imx-mipi-csis: Add support for JPEG_1X8
Message-ID: <YitMiy7/Xh6I5X7/@paasikivi.fi.intel.com>
References: <20220309100448.9749-1-jacopo@jmondi.org>
 <YioDvlWYgUw79DG7@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YioDvlWYgUw79DG7@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 10, 2022 at 03:57:18PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Wed, Mar 09, 2022 at 11:04:48AM +0100, Jacopo Mondi wrote:
> > Add support for MEDIA_BUS_FMT_JPEG_1X8 media bus code to the
> > CSIS driver.
> > 
> > The MEDIA_BUS_FMT_JPEG_1X8 code is mapped tot the RAW8 CSI-2 Data Type,
> 
> s/tot/to/
> 
> > while the CSI-2 specification suggests to use User Defined Data Type 1.
> > 
> > As reported in the comment, the CSIS interface captures arbitrary Data
> > Types by using a pixel sampling mode not supported by the IP core
> > connected to it on i.MX SoCs.
> > 
> > As some sensors, such as OV5640, support sending JPEG data on the RAW8
> > Data Type and capture operations work correcty with such configuration,
> > map MEDIA_BUS_FMT_JPEG_1X8 to Data Type 0x2a.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> > 
> > Based on Hans' br-v5.18s where the CSIS patches have been collected
> > 
> > ---
> >  drivers/media/platform/imx/imx-mipi-csis.c | 28 ++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> > index 0a72734db55e..3731748de18b 100644
> > --- a/drivers/media/platform/imx/imx-mipi-csis.c
> > +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> > @@ -470,6 +470,34 @@ static const struct csis_pix_format mipi_csis_formats[] = {
> >  		.output = MEDIA_BUS_FMT_SRGGB14_1X14,
> >  		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
> >  		.width = 14,
> > +	},
> > +	/* JPEG */
> > +	{
> > +		.code = MEDIA_BUS_FMT_JPEG_1X8,
> > +		.output = MEDIA_BUS_FMT_JPEG_1X8,
> > +		/*
> > +		 * Map JPEG_1X8 on the RAW8 datatype.
> 
> s/on the/to the/
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, applied!

-- 
Sakari Ailus
