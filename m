Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9928837A0CE
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 09:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhEKH3s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 03:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhEKH3s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 03:29:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB1EC06175F
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 00:28:42 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lgMom-0005Yq-51; Tue, 11 May 2021 09:28:36 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lgMok-0007xy-4w; Tue, 11 May 2021 09:28:34 +0200
Date:   Tue, 11 May 2021 09:28:34 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Yuri Savinykh <s02190703@gse.cs.msu.ru>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: Re: [bug report] media: allegro: possible NULL pointer dereference.
Message-ID: <20210511072834.GC17882@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Yuri Savinykh <s02190703@gse.cs.msu.ru>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
References: <20210508160455.86976-1-s02190703@gse.cs.msu.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210508160455.86976-1-s02190703@gse.cs.msu.ru>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:08:13 up 82 days, 10:32, 91 users,  load average: 0.08, 0.27,
 0.27
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Yuri,

On Sat, 08 May 2021 19:04:55 +0300, Yuri Savinykh wrote:
> At the moment of enabling irq handling:
> 
> 3166     ret = devm_request_threaded_irq(&pdev->dev, irq,
> 3167                     allegro_hardirq,
> 3168                     allegro_irq_thread,
> 3169                     IRQF_SHARED, dev_name(&pdev->dev), dev);
> 
> there is still uninitialized field mbox_status of struct allegro_dev *dev.
> If an interrupt occurs in the interval between the installation of the
> interrupt handler and the initialization of this field, NULL pointer
> dereference happens.
> 
> This field is dereferenced in the handler function without any check:
> 
> 1801 static irqreturn_t allegro_irq_thread(int irq, void *data)
> 1802 {
> 1803     struct allegro_dev *dev = data;
> 1804
> 1805     allegro_mbox_notify(dev->mbox_status);
> 
> 
> and then:
> 
> 752 static void allegro_mbox_notify(struct allegro_mbox *mbox)
> 753 {
> 754     struct allegro_dev *dev = mbox->dev;
> 
> The initialization of the mbox_status field happens asynchronously in
> allegro_fw_callback() via allegro_mcu_hw_init(). 
> 
> Is it guaranteed that an interrupt does not occur in this interval?
> If it is not, is it better to move interrupt handler installation
> after initialization of this field has been completed?

Thanks for the report. The interrupt is triggered by the firmware, which is
only loaded in allegro_fw_callback(), and is enabled only after the
initialization of mbox_status in allegro_mcu_hw_init():

3507	allegro_mcu_enable_interrupts(dev)

The interrupt handler is installed in probe(), because that's where all the
platform information is retrieved. Unfortunately, at that time, the driver is
not able to setup the mailboxes, because the mailbox configuration depends on
the firmware and is only known in allegro_fw_callback().

It might be interesting to tie the interrupt more closely to the mailboxes,
because it is actually only used to notify the driver about mails in the
mailbox, but that's something I have not yet considered worth the effort.

Michael
