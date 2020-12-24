Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3AE32E2709
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 14:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbgLXNAd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 08:00:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbgLXNAc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 08:00:32 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E78C061794;
        Thu, 24 Dec 2020 04:59:52 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id v19so1508043pgj.12;
        Thu, 24 Dec 2020 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Jr9F/690UBbYbyn+k3sooKcCVDtYkNF4Oiu8+df2GA=;
        b=ZB+QyLHBPwq1c/hPyEocJCrpP+Qv1Z4uI3xFhH7c28xOHWYOwrgDMW7TF0YNPVT/QD
         znWbPYCkBWXeAlgjPpawGjQGfgsx22JyEc+pvlsaD6+c6iI3upkLZF9j0RfYTrAg3ULf
         84ch3aAu/KpqaEhUiq96pspRAl2CVvaEipAE/SUA41ej5xFnDyp6TGFkMRLBfn7WE7FA
         ET4EsM1GK9M/XCq2B+QELQVux4+N5ljD4Nkf4Wsqjol7HunhRe6uHAffC+UameXehfvb
         CK7tmYu6Zvve1LNcCshYsRhxIpbFAofYigclt6/sKLjg6XornOV5i1kNlLVCb6Z+Vmeb
         h12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Jr9F/690UBbYbyn+k3sooKcCVDtYkNF4Oiu8+df2GA=;
        b=BRSOo6IHgW/9ikM3PNfuwa013VSH+ATBTZauoN8jQidlvXy1uuZUErD5AjbWDFcBGb
         xvOEKzqmFWVGe2zlCmMIwouoRPfk7VdYN0YGgcgMrxBI0HHBSg07oAhnF4eSqmCS45HJ
         yKVuvzMJDjIi5C+NLpS44V6ud6FevNXmmFwr+l0cTLsvx1PEh3hy80Ndsy5L1Xp9QJmz
         fpLUq0Ck1NtPZzvPI2opH0PbDEXokvLtZX9N7PlG0pVj0jhINwJ8yU4bX6ErM3whtoV4
         udcSKKfzpIUY+Z96eHPfoZzppkp6hCUMDCIE+n1UP1iqdKGhtdEUT24WVSPAsQKyhEzW
         FaGw==
X-Gm-Message-State: AOAM532KjtMP3EU9ZrKUr6o1nx/m3MuB3x0HNy/YVJHkaql5iaE2eDiD
        JtSRE4ZpDFz+pXfqGvv3xgQxsI0Gf6oWDMRYTes=
X-Google-Smtp-Source: ABdhPJwHzsiefM3VCA9T7exEgAJGxpvRNC6lLAQHZx3Tp1p8GQHo3TxmD5gMICyqER9M+3G4AMCYExMPxrInVpTfaN8=
X-Received: by 2002:a63:74b:: with SMTP id 72mr28774234pgh.4.1608814790947;
 Thu, 24 Dec 2020 04:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20201223133528.55014-1-ribalda@chromium.org> <20201223133528.55014-9-ribalda@chromium.org>
In-Reply-To: <20201223133528.55014-9-ribalda@chromium.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 24 Dec 2020 14:59:34 +0200
Message-ID: <CAHp75VeTWUGF0huwLm9OPkDpDiDJ8vtG0W2jzoDohWEfB+L3yg@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] media: uvcvideo: Use dev_ printk aliases
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 23, 2020 at 3:39 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Replace all the uses of printk() and uvc_printk() with its
> equivalent dev_ alias macros.

> Modify uvc_warn_once() macro to use dev_info instead printk().

...

> +#define uvc_warn_once(_dev, warn, fmt, ...)                            \
> +do {                                                                   \
> +       if (!test_and_set_bit(warn, &(_dev)->warnings))                 \
> +               dev_info(&(_dev)->udev->dev, fmt, ##__VA_ARGS__);       \
> +} while (0)

...

Why not to use dev_warn_once() instead?

-- 
With Best Regards,
Andy Shevchenko
