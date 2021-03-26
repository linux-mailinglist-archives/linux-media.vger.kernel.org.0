Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3D534A2BB
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 08:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhCZHyM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 03:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbhCZHx5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 03:53:57 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FB6C0613AA;
        Fri, 26 Mar 2021 00:53:57 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 184so6301952ljf.9;
        Fri, 26 Mar 2021 00:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uA1GLYTLgtwFtdIYgnHVFTAPPPYk0jbFdUFOH9zJFeo=;
        b=SqDNs9cvBYyQ1tLzOlGiAxME2xao0mtXAa4cF7auyjHuIRo9F4xH4P5caTJfZ5ce14
         lZ0aNM48hV5el1F9UDsH2sK8Do/kDPgMdl4P68a9t5dV1upLiKSr1iS1uv/zq88SePhN
         2OhBl+1vP6g53zmowxi+xU+VFuOPb4NTgat+iqURXNPpsqsh7Qs7Lj/lSJG8rw9DknQ7
         +KmbSbWKsW5rIOpr3X4gduk+qejmXO+JZ8VhAriBp/y/WWVb0zuwtvWSdBe+wVTAhU47
         N1dkki1Ikz8cKzwMVdrcUemBGuqkVsadPvvWwLsboW9VVt79R9dLs8I8LD/y0cxIeYfu
         e55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uA1GLYTLgtwFtdIYgnHVFTAPPPYk0jbFdUFOH9zJFeo=;
        b=iK9+sZBrTyqA7bzsga1XBgqGE+4ASqQqVsXnOr2di5GOttuelBOdHRTR318AYSQhS/
         AyKFqkM7rPKM5lOMDCPd2nJAsXx7t9l6NvkGONlw1jvARwBqRwr4ucEwl2qz9ff/LP6a
         Brri4J2G4ZeF1RWfF7E3qlBa2oEKlNJwHQLRMTOpPyD88Z2rL9RJImsAyDGf+qoI3tao
         8ynb9UDtm9N3fTenhB/VIXGgCV75XtSB5thmsrT9jQaced8GwoKVl+CB9hSW0XELX35z
         A/z40yiI31jZLrg3sbnUmxMkW4yS0ITabRXz/QKePjWpWCQq5AEiT3wQu82biSYGeOEu
         ECHw==
X-Gm-Message-State: AOAM532lnXUZDt3T7imwkt/yuxjIXQ9tgeoEatXidHnIGb61ksWlS0+R
        X4UFfSa6M3PAeg+o45riZE8=
X-Google-Smtp-Source: ABdhPJzOzYWDR/ERAI/qIDJChxc3zmEKUBEpo8g/lYlmp/404VC+BOZ3w1z7IC59AnrOPo4QBpRwlA==
X-Received: by 2002:a2e:b0d4:: with SMTP id g20mr8314831ljl.127.1616745235869;
        Fri, 26 Mar 2021 00:53:55 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.227.42])
        by smtp.gmail.com with ESMTPSA id q8sm780897lfc.223.2021.03.26.00.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 00:53:55 -0700 (PDT)
Message-ID: <f635ac6050755703d7ebc079b188e1c9acb04279.camel@gmail.com>
Subject: Re: [PATCH] media: sq905.c: fix uninitialized variable
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Alaa Emad <alaaemadhossney.ae@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>,
        syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
Date:   Fri, 26 Mar 2021 10:53:54 +0300
In-Reply-To: <CACT4Y+ZSLKWJK6yrLG6=ej4-1_uxnqGhS05rBiD=eFX3GETFEw@mail.gmail.com>
References: <20210325212202.142945-1-alaaemadhossney.ae@gmail.com>
         <YF2JF+UMdt/icEMj@kroah.com>
         <CACT4Y+Y8f6-c6zYCN=d0557xEryAzBfS9n2m=vBcdjHSi5gYcw@mail.gmail.com>
         <913828319c9e0b6281ad32361e0246fc95d2c138.camel@gmail.com>
         <CACT4Y+ZSLKWJK6yrLG6=ej4-1_uxnqGhS05rBiD=eFX3GETFEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

On Fri, 2021-03-26 at 08:40 +0100, Dmitry Vyukov wrote:
> On Fri, Mar 26, 2021 at 8:24 AM Pavel Skripkin <paskripkin@gmail.com>
> wrote:
> > 
> > Hi!
> > 
> > On Fri, 2021-03-26 at 08:14 +0100, 'Dmitry Vyukov' via syzkaller
> > wrote:
> > > On Fri, Mar 26, 2021 at 8:11 AM Greg KH
> > > <gregkh@linuxfoundation.org>
> > > wrote:
> > > > 
> > > > On Thu, Mar 25, 2021 at 11:22:02PM +0200, Alaa Emad wrote:
> > > > > Reported-by:
> > > > > syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
> > > > > Signed-off-by: Alaa Emad <alaaemadhossney.ae@gmail.com>
> > > > > ---
> > > > 
> > > > I know I do not take patches with no changelog text, but other
> > > > maintainers might be more leniant :(
> > > 
> > > I wonder if it's the right fix or not.
> > > Initializing variables will, of course, silence the warning, but
> > > it's
> > > not necessarily the right fix. I suspect there is something wrong
> > > in
> > > how ret/act_len are user/checked.
> > > 
> > 
> > There is a problem in usb_bulk_msg() call. It could return before
> > act_len initialization, so i think, act_len should be intialized with
> > smth wrong like 0 or -1. BTW, I already send patch for that, but it
> > was
> > marked as obsoleted.
> 
> If usb_bulk_msg returns before act_len initialization, it should
> signify that fact with an error code in return value or something,
> right? It does not initialize act_len only in case of errors, right?
> If so, sq905_read_data must check ret and don't use act_for any
> checks. But it does, and that's I think the bug. Or maybe usb_bulk_msg
> does not properly signify that it failed (and did not initialize
> act_len). Either way silencing the warning with pre-initializing
> act_len looks very fishy.
> For example, consider, in some contexts it's OK to transmit 0-length
> packets, I don't know if it's the case for usb_bulk_msg or not, but it
> does not affect the idea. Now, if we pre-initialize act_len to 0, we
> can falsely think that such 0-length transfer has succeeded (act_len
> == size), while it actually failed (I assume so since usb_bulk_msg
> left act_len unitialized).

You are absolutely rigth, and sq905_read_data doesn't use act_len for
checks in case of usb_bulk_msg fail. But it uses it for error printing:

	if (ret < 0 || act_len != size) {
		pr_err("bulk read fail (%d) len %d/%d\n", ret,
act_len, size);
		return -EIO;
	}

So, value like -1 can be a flag for smth went wrong internally. Or
maybe remove this error log and replace it with other, which will rely
on error code, idk how it will be better
--
With regards,
Pavel Skripkin


