Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C319BFB366
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 16:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbfKMPNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 10:13:47 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38483 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfKMPNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 10:13:46 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iUuKv-0007F5-My; Wed, 13 Nov 2019 16:13:37 +0100
Message-ID: <152f7b2bef85cec9ef107b58ba0bac153fde1379.camel@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH 4/5] media: imx-jpeg: Add V4L2 driver for
 i.MX8 JPEG Encoder/Decoder
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Date:   Wed, 13 Nov 2019 16:13:36 +0100
In-Reply-To: <1573657156.16477.47.camel@nxp.com>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
         <1573053633-21437-5-git-send-email-mirela.rabulea@nxp.com>
         <58ed179388b6f9d6caddd91dc03e411ca714157d.camel@collabora.com>
         <1573657156.16477.47.camel@nxp.com>
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

Hi Ezequiel, Mirela,

On Wed, 2019-11-13 at 14:59 +0000, Mirela Rabulea wrote:
> Hi Ezequiel,
> On Mi, 2019-11-13 at 11:00 -0300, Ezequiel Garcia wrote:
> > + * default configuration stream, 64x64 yuv422
> > > + * split by JPEG marker, so it's easier to modify & use
> > > + */
> > > +static const unsigned char jpeg_soi[] = {0xFF, 0xD8};
> > > +static const unsigned char jpeg_app0[] = {0xFF, 0xE0,
> > I think it's time to re-consider creating some common code
> > for drivers that deal with JPEG parsing. I don't know
> > exactly how this should be done, but it's worth a try.
> > 
> > Having been there, it might sound unfair to request you to
> > take such action. However, someone has to do these kinds
> > of cleanups and improvements, sooner or later, if we want
> > to keep a clean codebase.
> > 
> > Hope this makes sense.
> 
> I agree, it makes sense, at least the jpeg parsing is somehow common
> between these drivers. I'm willing to contribute to this, but I cannot
> make a promise when, and this is something that requires collaboration
> with other contributors who have the means to validate changes on all
> the hardware affected.

I just faced the same issue for the coda-vpu driver [1]. I wonder if my
approach would be usable as a base for i.MX8 JPEGDEC as well. Either
way, I'd like to collaborate on this, but I can't test most of the
drivers either.

[1] https://patchwork.linuxtv.org/patch/60109/

regards
Philipp

