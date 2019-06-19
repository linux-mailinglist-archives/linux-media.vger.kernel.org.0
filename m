Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9483C4BBEF
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 16:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbfFSOpF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 10:45:05 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42718 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbfFSOpE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 10:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=2QmJmFe3IBdUY4osXNYAJypH6UhyPcID9zSOw7B/q78=; b=NMNGndtAeTjI+iNhm2ZJjponQ
        Nej1ObgElN7yV99l4Esqat501fUM6L8OaWi2iTKn+aAemKHt74bbj+5XKLDfJ/Lq8dXqmBWlUYGl9
        xkBCvvCSUU6L3e9NWORe2FlgolB4tzm7w8rPScLZWJggTGqRGXBKijdeIBc5Ma17Y9b9GRiM09tAh
        AxtgA0lS4Yz/FXiyvlBq4cYCQB0OpQQlHCW7lLBCNxYZC8uVcujYCPCd2eNPe4K3uOlkrytr+d7pE
        PXqKd9b1ov6zWYofCA/nojLa6NavPD3wpHW94MTl9SXv1arBHTqiZsXInf/JCaRIjkO/zGQ/VlseM
        gFhCN7HWA==;
Received: from 177.133.86.196.dynamic.adsl.gvt.net.br ([177.133.86.196] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hdbpe-0000LT-Tr; Wed, 19 Jun 2019 14:45:03 +0000
Date:   Wed, 19 Jun 2019 11:44:58 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        linux-media@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Mike Isely <isely@pobox.com>,
        LKML <linux-kernel@vger.kernel.org>,
        syzbot <syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com>,
        syzbot <syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com>
Subject: Re: [PATCH] media: pvrusb2: use a different format for warnings
Message-ID: <20190619114458.52474694@coco.lan>
In-Reply-To: <CAAeHK+w9xGtaQ5oSCq-=1YNk_11T2Tz9LKehkL7ZsAz-XwKajw@mail.gmail.com>
References: <b3761c6479a49b60316325ebc22da904e36d4538.1556813333.git.andreyknvl@google.com>
        <20190502163907.GA14995@kroah.com>
        <CAAeHK+w9xGtaQ5oSCq-=1YNk_11T2Tz9LKehkL7ZsAz-XwKajw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 19 Jun 2019 16:30:01 +0200
Andrey Konovalov <andreyknvl@google.com> escreveu:

> On Thu, May 2, 2019 at 6:39 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, May 02, 2019 at 06:09:26PM +0200, Andrey Konovalov wrote:  
> > > When the pvrusb2 driver detects that there's something wrong with the
> > > device, it prints a warning message. Right now those message are
> > > printed in two different formats:
> > >
> > > 1. ***WARNING*** message here
> > > 2. WARNING: message here
> > >
> > > There's an issue with the second format. Syzkaller recognizes it as a
> > > message produced by a WARN_ON(), which is used to indicate a bug in the
> > > kernel. However pvrusb2 prints those warnings to indicate an issue with
> > > the device, not the bug in the kernel.
> > >
> > > This patch changes the pvrusb2 driver to consistently use the first
> > > warning message format. This will unblock syzkaller testing of this
> > > driver.
> > >
> > > Reported-by: syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com
> > > Reported-by: syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com
> > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>  
> >
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>  
> 
> I don't think I see this patch picked up anywhere. Should this fix go
> through the USB or some media tree?

Media drivers go via the media tree. You should notice that we are
currently receiving around 100 patches per week there. It may take
some time for people to review, but the patches are queued at
patchwork, so sooner or later someone will review and apply, if nobody
did it already:

	https://patchwork.linuxtv.org/project/linux-media/list/

That's said, I'm not seeing this patch there:

	https://patchwork.linuxtv.org/project/linux-media/list/?series=&submitter=&state=*&q=pvrusb2&archive=&delegate=

It sounds that, for whatever reason, the patch never arrived
patchwork. Please re-submit it and check if media patchwork got it.

If not, perhaps you just found a bug with patchwork 2.1 :-)
(we upgraded from version 1.0 to 2.1 at the beginning of this
month)
Thanks,
Mauro
