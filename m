Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D049C2AD758
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 14:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgKJNTT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 08:19:19 -0500
Received: from gofer.mess.org ([88.97.38.141]:54381 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgKJNTT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 08:19:19 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 4222BC635E; Tue, 10 Nov 2020 13:19:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1605014358; bh=lyNwtEObWKOMBS7brKl1zyGYkrIQ3CBEX6g43jqvIvg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jt9u7Zt43u7EeWH8oiz/TiwcOT6kdlubZmihi6GdsFM+7LuxhPDdAX6LGmPlR3BX6
         /ie6xK45CUsTQsNvDboOQyaY61Rllpojq74N3ckyOKUNqbM6hssK7S+Ic2oLeDDpNj
         Eicab97Cmg12S5H+JGVRQlDyaxi0teqqQbYLSbx2W7gWuuOKU5Sn38YlvRW3LsKCtY
         MShLSujG/qea5KeAlhQ7oVG2sDmgNlQZNd6sV6Sk7jRGdMiMVy1iHdXRoWMrQE/uBL
         O80Dq8AaA+Xt+LoJQ4YTPPuKO46/vGoC3cgWWpPrkslCBteJ8vvhESuvIc6uly7ixT
         7xbieLYb/mtOQ==
Date:   Tue, 10 Nov 2020 13:19:18 +0000
From:   Sean Young <sean@mess.org>
To:     Michael Klein <michael@fossekall.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH RESEND v2 0/2] media: rc: gpio-ir-recv: add timeout
 property
Message-ID: <20201110131918.GA29219@gofer.mess.org>
References: <cover.1604589023.git.michael@fossekall.de>
 <20201110101727.GA26198@gofer.mess.org>
 <20201110124805.GA29796@a98shuttle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110124805.GA29796@a98shuttle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 10, 2020 at 01:48:05PM +0100, Michael Klein wrote:
> On Tue, Nov 10, 2020 at 10:17:27AM +0000, Sean Young wrote:
> > On Mon, Nov 09, 2020 at 04:23:09PM +0100, Michael Klein wrote:
> > > The default recorder timeout of 125ms is too high for some BPF protocol
> > > decoders when a remote sends repeat codes at high rates. This makes the
> > > timeout configurable via the devicetree.
> > 
> > To be honest, 125ms is too much by any measurement. The longest space
> > in any protocol I'm aware of is 40ms in the sharp ir protocol. I think
> > changing IR_DEFAUL_TIMEOUT to something like 50ms would make sense.
> 
> Seconded. I'm happy to prepare a patch if changing the default value is
> acceptable.

Actually I don't understand why the high timeout is an issue. It means that
between ir messages you don't get a LIRC_TIMEOUT, just a LIRC_SPACE. Why is
this a problem?

I'm not opposed to such a patch, but we would need to know if it really
solves the problem you are having and it would need to sit in linux-next
for some time.

> > Also, when an BPF protocol is loaded, user-space can set the timeout
> > with the LIRC_SET_REC_TIMEOUT ioctl which can depend on the protocol
> > (set to longest space + 10ms error margin).
> 
> Right, although this is a bit cumbersome with current user-space tools. The
> BPF is loaded with ir-keytable, while the recorder timeout needs to be set
> with it-ctl. In the Debian world, those tools are even in different
> packages.

ir-keytable can use the LIRC_SET_REC_TIMEOUT ioctl to adjust the timeout.
It has opened the lirc device already to load the bpf program. ir-keytable
would need to calculate the minimum timeout needed for all enabled protocols
(bpf and non-bpf). Then it can simply do the ioctl.

> > This would mean that the
> > bare minimum timeout can be set, which means decoding is as responsive
> > as can be.
> > 
> > I'm not sure that device tree is really the place for this.
> 
> Not arguing about this, but IMHO no less than for rc-map-name. So this seems
> to be at least consistent.

Well, I guess it can be argued. However, it can also be argued that
it is not the best solution for this problem.


Sean
