Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F84F50DF66
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 13:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236040AbiDYLye (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 07:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235934AbiDYLyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 07:54:31 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4536167DB
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:51:27 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u15so29018968ejf.11
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hP/s+bXJsR2f7ylAqQ3NKh4ebqdk+IEj/0cSmrsMkIM=;
        b=niU2z1sWUGKKpa0aRwhK8UbXnGSPiQFhYWu28uuubRBc7Nqh0mPgptAyPTMtSBnXuy
         uVuwBateTfxHhLtB1DI8ZxP4mXhv7YyBoIoR7XtbwbenBxTTjU8eFS0//d3cPCVH1eMM
         uOfLQIvgY/P6TlKeqTbWvzURPVC8caORHnMIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hP/s+bXJsR2f7ylAqQ3NKh4ebqdk+IEj/0cSmrsMkIM=;
        b=7s0msEgjlgW47481XQ1Dn/a8I96E1jDEL11nKbvhdYvB8BYBciKwLdmbUHcnxz5A+J
         5fpiZz1yPVyaZ7cFQBvpPQcVnGf6ln7Veny/aHoO8cYp3uGJdgKzrq3kgNBJSz7ZTDvW
         PxKmKLc7ARoubxgfVOqozak8oM171xM7sPFJUu1Ac7xUEP79ECXenexModPuMs1xWCaz
         rHyap0YVvru6N+Uzo78YxhirHqdDFZIg91LxsXgF4fhdz3032fe0DTGSHGdieE/Z9Z/X
         j2X2NSfFu2bFk0WnU9/o3NUexh+kWEbdkkWOt7X63P+QSqrSKCE2y4IPCOPvB6dl2+iK
         N3ng==
X-Gm-Message-State: AOAM532mcjatfr3plIXo3aWVwfJHdNQXZu9kV6wevlPHooG/yrYGxitM
        vPVYFLaMdthYBVxLuFvf8plHk4BmoUTOnQ==
X-Google-Smtp-Source: ABdhPJwv505NJ9oogjERw7fuS0ee7BOlUGutn6aiGV+NLENIbmAZBTo1UZQTEVY3pWnT4atZlpyKXQ==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id fj2-20020a1709069c8200b006e12c941616mr15934445ejc.64.1650887486225;
        Mon, 25 Apr 2022 04:51:26 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id b17-20020a170906195100b006e8be812f08sm3621732eje.0.2022.04.25.04.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 04:51:25 -0700 (PDT)
Date:   Mon, 25 Apr 2022 13:51:08 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 19/21] media: rkisp1: capture: Bypass the main device
 for handling querycap
Message-ID: <YmaLLNXwz/0uFh6u@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-20-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-20-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> From: Paul Elder <paul.elder@ideasonboard.com>
> 
> When handling querycap, the capture node would access the main rkisp1
> device unnecessarily. Get the information from the most direct source.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index a7cf672457cd..94819e6c23e2 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1248,11 +1248,8 @@ static int rkisp1_g_fmt_vid_cap_mplane(struct file *file, void *fh,
>  static int
>  rkisp1_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
>  {
> -	struct rkisp1_capture *cap_dev = video_drvdata(file);
> -	struct rkisp1_device *rkisp1 = cap_dev->rkisp1;
> -
> -	strscpy(cap->driver, rkisp1->dev->driver->name, sizeof(cap->driver));
> -	strscpy(cap->card, rkisp1->dev->driver->name, sizeof(cap->card));
> +	strscpy(cap->driver, RKISP1_DRIVER_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, RKISP1_DRIVER_NAME, sizeof(cap->card));
>  	strscpy(cap->bus_info, RKISP1_BUS_INFO, sizeof(cap->bus_info));
>  
>  	return 0;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
