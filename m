Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76EF1327C75
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 11:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234625AbhCAKnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 05:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234659AbhCAKnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 05:43:04 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF79C061756
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 02:42:23 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 33DEBC6367; Mon,  1 Mar 2021 10:42:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1614595342; bh=w7qQc1rzv326dCVx7SPH0Ozrm/u2I1gwRxRXHEl3S1g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NJuIw+/ymT5bAOnR5drw5hDLaIcN0QISOLhvbMAao4csf10vvSCXIse2atwq4ocoY
         MgtoY+Lbh/4hx4wAWNv+d1Kx4Th7QZP+8JKZhiBG0gQfPOaRQYgQgqrJ92Lt2utDLD
         LnHmfE1oDBncbXOucphI3LxF7rzIBQvxT+v7iaXoEjar3q4fgse9mQlV4F/8OJMVqa
         0B1B5PvssAJA4gmfXMmcWH8Mh+AabIOU8sHLT6M0LTdHgIN40PAZMADNb6PJx0olJW
         5/581k4RVBEsn4t+z3YQBQpaVzQeypULd4GkIlDDQICgLK0WPVqk4423bYGT6k5buH
         gbq7uGt6uUngw==
Date:   Mon, 1 Mar 2021 10:42:22 +0000
From:   Sean Young <sean@mess.org>
To:     Matthias Reichl <hias@horus.com>
Cc:     linux-media@vger.kernel.org,
        Juan =?iso-8859-1?Q?Jes=FAs_Garc=EDa?= de Soria 
        <skandalfo@gmail.com>
Subject: Re: [PATCH 0/6] media: ite-cir driver cleanups
Message-ID: <20210301104221.GA25883@gofer.mess.org>
References: <cover.1613989288.git.sean@mess.org>
 <20210223161307.GB10715@camel2.lan>
 <20210223175001.GA12871@gofer.mess.org>
 <20210223191615.GA9243@lenny.lan>
 <20210224095747.GA22904@gofer.mess.org>
 <20210226135713.GA10226@camel2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226135713.GA10226@camel2.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hias,

On Fri, Feb 26, 2021 at 02:57:13PM +0100, Matthias Reichl wrote:
> On Wed, Feb 24, 2021 at 09:57:47AM +0000, Sean Young wrote:
> > That's a good point, that's probably the way to go. I'll have a look at
> > modifying my eeepc box.
> 
> On a second thought it's probably a bit more involved than just
> connecting an IR photo diode/transistor. CIRRX is a digital input
> and to get acceptable performance we'd also need an AGC circuit
> and a comparator / schmitt-trigger.

Yes, I had been thinking about building something like this.

> It might be easier to just feed a modulated digital signal into CIRRX,
> either from CIRTX or from a RPi running pwm-ir-tx.

That's a great idea, I hadn't thought of that. That's a lot easier!

> > Having said that, if all the hardware out there uses TSOP-type IR
> > receivers, I'm not sure how much use there is having this hooked up in
> > the driver; same for transmit.
> 
> If it's not too much hassle I'd vote for keeping the RX demodulation
> feature in the driver - it's an interesting feature and might come in
> handy at times.

It's kind of interesting, I agree. 

> For TX we need to keep carrier function as CIRTX always transmits
> modulated singals according to the IT8712 datasheet (unmodulated TX
> output would be quite odd, haven't seen that yet).

There are IR signals which are unmodulated. In IRP this would start
with {0k, and there are several of such protocols: Jerrold, Revox for
example:

http://www.hifi-remote.com/wiki/index.php/Revox

I never seen such hardware and I have no idea how well this works in
practise.


Sean
