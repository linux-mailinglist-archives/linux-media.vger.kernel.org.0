Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF96615B1E8
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2020 21:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgBLUdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Feb 2020 15:33:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:55280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727947AbgBLUdT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Feb 2020 15:33:19 -0500
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5F5624676;
        Wed, 12 Feb 2020 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581539599;
        bh=Bo+9/jUSa0NpQtciq7tNRztsfaEVnk+kdyhA8MoMgss=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ONC/jXagdwupezmQbJaHWSwDzDb2gj9Z0Q8pBqC4i/ggqDi7q0WADqDLcHeLL9qDL
         uYdr8h+1UZaJzn/dSCA/tU8ZXXvc+Pl4/ZFHpk5e6GhS85o2L/dAo9zcf1eUXc6PuT
         DBYPhvIoaSqddAlnrzgwZyymZdy5rcYy3bQAxVy0=
Received: by mail-qv1-f41.google.com with SMTP id y8so1569814qvk.6;
        Wed, 12 Feb 2020 12:33:18 -0800 (PST)
X-Gm-Message-State: APjAAAWmSN9Hk++F2Imt9v+xjWch4hY5nZNrpw7/sqKtvca71ZfaIATE
        XTLeENpTSRcZ04lSKiyU4p9p6mvNgYPJRclssA==
X-Google-Smtp-Source: APXvYqzre1CEhmCZxdnqAWYpg8FbsvimAbvrSYpW/TM7sS3n6YPLS4HOei7P5FSDxFM49Mt4fmLX+ckAuwTDSPKYjl4=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr20705135qvo.20.1581539597924;
 Wed, 12 Feb 2020 12:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20200203152724.42611-1-yuehaibing@huawei.com>
In-Reply-To: <20200203152724.42611-1-yuehaibing@huawei.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 12 Feb 2020 14:33:07 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+BFrJ-bdDuKxCJ0OX=rLGsoHVf6u55irCA7duCJBB7sA@mail.gmail.com>
Message-ID: <CAL_Jsq+BFrJ-bdDuKxCJ0OX=rLGsoHVf6u55irCA7duCJBB7sA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/panfrost: Remove set but not used variable 'bo'
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 3, 2020 at 9:33 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_cleanup':
> drivers/gpu/drm/panfrost/panfrost_job.c:278:31: warning:
>  variable 'bo' set but not used [-Wunused-but-set-variable]
>
> commit bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
> involved this unused variable.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied to drm-misc-fixes.

Rob
