Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2E037A27C
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 10:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhEKIub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 04:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbhEKIua (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 04:50:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0330FC061574
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 01:49:24 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1lgO4r-0006Pw-1j; Tue, 11 May 2021 10:49:17 +0200
Message-ID: <776c6e34877537fb1612a8e37e8ebaeae545bb62.camel@pengutronix.de>
Subject: Re: [bug report] media: allegro: possible NULL pointer dereference.
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Yuri Savinykh <s02190703@gse.cs.msu.ru>
Cc:     ldv-project@linuxtesting.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-media@vger.kernel.org
Date:   Tue, 11 May 2021 10:49:16 +0200
In-Reply-To: <20210511072834.GC17882@pengutronix.de>
References: <20210508160455.86976-1-s02190703@gse.cs.msu.ru>
         <20210511072834.GC17882@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Am Dienstag, dem 11.05.2021 um 09:28 +0200 schrieb Michael Tretter:
> Hello Yuri,
> 
> On Sat, 08 May 2021 19:04:55 +0300, Yuri Savinykh wrote:
> > At the moment of enabling irq handling:
> > 
> > 3166     ret = devm_request_threaded_irq(&pdev->dev, irq,
> > 3167                     allegro_hardirq,
> > 3168                     allegro_irq_thread,
> > 3169                     IRQF_SHARED, dev_name(&pdev->dev), dev);
> > 
> > there is still uninitialized field mbox_status of struct allegro_dev *dev.
> > If an interrupt occurs in the interval between the installation of the
> > interrupt handler and the initialization of this field, NULL pointer
> > dereference happens.
> > 
> > This field is dereferenced in the handler function without any check:
> > 
> > 1801 static irqreturn_t allegro_irq_thread(int irq, void *data)
> > 1802 {
> > 1803     struct allegro_dev *dev = data;
> > 1804
> > 1805     allegro_mbox_notify(dev->mbox_status);
> > 
> > 
> > and then:
> > 
> > 752 static void allegro_mbox_notify(struct allegro_mbox *mbox)
> > 753 {
> > 754     struct allegro_dev *dev = mbox->dev;
> > 
> > The initialization of the mbox_status field happens asynchronously in
> > allegro_fw_callback() via allegro_mcu_hw_init(). 
> > 
> > Is it guaranteed that an interrupt does not occur in this interval?
> > If it is not, is it better to move interrupt handler installation
> > after initialization of this field has been completed?
> 
> Thanks for the report. The interrupt is triggered by the firmware, which is
> only loaded in allegro_fw_callback(), and is enabled only after the
> initialization of mbox_status in allegro_mcu_hw_init():
> 
> 3507	allegro_mcu_enable_interrupts(dev)
> 
> The interrupt handler is installed in probe(), because that's where all the
> platform information is retrieved. Unfortunately, at that time, the driver is
> not able to setup the mailboxes, because the mailbox configuration depends on
> the firmware and is only known in allegro_fw_callback().
> 
> It might be interesting to tie the interrupt more closely to the mailboxes,
> because it is actually only used to notify the driver about mails in the
> mailbox, but that's something I have not yet considered worth the effort.
> 

The interrupt is installed with IRQF_SHARED, so your IRQ handler must
be prepared to be called even if your device did not trigger an IRQ and
even before your initialization is done, as another device on the same
IRQ line might trigger the IRQ. In that case you must at least be able
to return IRQ_NONE from your handler without crashing the kernel.

Regards,
Lucas

