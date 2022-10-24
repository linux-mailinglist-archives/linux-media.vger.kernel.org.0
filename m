Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623AC60B199
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 18:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbiJXQ2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 12:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbiJXQ1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 12:27:42 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7D645F6A
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 08:14:40 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id k2so5795818ejr.2
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uwQUztXgBVkXn22Djt2vccuvcgYoi7jKh5HH+Jxc7c4=;
        b=EEvUQCpdOrCwrJ8voELEkDOYjTuxV/GQpIhHT8VCW/ueNa2ACsBec3XiIxiM5E8U2s
         lWv2j+V4cTXfprSEPo7T8MZwgmEJveEgwWbBmk8cUUBq9HCuvRVuv8KddRhLZeXPpipH
         rMRRzFfFNNcnaiIx0A/kZojwLcTVUi3okjCyS9TJLbwsFwuqSFZmn4G3U/a9umZSOfCQ
         jL5TyP1wm2+jPXteDmtuaZd5fRl5ySN9g2ej94NxGckawudDEGUb0e4RJRMuQEa4bQqI
         o0sUZFuw9Bp+ykY8oMmQ5E6w7omnmNeWfdugdY6yMZCcmzwpfEyyAvIa6bjdH0f6cnMs
         4/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwQUztXgBVkXn22Djt2vccuvcgYoi7jKh5HH+Jxc7c4=;
        b=naaDYcnRH/cBr6ORX2JOdZ5QiUaVUxFu5Mfwk7b27LhSSaeKtrJy5/rbh+Ay2CchMu
         zi90z+d+asxXK0onI+xwrOSH0bN37EqVMTWmIeEC3ZzqZJ+cKznk3LT2RTg04A56Dldn
         oj6+k/HdD8H8ls8ZUh8JeXIzg8KJ/fkq7lpTRtu/j9qcYi4gsVu+hqrosEK0ievQ80WD
         xPE6dcocDAIFqnPmPCN4TbAe00V+cX3OG2C2pN45/xMfvkBEdp4kdeGRtphKa3/Cili/
         bijLatoWuiHz/XrqtMOQPRYARpldShPe1h+1IlJwFu1uBOSIT4Ofnxo2rN4Be4gq9QAj
         7vMg==
X-Gm-Message-State: ACrzQf0sGtpik0/RaGISX8H0LWyhADIdZln1q4GxhfiOO0RpamcankHB
        wFN2HiUQyv644HrXPej5m4UasDUzwyDJK4U1Fs28EUDB+zw/FA==
X-Google-Smtp-Source: AMsMyM5oQgsbrmBbYOyVwpJ6ADarAe1sv9gXE19XY2My+OLnqXhhkJ+HGog4fNdv5YocmiJTP4G4prB9FmZ9Bkta7dE=
X-Received: by 2002:a05:6402:c4d:b0:457:99ec:1837 with SMTP id
 cs13-20020a0564020c4d00b0045799ec1837mr30191906edb.86.1666616443757; Mon, 24
 Oct 2022 06:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221022092015.208592-1-jacopo@jmondi.org> <20221022092015.208592-6-jacopo@jmondi.org>
In-Reply-To: <20221022092015.208592-6-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 24 Oct 2022 14:00:28 +0100
Message-ID: <CAPY8ntBya1-rUkQH9wiERUof-01puoLej7t6BHKAr1ot-iHe9g@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] media: ar0521: Refuse unsupported controls
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Sat, 22 Oct 2022 at 11:13, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Refuse unsupported controls by returning -EINVAL in the s_ctrl
> operation.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>
> ---
>  drivers/media/i2c/ar0521.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index e673424880ac..fcd852760750 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -547,6 +547,10 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
>                 ret = ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE,
>                                        ctrl->val);
>                 break;
> +       default:
> +               dev_err(&sensor->i2c_client->dev,
> +                       "Unsupported control %x\n", ctrl->id);
> +               return -EINVAL;
>         }
>
>         pm_runtime_put(&sensor->i2c_client->dev);

In the default case you've returned without doing the pm_runtime_put,
so pm is going to be unbalanced.

default:
  dev_err(...)
  ret = -EINVAL;
  break;
would avoid that.

  Dave

> --
> 2.37.3
>
