Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E95D182D4E
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgCLKTq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:19:46 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35818 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLKTq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
        :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=xfoxJqOJ26a7lwzPGQIADxdTJQgzT4rfzfYe/RpT1Rg=; b=FE/DKRL7ydDmayQrstwx7Edn2T
        ICP4V28DEgZAnyqOwrz63sQL8PyOVAPth60tktJM/OmYGM4GL8HAFHwASwOuunc/jhsehgiJ2Sdk1
        cd5fknuPm6HcjTB2kpG1s/0qpuPhjyJb4IPOoDywlv/R9PMO+tk+P+cmivVFc1nJnOOwTAshVMoNd
        kQcN14MA2x6/DhEkQ2lb3huVbQcVe3oZdG2b4n4jz125IfFSXK98yWCcVwzIFhdpApojKjoSMYXUG
        2xmz2Ht0NycVTMzJew0ryjyFxvWV/08VZkEHVkYeGwbeyyU4Rwpy0HR86OvpVbTI4jYxdVlzu9io/
        SEgouFPQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jCKwJ-0003r2-Gt; Thu, 12 Mar 2020 10:19:43 +0000
Date:   Thu, 12 Mar 2020 03:19:43 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     christian.koenig@amd.com
Cc:     Christoph Hellwig <hch@infradead.org>, David1.Zhou@amd.com,
        jgg@ziepe.ca, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200312101943.GA14618@infradead.org>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 12, 2020 at 11:14:22AM +0100, Christian König wrote:
> > > The page pointer is set to NULL and only the DMA address,
> > > length and offset values are valid.
> > NAK.  The only valid way to fill DMA address in scatterlists is
> > dma_map_sg / dma_map_sg_attr.
> 
> How can we then map PCIe BARs into an scatterlist which are not backed by
> struct pages?

You can't.  scatterlists by definition map memory backed by a struct
page.  If you want to map something else struct scatterlist is the
wrong structure and you need to use something else (which you should
anyway as struct scatterlist is a bad design patter, and the above
is only one of the many issues with it).
