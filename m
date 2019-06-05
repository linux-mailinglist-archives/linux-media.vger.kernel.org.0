Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED75C3588C
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 10:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfFEIcM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 04:32:12 -0400
Received: from casper.infradead.org ([85.118.1.10]:36672 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfFEIcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 04:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OCroxZM8M1M4Oh4IQZ3wB5NY2NIvYVrKlyfoNacNGcc=; b=ECS0n4er9p0xeXlPXqo1Qc8xkF
        kvOnp1qwCWErk9Di4nF7H7cWH3kDM1HTEj9/ZHpbW9m2qt+0Qaco9kNxmM5u1JXnqSs/zjAok20ap
        jb1LayPQXepdV3XXg/c8HESGAi3MGsGKPrtSszkNHfslsWpYYzmAywamPxyvJMxJgvvz1aadSnXiu
        g4K1+GIkSzevwyFFUf1Af+IHGEWcZKsnBhu8mH46/2qMwMgz9NzU0FY9tRKgqsJTVUnp0L9hd0Rx7
        FnGOMXpZ/lzPB4fAX+KL1xU8rIG7lOFsSQ2TwiISFszFATUGpoShEMQRc12lNB0RnmyCO62x3UQEX
        FjT6MdRA==;
Received: from [179.182.172.34] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hYRL8-0006md-4m; Wed, 05 Jun 2019 08:32:10 +0000
Date:   Wed, 5 Jun 2019 05:32:06 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     linux-media@vger.kernel.org
Subject: Re: [RFC] Documentation clarifications
Message-ID: <20190605053206.26ab1cf0@coco.lan>
In-Reply-To: <1f9dc1b2-b147-c2e3-19c8-3f46f2ad524e@free.fr>
References: <e9d01085-168f-2cd8-9aef-e8b632489b8e@free.fr>
        <20190604142658.0ea99881@coco.lan>
        <1f9dc1b2-b147-c2e3-19c8-3f46f2ad524e@free.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 5 Jun 2019 10:08:31 +0200
Marc Gonzalez <marc.w.gonzalez@free.fr> escreveu:

> On 04/06/2019 19:26, Mauro Carvalho Chehab wrote:
> 
> > Em Tue, 4 Jun 2019 18:41:44 +0200, Marc Gonzalez escreveu:
> >   
> >> Not sure about these changes, hence the RFC (some are quite trivial)  
> > 
> > Looks ok to me. You should submit it as a patch, though, with your SOB.  
> 
> I thought that since these were trivial changes, and you were the original
> author, you might want to patch them yourself (to keep git "ownership").
> 
> If you prefer that I send a formal patch, I can do that instead.

I prefer to receive it as a formal patch and give you credits for
this :-)

Thanks,
Mauro
