Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21C927A1EC8
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 14:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbjIOMdu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 08:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234330AbjIOMdu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 08:33:50 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E79BD3
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 05:33:45 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-404c023ef5eso645915e9.2
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694781224; x=1695386024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RUflmh4qQ8B/WFQpBNSKOdW/4uwxczL/Xulw2wdH1lQ=;
        b=JQZZKxGk92FEJmN8g7o1OqN8LeEMtOHqzwpVErA9j9HoZnFXRkqHOwKiEzoTj5bGsg
         tLGwMcGc3lupqMJVUHAiA39b/fBpFgHXgjuUPNlXX6dUq3sG/mlCm3cyWPsQCVLmEaMi
         GTqZlnZ/biUYJMKtZykaAAdq+aF/K3ztEQOp5/LoBhQwnekJw9Xl/Ozpyv2EM1MgDzm+
         RVR4/N+pPN2rtI+4vbEH8CwG7JYiXuw4dUc7SXcsCUPfU8gduMwwwUGSr6z3MRkOa4d4
         uCtWEZ+sIkpmLpF0cR+LbOXBqvfise7csQ2tnrHemdr4pEBbBUgvEJ7vRKpYpl3QsUg2
         rk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694781224; x=1695386024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUflmh4qQ8B/WFQpBNSKOdW/4uwxczL/Xulw2wdH1lQ=;
        b=CLhPuiMKWA5fq8DqVPUO1BjcKVtJtCTCo/un6ptI8DGByQyaHo1dpAxTq2/6wScXb5
         SyjRovXFIjy2dOmHwCozOnWjdwV72RZQcvs5sTyi0glTZdiA1l15XRhASzES+J5i+9+5
         rCo5R2UOY7qHrXEvIdnwLPU7zsyV36xd6ZtqmkU1NYKT87IWOXOweaPE+k2dYmdr7O8E
         n48EHFyk16OLZlKmhs4nZH9zPnrYDyYe88wN+rFaLNNa8pqU+glkdjZQCXT9m13iTYrx
         cn3Z2KB3a89Bn/Hewf+PMvC59+w4eG8Q2WMsxQQwQ4q9HUwkjibEmVB/SK9l/FyF9ZVs
         RkZg==
X-Gm-Message-State: AOJu0Yy6/0kZ2EtmuwkeJC1tJZVs4Qrv4HaFtEvKjM4BhLEFa3vXFIx4
        4g5wB+FbQ0q8fiZ98jS5EyrFVg==
X-Google-Smtp-Source: AGHT+IEXJxeuznECg/KVhjt1QvjvR2Tw2XeeiZ/7QRi2IaCLCcMSwSMos+je8/bQAc+71y5qesI2Uw==
X-Received: by 2002:a05:600c:364f:b0:400:2dc5:2006 with SMTP id y15-20020a05600c364f00b004002dc52006mr1448236wmq.36.1694781223461;
        Fri, 15 Sep 2023 05:33:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b003fc0505be19sm4491795wmc.37.2023.09.15.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:33:43 -0700 (PDT)
Date:   Fri, 15 Sep 2023 15:33:40 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Ma Ke <make_ruc2021@163.com>
Cc:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] media: cedrus: fix use after free bug in cedrus_remove
 due to race condition
Message-ID: <6ccc8fb2-4bd9-4df5-afe2-17868c4023f6@kadam.mountain>
References: <20230915114038.3407953-1-make_ruc2021@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915114038.3407953-1-make_ruc2021@163.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No, the code is okay.  The works is created in probe() and canceled in
remove().  You've added a new cancel in release() which is the wrong
place.  probe() pairs with remove().  open() pairs with release().

regards,
dan carpenter

