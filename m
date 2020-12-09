Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04992D4065
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 11:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730255AbgLIKz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 05:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730248AbgLIKz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 05:55:56 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 084FEC0613D6
        for <linux-media@vger.kernel.org>; Wed,  9 Dec 2020 02:55:16 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id f14so666800pju.4
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 02:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5Q1tNH2c9CiPB2apafl9nqbMwDpY3uolU0PxNGFQB8=;
        b=O9WnD6NstpZXgrdiAigsFEFowQDxAJEw91fmZ1n3XytM2JrWVng1jqbZheqmayrqEV
         0zVt4BM9fi1ieOOsiXzwmZdGnb4IdNgNHWoTbQT6jCsPNQ72opVaJtnc/iZQo14TXSrG
         VI0zYbD/IqCpq6k2qqo3JXHlTqrDNqXEtSCfhJhFhRxBO+zqX8I4TjFRPmPAHltQ2m7L
         mOEMnS6L/xfgqqOZkbOMhsf3LpszlWAqpzIDCaKD633h8ZU4YLmwUIpOsjlG7EgiCWcT
         VvQoJDMTez4YZXZYaSppoH+3JvhCQk3YJcmxaoBDzyqqu7yc4tVr+yAvkh8a2ea7XSyc
         JGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5Q1tNH2c9CiPB2apafl9nqbMwDpY3uolU0PxNGFQB8=;
        b=VxelajFBoXNuhWkHPF9LOUio1k2L7dAt0kSxb2CDZGcucUCqcdAfFgeRIuvIX7vPEu
         gXgYrguRsIFXg7LCFYnD3iWb9YxuHfFQNQy85nHOao6YVKdt37enuLiV49eICMbcwK/a
         Rb9hoxstmrTrEoh6UpwrWeMyUszqaviI7f0YqPYcL2QEVcSOGADJmlu15oGQCtw1GpRc
         dHxPNeHR1a7G78/zksKlteZBhJN5BIJL09yEo02/nvaECNHsifrG/xceX7wlON1YMOWC
         kQQBUp0i9p6Qm10gbjl2NYEhuQ+RQ9Wnuh9Xq6p2nl77cC7xR6M/oOO4ECFwGL4keB4z
         cuiw==
X-Gm-Message-State: AOAM530ZUE3I/TJezg5X66JzRQEgPbEJbi9duUXaiyDFmZjyTLExM1AK
        a1Q0dRI6UI8HQN7tsA49T1w7VCKckjC2Sh8e0wc0hA==
X-Google-Smtp-Source: ABdhPJxFPeseVjkwy63QtJO6iqkBaHXOXZ1XzbocSgDUEtOEMnhi2DUbCtaCYn+G4bUnxVVfpzhb/YdMrkxqdO5b7HI=
X-Received: by 2002:a17:90a:ab0f:: with SMTP id m15mr1635305pjq.222.1607511315508;
 Wed, 09 Dec 2020 02:55:15 -0800 (PST)
MIME-Version: 1.0
References: <X9BzujGgPAM/s+rG@mwanda>
In-Reply-To: <X9BzujGgPAM/s+rG@mwanda>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 9 Dec 2020 11:55:02 +0100
Message-ID: <CAG3jFyt_sj91k89U2qPKZbzRO4+Miox-7dBf2CMEnjDmTAJ5Aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: camss: Fix signedness bug in video_enum_fmt()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Dan,

Thank you for submitting this.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Wed, 9 Dec 2020 at 07:50, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This test has a problem because we want to know if "k" is -1 or a
> positive value less than "f->index".  But the "f->index" variable is a
> u32 so if "k == -1" then -1 gets type promoted to UINT_MAX which is
> larger than "f->index".  I've added an explicit test to check for -1.
>
> Fixes: a3d412d4b9f3 ("media: Revert "media: camss: Make use of V4L2_CAP_IO_MC"")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I could equally well have casted "k < (int)f->index" but I feel like
> this is more explicit and readable.
>
>  drivers/media/platform/qcom/camss/camss-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index bd9334af1c73..2fa3214775d5 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -579,7 +579,7 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>                         break;
>         }
>
> -       if (k < f->index)
> +       if (k == -1 || k < f->index)
>                 /*
>                  * All the unique pixel formats matching the arguments
>                  * have been enumerated (k >= 0 and f->index > 0), or
> --
> 2.29.2
>
