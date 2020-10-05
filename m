Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B220228375D
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 16:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgJEOJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 10:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgJEOJr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 10:09:47 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9F3C0613CE;
        Mon,  5 Oct 2020 07:09:47 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6A10CC63C3; Mon,  5 Oct 2020 15:09:44 +0100 (BST)
Date:   Mon, 5 Oct 2020 15:09:44 +0100
From:   Sean Young <sean@mess.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Joakim Zhang <qiangqing.zhang@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH V3 1/2] bindings: media: gpio-ir-receiver: add
 linux,autosuspend-period property
Message-ID: <20201005140944.GA8102@gofer.mess.org>
References: <20200922190807.6830-1-qiangqing.zhang@nxp.com>
 <20200922190807.6830-2-qiangqing.zhang@nxp.com>
 <20200929155201.GA665464@bogus>
 <20201003084656.GA29917@gofer.mess.org>
 <CAL_JsqKEqG_Xous_gf=t9LTY8ZGzwcCYNjMDEGt8bA17JUgW-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKEqG_Xous_gf=t9LTY8ZGzwcCYNjMDEGt8bA17JUgW-g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 05, 2020 at 08:36:39AM -0500, Rob Herring wrote:
> On Sat, Oct 3, 2020 at 3:46 AM Sean Young <sean@mess.org> wrote:
> >
> > On Tue, Sep 29, 2020 at 10:52:01AM -0500, Rob Herring wrote:
> > > On Wed, Sep 23, 2020 at 03:08:06AM +0800, Joakim Zhang wrote:
> > > > Add linux,autosuspend-period property for gpio ir receiver. Some cpuidle
> > > > systems wake from idle may take a bit long time, for such case, need
> > > > disable cpuidle temporarily.
> > > >
> > > > Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> > > > ---
> > > > ChangeLogs:
> > > > V1->V2:
> > > >     * New add.
> > > > V2->V3:
> > > >     * linux,autosuspend-period = 125; -> linux,autosuspend-period = <125>;
> > > > ---
> > > >  Documentation/devicetree/bindings/media/gpio-ir-receiver.txt | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> > > > index 58261fb7b408..e1447c9b0e26 100644
> > > > --- a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> > > > +++ b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> > > > @@ -7,6 +7,8 @@ Required properties:
> > > >  Optional properties:
> > > >     - linux,rc-map-name: see rc.txt file in the same
> > > >       directory.
> > > > +        - linux,autosuspend-period: autosuspend delay time,
> > > > +          the unit is milisecond.
> > >
> > > What makes this linux specific?
> >
> > Good point. "linux,autosuspend-period" does not say what is being
> > suspended either. How about "cpuidle-suspend-period" instead?
> 
> 'cpuidle' is a Linuxism. And you also need a unit suffix.
> 
> I'm not clear on how autosuspend which is generally how long a
> peripheral is idle before runtime suspending it relates to this which
> seems to be concerned with cpu wakeup latency. I'm assuming you need
> to wake up within a certain time period to capture GPIO edges. Don't
> you know what this time would be based on IR data rates and can
> provide that constraint to cpuidle?
> 
> Also, we can set autosuspend times from sysfs. Why do you need to do
> this from DT?

This driver collects the timings of the edges on the gpio line, and sends
them to the IR decoders. Waking up the cpu out of cpuidle causes random
delays and therefore timing are off, on some hardware. This setting turns
off cpuidle for a period to prevent these problems.

Note that on this soc cpuidle is causing huge delays, 500 microseconds or so.


Sean
