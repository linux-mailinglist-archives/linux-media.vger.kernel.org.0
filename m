Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96E848BEFF
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 08:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351204AbiALH2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 02:28:54 -0500
Received: from mga02.intel.com ([134.134.136.20]:5419 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235005AbiALH2y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 02:28:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641972534; x=1673508534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hFEwW2CSCHW+VYdLy1nrjbOt69TSqyif3Mc2fDrbE4k=;
  b=WzEDnljupjDaIvBpS9mc3wzfADd05YtUCDsOy8vbFwCstCa0abmOCLZe
   IQBZWWlHcv+LHZHTxGCxYgmognSV35vUzuFUGUdXxzqbBK8zxwbBKphlx
   X3WPuGZjjgiLrJcV+t6Dnqc7qZXWrUBbgraQDtfLHyBWb/Z+tfcHMGOVq
   u3U7N0+n0lKmaPlqo15Tf4HHeyNfHHBntO49zuq4GfwuP4CGmT/6YtCff
   L3ImYuQJC8YEDUm+O9sgS0oAqKMCUMeo3+XuzOl2vO1VVdfmg2hskq2Xw
   uN3UH5SyA8MeV6R5/syHgTkkcdx3eBQweYFkbRO3lDH+RmD2b9pajg5y+
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="231020008"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="231020008"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 23:28:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="558628944"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 23:28:52 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 28D00202D5;
        Wed, 12 Jan 2022 09:28:50 +0200 (EET)
Date:   Wed, 12 Jan 2022 09:28:50 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jimmy Su <jimmy.su@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com
Subject: Re: [PATCH v7] media: i2c: Add ov08d10 camera sensor driver
Message-ID: <Yd6DMilaQSMutVQa@paasikivi.fi.intel.com>
References: <20220112054255.16383-1-jimmy.su@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112054255.16383-1-jimmy.su@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jimmy,

On Wed, Jan 12, 2022 at 01:42:55PM +0800, Jimmy Su wrote:
> Add a v4l2 sub-device driver for the OmniVision ov08d10 image sensor.
> This camera sensor is using the i2c bus for control and the
> csi-2 bus for data.
> 
> The following features are supported:
> - manual exposure and analog/digital gain control
> - vblank/hblank control
> - test pattern
> - image vertical flip and horizontal mirror control
> - supported resolution:
> 	- 3280x2460 at 30 FPS
> 	- 3264x2448 at 30 FPS
> 	- 1632x1224 at 30 FPS
> - supported bayer order output:
> 	- SGRBG10 as default
> 	- SBGGR10 at flip mode
> 	- SRGGB10 at mirror mode
> 	- SGBRG10 at flip + mirror mode
> 
> Signed-off-by: Jimmy Su <jimmy.su@intel.com>

Thanks for the patch.

I've applied it with the following diff --- the mutex needs to be released
only after the controls have been (un)grabbed:

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 34d7936499e9..92888024c774 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1121,12 +1121,13 @@ static int ov08d10_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	ov08d10->streaming = enable;
-	mutex_unlock(&ov08d10->mutex);
 
 	/* vflip and hflip cannot change during streaming */
 	__v4l2_ctrl_grab(ov08d10->vflip, enable);
 	__v4l2_ctrl_grab(ov08d10->hflip, enable);
 
+	mutex_unlock(&ov08d10->mutex);
+
 	return ret;
 }
 
-- 
Kind regards,

Sakari Ailus
