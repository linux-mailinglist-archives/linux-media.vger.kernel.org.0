Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C80A75F4006
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 11:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbiJDJmL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 05:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbiJDJlk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 05:41:40 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A012203
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 02:38:58 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id z23so10872849ejw.12
        for <linux-media@vger.kernel.org>; Tue, 04 Oct 2022 02:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5FR97fGXAiBrkHln5FkqT1so2VCUAamMm/I118F13JM=;
        b=rkkrgNhiAhlCkXI2RbPyKeiU/1wtJ+Oa0nmRbxr35R4DZ9rmMAES562+P3EY9QMXQ1
         u9/GeSi4N6XMRKbXab9zAbZ2ocLQIxjmfIOZV2V+iEm6PkuB+NB42gau413HoU3v88ob
         jWQ8eGRW/708nZcWPJmxoNhOwycgDQhVZkFzfQoevYAJc5+cT+GdeoMQArP9DwfDaKA2
         6aXv20EtmU/+cyYI7zlZmVtO2O+Z6GO1KLS8oQpXZtL/h+3npVqMpCh2vBfdHv2AA1Oz
         1k1KLfCT0+vmYy4mls/IHxax4QjL+xlE8NHaNDf6LsZwqMGrQpWzsf3ZNQcECvJLFcxO
         Bebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5FR97fGXAiBrkHln5FkqT1so2VCUAamMm/I118F13JM=;
        b=n7vURK93O8yeSSPJb4nBGUychnaaXyx5F5hvRidYpRu/W7phIVr6MifzSthI2m0EIU
         6l7EtN7z9bf9UjijsnpQabwYkuvEuNX6ZcwrAJwMve9bfBTlR3USaf3it2gklIIF9EZC
         Tj4RB/j5AFTAVLHRmqbkcxxvtOVGW+p697bDaiZTNKM5XqgbS7QGko10v9QYixj4DOrQ
         vOmmKy8DBBfSuGmwxa2z56f5WyMxMpcFM68RSiii/cPt3RxyCRUs6rKJbpJ0DoDgz7zi
         bi3euZgBxcjy4pZlDk+E0kGPQD1WATrdfnIoxVYAhsX5ClSSLIjdrcUNZUbAJK+cJpYI
         Wusg==
X-Gm-Message-State: ACrzQf1QUdM2jgT5IsTrAhlE/LDPuUFb/tlJ2fd6Mo+qn3whUzS5XmL5
        TXVdE8ZBmpmrjj9RzKinuAw+69+gkreA8QTHa2jssg==
X-Google-Smtp-Source: AMsMyM7iiGoFwiBFBNuqHjdguNPFuBilacPpHl9+3DSxbB7PaLx7ZEhr9HzGEHq3z2tdFTFq5YPHUVNmEKdTfrj8ZvE=
X-Received: by 2002:a17:907:743:b0:740:ef93:2ffc with SMTP id
 xc3-20020a170907074300b00740ef932ffcmr18845688ejb.514.1664876336611; Tue, 04
 Oct 2022 02:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220926142505.1827-1-quic_mmitkov@quicinc.com> <20220926142505.1827-3-quic_mmitkov@quicinc.com>
In-Reply-To: <20220926142505.1827-3-quic_mmitkov@quicinc.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 4 Oct 2022 11:38:45 +0200
Message-ID: <CAG3jFyu8tDagGqoi1896Ge=OLVJdN_SziD22KfdKPe6oS--1HA@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: camss: vfe: Reserve VFE lines on stream start
 and link to CSID
To:     quic_mmitkov@quicinc.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org,
        bryan.odonoghue@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 26 Sept 2022 at 16:25, <quic_mmitkov@quicinc.com> wrote:
>
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>
> For multiple virtual channels support, each VFE line can be in either
> ON, RESERVED or OFF states. This allows the starting and stopping
> of a VFE line independently of other active VFE lines.
>
> Also, link the CSID entity's source ports to corresponding VFE lines.
>
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 7 +++++++
>  drivers/media/platform/qcom/camss/camss.c     | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index a26e4a5d87b6..cd8ac0478cf1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -738,8 +738,10 @@ static int vfe_set_stream(struct v4l2_subdev *sd, int enable)
>         struct vfe_line *line = v4l2_get_subdevdata(sd);
>         struct vfe_device *vfe = to_vfe(line);
>         int ret;
> +       int i;
>
>         if (enable) {
> +               line->output.state = VFE_OUTPUT_RESERVED;
>                 ret = vfe->ops->vfe_enable(line);
>                 if (ret < 0)
>                         dev_err(vfe->camss->dev,
> @@ -749,6 +751,11 @@ static int vfe_set_stream(struct v4l2_subdev *sd, int enable)
>                 if (ret < 0)
>                         dev_err(vfe->camss->dev,
>                                 "Failed to disable vfe outputs\n");
> +
> +               /* At least one VFE line remains, return -EBUSY to avoid premature pipeline stop */
> +               for (i = 0; i < vfe->line_num; i++)
> +                       if (vfe->line[i].output.state != VFE_OUTPUT_OFF)
> +                               return -EBUSY;
>         }
>
>         return ret;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1118c40886d5..63653ac3e056 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1320,7 +1320,7 @@ static int camss_register_entities(struct camss *camss)
>                                         struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
>
>                                         ret = media_create_pad_link(&csid->entity,
> -                                                                   MSM_CSID_PAD_SRC,
> +                                                                   MSM_CSID_PAD_FIRST_SRC + j,
>                                                                     &vfe->entity,
>                                                                     MSM_VFE_PAD_SINK,
>                                                                     0);
> --
> 2.37.3
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
