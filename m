Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2DA286DE1
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 07:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbgJHFEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 01:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgJHFD7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 01:03:59 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7873FC0613D2
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 22:03:57 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id e20so3967230otj.11
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 22:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y4J6xZLLT7X+F7OLOzqqVjMYajEePxtfk9UzEIVuZt0=;
        b=kPUNcT6En9JIRrz2QtGnFe3Selq9hqXUXprs+7y6un8lFV/TiArK5U3JSZO6nA0HXc
         EU4OZInvsC8NfhGrNcJXbKRwIFPmMl52gGu1MbN1wkmVtqNJXZnkisUPsHD1g8cpTvTP
         /vYBDakKhR3/pdkBfiqsry4OoWqlMvulH6vI0ZzHJz2wwj3Xt3EF7CsCwU6oleYGE1xW
         Mn+9FWxvPmlHuAGmHkToJ27FQbxcncnyjXun8PnvmbTdM9TevYBPVs8KoHB/UKiPru74
         oGLab6xbAPZlonR8LD/jDVDjWC/ksf7nTNlNEazWJtI7qa74TS+7TctEknxblIXbVaAW
         cXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y4J6xZLLT7X+F7OLOzqqVjMYajEePxtfk9UzEIVuZt0=;
        b=DbI6y7AowNqX34Q2rswXkLPLkD6NHfQAP2IJDj49AsUN/ZHyzFDO4SMD+JTS50QDb+
         tw8SW8jt+BoV0KTtTGjJFV9c2z8e3BE5pY1M8xu8jnZ2mUeLTKq9zldcLat2TXxN3k1Q
         jazRUZtFCKRGqUIh/8xECgdqSAGlGoPUs4TqKBCDaDGt+qY9CM0GvJ2gqLt3A2VjJXCS
         5+FLf69JKAbNLk5h6aqosSF/pykpLfm6tifInAMCdhbrgU2vxwgzOncBGcQ4SjKMD2Wh
         V+eRo964WeFwC8N69ihFo+YWweoFvFIq+2YByjaHcXoSHdGg5lvxSRlAiTjZUwHtkgAY
         KMEA==
X-Gm-Message-State: AOAM532K8eWKh1m7F9OQKxoyQMgwIgzz6QwsBZBSTBGqdSrM0qiujskb
        c/HSZw6kCfnQg5k+lP5w3bNgGUysm36c/bBSPhPGww==
X-Google-Smtp-Source: ABdhPJz3Gy6/xfKW2fu6IJ5k2Afzci///E5IEtsLrgMBtd+osJAFKkvJwdqpsc7KPM9P0mBGYQzaZrz31q723RwT+C0=
X-Received: by 2002:a05:6830:196:: with SMTP id q22mr3771201ota.221.1602133436666;
 Wed, 07 Oct 2020 22:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201003040257.62768-1-john.stultz@linaro.org>
 <20201003040257.62768-8-john.stultz@linaro.org> <20201005134528.GA11644@infradead.org>
In-Reply-To: <20201005134528.GA11644@infradead.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 7 Oct 2020 22:03:43 -0700
Message-ID: <CALAqxLWSq3szE40hC_m-qpOOH1193jYLOT1_ZZh-eW9U0gnG8w@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To:     Christoph Hellwig <hch@infradead.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        "??rjan Eide" <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 5, 2020 at 6:45 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> How is this going to deal with VIVT caches?

Hrm. That's a good question.   I'm not sure I totally have my head
around it but, I guess we could make sure to call
invalidate_kernel_vmap_range() in begin_cpu_access()  and
flush_kernel_vmap_range() in end_cpu_access() rather then exiting out
early as we do now?

Unless you have better guidance?

Worse case we could check CONFIG_CPU_CACHE_VIVT and not register the
system-uncached heap.

thanks
-john
