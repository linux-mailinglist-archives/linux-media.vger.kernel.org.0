Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0559C30556D
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 09:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbhA0IQY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 03:16:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:33926 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234741AbhA0IMn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 03:12:43 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611734976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Z+p6bEQorWYXK5ITr6/TxfiZXISXTdaIfax+Bli0jTM=;
        b=hK9GcC93FfxaYov5kx4K6xzL3B587XMGE9MVaPSbYp8agrdlnsozPRW9vO3XkAckUy22zJ
        Hq6hlXnW6cmSOsxpY9D1YDxNmrJGuxDyChCOY0QA9VQWGbTHba8ghsZJTv6M094rFbafjA
        XK4S5ogOg6dqO0a5qm3dlFPBq4PkIVc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1613DB92B;
        Wed, 27 Jan 2021 08:09:36 +0000 (UTC)
Date:   Wed, 27 Jan 2021 09:09:34 +0100
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
Message-ID: <20210127080934.GZ827@dhcp22.suse.cz>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-5-minchan@kernel.org>
 <20210126074605.GB827@dhcp22.suse.cz>
 <YBBssDOJNQ8qq9w1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBBssDOJNQ8qq9w1@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue 26-01-21 11:25:36, Minchan Kim wrote:
> On Tue, Jan 26, 2021 at 08:46:05AM +0100, Michal Hocko wrote:
> > On Thu 21-01-21 09:55:02, Minchan Kim wrote:
> > > From: Hyesoo Yu <hyesoo.yu@samsung.com>
> > > 
> > > This patch supports chunk heap that allocates the buffers that
> > > arranged into a list a fixed size chunks taken from CMA.
> > > 
> > > The chunk heap driver is bound directly to a reserved_memory
> > > node by following Rob Herring's suggestion in [1].
> > > 
> > > [1] https://lore.kernel.org/lkml/20191025225009.50305-2-john.stultz@linaro.org/T/#m3dc63acd33fea269a584f43bb799a876f0b2b45d
> > 
> > Who is using this allocator in the kernel?
> 
> Userspace uses the memory via mapping it via dmabuf.

Ohh, I see. I thought this was an interface to consume in the kernel.
Thanks for the clarification!

-- 
Michal Hocko
SUSE Labs
