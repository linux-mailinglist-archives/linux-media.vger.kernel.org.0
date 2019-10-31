Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D6DEAC91
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 10:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfJaJfi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 05:35:38 -0400
Received: from mga17.intel.com ([192.55.52.151]:52547 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727009AbfJaJfi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 05:35:38 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Oct 2019 02:35:38 -0700
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; 
   d="scan'208";a="204150835"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Oct 2019 02:35:36 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 847882075A; Thu, 31 Oct 2019 11:35:34 +0200 (EET)
Date:   Thu, 31 Oct 2019 11:35:34 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Shawnx Tu <shawnx.tu@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com
Subject: Re: [PATCH v3] hi556: Add support for Hi-556 sensor
Message-ID: <20191031093534.GI10211@paasikivi.fi.intel.com>
References: <1572513535-20091-1-git-send-email-shawnx.tu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572513535-20091-1-git-send-email-shawnx.tu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

On Thu, Oct 31, 2019 at 05:18:55PM +0800, Shawnx Tu wrote:
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7eee181..eab4b78 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -566,6 +566,19 @@ config VIDEO_APTINA_PLL
>  config VIDEO_SMIAPP_PLL
>  	tristate
>  
> +config VIDEO_HI556
> +	tristate "Hynix Hi-556 sensor support"
> +	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> +	depends on MEDIA_CAMERA_SUPPORT
> +	depends on MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	help
> +	  This is a Video4Linux2 sensor driver for the Hynix
> +	  Hi-556 camera.
> +
> +	To compile this driver as a module, choose M here: the
> +	module will be called hi556.
> +

Can you fix the Kconfig issue kbuild bot found?

-- 
Sakari Ailus
