Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276CF30D12B
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 03:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbhBCB5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 20:57:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbhBCB5E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 20:57:04 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAC7C0613D6;
        Tue,  2 Feb 2021 17:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=QFRyLZQvy4ORvvMG6SE1r1pZqMndDwp/jNnta/YZPo8=; b=HdDDoWTb8bo9AwL1G5w2J7c9ny
        j9Kua+EMQKkyR33mcx4U6ibju3pWjrJGQa02FxuTrLNz9NBpwLaKOvLfpaXV22U0v1Sx6SUkWumSy
        b+9rFFzl8yXHvy1u97aR2dVMeG2MC+qkdmQoNwdKcSMBjvjrsnZDKdAQVIDt/wtpYp0unwvRLJ4UC
        m86VphVHnSR9fSiWoorXllaHjnU3wmYZU3k5LO7GZD+v1R/y8v3lDqvGEZdCzjy5bU8uc9DjdlI9G
        DG7cOhCNVxr7TcvyPCzO5Topma3ZvmP8uG91WBbYdaAb7AGxYKJLcWJFwRgRGCzQYpYBlutPt9UOz
        c4nNEUFA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l77Ob-00G1Gl-Gl; Wed, 03 Feb 2021 01:55:54 +0000
Date:   Wed, 3 Feb 2021 01:55:53 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     sumit.semwal@linaro.org, akpm@linux-foundation.org,
        hch@infradead.org, lmark@codeaurora.org, labbott@redhat.com,
        Brian.Starkey@arm.com, john.stultz@linaro.org,
        christian.koenig@amd.com, cgoldswo@codeaurora.org,
        orjan.eide@arm.com, robin.murphy@arm.com, jajones@nvidia.com,
        minchan@kernel.org, hridya@google.com, sspatil@google.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return
 of an error
Message-ID: <20210203015553.GX308988@casper.infradead.org>
References: <20210203003134.2422308-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203003134.2422308-1-surenb@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> WARN_ON_ONCE and returning an error. This is to ensure users of the
> vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> and get an indication of an error without panicing the kernel.
> This will help identifying drivers that need to clear VM_PFNMAP before
> using dmabuf system heap which is moving to use vm_insert_page.

NACK.

The system may not _panic_, but it is clearly now _broken_.  The device
doesn't work, and so the system is useless.  You haven't really improved
anything here.  Just bloated the kernel with yet another _ONCE variable
that in a normal system will never ever ever be triggered.
