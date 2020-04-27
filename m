Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF7F1BA3CD
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 14:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgD0Msp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 08:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726728AbgD0Mso (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 08:48:44 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00FEC0610D5;
        Mon, 27 Apr 2020 05:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=BKTNTPqPREcmXGT5PW5iYYT+ca/npyb86/7EpHWqKOI=; b=HjDhTg1L1OtdVen2udkp2y9E+U
        aKGOIau3zpYJQaUzLVXoerYxehlPLp4vqyeHkHqrzwBI/fz0Z91RgJUB8OCGAAA+xC4PTaEj5UL8+
        M2EXA8P5hmIeeZZE1pZyfl/xpIIBwe2ygUV2Jc9ymVDb5tpEVyeISjqQEAHcP5VByue/xqLR8oX6B
        PS/SnPaB72CwbGUlsRdtkKs+QUaoavtKt/nvFAkqSGzj4ke6Quc1ao+DfXwrtFebUt/vyBVofuvpr
        JCbBdHCxyx6FP7XIMfq4Z1jZ+lkFTUwoGK515dhxpjoXVW5YyoPxYtdW2jFF5K4sxM1037q6YodDG
        DwSwAlGg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jT3Bg-0008CA-Ju; Mon, 27 Apr 2020 12:48:40 +0000
Date:   Mon, 27 Apr 2020 05:48:40 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Shik Chen <shik@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        notify@kernel.org, Keiichi Watanabe <keiichiw@chromium.org>,
        Ricky Liang <jcliang@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Christoph Lameter <cl@linux.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] media: uvcvideo: Use streaming DMA APIs to transfer
 buffers
Message-ID: <20200427124840.GA30327@infradead.org>
References: <20190802131226.123800-1-shik@chromium.org>
 <CANMq1KD3Pth7LNnVqxSesx3kSFte0eR5JqEBETv45s_9_YKWHw@mail.gmail.com>
 <20190930082310.GA1750@infradead.org>
 <20191001063744.GA10402@infradead.org>
 <CAAFQd5BN63Y-zufQo9_b6kKVX7-1Qf1LwCOKQpMKkQ5KTOf2hw@mail.gmail.com>
 <CAAFQd5A3iazOo+MordCqKk4+5nfSOT-rFu1ypGXF+geRec0aow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5A3iazOo+MordCqKk4+5nfSOT-rFu1ypGXF+geRec0aow@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 21, 2020 at 01:21:15PM +0200, Tomasz Figa wrote:
> On Thu, Feb 27, 2020 at 7:28 AM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > +Sergey Senozhatsky who's going to be looking into this.
> >
> > Hi Christoph,
> >
> > That said, I noticed that you also put a lot of effort into making the
> > NONCONSISTENT attribute more usable. Perhaps that's the way to go here
> > then? Of course we would need to make sure that the attribute is
> > handled properly on ARM and ARM64, which are the most affected
> > platforms. Right now neither handles them. The former doesn't use the
> > generic DMA mapping ops, while the latter does, but doesn't enable a
> > Kconfig option needed to allow generic inconsistent allocations.
> >
> > Any hints would be appreciated.
> 
> Hi Christoph, would you have some time to check the above?
> 
> Hi Catalin, Will, do you know why CONFIG_DMA_NONCOHERENT_CACHE_SYNC is
> not enabled on arm64?

NONCONSISTENT is still a mess, mostly because dma_cache_sync is such
a horrible API.  I've been wanting to switch to the normal
sync_for_device / sync_for_cpu primitives instead.  Let me see if I can
expedite that.
