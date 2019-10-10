Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D183D2847
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 13:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733084AbfJJLmZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 07:42:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39704 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfJJLmZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 07:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=uzxYnoeO9th5PZbje/sBiPsvtuK+49seDd9d1KDUDZQ=; b=SAvCTEZNTEei01z9glEp+Tphh
        LuqlgccpL7qGgrBq68NENFcA4+adFSRYIXRgakpUqcYgkTHMw0QtxS56GU2Z9gT46L5bLw+heygUg
        aYEilXemSkBRnNwGEiHGC6PtSxIQO9WTch+6MzsCe2g97MwD5dTRCYaidFD6vId7NRcJqpK8NBC0c
        2VY8KhdqxW7TTbcxBXlz2QSIdM7QjWON98/kP2+mqtWMuBTknhbGt9BVJyjXS/0lQjKgygAUufs3M
        g2ReWFjeDyFkX7BH8ECPrA2zfpqdMCpVw5VeJPaTjQBvVC+sSHoikI40lPGWQjqwOlkpE4K18s7qu
        et5M5t9Rw==;
Received: from 177.205.100.4.dynamic.adsl.gvt.net.br ([177.205.100.4] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iIWps-0004ks-Bv; Thu, 10 Oct 2019 11:42:24 +0000
Date:   Thu, 10 Oct 2019 08:42:20 -0300
From:   Mauro Carvalho Chehab <mchehab@infradead.org>
To:     Gon Solo <gonsolo@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] media: si2168: use bits instead of bool for flags
Message-ID: <20191010084220.1fa8e1fc@coco.lan>
In-Reply-To: <20191010083423.3fff672f@coco.lan>
References: <20191004090855.14e418ed@coco.lan>
        <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
        <20191010105544.GA6507@Limone>
        <20191010083423.3fff672f@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <mchehab@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 10 Oct 2019 08:34:23 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Thu, 10 Oct 2019 12:55:44 +0200
> Gon Solo <gonsolo@gmail.com> escreveu:
> 
> > On Fri, Oct 04, 2019 at 10:15:22AM -0300, Mauro Carvalho Chehab wrote:  
> > > Using bool on struct is not recommended, as it wastes lots of
> > > space. So, instead, let's use bits.    
> > 
> > Wouldn't "bool b:1;" even be better? I performed a little test:

> > Result:
> > 
> > bit_uints: 4
> > bit_bools: 1

> > I know with different types within the struct it looks different, but
> > still.  
> 
> No. In practice, the compiler will add 3 bytes of pad after bit_bools
> (on 32-bit archs), due to performance reasons.

Btw, if you want to test, just add something after the bits, and you'll
see that it will now report the PAD bytes too:

struct bit_uints {
	unsigned int a0:1;
	unsigned int a1:1;
	unsigned int a2:1;
	unsigned int a3:1;
	unsigned int a4:1;
	unsigned int a5:1;
	unsigned int a6:1;
	unsigned int a7:1;

	int i;
};

struct bit_bools {
	bool a0:1;
	bool a1:1;
	bool a2:1;
	bool a3:1;
	bool a4:1;
	bool a5:1;
	bool a6:1;
	bool a7:1;

	int i;
};

bit_uints: 8
bit_bools: 8

Thanks,
Mauro
