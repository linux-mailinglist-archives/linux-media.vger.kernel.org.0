Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64467EACE7
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 10:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfJaJx7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 31 Oct 2019 05:53:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:9078 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726937AbfJaJx7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 05:53:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Oct 2019 02:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; 
   d="scan'208";a="400440374"
Received: from pgsmsx113.gar.corp.intel.com ([10.108.55.202])
  by fmsmga005.fm.intel.com with ESMTP; 31 Oct 2019 02:53:58 -0700
Received: from pgsmsx107.gar.corp.intel.com ([169.254.7.221]) by
 pgsmsx113.gar.corp.intel.com ([169.254.6.93]) with mapi id 14.03.0439.000;
 Thu, 31 Oct 2019 17:53:57 +0800
From:   "Tu, ShawnX" <shawnx.tu@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Yeh, Andy" <andy.yeh@intel.com>
Subject: RE: [PATCH v3] hi556: Add support for Hi-556 sensor
Thread-Topic: [PATCH v3] hi556: Add support for Hi-556 sensor
Thread-Index: AQHVj8dh4To7xqYVY0aji5jBRX6oDqdz92sAgACHf/A=
Date:   Thu, 31 Oct 2019 09:53:56 +0000
Message-ID: <55E713954908ED4DB5E8817B2B5C2CDF01123803@PGSMSX107.gar.corp.intel.com>
References: <1572513535-20091-1-git-send-email-shawnx.tu@intel.com>
 <20191031093534.GI10211@paasikivi.fi.intel.com>
In-Reply-To: <20191031093534.GI10211@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzQyMWNhZTktNjExMy00ODM2LWFiYmYtODE5YWVhN2VmYWY4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidnRzdWxwQW5aQXE5OUM4NVh6Z1NsWE13ZzIxREtLSFpcL3F6VFwvbnZrVkdtTjF1YlhvSkdweU41OGNFejMyZGZpIn0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

The patch v3 modified & fixed Kconfig conflict issue base latest codebase.

Thanks,
Shawn
-----Original Message-----
From: Sakari Ailus [mailto:sakari.ailus@linux.intel.com] 
Sent: Thursday, October 31, 2019 5:36 PM
To: Tu, ShawnX <shawnx.tu@intel.com>
Cc: linux-media@vger.kernel.org; Yeh, Andy <andy.yeh@intel.com>
Subject: Re: [PATCH v3] hi556: Add support for Hi-556 sensor

Hi Shawn,

On Thu, Oct 31, 2019 at 05:18:55PM +0800, Shawnx Tu wrote:
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig 
> index 7eee181..eab4b78 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -566,6 +566,19 @@ config VIDEO_APTINA_PLL  config VIDEO_SMIAPP_PLL
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
