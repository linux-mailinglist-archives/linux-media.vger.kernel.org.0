Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1DE57D056
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 17:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233158AbiGUPws (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 11:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbiGUPwr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 11:52:47 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6112D43E63
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 08:52:46 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id y8so2710674eda.3
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 08:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H6GmlPPoxI364VpvqINQP43FYgTjgXKR4hPzJuIwqB4=;
        b=NtWFFXWVe+5CarBLRLczuQF+xuyCjT8AWMjcLX9QpdhFRwGnanTU+QJjydHFcY0fLR
         Itbb76pYIkHLQwhwV1a1VXbc4uQMfJI+aBB9FpDnBNvY3zod0+Nyu4UPVPMSc9l8301Z
         Hfl6NcAQQXGenFsvpR9ks/oxjhZCwfoYclIwswsF9ycB20OsYEXaQ2uH1CyYPnT0SPq8
         M3+iafjLbqGH1vk++mESgnw8cYzGx27MRM+p4kW19j/3dp/yTvS3CAJBqNL1gH9ioPxL
         z/4UivsqgQJ/O4I58UL6/RrmRQiVzvwvIml77jSCThmX9gGMB9bpYrne4HKApY2TthXO
         IDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6GmlPPoxI364VpvqINQP43FYgTjgXKR4hPzJuIwqB4=;
        b=RhRUHK4Vr3/eCCrMjNXkm5yssHL+rcXiOq14b9UCQkV5zhVmCjoPXQi+HF+aGblSSk
         oRci89SeRaf5xTu/RWdfdqfEK9HQdE3HMBHvBN2j2E8QMZY+U7haVPJGm72RdW56gsnE
         FY8e9PrpyGyIe9ei9/+d+Cbc7KgdB8OaZ3RtzH5bZ/d/eITfDXcBUuZvZnMSkoXnoBPx
         /gLVcWwEjEfkn7ZGrJccMnvbJSAsYAdB4HmDwuPdzsS4EyIODuYCtehHRlrLFKfMlEL5
         nBPNmyJvtlVyeZjCP9+grwqJ+3Ub5Lk0DVMt1ooox9C0wWJ9hIBb++iNBSW6DXjs4RUV
         1cvg==
X-Gm-Message-State: AJIora9XS/1zOX4CizVhMfIxx+XEWyRExsSrHZoc/7lvMTuQ1ZjDTCLg
        23e22JlORU7JsbPJ9l6ipyhafcLr/RV3MLXXIN/TOw==
X-Google-Smtp-Source: AGRyM1tQTjIKct7HmBY1WbVW9Owzn86sFVJ/R/8/lyM5QGI4x+iySoRr2+iAePhZioTbd6JXBv+UrA0nlociGdP8Ksk=
X-Received: by 2002:a05:6402:194f:b0:43a:298f:f39c with SMTP id
 f15-20020a056402194f00b0043a298ff39cmr57448359edz.106.1658418764861; Thu, 21
 Jul 2022 08:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-12-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220721083540.1525-12-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 21 Jul 2022 16:52:29 +0100
Message-ID: <CAPY8ntB=7QFvKtq0Rg7XBHfokU110sLZcSfZ3OSnUdE9zuizsg@mail.gmail.com>
Subject: Re: [PATCH 11/19] media: i2c: imx290: Add exposure time control
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 21 Jul 2022 at 09:36, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Support configuring the exposure time, which is expressed as the
> complement if the exposure time (frame period minus integration time).

s/if/of

Ranges confirmed to be in accordance with the datasheet.

With the commit text typo fixed:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> The frame period is currently fixed.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index bec326a83952..3cb024b73ee7 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -103,6 +103,8 @@
>  #define IMX290_PGCTRL_THRU                             BIT(1)
>  #define IMX290_PGCTRL_MODE(n)                          ((n) << 4)
>
> +#define IMX290_VMAX_DEFAULT                            1125
> +
>  static const char * const imx290_supply_name[] = {
>         "vdda",
>         "vddd",
> @@ -176,7 +178,7 @@ static const char * const imx290_test_pattern_menu[] = {
>
>  static const struct imx290_regval imx290_global_init_settings[] = {
>         { IMX290_CTRL_07, IMX290_WINMODE_1080P },
> -       { IMX290_VMAX, 1125 },
> +       { IMX290_VMAX, IMX290_VMAX_DEFAULT },
>         { IMX290_EXTCK_FREQ, 0x2520 },
>         { IMX290_WINWV_OB, 12 },
>         { IMX290_WINPH, 0 },
> @@ -480,6 +482,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>         case V4L2_CID_GAIN:
>                 ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
>                 break;
> +
> +       case V4L2_CID_EXPOSURE:
> +               ret = imx290_write(imx290, IMX290_SHS1,
> +                                  IMX290_VMAX_DEFAULT - ctrl->val - 1, NULL);
> +               break;
> +
>         case V4L2_CID_TEST_PATTERN:
>                 if (ctrl->val) {
>                         imx290_write(imx290, IMX290_BLKLEVEL, 0, &ret);
> @@ -1008,12 +1016,16 @@ static int imx290_probe(struct i2c_client *client)
>          */
>         imx290_entity_init_cfg(&imx290->sd, NULL);
>
> -       v4l2_ctrl_handler_init(&imx290->ctrls, 4);
> +       v4l2_ctrl_handler_init(&imx290->ctrls, 5);
>         imx290->ctrls.lock = &imx290->lock;
>
>         v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>                           V4L2_CID_GAIN, 0, 72, 1, 0);
>
> +       v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +                         V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
> +                         IMX290_VMAX_DEFAULT - 2);
> +
>         imx290->link_freq =
>                 v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
>                                        V4L2_CID_LINK_FREQ,
> --
> Regards,
>
> Laurent Pinchart
>
