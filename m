Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB34202FC7
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 08:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731299AbgFVGea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 02:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731248AbgFVGe3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 02:34:29 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A12C061794
        for <linux-media@vger.kernel.org>; Sun, 21 Jun 2020 23:34:28 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id s13so12192728otd.7
        for <linux-media@vger.kernel.org>; Sun, 21 Jun 2020 23:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fA+O46nAmMQU+XrEe2RpDVyUBd8QOlVEvixhrlksQsk=;
        b=b9/LB+2uOPC2C+s6xNSxYSTXptcjEphcExsNN+CkhnNfNoRXsHKjNJYc3YIrGGzPDH
         ++YxJtnCQUmP3PD/YQoMg/BlUCiy2n33EYzQBEfkxbebiB4hcx+BikkxstWpvr+y3jeX
         qgY4neCyplc7bi0sc+Gdk8vAKpmLkwwstm8khaq3fbVVb7HDadQ1Q458wU68MPQxzS/Z
         sKdhLfpy4uFaJz0QHpn96Y+zk/5kQNrBiA9YhzfBvyyxrYtyVmgmVok3dFllvH+gkabs
         KUE7uG1jIz+vpHmlB+wXVLblZD793pLEMsMXUA69TEoyqALcnB7iSbmSmSPNwdOOR0j+
         bmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fA+O46nAmMQU+XrEe2RpDVyUBd8QOlVEvixhrlksQsk=;
        b=OTpyHqsorIFvoUVgMoU1ln7vZatLuImKJgtxj1Am6kIpQaTx0xUVXKiu2QwlCSHJcv
         TJLZbJfcnl8GRqYovoX5oZvxupq6zNKVsA4gNcHTb/5VUgnZmkXHeJI8vmdkSJbkoPgZ
         fcwLv57uYAy5XyZlKzqV6e9liJz7traSu0MiUSTxBLltVWfmeF8vqDBSfkeX92KPNkAr
         f4BAZ1lSoAwsO87yOaxp6jF7NvNS2J5Gx2MFo6NQm+nyfQ0jqt9ou9wfkZNGu7Zq0ZGz
         2oRKjgPuckrPd+46GIv09HrmSfJTVtShff9HebU9oKG6XfDS+ImHCqMT3RI38GY4IlnO
         YqWw==
X-Gm-Message-State: AOAM532X5vEzYQ3tktyxW1WITMWNo/OEiUrVlN4FR1Rd3v/rL2Ftb4yx
        +EFjFtGPduZaey4duBDRr7O1MveVgQb1ywTePF8vrQ==
X-Google-Smtp-Source: ABdhPJxjGYyJCmNve/9hcTZprbdLfZ54EQVt63NfNc2V6+/VXUjw/7gvzl9rJpUsQ+QN/VfX1wCUG1xliQmhzsSqEsY=
X-Received: by 2002:a9d:64da:: with SMTP id n26mr7434635otl.36.1592807667489;
 Sun, 21 Jun 2020 23:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200611114418.19852-1-sumit.semwal@linaro.org> <59f0062d-5ca9-84f1-ba92-c3463ff0e73d@codeaurora.org>
In-Reply-To: <59f0062d-5ca9-84f1-ba92-c3463ff0e73d@codeaurora.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Mon, 22 Jun 2020 12:04:16 +0530
Message-ID: <CAO_48GHRf0AHTVFhroVe4O=+QVeHKNfKNwAf+5ioYyi1h7+Hsw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move dma_buf_release() from fops to dentry_ops
To:     Charan Teja Kalla <charante@codeaurora.org>
Cc:     "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Chenbo Feng <fengc@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com,
        "# 3.4.x" <stable@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Charan,

On Tue, 16 Jun 2020 at 19:13, Charan Teja Kalla <charante@codeaurora.org> wrote:
>
> Thanks Sumit for the fix.
>
> On 6/11/2020 5:14 PM, Sumit Semwal wrote:
> > Charan Teja reported a 'use-after-free' in dmabuffs_dname [1], which
> > happens if the dma_buf_release() is called while the userspace is
> > accessing the dma_buf pseudo fs's dmabuffs_dname() in another process,
> > and dma_buf_release() releases the dmabuf object when the last reference
> > to the struct file goes away.
> >
> > I discussed with Arnd Bergmann, and he suggested that rather than tying
> > the dma_buf_release() to the file_operations' release(), we can tie it to
> > the dentry_operations' d_release(), which will be called when the last ref
> > to the dentry is removed.
> >
> > The path exercised by __fput() calls f_op->release() first, and then calls
> > dput, which eventually calls d_op->d_release().
> >
> > In the 'normal' case, when no userspace access is happening via dma_buf
> > pseudo fs, there should be exactly one fd, file, dentry and inode, so
> > closing the fd will kill of everything right away.
> >
> > In the presented case, the dentry's d_release() will be called only when
> > the dentry's last ref is released.
> >
> > Therefore, lets move dma_buf_release() from fops->release() to
> > d_ops->d_release()
> >
> > Many thanks to Arnd for his FS insights :)
> >
> > [1]: https://lore.kernel.org/patchwork/patch/1238278/
> >
> > Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
> > Reported-by: syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com
> > Cc: <stable@vger.kernel.org> [5.3+]
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Reported-by: Charan Teja Reddy <charante@codeaurora.org>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> >
>
> Tested this patch for Android running on Snapdragon hardware and see no
> issues.
> Tested-by: Charan Teja Reddy <charante@codeaurora.org>
Thanks for your tested-by, appreciate it!

Chris,
any luck with your CI to test if this also helps your
dma_buf_release() bug that you guys have seen?

If you've not been able to test, and there are no more objections by
EOD today, I will merge this to the drm-misc-fixes branch.

>
> > ---
> > v2: per Arnd: Moved dma_buf_release() above to avoid forward declaration;
> >      removed dentry_ops check.
> > ---

<snip>
Best,
Sumit.
