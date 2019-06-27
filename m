Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A9B58A26
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfF0Spd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:45:33 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48070 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfF0Spd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:45:33 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4BDF126D296
Message-ID: <143cb82ff2ff5c5f389109def45ee47b9ad076d8.camel@collabora.com>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Thu, 27 Jun 2019 15:45:24 -0300
In-Reply-To: <1561640172.4216.16.camel@pengutronix.de>
References: <20190625203945.28081-1-ezequiel@collabora.com>
         <1561535121.4870.1.camel@pengutronix.de>
         <CAOMZO5Be-5Em0DR5nCBfzsW4mKMz6ThF+kSukcG6WuFF-0vwaQ@mail.gmail.com>
         <3797cdd2-f6c8-f23d-788c-b8efc3e75b21@gmail.com>
         <CAOMZO5AGZcsrzogzxRo9UNauYgWZLdiVE8vJ3-FxU2X4K8Jwxg@mail.gmail.com>
         <ba0f4a0f-cb61-6c5b-1db9-21536ae38c6f@gmail.com>
         <1561624997.4216.11.camel@pengutronix.de>
         <CAOMZO5D1Lq7MuK55hydP3JNGki71iNeubzfUgAvVhEDuzDcZFA@mail.gmail.com>
         <1561640172.4216.16.camel@pengutronix.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-06-27 at 14:56 +0200, Philipp Zabel wrote:
> Hi Fabio,
> 
> On Thu, 2019-06-27 at 09:38 -0300, Fabio Estevam wrote:
> > Hi Philipp,
> > 
> > On Thu, Jun 27, 2019 at 5:43 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > 
> > > Are there any visual artifacts in the first frame(s) in this case?
> > 
> > I do not observe visual artifacts when running gst-launch-1.0 v4l2src ! kmssink
> > 
> > > > So in my opinion the next version of this patch should make LP-11
> > > > timeout a warning only, but keep the error return on clock lane timeouts.
> > > 
> > > I agree.
> > 
> > Here is a reworked version of Ezequiel's patch as per the suggestions:
> > http://code.bulix.org/g5qap5-780475
> > 
> > Does this one look good?
> 
> Limiting the change to wait_stopstate is fine, the actual message
> makes assumptions that could be misleading. How about:
> 
> "Timeout waiting for LP-11 state on all active lanes.
>  This is most likely caused by a bug in the sensor driver.
>  Capture might fail or contain visual artifacts."
> 
> I'd like to keep the phy_state register output though, if only as
> dev_dbg(). It contains useful output for debugging, for example if only
> some of the lanes are in stop state, which could indicate an issue with
> connections or lane configuration.
> 
> 

I think Philipp's suggestions looks very good, both the text and keeping
the phy state. I think both should be kept in the warning.

Fabio: feel free to submit a v2, or let me know so I'll add it to my TODO.

Thanks,
Eze

