Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7D012E9F
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 15:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbfECNAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 09:00:44 -0400
Received: from casper.infradead.org ([85.118.1.10]:39726 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfECNAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 09:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6MEVa1w0SfzNggZT1yhSGsoqofztpgHScb8pqA2J/xc=; b=KMupPzGqr6XJK6B/B+tyr0bw9l
        wvIS/wJBLXbrNobMo3ibb0AxL0To886iXvxDHOsg05qYi1y9ofBWv9bCU0Y5V3oPpSZTc7AtoEYY3
        x9R+pu2OyeGjnUN5KCnN/EseLzmo3Ej7UH+S61EAAA3I3xsZv0/EV4qKwiOw0B2n0GKkZlYR9moV7
        7ryrBKlHbNgkzU4dJxcExS69hFFV6A6BAuii3YuhTNdJg0KgKpMCbVWobiV7YkcAJnmm5t90J+jMK
        JeOdnJAkiG982DBiRo/E1pa54/hqF0+KQFBtxQktZ7C0GlqjSKGQcHRdwmcxT0WYzHe0sa2uorKMe
        eseesoYQ==;
Received: from [191.249.111.87] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hMXns-0002v6-Md; Fri, 03 May 2019 13:00:41 +0000
Date:   Fri, 3 May 2019 10:00:36 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     Sean Young <sean@mess.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4l-utils] libdvbv5: leaks and double free in
 dvb_fe_open_fname()
Message-ID: <20190503100036.047693d3@coco.lan>
In-Reply-To: <20190426154917.75adc64a@coco.lan>
References: <20190317163220.1881-1-sean@mess.org>
        <20190426121344.510ef576@coco.lan>
        <20190426124217.55ae71cc@coco.lan>
        <CAJxGH0_bmRiGKCtOf_jFZh_wVsyKR4s1DoDcSvYF7UYx8JNS0g@mail.gmail.com>
        <20190426154917.75adc64a@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

Em Fri, 26 Apr 2019 15:49:17 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Fri, 26 Apr 2019 18:08:22 +0200
> Gregor Jasny <gjasny@googlemail.com> escreveu:
> 
> > Hello,
> > 
> > On Fri, 26 Apr 2019, 17:42 Mauro Carvalho Chehab, <  
> > mchehab+samsung@kernel.org> wrote:    
> >   
> > > Gregor,
> > >
> > > This patch messed with all branches since stable-1.12. I applied the revert
> > > patch already on all affected stable branches.
> > >
> > > We should probably release a new fix for them soon.
> > >
> > > Sorry for not looking this earlier.. I got some vacations earlier
> > > this month.
> > >    
> > 
> > I also got a report in Debian:
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=927341


Are you planning to release a version 1.16.6 any time soon?

I could likely do it as well, but I would prefer if you can do,
as you know better the drills. We're still receiving new
complaints about this issue at Kaffeine's BZ. Just received
another one today.

Thanks,
Mauro
