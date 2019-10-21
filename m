Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99FDBDE706
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 10:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbfJUIsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 04:48:16 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41275 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727227AbfJUIsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 04:48:16 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iMTMN-0004Vh-7y; Mon, 21 Oct 2019 10:48:15 +0200
Message-ID: <be3c6bfe36f74a055e51e5cf723090205dd0df9e.camel@pengutronix.de>
Subject: Re: i.MX6Q + ov5640 CSI-2 Framerate (on 5.4-rc3)
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>, Adam Ford <aford173@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Date:   Mon, 21 Oct 2019 10:48:14 +0200
In-Reply-To: <CAOMZO5C2O59PJAgAvNOVDP3=Nzzyp2fRRUDa2rnY7MbESXRmOA@mail.gmail.com>
References: <CAHCN7xLQkJ=4kh+a9jcMu6DXxET5BHxz6vV1GjHkEq5LcmiiRA@mail.gmail.com>
         <CAOMZO5C2O59PJAgAvNOVDP3=Nzzyp2fRRUDa2rnY7MbESXRmOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam, Fabio,

On Fri, 2019-10-18 at 16:00 -0300, Fabio Estevam wrote:
> Hi Adam,
> 
> Adding Steve and Philipp in case they can help.
> 
> On Tue, Oct 15, 2019 at 1:52 AM Adam Ford <aford173@gmail.com> wrote:
> > I have an i.MX6Q with an ov5640 connected to the mipi-csi2 interface.
> > 
> > I am routing ov5640 -> ipu1_csi0_mux -> ip1_csi0 -> ip1_csi0 capture.
> > 
> > I am trying to go through the steps to attempt to get 60fps at
> > 640x480, but the best I can appear to acheive is 30fps.
> >
> > 
> > v4l2-ctl --all
> > 
> > Streaming Parameters Video Capture:
> >         Capabilities     : timeperframe
> >         Frames per second: 30.000 (30/1)
> >         Read buffers     : 0
> > 
> >  I have tried setting both the ov5640 and the ipu1_csi0 to 1/60 without success.
> > 
> > Can someone tell me if it's even possible on this platform?  When I
> > stream the video to the HDMI monitor, I am only using 3% of the ARM,
> > so I don't think it's processor limited.

That should be possible. The sensor and dual-lane CSI-2 link can support
1920x1080p30 or 1280x720p60, only the driver currently limits 60 fps
capture to 640x480.

The format has to be propagated through the media control graph from the
sensor to the capture device. Since the CSI-2 receiver and multiplexers
are not frame rate aware, the CSI has to be told the correct frame
interval at its input.

What does your configuration look like? I'd expect something like:

media-ctl --set-v4l2 "'ov5640 ?-00??':0[fmt:UYVY8_1X16/640x480@1/60]"
media-ctl --set-v4l2 "'imx6-mipi-csi2':1[fmt:UYVY8_1X16/640x480]"
media-ctl --set-v4l2 "'ipu1_csi0_mux':2[fmt:UYVY8_1X16/640x480]"
media-ctl --set-v4l2 "'ipu1_csi0':0[fmt:UYVY8_1X16/640x480@1/60]"
media-ctl --set-v4l2 "'ipu1_csi0':2[fmt:AYUV32/960x540@1/60]"

What is the output of "media-ctl --print-topology"?

regards
Philipp

