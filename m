Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291FC33AF88
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 11:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhCOKEy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 06:04:54 -0400
Received: from verein.lst.de ([213.95.11.211]:53228 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229601AbhCOKE2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 06:04:28 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id E9DD468C65; Mon, 15 Mar 2021 11:04:25 +0100 (CET)
Date:   Mon, 15 Mar 2021 11:04:25 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 6/6] media: uvcvideo: Use dma_alloc_noncontiguous API
Message-ID: <20210315100424.GB3305@lst.de>
References: <20210312235521.1408503-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312235521.1408503-1-ribalda@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks, with all the reviews in I've applied the series to the
dma-mapping tree for 5.13.

This will eventually become a stable baseline branch for the v4l work
and the mips drm driver that needs dma_mmap_pages, but I'd like to wait
a bit for any issues to pop up in linux-next first.
