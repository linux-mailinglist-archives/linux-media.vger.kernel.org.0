Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B22C2F5452
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 21:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728874AbhAMUvJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 15:51:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728856AbhAMUvI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 15:51:08 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E40C061786
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 12:50:22 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id d203so3631892oia.0
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 12:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rqFgc2dzKme0zr+aU1JENA4xdAtd9mmh2guoOC2yjew=;
        b=MQQhT8WVByeSlgDj2m+Ianm+DeZbxWW0a6i6/UvKUWT/ZY2Aj6ipHsJ68EcJzntahX
         ba+ftlZmyowIXRFKfr4fb1svh06/VzwQK94Rd6u8ryCRX75PDJwi6duabIiS9/7tB0uY
         6pZYvzSKFeUmpwcrO2+fI7/fbNdSBgwzk46J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rqFgc2dzKme0zr+aU1JENA4xdAtd9mmh2guoOC2yjew=;
        b=KBp7i75gqhL+7GdIWS6fd6NCmehQwREfLEJ0rAtkqTxfrJrVG8ewoeqri5Lquuovst
         cUqZdgGcs9rZa6b6OE0dIQSKFTYakfOMMR87cjh3en5tkIp1sbeGHuTgN7lAi0VgJwNQ
         jtkYYZSaY0IbKzIRyMweelrKw0l2vwis5bT6KgBsfV0h5M6XEvGeC9HiQ54Wst9ukbDz
         ylKGPuN9ivEvaTjGAI8JuH75YX1UMjFmaDfVWgoBXSA38EHDJY/LeHlvjyScMedb/JhS
         XGytKpu9nSe+HO5SuhLflWbbUoe70uZpyBnb+1mk7Cus6/8m8a7YTuuus51SEDakLs96
         wvnA==
X-Gm-Message-State: AOAM533pD/HOS3+MEpgLPRLDM8do+9AtVOVnp+E7kIFaKjKZVnC671CS
        YT+gbburkZm3bG7+7c1/xZa23Q2kVxa5GzGtEBArM2RbWpsQTQ==
X-Google-Smtp-Source: ABdhPJy67Q/SiF12KAy9W+l33TI2jHio6EqyjNUlwUVXtpcm2GTUEw2G9L6akaRObc+uz+7EkfYii6J6G5enil+o9lE=
X-Received: by 2002:aca:54d8:: with SMTP id i207mr651674oib.101.1610571022183;
 Wed, 13 Jan 2021 12:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch> <161055261490.6195.7986280621869334351@build.alporthouse.com>
In-Reply-To: <161055261490.6195.7986280621869334351@build.alporthouse.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 13 Jan 2021 21:50:11 +0100
Message-ID: <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm-buf: Add debug option
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        David Stevens <stevensd@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 4:43 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Daniel Vetter (2021-01-13 14:06:04)
> > We have too many people abusing the struct page they can get at but
> > really shouldn't in importers. Aside from that the backing page might
> > simply not exist (for dynamic p2p mappings) looking at it and using it
> > e.g. for mmap can also wreak the page handling of the exporter
> > completely. Importers really must go through the proper interface like
> > dma_buf_mmap for everything.
>
> If the exporter doesn't want to expose the struct page, why are they
> setting it in the exported sg_table?

You need to store it somewhere, otherwise the dma-api doesn't work.
Essentially this achieves clearing/resetting the struct page pointer,
without additional allocations somewhere, or tons of driver changes
(since presumably the driver does keep track of the struct page
somewhere too).

Also as long as we have random importers looking at struct page we
can't just remove it, or crashes everywhere. So it has to be some
debug option you can disable.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
