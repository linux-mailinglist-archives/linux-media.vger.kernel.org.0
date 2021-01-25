Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0801303584
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 06:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388486AbhAZFom (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:44:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:39356 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728695AbhAYNOq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:14:46 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611580439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7zbTf32j7jMLRjz7k4qqgBWOWfbhentXzXq3eH/8LBY=;
        b=mKHBS37s2+sA7ZOhGs+LlrMwEdP9xbrRHfofGjXnCEwGWPMQJGOvfWMLJZDmZvZiUoKvyv
        eT1iJBEWSCj2vzOH3leLbpb5xhbe2WDB6SkG8Cnob9l4DvHge853kBNjKiUZOUQliLjBrL
        xr30V0MqeFAckJNk9sftScYmSQlId2s=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 56D5EAAC6;
        Mon, 25 Jan 2021 13:13:59 +0000 (UTC)
Date:   Mon, 25 Jan 2021 14:13:43 +0100
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
Subject: Re: [PATCH v4 2/4] mm: failfast mode with __GFP_NORETRY in
 alloc_contig_range
Message-ID: <20210125131343.GH827@dhcp22.suse.cz>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-3-minchan@kernel.org>
 <20210125131200.GG827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125131200.GG827@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon 25-01-21 14:12:02, Michal Hocko wrote:
> On Thu 21-01-21 09:55:00, Minchan Kim wrote:
> > Contiguous memory allocation can be stalled due to waiting
> > on page writeback and/or page lock which causes unpredictable
> > delay. It's a unavoidable cost for the requestor to get *big*
> > contiguous memory but it's expensive for *small* contiguous
> > memory(e.g., order-4) because caller could retry the request
> > in different range where would have easy migratable pages
> > without stalling.
> > 
> > This patch introduce __GFP_NORETRY as compaction gfp_mask in
> > alloc_contig_range so it will fail fast without blocking
> > when it encounters pages needed waiting.
> 
> I am not against controling how hard this allocator tries with gfp mask
> but this changelog is rather void on any data and any user.

OK, I can see that a user is in the last patch.

-- 
Michal Hocko
SUSE Labs
