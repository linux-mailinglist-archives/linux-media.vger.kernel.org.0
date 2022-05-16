Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 635FC52874D
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 16:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244242AbiEPOnw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 10:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbiEPOnv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 10:43:51 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C082DD67
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:43:49 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id q4so14616851plr.11
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4xPd51zy939NVBEotrgpcfDeP3YTrS+eiImf3uuWQYk=;
        b=URqpWG+tQCo0B0z+EiUx8eEm3LkP8jqdiCzJJcGqEyaaKqLZ6e9trHZgWE2mmdjirs
         +VXwK5XZcro7CBTFKTWEC6zNiU1BTFjOExDHzdZbLSaa0TyNnJEFYtSr9QOaJHCM+MrP
         h58HRtiLsFVtFuQiqScl44bLQ84bvYYaaQxZUut4P92muAa+1XeO7pKMeXSfhOTR8roX
         4ZaI4G4xGiJqoH0SHf3OVf4bJbyPe5SJxUnwKCEs/PEu9DWq7s2aYtLyXWrldI8Zl+j0
         Ov7NYS9s96FkukaTngcb5vLjzl7iPwCDXqK80r2Loho4mvlSCBTdzgOfnELR5tESFM8e
         AO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4xPd51zy939NVBEotrgpcfDeP3YTrS+eiImf3uuWQYk=;
        b=tV3JX6ameHZHiT7yC9B1JvKMAVvWam2ANwU6Sk7aMcPvEcsfNVw7jX1Oc9DmesrvRW
         83NrGfVZkQSLk7MlRaOhJ7A+L6hJ7QQXErVtjJEEkfcEcRBpx1FQkQzSF87uZ5SyQBKY
         jtW4rC1tUZaZgAdRfdkA/pzyItCkfzCSqVvJELBjuip/GY1WXD29l9QmQdxeZOeqUrDN
         FDSYYSXkPRB9N0xg4eJjGLPOEpWcQQ5XSNmdpeHuPEMM6znrYqZaF4WsHMrFJ8hr+DHr
         Srmp6DHFgUJTMF6+zYHFLCiffwM+xJCwhIKVc9TFoObEETHUnji3+zGhRTH0HBcUUMlc
         pvhw==
X-Gm-Message-State: AOAM531huBuK0QHVxAI9KTy5FHUTJlZhQn73fi/1X0rQPBquqNNMuB2L
        c/ULrrNamcKn4vOFnxjZq57+yRoyiTBhd/tHHoHYSw==
X-Google-Smtp-Source: ABdhPJyaT5uDQ4TotygR2N3udnaNMAmiSHsJCAkRMxVPOX+fzafhOA2wZgYN0W5QErhsEzGFMgAZujKPdTzdNUcQtHE=
X-Received: by 2002:a17:90b:1e4e:b0:1dc:583c:398 with SMTP id
 pi14-20020a17090b1e4e00b001dc583c0398mr19832864pjb.232.1652712229263; Mon, 16
 May 2022 07:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220509140439.1361352-1-yangyingliang@huawei.com>
In-Reply-To: <20220509140439.1361352-1-yangyingliang@huawei.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 16 May 2022 16:43:38 +0200
Message-ID: <CAG3jFyv8rjx2M9vZPbqNqT=ngv5JNt8PskQFR839fd6Z9gDVUw@mail.gmail.com>
Subject: Re: [PATCH] media: camss: csid: fix wrong size passed to devm_kmalloc_array()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 9 May 2022 at 15:53, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> 'supplies' is a pointer, the real size of struct regulator_bulk_data
> should be pass to devm_kmalloc_array().
>
> Fixes: 0d8140179715 ("media: camss: Add regulator_bulk support")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index f993f349b66b..80628801cf09 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -666,7 +666,7 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>         if (csid->num_supplies) {
>                 csid->supplies = devm_kmalloc_array(camss->dev,
>                                                     csid->num_supplies,
> -                                                   sizeof(csid->supplies),
> +                                                   sizeof(*csid->supplies),
>                                                     GFP_KERNEL);
>                 if (!csid->supplies)
>                         return -ENOMEM;
> --
> 2.25.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
