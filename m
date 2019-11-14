Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D55DFBE41
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 04:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfKNDUW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 22:20:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:59278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbfKNDUW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 22:20:22 -0500
Received: from localhost (unknown [124.219.31.93])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBE25206F3;
        Thu, 14 Nov 2019 03:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573701621;
        bh=OtP6MQL/9zqWPLBJmcEhDTenHXMX6HLpeiVYH4UmMDE=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=gQLXWXktL91SJAhfZP1kDUlvFwg3yUAhxTlw3gEyBZm+csv1Fe3nn+RAgRYOGy8zH
         MrSA9ov5qkWicZMsu5PnaUDmANrLHTjaP2NrEUP2gsBQBdTLLG9FbXwLZ1HPjT/uxn
         CEEBcRjEjnPcIOLb6WihxH/e2FQ07IVp9PbR/Az4=
Date:   Thu, 14 Nov 2019 11:20:18 +0800
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
Message-ID: <20191114032018.GA122287@kroah.com>
References: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
 <1573541519-28488-5-git-send-email-chunfeng.yun@mediatek.com>
 <20191112152857.GA5853@uda0271908>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112152857.GA5853@uda0271908>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 12, 2019 at 09:28:57AM -0600, Bin Liu wrote:
> Hi,
> 
> On Tue, Nov 12, 2019 at 02:51:51PM +0800, Chunfeng Yun wrote:
> > Now the USB gadget subsystem can use the USB debugfs root directory,
> > so move musb's directory from the root of the debugfs filesystem into
> > the root of usb
> 
> My opinion is this move is unnecessary. I breaks existing debug tools or
> documentation which is already published on Internet. 

Having a "root" directory for a single random driver seems like you are
making your driver a "very important" thing in the overall scheme of the
kernel, right?  What's wrong with using the usb subdirectory like all
other USB drivers use (after this patch series is merged)?  That feels
like a much more "sane" way to handle the wide-open debugfs namespace.

Yes, there are no rules when it comes to debugfs file names and
locations, but let's try to be sane please.

thanks,

greg k-h
