Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D05211A374C
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 17:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbgDIPhk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 11:37:40 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41402 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728263AbgDIPhj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 11:37:39 -0400
Received: by mail-lj1-f196.google.com with SMTP id n17so94530lji.8
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2020 08:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oi8nKA6/ElSLxWVNM8FupW3/IkPWX0sl86ali4O80XI=;
        b=O/3kS3pJUPJbyX1pKHrBcd+JGnq/8uPSWxTmQ3xUC2hqXJO2xS7hZbYpk9yAEjAwcC
         DwtafVPK5YqLzQ8nKd6AVv0ITI/NeWnSU2XcJhO3VZV4KXPQuapJ4U1VyLH0LSRnAKw1
         +O40Z2nMbyiLOCAM5RZ51fLu/QdRA3Wcmh6RrPgr6KOrxjZGdgwmb98b8TLynHT1usC+
         LAF8g1FIOPhhu74Yxnl7TdYYygNVsRLIsQGOJR7gQnb5f2QwE+tF2Fv92cHRzZA5/caB
         lXOrknh3oVFEKUgQ8rgZblYONucXgsGtTvxvAepJ/t51IDGMZ6hznZWaiI0URYrkhC7z
         U4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oi8nKA6/ElSLxWVNM8FupW3/IkPWX0sl86ali4O80XI=;
        b=YRvxTjPiRy6Onn+QP+LopRp34vkb/+1d2RbtrfJ6AjCjFzLSTVcBve6KExGgJ7Go9u
         9bra+SrFOi8/u3xAhHUSIvbDitj4F1JpaIYVIZ2KG1414NDRA0sTjQgEQcVXmh6Zn2TL
         H+6BV9PmOcjqaha52wSLmT+tm8Fzq7BVQKkuEAfPmg7nWzZOFtvxQ6OEU7gQk18ECi06
         +igWRa9WafUh4ip6fBka9HTMC3I4HJUncbsm6tlsPCMih3Ja8jCvaPWF6xgtnCLrD+Z3
         QevqM0U5MkFwxsCc6q3AY8C2M7o6sELzdzKooh9hckxgJySHtEPzOavsd4a5vn07GKYJ
         DwYQ==
X-Gm-Message-State: AGi0PuZ10B/gFaPb5X9TW93FZL9XHoW1SL4h6zapJOr/pbU2kZRDE9fe
        7rboIwEp8K6zkIHVdCAOYkPh7h3HcL0NxRCvmeStuve1
X-Google-Smtp-Source: APiQypK70imRWvpzPzDu3zfqW7SyOAyTnwXxD64EpXgnR0nPbdeuCOYbDWfIN6ASzPXVKrY3XnOJ7PmmXpJ0iWzUavw=
X-Received: by 2002:a2e:9105:: with SMTP id m5mr231750ljg.37.1586446658229;
 Thu, 09 Apr 2020 08:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200406163905.24475-1-slongerbeam@gmail.com> <20200406163905.24475-2-slongerbeam@gmail.com>
In-Reply-To: <20200406163905.24475-2-slongerbeam@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 9 Apr 2020 12:38:05 -0300
Message-ID: <CAOMZO5Cz-2L6bTTC=f4bnPtOP1zZ6Ch5JbhuPg=DYz9wTK_TyQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/11] media: imx: utils: fix and simplify pixel format enumeration
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve and Philipp,

On Mon, Apr 6, 2020 at 1:40 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
> From: Philipp Zabel <p.zabel@pengutronix.de>
>
> Merge yuv_formats and rgb_formats into a single array. Always loop over
> all entries, skipping those that do not match the requested search
> criteria. This simplifies the code, lets us get rid of the manual
> counting of array entries, and stops accidentally ignoring some non-mbus
> RGB formats.
>
> Before:
>
>   $ v4l2-ctl -d /dev/video14 --list-formats-out
>   ioctl: VIDIOC_ENUM_FMT
>         Type: Video Output
>
>         [0]: 'UYVY' (UYVY 4:2:2)
>         [1]: 'YUYV' (YUYV 4:2:2)
>         [2]: 'YU12' (Planar YUV 4:2:0)
>         [3]: 'YV12' (Planar YVU 4:2:0)
>         [4]: '422P' (Planar YUV 4:2:2)
>         [5]: 'NV12' (Y/CbCr 4:2:0)
>         [6]: 'NV16' (Y/CbCr 4:2:2)
>         [7]: 'RGBP' (16-bit RGB 5-6-5)
>         [8]: 'RGB3' (24-bit RGB 8-8-8)
>         [9]: 'BX24' (32-bit XRGB 8-8-8-8)
>
> After:
>
>   $ v4l2-ctl -d /dev/video14 --list-formats-out
>   ioctl: VIDIOC_ENUM_FMT
>         Type: Video Output
>
>         [0]: 'UYVY' (UYVY 4:2:2)
>         [1]: 'YUYV' (YUYV 4:2:2)
>         [2]: 'YU12' (Planar YUV 4:2:0)
>         [3]: 'YV12' (Planar YVU 4:2:0)
>         [4]: '422P' (Planar YUV 4:2:2)
>         [5]: 'NV12' (Y/CbCr 4:2:0)
>         [6]: 'NV16' (Y/CbCr 4:2:2)
>         [7]: 'RGBP' (16-bit RGB 5-6-5)
>         [8]: 'RGB3' (24-bit RGB 8-8-8)
>         [9]: 'BGR3' (24-bit BGR 8-8-8)
>         [10]: 'BX24' (32-bit XRGB 8-8-8-8)
>         [11]: 'XR24' (32-bit BGRX 8-8-8-8)
>         [12]: 'RX24' (32-bit XBGR 8-8-8-8)
>         [13]: 'XB24' (32-bit RGBX 8-8-8-8)
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> [Make loop counters unsigned]
> [Decrement index instead of adding a counter]
> [Return directly from within loop instead of breaking]
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> [Fix colorspace comparison error]
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

This fixes a bug with an IC conversion pipeline.

Could we have a Fixes tag for this one, so that it can be applied to stable?

Tested on a imx6q-sabresd:

Tested-by: Fabio Estevam <festevam@gmail.com>
