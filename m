Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC01CFF1E
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 18:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729320AbfJHQnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 12:43:39 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37648 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbfJHQnj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 12:43:39 -0400
Received: by mail-ed1-f68.google.com with SMTP id r4so16256059edy.4
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 09:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UzErhGeNOu6CjM03E40KoyC+AbhFMlmjMb+mV7sZ084=;
        b=gJplojBwf4Rmeapv++Ojj8y4IUbl86duHe4QQguITQsH6QoGw7Ai9FN6AQHZZOK8c8
         yk4AcCm6P3b6Fw89Ic2kfm+ryLy6UKbz0ND304p6Fr5HpJWRk0vKQXa92nAo1Q2uCHhq
         U75RcH7BzfvTmivL6Ur252eV0Eq+YQzoXluJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=UzErhGeNOu6CjM03E40KoyC+AbhFMlmjMb+mV7sZ084=;
        b=THZndmcE8ehO0shGCp3cHfig8A6MaMeOiDYohEriow7djE6BvPG9e3Df/W2uocGswi
         RHE4jtUqqxmhBenabZijsc/gcqtv/bCAZDr9YAd0Hsgu4Asxb53PK1MiD92N6QaYvWKZ
         R0ub1dmUOW5bfvZBsaGaCnlE4FHCKe3yie+ANoQv0BF2yot52CONGfpmQvLAbxifTAj8
         d+rVd+m9PhL4Z3usUPeH6fY/AeJQI8p2Mdp/quxX6QXn4OYzaetMvVhY1gSIUd03CMWE
         MfUA0Z3CsMVKQljMV8BNq+Xj1moPY29HlBKd0TrYaGy/ZBpmm7v8fIUgpGiL9B52tPxy
         KRSQ==
X-Gm-Message-State: APjAAAUPmYlNFiLOkfPx/9pMPhgb2sTZd2j75Yle041Ww1L+3PbuNqYz
        vNxCj5ycQvfp82sswQpmormeMw==
X-Google-Smtp-Source: APXvYqxUrI++czRZZH6dfzHJ4mkVe3aiDHQThkh6vAfDivxyNchdAlNRK8CySlWhwt2wKsEatq8aVA==
X-Received: by 2002:a05:6402:1212:: with SMTP id c18mr35129488edw.259.1570553015591;
        Tue, 08 Oct 2019 09:43:35 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id j6sm2335714ejv.36.2019.10.08.09.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 09:43:34 -0700 (PDT)
Date:   Tue, 8 Oct 2019 18:43:32 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Qiang Yu <yuq825@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH] dma-buf/resv: fix exclusive fence get
Message-ID: <20191008164332.GT16989@phenom.ffwll.local>
References: <20190922074900.853-1-yuq825@gmail.com>
 <CAKMK7uHro9W8GqvuVf0Ruji691U7Trc_jmS3U-OEacLFDH6P1A@mail.gmail.com>
 <910b33a2-36ec-1ed3-e487-adfa61b5ec0e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <910b33a2-36ec-1ed3-e487-adfa61b5ec0e@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 30, 2019 at 08:57:32AM +0000, Koenig, Christian wrote:
> Am 30.09.19 um 09:22 schrieb Daniel Vetter:
> > On Sun, Sep 22, 2019 at 2:08 PM Qiang Yu <yuq825@gmail.com> wrote:
> >> This causes kernel crash when testing lima driver.
> >>
> >> Cc: Christian König <christian.koenig@amd.com>
> >> Fixes: b8c036dfc66f ("dma-buf: simplify reservation_object_get_fences_rcu a bit")
> >> Signed-off-by: Qiang Yu <yuq825@gmail.com>
> > Selftest for this would be lovely, now that the basic infrastructure
> > is in place ...
> 
> What do you have in mind? I wouldn't even know where to start to write 
> an unit test for this.

1. set a few fences (both excl + shared) in a dma_resv
2. get them
3. check that we got them all
4. notice that the exlusive fence isn't actually in the array (because we
increment the index before storing, so the exclusive fence ended past the
array). For robustness the test should check that the fences are listed in
any order, not just the one the current implementation gives you.

I guess the actual crash happens when we're unlucky and overflow the
allocation, which is probably more rare. But KASAN should help catch that
too (run that in your CI if you don't do that yet, it's pretty
impressive).

Or am I totally misunderstanding what's going wrong here?
-Daniel
> 
> Christian.
> 
> > -Daniel
> >
> >> ---
> >>   drivers/dma-buf/dma-resv.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> >> index 42a8f3f11681..709002515550 100644
> >> --- a/drivers/dma-buf/dma-resv.c
> >> +++ b/drivers/dma-buf/dma-resv.c
> >> @@ -471,7 +471,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
> >>          if (pfence_excl)
> >>                  *pfence_excl = fence_excl;
> >>          else if (fence_excl)
> >> -               shared[++shared_count] = fence_excl;
> >> +               shared[shared_count++] = fence_excl;
> >>
> >>          if (!shared_count) {
> >>                  kfree(shared);
> >> --
> >> 2.17.1
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
