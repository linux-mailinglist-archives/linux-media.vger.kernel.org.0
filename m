Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07D43B9627
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 20:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbhGASbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 14:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhGASbk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 14:31:40 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF40C061764
        for <linux-media@vger.kernel.org>; Thu,  1 Jul 2021 11:29:10 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 67-20020a17090a0fc9b02901725ed49016so1570920pjz.1
        for <linux-media@vger.kernel.org>; Thu, 01 Jul 2021 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=APe8ECviB/cpQRnW4kX3yPns2UM4S6BVFeIAOgFnMX8=;
        b=xRUMtCRD+qOYmKFjmmnqa0WdPbLyw9rAmGpaJeQy+BZeqH/it2wzsYYl6EIe6ytE8q
         tjyObLMXBJTGN/5OUqO+srsn7hLv6bs2LJ7YlXZcjpo1ZwbtagJeE8dA9iAbdrL4Y8fc
         MHwfA2nMRsWV80FxWgJgyDZoIZKTRmJL/WW4BHYRIEOnQ2n0Y4VjO+Bf9Z8H9trRF60Q
         4aOvbm7In8zqGqO/fuTRXMbUGA5IlxebuoKT4imEhwEcx+wfhqborOZ0szmbXx5JpA5p
         KqoH772Wr6DDAS4Pxm6UpEwHucapj9MGfZThb8LqqlsWQCDsQsbvLuwYChHkpNF1AdFd
         4+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=APe8ECviB/cpQRnW4kX3yPns2UM4S6BVFeIAOgFnMX8=;
        b=JlxkanCNcUstumB+tO2QAbCYu5lEzrT1apqW2jk6e3+YspWmk/jnqGept1wkNmG834
         X2M340aAjub7nzpyC7qpgrDaIzMA5aR8S8gUzaO3h8Kw3rhy9bk2yXdekNal2QA95Tjq
         PdXXyowd/43Iv7TTlslbmC96qRHpVI+4Rf4AuiUASvllu5qiNGWgb9OWneD9ozQfacdR
         d0Pf7QgjuYefOfX3InBa2WvVu9Jq9i4C2XcxkfL2Zv4zzZed8XB5j36h5UnWFwaMCF9b
         XuImZi0KPLCcJsSp0V7mECJ5TPZQk2uiflodHqFKW51cFCmXBf82u7tKujNaFO8WYgxT
         C0Eg==
X-Gm-Message-State: AOAM533MH1V/ukL0VLLj2yu804OCgYR5olL+ttzM2FUtCs9tnrBJLSis
        N0EGlUplKM5+HwWSmefFrU38Yd9iMS76hlpRLWYb+w==
X-Google-Smtp-Source: ABdhPJxCOjdtDhn+6b6X1KFzfnquF3W5FHWHyQTkCTnb1rH0xhQkdRusQnrJquTOZSO/7mtsJ2nTeatWgJql0Wa9th8=
X-Received: by 2002:a17:90b:3146:: with SMTP id ip6mr939866pjb.125.1625164149359;
 Thu, 01 Jul 2021 11:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210604212217.70518-1-festevam@gmail.com> <20210604212217.70518-2-festevam@gmail.com>
