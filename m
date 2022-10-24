Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A16960BB4F
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 22:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbiJXUza (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 16:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235221AbiJXUzM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 16:55:12 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2C62611E
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 12:01:20 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id kt23so1665795ejc.7
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 12:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dcq4+9dUc38EghTqFIaQUzXr6wxF6uf42T6SQkF/Jcc=;
        b=jrVNUuNPgzT8f0EgDgXYwEQUmtL/CW4M46DMpYdPSDEorv9fTyrKvqv4D4Wkk0JSlk
         K6u3g3rE/rkaPsr23rQIRd8ZcLTqUUPD+EUvEaC8rwBcYiSc0EDPNAxMcXrxvJbNAoGI
         Zg6K+RUMhSwCQtnAfMTDOr+ZmArMJKafikphZNM03ntWwuaxMafil6z+RqAtz+1/gKaQ
         jYtQUiKFE2UomrwgyOUW58L8aK3opcLS16tz4BAoLAgfKS/D9X1grmDEyqdkfpZ23f+p
         X4WX2NO1Xakwm51yevNG0p2xKwDyXZN5Dhn2uePV0pkb2/f1nxiEROPmWA0v5pVGIZTJ
         5HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dcq4+9dUc38EghTqFIaQUzXr6wxF6uf42T6SQkF/Jcc=;
        b=BxwuxDV7EKHllmgBYMu35AsO2v4xl+GqIqW75u9Ecw42fOKkJj4OTKWKr3UEXf2cVY
         P4kojuWP2Rabk0kOeND+cRGrzMdnGaWQGYLSaYTBfX4XEjDawF7ry+qB22Bb/Ah1NCca
         HL2DMyAGnBMsZbSLiuoPqtIx710ebftHMFi9JFB9Oh4+PyACBnqaFUIMqKPcGQQq1JtX
         LGs2NfhxbYaBpobXfP1AZ1zOtzlCfef3KLoKkchz5BrrcKBVO0RTpf44+7BInveYbtSM
         ZwvNcYF4Rm7SzZ55gtVRsbzNK5keh0fn/kJqt8QCh+4gFSXk4sioydVXiC8XNvRIdG8T
         jkzg==
X-Gm-Message-State: ACrzQf2sCvX5AbuXO/f5HDoTp6hNNBMlXzdDiGtnT8KE+sdYOiCIjomY
        2+cTBTh0iuQW+TKRporNs4g3wgrB35xPRGmleK8aE5K80AM=
X-Google-Smtp-Source: AMsMyM51mSl9lXNENFrOfMsXS77oqViBIk5N6CCWdzJeax+dVv0khtjUdw8emK5EX4EWbP5uTnL5H7ijSJlNeBJPMVQ=
X-Received: by 2002:a17:907:2cf1:b0:78d:cafc:caba with SMTP id
 hz17-20020a1709072cf100b0078dcafccabamr28508836ejc.154.1666626271386; Mon, 24
 Oct 2022 08:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221022092015.208592-1-jacopo@jmondi.org> <20221022092015.208592-7-jacopo@jmondi.org>
In-Reply-To: <20221022092015.208592-7-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 24 Oct 2022 16:44:15 +0100
Message-ID: <CAPY8ntB2hj8TQ8++TyM0FLg0KMzLugrkKXESKq0nF6-VGEtNaA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] media: ar0521: Add LINK_FREQ control
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Sat, 22 Oct 2022 at 11:38, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Add support for V4L2_CID_LINK_FREQ which currently reports a single
> hard-coded frequency which depends on the fixed pixel clock.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ar0521.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index fcd852760750..2310346f11d5 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -89,6 +89,10 @@ static const char * const ar0521_supply_names[] = {
>         "vaa",          /* Analog (2.7V) supply */
>  };
>
> +static const s64 ar0521_link_frequencies[] = {
> +       184000000,
> +};
> +
>  struct ar0521_ctrls {
>         struct v4l2_ctrl_handler handler;
>         struct {
> @@ -547,6 +551,13 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
>                 ret = ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE,
>                                        ctrl->val);
>                 break;
> +       case V4L2_CID_LINK_FREQ:
> +               /*
> +                * Link frequency index is used at PLL configuration time,
> +                * nothing to do here.
> +                */
> +               ret = 0;
> +               break;

Defining as read only removes the need for this, but it depends on
whether you expect to have userspace changing it in the future.

As it stands it works, so:

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

>         default:
>                 dev_err(&sensor->i2c_client->dev,
>                         "Unsupported control %x\n", ctrl->id);
> @@ -611,6 +622,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
>         ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
>                                             65535, 1, 360);
>
> +       v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> +                              ARRAY_SIZE(ar0521_link_frequencies) - 1,
> +                              0, ar0521_link_frequencies);
> +
>         ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
>                                         V4L2_CID_TEST_PATTERN,
>                                         ARRAY_SIZE(test_pattern_menu) - 1,
> --
> 2.37.3
>
