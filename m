Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B68C219A19
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 09:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgGIHg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 03:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGIHg4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 03:36:56 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D07C061A0B
        for <linux-media@vger.kernel.org>; Thu,  9 Jul 2020 00:36:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z2so1243393wrp.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2020 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KKtQly4ao6B6nwRWEDkHlPwVhDZwmTFzlBzK230IGUs=;
        b=q1a8xJM/Q9Wj785BtNlEuDFVR1eQk54JebnUrlGorLvEHVMtqdFOuaGKrTYCsphJ1h
         jdn7d6bEOoYqm6Dc8k5LjNzJMPs7sqOYl93W/0yr7CIrm1h2/Lv3g+fhNpsEY21yKMZh
         ju/lEovQ160zqDVi53k34kcqcJLZdTHFacxSS0a8W4cpfdDptcuxHSPlubyxOMMuaSBC
         zAyYruzxGOJbmMUqmjN2Chf/XWhBZgAcu1tmI7ShCPPddj04M/M8Yf8LAduuKxgJQlTV
         rIzd0KYtUf5G7qRV/73bX9CHJ9uhQaanPFGitTqRJCgzv1EMfeBg/7UHJHVTRmYqPihB
         A8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KKtQly4ao6B6nwRWEDkHlPwVhDZwmTFzlBzK230IGUs=;
        b=LWQ+iXl8JaGd72mO0Rdz8gTRdUluxq1hzasC72fS0I2UiwV/Et+m13kMHDm8eBuDJf
         Pw3wowAcxV5tRJ431i5rMcLROxLKqFxucMZjYu4v6RZ2oCCvdqipw43fTeger5/MTmRc
         +ofXhfy2Wj2AVddTGvRRsOpNsEdmW3DtdLpArPDArbHG8Eja8O9ATJ0TfVPqiZuyO9fK
         H3QhJan/SMvaYLV0l2OaqF3AV2xjSUGoZtn7OqMzyC+yNPwv5YMXWM38wilzFb4jdPFq
         +E4tD6RT02xcLplWmtTd2+zd2oj6Ry+6UmbZ/ZmdBeAalx53ZnoUZaCAipZ7MGprYHyE
         MJ1A==
X-Gm-Message-State: AOAM533DelooxukV38uqLe+b1qjusfOHMbE/nvef6NUin3qWXB8cZTov
        iii6o4u219OivSBk50Msl4zlJo+a4xZRQvXuDF3BoA==
X-Google-Smtp-Source: ABdhPJwOIE8GoaZZk1aSRinMLKGhWIbTpQIZ0IBDLoLaRN5k6dzJvrX8BOXeDjMLQXA3ybdstuq5y6Y6MSCOm3lN/7s=
X-Received: by 2002:adf:f9c8:: with SMTP id w8mr60764235wrr.354.1594280214366;
 Thu, 09 Jul 2020 00:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch> <20200707201229.472834-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Thu, 9 Jul 2020 08:36:43 +0100
Message-ID: <CAPj87rO4mm-+sQbP07cgM8-=b6Q8Jbh5G0FsV8rwYx2hnEzPkA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/25] dma-buf.rst: Document why idenfinite
 fences are a bad idea
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-rdma@vger.kernel.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Steve Pronovost <spronovo@microsoft.com>,
        Jesse Natalie <jenatali@microsoft.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, 7 Jul 2020 at 21:13, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Comes up every few years, gets somewhat tedious to discuss, let's
> write this down once and for all.

Thanks for writing this up! I wonder if any of the notes from my reply
to the previous-version thread would be helpful to more explicitly
encode the carrot of dma-fence's positive guarantees, rather than just
the stick of 'don't do this'. ;) Either way, this is:
Acked-by: Daniel Stone <daniels@collabora.com>

> What I'm not sure about is whether the text should be more explicit in
> flat out mandating the amdkfd eviction fences for long running compute
> workloads or workloads where userspace fencing is allowed.

... or whether we just say that you can never use dma-fence in
conjunction with userptr.

Cheers,
Daniel
