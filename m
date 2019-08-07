Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F98E8485D
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 11:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbfHGJFF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 05:05:05 -0400
Received: from mga03.intel.com ([134.134.136.65]:65286 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726244AbfHGJFE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 05:05:04 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 01:56:10 -0700
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; 
   d="scan'208";a="176128515"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 01:56:09 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 94F69202CC; Wed,  7 Aug 2019 11:56:43 +0300 (EEST)
Date:   Wed, 7 Aug 2019 11:56:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Shawnx Tu <shawnx.tu@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com
Subject: Re: [PATCH v1] ov5675: Add support for OV5675 sensor
Message-ID: <20190807085643.GL21370@paasikivi.fi.intel.com>
References: <1564570416-8329-1-git-send-email-shawnx.tu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564570416-8329-1-git-send-email-shawnx.tu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

Thanks for the patch. A few comments below.

On Wed, Jul 31, 2019 at 06:53:36PM +0800, Shawnx Tu wrote:

...

> +static int ov5675_check_hwcfg(struct device *dev)
> +{
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	u32 mclk;
> +	int ret;
> +	unsigned int i, j;
> +
> +	if (!fwnode)
> +		return -ENXIO;
> +
> +	fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);

Please check reading the property succeeded. Otherwise mclk will be
uninitialised.

Apart from that, this seems good.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
