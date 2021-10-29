Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41DF43F956
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 11:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhJ2JFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 05:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhJ2JFD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 05:05:03 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C652FC061570;
        Fri, 29 Oct 2021 02:02:34 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z20so36598507edc.13;
        Fri, 29 Oct 2021 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nS6jYz3cucdlFDbq8U4H9S+iq+KrEhV7Y5RCLPWPosQ=;
        b=KYyQ+UCosdWW8cktMHLXpCWFab8PSevDJTpCqDaFhtfc7I2yFhh89rWYfyoU4A6puw
         7TSL6WwBgPfhlG3vz+A782SK5LRvJB968inOI0Z4Rua30P8LeZ6YExu3x0Y0V25c5u1m
         T2t7BZ20xwlTFeZQ71GUckB8SuwCoh6geXVxFXAN/CA2GBI8fgQQB6/p2OilcMPJhgNe
         a2FdeFAT2qmZ5BPilVH1q3LhNfhLj2OVOLaggErYPk982qVn0pCIXTHtPEfm2EQJ5pD8
         EoM1KI5mYXIPppAaxltzHVirRKUmU0/7LrsnzYNuY7ffs8VdJiYGs98qhZGF/t5wIV/H
         O38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nS6jYz3cucdlFDbq8U4H9S+iq+KrEhV7Y5RCLPWPosQ=;
        b=VzuLOSY/3w5Jx+Y5x8kLUgdFENHetO69AMydeWpKGUOsHoegQiaVfRIYopmJ29ls5E
         CWb+6UH4DcZgSExYwWoPrmTyhgJ8hF3DJrYAoSu6rlLeL0p8bizrTYuxbiZ1lUqs2Cq2
         sQu/WQYymD+01w1IoVV6GNoaaPBvC24/lQkuAruiFLy18PWI6Mq9UgMpMTG2Ko9BGXJj
         QCj/6hRJ2RtgucJGXxwUulwvt3sNt27GW782nAKRsirnHlW0aKGI3TQ0bgjWSJPeTYMH
         BCkwca42Mcw6Sxg6VlEitPM/B7io48GGFAwa7+Rx+/Kiory3D2AleAt+paJSW5OZKwec
         FP4g==
X-Gm-Message-State: AOAM533JLfeBiWLdhvWNP14xbwGa+DYaEiTJSNuKPm90aEdAkmcEAwn0
        VuaKR9w/H0a196lDBstW8FkN5NgZ/AkagCaJ8ao=
X-Google-Smtp-Source: ABdhPJyLcuIsKbG0bGqnhJj0qA6UJfcpoDtHFA5pKI1/PedSJpot0rg1uyEzdU0A/2ZimDEByF+LX4XUhW5xZZtxzxY=
X-Received: by 2002:a50:9ee3:: with SMTP id a90mr7723267edf.224.1635498153395;
 Fri, 29 Oct 2021 02:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <750e50daa3ed65a7eb060cb0eb5cfc60dc9386be.1635497370.git.mchehab+huawei@kernel.org>
In-Reply-To: <750e50daa3ed65a7eb060cb0eb5cfc60dc9386be.1635497370.git.mchehab+huawei@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 29 Oct 2021 12:01:57 +0300
Message-ID: <CAHp75VdaTEOaGhA43O1==Deg_0Ej_ZzOp8AX5NKZB5zegN42Pg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: atomisp: better describe get_frame_info issues
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linuxarm <linuxarm@huawei.com>, mauro.chehab@huawei.com,
        Aditya Srivastava <yashsri421@gmail.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Baokun Li <libaokun1@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 29, 2021 at 11:50 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> When atomisp is used by a normal client, it fails to get
> frame info. However, the information is confusing and misleading,
> as there are several wrappers for such function, and the error
> could be on different places.
>
> So, improve the error log in order to allow narrowing down
> where the error is actually occuring.

...

> +       switch (type) {
> +       case ATOMISP_CSS_VF_FRAME:
> +               *info = p_info.vf_output_info[0];
> +               dev_dbg(isp->dev, "getting vf frame info.\n");
> +               break;
> +       case ATOMISP_CSS_SECOND_VF_FRAME:
> +               *info = p_info.vf_output_info[1];
> +               dev_dbg(isp->dev, "getting second vf frame info.\n");
> +               break;
> +       case ATOMISP_CSS_OUTPUT_FRAME:
> +               *info = p_info.output_info[0];
> +               dev_dbg(isp->dev, "getting main frame info.\n");
> +               break;
> +       case ATOMISP_CSS_SECOND_OUTPUT_FRAME:
> +               *info = p_info.output_info[1];
> +               dev_dbg(isp->dev, "getting second main frame info.\n");
> +               break;
> +       case ATOMISP_CSS_RAW_FRAME:
> +               *info = p_info.raw_output_info;
> +               dev_dbg(isp->dev, "getting raw frame info.\n");

Can we get break; here followed by default case?

>         }
> +       dev_dbg(isp->dev, "get frame info: w=%d, h=%d, num_invalid_frames %d.\n",
> +               info->res.width, info->res.height, p_info.num_invalid_frames);
> +
> +       return 0;


-- 
With Best Regards,
Andy Shevchenko
