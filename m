Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE159304CC5
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbhAZWzB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395189AbhAZTLD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 14:11:03 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD71C061573;
        Tue, 26 Jan 2021 11:10:23 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id lw17so1722736pjb.0;
        Tue, 26 Jan 2021 11:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/pySoVPj6x2FMVMDC3PwlkUp7Fwc7oRZb5nCpTSbyxQ=;
        b=Kno6Uq1KChTjup+cYxZsCvQQHrWKR+TvGJmKwMtOI7jpjF3oTBKfkjxna4GAaQnzUe
         PyfN4sriJBZGjz+UGvJ23ap8wPDZNDcbGSW1x0bu386315/oa7rPYe4mOOni01Hu+Mb0
         wN9iTOneC4o/FGqSazvRUfiHj4cD9QIPNlv26j7kMA+4vj93pRp+ix8IMpblCuztyp+b
         L2a5nkRL6tzM3I64JhXq5e53tqETri0b6mAt7wHFGjZteY01SB3Js485e6csvtse6dSX
         DWdCyPGkqo8hT56y6ZBKNRHRNbhI7L5q+pQbR5mhexFnjPcoZAnlnme/uuKufbZTupV4
         nikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=/pySoVPj6x2FMVMDC3PwlkUp7Fwc7oRZb5nCpTSbyxQ=;
        b=aB/Ma5Q+Out15FtT6/DbB7w3AQY5vDv1+19+vYO3FP4zwKgT+vlbNjUtW8E5UQmBUO
         SNn+c4RyJewoiwKnSCdJjTVKeUIX4XW2X42ecZjAMSWF6VJ4qJXkwA1FfRENVe52+3g1
         uSIMxVQ22ZfmrFU3uE0voqL/Ikbdb7RYUPgjQ/dRbzvDCMQLNTc5AAhEw//6hLw8XuvF
         4XmPPPco+cHb8K2NBQOHmAZ5unF9BA1vbv+faqJxNbHhsign64Pi4pe30yVULTz1EcEm
         zSeduERGWes+W2jtuhXk9PNshNPLx6QXxtkrbFj9Bce/9lIOyqjo3zTSFhNBITxKFrsM
         dbaw==
X-Gm-Message-State: AOAM531UlybmpaMR1dPiEZlz359bxKgnZjkO10LAD5fw3miJaKb6gHLn
        QElTFfAzG9E1JULld2PHN68=
X-Google-Smtp-Source: ABdhPJwWecYPRIlieWfot1SXaGDWSpfbRFecAz3my6DVfWYKNjOZ1cQl+qt2qR2hJDfOo2isASG1lQ==
X-Received: by 2002:a17:902:9049:b029:da:efd6:4c12 with SMTP id w9-20020a1709029049b02900daefd64c12mr7512150plz.12.1611688222672;
        Tue, 26 Jan 2021 11:10:22 -0800 (PST)
Received: from google.com ([2620:15c:211:201:9dd5:b47b:bb84:dede])
        by smtp.gmail.com with ESMTPSA id v2sm18941836pgs.50.2021.01.26.11.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 11:10:21 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 26 Jan 2021 11:10:18 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Michal Hocko <mhocko@suse.com>
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
Message-ID: <YBBpGji3BJYHidHs@google.com>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-3-minchan@kernel.org>
 <20210125131200.GG827@dhcp22.suse.cz>
 <YA8dEFSrHBb9muFr@google.com>
 <20210126074449.GA827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126074449.GA827@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 26, 2021 at 08:44:49AM +0100, Michal Hocko wrote:
> On Mon 25-01-21 11:33:36, Minchan Kim wrote:
> > On Mon, Jan 25, 2021 at 02:12:00PM +0100, Michal Hocko wrote:
> > > On Thu 21-01-21 09:55:00, Minchan Kim wrote:
> > > > Contiguous memory allocation can be stalled due to waiting
> > > > on page writeback and/or page lock which causes unpredictable
> > > > delay. It's a unavoidable cost for the requestor to get *big*
> > > > contiguous memory but it's expensive for *small* contiguous
> > > > memory(e.g., order-4) because caller could retry the request
> > > > in different range where would have easy migratable pages
> > > > without stalling.
> > > > 
> > > > This patch introduce __GFP_NORETRY as compaction gfp_mask in
> > > > alloc_contig_range so it will fail fast without blocking
> > > > when it encounters pages needed waiting.
> > > 
> > > I am not against controling how hard this allocator tries with gfp mask
> > > but this changelog is rather void on any data and any user.
> > > 
> > > It is also rather dubious to have retries when then caller says to not
> > > retry.
> > 
> > Since max_tries is 1 with ++tries, it shouldn't retry.
> 
> OK, I have missed that. This is a tricky code. ASYNC mode should be
> completely orthogonal to the retries count. Those are different things.
> Page allocator does an explicit bail out based on __GFP_NORETRY. You
> should be doing the same.

A concern with __GFP_NOWAIT is regardless of flags passed to cma_alloc,
internal implementation of alloc_contig_range inside will use blockable
operation. See __alloc_contig_migrate_range.

If we go with __GFP_NOWAIT, we should propagate the gfp_mask inside of
__alloc_contig_migrate_range to make cma_alloc consistent with alloc_pages.
(IIUC, that's what you want - make gfp_mask consistent between cma_alloc
and alloc_pages) but I am worry about the direction will make complicate
situation since cma invovles migration context as well as target page
allocation context. Sometime, the single gfp flag could be trouble
to express both contexts all at once. 

> 
> > > 
> > > Also why didn't you consider GFP_NOWAIT semantic for non blocking mode?
> > 
> > GFP_NOWAIT seems to be low(specific) flags rather than the one I want to
> > express. Even though I said only page writeback/lock in the description,
> > the goal is to avoid costly operations we might find later so such
> > "failfast", I thought GFP_NORETRY would be good fit.
> 
> I suspect you are too focused on implementation details here. Think
> about the indended semantic. Callers of this functionality will not
> think about those (I hope because if they rely on these details then the
> whole thing will become unmaintainable because any change would require
> an audit of all existing users). All you should be caring about is to
> control how expensive the call can be. GFP_NOWAIT is not really low
> level from that POV. It gives you a very lightweight non-sleeping
> attempt to allocate. GFP_NORETRY will give you potentially sleeping but
> an opportunistic-easy-to-fail attempt. And so on. See how that is
> absolutely free of any page writeback or any specific locking.

With above reason I mentioned, I wanted to express __GFP_NORETRY as 
"opportunistic-easy-to-fail attempt" to support cma_alloc as "failfast"
for migration context.

> -- 
> Michal Hocko
> SUSE Labs
