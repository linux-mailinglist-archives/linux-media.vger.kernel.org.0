Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27EC40AC3E
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 13:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbhINLND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 07:13:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53008 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbhINLND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 07:13:03 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3C042A5;
        Tue, 14 Sep 2021 13:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631617904;
        bh=UVN9Czt4d3zRJH4FreSTQyVzvDmfnJhgwAWZq7jgpak=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ir49+m105z1jz+jtGji8tsAqWQZ8kgxHOFeV7vW3ytIHrvOU2IzjHw58VO4/UNxu+
         lIOsD8oGDBYhTPM01llE3XGSal0gIdRzQ6loCzgMS4e37f+38xDpUvlMovjblgVpDW
         A3sCb3MMKNHeEYv1m+wh50lSeuiIqwZI6gF1G9ME=
Date:   Tue, 14 Sep 2021 14:11:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-staging@lists.linux.dev, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 20/22] staging: media: Add support for the Allwinner A31
 ISP
Message-ID: <YUCDVm4OA3C3Re09@pendragon.ideasonboard.com>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-21-paul.kocialkowski@bootlin.com>
 <20210913083135.v7q7joux2xckat62@gilmour>
 <YUBUUQxBaGUkjzMP@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YUBUUQxBaGUkjzMP@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Tue, Sep 14, 2021 at 09:50:41AM +0200, Paul Kocialkowski wrote:
> On Mon 13 Sep 21, 10:31, Maxime Ripard wrote:
> > On Fri, Sep 10, 2021 at 08:41:45PM +0200, Paul Kocialkowski wrote:
> > > Some Allwinner platforms come with an Image Signal Processor, which
> > > supports various features in order to enhance and transform data
> > > received by image sensors into good-looking pictures. In most cases,
> > > the data is raw bayer, which gets internally converted to RGB and
> > > finally YUV, which is what the hardware produces.
> > > 
> > > This driver supports ISPs that are similar to the A31 ISP, which was
> > > the first standalone ISP found in Allwinner platforms. Simpler ISP
> > > blocks were found in the A10 and A20, where they are tied to a CSI
> > > controller. Newer generations of Allwinner SoCs (starting with the
> > > H6, H616, etc) come with a new camera subsystem and revised ISP.
> > > Even though these previous and next-generation ISPs are somewhat
> > > similar to the A31 ISP, they have enough significant differences to
> > > be out of the scope of this driver.
> > > 
> > > While the ISP supports many features, including 3A and many
> > > enhancement blocks, this implementation is limited to the following:
> > > - V3s (V3/S3) platform support;
> > > - Bayer media bus formats as input;
> > > - Semi-planar YUV (NV12/NV21) as output;
> > > - Debayering with per-component gain and offset configuration;
> > > - 2D noise filtering with configurable coefficients.
> > > 
> > > Since many features are missing from the associated uAPI, the driver
> > > is aimed to integrate staging until all features are properly
> > > described.
> > 
> > We can add new features/interfaces to a !staging driver. Why do you
> > think staging is required?
> 
> This is true for the driver but not so much for the uAPI, so it seems that
> the uAPI must be added to staging in some way. Then I'm not sure it makes sense
> to have a !staging driver that depends on a staging uAPI.
> 
> Besides that, I added it to staging because that's the process that was
> followed by rkisp1, which is a very similar case.

Maxime is right in the sense that uAPI can always be extended, but it
has to be done in a backward-compatible manner, and staging is sometimes
considered as not being covered by the ABI stability requirements of the
kernel. Not everybody agrees on this, but there are clear cases where
userspace really can't expect staging ABIs to be stable (for instance
when the driver doesn't even compile).

I think there's value in having the driver in staging to facilitate
development until we consider the ABI stable, but I'm not entirely sure
if there should be another step taken to mark this ABI is not being
ready yet.

> > > On the technical side, it uses the v4l2 and media controller APIs,
> > > with a video node for capture, a processor subdev and a video node
> > > for parameters submission. A specific uAPI structure and associated
> > > v4l2 meta format are used to configure parameters of the supported
> > > modules.
> > 
> > This meta format needs to be documented
> 
> You're right, there should probably be a pixfmt-meta-sun6i-isp.rst
> documentation file. I guess it should live along in the staging driver
> directory for now and be destaged later.

Can documentation in staging be compiled ? If not I think it can go to
Documentation/

-- 
Regards,

Laurent Pinchart
