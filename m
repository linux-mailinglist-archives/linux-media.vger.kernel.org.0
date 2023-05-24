Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69BE970EF40
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 09:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbjEXHUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 03:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235074AbjEXHUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 03:20:48 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A17A90
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 00:20:45 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so39513915e9.0
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 00:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684912844; x=1687504844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o1HIpOF3eeuHdCfM/1tBPhYiXaOiOf07PpD3Af3S0JE=;
        b=T6+R7I2wunS7lt7fOfWOXSEWlS1Fi/PD3heV7tV4tRaNcQnXiq9D0XU6O+EG6quyQs
         UX+cNeE5h+JwFObIxlw+hWAbcx4zU/y9YW6cQNwdmjz3Gs1x7mK8NdJIypmaaYAqhrdN
         RQWM6t80dBEkd7F/mvF61jBsvu/KttCMzOVFcdSfvPRUJtWrN34ayxNLW/JLltea2t0m
         293yUIZeliiz99pzwVNtsc5fcm9B1k4AF1zJlfCJ2+VCb2kpN038fA6NvtVcFQqAVKQT
         wxsdC7YgLW3riunUHKRN1WD/d50B3HnHMiEpiynO6pgBnwichNWNdmmkNoDZVh9S1PQ9
         g/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684912844; x=1687504844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1HIpOF3eeuHdCfM/1tBPhYiXaOiOf07PpD3Af3S0JE=;
        b=NCnwtl1yCNL4TzhL11uPiHDdJCefwVojI5a9mCA5N3SzipEFZbG3B85iPKQoEjeYsq
         dn2MkSVSspQX2pzPFoWn3KLhZGayR8NUpSkohdyOv1pb6qbpnBqr1JhIbwVx5v6b5JTj
         +SM9eZiJrPpfwoIAmvJ8zmYHhfygP/EQBUvPWOvxejYt1pQ7G8Fx00KOR7BjiP/O6tIF
         7Cyrai2fjZ3bH5WbhZ1Ih+7i+XGS0nfNk+6FZmpsA0ozkrOdIWBgRRNC0elq+uCT19/6
         /vgAK2Nna1YwOSEq9NZhQbgvnoM38HqoZPSzq8RM4QVDQvbS0SENd1teYi/nmPotTy6q
         xPzg==
X-Gm-Message-State: AC+VfDyA9ayGNqe3ZpbqTZFY+dDivMGk5XN3oc7/0fBNS7GJeLJZUzrP
        2JtIO9Z0BvA7MJJs4CzJgerGOg==
X-Google-Smtp-Source: ACHHUZ4OlZB3R72tJJh78in+0Xfto5vaL136BybJtcnJIsPbR9nZTqNsC0tYfXHmQyV4M2Lr7ZdEGA==
X-Received: by 2002:adf:ea0b:0:b0:309:4642:8795 with SMTP id q11-20020adfea0b000000b0030946428795mr16910312wrm.12.1684912844070;
        Wed, 24 May 2023 00:20:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w8-20020a5d4b48000000b0030771c6e443sm13470769wrs.42.2023.05.24.00.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:20:42 -0700 (PDT)
Date:   Wed, 24 May 2023 10:20:38 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        YongSu Yoo <yongsuyoo0215@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: dvb_ringbuffer: Return -EFAULT if copy fails
Message-ID: <7466fead-1b99-4a78-86cb-5dd8a9baec19@kili.mountain>
References: <41a9c6a6-4b9a-4d84-9e32-09bf64c65b6c@kili.mountain>
 <aab14cc4-0400-c114-f180-6db943fd7e32@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aab14cc4-0400-c114-f180-6db943fd7e32@nfschina.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 24, 2023 at 01:20:27PM +0800, Su Hui wrote:
> It's confusing about the comment on function declaration.
> 
>     /**
>      * dvb_ringbuffer_write_user - Writes a buffer received via a user
> pointer
> 
>     ..........
> 
>      * Return: number of bytes transferred or -EFAULT
> 
> But the function Only returns  the number of bytes transferred.
> 
> Maybe the comment should be modified because it never returns -EFAULT.

To be honest, I think that -EFAULT is probably a better return.  But
there is no way we could apply the patch with that commit message.  The
commit message doesn't explain the problem for the user or why returning
the number of bytes copied is not correct in this case.

I think that maybe it's not too late to change this to return -EFAULT,
but it would have been easier to make the change in 2014 before there
were many users.  Also it would be easier if you were testing this on
real hardware.

Possibly other people think the current behavior is correct or that it
is too late to change it.  That's also fine.  I'm not a domain expert
here.

regards,
dan carpenter

