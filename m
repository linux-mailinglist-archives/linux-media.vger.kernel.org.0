Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F81375627
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235105AbhEFPCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235098AbhEFPCA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 11:02:00 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0153FC061574;
        Thu,  6 May 2021 08:01:01 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a36so7435224ljq.8;
        Thu, 06 May 2021 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FQfZjD7TrZQ1nqIxr1ZJjYJDmwinzB9KIgMfmOS6PpA=;
        b=jipDTtDhtLjI+sMmEHEOKwINKPsOLxV5a52MyyKg6I40dMfrtPEGZuMWRUGQh5zGbf
         qvLOGGdKTKQEWLHzxwEvm5wqOfeFTW1leejDCxEBy8qcEsnb/JyT7cqz9PSn8QD8FE+u
         gEvVFj38M/ETUdcwHlYGVW+81ApynqN8NXQtN4P4RT7/msP6t7ZLAvkeqGdFG6dc3FDY
         bKF/5ZQd6XktIv0ZOHs5J0wfpHAeWKPagbIKjk01Z51VYaCHCE67/pMvkNvRIgzogxTu
         RX7+7mkVOksWwhDHYjiWQXY4jUibEJhH+fKRXDcyu465QnSvl9s96O23aami73BCzCHw
         TKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FQfZjD7TrZQ1nqIxr1ZJjYJDmwinzB9KIgMfmOS6PpA=;
        b=OpscCKCLSqU8mcTn54hbDrVGWjxb50Cbet0S5t2aHkWzgvBQt/XwERBg2Wwlwxey29
         kewa8xAe7B5VMoq3203k7VVdV+Mnmkile+FPwoZvD+CO3qk2m9dlMTCruvTrQxy8gk5r
         nty+2ijUcL6Wo5vAcKAZE//ltINXCeqVtakqsfsrc7ZAVN1NtKqHhadwFzimqLVziV5t
         bVAtQGkzdbAY4IzrdnCWleIL/r8GIEPh0wDdkRfBxDWuPaPPq+7LcE3TqTwAA2eXwNhN
         nqTEReHpSv1GRJ5h1wrtzco53fOB9fwEmjTnFyvVjqNf3QEFYLAIAoZ8vdoOb6glVi5s
         C1SA==
X-Gm-Message-State: AOAM533/FA62DO7cJox2qC2grKEUKv5pERYxgsx1LjnX5+8MxnbTBwPL
        DFW5EcaLRo9LoNxXTYzOxvY=
X-Google-Smtp-Source: ABdhPJxHdyTg8LXAufhr8sNfgWMy3/yhGYOqNUgkdVtXhphW0z6hVw1GAHxfWuDqvE36gEHGo8egfA==
X-Received: by 2002:a2e:988b:: with SMTP id b11mr3852694ljj.87.1620313258026;
        Thu, 06 May 2021 08:00:58 -0700 (PDT)
Received: from localhost.localdomain ([94.103.226.84])
        by smtp.gmail.com with ESMTPSA id y11sm965222ljy.27.2021.05.06.08.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:00:57 -0700 (PDT)
Date:   Thu, 6 May 2021 18:00:53 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Uladzislau Rezki <urezki@gmail.com>, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in __vmalloc_node_range
Message-ID: <20210506180053.4770f495@gmail.com>
In-Reply-To: <20210506145722.GC1955@kadam>
References: <000000000000fdc0be05c1a6d68f@google.com>
        <20210506142210.GA37570@pc638.lan>
        <20210506145722.GC1955@kadam>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 6 May 2021 17:57:22 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Thu, May 06, 2021 at 04:22:10PM +0200, Uladzislau Rezki wrote:
> > Seems like vmalloc() is called with zero size passed:
> > 
> > <snip>
> > void *__vmalloc_node_range(unsigned long size, unsigned long align,
> > 			unsigned long start, unsigned long end,
> > gfp_t gfp_mask, pgprot_t prot, unsigned long vm_flags, int node,
> > 			const void *caller)
> > {
> > 	struct vm_struct *area;
> > 	void *addr;
> > 	unsigned long real_size = size;
> > 	unsigned long real_align = align;
> > 	unsigned int shift = PAGE_SHIFT;
> > 
> > 2873	if (WARN_ON_ONCE(!size))
> > 		return NULL;
> > <snip>
> > 
> > from the dvb_dmx_init() driver:
> > 
> > <snip>
> > int dvb_dmx_init(struct dvb_demux *dvbdemux)
> > {
> > 	int i;
> > 	struct dmx_demux *dmx = &dvbdemux->dmx;
> > 
> > 	dvbdemux->cnt_storage = NULL;
> > 	dvbdemux->users = 0;
> > 1251	dvbdemux->filter = vmalloc(array_size(sizeof(struct
> > dvb_demux_filter), <snip>
> >    dvbdemux->filternum));
> 
> Indeed.
> 
> It is a mystery because array_size() should never return less than
> sizeof(struct dvb_demux_filter).  That's the whole point of the
> array_size() function is that it returns ULONG_MAX if there is an
> integer overflow.
> 
> regards,
> dan carpenter
> 
> 
> 

Hi!

I've already sent the patch:
https://patchwork.linuxtv.org/project/linux-media/patch/20210506121211.8556-1-paskripkin@gmail.com/


With regards,
Pavel Skripkin
