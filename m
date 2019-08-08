Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCE986265
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 14:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732682AbfHHMzj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 08:55:39 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60268 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732608AbfHHMzj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 08:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:
        Date:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Eqttg1kFQcCVGk5/3m9yYiVmAlRHVwueCTnWZT/nRDQ=; b=MeR42ABNAY//EfJ8aUcOkhU5H
        5dMt1eFpktyagfP6tCjaaXuvP3kpHR1JofrISgivBI5CZeqwl54f2V4/Y5CRWcR24m+ORJSMVYYhu
        IHXfttIC1FQv6Llq8q9c9CidqvxOWr6yyCbldfNLZAV16FGKT14PRPq1YR/F0K8MNx4V8jwPU+Vlf
        YGy07dd7RmaNjNbzH81Z9XkWT6fAttAZJpjgb7LT0xhVOu5odhEeh+l2Y5PW+FQACF+9Eh5IeVQ4p
        AY7lJCT+PtU5+j46hBQtA4ZRakYFIuJT9xZO9VqKE53q7eiy5aNilQ1vULqZO00267XjuGpKwCT1k
        Zx3HUljqA==;
Received: from [179.162.52.10] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hvhxC-0005dl-RL
        for linux-media@vger.kernel.org; Thu, 08 Aug 2019 12:55:39 +0000
Date:   Thu, 8 Aug 2019 09:55:35 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     linux-media@vger.kernel.org
Subject: Re: [ANN] Media summit in Lisbon at September
Message-ID: <20190808095535.1ec92a1d@coco.lan>
In-Reply-To: <20190801093400.5c351754@coco.lan>
References: <20190630134404.7ba170f0@coco.lan>
        <20190801093400.5c351754@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 1 Aug 2019 09:34:00 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Sun, 30 Jun 2019 13:44:04 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> 
> > Hi all,
> > 
> > We are organizing a media mini-summit in Lisbon to happen in September,
> > at the same week as the Linux Plumber Conference and the Kernel Summit.
> > 
> > We're still discussing the details about that.  
> 
> Gently reminder.
> 
> Right now, we have just one extra theme proposal from Sean:
> 
> 	- possible dvb improvements.
> 
> If we don't have more proposals, we may end skipping the Media
> Summit this year.

It sounds that we won't have material to have a media summit this year.
So, let's cancel the media summit this year.

Regards,
Mauro

> 
> Regards,
> Mauro
> 
> 
> > 
> > In principle, it will be a free event for the ones registered
> > to Linux Plumbers Conference, happening between Sept 9-11.
> > They have a room available that we could use for the meeting on that
> > period of time, but we need to adjust to avoid conflicts with other
> > interesting micro-conferences that will happen in parallel (or
> > eventually do it outside that period, but that would be harder to
> > organize).
> > 
> > I'll let you know more details once we got it.
> > 
> > If you plan to attend, please let me know. It is open for all, but
> > we'll have a limited number of seats. So, the earliest we get the
> > number of interested people, the best.
> > 
> > -
> > 
> > At the last summit, we were supposed to do a Key Signing Party, but
> > we end not doing it, due to lack of time. I suggest we add this again,
> > but doing it earlier, in order to avoid getting out of time for doing
> > it.
> > 
> > From my side, I'd like to discuss what criteria we should adopt for
> > the code that comes via /drivers/staging/media, in particular:
> > how much time should we keep a code there that doesn't receive any
> > patch addressing the drivers real issues (excluding codepatch,
> > cleanups and kAPI changes)?
> > 
> > What other themes should be discussed?
> > 
> > Thanks,
> > Mauro  
> 
> 
> 
> Thanks,
> Mauro



Thanks,
Mauro
