Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D7F638019
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 21:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiKXUOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 15:14:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiKXUOa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 15:14:30 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42510B0400;
        Thu, 24 Nov 2022 12:14:25 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id z17so1523709qki.11;
        Thu, 24 Nov 2022 12:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KaKGr4TBNARNGcREV+UlehkFv1+CQxpw8wXkwoKhVdo=;
        b=WEfsEZQAxqVPIAkWLaQJ0lkYJDfsnpUiOnlwD+PWL/pIyp+jB7uyBkHUpZYk0B74Tg
         94alGAifcTMoSZV9B+hMMKBBUSK3QVA5w3A+A1VwgIV/PNdVXCks8u1czrfWIIdJidVM
         p3ReJU0pUzJWch1G06z9BacA5apRWKOeThllY7EXONNQcVNb0pk1izrUetxWIDdsj/gZ
         Vf+7vo7mXTl5VNQROViIEcMGSllfVH0xyEsFu5XhuH3+Q3+gXu2QVgHj0mOJTZC/3IZz
         wvzI0DPUuCMcepX06vSgYld3a3rufJryKSg7FxP3v94hpBYDt+8KZkfBe/H4IpuceEHU
         qqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaKGr4TBNARNGcREV+UlehkFv1+CQxpw8wXkwoKhVdo=;
        b=zTQgUtZ31qvOlux2mpvjPBDVRzbH2Il5ADpDr6d6YEkclKvJGSZ8gs6YkZi8XTLFDR
         QBCJP+EhjyOsbKFSsASFITb3+zSb8FRprGl/8o4JFfVThBzQ4W/L3JVGJqOGvdyKB8Tx
         RsYVP3OV36qBw4f0VU+UGA2brK3f01hx4ZxCofD0t5XtHtR5FWWc7b5Y//NfQ4+3T25k
         n6iAayiR+GTCEGtVGDJD/YufcarSNQx/62d113akWEJAYXLzzejR5+b5jZoAvP+/KN2o
         0ME8S4STIszwpAJzXVVJT03Qp0FhYZ3DC28nD39k3gwkB++BcKetndXXW71+zPveKUmZ
         Dxtg==
X-Gm-Message-State: ANoB5pmH1BIq/P4W3Ojzc8TDpFbL4AMkUtj49d3FrMdX+XZTeNnb01fM
        mXvYoGYnXCuL34Y2/XTVcOt5rc6z2o4hJCAVn7051lplYh2IaA==
X-Google-Smtp-Source: AA0mqf4V+yYQLnCrlfwdCYscLtuPc966eZ1QPmuENexKaHi3raR8mEsWJ96cYU/1S5mguRup4OaqRBEBgJGCFoU0YXE=
X-Received: by 2002:a37:f504:0:b0:6cf:5fa1:15f8 with SMTP id
 l4-20020a37f504000000b006cf5fa115f8mr30846306qkk.748.1669320864320; Thu, 24
 Nov 2022 12:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20221124200007.390901-1-hdegoede@redhat.com> <20221124200007.390901-3-hdegoede@redhat.com>
In-Reply-To: <20221124200007.390901-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 24 Nov 2022 22:13:48 +0200
Message-ID: <CAHp75VcgRN=3O7cYsxVxcJ6PuSpDuZAs3ex0rhedaE94DBwBzg@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: int3472/discrete: Get the polarity from
 the _DSM entry
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
> The out of tree IPU6 driver has moved to also using the in kernel INT3472
> code for doing power-ctrl rather then doing their own thing (good!).
>
> On IPU6 the polarity is encoded in the _DSM entry rather then being
> hardcoded to GPIO_ACTIVE_LOW.
>
> Using the _DSM entry for this on IPU3 leads to regressions, so only
> use the _DSM entry for this on non IPU3 devices.
>
> Note there is a whole bunch of PCI-ids for the IPU6 which is why
> the check is for the IPU3-CIO2, because the CIO2 there has a unique
> PCI-id which can be used for this.

...

> +/* IPU3 vs IPU6 needs to be handled differently */
> +#define IPU3_CIO2_PCI_ID                               0x9d32

If it makes more than a single driver, perhaps pci_ids.h is a good
place to keep it there?

...

> +       dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
> +               agpio->resource_source.string_ptr, agpio->pin_table[0],

> +               (polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");

Parentheses are not needed, right?

-- 
With Best Regards,
Andy Shevchenko
