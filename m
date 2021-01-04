Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACE92E9542
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 13:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbhADMst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 07:48:49 -0500
Received: from mga03.intel.com ([134.134.136.65]:51236 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726246AbhADMst (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Jan 2021 07:48:49 -0500
IronPort-SDR: +i6q2zT7QfwlJa8H/OYObz2J9u56ljd/AZ6xZzjkVXE6J705QZLMhIrSiYaxpxx0OFn2xPMzky
 fgzduFETtZgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9853"; a="177048168"
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="177048168"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 04:47:03 -0800
IronPort-SDR: MCkc6M0T3fftpo9h7mmSQGRSYf6x8gO+7ru9BZoUohrL5FPgGF+yufjPUxlo7oYj2JUNztVxSH
 R7notaB45t7w==
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="378408865"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 04:47:02 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 32152206FD; Mon,  4 Jan 2021 14:47:00 +0200 (EET)
Date:   Mon, 4 Jan 2021 14:47:00 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH 2/2] media: i2c: Add OV1063x sensor driver
Message-ID: <20210104124700.GL11878@paasikivi.fi.intel.com>
References: <20210104053945.12409-1-laurent.pinchart@ideasonboard.com>
 <20210104053945.12409-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104053945.12409-3-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Jan 04, 2021 at 07:39:45AM +0200, Laurent Pinchart wrote:
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 878f66ef2719..84a97989775e 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1050,6 +1050,18 @@ config VIDEO_OV9650
>  	  This is a V4L2 sensor driver for the Omnivision
>  	  OV9650 and OV9652 camera sensors.
>  
> +config VIDEO_OV10633
> +	tristate "OmniVision OV10633/OV10635 sensor support"
> +	depends on I2C && VIDEO_V4L2
> +	depends on GPIOLIB && OF
> +	select MEDIA_CONTROLLER
> +	select REGMAP_I2C

Should this be SCCB instead?

Likewise for the driver.

-- 
Sakari Ailus
