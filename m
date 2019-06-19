Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDB84BB7C
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 16:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbfFSOaO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 10:30:14 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46035 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfFSOaO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 10:30:14 -0400
Received: by mail-pl1-f196.google.com with SMTP id bi6so7299324plb.12
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2019 07:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wbSy2s8b06uYzvj3ndAKYZAduDYOArcZnaIvxvyQgo0=;
        b=cOiq5jfYeEGcgPX22TOVA4gcm3kYgfJ7cH2GXUsJe/DJvO5PzONBTuRUY7rEQ46AIu
         WehGhnrygYSzah/rah+b42PU/kyAp1+moLsufPnxN7nOanZPfksq6271SRXH4IjfZbzM
         FTP6SZ0Pap1GqfpmMF935NYkAmAPC+LZacioNcxjgsidZyQpUyH/t3nqzX8a9vKrTdUE
         Y24NUSuvWj79OjZRLdvR4bwILgw1yUvSPAvrLdewIcUqOcpyqIBOllHqcIqC1fh5WKQU
         S4ZZOS8sbDZnmyAugflSvukT350q0w7Z6goOJUhVYOdtP2B8CMVmrTi9ow1UznBZITrz
         QMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wbSy2s8b06uYzvj3ndAKYZAduDYOArcZnaIvxvyQgo0=;
        b=FExSVc7GP0Ih4X4rGPesypHiuEC6RDlmUTscx5q+S3OVHS8GBxKlaco/Akg1+cWpJE
         wKb/wptWCvDw0dm3aqjS62AHnDbmficGHy3vC5agrYS1YeBBQJGbksVghM3uInIdsfYL
         nkDoTtquxWY94RpMI3Jt3w4nlh8ZHE3lEsoceHOd9H43F7eOsOWzf7CCZYvVFfJB2HJU
         i4zTemWRLub655IZCYFFsLGzxnlXhrVwYfpAhmjhs8UGtL8xrrab7LHUQHLzYglQyo4+
         HJxwOlcWGhWAC14KvD8PC1LRcnFcVj8dTQtxL69ul2DVXct417rVdd1lsHYonr9NyGv3
         whgA==
X-Gm-Message-State: APjAAAU9EjKCVwKKbfIBQmHCv8VHiB+JGm3X2WdgS7H6h5b3DIDkhoDK
        P6P6IAFbKMPAvMiMl2sJDIzJEz38ag4BiLQ/wQW3pg==
X-Google-Smtp-Source: APXvYqxJeKxi+JFTcCbZxYUAMWmmpAcV2XApTu5wfpBcn7Gp7GAJhuHOE1pOGX85L/aTMVNbl1lpN4W2j/DdlCP3mw4=
X-Received: by 2002:a17:902:8609:: with SMTP id f9mr111024389plo.252.1560954613254;
 Wed, 19 Jun 2019 07:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <b3761c6479a49b60316325ebc22da904e36d4538.1556813333.git.andreyknvl@google.com>
 <20190502163907.GA14995@kroah.com>
In-Reply-To: <20190502163907.GA14995@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 19 Jun 2019 16:30:01 +0200
Message-ID: <CAAeHK+w9xGtaQ5oSCq-=1YNk_11T2Tz9LKehkL7ZsAz-XwKajw@mail.gmail.com>
Subject: Re: [PATCH] media: pvrusb2: use a different format for warnings
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>, linux-media@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzbot <syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com>,
        syzbot <syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 2, 2019 at 6:39 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 02, 2019 at 06:09:26PM +0200, Andrey Konovalov wrote:
> > When the pvrusb2 driver detects that there's something wrong with the
> > device, it prints a warning message. Right now those message are
> > printed in two different formats:
> >
> > 1. ***WARNING*** message here
> > 2. WARNING: message here
> >
> > There's an issue with the second format. Syzkaller recognizes it as a
> > message produced by a WARN_ON(), which is used to indicate a bug in the
> > kernel. However pvrusb2 prints those warnings to indicate an issue with
> > the device, not the bug in the kernel.
> >
> > This patch changes the pvrusb2 driver to consistently use the first
> > warning message format. This will unblock syzkaller testing of this
> > driver.
> >
> > Reported-by: syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com
> > Reported-by: syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I don't think I see this patch picked up anywhere. Should this fix go
through the USB or some media tree?
