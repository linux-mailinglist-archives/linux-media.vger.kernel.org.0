Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC51704D0F
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 13:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232952AbjEPLx0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 07:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbjEPLxX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 07:53:23 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78186A57
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 04:53:03 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3093a778089so109259f8f.1
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 04:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684237981; x=1686829981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GBv3RQ9E2nj2VxVWOi5OYZIIGU6LVm0XUgPs/FVz3EY=;
        b=dZj+q1a5cl045iNsMOKpwwF/V9dBa3peELj2cK5rM3PXOqVZChNxYzJEB2iupEZZML
         q2/izu4n9Mbeoo9uEYcT3Se5AXydgPawXIzOiOIvoNbnJZxrgFxaLmOsXX34tnF1qI2J
         LlRZy6Rnktc0gKa4Pp2zuudLHFJpPOi4V9qGY9Q2iLixuXRoEUS3//yxMl6Pn1dhDJXE
         ItUxPQ2turFHIZg7pzRqc5Fc1hUAqYaBxc0PbScpuqixueiuA1zQTg1PuiJdd7rBXCt5
         4Snkb94eYu9aLuxgk0NSx9rYkRpIlug1oytOWl7rJfbE8bWy9EnQEt8FHs3GYc15C487
         Yw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684237981; x=1686829981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBv3RQ9E2nj2VxVWOi5OYZIIGU6LVm0XUgPs/FVz3EY=;
        b=dmisR3hHb9ziZmvRjn7ogOH4bMq0qvUYetklMGIKCttDUxpRAAsDyk12QM9z0GsV91
         RCnsCMK8HGHIVXdrYRhd6le12ZKtbUgxm+7MEXwGRZPQn4iUFeuNu3Y5O9FCbol45SFU
         24mUlmf9K4CZhVXMa0qJgqyMFvAUKwwgVazR9WWLNoFVF7eCj4vifYD2vXW80skCTMz7
         vSu14ZbUxdRY6OZLBQE0h/UOruItp/q2okWHGr8llw/pmr1l7j6mBErT/EXHT9x/kKoj
         klcRh4l2vYpjahGtMmVuqGB39DudMHfvqjEjY05iWHmTM1Fesni4KmPNW4w/LYkmg5ey
         reCg==
X-Gm-Message-State: AC+VfDxC6cwA5tAYXi5CSrAIZhtylq1oXDN52o+2zlXy2nHhIcZeh4SF
        W4CPjqNu5Bfdi3yMs1zMpEIHxA==
X-Google-Smtp-Source: ACHHUZ7Wm97TbRm4zFAEgF4ZbdkO1QUID7eLVTIVYR6mk0NeWb3nVQ/3NU4NCXPFFIAkfTar3xo1IA==
X-Received: by 2002:a5d:4904:0:b0:307:bd64:f5a4 with SMTP id x4-20020a5d4904000000b00307bd64f5a4mr15556197wrq.52.1684237981336;
        Tue, 16 May 2023 04:53:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d5307000000b003063772a55bsm2399380wrv.61.2023.05.16.04.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 04:52:59 -0700 (PDT)
Date:   Tue, 16 May 2023 14:52:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Zelong Dong <Zelong.Dong@amlogic.com>
Cc:     oe-kbuild@lists.linux.dev,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
Subject: Re: [PATCH] media: rc: meson-ir: support MMIO regmaps to access
 registers
Message-ID: <1d4b788e-6750-4f72-ad70-c91319e6714d@kili.mountain>
References: <95860d11-8317-4082-a1b8-a1fdaba9f6aa@kili.mountain>
 <32954093-cf5d-8802-eb1b-3458596a24ea@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32954093-cf5d-8802-eb1b-3458596a24ea@amlogic.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 16, 2023 at 07:47:24PM +0800, Zelong Dong wrote:
> Hi Dan Carpenter,
> 
> Thanks for your review.
> 
> Neil suggest to use devm_platform_ioremap_resource(), would it be better
> like this?
> 
> 	res_start = devm_platform_ioremap_resource(pdev, 0);;
> 	if (IS_ERR(res_start))
>         	return PTR_ERR(res_start);
> 
> 	ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
>                                 	&meson_ir_regmap_config);
> 	if (IS_ERR(ir->reg))
>         	return PTR_ERR(ir->reg);

Yep.  That works.

regards,
dan carpenter


