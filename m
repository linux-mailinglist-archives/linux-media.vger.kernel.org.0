Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39131307B86
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 17:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbhA1Q5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 11:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbhA1Q5g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 11:57:36 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503ECC061574;
        Thu, 28 Jan 2021 08:56:54 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id t29so4364819pfg.11;
        Thu, 28 Jan 2021 08:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r4OzxVPLRoxlIyBDmEaW5Gd8mifxKGEhoqDq5Ke4XvU=;
        b=cWYHo3RPLvuqgXqLWKeiAeSunxHnmoi2DfEH7VfWjBrdr4Ov0p30EeyqX1jvElHQnw
         jNSQyGAA9JuqxtS7r/yBIqRGkYh4Hk0K1FCGQWL5zTr3XVGVCI5DeMLaDHok9cGwq6gb
         Hmc59AwEsHp2Jopg9yMtO1+5UuVPKtxfCJXQjLK8oBtNxlTNdryepE3oWBlp2i6jHA0z
         UvGIEMfa0JNyEhqkBRVqgjYO+SZ2JRbyym6fdYN3b28c3xihMdvdP2fIHT67esPVS8yZ
         WIhVye57N6ISKGEKHRRU1WNqiyPw1dKC9l3F/0PqD9uuw0XY9fHuP/juCcbhR8IOChuc
         0uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=r4OzxVPLRoxlIyBDmEaW5Gd8mifxKGEhoqDq5Ke4XvU=;
        b=Sv2p2PWTYKWK0s/uBiNW3BStOMPrSXFXEmMd5Aqtr7axb2Ckt/7vxI6Ev95nZX5nDW
         YzAJkXoAOQd90U6Fc1dga6jHFlcOEgQYY0K4hOKBD+toGfrhO6odJDp5k84G8r685OP2
         Xj79qVSN5hFyVWrTHVgeaC0MkLXXi4ATh/wawJ3j6yaWxVU+/aP4RGFbS5WaiyMLMz5G
         4GtoYeiPWoaoejaECDx88wIjqlCMIOoapBuB8LweowUMkeOIIL3Nj93fiZmxljSXg/Ze
         NOy30cVwGlfqrw2/x+jMm6L/c41yMZG15PrSFW2uaoj51DgTYxiEcvzzZh/1Jja+T3w+
         B0Gw==
X-Gm-Message-State: AOAM531fqWA9R/v/A1PIDh3nA9SPxoKKCk1JCEH36FxvNa8gZtolNncl
        DIaFUSKwyjZTO4vdRphVHs4=
X-Google-Smtp-Source: ABdhPJz2IVz9uK0AemB8mpqL5wrFV3zUb5iR4XhPWnwF3rqsqF67H6tg2c8B6kXfDP/+ZKAmd6XYxw==
X-Received: by 2002:a63:ca45:: with SMTP id o5mr459086pgi.48.1611853013879;
        Thu, 28 Jan 2021 08:56:53 -0800 (PST)
Received: from google.com ([2620:15c:211:201:885b:c20e:b832:f82])
        by smtp.gmail.com with ESMTPSA id d133sm6037141pfd.6.2021.01.28.08.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 08:56:52 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Thu, 28 Jan 2021 08:56:50 -0800
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
Message-ID: <YBLs0oJY1PjCqv1q@google.com>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-3-minchan@kernel.org>
 <20210125131200.GG827@dhcp22.suse.cz>
 <YA8dEFSrHBb9muFr@google.com>
 <20210126074449.GA827@dhcp22.suse.cz>
 <YBHQRY8kw8/wjFK8@google.com>
 <YBJtdT5Tf5mRsE9U@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBJtdT5Tf5mRsE9U@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 28, 2021 at 08:53:25AM +0100, Michal Hocko wrote:
> On Wed 27-01-21 12:42:45, Minchan Kim wrote:
> > On Tue, Jan 26, 2021 at 08:44:49AM +0100, Michal Hocko wrote:
> > > On Mon 25-01-21 11:33:36, Minchan Kim wrote:
> > > > On Mon, Jan 25, 2021 at 02:12:00PM +0100, Michal Hocko wrote:
> > > > > On Thu 21-01-21 09:55:00, Minchan Kim wrote:
> > > > > > Contiguous memory allocation can be stalled due to waiting
> > > > > > on page writeback and/or page lock which causes unpredictable
> > > > > > delay. It's a unavoidable cost for the requestor to get *big*
> > > > > > contiguous memory but it's expensive for *small* contiguous
> > > > > > memory(e.g., order-4) because caller could retry the request
> > > > > > in different range where would have easy migratable pages
> > > > > > without stalling.
> > > > > > 
> > > > > > This patch introduce __GFP_NORETRY as compaction gfp_mask in
> > > > > > alloc_contig_range so it will fail fast without blocking
> > > > > > when it encounters pages needed waiting.
> > > > > 
> > > > > I am not against controling how hard this allocator tries with gfp mask
> > > > > but this changelog is rather void on any data and any user.
> > > > > 
> > > > > It is also rather dubious to have retries when then caller says to not
> > > > > retry.
> > > > 
> > > > Since max_tries is 1 with ++tries, it shouldn't retry.
> > > 
> > > OK, I have missed that. This is a tricky code. ASYNC mode should be
> > > completely orthogonal to the retries count. Those are different things.
> > > Page allocator does an explicit bail out based on __GFP_NORETRY. You
> > > should be doing the same.
> > 
> > Before sending next revision, let me check this part again.
> > 
> > I want to use __GFP_NORETRY to indicate "opportunistic-easy-to-fail attempt"
> > and I want to use ASYNC migrate_mode to help the goal.
> > 
> > Do you see the problem?
> 
> No, as I've said. This is a normal NORETRY policy. And ASYNC migration
> is a mere implementation detail you do not have bother your users about.
> This is the semantic view. From the implementation POV it should be the
> gfp mask to drive decisions rather than a random (ASYNC) flag to control
> retries as you did here.

Make sense.

Let me cook next revision.

Thanks for the review, Michal.
