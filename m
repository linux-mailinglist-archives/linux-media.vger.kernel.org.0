Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F6B6BC43B
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 04:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjCPDJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Mar 2023 23:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjCPDJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Mar 2023 23:09:01 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376995B9B
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 20:08:57 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id rj10so345492pjb.4
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 20:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678936136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JC7Ngej0mVHgTWIaSQu/TpmT+s/k2sGS5VBQm51zvzo=;
        b=Tn7815yn22Xa8ba57aKCn480L8a3Dv9i+wG2sgNc4K+woyqElXLb48zbam4EjywLr6
         3ohR+m8UHz2A0wQHeyIoGmpkqCjb/+c3o5v0gLAZbcAtH852xe6Hv2naaKxvcfz7pgaw
         Yl6r8T8XOeymzn2bRQgcmvi+V9xrzMgbRuJYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678936136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JC7Ngej0mVHgTWIaSQu/TpmT+s/k2sGS5VBQm51zvzo=;
        b=RmPXlch1KPqbNCcNcY9iGUObjshBxvnUu/mV/P7Eb35Go/tEeUDi7O3isa1xL7SSvc
         bUp4j2YYNLYY1vQ/ycTJ0OXMjrU07cUyKEttl4mKW1zIMBraRHhQEIJPkyid12l67je4
         sncZnwXnjNvp2B9f0/j5nastcex2ms0ytRBIw39Sk+uBAb2or0DgBJWm5Bs7EjhfsGNG
         r8Orr78jzH1eI0ubtCNjKlOPN4JUb/hc9ev8z4lqfSLFtIb4nZvfcdbHG3B3waJMCyQv
         FNU0kTcssHZSfJkT3hUBFpLgBQCBTDdkr+IJO2TqHbAGZFHmltPTaTu+iaoqPyw/88MF
         GOKg==
X-Gm-Message-State: AO0yUKVovRbhQ+pBKiLvGvgZ31tXhG/mcxb418cpqe/ju2h9aPQeN3cY
        FQAnBwOCg+XPxbLpNDXChSVrAg==
X-Google-Smtp-Source: AK7set9iJIx/5A53rvxsWr04tplQZ+orFQFwi0bAC6a3Bg0hJFZOiL5PhpxtqXJhU2MOEYlcR3NdaQ==
X-Received: by 2002:a17:90b:4d05:b0:237:50b6:9843 with SMTP id mw5-20020a17090b4d0500b0023750b69843mr2178420pjb.0.1678936136075;
        Wed, 15 Mar 2023 20:08:56 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id q30-20020a17090a17a100b002349608e80csm2008950pja.47.2023.03.15.20.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 20:08:55 -0700 (PDT)
Date:   Thu, 16 Mar 2023 12:08:51 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v9 4/6] media: uvcvideo: Allow hw clock updates with
 buffers not full
Message-ID: <20230316030851.GD1927922@google.com>
References: <20220920-resend-hwtimestamp-v9-0-55a89f46f6be@chromium.org>
 <20220920-resend-hwtimestamp-v9-4-55a89f46f6be@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920-resend-hwtimestamp-v9-4-55a89f46f6be@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/03/15 14:30), Ricardo Ribalda wrote:
> With UVC 1.5 we get as little as one clock sample per frame. Which means
> that it takes 32 frames to move from the software timestamp to the
> hardware timestamp method.
> 
> This results in abrupt changes in the timestamping after 32 frames (~1
> second), resulting in noticeable artifacts when used for encoding.
> 
> With this patch we modify the update algorithm to work with whatever
> amount of values are available.
> 
> Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

> +	 * Have at least 1/4 of a second of timestamps before we
> +	 * try to do any calculation. Otherwise we do not have enough
> +	 * precision. This value was determined by running Android CTS
> +	 * on different devices.
> +	 * Dev_sof runs at 1KHz, and we have a fixed point precision of
> +	 * 16 bits.
> +	 */
> +	if ((y2 - y1) < ( (1000 / 4) << 16))

A minor nit: extra space `( (` :)
