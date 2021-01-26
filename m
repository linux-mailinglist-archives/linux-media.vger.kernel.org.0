Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB9530471E
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 19:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388943AbhAZRNt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 12:13:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:57922 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732192AbhAZHqw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 02:46:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611647166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sclFdaQ03I3Wj1BfIgcRXa++uN5iqi+uLmb3/BSy0Xo=;
        b=rhXj1XLrDj0dRNgd4ypLcq9/hv8eubJvpBYMLez9brkfq38WCbiT8FXYp6+GEauwYl/Dv6
        ejfDLQgsH+lH4KxopIdumCDTifQ5pSpkQYntAax/V2xWky70ZnSYzQJOvLMcijz+uSkzKC
        ZZp4sRmBlMkoisaR+4UwxIVwS8UUMjg=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5633BAE1F;
        Tue, 26 Jan 2021 07:46:06 +0000 (UTC)
Date:   Tue, 26 Jan 2021 08:46:05 +0100
From:   Michal Hocko <mhocko@suse.com>
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, hyesoo.yu@samsung.com,
        david@redhat.com, surenb@google.com, pullip.cho@samsung.com,
        joaodias@google.com, hridya@google.com, john.stultz@linaro.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <20210126074605.GB827@dhcp22.suse.cz>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-5-minchan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121175502.274391-5-minchan@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 21-01-21 09:55:02, Minchan Kim wrote:
> From: Hyesoo Yu <hyesoo.yu@samsung.com>
> 
> This patch supports chunk heap that allocates the buffers that
> arranged into a list a fixed size chunks taken from CMA.
> 
> The chunk heap driver is bound directly to a reserved_memory
> node by following Rob Herring's suggestion in [1].
> 
> [1] https://lore.kernel.org/lkml/20191025225009.50305-2-john.stultz@linaro.org/T/#m3dc63acd33fea269a584f43bb799a876f0b2b45d

Who is using this allocator in the kernel?
-- 
Michal Hocko
SUSE Labs
