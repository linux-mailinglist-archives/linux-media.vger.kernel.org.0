Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185773E5A88
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 14:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237963AbhHJM60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 08:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235380AbhHJM6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 08:58:25 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC861C0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 05:58:03 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id f3so10221205plg.3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+TNZoWk8pUl6F8MigB3066o0J5ysYTvO+kKMNFiy1C0=;
        b=Xxk0YXPSVqNSaF6BI0gL3+WlwSjENa1I1+wb5Ruu3LU95/Uv3t04vnn6VVT3iyG150
         gD8NYjVIoROy1f4Y7Kcvf5KDp6ZSAdwHwAdSjp6L6H7Z5jvlGnb+dCsVbzrjiX9WPiu5
         QdHKpSVTQia6oCzOJqDv3AKYUkyrfcnLFsHZprnj3BBuEsLrqA99xwkZe3l6tILp6WBJ
         xM8UMugFC47cqPQgAP8TM1RvFUEUKZrUQUVMyGFG3QTZNM3kGwNHoAOokd7vzDNoKscC
         fmBuPUSias6zKk3YtTni3sXZROWxT0ozMHMP7ePPEnQULZU7ZWNvVxi+0IONM6QicjjE
         C+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+TNZoWk8pUl6F8MigB3066o0J5ysYTvO+kKMNFiy1C0=;
        b=mawa9dNjBDY0vsi6wZl16WGN5iyOXW2xYG06ETeYsvQoAt0BdxHpTGJVIzz9UpZxi0
         J39wsPX7Ac9SHW1BcnnINxmI9iw+ZUwQzsdtFR1Z1wjrglTgPvQP9blW2GZg861DrlGF
         zhcXWZIoIe1UbDhu0kaLwkngF6D6Rjo1JfIzJv57arsvzEJbhwGuiuIVbiAHrNeWjmuG
         ZYyAATIpmKeaO6ai98Fh4AOZ3LfMFuacbuDHnFkt7Nw5Ts8Z+zq5zgoamGy7hiThT3WA
         N96Mioe/2xVAiip/+nUklXGFwi3iD9UhyhxpZ/JqG4xj2SZCzljynxSqIQgydSdU3CNr
         8AsA==
X-Gm-Message-State: AOAM533A5hVKr5ufzTEiti4CP8qTugtmcqN85c0ini20ozdbetNmFbj/
        xWitrfDjk8btXbmP0kjZr51kgX5VaeikZO70yxQ=
X-Google-Smtp-Source: ABdhPJyX4Deq8+LQwZwtCOdxzynjlTzei1Z4kv4Ei6dBYc7nDcomK9IuljNM58J077x1yClOJUDIZ2reSMpajfgaKgQ=
X-Received: by 2002:a63:40c1:: with SMTP id n184mr25504pga.74.1628600283345;
 Tue, 10 Aug 2021 05:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210809225845.916430-1-djrscally@gmail.com> <20210809225845.916430-2-djrscally@gmail.com>
In-Reply-To: <20210809225845.916430-2-djrscally@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Aug 2021 15:57:26 +0300
Message-ID: <CAHp75VfbeNfJdwEeMg=A5MmEcs3d5_xGS8WBpCtyX196c=5WtQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] media: i2c: Add ACPI support to ov8865
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 10, 2021 at 1:58 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> The ov8865 sensor is sometimes found on x86 platforms enumerated via ACPI.
> Add an ACPI match table to the driver so that it's probed on those
> platforms.

...

> +static const struct acpi_device_id ov8865_acpi_match[] = {
> +       {"INT347A"},
> +       {},

No comma for terminator entry.

> +};

-- 
With Best Regards,
Andy Shevchenko
