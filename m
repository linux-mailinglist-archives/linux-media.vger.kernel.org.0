Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDBAC9F15A
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 19:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfH0RT6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 13:19:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52490 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfH0RT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 13:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=AcZ8TTa/Z7i2ggqMHmefB8+XtD6t9Dv1fFBQM4djTKM=; b=r33ojLO3RsfuFZ94p0TTTowkj
        Rz4FQHFphU1mtEIEL2M4unMUdoLoo7w5HgRPYF+/iGXSaUQBtJzfSWmb/PFz5V0Go2NP8D/NnQC02
        Hul1EPmT/gw3/vgOv9iMH1VLp4hyYR+F5On6xp3cIFsMAeQFS6j2B6020Dd5rS81JN6elQKORHQ3p
        OeK26+nhK7VBUrBzVIsl/VtoFnTJ8l4TM1msfrwuLEJKWOto7hmt9f8ze3j9Pik7qFu8iI9hjOI+a
        2GOZtx0dMXzbf0qlxM3v/7lA1rbwtaUmWGZqoufYHukbM2vvxkndMWAFtkr2hGA8maBAjoQ0+k5od
        WO5lZuz6Q==;
Received: from 177.17.135.157.dynamic.adsl.gvt.net.br ([177.17.135.157] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2f8O-0002SL-T2; Tue, 27 Aug 2019 17:19:57 +0000
Date:   Tue, 27 Aug 2019 14:19:52 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Olcay Korkmaz <olcay.krkmz@gmail.com>
Cc:     linux-media@vger.kernel.org, Gregor Jasny <gjasny@googlemail.com>
Subject: Re: bug: dvbv5-scan segfaults
Message-ID: <20190827141952.19d5e3d4@coco.lan>
In-Reply-To: <CADBDwkcPtEWA6nBFGwdQQn5USzxHNvvoczSY8sRBP1hnB6Y7hw@mail.gmail.com>
References: <CADBDwkcKFGLQ_uv4U-gCTXeR09n3uz7dJt3OkufuR_4QsMb0AQ@mail.gmail.com>
        <20190826144014.02e0a85b@coco.lan>
        <CADBDwkdbeRPC9VWYqLUcw-As8d14EqhD3qpdjc4c43s4dS5Nsg@mail.gmail.com>
        <20190827100953.0e8dc268@coco.lan>
        <CADBDwkcPtEWA6nBFGwdQQn5USzxHNvvoczSY8sRBP1hnB6Y7hw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 27 Aug 2019 19:49:41 +0300
Olcay Korkmaz <olcay.krkmz@gmail.com> escreveu:

> > Ok, the problem is happening here:
> >
> > Program received signal SIGSEGV, Segmentation fault.
> > dvb_store_channel (dvb_file=0x7fffffffe460, __p=0x5555555605d0, dvb_scan_handler=0x555555565060, get_detected=0,
> >     get_nit=0) at dvb-file.c:1345
> > 1345                    if (dvb_scan_handler->nit->transport) {
> > (gdb) bt
> > #0  dvb_store_channel (dvb_file=0x7fffffffe460, __p=0x5555555605d0, dvb_scan_handler=0x555555565060, get_detected=0,
> >     get_nit=0) at dvb-file.c:1345
> > #1  0x0000555555556847 in run_scan (dvb=0x5555555604f0, args=0x7fffffffe4b0) at dvbv5-scan.c:313
> > #2  main (argc=<optimized out>, argv=<optimized out>) at dvbv5-scan.c:562
> >
> > The enclosed patch should fix the issue. Could you please check?  
> 
> Thanks, patch fixed the problem.

Great!

Patch applied to master and to stable-1.16 and stable-1.14 branches:

	https://git.linuxtv.org/v4l-utils.git/commit/?h=stable-1.14&id=0622c6d3592efa4817cfba148c64bd034baa2420
	https://git.linuxtv.org/v4l-utils.git/commit/?h=stable-1.16&id=7c0eda007e698c5d2cbfb9fb33bb2472551ec46d
	https://git.linuxtv.org/v4l-utils.git/commit/?id=58edfe080b1442c274c85b98cb6e7374c28695cf

Gregor,

Could you please place them on a next stable release for 1.14 and 1.16?

Thanks,
Mauro
