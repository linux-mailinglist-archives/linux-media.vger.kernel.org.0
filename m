Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCB978C1DC
	for <lists+linux-media@lfdr.de>; Tue, 29 Aug 2023 11:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbjH2J5T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 05:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235164AbjH2J5L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 05:57:11 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D66E57
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 02:56:44 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-44d3cdba3f6so1678788137.2
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 02:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1693302997; x=1693907797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Beyr8ZFICd6hlxkv10D2Ka51YuKsltxYzz2hZIE8y/Y=;
        b=GJ8JvYA0mxPaOdMcwKt6fIOCNN2KMTIILTN1NKmz+LfD7SBZIOfDKM5eB5z1NLFLfe
         fFW7W3VhOlmuiQBaMdKKQcKKTn/5HsG1VtXcgTJzvn42I5xiPKt/zDSWcKfHe5u5rJkc
         XILozqJncNe7PSTAQ4VYYJvJyns6y/y6QB33U79yidYGGG9WzvvNJu65k/bGXzBuNEIh
         ojVmpXwPPpModQikttSosK/ULRlH8wIFPpQ9CI2mCZ2JYtcW+JluqHyXS0VnjjfpWDu6
         PkfozIkB5YNggT+LIYMdnWpNqajKWdV7BvaLOL/x35QyyojF1mwz9OusKs5hHuOj7o2m
         Ln7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693302997; x=1693907797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Beyr8ZFICd6hlxkv10D2Ka51YuKsltxYzz2hZIE8y/Y=;
        b=a9OiVC71ZbNc7aO/vZnnakKBxPht+uEz3h/jrFZXmZQVzevxx83nphfytE4Zl6K3DZ
         0v/vIWczAOU7BlYAdV5f/yrg+BO67RguQXcRbsrTTa5WA62StJB66sfJkzjlOPrR5Njh
         xzBTzTRd4i43BllqcB6UExmQ6ZCXvK4rw1Ec8ULpuxcGxs/mauSMrKIqdAY6M/Jk5+ra
         iNZlMVWBvdf0KRQb8x5Vv7qX3+JoGuznuK5JxTg0Wdp3qkX72p/jA1Si18edJSZU0IAp
         O5gTLuMFswpbbPlfAhvDX9H+Kpfs18oWkzTzLhEBr+r/lDssr8u1vj9sGpnPXEfSr6lo
         1iKA==
X-Gm-Message-State: AOJu0YxJKQE+QDs97y2YSYqlM0BvTQJNrCN75SQOdrvlwRqtSeVW6oMh
        JOaPTyzUuVaPOlXScONZgLmitYThxnlKB4Tlwgsnhg==
X-Google-Smtp-Source: AGHT+IHYXCLxBEBlRaoZc0bAaxJE0pveRLElT9JyiWzG6Dhe/bIi4y6J3BATslVYL23wsIik+mnPIVhVuaAOWy81rbo=
X-Received: by 2002:a67:e883:0:b0:44d:6320:f0c7 with SMTP id
 x3-20020a67e883000000b0044d6320f0c7mr17500345vsn.22.1693302996904; Tue, 29
 Aug 2023 02:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-11-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-11-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 29 Aug 2023 10:56:22 +0100
Message-ID: <CAPY8ntDsxkCovdN5yj+so-YeojA4UxXrt7E+ZNxZ-K1C6sFJ3A@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] media: i2c: imx219: Access height from active
 format in imx219_set_ctrl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Use the active format height instead of the mode height in
> imx219_set_ctrl(). This prepares for dropping the mode field from the
> imx219 structure.
>
> The state is retrieved using v4l2_subdev_get_locked_active_state() as
> the subdev active state and the control handler share the same lock.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 0c26cbfe58f3..4e9a50117a0a 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -401,13 +401,18 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>         struct imx219 *imx219 =
>                 container_of(ctrl->handler, struct imx219, ctrl_handler);
>         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> +       const struct v4l2_mbus_framefmt *format;
> +       struct v4l2_subdev_state *state;
>         int ret = 0;
>
> +       state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> +       format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
> +
>         if (ctrl->id == V4L2_CID_VBLANK) {
>                 int exposure_max, exposure_def;
>
>                 /* Update max exposure while meeting expected vblanking */
> -               exposure_max = imx219->mode->height + ctrl->val - 4;
> +               exposure_max = format->height + ctrl->val - 4;
>                 exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>                         exposure_max : IMX219_EXPOSURE_DEFAULT;
>                 __v4l2_ctrl_modify_range(imx219->exposure,
> @@ -447,7 +452,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_VBLANK:
>                 cci_write(imx219->regmap, IMX219_REG_VTS,
> -                         imx219->mode->height + ctrl->val, &ret);
> +                         format->height + ctrl->val, &ret);
>                 break;
>         case V4L2_CID_TEST_PATTERN_RED:
>                 cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
> --
> Regards,
>
> Laurent Pinchart
>
