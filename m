Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3010F354EAF
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 10:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbhDFIbS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 04:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbhDFIbR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 04:31:17 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DF7C061756
        for <linux-media@vger.kernel.org>; Tue,  6 Apr 2021 01:31:10 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id v8so7064188plz.10
        for <linux-media@vger.kernel.org>; Tue, 06 Apr 2021 01:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gm4kCiogAkI78+mLUObZxBjBM0j57F/TvToNpIy9z3Y=;
        b=eINOdpHbzO+V37M3z/6K96WyaV4Vh4kXYW8GpHJ+hlaOK4AUS8lpl6jjGj43x434TK
         1GdMHmDq+AMUdl6gkP9GOYsH194Yz7qvkvS+f8ZLBo9fhn0GzoKlzWGM9lvQwLWfAWrM
         jAAaDj1StPuQ0pO+oVwuM7IEuTKlPGd+vuIogf7ZeSsHBR5tpTBgOF0zKc6J+vyACJUQ
         cu6W4Me/6V2Y/YD7lwpM0+mXP/hWn1iDFiLnUsHJNb0Lfxw7dE7q6/IeJ/uNRv4i578o
         c/mFtMjtk+Sta1rjSb5ySISVwSGRcOV9+5YvNLji82zIDNhFZrfslyrQb7ps3Xu+aNmC
         IoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gm4kCiogAkI78+mLUObZxBjBM0j57F/TvToNpIy9z3Y=;
        b=fe/qXpzY2GSk7SuZpiizUqEk33KJJeg/pTunWaNZp7qq5nBRkavQcu9dtqVQ7ogUfS
         K4nyiv+CxXut6F7vIZRHdkiVriE+mXkQHXEWG2e2NdyBA6puWh3/1nP0YFrsS15Ep/B3
         VDCMKZsdk8sl3eCWPfn87h6x7LiqkITCcRlWsJUcvrKxXmhBCWQ7PTEg9eXjA2zTP0JA
         sNM4M0Z8LSlG6UW6Y6TFlK99JJ/xBPmbAkLcLDrExRPn1nFYcSMPGzWVv82sqYX6m7hl
         aJtkOSQBoSiZmao5zd8RYWWOX6ipMrekPa2qDb0pSpK0kAiyUcnIjc23UkP1ux/KGcHI
         DVaw==
X-Gm-Message-State: AOAM532n76t13pxZ+SOSs9aRYe6slnjWdE9Jb/TmaEG26b16mPNQ6xhR
        wBN78z5ic2UUfLC7B5kaL1omtLIE12osKv3usEFbnA==
X-Google-Smtp-Source: ABdhPJywC7pKeT35dxTuADanUaA07cRvZDmhJp2mf6McnAv/Ygqaj6eNJPwn2QxjYKn5mIhcB28ZShNdcIabXaJyx08=
X-Received: by 2002:a17:90a:c908:: with SMTP id v8mr3356831pjt.75.1617697869378;
 Tue, 06 Apr 2021 01:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210402093255.2457184-1-yangyingliang@huawei.com>
In-Reply-To: <20210402093255.2457184-1-yangyingliang@huawei.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 6 Apr 2021 10:30:58 +0200
Message-ID: <CAG3jFyteoPaHe=0Q2FrduRchH+Or+M+PDBCor0uKYaGH3feyog@mail.gmail.com>
Subject: Re: [PATCH -next] media: camss: csid: Remove redundant dev_err call
 in msm_csid_subdev_init()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

Thanks for the fix.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 2 Apr 2021 at 11:29, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 463760c29294..cc11fbfdae13 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -568,10 +568,8 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>
>         r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
>         csid->base = devm_ioremap_resource(dev, r);
> -       if (IS_ERR(csid->base)) {
> -               dev_err(dev, "could not map memory\n");
> +       if (IS_ERR(csid->base))
>                 return PTR_ERR(csid->base);
> -       }
>
>         /* Interrupt */
>
> --
> 2.25.1
>
