Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFDB6AEB0
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 20:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387773AbfGPSdd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 14:33:33 -0400
Received: from retiisi.org.uk ([95.216.213.190]:40158 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725926AbfGPSdc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 14:33:32 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 67A7A634C85;
        Tue, 16 Jul 2019 21:31:59 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hnSGM-0000b1-5d; Tue, 16 Jul 2019 21:33:18 +0300
Date:   Tue, 16 Jul 2019 21:33:18 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
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
Subject: Re: [PATCH v9 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Message-ID: <20190716183318.GE850@valkosipuli.retiisi.org.uk>
References: <1560247809-117978-1-git-send-email-vishal.sagar@xilinx.com>
 <1560247809-117978-3-git-send-email-vishal.sagar@xilinx.com>
 <20190618151933.zqepfqdjjjlhea7h@valkosipuli.retiisi.org.uk>
 <CH2PR02MB6088B5E97833233486C53E9BA7F30@CH2PR02MB6088.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH2PR02MB6088B5E97833233486C53E9BA7F30@CH2PR02MB6088.namprd02.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

On Thu, Jul 11, 2019 at 09:09:37AM +0000, Vishal Sagar wrote:
...
> > > +static int xcsi2rxss_subscribe_event(struct v4l2_subdev *sd,
> > > +                                  struct v4l2_fh *fh,
> > > +                                  struct v4l2_event_subscription *sub)
> > > +{
> > > +     struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
> > > +     int ret;
> > > +
> > > +     mutex_lock(&xcsi2rxss->lock);
> > > +
> > > +     switch (sub->type) {
> > > +     case V4L2_EVENT_XILINX_CSI2RX_SLBF:
> > > +             ret = v4l2_event_subscribe(fh, sub, XCSI_MAX_EVENT, NULL);
> > 
> > Please either use dev_dbg() or propose an API for conveying this
> > information downstream in the pipeline.
> > 
> 
> I will use a dev_alert() in the irq handler for this for now and remove this event.

dev_dbg(), please, as this is certainly not fatal. We should probably have
an API to tell this to the downstream sub-device driver in the pipeline if
the hardware has no way to detect this independently.

-- 
Regards,

Sakari Ailus
