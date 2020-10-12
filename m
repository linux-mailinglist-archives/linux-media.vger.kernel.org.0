Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7843828BFBC
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 20:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387909AbgJLSaH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 14:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387669AbgJLSaH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 14:30:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A93C0613D0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 11:30:07 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w21so14299884pfc.7
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VXDDWYwHhtf6Yvdpof41d4qUoS24o3vsqOYW8/Bbwnk=;
        b=tMY8FRhDOougstvw2tjVWMtOjjr1MvvybF/JAduqtymYIinUpqxuTRS0otMlUEN7Gy
         fAAf2qbmjNWR2NcdY/ZOs8KrRbvSXvieMfpd8z3WqC0dFHsTk5H1eU5woFitBFu5/VVe
         PUCKICsf3WnxUIpu9nJtgeQzs+zFUqQOQ/71ECrLUiu+onr00Ay1hnyRYm8oZEk3IZtt
         GQcTb9UTTQ5awtt6piSfxgmwtJDCkslQc9iGOyj/4Nuj8hNTWJoADRCwXdeAYWuJVmM2
         +FQm6YVMVJUfGcrhZkOF+i7iMthfDJRrzqTtj1n21JDnjHRn1qu1CfRT6xb2TNNTxPj8
         Oo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXDDWYwHhtf6Yvdpof41d4qUoS24o3vsqOYW8/Bbwnk=;
        b=hg4+/ROtNEFXOWbYd23ADFj7B1xcgfpUz70Rc6EuOQ+vX0RamENO34QN1OH+Fbcoz8
         sUgUFf5C+qm8KcM1wKPeOU7dOqMq1LdJutBPGuvCeyG9IlGFTWPo/MeIcjhXgQWnyUL8
         EV3dqWcBHsqdcJI3JPfDZU5mm4i5VzY1/b4+c4MdpjYOx6t/gH+CzCnjEaEFTUCz+aV9
         oAxjXv7HE0VFa87xFDwt/bW6u8qrsbJQD3fVQcQ/JDBj2rXaPYvBfxANWrizB5092neP
         WJzu1iVpgQYVoraxtiJcduCJli/GvRniJTM2UEgxbBJ5ifmtnxxc0le2LKzsCW3PQFfI
         Bxfw==
X-Gm-Message-State: AOAM530xf2CsEYSau29NiwMFSVcdGQWecY21lLV+vl8NZ0b44ofRq6xV
        a4Iwgf6x61LaC8ScWAD/ZL/OcPbAkk95Fnpoy04mWWy32eku2A==
X-Google-Smtp-Source: ABdhPJwVA5Fhctgrip6z+8y3uy4rXg4e8nwQzqiNgE4dRVnozCJXhG+pAAVObHS2DlTED/U2qAIzzZHY419Pr2oWNDM=
X-Received: by 2002:a63:308:: with SMTP id 8mr4663355pgd.203.1602527406745;
 Mon, 12 Oct 2020 11:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201012180414.11579-1-sakari.ailus@linux.intel.com> <20201012180414.11579-7-sakari.ailus@linux.intel.com>
In-Reply-To: <20201012180414.11579-7-sakari.ailus@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Oct 2020 21:30:56 +0300
Message-ID: <CAHp75VfKHAnjVV-FaSgWhJ_X2=27=nds7bPD4PBXyYzyiGfiqw@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] ipu3-cio2: Remove explicit type from frame size checks
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 12, 2020 at 9:09 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Now that the values are unsigned, we can remove explicit cast to u32.

the explicit

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 87d040e176f7..e42177f8c426 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1282,9 +1282,8 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
>                 }
>         }
>
> -       fmt->format.width = min_t(u32, fmt->format.width, CIO2_IMAGE_MAX_WIDTH);
> -       fmt->format.height = min_t(u32, fmt->format.height,
> -                                  CIO2_IMAGE_MAX_LENGTH);
> +       fmt->format.width = min(fmt->format.width, CIO2_IMAGE_MAX_WIDTH);
> +       fmt->format.height = min(fmt->format.height, CIO2_IMAGE_MAX_LENGTH);
>         fmt->format.field = V4L2_FIELD_NONE;
>
>         mutex_lock(&q->subdev_lock);
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
