Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1569AFD33F
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 04:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfKODV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 22:21:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:38084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726533AbfKODV5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 22:21:57 -0500
Received: from localhost (unknown [104.132.150.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D03720706;
        Fri, 15 Nov 2019 03:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573788116;
        bh=8/cY/P7mOC5ZWRzkTqP24RnTXXHa15NbkFVIzTSK364=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=JR2qBG/tbs+2u/BVDVXsZprjTey36G9Dh+snSLlcAX1kxtk0l/rMWe3cwt4MlhdCq
         5+ZfbOGgxzp29+cn8YPcISIO/YK4QCO4q0+1cz43bS73NJanBJf/fA8r/Yp3jRS/Yf
         1RbyPZ7FUwo1BaJ36gTF8p0Kq3zbdl2nqTCaTAw0=
Date:   Fri, 15 Nov 2019 11:21:53 +0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bin Liu <b-liu@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Colin Ian King <colin.king@canonical.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 05/13] usb: musb: create debugfs directory under usb
 root
Message-ID: <20191115032153.GC793701@kroah.com>
References: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
 <1573541519-28488-5-git-send-email-chunfeng.yun@mediatek.com>
 <20191112152857.GA5853@uda0271908>
 <20191114032018.GA122287@kroah.com>
 <20191114140234.GB5853@uda0271908>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114140234.GB5853@uda0271908>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 14, 2019 at 08:02:34AM -0600, Bin Liu wrote:
> On Thu, Nov 14, 2019 at 11:20:18AM +0800, Greg Kroah-Hartman wrote:
> > On Tue, Nov 12, 2019 at 09:28:57AM -0600, Bin Liu wrote:
> > > Hi,
> > > 
> > > On Tue, Nov 12, 2019 at 02:51:51PM +0800, Chunfeng Yun wrote:
> > > > Now the USB gadget subsystem can use the USB debugfs root directory,
> > > > so move musb's directory from the root of the debugfs filesystem into
> > > > the root of usb
> > > 
> > > My opinion is this move is unnecessary. I breaks existing debug tools or
> > > documentation which is already published on Internet. 
> > 
> > Having a "root" directory for a single random driver seems like you are
> > making your driver a "very important" thing in the overall scheme of the
> > kernel, right?  What's wrong with using the usb subdirectory like all
> 
> Agree, it wasn't the right thing to do at the first place. But now
> changing it adds support burden, because people very often refer to the
> old information on the internet which no longer matches to the new
> location. Basically, it is a cost of ABI change.

What information says that /sys/kernel/debug/mdev/ is the location for
this?  Is it in-kernel?

> > other USB drivers use (after this patch series is merged)?  That feels
> > like a much more "sane" way to handle the wide-open debugfs namespace.
> 
> Though I commented on this musb patch, my opinion is for this whole
> series, either drop the whole series or apply the whole series.

I've applied all but this one and 2 others that did not build properly.

> > Yes, there are no rules when it comes to debugfs file names and
> > locations, but let's try to be sane please.
> 
> Fine with me. I can still support questions such as "can't open
> /sys/kernel/debug/musb-hdrc.0/testmode: No such file or directory".

What tool looks for that?

thanks,

greg k-h
