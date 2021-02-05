Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D66B3111AD
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 21:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhBESRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 13:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233552AbhBESF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 13:05:56 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A334C061786
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 11:47:40 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id h12so11507950lfp.9
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 11:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JpFQEtQj4C0OZQX0JhcEbS+mtM0J6361EvZ8pnT2TSE=;
        b=L/O8FpF6LlQ1+mtrZtK+VtKD+UUwgDHsysQWj+/uvhSwZGo1Eh2QdS4GfGMzmkCV/L
         dDZA9pKSv4B4myTCSTpIhhomB2+Z/K4c+q2WwpEg3Xwbj+ZBIPKawEHR0zlgnwaP1gAK
         Z1x5iSvolMkSNC0wpljVeFY3ptOa5llNld5RUARcT8gw66Aed7NI/BbM+AczKGjIEqTz
         r6wsUKUQaXnzMUvn6NGWqiMk7ykLYy/iHQGcyltHzQJo5Gl4qLat0QDAP/QPgZyuKIVv
         RczfcHPCgoEYDvo3BXUC64rPEIgnPcyVpl9/7EgSRfq4SEZq8zOSlOBbcbSWxpBn8YVC
         w/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JpFQEtQj4C0OZQX0JhcEbS+mtM0J6361EvZ8pnT2TSE=;
        b=TadI+1vnV3WfLc102r+qi8++5NpqszhLQzeHtaie1SiGs7PQPJaAiIpIX8gAbZhye5
         iOKkJA/5PEqxNKHQNq+0ir/02nwFP5ZyLuLWx6oGa+l+KELs1t6L3z8BSIOazW1jx5h2
         xHw3nIUa7f2aDSPuhtW5/EzjJD0YbpfzmHWEw4ByJvL+Yr6Q3hEkwuMUde10e4pyiYSQ
         WjK/xGh0j8d/dqxthxAlAeDigMDmEkDNEo5djWU9uNMSDuwU/+q3o6G0DfD/Slle8nSc
         Xs1J4OJl2R2V2EYaGrPUbV5HRJLRxXR2sY3VgNEd4RJl4HXGimdAgxecnxtgH/x5Oimy
         Afsw==
X-Gm-Message-State: AOAM531or0GtZvBvEeD6SFPUmaq2c7q3tK5cunUUVjwEBo85JAIfab4B
        aJ6slBcgZ5PDJS2a517/V2+h7VwAQrjwhKGmfIMMHQ==
X-Google-Smtp-Source: ABdhPJxYzWAehEnsDpGaws8y+Zfq5m5I1qYWKUBMjcHBCecyBa1VQDARHSmA2ubfIx1mf62FNZS+cAX6p5NtKrw7Vgg=
X-Received: by 2002:ac2:5590:: with SMTP id v16mr3187334lfg.626.1612554458492;
 Fri, 05 Feb 2021 11:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-4-john.stultz@linaro.org> <8a4cacb7-3042-53c7-02fe-de18cc49fc0e@amd.com>
In-Reply-To: <8a4cacb7-3042-53c7-02fe-de18cc49fc0e@amd.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 5 Feb 2021 11:47:25 -0800
Message-ID: <CALAqxLX7KT8Zqv+qjpbiDzSLubvDgXz6Ayk_U_q5e0veweHcFw@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 3/7] drm: ttm_pool: Rework ttm_pool_free_page to
 allow us to use it as a function pointer
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 5, 2021 at 12:28 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 05.02.21 um 09:06 schrieb John Stultz:
> > This refactors ttm_pool_free_page(), and by adding extra entries
> > to ttm_pool_page_dat, we then use it for all allocations, which
> > allows us to simplify the arguments needed to be passed to
> > ttm_pool_free_page().
>
> This is a clear NAK since the peer page data is just a workaround for
> the DMA-API hack to grab pages from there.
>
> Adding this to all pages would increase the memory footprint drastically.

Yea, that's a good point!  Hrm... bummer. I'll have to see if there's
some other way I can get the needed context for the free from the
generic page-pool side.

Thanks so much for the review!
-john
