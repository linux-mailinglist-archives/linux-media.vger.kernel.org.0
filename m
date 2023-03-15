Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5B546BB26F
	for <lists+linux-media@lfdr.de>; Wed, 15 Mar 2023 13:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232791AbjCOMgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Mar 2023 08:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbjCOMf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Mar 2023 08:35:59 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471CDA0B18
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 05:35:02 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id i5so19848907pla.2
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 05:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678883696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6hMqbzr+2QKD7iB2OFXLRZx5MGmp0t3ch1cv5eJ1gw=;
        b=GKTN4BoUo5bgP76roytLGlmYeYjQVEqcVO+jv76sWg4R3ZZhbmABv2SwhWZypVHKzp
         TBXkfmrykcbxY1oM8ppnvhopObZ4J9sg+5PGE22Z9buw35pFj6Ewic4LNcDsHeDJJ9iA
         rsjnyFWMCwVSQsgqlJRZFbXmOX5JBK4trSZu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678883696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6hMqbzr+2QKD7iB2OFXLRZx5MGmp0t3ch1cv5eJ1gw=;
        b=b2wfQG12VXW9hRp8QBEuG5MW5g68KrdCxAxV108SYMaMJRj/ADSEeeTKuDmblmsAjq
         ofQj62Bq1D+qsLj0a9SN8Wrb34P0exyZktVMQVwNX8/JsymzVUJ15Zq9VafBFaXkshkh
         8kARApiPEQtLbYBwXX9ExsiykqD9F65/qpq5RIesXVwHXuBREpjdWuvhrTw9mg8hETSg
         QbzB4SGYTiSaj+5CUKEvLDy0Ev5uTRybwEUoB2pAWko8zsshH6BHPkz6ID1uYI1ApyO4
         lZjpBFoMnWz48e9eKc9exeLfUIfoNWjWFdiT/ndJBTYqf99stNGCUhVe+9fk2KHL2fVh
         Y0PA==
X-Gm-Message-State: AO0yUKVb3nY6XhoP0myj0esdD6GpRxtkU6m6eyABuI/yA+BzD9xL8LrH
        R7t4mmqQpSCTySwVgt5ghLTqzA==
X-Google-Smtp-Source: AK7set8GvobddgjpVu3fQSdhVar92/aE5NPVv1tR39OuqsCoW+dMd3V9AEWjpyn4dyDeH7svtT+v5g==
X-Received: by 2002:a05:6a20:6914:b0:cb:867d:1594 with SMTP id q20-20020a056a20691400b000cb867d1594mr44353492pzj.6.1678883696547;
        Wed, 15 Mar 2023 05:34:56 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id d6-20020a630e06000000b00508e7bd761fsm3265190pgl.87.2023.03.15.05.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 05:34:56 -0700 (PDT)
Date:   Wed, 15 Mar 2023 21:34:52 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "hn.chen" <hn.chen@sunplusit.com>
Subject: Re: [PATCH v7 6/6] media: uvcvideo: Fix hw timestamp handling for
 slow FPS
Message-ID: <20230315123452.GA1927922@google.com>
References: <20220920-resend-hwtimestamp-v7-0-cf1d78bb8821@chromium.org>
 <20220920-resend-hwtimestamp-v7-6-cf1d78bb8821@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920-resend-hwtimestamp-v7-6-cf1d78bb8821@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/03/10 10:01), Ricardo Ribalda wrote:
[..]
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -473,6 +473,21 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
>  
>  	spin_lock_irqsave(&clock->lock, flags);
>  
> +	/* Delete last overflows */
> +	if (clock->head == clock->last_sof_overflow)
> +		clock->last_sof_overflow = -1;
> +
> +	/* Handle overflows */
> +	if (clock->count > 0 && clock->last_sof > sample->dev_sof) {

Per offline discussion, we set clock->last_sof to sameple->dev_sof
right before uvc_video_clock_add_sample() so this condition is always
false. clock->sof needs to be updated after overflow handling checks.
