Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003E1322CC5
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 15:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbhBWOt3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 09:49:29 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43834 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbhBWOtX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 09:49:23 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8AFB91F44D4B
Message-ID: <f024535585fe5b248ca8cf7ca95c14ced746f9da.camel@collabora.com>
Subject: Re: [PATCH v3 8/9] dt-bindings: media: nxp,imx8mq-vpu: Update
 bindings
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Rob Herring <robh@kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Peng Fan <peng.fan@nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
Date:   Tue, 23 Feb 2021 11:48:29 -0300
In-Reply-To: <CAL_JsqJGZK2C8mcDiYa4yfKxf4sKykxSQ-Nfr4bi_u_OcAxW_Q@mail.gmail.com>
References: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
         <20210222122406.41782-9-benjamin.gaignard@collabora.com>
         <20210223003442.GA2516123@robh.at.kernel.org>
         <25f30110-d655-2d77-d3b7-30c1c61f6965@collabora.com>
         <CAL_JsqJGZK2C8mcDiYa4yfKxf4sKykxSQ-Nfr4bi_u_OcAxW_Q@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Tue, 2021-02-23 at 08:31 -0600, Rob Herring wrote:
> On Tue, Feb 23, 2021 at 2:04 AM Benjamin Gaignard
> <benjamin.gaignard@collabora.com> wrote:
> > 
> > 
> > Le 23/02/2021 à 01:34, Rob Herring a écrit :
> > > On Mon, Feb 22, 2021 at 01:24:05PM +0100, Benjamin Gaignard wrote:
> > > > The current bindings seem to make the assumption that the
> > > > two VPUs hardware blocks (G1 and G2) are only one set of
> > > > registers.
> > > > After implementing the VPU reset driver and G2 decoder driver
> > > > it shows that all the VPUs are independent and don't need to
> > > > know about the registers of the other blocks.
> > > > Remove from the bindings the need to set all blocks register
> > > > but keep reg-names property because removing it from the driver
> > > > may affect other variants.
> > > > 
> > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > ---
> > > > version 2:
> > > > - be more verbose about why I change the bindings
> > > > Keep in mind that series comes after: https://www.spinics.net/lists/arm-kernel/msg875766.html
> > > > without that review and ack it won't work
> > > Better, but you've still mentioned nothing about breaking compatibility.
> > > Why is that okay?
> > 

Indeed, the commit description should be clearer about breaking compatibility.

> > Because this reg-names wasn't used before for this variant so remove it won't change anything.
> 
> It is the reset changes in the driver that break. The driver
> previously got the 'ctrl' registers whether it went by name or index,
> right? With an old DTB and a kernel with the changes (and vice-versa),
> you'll have nothing to handle the VPU resets because the VPU reset
> node doesn't exist. It could work if the default state is not held in
> reset.
> 
> At least the removal of 'ctrl' registers belongs in the reset changes series.
> 
> 

Considering that FFMPEG patches that are required to support this driver
are still floating around, and GStreamer's implementation is also still
a bit under discussion, we are certain there aren't many upstreams users
(leaving ChromiumOS aside which mostly care for Rockchip variants).

So, given the driver is in staging, and that there aren't users of the
i.MX8MQ G1 variant just yet, I think we are safe breaking the compatibility
(and I'm not taking it lightly).

It would be important to detect an old devicetree and do some pr_warn about
the driver not supporting it.

Thanks,
Ezequiel

