Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 395518E937
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 12:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730834AbfHOKqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 06:46:53 -0400
Received: from mga18.intel.com ([134.134.136.126]:62125 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbfHOKqx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 06:46:53 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 03:46:27 -0700
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; 
   d="scan'208";a="179338295"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 03:46:22 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 091E520F68; Thu, 15 Aug 2019 13:45:16 +0300 (EEST)
Date:   Thu, 15 Aug 2019 13:45:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        devicetree@vger.kernel.org, Eddie Cai <eddie.cai.linux@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Chen Jacob <jacob2.chen@rock-chips.com>,
        Jeffy <jeffy.chen@rock-chips.com>,
        =?utf-8?B?6ZKf5Lul5bSH?= <zyc@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Jacob Chen <cc@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>
Subject: Re: [PATCH v8 05/14] media: rkisp1: add Rockchip ISP1 subdev driver
Message-ID: <20190815104515.GO6133@paasikivi.fi.intel.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-6-helen.koike@collabora.com>
 <20190808091406.GQ21370@paasikivi.fi.intel.com>
 <da6c1d01-e3f6-ad73-db55-145d7832a665@collabora.com>
 <20190815082422.GM6133@paasikivi.fi.intel.com>
 <CAAFQd5Cd2k5ZCDfu=a281NLOa88vpm-P7ZPWF4Nnx==iyEkn7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5Cd2k5ZCDfu=a281NLOa88vpm-P7ZPWF4Nnx==iyEkn7A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 15, 2019 at 07:29:59PM +0900, Tomasz Figa wrote:
> On Thu, Aug 15, 2019 at 5:25 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Helen,
> >
> > On Wed, Aug 14, 2019 at 09:58:05PM -0300, Helen Koike wrote:
> >
> > ...
> >
> > > >> +static int rkisp1_isp_sd_set_fmt(struct v4l2_subdev *sd,
> > > >> +                           struct v4l2_subdev_pad_config *cfg,
> > > >> +                           struct v4l2_subdev_format *fmt)
> > > >> +{
> > > >> +  struct rkisp1_device *isp_dev = sd_to_isp_dev(sd);
> > > >> +  struct rkisp1_isp_subdev *isp_sd = &isp_dev->isp_sdev;
> > > >> +  struct v4l2_mbus_framefmt *mf = &fmt->format;
> > > >> +
> > > >
> > > > Note that for sub-device nodes, the driver is itself responsible for
> > > > serialising the access to its data structures.
> > >
> > > But looking at subdev_do_ioctl_lock(), it seems that it serializes the
> > > ioctl calls for subdevs, no? Or I'm misunderstanding something (which is
> > > most probably) ?
> >
> > Good question. I had missed this change --- subdev_do_ioctl_lock() is
> > relatively new. But setting that lock is still not possible as the struct
> > is allocated in the framework and the device is registered before the
> > driver gets hold of it. It's a good idea to provide the same serialisation
> > for subdevs as well.
> >
> > I'll get back to this later.
> >
> > ...
> >
> > > >> +static int rkisp1_isp_sd_s_power(struct v4l2_subdev *sd, int on)
> > > >
> > > > If you support runtime PM, you shouldn't implement the s_power op.
> > >
> > > Is is ok to completly remove the usage of runtime PM then?
> > > Like this http://ix.io/1RJb ?
> >
> > Please use runtime PM instead. In the long run we should get rid of the
> > s_power op. Drivers themselves know better when the hardware they control
> > should be powered on or off.
> >
> 
> One also needs to use runtime PM to handle power domains and power
> dependencies on auxiliary devices, e.g. IOMMU.
> 
> > >
> > > tbh I'm not that familar with runtime PM and I'm not sure what is the
> > > difference of it and using s_power op (and Documentation/power/runtime_pm.rst
> > > is not being that helpful tbh).
> >
> > You can find a simple example e.g. in
> > drivers/media/platform/atmel/atmel-isi.c .
> >
> > >
> > > >
> > > > You'll still need to call s_power on external subdevs though.
> > > >
> > > >> +{
> > > >> +  struct rkisp1_device *isp_dev = sd_to_isp_dev(sd);
> > > >> +  int ret;
> > > >> +
> > > >> +  v4l2_dbg(1, rkisp1_debug, &isp_dev->v4l2_dev, "s_power: %d\n", on);
> > > >> +
> > > >> +  if (on) {
> > > >> +          ret = pm_runtime_get_sync(isp_dev->dev);
> > >
> > > If this is not ok to remove suport for runtime PM, then where should I put
> > > the call to pm_runtime_get_sync() if not in this s_power op ?
> >
> > Basically the runtime_resume and runtime_suspend callbacks are where the
> > device power state changes are implemented, and pm_runtime_get_sync and
> > pm_runtime_put are how the driver controls the power state.
> >
> > So you no longer need the s_power() op at all. The op needs to be called on
> > the pipeline however, as there are drivers that still use it.
> >
> 
> For this driver, I suppose we would _get_sync() when we start
> streaming (in the hardware, i.e. we want the ISP to start capturing
> frames) and _put() when we stop and the driver shouldn't perform any
> access to the hardware when the streaming is not active.

Agreed.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
