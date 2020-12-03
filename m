Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5EC52CDD20
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 19:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbgLCSKF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 13:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbgLCSKE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 13:10:04 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894A3C061A4E;
        Thu,  3 Dec 2020 10:09:24 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id t37so1880510pga.7;
        Thu, 03 Dec 2020 10:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kX4KVJsGsKYPIIK4aDYtyzJtYeHdnevNwh4wjCWOb0c=;
        b=QTBbK3JkISvsp2gZHBrLBJQZyAPMGYoyF0ezaPFpZ/hWd0KfzK91FRON+2mulxyaJC
         24vSphbfclOZbVO8HPWclbTJtCcX9+kbg3OESxXydsCwKX+NdE8Ue0hkWwQ+1HXhHebU
         m6DdRwBjI4o5jAaD3xm+16hEaB8HOXltbiGcG59sUxroV+YdGzuCgfV4vCYswLH+cPRz
         4Fzp5CQRWlo/KEskO1CMb+CKSV2HIrRESbWGOu8O3DOJmtBrTFALnQR44CrDs1mRM2+W
         ElMWMOKfkO8hainvVY8ebqRZYKhPQGBocLduTwSCiNVsLOIGWZCzVQpDAe51ftyLZElB
         h3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kX4KVJsGsKYPIIK4aDYtyzJtYeHdnevNwh4wjCWOb0c=;
        b=fqiKgTQ0TYddjxqvfc+VFMmGwsOkiL9ZkekjDfNU1GvaE0lLE1F5iy33CBtZcWOjIq
         blxyXKjbD0b3MIQ88Kzc1AI8/OWj8Cy3ol1FgRArmf4vLgnlo5epZl2wjvjQbwccMKLe
         5y0Anb45FaLbicOHLnqGnyLu3ZrIrcmDFH40kd4o2JXr/XUUFSM95v7kVoV2u+JYHsdu
         Z3cl5EBdwk7eTAvA+qEUH5b74aatVHY0oS5sDlxLn2EaNnT7fWr8lQa6mLX37WJlz/KL
         lOToxYlukzXYiM5YchQeeMJcNEzqV4vXGSN6VZevWPAXJMN0Z99W0cUbejmtUqDhrxbU
         4BMw==
X-Gm-Message-State: AOAM533TBr6sSFs/mDZKssChgGN+ssyaEqWtr2NNsjlEq4Z1Qbrm/Cz5
        Rn23LdflPEU0L5JUKLTwOVByC18et/PvagWeeRg=
X-Google-Smtp-Source: ABdhPJwra2X3D41eYNE1JAbptcU2GxCMf3L2f8csctuSUqDap0iHk6iRo5leC3xzgYlyjSqNIXA2yx4jLkuOdXuijYs=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr90263pfe.40.1607018963998; Thu, 03 Dec
 2020 10:09:23 -0800 (PST)
MIME-Version: 1.0
References: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
In-Reply-To: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Dec 2020 20:10:12 +0200
Message-ID: <CAHp75Ve7Sdf=Zy5N1LN_w22=YwPgWWR-FZtrQcAkOF=ViT2Kbw@mail.gmail.com>
Subject: Re: media: i2c: add OV02A10 image sensor driver
To:     Colin Ian King <colin.king@canonical.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 3, 2020 at 8:03 PM Colin Ian King <colin.king@canonical.com> wrote:

> Static analysis on linux-next with Coverity has detected an issue with
> the following commit:

If you want to fix it properly, see my comments below...

> 529 static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> 530 {
> 531        struct ov02a10 *ov02a10 = to_ov02a10(sd);
> 532        struct i2c_client *client =
> v4l2_get_subdevdata(&ov02a10->subdev);
>
>    1. var_decl: Declaring variable ret without initializer.
>
> 533        int ret;
> 534
> 535        mutex_lock(&ov02a10->mutex);
> 536
>
>    2. Condition ov02a10->streaming == on, taking true branch.
>
> 537        if (ov02a10->streaming == on)
>
>    3. Jumping to label unlock_and_return.
>
> 538                goto unlock_and_return;
> 539
> 540        if (on) {
> 541                ret = pm_runtime_get_sync(&client->dev);
> 542                if (ret < 0) {

> 543                        pm_runtime_put_noidle(&client->dev);
> 544                        goto unlock_and_return;

Instead of two above:
                       goto err_rpm_put;

> 545                }
> 546
> 547                ret = __ov02a10_start_stream(ov02a10);
> 548                if (ret) {
> 549                        __ov02a10_stop_stream(ov02a10);
> 550                        ov02a10->streaming = !on;
> 551                        goto err_rpm_put;
> 552                }
> 553        } else {
> 554                __ov02a10_stop_stream(ov02a10);
> 555                pm_runtime_put(&client->dev);
> 556        }
> 557
> 558        ov02a10->streaming = on;

(1)

> 559        mutex_unlock(&ov02a10->mutex);
> 560
> 561        return 0;
> 562
> 563 err_rpm_put:
> 564        pm_runtime_put(&client->dev);

> 565 unlock_and_return:

Should be moved to (1).

> 566        mutex_unlock(&ov02a10->mutex);
> 567
>
> Uninitialized scalar variable (UNINIT)
>     4. uninit_use: Using uninitialized value ret.
>
> 568        return ret;
> 569 }
>
> Variable ret has not been initialized, so the error return value is a
> garbage value. It should be initialized with some appropriate negative
> error code, or ret could be removed and the return should return a
> literal value of a error code.
>
> I was unsure what value is appropriate to fix this, so instead I'm
> reporting this issue.

-- 
With Best Regards,
Andy Shevchenko
