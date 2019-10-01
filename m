Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D70C2D88
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 08:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731665AbfJAGhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 02:37:46 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39110 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJAGhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 02:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1J2bXPCX7WE0H0txEjX0ivUz5quBP90hFeMgyCZKxxo=; b=PBu8CoencaxSyAddpHhtk33O1
        pscNJjIe2M6BHbx5hsP0da5LBziJK9lGdykY1AKQZ+I9oApgaowj8CS7DQHxN2F956cRGedrXzu3k
        Lvv58vkz9vBT6yrNgCDdK+dPResg6761Wm4yLVdYa8I+PpqzTWZ8lVe+RN1as6JstbuhDMKycS6LL
        0OhKiwCi8iCZNM+ifUqrk5ymys1Wo/BipAbs7jyIKFu+giaW9bXDJDZt2bO7a37D2aIHRyHUolSy2
        yVCwZv/mDjrn6oRHhbvCTu1B4oY33aIUdmOBmY2XU/HkNLfUk9rJ9e1tAnd03WE8wCfraM4ssvOCX
        0+rFJHt9w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFBn6-00035m-Fo; Tue, 01 Oct 2019 06:37:44 +0000
Date:   Mon, 30 Sep 2019 23:37:44 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Shik Chen <shik@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, notify@kernel.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Ricky Liang <jcliang@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        lkml <linux-kernel@vger.kernel.org>,
        kieran.bingham@ideasonboard.com, Vlastimil Babka <vbabka@suse.cz>,
        Christoph Lameter <cl@linux.com>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] media: uvcvideo: Use streaming DMA APIs to transfer
 buffers
Message-ID: <20191001063744.GA10402@infradead.org>
References: <20190802131226.123800-1-shik@chromium.org>
 <CANMq1KD3Pth7LNnVqxSesx3kSFte0eR5JqEBETv45s_9_YKWHw@mail.gmail.com>
 <20190930082310.GA1750@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930082310.GA1750@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 30, 2019 at 01:23:10AM -0700, Christoph Hellwig wrote:
> And drivers really have no business looking at the dma mask.  I have
> a plan for dma_alloc_pages API that could replace that cruft, but
> until then please use GFP_KERNEL and let the dma subsystem bounce
> buffer if needed.

Can you try this series:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_pages

and see if it does whay you need for usb?
