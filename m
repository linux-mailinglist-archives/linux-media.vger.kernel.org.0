Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188D53EC0F9
	for <lists+linux-media@lfdr.de>; Sat, 14 Aug 2021 08:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbhHNGnq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Aug 2021 02:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhHNGnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Aug 2021 02:43:46 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8D8C06175F
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 23:43:18 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id j18so922630ioj.8
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 23:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=la8H+awZEO/kUXwgRGyUq3Pc2CyC1Qyq3xRmdVM3kTw=;
        b=e3Yt53jbmZgDw9RokgJX2KmbC3IgMEa5fJU1PCWkUTy004wKS3a0o90PwxeAwFN5pE
         nQd1NNuFTh7wmC/nnJVZuymnBJ1wbRaCdnqvhipTVrRzY+uqp+dKXoBh/WHNmRDbWX4L
         X5aKGrDw/YEw4BiPliUD06BaDzoBkiEOnUXazjg8+1oz02u6Gw+X/tG79HLIyWiOlJWK
         Uy/0nQJAwaLlakHYgb83xamvmHkwMEyAwPZ8rGbGgC6Er/c/rGHu1FGvx+rwOnjhZ/dr
         foGgEW83dfgf/B/334zGB5tg8wA6CF6BShxKvzde9joO5eKUnlNuJP0Co6FFd6ltlz4a
         FaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=la8H+awZEO/kUXwgRGyUq3Pc2CyC1Qyq3xRmdVM3kTw=;
        b=B4JnA0YbL3BBrgZa6Sp+qQvO8A6mhcd8C6n70WQlvjQqeHXzKPmfHJ5KlolHgRb/TK
         FiPvD2Colk03NPfuasqx2fl/PJJswzWxiJbGCeC2vcrktSKb66O9YIzPfkhvzdaaJ/mx
         b/oJezBMaBtz9mTrvDbZG5bGxwCF9kDcHpLYWVC24IbRK6bAp8TujxIvw1iPZzpirzC8
         eQB6ly/HlHgJAfIvhcyUow2mxaz4RD7FgfZNA69tiLrOOAavWjiBWWn7njlRD5H+UVNo
         YLuKgmIvMYs/fultB/kc+pTWjZpvh3cOHu/XTkFKeukzrdPuVz8W+O5qwTyE/dwfeK2U
         5sOA==
X-Gm-Message-State: AOAM533ZUBBrOO+9+7pP9zP6nNijA4I5/zoACAXRyHbjdb1LXbu3g7W0
        bZHaWAEmi/XppnMtoMJQOmjizYCn/owU20CactaB7Wjha7Q=
X-Google-Smtp-Source: ABdhPJwpM/LtBvcTl9ue/3AwiP2WnWvIlz5Y+/fY/f5r3QR6y4bVz5gTRYyQx6yg0EZj6mnbmo8nCGfOsFoct+bQVh8=
X-Received: by 2002:a05:6602:583:: with SMTP id v3mr4675306iox.91.1628923397600;
 Fri, 13 Aug 2021 23:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAAUSrfF4Wks0TTe=G+uSoksagSo_+S67JAsWJS1PGzvkS3DPmQ@mail.gmail.com>
 <20210813085435.GA28634@gofer.mess.org> <CAAUSrfEJ-ks=zoEWr=SuUtmGPdMS4qaeWivz0r5FXrnbZqhWyQ@mail.gmail.com>
In-Reply-To: <CAAUSrfEJ-ks=zoEWr=SuUtmGPdMS4qaeWivz0r5FXrnbZqhWyQ@mail.gmail.com>
From:   Andrew Goff <goffa72@gmail.com>
Date:   Sat, 14 Aug 2021 16:43:05 +1000
Message-ID: <CAAUSrfEdrSRtDFnGqBv-1f4wd4fWdPP0OVykdXuOVcV5JqM4gA@mail.gmail.com>
Subject: Re: Sony PlayTV Dual Tuner- dvb_usb_dib0700
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Further to below I had been thinking that after a scan sometimes my
system would crash but it seems the usb devices became disabled and
therefore i could not use the mouse or keyboard.
When I do the test remotely I can do further tests, I had not
previously noted the correlation of this behaviour.

After a reboot it is the first scan that causes disabling of the hub,
EMI issue which I don't get on Ubuntu 16.04. Using either adapter0 or
1 creates this error.
Closing the terminal and doing a new scan on either adapter
successfully completes without any further errors.


On Sat, 14 Aug 2021 at 11:10, Andrew Goff <goffa72@gmail.com> wrote:
>
> Hi Sean,
>
> I'll have a go at using bisection.
>
> Attached is the output of dmesg, when I started a scan of adapter1 the
> following occurred -
>
> usb usb1-port1: disabled by hub (EMI?), re-enabling...
>
> and when I closed the terminal window the USB ports re-enabled.
>
>
>
> On Fri, 13 Aug 2021 at 18:54, Sean Young <sean@mess.org> wrote:
> >
> > Hi Andrew,
> >
> > On Fri, Aug 13, 2021 at 10:21:04AM +1000, Andrew Goff wrote:
> > > Hi, I hope this is the right place for posting this.
> > >
> > > I have the above TV tuner / capture device which has been working well
> > > in Ubuntu 16.04. I've decided to update the OS to Ubuntu 20.04 with a
> > > fresh install on a different disk and haven't been able to get this
> > > device working.
> > >
> > > Ubuntu 21.04, 18.04 have also been tested with the same results. On a
> > > fresh install of 16.04 this device works well.
> > >
> > > It seems something has changed between 16.04 (kernel 4.15.0-142) and
> > > 18.04 (kernel 5.4.0-42).
> > >
> > > In /etc/modprobe.d/dvb.conf
> > > # Sony Play TV
> > > options dvb-usb-dib0700 adapter_nr=5,6 force_lna_activation=1
> > >
> > > This has been tested with different variations of the above without success.
> > >
> > > When using w_scan with a file manager open I've noticed if scanning
> > > adapter6 I could see the folder named adapter5 disappear. I then
> > > opened up the adapter6 folder and two of the four files had
> > > disappeared. When the scan finished the files/folder reappeared,
> > > however the device then became unusable.
> > >
> > > 'modinfo dvb_usb_dib0700 | grep depends' yields the following
> > >
> > > For Ubuntu 18.04
> > > depends:
> > > dib7000m,dib9000,dibx000_common,dvb-usb,dib0090,dib0070,dib3000mc,rc-core
> > >
> > > For Ubuntu 16.04
> > > depends:        dib7000m,dvb-usb,dib0090,dib0070,dib3000mc,rc-core
> > >
> > > So something has changed in the driver?
> > >
> > > Please let me know if any further information is required to help fix this.
> >
> > This does sound like a regression, but we'll have to figure out what
> > caused this. First of all, is there any output in dmesg when the device
> > does not work?
> >
> > Secondly, the best way to track this down is using bisection. Is this
> > something you could do? This would be enormously helpful.
> >
> > https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html
> >
> > Thanks,
> >
> > Sean
