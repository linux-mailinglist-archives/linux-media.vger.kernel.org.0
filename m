Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1375B54E
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 08:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbfGAGsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 02:48:38 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60419 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfGAGsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 02:48:37 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hhq79-0006O2-FT; Mon, 01 Jul 2019 08:48:35 +0200
Message-ID: <1561963713.3753.4.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Mon, 01 Jul 2019 08:48:33 +0200
In-Reply-To: <f5cd9e34-48c3-897a-2ac2-20d442932423@gmail.com>
References: <20190625203945.28081-1-ezequiel@collabora.com>
         <1561535121.4870.1.camel@pengutronix.de>
         <CAOMZO5Be-5Em0DR5nCBfzsW4mKMz6ThF+kSukcG6WuFF-0vwaQ@mail.gmail.com>
         <3797cdd2-f6c8-f23d-788c-b8efc3e75b21@gmail.com>
         <CAOMZO5AGZcsrzogzxRo9UNauYgWZLdiVE8vJ3-FxU2X4K8Jwxg@mail.gmail.com>
         <ba0f4a0f-cb61-6c5b-1db9-21536ae38c6f@gmail.com>
         <1561624997.4216.11.camel@pengutronix.de>
         <CAOMZO5D1Lq7MuK55hydP3JNGki71iNeubzfUgAvVhEDuzDcZFA@mail.gmail.com>
         <1561640172.4216.16.camel@pengutronix.de>
         <f5cd9e34-48c3-897a-2ac2-20d442932423@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-06-27 at 15:12 -0700, Steve Longerbeam wrote:
> 
> On 6/27/19 5:56 AM, Philipp Zabel wrote:
> > Hi Fabio,
> > 
> > On Thu, 2019-06-27 at 09:38 -0300, Fabio Estevam wrote:
> > > Hi Philipp,
> > > 
> > > On Thu, Jun 27, 2019 at 5:43 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > > 
> > > > Are there any visual artifacts in the first frame(s) in this case?
> > > 
> > > I do not observe visual artifacts when running gst-launch-1.0 v4l2src ! kmssink
> > > 
> > > > > So in my opinion the next version of this patch should make LP-11
> > > > > timeout a warning only, but keep the error return on clock lane timeouts.
> > > > 
> > > > I agree.
> > > 
> > > Here is a reworked version of Ezequiel's patch as per the suggestions:
> > > http://code.bulix.org/g5qap5-780475
> > > 
> > > Does this one look good?
> > 
> > Limiting the change to wait_stopstate is fine, the actual message
> > makes assumptions that could be misleading. How about:
> > 
> > "Timeout waiting for LP-11 state on all active lanes.
> >   This is most likely caused by a bug in the sensor driver.
> >   Capture might fail or contain visual artifacts."
> 
> Yes I agree that is more descriptive, if a bit wordy for a kernel error 
> message.

Haha, yes, I remember that thought crossing my mind.

>  I think it could be reduced, something like:
>
> "LP-11 wait timeout on all lanes, likely a sensor driver bug, expect 
> capture failures."

Much better, thanks.

regards
Philipp
