Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CAA2E8CAE
	for <lists+linux-media@lfdr.de>; Sun,  3 Jan 2021 15:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbhACOqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Jan 2021 09:46:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726848AbhACOqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Jan 2021 09:46:06 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A68C061573
        for <linux-media@vger.kernel.org>; Sun,  3 Jan 2021 06:45:25 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id n7so17108316pgg.2
        for <linux-media@vger.kernel.org>; Sun, 03 Jan 2021 06:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kUgvrlQebeRt0NNEmpB0SyluhRpHp9m6V4SdYixa0IU=;
        b=ujxd80AsJLeOZYvJO/xrpUZzapW60XMrADCioIAByI1ZgNpEIhJdJRpFO1igCQXbbr
         hULsqnEdILd6JmS/mv7WSAZxnkX1lYCK4OCQUiy7l9w9XNS9Qp4P+GF9jU3jOkoZxQKf
         51rIzjTay6XcijaLTtG2dO7pUcw85aBL/EwqEo4GC1tz9uQgbrFG80iMRrQkqA2oxEOW
         IR5hcEW9xr6YNx1rUd2a+8j22dmJcV2fhGVnhDKlUNqDhuN7ufPCtXa1Y5jdKh0UWufA
         hGKfKtIAPlainuP1PLcvmXn74y4/1ATFl0U3vbl6Cxn2LgXwjfZjTPQuMlRvLQz876WE
         gkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kUgvrlQebeRt0NNEmpB0SyluhRpHp9m6V4SdYixa0IU=;
        b=VD86xHiI9Q7I5aXyPqC8/HW6DLwG1atcdrTdU0SVaWxGpb4qk3sJNB76PjfY30/QRW
         8s1EZTzQJFSIHwQhT9uWErzom45gWRfLhAn/WZ7DkiuiG3HEPymM1Lb2brvkONNao8yA
         4k/nCaK8w6vu6MVs43ejkQDU69NVqHldVU6e3H22fWkH+1JVR+uVmWmMEP8euOuVgbwu
         iNTzWDTB8JihHu/WBewY7tO2/hSlka2yxknUY7dEfQCRL1Twfrk4NzuQOIrJJiEJL+68
         DrHGY17n2jm3uO39meVzTkRUeHc7h8o7+uvXMktgfplJVsQNFMh7sUC9AKtVDNMTBVtl
         0Ucg==
X-Gm-Message-State: AOAM533FepbWBfJXZlTVy5SrwQuCZ8qE64oLlXS4r7cxIhtbviVLwS6o
        Mp7ZORjQNQ8pvXDts4pn3Z+Pn4D0iYBm2uZvG6RwsYaAnwkdkg==
X-Google-Smtp-Source: ABdhPJxseAR9lec7QrQgv/dMolO7Ici49pGNyWxQZR9Pt5YS5n9uZAM+FzJEhmahYo/RmjXGaLYvqQpgkTqdiE3RrZM=
X-Received: by 2002:a05:6a00:170a:b029:19d:afca:4704 with SMTP id
 h10-20020a056a00170ab029019dafca4704mr41377919pfc.7.1609685125090; Sun, 03
 Jan 2021 06:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20201230204405.62892-1-andriy.shevchenko@linux.intel.com> <5018d3aa-338f-7cb6-161e-4c0eefdffa93@gmail.com>
In-Reply-To: <5018d3aa-338f-7cb6-161e-4c0eefdffa93@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 3 Jan 2021 16:45:08 +0200
Message-ID: <CAHp75Vc4qxZREmyLJhbMB4bgpG=7ZpkuPE1b2QYUuXz0sO+_Fg@mail.gmail.com>
Subject: Re: [PATCH v1] media: ipu3-cio2: Add headers that ipu3-cio2.h is
 direct user of
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jan 3, 2021 at 2:19 AM Daniel Scally <djrscally@gmail.com> wrote:
> On 30/12/2020 20:44, Andy Shevchenko wrote:
> > Add headers that ipu3-cio2.h is direct user of.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> For what it's worth:
>
>
> Reviewed-by: Daniel Scally <djrscally@gmail.com>
>
> Tested-by: Daniel Scally <djrscally@gmail.com>

Thanks!


> > Dan, feel free to incorporate this into your series.
> Thanks! I'll add it at the beginning so I can include this header in
> cio2-bridge.h, with my tags added too I guess

Right, please go ahead!

-- 
With Best Regards,
Andy Shevchenko
