Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DE845FC78
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 04:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351782AbhK0DwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 22:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237225AbhK0DuT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 22:50:19 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431B4C061A2D
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 19:04:49 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id p37so22169377uae.8
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 19:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oyWJQWZmbfuER+tnH7hXXM9xMHEX76X7f2PIAw5ys7g=;
        b=RJlpqjozN8GtRyGfwiU+98EVeqpYC7fcdGsjuVzmhC94O6cw8cHARyEO57+UW3zX/p
         Z/PsMi4bISVP4wKJMBcGguC8zlUujFhmkLwTItkOUtvLIxUmr0cKYYo/UHPVgWFiU4hx
         3i579kRKb0oQrg1R3Ovnix8fVMIrKzpNNYBgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oyWJQWZmbfuER+tnH7hXXM9xMHEX76X7f2PIAw5ys7g=;
        b=DOiwC14DMzOwrcJR3Pi+tu5RveKG6ewtKqGS3IJUIuNOLFFlK2m7aB0vUr1bH2HS6O
         VxXW53ey7DzOSaFtVjNmwHrfIRi70BSjEQr1ypy9WqKOVGoERdmKdLaWD+vb2J7mh7ii
         Y2Xrjw4NBDAt/tNTT/4QXHyybcVQCTHTyx6r9Y97e2Ysd0BUSIZJT473+YSvVmjuhC7R
         /uWS8CFFRF/+XCaU5rX0LkvDf1LAceb7/BVn8hcmyoba7/iK+YSdXXATPjb2UEaqp0SM
         CUXnXq3zmbQ1NF76uAogIQyoioUZTzPC47WDjJ6mzQMS+v3s/oJPrEJhkTjNAGCw4EXW
         Zo2g==
X-Gm-Message-State: AOAM530rlCD+iCO1zXOlocstdL5FMI/ZbmOdsVaLlU50vYULnd045rYP
        6NEypFGJR0XZDxfO0gfWxLiGbQxUDwzRg+VvNd0nHmXaPWlG0w==
X-Google-Smtp-Source: ABdhPJz7vuAW3+erNMKOIb/TqxtVk3nKq/lN/Dx0qMFXvJkuorDmH4b541/XRA3RSYATnlUJTF4AJuFxlg3Pj7miHcU=
X-Received: by 2002:ab0:6ecf:: with SMTP id c15mr39743087uav.113.1637982288212;
 Fri, 26 Nov 2021 19:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20211110120910.12411-1-dafna.hirschfeld@collabora.com> <20211110120910.12411-4-dafna.hirschfeld@collabora.com>
In-Reply-To: <20211110120910.12411-4-dafna.hirschfeld@collabora.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sat, 27 Nov 2021 12:04:37 +0900
Message-ID: <CAFr9PX=FKnuv_YzadHxZTbwAU4ruuwTiUsN6WbwdjD8wF+f1rw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] staging: media: wave5: Add the v4l2 layer
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com, dan.carpenter@oracle.com,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Wed, 10 Nov 2021 at 21:09, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> +static int wave5_vpu_probe(struct platform_device *pdev)
> +{
> +       int ret = 0;
> +       struct vpu_device *dev;
> +       struct resource *res = NULL;
> +       const struct wave5_match_data *match_data;

.. snip ...

> +       dev->dev = &pdev->dev;
> +       dev->product_code = wave5_vdi_read_register(dev, VPU_PRODUCT_CODE_REGISTER);

You access a register here..

> +       ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
> +
> +       /* continue without clock, assume externally managed */
> +       if (ret < 0) {
> +               dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
> +               ret = 0;
> +       }
> +       dev->num_clks = ret;
> +
> +       ret = clk_bulk_prepare_enable(dev->num_clks, dev->clks);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to enable clocks: %d\n", ret);
> +               goto err_clk_prep_en;
> +       }

but only get and enable the clocks further down.

For anything that needs a clock enabled to access the register and
doesn't have it enabled when probe is called the CPU might lock up.
I found this out while trying to get this code working on another chip
that has one of these IP blocks.

Cheers,

Daniel
