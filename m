Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA93C59BFF6
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 15:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbiHVNAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 09:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiHVNAO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 09:00:14 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDCE30549
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 06:00:13 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id g16so7716157qkl.11
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=dLe1AxuAzl03MDNm18iUJuezY7stT/e7uyev3MtZqHo=;
        b=UWepMyZ5TIfEuT8Yj+6DOSmD/6jiSIz/nRp7602pGReYQKvgZQjGGtBvFh/mFm8o9r
         3VWGTWXC1GsQwfW//BENulX4pvh5xNfpgqy33m/QTDifd6dxWtNvJMxASgu4SVwabwhW
         rZZ4dQM76xwCPFyrhlw6UrIp/8NRTY8AXYEvYAFYHfjog7/Uffo7GX5DpXCuMAB6QAfh
         5PosFnOMKaJGrHqfjxwB5aQJ0JDKNiXGpWdkIC6LJ2mRFToGmAT7Jve6igJBX+WCkEsh
         Gq/+0OFL6XikKzFSB/CzqFDop/PGvkYs2T3ecERATpAGDXYTY9IfB41QWKPeP3y6JRbU
         lDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=dLe1AxuAzl03MDNm18iUJuezY7stT/e7uyev3MtZqHo=;
        b=YVYo5zG7KUyXUthubzutDiNkZ2thiGh0r38XwhjlaILgNlJHzri2XcCrpAXDQteOJ7
         dfmM8+HKM1A7p5b19bxFzrZmFIiyE8w4uhOh+QN+vKnVsUio2RF+6QujC6tjCEY2q6dX
         ao6w9ZLOo4EP+BCMfGIh+TIaszoQuwcsmRq3VG+TOW2Qke5KnV15ZWgkxRAHYo38JA7d
         YvfEdgVTI4IsI5L/z4xhg1+pobIdVGuVN8cDc7125fF4I7RZ/99Khz0vrs0EcO/GWpgZ
         Hj2rtx0WjqOUgqDjiXsFz6F4Vgo+I3ixw4jubUZu6Zjw9DtScHK/U28Oo+7L1Y754NSa
         pISA==
X-Gm-Message-State: ACgBeo007ATVk8NH9Gqdac1OpOA4xTDRif7wgLIIsFPQAbfxVJrcuYeL
        E8Y6BERXwkfCjKKbxm8G8vhFbBHu3ETFmDslEFF0yOe6lpvlfA==
X-Google-Smtp-Source: AA6agR6dykgyXd9KPuMJZQY9BjjMj70admBIsm3QdEntQrVU/7qkiM8C0AwxvH0BvsX8gap3jUMVqaKquQCpxJYqnzU=
X-Received: by 2002:a05:620a:2987:b0:6ba:dc04:11ae with SMTP id
 r7-20020a05620a298700b006badc0411aemr12409046qkp.748.1661173212951; Mon, 22
 Aug 2022 06:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220821215027.461344-1-hdegoede@redhat.com> <CAHp75VfV-goir434sZfwLhoCZbu48uZ0pcwdjfG7WzX_-eVuPw@mail.gmail.com>
 <3834201e-95a3-02e7-c549-e5630fb64892@redhat.com> <CAHp75VfxR6zfBzpdnM1RKv-ewnPCMejdLgY2QTnhfZ+sFFqcMA@mail.gmail.com>
In-Reply-To: <CAHp75VfxR6zfBzpdnM1RKv-ewnPCMejdLgY2QTnhfZ+sFFqcMA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Aug 2022 15:59:36 +0300
Message-ID: <CAHp75VfX+tN20dW_ULPmvZRo9fqwhPTLiOdBOhaAxjXYrFgO=g@mail.gmail.com>
Subject: Re: [PATCH 01/13] media: atomisp_gmin_platform: Switch to use acpi_evaluate_dsm_typed()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 22, 2022 at 3:57 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Aug 22, 2022 at 11:02 AM Hans de Goede <hdegoede@redhat.com> wrote:

...

> You may also add
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> to all patches, but the 1st (it has already SoB)

> and commented ones,
> which I'm going to do soon.

(should be read as)
... and non-commented, that become visible after I comment on a
couple, which I'm going to do soon.

-- 
With Best Regards,
Andy Shevchenko
