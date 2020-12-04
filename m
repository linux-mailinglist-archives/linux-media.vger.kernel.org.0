Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E352CEFBD
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 15:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729560AbgLDOdY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 4 Dec 2020 09:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbgLDOdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 09:33:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B19C061A4F
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 06:32:44 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1klC8R-0002pr-W0; Fri, 04 Dec 2020 15:32:35 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1klC8Q-0003Ke-69; Fri, 04 Dec 2020 15:32:34 +0100
Message-ID: <ebaf3126dddf686e1ff07e00c61cd43c07ab07cd.camel@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH v5 07/10] media: Add parsing for APP14 data
 segment in jpeg helpers
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Date:   Fri, 04 Dec 2020 15:32:34 +0100
In-Reply-To: <2bffcb5a2454dfc2188cc11b0f796f965cc7291e.camel@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
         <20201112030557.8540-8-mirela.rabulea@oss.nxp.com>
         <6acf2724130aa2e927cd116ecd216bec3e0321a5.camel@pengutronix.de>
         <2bffcb5a2454dfc2188cc11b0f796f965cc7291e.camel@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-12-04 at 14:13 +0000, Mirela Rabulea (OSS) wrote:
> Hi Phipipp,
>
> On Wed, 2020-12-02 at 16:18 +0100, Philipp Zabel wrote:
> > Hi Mirela,
> > 
> > On Thu, 2020-11-12 at 05:05 +0200, Mirela Rabulea (OSS) wrote:
> > > From: Mirela Rabulea <mirela.rabulea@nxp.com>
> > > 
> > > According to Rec. ITU-T T.872 (06/2012) 6.5.3
> > > APP14 segment is for color encoding, it contains a transform flag,
> > > which
> > > may have values of 0, 1 and 2 and are interpreted as follows:
> > > 0 - CMYK for images that are encoded with four components
> > >   - RGB for images that are encoded with three components
> > > 1 - An image encoded with three components using YCbCr colour
> > > encoding.
> > > 2 - An image encoded with four components using YCCK colour
> > > encoding.
> > > 
> > > This is used in imx-jpeg decoder, to distinguish between
> > > YUV444 and RGB24.
> > > 
> > > Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > > ---
> > > Changes in v5:
> > > This was patch 8 in previous version
> > > Replaced a struct for app14 data with just an int, since the
> > > transform flag is the only meaningfull information from this
> > > segment
> > 
> > Could we turn this into an enum for the transform flag, and include
> > the
> > above spec reference in its kerneldoc comment? I think this would be
> > better than checking for (app14_tf == <magic_number>) in the drivers.
> 
> Appreciate your feedback, for all patches, I'll address it in v6.
> Where would be a better place for this enum, v4l2-jpeg.h, or maybe
> include/uapi/linux/v4l2-controls.h?

v4l2-jpeg.h seems like the right place to me.

regards
Philipp
