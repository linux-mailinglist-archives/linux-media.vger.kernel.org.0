Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 009D3181C50
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 16:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbgCKP2n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 11:28:43 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58870 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729100AbgCKP2m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 11:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
        :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=SIqPqQL4E4jqHkpffGX9pDEDtDuqr9oIINOLiMZ97lI=; b=ENYhknSFl8/K5NlY4EPf9Auvnj
        qUAA16q+DsyWvkT0HMYKNGi+4561WycRIwnqzsgJJdmC9/iermrLG9eGBd9QEyr3+f6v3jMFOgrpy
        bRgs7v4vVxhl3qRg23yI8uUvzXfwIaAvjN7aiUIrSp1JH4A2ghP0lhPa+osE4j8OucHQVr7uXjbZn
        w/76MEQXIegQl51dZ6XWBuHDMIPxt/8wZom9zWExXNSNA6/BO6FcPYEB+3CCow2/X2Zvh2+vkMLRA
        61WI+RVKdlxXNDgPB5a0xK3U4wzmAzm5Q1/GHuzpN5IhcZ/0Pn3YUMi8ZcM+0anqiWN5+3I67Ffd0
        cpVtmnFA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jC3Hi-0006RL-K0; Wed, 11 Mar 2020 15:28:38 +0000
Date:   Wed, 11 Mar 2020 08:28:38 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200311152838.GA24280@infradead.org>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200311135158.3310-2-christian.koenig@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 11, 2020 at 02:51:53PM +0100, Christian König wrote:
> This can be used by drivers to setup P2P DMA between device
> memory which is not backed by struct pages.
> 
> The drivers of the involved devices are responsible for
> setting up and tearing down DMA addresses as necessary
> using dma_map_resource().
> 
> The page pointer is set to NULL and only the DMA address,
> length and offset values are valid.

NAK.  The only valid way to fill DMA address in scatterlists is
dma_map_sg / dma_map_sg_attr.
