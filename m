Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CABB37656B
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbhEGMqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbhEGMqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:46:05 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873D2C061574;
        Fri,  7 May 2021 05:45:04 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so4824316wmb.3;
        Fri, 07 May 2021 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G3ZPlqSS2SM+tCjnUEbVUkvvf8BLcEfy9KwkaPBN/zw=;
        b=XkDyfZHTQRXeozSPOoHTGxUipgMTxiE7XjrtlFIZj+Da8csqJ8sF9my2PCSws1ddlQ
         I9Sq2oaDIMFjbWkCO2am6G5leS4zYidy2ctbV+zAF6bDAxwu1x10vhHAs01vYiSRl8FC
         pQEuF9823jYGB3OQD5415nWLhm2TED/NiO/qRFRM+Lne4Pu/yvdW0gCk/D++8ChlNjJc
         ApoY1+MPaqN/rtDmjEHUQZsWievyIi7IVTYBE+3fNw/ZC9gRZrpMiAOuCYHv5CdMoCmk
         ivlJvMRLx/qldIQNvrMRi1kfAYA4xqZCFt/InKpS48u5snR77blRceZKyiDjMO0Nf0jD
         akDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G3ZPlqSS2SM+tCjnUEbVUkvvf8BLcEfy9KwkaPBN/zw=;
        b=R9gal0r67LznnoUEqQ4YMn1/zGHY3lSIDltr+ykneRP1VqC5cXl7KXlYTGWbRXS+kz
         bqcwIq7PEOrrwV+s7k3PC8SADIuLkzmo34SS/uxQkSZ5TSEyuxHMz9QcoLRydmPD2MBB
         +0AEnRM+EflbIh5+MyVayynpQKVappzbX4/vS8Qxp6xHus6HvF14KV4o6unSZnfY/6Mb
         8XAvs8/O0EBLsWbjD4rzwXmc69MlMQwOWIBSrn51GRtgcwFG1Frq4Lbqq8RZRbGTKVoo
         kwKPgDxMVP6OghkjOd7j1cJQ/tEW/sH6ROyX76ewSlEgw0aFz7i/VHjGsTI3GswYZR5Q
         z5dg==
X-Gm-Message-State: AOAM532j6OyA66JZHUMogJHIj7QISON/brxMigOVmEY+TZlVOg7FEgCy
        ZUAbK0p4oCNmkXFeNQ4iCiQ=
X-Google-Smtp-Source: ABdhPJxbiOAtUQYxF+fijkvU2JYqLmROYR4X50ZYAqGwUgz30p8cgyIKUQ8bvpoLdsa1Hxku0BbUMA==
X-Received: by 2002:a05:600c:47d7:: with SMTP id l23mr20786260wmo.95.1620391503246;
        Fri, 07 May 2021 05:45:03 -0700 (PDT)
Received: from localhost.localdomain ([94.103.226.84])
        by smtp.gmail.com with ESMTPSA id r2sm8704380wrv.39.2021.05.07.05.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 05:45:03 -0700 (PDT)
Date:   Fri, 7 May 2021 15:45:00 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Uladzislau Rezki <urezki@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, mchehab@kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] WARNING in __vmalloc_node_range
Message-ID: <20210507154500.0951876a@gmail.com>
In-Reply-To: <CA+KHdyWuf8iDvrmGfapVy3pRie4FOwdasbtRij39MmXr0Wpzuw@mail.gmail.com>
References: <000000000000fdc0be05c1a6d68f@google.com>
        <20210506142210.GA37570@pc638.lan>
        <20210506145722.GC1955@kadam>
        <20210506180053.4770f495@gmail.com>
        <20210507080435.GF1922@kadam>
        <20210507152954.5773592a@gmail.com>
        <CA+KHdyWuf8iDvrmGfapVy3pRie4FOwdasbtRij39MmXr0Wpzuw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 7 May 2021 14:42:14 +0200
Uladzislau Rezki <urezki@gmail.com> wrote:

> Hello, Pavel.
> 
> Also in the commit message i see a type.
> 
> <snip>
> syzbot reported WARNING in vmalloc. The problem
> was in sizo size passed to vmalloc.
> <snip>
> 
> Should it be "...zero size passed to vmalloc"?
> 

Yes, it should. Thank you so much!

> --
> Vlad Rezki
> 
> 
> On Fri, May 7, 2021 at 2:29 PM Pavel Skripkin <paskripkin@gmail.com>
> wrote:
> >
> > On Fri, 7 May 2021 11:04:36 +0300
> > Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > > On Thu, May 06, 2021 at 06:00:53PM +0300, Pavel Skripkin wrote:
> > > >
> > > > Hi!
> > > >
> > > > I've already sent the patch:
> > > > https://patchwork.linuxtv.org/project/linux-media/patch/20210506121211.8556-1-paskripkin@gmail.com/
> > > >
> > >
> > > Please, always add a Fixes tag.
> > >
> > > Fixes: 4d43e13f723e ("V4L/DVB (4643): Multi-input patch for
> > > DVB-USB device")
> > >
> > > regards,
> > > dan carpenter
> > >
> >
> > oh..., that's one thing I always forget about. Thanks for pointing
> > it out, I'll send v2 soon
> >
> >
> > With regards,
> > Pavel Skripkin
> 
> 
> 


With regards,
Pavel Skripkin
