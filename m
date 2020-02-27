Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE255172A4E
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 22:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbgB0ViP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 16:38:15 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42594 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729726AbgB0ViP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 16:38:15 -0500
Received: by mail-oi1-f195.google.com with SMTP id l12so750464oil.9;
        Thu, 27 Feb 2020 13:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MS04y4tC6v0yvFrubQXJfXoPpIt2cXWeU3+olbxgrlI=;
        b=axo31MdcQ0SZroPbHQ++aFLzgIHEwq5vyQmASKUqoegs88CC0tgZu9O7eDyL8J/kNS
         e1U2J0oHIaBaMgApSTJQdFAm65z8sagrmcsRCVbnWAPaBbcn8yDOC3JCYvxixGXmi7uj
         gbo7aZam4fEhNeEwozgiiHliXdQMlC3m2mPzMu9LbVNvwbShUiO6yr0jhSkHw4kD4UGw
         Nd5S+wyxBintX5vg2LowZpAlZmXkXN2i6L+9ktRiGj0Rv/s779IWREgeXVKEX8Dggtle
         tt4VDmhJJRlqW6CbV6UWAWH4hae8IuvRVetpWkkHYOH+p+l5OzxNqp9zfpfOwrVK0pW/
         yvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MS04y4tC6v0yvFrubQXJfXoPpIt2cXWeU3+olbxgrlI=;
        b=CjEhWJaJ52HTdzgnsCvC6LUvOIbUTPOgzop1O9voTwmRNvWFouMbuDJJEYiJ3/0zOJ
         8/ZUfeTMuee4dEG/pNLtJ1e9gxX1p2eoLHOl/5XXs3an/Xyw7hhjS2b6yFDtURBdN/dA
         /EGkI/kNw6Mub6aH/qSnVhrrzd3/lKVds+2Da2F6qB5JqzsTj8mPJDfjuBJ2fxoeVOxS
         Af03doeZPbLyr3is4NGNkq3erLU6U+vL1h4/VG5gucWokQ0xqGveaHfuHuRKre9ff7sk
         HOrT7WVeEpL/hMMHE9vSHh1aXAfhKH37dRY4T6xRqNsSwCSAoYh8iI17s1sKo4SLiaq3
         Lz1A==
X-Gm-Message-State: APjAAAW0vfCxKUnWkjGYZxwVjloe5WgtznR8FpnoTsv2kkYbo86Ybo+C
        Bj/2Benpg7sF3mzR9tS+NW8k71m46aS6bhPYKcI=
X-Google-Smtp-Source: APXvYqxCEKKThcyTyMOksvnHs/9A9wJ38y7/5HmoEZLOVcUi/4u4L0/dM8f0vFH7F8M33vJBdy3wbRzEA8zEi38CXtQ=
X-Received: by 2002:aca:1215:: with SMTP id 21mr842995ois.5.1582839494675;
 Thu, 27 Feb 2020 13:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20200225204446.11378-1-xiyou.wangcong@gmail.com> <20200225175418.2d3af2180cbf895b727ce4b1@linux-foundation.org>
In-Reply-To: <20200225175418.2d3af2180cbf895b727ce4b1@linux-foundation.org>
From:   Cong Wang <xiyou.wangcong@gmail.com>
Date:   Thu, 27 Feb 2020 13:38:03 -0800
Message-ID: <CAM_iQpU7kXXGuxeOVvAGLoBRvjrhpuw2D=ih=PagGXKK-g_muw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        LKML <linux-kernel@vger.kernel.org>,
        linaro-mm-sig@lists.linaro.org,
        syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
        Chenbo Feng <fengc@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 25, 2020 at 5:54 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 25 Feb 2020 12:44:46 -0800 Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> > dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
> > it never gets freed.
> >
> > Free it in dma_buf_release().
> >
> > ...
> >
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -108,6 +108,7 @@ static int dma_buf_release(struct inode *inode, struct file *file)
> >               dma_resv_fini(dmabuf->resv);
> >
> >       module_put(dmabuf->owner);
> > +     kfree(dmabuf->name);
> >       kfree(dmabuf);
> >       return 0;
> >  }
>
> ow.  Is that ioctl privileged?

It looks unprivileged to me, as I don't see capable() called along
the path.

Thanks.
