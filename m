Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB6CF57045
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 20:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfFZSGF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 14:06:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38490 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbfFZSGF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 14:06:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 35B95284719
Message-ID: <f0504a6430e192db1495cf165f93df1aa5cd9f79.camel@collabora.com>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, kernel@collabora.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Wed, 26 Jun 2019 15:05:56 -0300
In-Reply-To: <20190626080027.GA4776@pendragon.ideasonboard.com>
References: <20190625203945.28081-1-ezequiel@collabora.com>
         <20190626080027.GA4776@pendragon.ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Philipp,

Thank you for the prompt review! I was pretty sure this would
raise your wise eyebrows :-)

On Wed, 2019-06-26 at 11:00 +0300, Laurent Pinchart wrote:
> Hi Ezequiel,
> 
> Thank you for the patch.
> 
> On Tue, Jun 25, 2019 at 05:39:45PM -0300, Ezequiel Garcia wrote:
> > Not all sensors will be able to guarantee a proper initial state.
> > This may be either because the driver is not properly written,
> > or (probably unlikely) because the hardware won't support it.
> > 
> > While the right solution in the former case is to fix the sensor
> > driver, the real world not always allows right solutions, due to lack
> > of available documentation and support on these sensors.
> > 
> > Let's relax this requirement, and allow the driver to support stream start,
> > even if the sensor initial sequence wasn't the expected.
> > A warning is still emitted, so users should be hinted that something is off.
> 
> I'm not sure this is a very good idea. Failure to detect the LP-11 state
> may mean that the sensor is completely powered off, but it may also mean
> that it is already streaming data. I don't know how the CSI-2 receiver
> state machine will operate in the first case, but in the second case it
> will not be able to synchronise to the incoming stream, so it won't work
> anyway.
> 
> I think you should instead fix the problem in the sensor driver, as you
> hinted. 

Sure, we all agree that the sensor fix is the right solution.

> Relaxing the requirement here will only make it more confusing,
> it's a hack, and isn't portable across CSI-2 receivers. 

We can emit a warning as suggested by Philipp, stating that the sensor
is buggy and needs fixing.

> The same buggy
> sensor driver won't work with other CSI-2 receivers whose internal state
> machine require starting in the LP-11 state.
> 

Right. But the same buggy sensor driver probaly does work already with other
CSI-2 receivers, hence why it hasn't been detected when it was submitted.

> Which sensor are you using ?
> 

I noticed this problem on OV5645 on a Wandoboard. Looks to be
basically the same issue as the one Jacopo fixed here:

Author: Jacopo Mondi <jacopo@jmondi.org>
Date:   Fri Jul 6 05:51:52 2018 -0400

    media: ov5640: Re-work MIPI startup sequence

I fixed it for OV5645 (and will submit soon), but that is
not the point.

The point is that buggy drivers exist, and while I'd love
to fix them all, it won't be always possible (due to lack of
datasheets, and due to some of these sensors having no active
maintainer).

Without this commit, such a buggy sensor will not work for sure;
while with the commit, there is a chance it will work.

Why would we prevent the latter from happening?

Thanks,
Eze

