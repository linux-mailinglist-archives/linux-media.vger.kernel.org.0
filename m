Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3818F26E6DD
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 22:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgIQUnl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 16:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgIQUnl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 16:43:41 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F22C06174A;
        Thu, 17 Sep 2020 13:43:40 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BA277C6366; Thu, 17 Sep 2020 21:43:36 +0100 (BST)
Date:   Thu, 17 Sep 2020 21:43:36 +0100
From:   Sean Young <sean@mess.org>
To:     Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Message-ID: <20200917204336.GA21441@gofer.mess.org>
References: <20200915150202.24165-1-qiangqing.zhang@nxp.com>
 <20200915093342.GA24139@gofer.mess.org>
 <DB8PR04MB6795CB9F519D2BD277654B29E63E0@DB8PR04MB6795.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB8PR04MB6795CB9F519D2BD277654B29E63E0@DB8PR04MB6795.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joakim,

On Thu, Sep 17, 2020 at 09:12:32AM +0000, Joakim Zhang wrote:
> 
> > -----Original Message-----
> > From: Sean Young <sean@mess.org>
> > Sent: 2020年9月15日 17:34
> > To: Joakim Zhang <qiangqing.zhang@nxp.com>
> > Cc: mchehab@kernel.org; linux-media@vger.kernel.org;
> > linux-kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: Re: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
> > system
> > 
> > 
> 
> [...]
> > > @@ -92,6 +113,12 @@ static int gpio_ir_recv_probe(struct
> > > platform_device *pdev)
> > >
> > >  	platform_set_drvdata(pdev, gpio_dev);
> > >
> > > +
> > > +	pm_runtime_set_autosuspend_delay(dev, (rcdev->timeout / 1000 /
> > > +1000));
> > 
> > rcdev->timeout is in microseconds (since very recently), so this is wrong.
> > Also, the timeout can be changed using the LIRC_SET_REC_TIMEOUT ioctl
> > (using ir-ctl -t in userspace). The autosuspend delay should be updated when
> > this happens. This can be done by implementing the s_timeout rcdev function.
> 
> Hi Sean,
> 
> I come across a problem when implementing this feature.
> 
> At probe stage, devm_rc_register_device -> change_protocol, then timeout set to 125ms.
> 
> When echo sony or nec to protocols, will call change_protocol changing the timeout value, that timeout would change to handler->min_timeout + 10ms. For sony is 16000000ns, for 15625000ns.

The sony protocol decoder wants a 6ms space after the last bit. So, the timeout
for the IR receiver can be set to 6ms (plus 10ms margin). This has the
advantage that decoding is happens very quickly. Before this change, there
as a 125ms delay before the first and last IR frame was decoded. This
causes decoding to feel laggy and keys also a bit sticky.

> This is not the way I want to take before, this would frequently disable/enable cpuidle. So is it necessary to provide s_timeout, this callback should be used to change protocols' timeout?
> If implement s_timeout, users need change the timeout value from userspace, this is a mandatory operation and unfriendly. And it will affect protocol's timeout.
> 
> Autosuspend delay should be fixed value, should be set to gpio device timeout value, which is 125ms.

So the idea was that cpuidle is only enabled while IR frames are being
received, that's why I suggested it.

If you set the autosuspend delay to 125ms, then the cpuidle will not be enabled
between IR frames. Maybe this is what you want, but it does mean cpuidle
is totally suspended while anyone is pressing buttons on a remote.

Thanks
Sean

> 
> Best Regards,
> Joakim Zhang
> > > +	pm_runtime_use_autosuspend(dev);
> > > +	pm_runtime_set_suspended(dev);
> > > +	pm_runtime_enable(dev);
> > > +
> > >  	return devm_request_irq(dev, gpio_dev->irq, gpio_ir_recv_irq,
> > >  				IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
> > >  				"gpio-ir-recv-irq", gpio_dev);
