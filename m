Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 773D5CAD7A
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 19:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390332AbfJCRme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 13:42:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52354 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730924AbfJCRmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 13:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=nf/a9nA4bn0QDOAEh3Gtmr3XveoV2qcS349ATkCN8DY=; b=b7R1gJJMOHY2rx1890LyO+KeD
        j8fuNvwP0oW4Sm1dpQwB5Jbu8zLmqoOpj/XL51LiBqaWJXYW22+URM5FLmzDn1hH1f2Slpt1N7xtR
        iFYGLSKGIzENlbQnNXFS5jgC/OB5SoH6RFoB6hliL2b+i92/+DAcUS/40J1DjaxEoKqLud5dcGwcj
        +L9Si9h5LNxUaQACOWqs/z0NhVKqTSt6Rdxgk2zHFwRiV7DmTcAzX3IuuGTT49qE58Rl31kwBtx0V
        gCScwHvoBTeHJajYcAAWKXlbrZSWqHUMB8ggNscNG8FIvxtpunyCxRBrIYKxqt4Ajrwq4j8d6DLL/
        BYEkFJsCg==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iG57W-0005Nu-Ch; Thu, 03 Oct 2019 17:42:30 +0000
Date:   Thu, 3 Oct 2019 14:42:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gon Solo <gonsolo@gmail.com>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003144225.0137bf6c@coco.lan>
In-Reply-To: <20191003162326.GA2727@Limone>
References: <20191002150650.GA4227@gofer.mess.org>
        <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
        <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
        <20191002154922.7f1cfc76@coco.lan>
        <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
        <20191003080539.2b13c03b@coco.lan>
        <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
        <20191003120238.75811da6@coco.lan>
        <20191003160336.GA5125@Limone>
        <20191003130909.01d29b77@coco.lan>
        <20191003162326.GA2727@Limone>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Oct 2019 18:23:26 +0200
Gon Solo <gonsolo@gmail.com> escreveu:

> > No, I mean with the first patch you sent to the ML, with the powerup
> > hack.  
> 
> Boot time:
> 
> [    4.653257] si2168 1-0067: Silicon Labs Si2168-B40 successfully identified
> [    4.653259] si2168 1-0067: firmware version: B 4.0.2
> [    4.653279] usb 2-1: DVB: registering adapter 0 frontend 0 (Silicon Labs Si2168)...
> [    4.653284] dvbdev: dvb_create_media_entity: media entity 'Silicon Labs Si2168' registered.
> ...
> [    4.694785] si2157 2-0063: found a 'Silicon Labs Si2147-A30'
> [    4.694787] si2157 2-0063: Silicon Labs Si2147/2148/2157/2158 successfully attached
> [    4.717814] usb 2-1: dvb_usb_v2: 'Logilink VG0022A' successfully initialized and connected
> [    4.717880] usbcore: registered new interface driver dvb_usb_af9035
> 
> VLC time:
> 
> [  175.490609] si2168 1-0067: downloading firmware from file 'dvb-demod-si2168-b40-01.fw'
> [  176.746585] si2168 1-0067: firmware version: B 4.0.25
> [  176.781570] si2157 2-0063: firmware version: \xff.\xff.255

Weird... it sounds that, after si2168 has its firmware updated, it
starts interfering at si2157. Perhaps there's a bug at si2168 I2C
gate mux logic. Are you using a new Kernel like 5.2?

I guess the best is to enable the debug logs in order to see what's
happening on both cases.

You can enable all debug messages (after loading the modules) with:

	# for i in $(cat /sys/kernel/debug/dynamic_debug/control |grep -E '(si21|af9035)' |cut -d' ' -f 1); do echo "file $i +p" >>/sys/kernel/debug/dynamic_debug/control; done

You could also try to disable the firmware upload at si2168 and see
if the si2157 reads will succeed.


Thanks,
Mauro
