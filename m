Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94EA7373E1
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 14:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbfFFMMq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 08:12:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:19764 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726757AbfFFMMq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 08:12:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jun 2019 05:12:45 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jun 2019 05:12:39 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E6E6C20D69; Thu,  6 Jun 2019 15:12:38 +0300 (EEST)
Date:   Thu, 6 Jun 2019 15:12:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Vishal Sagar <vsagar@xilinx.com>
Cc:     Vishal Sagar <vishal.sagar@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 MIPI CSI-2 Rx Subsystem
Message-ID: <20190606121238.zxdvvogob3umzid4@paasikivi.fi.intel.com>
References: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
 <1559555971-193235-2-git-send-email-vishal.sagar@xilinx.com>
 <20190604192344.7tycwffjd3yeizxh@paasikivi.fi.intel.com>
 <CH2PR02MB60889B850DCAA810A772160DA7170@CH2PR02MB6088.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH2PR02MB60889B850DCAA810A772160DA7170@CH2PR02MB6088.namprd02.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

On Thu, Jun 06, 2019 at 11:54:19AM +0000, Vishal Sagar wrote:
> Hi Sakari,
> 
> > -----Original Message-----
> > From: Sakari Ailus [mailto:sakari.ailus@linux.intel.com]
> > Sent: Wednesday, June 05, 2019 12:54 AM
> > To: Vishal Sagar <vishal.sagar@xilinx.com>
> > Cc: Hyun Kwon <hyunk@xilinx.com>; laurent.pinchart@ideasonboard.com;
> > mchehab@kernel.org; robh+dt@kernel.org; mark.rutland@arm.com; Michal
> > Simek <michals@xilinx.com>; linux-media@vger.kernel.org;
> > devicetree@vger.kernel.org; hans.verkuil@cisco.com; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Dinesh Kumar
> > <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Luca Ceresoli
> > <luca@lucaceresoli.net>; Jacopo Mondi <jacopo@jmondi.org>
> > Subject: Re: [PATCH v8 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI
> > CSI-2 Rx Subsystem
> > 
> > EXTERNAL EMAIL
> > 
> > Hi Vishal,
> > 
> > On Mon, Jun 03, 2019 at 03:29:30PM +0530, Vishal Sagar wrote:
> > 
> > > +Optional properties:
> > > +--------------------
> > > +- .
> > > +  Without this property the driver won't be loaded as IP won't be able to
> > generate
> > > +  media bus format compliant stream output.
> > 
> > I think we previously concluded that the format will be just different in
> > this case. So the description appears incorrect.
> > 
> 
> Referring to your email https://lkml.org/lkml/2019/3/22/1823 in response to v6 patches,
> if the video format bridge is not enabled, then the way in which pixels are transported on
> the bus don't correspond to the existing media bus formats in Linux.
> 
> If not loading the driver is incorrect way, is it ok for the driver to allow same media bus format
> for packed and unpacked data type on the sink pad?
> 
> Or is it ok for the driver to not validate the media bus format set on the sink pad?

Taking a fresh look at the issue --- usually such unpacking is done by the
DMA engine, or the same device contains both the CSI-2 RX and DMA. But here
it actually affects the input of that DMA engine. You're right in saying we
don't have format definitions from which you could tell which case it is,
and we also don't have other pre-existing means to tell them apart.

Feel free to keep the check in the driver, but we can't refer to the driver
loading in DT binding documentation: this is really not supposed to be
related to that driver, or even Linux at all.

How about changing this to:

xlnx,vfb: Present when Video Format Bridge is enabled in IP configuration.

That'd be aligned with the other properties and would more accurately
convey what this means.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
