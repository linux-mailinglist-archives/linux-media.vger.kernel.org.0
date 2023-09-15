Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 576077A1CC4
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 12:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234103AbjIOKu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 06:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233907AbjIOKuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 06:50:20 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9494010DF
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 03:50:01 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-44d4d997dcfso1028162137.0
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 03:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1694775000; x=1695379800; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K36iFXS/ru8JZIYI01VUjoG0KFaQK1tvXVteSu0GLxo=;
        b=jWxWOFd3YS5CpsMv3BxJcTzlM0agyd/lCZNs2GM5at3pfhgJs24+vXvjjcE84Ne34R
         Ciak/B05D/3FYxR8j4snSRXyQ38JS2Rp2xt3Q5Hv4/PJ2S+jags/98YS9tV8zhXHsMNU
         j2KWmc+EWX8qqir+P4o42FgxqirEVD3qTvd09O6TycUzcMoGmbJMJahetRXiFKZYSLZ9
         IhkTCfP3BHJg67rxHgJZub0YNPxYaytpnmmG0eLV8M4TJqksR0gDKAVot62LFHuoxkro
         w/adVLYXRSL8gcMUe/cHmD/Go+yVi7bfwTTmQRvu34dTnms1P+/nCwwzPs+v2wryqvHh
         dObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694775000; x=1695379800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K36iFXS/ru8JZIYI01VUjoG0KFaQK1tvXVteSu0GLxo=;
        b=LDbVdx4c1CRqyKeS2K3zOtIBHCBUG+LqdCDTFuTkea3/EAvGAznEVWuCz8nzKZIzIX
         HlQhFyilSDXM1HMp/p2uYjRRQoa2d5optuC/mEZ6YS4TtyAz7My3r28S7E7Zv63oy4dv
         GtNNb1yiPE9rNBU1uGayn4tDdVt1+e9STmiUoRzMLXGEjQBECbnXk6f/XtwD6xu2yA4r
         TM13yGpoGhmUm+I6t/nekF5cM6FpqST7ZY/Kxw38j4tp9c/LDUZ4h2bFUx9DKroNn+vL
         kNCbdOc0XUryXgxkAwg8fWFQOyZvlYAKLZw5JnjItQQIHJk0RalrgtJ3bG9xaM9GXljb
         LAZw==
X-Gm-Message-State: AOJu0YwQSGt7pYE3cptejSeL94b8VUdsMKE4EzMeHX+ur5RqyewPv30Z
        vjvCf8MSNxD6ithy+qiPyTyxuQb0/w2EIeeAuVBhajJtcN6R8sEu
X-Google-Smtp-Source: AGHT+IFPhaiEbpjhwJeJzaFpwAOTlv8CpHeD4aGcVDghPsEHmlKvPCwuL9Rm+cNqYZnnBv4dgNGjcjHRs5T0ytRbnJE=
X-Received: by 2002:a67:fb07:0:b0:44e:8ef9:3369 with SMTP id
 d7-20020a67fb07000000b0044e8ef93369mr1392937vsr.0.1694775000694; Fri, 15 Sep
 2023 03:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com> <20230914181704.4811-7-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230914181704.4811-7-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 15 Sep 2023 11:49:45 +0100
Message-ID: <CAPY8ntCgRg_5GBhDtQFLdjYM0MiDJqXo3QQjw2w_eJhzAdqxsw@mail.gmail.com>
Subject: Re: [PATCH 06/57] media: i2c: imx219: Drop check for reentrant .s_stream()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, 14 Sept 2023 at 19:16, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The subdev .s_stream() operation shall not be called to start streaming
> on an already started subdev, or stop streaming on a stopped subdev.
> Remove the check that guards against that condition.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index a1136fdfbed2..5715bbbc0820 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -979,9 +979,6 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>
>         state = v4l2_subdev_lock_and_get_active_state(sd);
>
> -       if (imx219->streaming == enable)
> -               goto unlock;
> -
>         if (enable) {
>                 /*
>                  * Apply default & customized values
> --
> Regards,
>
> Laurent Pinchart
>
