Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0FDA8EC94
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731822AbfHONTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:19:00 -0400
Received: from mga09.intel.com ([134.134.136.24]:61934 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730211AbfHONTA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:19:00 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 06:18:59 -0700
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; 
   d="scan'208";a="171107427"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 06:18:53 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1B0FC206FD; Thu, 15 Aug 2019 16:17:49 +0300 (EEST)
Date:   Thu, 15 Aug 2019 16:17:49 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com,
        zyc@rock-chips.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com,
        Jacob Chen <cc@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>
Subject: Re: [PATCH v8 05/14] media: rkisp1: add Rockchip ISP1 subdev driver
Message-ID: <20190815131748.GS6133@paasikivi.fi.intel.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-6-helen.koike@collabora.com>
 <20190808091406.GQ21370@paasikivi.fi.intel.com>
 <da6c1d01-e3f6-ad73-db55-145d7832a665@collabora.com>
 <20190815082422.GM6133@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815082422.GM6133@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 15, 2019 at 11:24:22AM +0300, Sakari Ailus wrote:
> Hi Helen,
> 
> On Wed, Aug 14, 2019 at 09:58:05PM -0300, Helen Koike wrote:
> 
> ...
> 
> > >> +static int rkisp1_isp_sd_set_fmt(struct v4l2_subdev *sd,
> > >> +				 struct v4l2_subdev_pad_config *cfg,
> > >> +				 struct v4l2_subdev_format *fmt)
> > >> +{
> > >> +	struct rkisp1_device *isp_dev = sd_to_isp_dev(sd);
> > >> +	struct rkisp1_isp_subdev *isp_sd = &isp_dev->isp_sdev;
> > >> +	struct v4l2_mbus_framefmt *mf = &fmt->format;
> > >> +
> > > 
> > > Note that for sub-device nodes, the driver is itself responsible for
> > > serialising the access to its data structures.
> > 
> > But looking at subdev_do_ioctl_lock(), it seems that it serializes the
> > ioctl calls for subdevs, no? Or I'm misunderstanding something (which is
> > most probably) ?
> 
> Good question. I had missed this change --- subdev_do_ioctl_lock() is
> relatively new. But setting that lock is still not possible as the struct
> is allocated in the framework and the device is registered before the
> driver gets hold of it. It's a good idea to provide the same serialisation
> for subdevs as well.
> 
> I'll get back to this later.

The main reason is actually that these ops are also called through the
sub-device kAPI, not only through the uAPI, and the locks are only taken
through the calls via uAPI.

So adding the locks to uAPI calls alone would not address the issue.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
