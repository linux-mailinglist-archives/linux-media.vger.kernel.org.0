Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E647D1F9341
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 11:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgFOJXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 05:23:41 -0400
Received: from mga04.intel.com ([192.55.52.120]:59763 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728180AbgFOJXl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 05:23:41 -0400
IronPort-SDR: 96UZC6pybax3SJ+bm/PsHqtKhtDSpNEVEpPlw00pSSWy1udd1trB5I41C2+kBjLKYVjR7TxcSx
 L5txOQWaNVcg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 02:23:40 -0700
IronPort-SDR: mQVsomi7LffEkZoTpd8UtdWGviyZT/slEcXqdmbNvCUF7Ue2nv+3YOIrFFRPkPtjTOEwsGXASW
 aaIkavUQ+LZQ==
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="449325773"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 02:23:37 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id B653D20448; Mon, 15 Jun 2020 12:23:05 +0300 (EEST)
Date:   Mon, 15 Jun 2020 12:23:05 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 9/9] media: rcar-csi2: Negotiate data lanes number
Message-ID: <20200615092305.GS16711@paasikivi.fi.intel.com>
References: <20200611161651.264633-1-jacopo+renesas@jmondi.org>
 <20200611161651.264633-10-jacopo+renesas@jmondi.org>
 <20200615083405.GP16711@paasikivi.fi.intel.com>
 <20200615084306.intk7hmrf7qptsx6@uno.localdomain>
 <20200615085335.GR16711@paasikivi.fi.intel.com>
 <20200615091949.65dopovonlzs465l@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615091949.65dopovonlzs465l@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Jun 15, 2020 at 11:19:49AM +0200, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Mon, Jun 15, 2020 at 11:53:35AM +0300, Sakari Ailus wrote:
> > Jacopo,
> >
> > On Mon, Jun 15, 2020 at 10:43:06AM +0200, Jacopo Mondi wrote:
> > > Hi Sakari,
> > >
> > > On Mon, Jun 15, 2020 at 11:34:06AM +0300, Sakari Ailus wrote:
> > > > Hi Jacopo,
> > > >
> > > > On Thu, Jun 11, 2020 at 06:16:51PM +0200, Jacopo Mondi wrote:
> > > > > Use the newly introduced get_mbus_config() subdevice pad operation to
> > > > > retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
> > > > > the number of active data lanes accordingly.
> > > > >
> > > > > In order to be able to call the remote subdevice operation cache the
> > > > > index of the remote pad connected to the single CSI-2 input port.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > ---
> > > > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 61 ++++++++++++++++++++-
> > > > >  1 file changed, 58 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > > index 151e6a90c5fb..11769f004fd8 100644
> > > > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > > @@ -363,6 +363,7 @@ struct rcar_csi2 {
> > > > >  	struct v4l2_async_notifier notifier;
> > > > >  	struct v4l2_async_subdev asd;
> > > > >  	struct v4l2_subdev *remote;
> > > > > +	unsigned int remote_pad;
> > > > >
> > > > >  	struct v4l2_mbus_framefmt mf;
> > > > >
> > > > > @@ -371,6 +372,7 @@ struct rcar_csi2 {
> > > > >
> > > > >  	unsigned short lanes;
> > > > >  	unsigned char lane_swap[4];
> > > > > +	unsigned short active_lanes;
> > > >
> > > > Do you need this? I.e. should you not always request this from the
> > > > transmitter device?
> > >
> > > It's actually the other way around. The receiver queries the
> > > transmitter to know how many data lanes it intends to use and adjusts
> > > its configuration to accommodate it.
> >
> > I think we didn't have a different view on the process. But you basically
> > need this when you're starting streaming, so why is the information stored
> > here?
> >
> 
> Still not sure I got your question, so pardon me if the reply is
> something obvious to you already, and I'm missing the real point.
> 
> But, basically what happens is there at probe time the number of
> 'available' data lanes is parsed from firmware and stored in
> priv->lanes. At stream start time, the remote end gets queried and the
> number of 'active' lanes adjusted according to what it's reported.
> 
> Then, during the whole CSI-2 interface startup process, the number of
> 'active' lanes is used in a few different places (ie.
> rcsi2_wait_phy_start() and rcsi2_calc_mbps()) so I had to store it
> somewhere.
> 
> Now that I wrote that, I realize you might be wondering why a
> parameter that is valid for a single streaming session is stored in
> the main driver structure. This might not be optimal, but the driver
> struct already contains, in example, a v4l2_mbus_framefmt entry which
> is a session specific paramter as well, so I thought it was no harm
> adding the number of active 'lanes' there. Is this what's bothering
> you ?

The frame format is needed there as that's set by the user outside the
s_stream call. The number of active lanes is not needed elsewhere, so
therefore I wouldn't store in the device context either. It can be a local
variable which you may pass to another function.

-- 
Sakari Ailus
