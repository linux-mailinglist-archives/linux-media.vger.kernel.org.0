Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77812CBDCA
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730059AbgLBNGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgLBNGM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 08:06:12 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD30DC0617A7;
        Wed,  2 Dec 2020 05:05:31 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id 131so1200036pfb.9;
        Wed, 02 Dec 2020 05:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8DiyGUtrm8IiO8i/wnMX1oZhze2ZA4MlHShu8D56M8=;
        b=OIMHhzY6J7XYAQCHoRe1B4veVAPwsx2IJ9EXWJMyJX6vYEVmrRjSlgDL+3lzFlwExP
         19T9oB4xIheEYhWjyj3kb3b++mSrQz5Fiu6xhN8NP+6x25jdOOwKJnG/CbAQK0ZX/2gY
         qRVnhNpq9bRrmaDwu4eH9L8syucEVlDu3/0/7Bncs57vYQTIKAZxQEo6VqPGeoy0U9+J
         yvlUub1dekxSXbpoqE4MnP7eOx8rvb5+l0Wphh3Ik8vQnfy/k2YD6O9xasPXdW9IATIg
         RZAY0KmBVtqweaGAsv+lzxt6f2ychwJdoTiv/DpHqo/C8BVdB86qC8qBqsBKJNL0DE/a
         JeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8DiyGUtrm8IiO8i/wnMX1oZhze2ZA4MlHShu8D56M8=;
        b=uH9kWZvx8mVzX280wEVxufhpcbANAChTIPSU7S5XKQPYQSNz3Cwuz6/rNdcyD4gub1
         dZy6HIwCwKoIZi/WpbCFgTeXpRMi/mFZ4lCiw9eP6mME/GJ67br0ynaXnWy9IFdeLREw
         K+bZ0tRe+gcLNhDnpXItK4wpd0itwH47OtC+6tYQBBQgitbDAamamMSPdIAUt6AqgALY
         54GzZo8i/ky9+O1KWzJxdh3f6u76XAVqMd/s7ymHU3rJeIGumLU7YUCtPSEW2o3hc8Sz
         4CiCScbS/+Ov+nAsAEiQS878R+mdt61TyrRXLnESn3IRRH1ns7kWCOrathXzgzwT3Qnd
         BsHA==
X-Gm-Message-State: AOAM531IYYLg3WmKD0RUVZJUiLBEnufyfOwVR3PFzV+QJfpl7btODFK4
        aebK3JDnPpMCSxO8Oht437KXGvVKC2Tj0iL3qzI=
X-Google-Smtp-Source: ABdhPJzZSFMwBIgOysDlZl/GZjOuH+v/CSpZZ8HXN7p0bmcoIhmC0i4abkowUIHk/+hYcopG8rL5tj/ohkx/2qoUp2o=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr2559237pfe.40.1606914331174; Wed, 02 Dec
 2020 05:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20201202113838.21621-1-festevam@gmail.com>
In-Reply-To: <20201202113838.21621-1-festevam@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 2 Dec 2020 15:06:19 +0200
Message-ID: <CAHp75VczRkD0C4+BGBzgNcFsO-b7QAV3gsW3e_kx=3Bzss+FKA@mail.gmail.com>
Subject: Re: [PATCH v3] media: coda: Convert the driver to DT-only
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 2, 2020 at 1:44 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Since 5.10-rc1 i.MX is a devicetree-only platform, so simplify the code
> by removing the unused non-DT support.

Shouldn't you add something like

  depends on OF || COMPILE_TEST

to show explicitly that driver requires OF to function?

-- 
With Best Regards,
Andy Shevchenko
