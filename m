Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065041A3336
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 13:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgDIL3h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 07:29:37 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36752 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgDIL3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 07:29:37 -0400
Received: by mail-ot1-f65.google.com with SMTP id l23so10122701otf.3
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2020 04:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4J/i6V/1QdnNSGaAcA+edv/F8tF+xHzfQSnNHUaF4fw=;
        b=dRI17dXoc1vNJBRR86jbL2cK6P218+HAQ4Y4Rd9tDKcqiMF4BdC1z6OUur+9ei4Nu/
         vwRGGxDI5KWSx9PBsR4cqBwYaxbMtUNoQwmAdOSSJbR4TD9T5BMX6QKGbTZMMvbN/DNh
         yjAmUVbwfR+ynMLf3XSB5jaMbdG/fFIJikierzbM8aC0LimuUb/Ld7XcjqTQccqdMvDe
         KxwQgRTHPnwaUB/WVWEIxZzSmPrGW1pzfUns3v1oUCJvQElkfDZFvNDpMaKg+KWarxI1
         CzOuNE5EFm3kuUsRoptCaj+XyXDn8BuJMIfeTCGtfowGzyG5AOu6GKzMv3DVMc4C5g37
         k5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4J/i6V/1QdnNSGaAcA+edv/F8tF+xHzfQSnNHUaF4fw=;
        b=PapXdVwj1bXhI6omYWlMkWwZlVLzQQcZ6Y5CJk7ufbmG/tmdGE6wVMmqZETE+zFUWH
         y+SCgu/odPY/6ZgtFR2HhF3vbHuhko0SBYOhOfxpNncrv1ecU4CFaTrVDfWksQC7CK5P
         pwR8XC9CzQrtWuI1ExmBROCFy29LRt53ffjMHi7anZ7yvnZvefFXz6usCr8MW6K7Kidi
         Pfta/X+/GslvllrOSGVTXxy7DL3j89rVwDUgUApr789rCwdQT1r/7p7q0oWkvh5PgQYe
         cHQmFLRLoXmQYM92wqgnfq9tSQhs/2JfVpAx3Vq+zKqtjGflpfT0lcPjQXnnB3bMFWsQ
         KoKQ==
X-Gm-Message-State: AGi0PuYqJ3YefbYPGr2IltRI5hlFWPAIO1hdPe3Vq9uE7xi98nj3ai2A
        fss7SN8JgTmzYlf90k2ppgsQ/KKwi4jOwMAOME+QqA==
X-Google-Smtp-Source: APiQypI7XHuvNH5XB3Bm5u1+18NiyBysINtlWsS4MglDxOmwOg9OIK/11eK9XmvQK13zu4YwAdn3NrP/fmbSkmmIIng=
X-Received: by 2002:a05:6830:11d5:: with SMTP id v21mr9367768otq.91.1586431776790;
 Thu, 09 Apr 2020 04:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200409112404.21071-1-andrey.konovalov@linaro.org>
In-Reply-To: <20200409112404.21071-1-andrey.konovalov@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 9 Apr 2020 13:29:25 +0200
Message-ID: <CAG3jFyt8sUL0kJMCN=FYJp49BF=_BB6+MKVk04=7JcCAVovOFw@mail.gmail.com>
Subject: Re: [PATCH] media: camss: use proper media entity function for subdevices
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     todor.too@gmail.com, linux-media <linux-media@vger.kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Andrey,

Thanks for sending this out. I've tested this patch on a db410c board.

Tested-by: Robert Foss <robert.foss@linaro.org>


On Thu, 9 Apr 2020 at 13:24, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Currently for msm_csiphy, msm_csid, and msm_ispif subdevices the media
> entity function field is set to MEDIA_ENT_F_IO_V4L. This is incorrect
> as MEDIA_ENT_F_IO_V4L implies V4L2 video node.
>
> Change it to MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER as this is the best
> fit from the functions defined in include/uapi/linux/media.h.
>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c   | 2 +-
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 2 +-
>  drivers/media/platform/qcom/camss/camss-ispif.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index a5ae85674ffb..721d7434253e 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1356,7 +1356,7 @@ int msm_csid_register_entity(struct csid_device *csid,
>         pads[MSM_CSID_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>         pads[MSM_CSID_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>
> -       sd->entity.function = MEDIA_ENT_F_IO_V4L;
> +       sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>         sd->entity.ops = &csid_media_ops;
>         ret = media_entity_pads_init(&sd->entity, MSM_CSID_PADS_NUM, pads);
>         if (ret < 0) {
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 008afb85023b..03ef9c5f4774 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -737,7 +737,7 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>         pads[MSM_CSIPHY_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>         pads[MSM_CSIPHY_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>
> -       sd->entity.function = MEDIA_ENT_F_IO_V4L;
> +       sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>         sd->entity.ops = &csiphy_media_ops;
>         ret = media_entity_pads_init(&sd->entity, MSM_CSIPHY_PADS_NUM, pads);
>         if (ret < 0) {
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index 1f33b4eb198c..f04cdeafbcac 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -1323,7 +1323,7 @@ int msm_ispif_register_entities(struct ispif_device *ispif,
>                 pads[MSM_ISPIF_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>                 pads[MSM_ISPIF_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>
> -               sd->entity.function = MEDIA_ENT_F_IO_V4L;
> +               sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>                 sd->entity.ops = &ispif_media_ops;
>                 ret = media_entity_pads_init(&sd->entity, MSM_ISPIF_PADS_NUM,
>                                              pads);
> --
> 2.17.1
>
