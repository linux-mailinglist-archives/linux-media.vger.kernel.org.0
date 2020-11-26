Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008862C51F5
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 11:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732187AbgKZKYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 05:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727802AbgKZKYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 05:24:05 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B18C0613D4
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 02:24:05 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id 81so1385674pgf.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 02:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2R023jK/jySyc2ThkcodiKMCIemCYz5dhfsXGWcapeo=;
        b=WtG8edUFIOQfbtmFC2x6S1vHUdNfwiyjTSJ+r49nQ9DX0E97XyQQIyo+By/GhK9mJj
         jLXpTUDznUDBc06D/YMvXfmrX2eOjXuH4EBpW6IUQVHYNTtKYx/fcoS1cRuy/NJdOJ5O
         vRVvOzrDgyadv+XN3m0rt7f7yST9Ybes6zITEazlr5x2rECiW1M92bpx67KRogJD4xme
         N+X1UIQ/c/uKO3gmoZ5H3hxtfITwysBWVm8xaEO6h2EiRj9BZfhc+5CiAq5vPh5LQsTH
         2MMZfK9Pdx+nvG2oQd7RzUD3XEVo2n6bAC+VQ2EZ0xPgWAyEHAeeNufrnDlpBBkHr2lV
         ar4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2R023jK/jySyc2ThkcodiKMCIemCYz5dhfsXGWcapeo=;
        b=h9GByUtKHcduATIkZ/7b3qG1gb30IlG2woLjzzGvo5k5ojGUt/EpJ+egR1bhRayWOm
         M/6m6GrhadC6b8CJfWRaAk27LkjCriXlFJyt82WcoIGO3NMTmTYy5gT4QbZ+t4kOP+dv
         QyWu3rNPv3Eun18bmlRfC2Gdx7l6sOt2iLQI2s2QtwKq2HBQj27mf6aYz2DDD0bQAi/5
         +1rj0ScFRR+8hOJzKIRWuhC4lmkyZ9PigSie+xba7nNWkTUlvXzEKV6YSRek7E394WwP
         ZT3VzKQ1tGGIbUSA4tPhbRSZT/bbBGNb9fj67Ljqb/4Hp6vcHI/Pdj2xxQhdilC2MZF+
         DCcw==
X-Gm-Message-State: AOAM533fA21WL6c6QZAPSWokMTloKq0OhPVHhGHXReImD9/aJDkpJrWl
        XYTL/9n2KNJxJ/kMIkZ2ECaLMEJmYDxMoNQyUJ40Wg==
X-Google-Smtp-Source: ABdhPJxADi+2kXJcVCY0WNWjC0G9/YRhXjQmT0GZkyuRMtxP0Vfa1rFm2NfNcmJoeMh0ygcyGlxJteijEEUdY4vxjrU=
X-Received: by 2002:a17:90b:19c4:: with SMTP id nm4mr2809398pjb.222.1606386244819;
 Thu, 26 Nov 2020 02:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20201125123710.28491-1-andrey.konovalov@linaro.org> <2a0f255c-1e58-aacc-40ec-86aaca72f500@free.fr>
In-Reply-To: <2a0f255c-1e58-aacc-40ec-86aaca72f500@free.fr>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 Nov 2020 11:23:53 +0100
Message-ID: <CAG3jFyuAKkSAVOdwVfTg=34ziFWcEr4SsjMmdx2hqZ+fGP7u0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "media: camss: Make use of V4L2_CAP_IO_MC"
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Andrey,

Thanks for finding this issue, reverting and coming up with a better
solution seems like a good idea.
With the above nit fix, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 26 Nov 2020 at 11:20, Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 25/11/2020 13:37, Andrey Konovalov wrote:
>
> > This reverts commit c90f1178dcac30dee5ddd29ec0513e7589aa866e.
> >
> > The assumption of "Each entry in formats[] table has unique mbus_code"
> > is valid for the RDI entities, but not for the PIX ones.
> >
> > Reverting this patch and creating a new one which handles the PIX entities
> > correctly results in smaller and more straitforward patch than doing the
> > changes on top of the current version.
>
>
> s/straitforward/straightforward  ;-)
