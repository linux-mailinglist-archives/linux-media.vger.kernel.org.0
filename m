Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A23674E27
	for <lists+linux-media@lfdr.de>; Fri, 20 Jan 2023 08:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjATH3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Jan 2023 02:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjATH3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Jan 2023 02:29:11 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829B279E90
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 23:29:10 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-4d19b2686a9so60824857b3.6
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 23:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ltSsSC+JZto0JrpK+1L3ljWItyAcHL59PJv9eZdjARQ=;
        b=r9lSpPFJUyFqK+rZATbzTPgn5Yc8YtOBMW4KLkAzpjSWswkhXZJpjiWsjjeiVcQpFM
         V5KPEYhcAontmo+zEDpfxk8O0uA1/LSD8vLZK57M+rTOwADpxS/Mgs3hCVcijhTrvaKe
         7sxv0cyUNErGDCyGUbJyiofUwVVWWyWKKd9cxsQh5+fUGPA8kNKR5iAOmv4JUJIIqols
         SP8gDHlTHUycodsVMHASSwo9JMWYEhdXxzDnVIXUMhZU+sQyS0kuc11Xrhi4nvO4yOc/
         8YIX35m82A7bfDpHsYJms/tVQvEdHDIoNPhk48p5+vbLuA5Zt7TugdJCHqh2pN1mIzVf
         NfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltSsSC+JZto0JrpK+1L3ljWItyAcHL59PJv9eZdjARQ=;
        b=UXJin09O1w/nxXQnDKRzPo2Abc10y9/Y/BGZs4ysHsdcm7HxkReKGpYiyLZhFWjMjg
         u7VSjKFCVlpv8PWOvnfBTi8UDm+XLK0dH4B1h2dVK6NV+a+bsPPN56O5x3q1FJizG2G9
         JoB8C4TU6rQGz1Zjm8/h5irdesM5IfX+O0qsB5QHU15jN8jkYtYtarDRDOI5om56Ptla
         8LyvwgkLsE/KRSzLwEiTnqc9cgUPX0ouvGf7pyAXA68Mk2bXBCnKsXchiQKfUQ8epeRs
         wA49045J9bp5rgXKcRBAV/DCdNp3ke99EIwqykmlWVup+rhTz5akuk/cMow4NLhkrrRc
         t6iA==
X-Gm-Message-State: AFqh2kpGhYm6PZkaQICK7K6s/ZQQvxrGV6lammL+bAye//puxGKqmOf8
        3HSZrYsC0IjuWzLa4GBluu1KlRa0uOlRlX/3F3FRWQ==
X-Google-Smtp-Source: AMrXdXv61KRxB3MJe8D+CgvL02tEZ8sNctXqSNuBpAF0a2GrjwbkOe3n1BQQ52Glni04fOfiOrZusfZYB82ps5yhXbA=
X-Received: by 2002:a81:6842:0:b0:4ff:e4bc:b56f with SMTP id
 d63-20020a816842000000b004ffe4bcb56fmr115853ywc.488.1674199749676; Thu, 19
 Jan 2023 23:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:28:58 +0100
Message-ID: <CACRpkdbXRtJOGOvtzChay4_FKdztLvN1GScCTYXiVWAVWvbDGQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] leds: lookup-table support + int3472/media
 privacy LED support
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 19, 2023 at 2:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Here is my version 4 of my series to adjust the INT3472 code's handling of
> the privacy LED on x86 laptops with MIPI camera(s) so that it will also
> work on devices which have a privacy-LED GPIO but not a clk-enable GPIO
> (so that we cannot just tie the LED state to the clk-enable state).
>
> Changes in v4:

I think this is good for merge, I reviewed the LED stuff that I understand,
but for the rest in drivers/media FWIW:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
as well.

I really like how this developed to solve a real old outstanding hole
in the implementation.

Yours,
Linus Walleij
