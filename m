Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961341B2035
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 09:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgDUHqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 03:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgDUHqc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 03:46:32 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A75C061A0F;
        Tue, 21 Apr 2020 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=/OXNbozW3KLxHR+6wT6r83XbqqDsIOVg2wPtGyv5qC4=; b=mMRoC104uMYwG6vg0L71fdPnij
        PgU9CE5qoy3CNIP/Pc5OMJUibQn0OASApH5svN3WUNdTnQebVewSTbMvqVCBqPSyttoGwaP7BidMp
        OXwu7yJiGdBb4B67yV02sTXlRqFrrHKXW8Kc1xjMUmbYQOtzxeVnE+O8vDjPykJ7m9ww0V5BL/qWD
        WBqm54AkKJzo9XcxtEWsuvFA+srIgGxGKpxSB/+7z0IcWuU9tWWG67hq1uZFoJzPHFAMeocThzPrV
        KbJxADBDO3mTiFOq9pIp5o319cDFKmCe3jJbw3cllR96Bo02s56r76H6bN6HL2u9/aIkPMJIO7Y8e
        e7jHjaBw==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jQnbu-0005Os-1F; Tue, 21 Apr 2020 07:46:26 +0000
Date:   Tue, 21 Apr 2020 09:46:20 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Sunyoung Kang" <sy0816.kang@samsung.com>
Cc:     "'Arnd Bergmann'" <arnd@arndb.de>,
        "'Greg Kroah-Hartman'" <gregkh@linuxfoundation.org>,
        "'Hans Verkuil'" <hverkuil-cisco@xs4all.nl>,
        "'Thomas Gleixner'" <tglx@linutronix.de>,
        "'Linux Media Mailing List'" <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
 get_v4l2_buffer32
Message-ID: <20200421094620.3649a219@coco.lan>
In-Reply-To: <046f01d6178d$a7fbc150$f7f343f0$@samsung.com>
References: <CGME20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e@epcas2p4.samsung.com>
        <20200417024543.66785-1-sy0816.kang@samsung.com>
        <20200417083506.GB141762@kroah.com>
        <145301d6152f$6d5b6240$481226c0$@samsung.com>
        <20200418073719.GA2410414@kroah.com>
        <000001d616ac$4ceaf1a0$e6c0d4e0$@samsung.com>
        <CAK8P3a37dAwH=gjUJjJE2061MD3jpqP8p+QkkZj9Ok3WcfH0dg@mail.gmail.com>
        <046f01d6178d$a7fbc150$f7f343f0$@samsung.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sunyoung,

Em Tue, 21 Apr 2020 12:33:42 +0900
"Sunyoung Kang" <sy0816.kang@samsung.com> escreveu:

> Thank you for your detailed guide.
> And I'll look into how to handle the additional information.

Please don't top post. See my comments below.

> 
> Thanks
> Sunyoung
> 
> > -----Original Message-----
> > From: Arnd Bergmann <arnd@arndb.de>
> > Sent: Monday, April 20, 2020 8:23 PM
> > To: Sunyoung Kang <sy0816.kang@samsung.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Mauro Carvalho Chehab
> > <mchehab@kernel.org>; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Thomas
> > Gleixner <tglx@linutronix.de>; Linux Media Mailing List <linux-  
> > media@vger.kernel.org>; linux-kernel@vger.kernel.org  
> > Subject: Re: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
> > get_v4l2_buffer32
> > 
> > On Mon, Apr 20, 2020 at 2:40 AM Sunyoung Kang <sy0816.kang@samsung.com>
> > wrote:  
> > >
> > > I understand what you mean.
> > > However, the way to transmit information about the buffer is only
> > > flags in v4l2_buffer In flags in v4l2_buffer, there is no reserved bit
> > > field that can be used for custom.
> > > Additional information about the buffer is needed to provide various
> > > functions required by the customers but flags is not enough. So
> > > reserved2 is used as an alternative.
> > > Can you suggest a better opinion?  
> > 
> > If you have a driver that needs to pass additional information that is not
> > supported by the subsystem, this is generally either because there is
> > something wrong in the driver, or because there is something wrong in the
> > subsystem.
> > 
> > Whichever is at fault should be fixed. If it's the subsystem, then you
> > should explain why it's wrong and make a suggestion for how to address it,
> > e.g.
> > introducing a new ioctl command or redefining the reserved members to be
> > defined in the way you need.
> > 
> > In any case, the ioctl commands should be driver independent, so that any
> > hardware with the same feature as your driver can work with the same user
> > space.

I guess the problem here is that the driver that Sunyoung is working
is not upstream.

The right approach here is to upstream the driver. Once we see the code,
we can help addressing the issues. This could either involve using some
reserved space at the ioctl for some usage or propose some other solution
that would address your needs.

This has to be discussed case by case, as it is really hard to say what
to do with "additional information that is not supported by the subsystem".
What does that exactly means? We need to see the code to better understand
it ;-)

Thanks,
Mauro
