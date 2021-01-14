Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142342F5646
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 02:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbhANBpQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 20:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbhANBFP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 20:05:15 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B154C061795;
        Wed, 13 Jan 2021 17:04:33 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id s15so2056921plr.9;
        Wed, 13 Jan 2021 17:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VpmEfhmuE4m3lCR0CbzUbqFZms+Fz8wndQrnmUOwqpU=;
        b=TcU4dQzKhkz4u0aGbShBlkm5Lgq7vBIeKqPRvRSA67x2gzxKRk0RspQzEpBkEcuoIy
         1c2YEI0lQBpuFJ2rrFEGVoWUQg7apSF/CkrdhKvTZrG/WUCjf0KBkpgYE4ZzazRYp9PT
         HcHbBRZImxTueiR83MlHPjrLeK9YdmZLwXksGik3Kb2iw5fOMV/tlh+oaWPsyk6wt9KS
         6YvyqRtrbHAVN0Wd2R4y+DaQytJYM2FSKtytA9b9TN+amnbNQILqW90/6PYQVxJBU5mc
         zR08x9HrQ5CxzaT1W2mj/h10bGZb378QVuIHUepaNTKZvEaTE8nve9wNWSNZPv0i2dNi
         0mNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=VpmEfhmuE4m3lCR0CbzUbqFZms+Fz8wndQrnmUOwqpU=;
        b=f9w+aHBkqUfH4pP/mNH27Gg4T9L2m6EYb9D5Z/6EGCu41AxG7VG07bgdcHYw4bHEjy
         mz2aLsH9H5BH3pHmOmXvO3p+3h1uLBuuxuP2kN9o2yW+NTBYBPrHws1FMyheb56wUhx8
         gg3PqK8ymStGBfP421JKeuKRcybP1IPhT5A44Pz5TWZ0v0h2/0BMvPVxzhCZ7KdHp048
         moT3RL7iJB6OW2Acjz5RLjXsvWfwPF069WgY29Bg634xUR0JhBHjxvKJK9Ne6fMfQYQ0
         y1VAuyRCeuhHjbIfRSjMhS1tjMqbw/t5d+Ft/9lKufEiHkmxZiBX3g4cydbsoJY3pq3h
         gp9Q==
X-Gm-Message-State: AOAM532dS2Kj9iR6orgNN9wUp0z4Sbr47VKbnPQd1nMPqnIp1zKZ8IUB
        olVdHyCrRAKXUXUcWXKlY7s=
X-Google-Smtp-Source: ABdhPJwrJ8Isxj4nRytmMfOvMREHmP4joIOQKLfG5NRnAzquyOfiEt2ltmtABLIC4FEuwymZgPSspw==
X-Received: by 2002:a17:90a:f2c6:: with SMTP id gt6mr2130111pjb.35.1610586272925;
        Wed, 13 Jan 2021 17:04:32 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id h1sm3901522pgj.59.2021.01.13.17.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 17:04:31 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Wed, 13 Jan 2021 17:04:29 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, hyesoo.yu@samsung.com,
        david@redhat.com, mhocko@suse.com, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <X/+Yne/3X3jvdCj0@google.com>
References: <20210113012143.1201105-1-minchan@kernel.org>
 <20210113012143.1201105-5-minchan@kernel.org>
 <23b60450-b6ac-447b-4a61-fc4649c3a390@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23b60450-b6ac-447b-4a61-fc4649c3a390@infradead.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 12, 2021 at 07:38:40PM -0800, Randy Dunlap wrote:
> On 1/12/21 5:21 PM, Minchan Kim wrote:
> > +config DMABUF_HEAPS_CHUNK
> > +	bool "DMA-BUF CHUNK Heap"
> > +	depends on DMABUF_HEAPS && DMA_CMA
> > +	help
> > +	  Choose this option to enable dma-buf CHUNK heap. This heap is backed
> > +	  by the Contiguous Memory Allocator (CMA) and allocates the buffers that
> > +	  arranged into a list of fixed size chunks taken from CMA.
> 
> maybe:
> 	  are arranged into

Let me fix it.

Thanks, Randy. 
