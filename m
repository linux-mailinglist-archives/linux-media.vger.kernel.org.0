Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1431931554F
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 18:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbhBIRku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 12:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233324AbhBIRk1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 12:40:27 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6471AC0613D6
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 09:39:47 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id v24so29657384lfr.7
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 09:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RkQ9vh4yHUNqVTEH9lJ/reKjXo3DF861DsD0QmnSzao=;
        b=N7llKSi9PpveMhdKx9xFWCvBHfHBAEZF2BNttLhfhzwUAdD4W9ReMGo73szZaANrKl
         VcnbJBIFTnpQJgDor/Od67/25QCDuIiZxkwbDVkQowxGCk65fCPdLuhz1RQfNgFYUHiq
         olCZzFff5vrRI5lmdsAgq7azbkEU5MjZ9MRmqu6uGbX4bF2leAoJf0YkRFQmq+H1JbCu
         PSZwQADyTLn6WNsuifyYk256YVp1/VtEkqN7/LHzaYayGGCSMElb6bwh2aDwIzWaRwCG
         NVO5zzMJzunaFugHouKNsVDFDmlAD4Q/BDXv8xdRFndRX6nX698viwIk2ZfuK0qWgrp0
         IpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RkQ9vh4yHUNqVTEH9lJ/reKjXo3DF861DsD0QmnSzao=;
        b=M+BWU8P8oTrHeYQ9rkvFXaSV80bqVZ7DFezmaTw+afC1v7H4Zjiw0rGdlQkCtfKlNV
         NWMIzvyNB+tOZWA8eFK+Y4jMvQDMC+YaC3hqdXzyjQDpnnRF/EUCsAsP4goX6K49y5Dd
         pkZJNt5BxR+3cSqQn6VGgRCedeAWTllCK5PY+cWTtBmOqnyvcyuDuhfhrnx6bqk0A97S
         eTNIFizXrcDfpxiVsMchiSCn5Zt66D8BBApWWah2KrK+uLQphnBfe6v4JhqFqVId83Ji
         agUROf2oqIeOOAmL1B6UeBLMMSV540is3d2Yxy1E/+dU3rr/uom7VYTi5pm+XkjH9Iz+
         p+PQ==
X-Gm-Message-State: AOAM530r1MCYaUpDHQN2fsIMnejmPubVE7KSPV6fWIc9pRrgfBmeDdVv
        wTV+2YLsS/f7j8E0ALeUKfC5dQbJzVzQT6A9MWmm2A==
X-Google-Smtp-Source: ABdhPJzrDXc4vT0Fk7D8staW62ex8KneZgtMn7QMusPWBtWdKsMcFJ9BaCm5zAqfshm6yQqG8tawHz9xEn9pKWy5XT4=
X-Received: by 2002:a05:6512:11f2:: with SMTP id p18mr4450601lfs.535.1612892385826;
 Tue, 09 Feb 2021 09:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-4-john.stultz@linaro.org> <8a4cacb7-3042-53c7-02fe-de18cc49fc0e@amd.com>
 <CALAqxLX7KT8Zqv+qjpbiDzSLubvDgXz6Ayk_U_q5e0veweHcFw@mail.gmail.com> <884a5f8f-00e2-5aa6-6dfb-67e86c89e599@amd.com>
In-Reply-To: <884a5f8f-00e2-5aa6-6dfb-67e86c89e599@amd.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 9 Feb 2021 09:39:33 -0800
Message-ID: <CALAqxLVtn664Xd-F2Te1Lqvte5WYBJ+Pdu336kga9xqntQPumw@mail.gmail.com>
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

On Tue, Feb 9, 2021 at 4:14 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
> Am 05.02.21 um 20:47 schrieb John Stultz:
> > On Fri, Feb 5, 2021 at 12:28 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Adding this to all pages would increase the memory footprint drastical=
ly.
> > Yea, that's a good point!  Hrm... bummer. I'll have to see if there's
> > some other way I can get the needed context for the free from the
> > generic page-pool side.
>
> What exactly is the problem here?

Me, usually. :)

> As far as I can see we just have the
> lru entry (list_head) and the pool.

Yea, I reworked it to an embedded drm_page_pool struct, but that is
mostly a list_head.

> How the lru is cast to the page can be completely pool implementation
> specific.

Yea, I had it do container_of(), just haven't gotten around to sending
it out yet.

Thanks so much for the feedback and ideas!

thanks
-john
