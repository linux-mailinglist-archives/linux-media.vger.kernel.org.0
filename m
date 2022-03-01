Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9311B4C8C47
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 14:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234926AbiCANLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 08:11:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234196AbiCANLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 08:11:37 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6844BB8D
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 05:10:56 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id l9so12949649pls.6
        for <linux-media@vger.kernel.org>; Tue, 01 Mar 2022 05:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DV6f3J2QIRehyEDByQEpoJ2xwDbM5hUK+3WRGSJAWlw=;
        b=YbuwEXN/UFumml2CqM42Aahs6NNSgs9Fax2qrLKsWK3mw8JfHkq7DpjMyrbU0N1Usx
         bmHQu6FoE6V/joJwRIjThReEFs/kkPktEhABl7uNtKNe1ufj8eTNvGoE/AsPxa9tN0MH
         YD2Vl0UrWh2AjVEa4A9t8oUMSSxRRk0ZSqcVsJea+OVqKXhqaDB7GRkUSKj/Nz/SRAAw
         VdmyNV4CpfsY3QB28aRqjKtc+LtehkS1v37iQzSUSkodUzze9ZLvTqTekeE7yyzHrLvr
         rDRrBC5VxnEFbnwtevr9seYx/NO/F3H4YESG9A5RcOi0srsUnLX2JDcq7Iij3SDDxdVy
         u9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DV6f3J2QIRehyEDByQEpoJ2xwDbM5hUK+3WRGSJAWlw=;
        b=JR1kGpjgMySFr/UHDPN9W4ron6RnI7wvxh0CW0MIFz340Xs5xGhvZQsvV4MirRovWb
         KdGyUzxmQr7T/JTuObPuOxFMEnNpFOk6JUzwMJUQoWmBYyBzX048Z/I/8ZaxQ2aUf7B0
         YxdUD5M8metbUn37gRiIKpwiQsLg9BS+cpVNqi7+h8XFkkI2+dq5PRuJ3I7bdZix5F5n
         G52unyXEC/25frHZ4QZy9rAY8GuNMibBuwp9gyHQ399TN7LAer1ZLU6q8vXw0s/nd0W8
         3kF2kzBFy68FlzfgrGtbxHR3SfIOPLqMD0OlgPH1Xn6lM7raqxRTivsZGmwb5nnc9O58
         dKwQ==
X-Gm-Message-State: AOAM532VwHrB2sZ9Eg173PIREaau0+xBBTkQkt8jzL00gjUox2TRhLD0
        OBLujO//k342q73xYmu4qiqqFlDPyddFwqtShz/Egg==
X-Google-Smtp-Source: ABdhPJyUTJreTDgP0C9OseilZ4NmT99vFUTYPcMXphbUrL9wNDsClw+KYh7/yJsMqqSZ7ZrQKj8DidkIMvcpRyd1WSY=
X-Received: by 2002:a17:902:c94f:b0:151:3cd8:efe3 with SMTP id
 i15-20020a170902c94f00b001513cd8efe3mr18961096pla.117.1646140255853; Tue, 01
 Mar 2022 05:10:55 -0800 (PST)
MIME-Version: 1.0
References: <20220301060530.5870-1-jrdr.linux@gmail.com>
In-Reply-To: <20220301060530.5870-1-jrdr.linux@gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 1 Mar 2022 14:10:44 +0100
Message-ID: <CAG3jFyugksy60Sgjg5U+E4ZGEH3mNpZmLJB_aZ=uncb7kg7zAA@mail.gmail.com>
Subject: Re: [PATCH] media: camss: Replace hard coded value with parameter
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
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

On Tue, 1 Mar 2022 at 07:05, Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>
>
> Kernel test robot reported below warning ->
> drivers/media/platform/qcom/camss/camss-csid-gen2.c:407:3:
> warning: Value stored to 'val' is never read
> [clang-analyzer-deadcode.DeadStores]
>
> Replace hard coded value with val.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index abbfbf448893..2031bde13a93 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -405,7 +405,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>                 writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(0));
>
>                 val = 0;
> -               writel_relaxed(0, csid->base + CSID_RDI_FRM_DROP_PATTERN(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(0));
>
>                 val = 1;
>                 writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(0));
> --
> 2.25.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
