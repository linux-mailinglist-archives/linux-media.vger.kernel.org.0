Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974B037A304
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 11:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhEKJJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 05:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhEKJJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 05:09:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B40C061574
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 02:08:51 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lgONh-0001KM-7G; Tue, 11 May 2021 11:08:45 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lgONg-00066K-Ow; Tue, 11 May 2021 11:08:44 +0200
Date:   Tue, 11 May 2021 11:08:44 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Yuri Savinykh <s02190703@gse.cs.msu.ru>,
        ldv-project@linuxtesting.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-media@vger.kernel.org
Subject: Re: [bug report] media: allegro: possible NULL pointer dereference.
Message-ID: <20210511090844.GD17882@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Yuri Savinykh <s02190703@gse.cs.msu.ru>,
        ldv-project@linuxtesting.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-media@vger.kernel.org
References: <20210508160455.86976-1-s02190703@gse.cs.msu.ru>
 <20210511072834.GC17882@pengutronix.de>
 <776c6e34877537fb1612a8e37e8ebaeae545bb62.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <776c6e34877537fb1612a8e37e8ebaeae545bb62.camel@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:57:51 up 82 days, 12:21, 106 users,  load average: 0.43, 0.72,
 0.52
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lucas,

On Tue, 11 May 2021 10:49:16 +0200, Lucas Stach wrote:
> Am Dienstag, dem 11.05.2021 um 09:28 +0200 schrieb Michael Tretter:
> > On Sat, 08 May 2021 19:04:55 +0300, Yuri Savinykh wrote:
> > > At the moment of enabling irq handling:
> > > 
> > > 3166     ret = devm_request_threaded_irq(&pdev->dev, irq,
> > > 3167                     allegro_hardirq,
> > > 3168                     allegro_irq_thread,
> > > 3169                     IRQF_SHARED, dev_name(&pdev->dev), dev);
> > > 
> > > there is still uninitialized field mbox_status of struct allegro_dev *dev.
> > > If an interrupt occurs in the interval between the installation of the
> > > interrupt handler and the initialization of this field, NULL pointer
> > > dereference happens.
> > > 
> > > This field is dereferenced in the handler function without any check:
> > > 
> > > 1801 static irqreturn_t allegro_irq_thread(int irq, void *data)
> > > 1802 {
> > > 1803     struct allegro_dev *dev = data;
> > > 1804
> > > 1805     allegro_mbox_notify(dev->mbox_status);
> > > 
> > > 
> > > and then:
> > > 
> > > 752 static void allegro_mbox_notify(struct allegro_mbox *mbox)
> > > 753 {
> > > 754     struct allegro_dev *dev = mbox->dev;
> > > 
> > > The initialization of the mbox_status field happens asynchronously in
> > > allegro_fw_callback() via allegro_mcu_hw_init(). 
> > > 
> > > Is it guaranteed that an interrupt does not occur in this interval?
> > > If it is not, is it better to move interrupt handler installation
> > > after initialization of this field has been completed?
> > 
> > Thanks for the report. The interrupt is triggered by the firmware, which is
> > only loaded in allegro_fw_callback(), and is enabled only after the
> > initialization of mbox_status in allegro_mcu_hw_init():
> > 
> > 3507	allegro_mcu_enable_interrupts(dev)
> > 
> > The interrupt handler is installed in probe(), because that's where all the
> > platform information is retrieved. Unfortunately, at that time, the driver is
> > not able to setup the mailboxes, because the mailbox configuration depends on
> > the firmware and is only known in allegro_fw_callback().
> > 
> > It might be interesting to tie the interrupt more closely to the mailboxes,
> > because it is actually only used to notify the driver about mails in the
> > mailbox, but that's something I have not yet considered worth the effort.
> > 
> 
> The interrupt is installed with IRQF_SHARED, so your IRQ handler must
> be prepared to be called even if your device did not trigger an IRQ and
> even before your initialization is done, as another device on the same
> IRQ line might trigger the IRQ. In that case you must at least be able
> to return IRQ_NONE from your handler without crashing the kernel.

The allegro_hardirq() handler already checks the irq status register
(AL5_ITC_CPU_IRQ_STA) for the device and returns IRQ_NONE before even
dispatching the interrupt to the irq thread. In this case, the mailbox is not
read at all.

Michael
