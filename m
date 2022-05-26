Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0A3534EB3
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 14:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbiEZMBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 08:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234318AbiEZMBO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 08:01:14 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D0DD029B
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 05:01:13 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id c2so1269231plh.2
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 05:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lUlIufSDBkjwRGikIYnntySsIitJmkjvs7vLr+Tbbww=;
        b=Ty5GBSN2iEIhDAeRutUOsSPEgLXLa6DPGZ7ZGHAdq6UjfavOeqFzyH7SGin/YpOugV
         tkKlPwPnmUaxeGt1d0DVEIc0xD2GKvhpBRgtE1x5dFgnHDbtE3ynzmc3baLfVBK3Ij3z
         5/GJgP5sqF162zVmo8pSyep6p4Tl2KXD9Xw1CSQ0QUqL1Nm/8OIdC4guhnS68FbyyJaa
         8UINrs+eGebUIKonnwNBc4LceeP5yxEa19rry/0aASHi+Wiz+RuzN70lQtl91J3+E6FI
         3tuI9CzQmrIgJ9AdmuKzh43fRKlKPo90KOf4oT0OkEMrAW2/T18zczJ6g0OOHNaLQVCn
         k3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lUlIufSDBkjwRGikIYnntySsIitJmkjvs7vLr+Tbbww=;
        b=GxEvI+6Ed0+jEKJchs8g4jBdrJybw+Wsm8S4SF6mDez8nS4pQ6mtYNpZ+5MWRv8Pdn
         kZ3d2Pjgzzp2NiLcHEYWUWw9llRNNZlaY6YNXqlNibLYBI0cXUQZ0uDtQan+YFO9ahaV
         LdbpFgoSfzbqNtzpij/lkJzq8prUkNc94u3+WKBWwJ9msReozuAEa/0QDVdTrj4ym4z8
         UxdT6vYuErtZnC0yK/vttGiLNyOUhAA5n5f8meqTyIS6S0e6a0Q4aFg+rXKf94+CqtJd
         pP0Gd2rmxViAiSDv2OBWlJiqnWByZmWJYMuMlAgyvWqpFzIvoV8mDH1e9JMZJLOsdVHR
         uRJA==
X-Gm-Message-State: AOAM533cq6NlSLsvLZb2Bh1M/EIrpshEuCd0zDzhpKCWKbf7U6W5uHwz
        Ksp6bUBX0c95YhvQyqOVX7djD3uBX7tSLzgO5ithKQ==
X-Google-Smtp-Source: ABdhPJw3gL9VX2LiWnW/hwS0uGQSrNbONre+VS5vdc0vFyQphqOWWV9oyEo4CdmmJJZkmg8N3h67TrbQSNIui8br0XY=
X-Received: by 2002:a17:90b:4d91:b0:1df:f18f:7836 with SMTP id
 oj17-20020a17090b4d9100b001dff18f7836mr2318571pjb.152.1653566472858; Thu, 26
 May 2022 05:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220523122513.2064305-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220523122513.2064305-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 May 2022 14:00:59 +0200
Message-ID: <CAG3jFyt_nB=1ymVECyMsXRh7hKFYREKtW=hx39y2bBjQPEzbVg@mail.gmail.com>
Subject: Re: [PATCH] media: camss: Move and unexport functions specific to ISPIF
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
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

On Mon, 23 May 2022 at 14:25, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Common exported functions msm_vfe_get_vfe_id() and msm_vfe_get_vfe_line_id()
> do not have any users outside of camss-ispif.c, move them to the latter
> object and staticize.
>
> The change is supposed to be a non-functional one.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../media/platform/qcom/camss/camss-ispif.c   | 39 ++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss-vfe.c | 34 ----------------
>  drivers/media/platform/qcom/camss/camss-vfe.h |  3 --
>  3 files changed, 37 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index 4ee11bb979cd..91e6a2b9ac50 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -1252,6 +1252,41 @@ static enum ispif_intf ispif_get_intf(enum vfe_line_id line_id)
>         }
>  }
>
> +/*
> + * ispif_get_vfe_id - Get VFE HW module id
> + * @entity: Pointer to VFE media entity structure
> + * @id: Return CSID HW module id here
> + */
> +static void ispif_get_vfe_id(struct media_entity *entity, u8 *id)
> +{
> +       struct v4l2_subdev *sd;
> +       struct vfe_line *line;
> +       struct vfe_device *vfe;
> +
> +       sd = media_entity_to_v4l2_subdev(entity);
> +       line = v4l2_get_subdevdata(sd);
> +       vfe = to_vfe(line);
> +
> +       *id = vfe->id;
> +}
> +
> +/*
> + * ispif_get_vfe_line_id - Get VFE line id by media entity
> + * @entity: Pointer to VFE media entity structure
> + * @id: Return VFE line id here
> + */
> +static void ispif_get_vfe_line_id(struct media_entity *entity,
> +                                 enum vfe_line_id *id)
> +{
> +       struct v4l2_subdev *sd;
> +       struct vfe_line *line;
> +
> +       sd = media_entity_to_v4l2_subdev(entity);
> +       line = v4l2_get_subdevdata(sd);
> +
> +       *id = line->id;
> +}
> +
>  /*
>   * ispif_link_setup - Setup ISPIF connections
>   * @entity: Pointer to media entity structure
> @@ -1285,8 +1320,8 @@ static int ispif_link_setup(struct media_entity *entity,
>                         sd = media_entity_to_v4l2_subdev(entity);
>                         line = v4l2_get_subdevdata(sd);
>
> -                       msm_vfe_get_vfe_id(remote->entity, &line->vfe_id);
> -                       msm_vfe_get_vfe_line_id(remote->entity, &id);
> +                       ispif_get_vfe_id(remote->entity, &line->vfe_id);
> +                       ispif_get_vfe_line_id(remote->entity, &id);
>                         line->interface = ispif_get_intf(id);
>                 }
>         }
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 5b148e9f8134..76e28b832568 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1422,40 +1422,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>         return 0;
>  }
>
> -/*
> - * msm_vfe_get_vfe_id - Get VFE HW module id
> - * @entity: Pointer to VFE media entity structure
> - * @id: Return CSID HW module id here
> - */
> -void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id)
> -{
> -       struct v4l2_subdev *sd;
> -       struct vfe_line *line;
> -       struct vfe_device *vfe;
> -
> -       sd = media_entity_to_v4l2_subdev(entity);
> -       line = v4l2_get_subdevdata(sd);
> -       vfe = to_vfe(line);
> -
> -       *id = vfe->id;
> -}
> -
> -/*
> - * msm_vfe_get_vfe_line_id - Get VFE line id by media entity
> - * @entity: Pointer to VFE media entity structure
> - * @id: Return VFE line id here
> - */
> -void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id)
> -{
> -       struct v4l2_subdev *sd;
> -       struct vfe_line *line;
> -
> -       sd = media_entity_to_v4l2_subdev(entity);
> -       line = v4l2_get_subdevdata(sd);
> -
> -       *id = line->id;
> -}
> -
>  /*
>   * vfe_link_setup - Setup VFE connections
>   * @entity: Pointer to media entity structure
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 0eba04eb9b77..cbc314c4e244 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -163,9 +163,6 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>
>  void msm_vfe_unregister_entities(struct vfe_device *vfe);
>
> -void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id);
> -void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
> -
>  /*
>   * vfe_buf_add_pending - Add output buffer to list of pending
>   * @output: VFE output


Reviewed-by: Robert Foss <robert.foss@linaro.org>
