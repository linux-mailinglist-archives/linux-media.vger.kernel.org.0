Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A512230FE1B
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 21:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240070AbhBDUWo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 15:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240064AbhBDUWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 15:22:40 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504ABC061356
        for <linux-media@vger.kernel.org>; Thu,  4 Feb 2021 12:09:20 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id t126so2092992qke.11
        for <linux-media@vger.kernel.org>; Thu, 04 Feb 2021 12:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n3MAu1N2zejjEBwZWxASgX9jIdMC53t0pYKMsc1ppNk=;
        b=Lg069JztDhvoWiICQQWunlnXLy7IuMkcj0uAldVVNCHq/8JwhHufaEx0MekHJ/5JTl
         xviz7aNSvlZ1ljSeXW4L8FIeNGmTX4WbO9/i3MvjTqi6148SYSIstVBy+pIFAPN83e2E
         4qPWwueh6YN8rrUqE7CC7onk3NZRzHANXwl8AJpioEK7cH634mO/Agog/HJNefVFJU/n
         O54J5S6NPKcSrC02TZ3k/Dj1jxPue0lPwEjRfaoGZmo4lLqwI8vi+AWR4nFYqqYykoiP
         /BTBvvnfPceEloO2z6hrtPxG7Y8VMU921ANPWLs8+8t86Wt618I+a1pI4cLfUMIckMyi
         OkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n3MAu1N2zejjEBwZWxASgX9jIdMC53t0pYKMsc1ppNk=;
        b=CrYRn3fkGX4LWPYmPjaZ2iZsa9Bo12tio1Sr9mgTeShXjqk89jagJQW/QQAMKfGZ/R
         3KCDiDunI0DCYVT9/BeiPT+2G2YFMkntrlJMagyTzGIv22YwgEdSE2F3Sux/KN8h8FTm
         fBc09cSMQnT/p8v+GFwYJUXOnLsK9gBT2o5Q5VKz5tWs7Pu+MN4hUzEHbyIU12dNo1us
         G+gainLNs9k2mSh7ItpFAjDRIXwkU0d2WWtJJFql0S9AOYueTOpqOI/gYAX1tih3cFlx
         28dJgtjMiDO3akadGA4F4DAoPdPDFSZVAXfLlh7IGmvj9ZdbJqLYkZgFlfAGgCKkT9E/
         bkJw==
X-Gm-Message-State: AOAM531+MhphTSP2EVEoUeenXyFS/fNE17pLRqevGSoRnSxu7DlPxBzB
        RpzQpgW2DQHIqs/WclUSRqMlQw==
X-Google-Smtp-Source: ABdhPJwxkPhU5yCUGh2nhqN1PfCoHbyAYILljpnCVhMrLSVlD/QpbVxxtrM7Ce+Cd6yNcY/Mawl7Pw==
X-Received: by 2002:a37:6f06:: with SMTP id k6mr924841qkc.458.1612469359555;
        Thu, 04 Feb 2021 12:09:19 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id s129sm5985441qkh.37.2021.02.04.12.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 12:09:19 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l7kwI-003b1z-H9; Thu, 04 Feb 2021 16:09:18 -0400
Date:   Thu, 4 Feb 2021 16:09:18 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
Message-ID: <20210204200918.GA4718@ziepe.ca>
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca>
 <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
 <20210204183808.GY4718@ziepe.ca>
 <CAKMK7uFBzF00zTzAE5b7PJFUfmxp5ExbSQxfcOfd_P6dPm7k9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFBzF00zTzAE5b7PJFUfmxp5ExbSQxfcOfd_P6dPm7k9A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 04, 2021 at 08:59:59PM +0100, Daniel Vetter wrote:

> So I think just checking for VM_PFNMAP after the vma is set up should
> be enough to guarantee we'll only have pte_special ptes in there,
> ever. But I'm not sure, this stuff all isn't really documented much
> and the code is sometimes a maze (to me at least).

Yes, that makes sense. VM_PFNMAP and !VM_MIXEDMAP seems like the right
check after the VMA is populated

But how do you stuff special pfns into a VMA outside the fault
handler?

Jason
