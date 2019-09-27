Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B33FFC0296
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 11:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfI0Jpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 05:45:31 -0400
Received: from mga04.intel.com ([192.55.52.120]:38969 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfI0Jpb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 05:45:31 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Sep 2019 02:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,555,1559545200"; 
   d="scan'208";a="273756190"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 27 Sep 2019 02:45:26 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iDmoX-0004S0-1P; Fri, 27 Sep 2019 12:45:25 +0300
Date:   Fri, 27 Sep 2019 12:45:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH] media: ov5695: Add suport for registering sensor-related
Message-ID: <20190927094525.GP32742@smile.fi.intel.com>
References: <20190927071824.18675-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190927071824.18675-1-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 27, 2019 at 03:18:23PM +0800, Dongchun Zhu wrote:
> Hello,
> 
> This series modifies the interface of async register V4L2 sub-device invoked in probe function for OV5695 CMOS sensor.
> The Omnivision OV5695 image sensor would be used in camera features on CrOS application.
> 5.0 Mega Pixel MIPI Camera Mdoule also supports auto-focus control (AFC) with embedded AF VCM Driver.
> 
> Here we use v4l2_async_register_subdev_sensor_common() instead of v4l2_async_register_subdev()
> to register a sensor sub-device to the asynchronous sub-device framework and parse set up
> common sensor-related devices, such as actuator.
> 
> This function is just like v4l2_async_register_subdev() with the exception that calling it will also parse
> firmware interfaces for remote references using v4l2_async_notifier_parse_fwnode_sensor_common()
> and registers the async sub-devices.
> 
> After applying this change, we can see the VCM move when changing the scene.

When you derive Cc list, set some threshold to the get_maintainer.pl, like

	scripts/get_maintainer.pl --git --git-min-percent=67

-- 
With Best Regards,
Andy Shevchenko