In-Reply-To: <20210604212217.70518-2-festevam@gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 1 Jul 2021 11:28:58 -0700
Message-ID: <CAJ+vNU35+U=pupo3bzKFnWuZgUKPe_C-0yGrcWnZH1R+PvbbWg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Matthew Michilot <matthew.michilot@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 4, 2021 at 2:22 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> From: Matthew Michilot <matthew.michilot@gmail.com>
>
> Captured video would be out of sync when using the adv7280 with
> the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) had to
> be configured properly to ensure BT.656-4 compatibility.
>
> An error in the adv7280 reference manual suggested that EAV/SAV mode
> was enabled by default, however upon inspecting register 0x31, it was
> determined to be disabled by default.
>
> Signed-off-by: Matthew Michilot <matthew.michilot@gmail.com>
> Reviewed-by: Tim Harvey <tharvey@gateworks.com>
> [fabio: Introduce "adv,force-bt656-4" to not affect the existing users]
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Remove the part number from the property name (Rob)
>
>  drivers/media/i2c/adv7180.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 44bb6fe85644..a532df813d74 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -94,6 +94,7 @@
>  #define ADV7180_REG_SHAP_FILTER_CTL_1  0x0017
>  #define ADV7180_REG_CTRL_2             0x001d
>  #define ADV7180_REG_VSYNC_FIELD_CTL_1  0x0031
> +#define ADV7180_VSYNC_FIELD_CTL_1_NEWAV 0x12
>  #define ADV7180_REG_MANUAL_WIN_CTL_1   0x003d
>  #define ADV7180_REG_MANUAL_WIN_CTL_2   0x003e
>  #define ADV7180_REG_MANUAL_WIN_CTL_3   0x003f
> @@ -216,6 +217,7 @@ struct adv7180_state {
>         struct i2c_client       *vpp_client;
>         const struct adv7180_chip_info *chip_info;
>         enum v4l2_field         field;
> +       bool                    force_bt656_4;
>  };
>  #define to_adv7180_sd(_ctrl) (&container_of(_ctrl->handler,            \
>                                             struct adv7180_state,       \
> @@ -963,10 +965,26 @@ static int adv7182_init(struct adv7180_state *state)
>                 adv7180_write(state, ADV7180_REG_EXTENDED_OUTPUT_CONTROL, 0x57);
>                 adv7180_write(state, ADV7180_REG_CTRL_2, 0xc0);
>         } else {
> -               if (state->chip_info->flags & ADV7180_FLAG_V2)
> -                       adv7180_write(state,
> -                                     ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
> -                                     0x17);
> +               if (state->chip_info->flags & ADV7180_FLAG_V2) {
> +                       if (state->force_bt656_4) {
> +                               /* ITU-R BT.656-4 compatible */
> +                               adv7180_write(state,
> +                                             ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
> +                                             ADV7180_EXTENDED_OUTPUT_CONTROL_NTSCDIS);
> +                               /* Manually set NEWAVMODE */
> +                               adv7180_write(state,
> +                                             ADV7180_REG_VSYNC_FIELD_CTL_1,
> +                                             ADV7180_VSYNC_FIELD_CTL_1_NEWAV);
> +                               /* Manually set V bit end position in NTSC mode */
> +                               adv7180_write(state,
> +                                            ADV7180_REG_NTSC_V_BIT_END,
> +                                            ADV7180_NTSC_V_BIT_END_MANUAL_NVEND);
> +                       } else {
> +                               adv7180_write(state,
> +                                             ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
> +                                             0x17);
> +                       }
> +               }
>                 else
>                         adv7180_write(state,
>                                       ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
> @@ -1314,6 +1332,7 @@ static int init_device(struct adv7180_state *state)
>  static int adv7180_probe(struct i2c_client *client,
>                          const struct i2c_device_id *id)
>  {
> +       struct device_node *np = client->dev.of_node;
>         struct adv7180_state *state;
>         struct v4l2_subdev *sd;
>         int ret;
> @@ -1338,6 +1357,9 @@ static int adv7180_probe(struct i2c_client *client,
>                 return ret;
>         }
>
> +       if (of_property_read_bool(np, "adv,force-bt656-4"))
> +               state->force_bt656_4 = true;
> +
>         if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
>                 state->csi_client = i2c_new_dummy_device(client->adapter,
>                                 ADV7180_DEFAULT_CSI_I2C_ADDR);
> --
> 2.25.1

Fabio,

Thanks for the submission. This does resolve NTSC capture on a
GW5410-G with an adv7280.

Reviewed-by: Tim Harvey <tharvey@gateworks.com>
Tested-by: Tim Harvey <tharvey@gateworks.com>

Best regards,

Tim
