Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 988BF749BF6
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 14:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbjGFMiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 08:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjGFMiT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 08:38:19 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5991B6
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 05:38:18 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb94b1423eso850418e87.1
        for <linux-media@vger.kernel.org>; Thu, 06 Jul 2023 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688647097; x=1691239097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+g5JOoGl8L8DXw0neDwErTp0xK2oXN7bvn2LD/LXr3M=;
        b=jykPrMUJAY4xBJwbGQgO7s7ViTgCEdjaK8p8r2Hl31f/ME81nnrE/qSUvaYDs3GbCr
         INRyrEdsVpysqBZs5wiJiqbcqwckhRRknydKNYKrnZEcWk1h3fMMLHHsIeI6LzztFReE
         wp3ExGqP7Rv7GbrrYqG8yUTxrSw2fbJQ5BXkzXUmJwDbG839K+prDf3VKbcHmNZ0rCkS
         S/2XxhGghDnDJT/J+XpXk4ChuISHxazpOGEganlOb+rViR2g8kLLCCZVzTIOe8zbI45w
         AMSdB6z/sVGEyN05Mc4nxMAj21opnQYAzzlKRX0lAhov6DNcH7i7yhyNQuejDj15w8UH
         tz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688647097; x=1691239097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+g5JOoGl8L8DXw0neDwErTp0xK2oXN7bvn2LD/LXr3M=;
        b=go37QrOubBtXc018QJc3KvVCpMmfmB5n52nbrC//nRN5ssoUe0eoXhD3W7auIXTBzF
         M7tUq95H2EC6JEYYnjIaNm42oVNuQRbA9UDGX6hgk3IE74xeq0FFl6OR59Adr/ZfxynZ
         7XaUGozChxkBHH9tHDeF3x1s4ZQf3ZRQhx84mjw5Hea2TUWhtdCedRsnXZNF8yYOgsKo
         FO5nh37G8zPMkgmRktkKaNy4JCYbip4/k0qOOjD9ZGMYHdvduW0JKWWXnIbiMvgjkZx8
         y8rdYDd3zMx1ZPi/7nwSx/tYiRW5nJvH3CoXLsc5K3zvv8I2z/t0uo99q8YAbBKP87y6
         ImhQ==
X-Gm-Message-State: ABy/qLZmJwLjz+eAmvkzE/CtDJINHAn9t70LegIO5DzapCdmuUzmSNVI
        jXBJ1tubu4hEjEHDaL5okPkceA==
X-Google-Smtp-Source: APBJJlF7wnRSHF3/ATn3A9Kl9VBqBuZ1BW8ExsnFLaT6PZ0SXIHbr52DrsYzDXswnOwKrpEZC0n+4g==
X-Received: by 2002:a19:434a:0:b0:4f8:6833:b13c with SMTP id m10-20020a19434a000000b004f86833b13cmr1275916lfj.14.1688647096863;
        Thu, 06 Jul 2023 05:38:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l25-20020a1ced19000000b003faef96ee78sm5006920wmh.33.2023.07.06.05.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 05:38:15 -0700 (PDT)
Date:   Thu, 6 Jul 2023 15:38:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dma-buf: fix an error pointer vs NULL bug
Message-ID: <534fcba2-2303-4e53-aafd-9668413fbf9d@kadam.mountain>
References: <694691bf-f591-4286-a615-df91d2ebab93@moroto.mountain>
 <0f52b97d-0a67-3795-c9d7-3eaac9003aa8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f52b97d-0a67-3795-c9d7-3eaac9003aa8@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 06, 2023 at 08:21:35AM +0200, Christian König wrote:
> Am 06.07.23 um 07:52 schrieb Dan Carpenter:
> > The __dma_fence_unwrap_merge() function is supposed to return NULL on
> > error.  But the dma_fence_allocate_private_stub() returns error pointers
> > so check for that and covert the error pointers to NULL returns.
> > Otherwise, the callers do not expect error pointers and it leads to an
> > Oops.
> 
> Oh, good catch.
> 
> But I think we should probably change dma_fence_allocate_private_stub()
> instead, that this function returns an ERR_PTR doesn't seem to make to much
> sense.

Sure, I've sent v2.

regards,
dan carpenter

