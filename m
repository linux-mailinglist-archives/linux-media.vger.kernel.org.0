Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B67FC7A2745
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 21:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236616AbjIOTgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 15:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbjIOTfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 15:35:50 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C2C1BD3
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 12:35:45 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bfc8c02e82so37502831fa.0
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 12:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694806543; x=1695411343; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=FKKMCGnGhukQkPxkpQoHGnDnIDU/MJp5hR5WP/zaXaA=;
        b=evkl9dGDcyQQ+WamosasqkQa1TeeXJR9XSWXGQ11eHDa2IvskS5lZpBgtv0XFlIpMz
         Op49CyvxKt5oP9jPAzjf0m/yY7S10N9fKXf+IMNY+60c35khs2YExWL5k5Z2gIV48pc9
         s4KWeglUyPp2D1BdJAxE+Yi07ysE7XBWgLghvgNZn0EDfyBzPPZzE9ay2HlWv9uta4ij
         /Ojld/QSMmIa0ZIpNZNJ/LIaGBUjjtrFVqz0vS9aqQMkE4wPJXyg+veM5gtIvNoIJwn/
         lYeRmvBG7X2fEFh9eQVBHoqMX7EmU72Py+0KjkPkyI3LByGBs+ff3ANMxgV4hYTYF3zp
         j47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694806543; x=1695411343;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKKMCGnGhukQkPxkpQoHGnDnIDU/MJp5hR5WP/zaXaA=;
        b=BZGASj79a2METe26NHZX4GPi6a7j/IV7GJMrpp7SMHBReu2wTqjUWEIm/bRMXFc+/h
         Gr3RPbk4n9aPbR2Fr1DThihGZgkpSs0zGCQrqqxtmFIxABpg60EoslTyk538/tI4fsyO
         wJu4TF20bOp8JdkkBX/aKEB+/tgyYoDeyC/CUKNrMGiDjh0ULwQbAMMSSjZOnKzIVRow
         UdQRXwHIiOaxNQGMxW+zEifWSOO2jYnZx7x7Hst+9qXq+JGNd9mXu6DhY9D39Auf/iOH
         2KAczg5DRb5z9ACNelFZER8372lgaFvRcWN6ixdaxQNErxBH2S3lqRvyWis6w1026CGT
         fRSw==
X-Gm-Message-State: AOJu0YxDAXfPzhwVz8ectoHG8mw0LbV5FiYTGFZbeencYiGpRyzSAQNi
        epy//T0Rd+p9s1zWw2X7t80=
X-Google-Smtp-Source: AGHT+IFsAlzyQURer4VFhL7OZzyqN/nn55yujttUczw17A/UIseUnzObwPdewCrn3UbqDHKSSemjUw==
X-Received: by 2002:a2e:8816:0:b0:2b6:cff1:cd1c with SMTP id x22-20020a2e8816000000b002b6cff1cd1cmr2354029ljh.34.1694806542713;
        Fri, 15 Sep 2023 12:35:42 -0700 (PDT)
Received: from razdolb (95-24-150-208.broadband.corbina.ru. [95.24.150.208])
        by smtp.gmail.com with ESMTPSA id w12-20020a2e998c000000b002b9e346a152sm838962lji.96.2023.09.15.12.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 12:35:42 -0700 (PDT)
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
 <20230914181704.4811-23-laurent.pinchart@ideasonboard.com>
User-agent: mu4e 1.10.7; emacs 29.1
From:   Mikhail Rudenko <mike.rudenko@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 22/57] media: i2c: ov4689: Drop check for reentrant
 .s_stream()
Date:   Fri, 15 Sep 2023 22:26:28 +0300
In-reply-to: <20230914181704.4811-23-laurent.pinchart@ideasonboard.com>
Message-ID: <87jzsrut4i.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2023-09-14 at 21:16 +03, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> The subdev .s_stream() operation shall not be called to start streaming
> on an already started subdev, or stop streaming on a stopped subdev.
> Remove the check that guards against that condition.
>
> The streaming field of the driver's private structure is now unused,
> drop it as well.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/ov4689.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> index fda217d2cb10..cd8d7131e747 100644
> --- a/drivers/media/i2c/ov4689.c
> +++ b/drivers/media/i2c/ov4689.c
> @@ -100,7 +100,6 @@ struct ov4689 {
>  	u32 clock_rate;
>
>  	struct mutex mutex; /* lock to protect streaming, ctrls and cur_mode */
> -	bool streaming;

We can now drop the mention of "streaming" from the comment one line
above. Aside from that,

Reviewed-by: Mikhail Rudenko <mike.rudenko@gmail.com>

>  	struct v4l2_ctrl_handler ctrl_handler;
>  	struct v4l2_ctrl *exposure;
>
> @@ -468,10 +467,6 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
>
>  	mutex_lock(&ov4689->mutex);
>
> -	on = !!on;
> -	if (on == ov4689->streaming)
> -		goto unlock_and_return;
> -
>  	if (on) {
>  		ret = pm_runtime_resume_and_get(&client->dev);
>  		if (ret < 0)
> @@ -504,8 +499,6 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
>  		pm_runtime_put(&client->dev);
>  	}
>
> -	ov4689->streaming = on;
> -
>  unlock_and_return:
>  	mutex_unlock(&ov4689->mutex);


--
Best regards,
Mikhail Rudenko
