Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57107395A3C
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 14:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbhEaMQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 08:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbhEaMQv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 08:16:51 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE925C06174A
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 05:15:10 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id 22so8865577pfv.11
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 05:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZrO5EoGp0aqI4U9edzA9+DdGnIJnfZ7S2pNXXSDEWA0=;
        b=gByaRhuj+Slb+b7TGJsldTArZ7e+3mhcvn2wdxsjqw+VkLABw9qrj+23Bu5Gts0R+G
         Ds/5gGZG3A04sxfGh6H5QgqXNK5lfTbNAPbeJcjcs/M7yXXb3bmKzEOIjSlKOxs00d7f
         rBCf4xiIlK6KoatAADWC/Q7uZavmRY/a1TmPBb1ACLxd43nbBkA89ywo+r56+b2MoaJb
         24Rzeawazy9krqSUVBeNFISE76rrhST8syqtSyywRAc6VB54CMyzVc8+uz82A4SK1g+l
         ysyaJDxytTgbopr/OFNt5KptPHTDeN9xTu1lvoIJKS1vCPkMNbJNaYDIX6qn4bLZlfPw
         Wlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZrO5EoGp0aqI4U9edzA9+DdGnIJnfZ7S2pNXXSDEWA0=;
        b=oGebCGM4HBCc40N3raoPOPuNljDAiFGFWfF5Rne0UMa7j3ixgILh5zlTeq4uN4SsVi
         a0qwzzdZPC3RvZDpV63nO7nZQOD/ny17ee0RWSaHODE7qCwe8EjH8uN/eg5lWHWkUWnG
         tXrAhL378JC1fKoLNsH36je3LGM5eWHyKd2owRfBzlz5TXnSV1lL/67wpclEK/PnPgTD
         3/snOuZ/jtAWEjM+nthEy72XY6EZByxCQi7Nx20+R0MuphvtcZCThSdTSNAL5d/1VECJ
         zuvGUNUnpyaMEq3S3PNNcR8B32V+hmlLflEK7dA6q3LS7ewPz4aKZwmifuMy6Ntwjo+G
         elrw==
X-Gm-Message-State: AOAM533y1qVJQ7ghbBPLPIybvF/tFrbH0HCoiYta+wgQXyAb5BocUEXY
        lCV6ZQGfeoSU3AzdItIQnXaWz9zbdXVvVBcPwQqBSrXofOn7EQ==
X-Google-Smtp-Source: ABdhPJyLKIYECrVKVAGsrwT0VjrtzJzkkKBVsPZ9SKhee3M1rS+GLkUfJoHa1mex6LZID9vPr8JMha2BXW8PPLAeO1s=
X-Received: by 2002:a05:6a00:88a:b029:261:6d37:dac6 with SMTP id
 q10-20020a056a00088ab02902616d37dac6mr16678883pfj.18.1622463310297; Mon, 31
 May 2021 05:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-16-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-16-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 31 May 2021 14:14:59 +0200
Message-ID: <CAG3jFyvOb9diNqmLyc2mT+WoQaAkeCYPk3GaOJQy5ges5w54Eg@mail.gmail.com>
Subject: Re: [PATCH 15/17] media: camss: add support for V4L2_PIX_FMT_GREY for
 sdm845 HW
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Add this common format to the various format lists relevant to sdm845.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-170.c | 7 +++++++
>  drivers/media/platform/qcom/camss/camss-csiphy.c   | 1 +
>  drivers/media/platform/qcom/camss/camss-vfe.c      | 1 +
>  drivers/media/platform/qcom/camss/camss-video.c    | 2 ++
>  4 files changed, 11 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
> index 9f6334fd68fc..5258e2099a43 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
> @@ -262,6 +262,13 @@ static const struct csid_format csid_formats[] = {
>                 10,
>                 1,
>         },
> +       {
> +               MEDIA_BUS_FMT_Y8_1X8,
> +               DATA_TYPE_RAW_8BIT,
> +               DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +               10,
> +               1,
> +       },
>         {
>                 MEDIA_BUS_FMT_Y10_1X10,
>                 DATA_TYPE_RAW_10BIT,
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index b3c3bf19e522..f82f1e2aa688 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -94,6 +94,7 @@ static const struct csiphy_format csiphy_formats_sdm845[] = {
>         { MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
>         { MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
>         { MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
> +       { MEDIA_BUS_FMT_Y8_1X8, 8 },
>         { MEDIA_BUS_FMT_Y10_1X10, 10 },
>  };
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index dec89079c6ae..e7ab2c175ac9 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -118,6 +118,7 @@ static const struct vfe_format formats_rdi_845[] = {
>         { MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
>         { MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
>         { MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
> +       { MEDIA_BUS_FMT_Y8_1X8, 8 },
>         { MEDIA_BUS_FMT_Y10_1X10, 10 },
>         { MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16 },
>  };
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index f282275af626..54e77d30d452 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -176,6 +176,8 @@ static const struct camss_format_info formats_rdi_845[] = {
>           { { 1, 1 } }, { { 1, 1 } }, { 14 } },
>         { MEDIA_BUS_FMT_SRGGB14_1X14, V4L2_PIX_FMT_SRGGB14P, 1,
>           { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> +       { MEDIA_BUS_FMT_Y8_1X8, V4L2_PIX_FMT_GREY, 1,
> +         { { 1, 1 } }, { { 1, 1 } }, { 8 } },
>         { MEDIA_BUS_FMT_Y10_1X10, V4L2_PIX_FMT_Y10P, 1,
>           { { 1, 1 } }, { { 1, 1 } }, { 10 } },
>         { MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, V4L2_PIX_FMT_Y10, 1,

Reviewed-by: Robert Foss <robert.foss@linaro.org>
