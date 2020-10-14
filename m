Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE52D28E1B0
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 15:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388743AbgJNNuf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 14 Oct 2020 09:50:35 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39278 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgJNNuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 09:50:35 -0400
Received: by mail-ot1-f67.google.com with SMTP id f10so3472189otb.6;
        Wed, 14 Oct 2020 06:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XcEpTkw1Hudp3Em2mlbtxnQrshryRfohDwMtnJSmICA=;
        b=RcCzYtzQCQXK2MTc413X3w3Xow3sunRMTH2vF72EDZg/c1/62PfIm5ezDFB0ld/OFz
         zYi7xLLdElhJV/LutHX/i/rGeOeKqwrR7TMMEf4yS4HMW6BOJjIp251YLNOS0JCcHf8q
         BKSH27+6eg5qAZ/bt6isJ20pcpzKjJRLVreZWngDBgzxVjptG07UrT6PVBXqz/O/mqpz
         wEIulqp017E+2vnLJwwsyglo1L/Z+DViff2gis3y0g5i4/2wR4Hxf919ihziyPis//de
         U2ObsAonjKq785laPaCDoFoZyfhHxhMr8S8tEVGQ8m+g54hcGVj+mDrN3rA94yyClO8I
         hqtA==
X-Gm-Message-State: AOAM530ASQL2dZRnwA7AMlGFbmI0qdRYccfGH8EuGArN/PJlH8At/atH
        HapM9eForxJbYG1I9FnGoZH5j7orvJcHDOmh9MI=
X-Google-Smtp-Source: ABdhPJyYtDpLWVZ6zHhoxuzRGLITytMyVDxGm0R5aYJ+MrdYwspSwCHppKiYps/Ajazqh7BplWzqMvibhBVqrD+4+Kw=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr3660748otb.250.1602683434638;
 Wed, 14 Oct 2020 06:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200910080933.40684-1-yuehaibing@huawei.com> <20200911112707.32232-1-yuehaibing@huawei.com>
In-Reply-To: <20200911112707.32232-1-yuehaibing@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Oct 2020 15:50:23 +0200
Message-ID: <CAMuHMdWm8H7BYK+niLu4COGcsrdAd4Egit7T4+Mc5Fz8NhmjYg@mail.gmail.com>
Subject: Re: [PATCH v2 -next] media: marvell-ccic: Fix -Wunused-function warnings
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 11, 2020 at 1:50 PM YueHaibing <yuehaibing@huawei.com> wrote:
> If CONFIG_PM is n, gcc warns:
>
> drivers/media/platform/marvell-ccic/mmp-driver.c:324:12: warning: ‘mmpcam_runtime_suspend’ defined but not used [-Wunused-function]
>  static int mmpcam_runtime_suspend(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~~~~
> drivers/media/platform/marvell-ccic/mmp-driver.c:310:12: warning: ‘mmpcam_runtime_resume’ defined but not used [-Wunused-function]
>  static int mmpcam_runtime_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~~~
>
> Mark them as __maybe_unused to fix this.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
