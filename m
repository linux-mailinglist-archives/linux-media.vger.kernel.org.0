Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA34A918A1
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2019 20:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfHRSGG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Aug 2019 14:06:06 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44876 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbfHRSGG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Aug 2019 14:06:06 -0400
Received: by mail-pg1-f194.google.com with SMTP id i18so5551387pgl.11;
        Sun, 18 Aug 2019 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KoFYGqM6Xclsd27/smLN8/exw0zz59nAWxnbzaaspPA=;
        b=iDdCHbmtRQ8Pztw9R5H28RB2AbDmZD7WPontfKyeFJGZ1WE1640ZFfVcpV0PD8E3cX
         XdAyVtQUIungyDngmkyeo5kgrwI1hpjCEueI2mfQ7Y8HjV8UByFsOuMMh8k3WtNGQqYj
         qLNzLVUBtb51pFfwb44Y42DvjWF2ydZXK/aKrRuEKV3+2eVn6Zq6QMmyxVOzcjz+6386
         xWuy6tCIrja2oG2gXoVXh5V3o89tkMexp2zQOD2mB5fGJp4Kfts8L/ViDhiINzd+aLxz
         UXPdcNiRGXjyIvpl7m+QtIXI8tHEBmUOJmjwGSg/BzLS8HMBkvJKlNBi8DtiK6h4Yfgv
         szDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KoFYGqM6Xclsd27/smLN8/exw0zz59nAWxnbzaaspPA=;
        b=cT1yzOUfCPdhuHzFZmJmuYxsJHQfOUtIXb/K1PERsSLJEn0HCv2EvIxggDaqf90/C8
         2/y0q7OcW1hAvEotfiE+Moj9z8oaolTgWYStaxTzyuUONhP0JwgyfFxCjmdtdKB6ZxSL
         c8ZijV/3ShnHTUheulNZU3zYQUuvve0AyhgbfwWj4nKEn9V/vy6LRo0QvnytJeP3w5sy
         NN5Prn/GzkW5jzJg7O5F+hkpYpSZZs/UDAKPXQCCNemyWWfTTgrliY09uUyAKy3ngIm4
         drRhF68bsQOgGq2NyJTbOF1ZsQOfB5hbG4c+lLXGMREfvYqVqAV+rJyWhoVkS65cTF3s
         qPAA==
X-Gm-Message-State: APjAAAWZ4CcraR1vVttMannyfc16iuDzQ/No5Q1daNH9NztR7dqC8cLr
        3HURJ5f+eFSAWRtympYxbPM=
X-Google-Smtp-Source: APXvYqxMGgYzFsoJzSt06l1qcfCVphHMaarquycLPP0x0CO/AugzXKjgYJD9y7NE5wAo4u10+bL+gA==
X-Received: by 2002:a17:90b:8ce:: with SMTP id ds14mr7981035pjb.105.1566151565354;
        Sun, 18 Aug 2019 11:06:05 -0700 (PDT)
Received: from bharath12345-Inspiron-5559 ([103.110.42.34])
        by smtp.gmail.com with ESMTPSA id y188sm13950162pfb.115.2019.08.18.11.06.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Aug 2019 11:06:04 -0700 (PDT)
Date:   Sun, 18 Aug 2019 23:35:59 +0530
From:   Bharath Vedartham <linux.bhar@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Fix memory leak in dma_buf_set_name
Message-ID: <20190818180559.GB6635@bharath12345-Inspiron-5559>
References: <1565978422-9661-1-git-send-email-linux.bhar@gmail.com>
 <43d7adfb9ae9d25fc7c6093d3119c62f742df2cb.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43d7adfb9ae9d25fc7c6093d3119c62f742df2cb.camel@collabora.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 16, 2019 at 05:14:24PM -0300, Ezequiel Garcia wrote:
> Hi Bharath,
> 
> Thanks for taking the time to try to fix this report.
> 
> However, this doesn't look right.
> 
> On Fri, 2019-08-16 at 23:30 +0530, Bharath Vedartham wrote:
> > This patch fixes a memory leak bug reported by syzbot. Link to the
> > bug is given at [1].
> > 
> > A local variable name is used to hold the copied user buffer string
> > using strndup_user. strndup_user allocates memory using
> > kmalloc_track_caller in memdup_user. This kmalloc allocation needs to be
> > followed by a kfree.
> > 
> > This patch has been tested by a compile test.
> > 
> > [1] https://syzkaller.appspot.com/bug?id=ce692a3aa13e00e335e090be7846c6eb60ddff7a
> > 
> > Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
> > Signed-off-by: Bharath Vedartham <linux.bhar@gmail.com>
> > ---
> >  drivers/dma-buf/dma-buf.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index f45bfb2..9798f6d 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -342,6 +342,7 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
> >  	}
> >  	kfree(dmabuf->name);
> >  	dmabuf->name = name;
> > +	kfree(name);
> >  
> 
> Just by looking at this, you can deduce something is not right.
> You are assigning "name" to dmabuf->name, but then releasing "name"!
> 
> So now, dmabuf->name has free memory, which will lead to
> user-after-free issues.
> 
> Note also, that this function doesn't look leaky since the previous
> "name" is freed, before setting a new one.
> 
> Maybe the syzbot report is some kind of false positive?
> 
> Also, I _strongly_ suggest that in the future you don't compile-test
> only these kind of not trivial fixes. Since you are touching a crucial
> part of the kernel here, you should really be testing properly.
> 
> Specially since syzbot produces a reproducer.
> 
> Consider compile test as something you do when your changes are
> only cosmetic, and you are completely and absolutely sure things
> will be OK.
> 
> Thanks.
> Ezequiel

Hi Ezequiel,

Thank you for taking the time to review this.

I made a mistake here and thank you for notifying me of it.

Thank you for your comments, I ll keep them in mind before sending
patches to the kernel :)

Thank you
Bharath
