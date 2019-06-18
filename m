Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55E584A4AC
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 17:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729249AbfFRO7u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 10:59:50 -0400
Received: from retiisi.org.uk ([95.216.213.190]:38910 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729042AbfFRO7t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 10:59:49 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id AFB44634C7B;
        Tue, 18 Jun 2019 17:59:22 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hdFZy-0000tJ-LA; Tue, 18 Jun 2019 17:59:22 +0300
Date:   Tue, 18 Jun 2019 17:59:22 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Vishal Sagar <vsagar@xilinx.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>,
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
Subject: Re: [PATCH v8 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Message-ID: <20190618145922.sq4jovxoz2khs3tq@valkosipuli.retiisi.org.uk>
References: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
 <1559555971-193235-3-git-send-email-vishal.sagar@xilinx.com>
 <20190605124851.xr2hmgyoe46q6xud@kekkonen.localdomain>
 <CH2PR02MB60889F3BF23FD96BF11053A2A7100@CH2PR02MB6088.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH2PR02MB60889F3BF23FD96BF11053A2A7100@CH2PR02MB6088.namprd02.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

On Fri, Jun 07, 2019 at 07:11:47AM +0000, Vishal Sagar wrote:
...
> > > +/**
> > > + * xcsi2rxss_s_ctrl - This is used to set the Xilinx MIPI CSI-2 V4L2 controls
> > > + * @ctrl: V4L2 control to be set
> > > + *
> > > + * This function is used to set the V4L2 controls for the Xilinx MIPI
> > > + * CSI-2 Rx Subsystem. It is used to set the active lanes in the system.
> > > + * The event counters can be reset.
> > > + *
> > > + * Return: 0 on success, errors otherwise
> > > + */
> > > +static int xcsi2rxss_s_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +     struct xcsi2rxss_state *xcsi2rxss =
> > > +             container_of(ctrl->handler, struct xcsi2rxss_state,
> > > +                          ctrl_handler);
> > > +     struct xcsi2rxss_core *core = &xcsi2rxss->core;
> > > +     int ret = 0;
> > > +
> > > +     mutex_lock(&xcsi2rxss->lock);
> > > +
> > > +     switch (ctrl->id) {
> > > +     case V4L2_CID_XILINX_MIPICSISS_ACT_LANES:
> > > +             /*
> > > +              * This will be called only when "Enable Active Lanes" parameter
> > > +              * is set in design
> > > +              */
> > 
> > You generally get the number of lanes from firmware. There's no need to add
> > a control for it. 
> > 
> 
> I don't understand what firmware means here. There is no other code running.
> I don't see how to modify the number of lanes apart from using v4l control.

It's not the user that provides this information. Again, if you want this
feature right from the time the driver is merged to mainline, then rebase
the set on top of Jacopo's frame descriptor set. But it may take a while.

> 
> > > +             if (core->enable_active_lanes) {
> > > +                     u32 active_lanes;
> > > +
> > > +                     xcsi2rxss_clr_and_set(core, XCSI_PCR_OFFSET,
> > > +                                           XCSI_PCR_ACTLANES_MASK,
> > > +                                           ctrl->val - 1);
> > > +                     /*
> > > +                      * This delay is to allow the value to reflect as write
> > > +                      * and read paths are different.
> > > +                      */
> > > +                     udelay(1);
> > > +                     active_lanes = xcsi2rxss_read(core, XCSI_PCR_OFFSET);
> > > +                     active_lanes &= XCSI_PCR_ACTLANES_MASK;
> > > +                     active_lanes++;
> > > +                     if (active_lanes != ctrl->val)
> > > +                             dev_info(core->dev, "RxByteClkHS absent\n");
> > > +                     dev_dbg(core->dev, "active lanes = %d\n", ctrl->val);
> > > +             } else {
> > > +                     ret = -EINVAL;
> > > +             }
> > > +             break;
> > > +     case V4L2_CID_XILINX_MIPICSISS_RESET_COUNTERS:
> > > +             xcsi2rxss_reset_event_counters(xcsi2rxss);
> > > +             break;
> > > +     default:
> > > +             ret = -EINVAL;
> > > +             break;
> > > +     }
> > > +
> > > +     mutex_unlock(&xcsi2rxss->lock);
> > > +
> > > +     return ret;
> > > +}

-- 
Regards,

Sakari Ailus
