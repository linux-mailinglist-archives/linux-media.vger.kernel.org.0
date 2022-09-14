Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 354F85B88BE
	for <lists+linux-media@lfdr.de>; Wed, 14 Sep 2022 14:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiINM6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Sep 2022 08:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiINM6w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Sep 2022 08:58:52 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73220760CB
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 05:58:49 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a26so5791488ejc.4
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=RbeM9DZniF3+BT0n/bil36L/UN9NE1w4V5SmRGWQ15E=;
        b=Sk9Sv6K0LAVqg5NkER8hGVtz1lY8vgR5kQkURSb0bBWvQdp6b5TRWDYlnqe1IPls//
         kwYrnHjMmJVEYrRZs992Y4+oIR6cu7Qz4y/BT2qhZv5wJjNt3hQkl/GFFN6rWqinAd4D
         mYQFwi/D5TQ06aKzoZBomC1Cz/MeoGKvz67RuyTDlopCePzGXtBPWTDz70yGbfnE7AUD
         zujS0IGqwmqxJxbbKR6yknxyrpr4qGcgScMh2KBGF1sBDl8D5Sx503EMGJB/BLkSdCeU
         7zQeDy1lQdFRmNJqb7d6wdaF9Miwbq1OYkadFT3vKa64e8cEsZrRezgTwhrpOC1nuHX2
         iPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=RbeM9DZniF3+BT0n/bil36L/UN9NE1w4V5SmRGWQ15E=;
        b=hctpAbS0I0zbY4XF/ekx5RSspMQywYdytqYTpnKZxFIvk0Qqma/t+9tuYNcIeImPJ9
         bOqk69TLwGBq/i6SkCpIHnu6DlsQlKvtdu43HcPZI8DeIFSIkIAYbdeq5byDAkIq4YfL
         Uw0Wi8WKJwATzdta6jHfWrGD8lIUV0EznP81Rxy7EtZmss4HvzehbhV7/p/Zwj7+3fSo
         hhF4opJfjoQi8lAmIoz5JMwFNB/27gHQAaxzJbX+8v4iP+arVILtW//MRBjNPIao9cVt
         z7P+7p8ubB4K/jfDqo/lOetCdfaZVRFjS/IFR5JB9R4H20c3SvbGeoCc8MhmQ5c4H9YB
         l7uQ==
X-Gm-Message-State: ACgBeo2VQjDpIaUWylgg6N/OTkF74xBmFnQXmf9wPSyqBnpf1DopbaQa
        q54jwAphWu6SP28XKws1VVdYjawhRWWJZFmtwb9otw==
X-Google-Smtp-Source: AA6agR4JR88clS0aetO6jT0vyk4MuwBqg1K1qnwtnMfXx3GWwDQs4vpwTRHZrGOnQQePAzb8qtteFI0vsOD0JzLVzAU=
X-Received: by 2002:a17:907:e9e:b0:77f:9688:2714 with SMTP id
 ho30-20020a1709070e9e00b0077f96882714mr7738909ejc.208.1663160327903; Wed, 14
 Sep 2022 05:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220913164104.203957-1-dmitry.torokhov@gmail.com> <20220913164104.203957-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20220913164104.203957-2-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Sep 2022 14:58:36 +0200
Message-ID: <CACRpkdZaVrF43K8hSyamd99b+tCs-nEsKH=1oqo=5ww4v6EKfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: s5k6a3: switch to using gpiod API
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 13, 2022 at 6:41 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This patch switches the driver away from legacy gpio/of_gpio API to
> gpiod API, and removes one of the last uses of of_get_gpio_flags().
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
