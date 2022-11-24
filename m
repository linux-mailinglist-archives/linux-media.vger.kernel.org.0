Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A63B638014
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 21:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiKXUKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 15:10:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiKXUKd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 15:10:33 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A405E74602;
        Thu, 24 Nov 2022 12:10:32 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id cg5so1507594qtb.12;
        Thu, 24 Nov 2022 12:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FivUeQVybi8xrmJyrYP94s9THnNLLdRS+2IJ/8tAMuw=;
        b=R+45aeplsXS6+AfF/t4Uo5wznE/U8VyZLe/UHLEEhk2HpTHmyBOHj1RFDwHYnotNhd
         eoyk2Q9F2QOddjKyFrbQVwcTgsuXKdBwZV1xauklkWGRbWWENFDt74voeAVe2KXZFVS2
         CS8z87pZPIZpqysDRNTycjXKo/068dQ1qNylJ62x2GPkIVhspZ8GJmPZCTFjTA6L61/7
         rxbOCZtYeBbk+2GDgPFhYbV5eFMb3khmFFsXpjPBOWCBE2j5Fdzbm2Wf+463xyXBAu2h
         2ITkj9AcoFxrXfwfzbKmDDYTdMa3Nt5BOmKPZEgh9+RiLEbdD3z3J3cQs7639BZ++QB7
         fzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FivUeQVybi8xrmJyrYP94s9THnNLLdRS+2IJ/8tAMuw=;
        b=FzuQfQGw5YyJCAKPad8SxiP3J/oMV9qEJTchgMjQZ7TMvCQEXYNgLkwmXaUk0+74Ga
         9LROYutnQVGm2KjcKD+pyym34ylBLxU6aYZveZlVOt2bAmTFgGjVAY2NkdpphfwbWhVD
         t0KSJJYGf/d2Q4E2wVjFTrrYQr3LWwCtLDfxfJ0nB43rL0nBhDlk0mijWcW+7yyykCva
         AbUdKYEEoNsT5Rgcv63TrvSKC540BdvxpEU8yNXZonyud5kH3HrEyeqzdWS4iTqVlnAC
         SNaD54XvZSNeMXt8SpmUHcIQiqVML7XnrUSHwj/9PTw98pPFHc191uwIp3O58rTDI8c8
         cBTQ==
X-Gm-Message-State: ANoB5pkosjZdpHfQq7HL6T6+9SzxlP+VkBJ+lvHn16/89DOvQq+oI2wr
        I9B45S217Yq8GlvnqWDsvpWmIvpQUmFh4K7UsLUvvVLAhDPA6Q==
X-Google-Smtp-Source: AA0mqf6aA4H1LuMx7WJDLNYA5QnMRHjeqaNel369zvPwCRce3LnEXz9sVPlwEFVAzLGgfg66Nbtu+7iJZQWRLMeUao4=
X-Received: by 2002:ac8:7652:0:b0:39c:c436:1ea8 with SMTP id
 i18-20020ac87652000000b0039cc4361ea8mr33100444qtr.384.1669320631747; Thu, 24
 Nov 2022 12:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20221124200007.390901-1-hdegoede@redhat.com> <20221124200007.390901-2-hdegoede@redhat.com>
In-Reply-To: <20221124200007.390901-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 24 Nov 2022 22:09:55 +0200
Message-ID: <CAHp75VdWWXCvHnVaE3pYuntXyeP7zPOc6PpcQaXWFkEEPf+QxA@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform/x86: int3472/discrete: Refactor GPIO to
 sensor mapping
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 24, 2022 at 10:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Make the GPIO to sensor mapping more generic and fold the
> INT3472_GPIO_TYPE_RESET and INT3472_GPIO_TYPE_POWERDOWN cases into
> a single generic case.
>
> This is a preparation patch for further GPIO mapping changes.

...

> +static const char *int3472_dsm_type_to_func(u8 type)
> +{
> +       switch (type) {
> +       case INT3472_GPIO_TYPE_RESET:
> +               return "reset";
> +       case INT3472_GPIO_TYPE_POWERDOWN:
> +               return "powerdown";
> +       case INT3472_GPIO_TYPE_CLK_ENABLE:
> +               return "clken";
> +       case INT3472_GPIO_TYPE_PRIVACY_LED:
> +               return "pled";
> +       case INT3472_GPIO_TYPE_POWER_ENABLE:
> +               return "power-enable";

default:
  return "unknown";

?

> +       }
> +
> +       return "unknown";
> +}

-- 
With Best Regards,
Andy Shevchenko
