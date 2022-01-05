Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9388485890
	for <lists+linux-media@lfdr.de>; Wed,  5 Jan 2022 19:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243103AbiAESim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jan 2022 13:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243099AbiAESij (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jan 2022 13:38:39 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5742C061201
        for <linux-media@vger.kernel.org>; Wed,  5 Jan 2022 10:38:38 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id d1so469994ybh.6
        for <linux-media@vger.kernel.org>; Wed, 05 Jan 2022 10:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KDSSdl8IkbacxfFwsObHrS3PgJqOAa/GBT59WYZWGOY=;
        b=hUkWbHbz2hswycTdHLnrAm/MuO98IXDtZgYocw1/GhNAggTm949CZWE6RzTXjapTkW
         VS/DmW3iWzF0xKhT605D1XzwhMahz1ldavEJ2ZiPOQQzZEHJm7O71WALq9e/xkPsHQA4
         ENSyX5bKdJpqS3MOLxFVwu64vbML9heMh50dW8sH9YnMBKvfUfcsOO8Wz+cVwujxsZ/V
         Qek2oUB3vP8MzA5MMbz7HhUs52Zm1EXLKmd3xp8VauwoxCaEEjyLisUAc9Fet3GlfJT+
         x2L3Vjm7P/YbuIV7Wv7W7JxbyKct7n0LHl+DvlGmfCdNG+6DoeOyNtA41DfLDsswyNoH
         onrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KDSSdl8IkbacxfFwsObHrS3PgJqOAa/GBT59WYZWGOY=;
        b=QWfaimQct/nKFsu8AOq+QskiuZCRxvLmrHpYfv7fnCoD+zqICycbMSS2z4M067VbtS
         BQ7zcwLZRsgg3A4mTEQYSpHAhLZAUxQCAW0KOlXq25ZOhWDxo8mIHhaJNn75uY2/YZJ1
         vFtXDTDR3Vjvx2b209t4cUjoGJ+yO5nwCypK3u80OpPumFVB5tECnOvkYFGfKHHsIGL8
         vmrvpXWMRUwKRy8GbHzwOEOvPyxhHn6dCgfe7fszb2W+M6k9h+9bfag8sViTwBt0a0AD
         am7xL0MO7tXM7F/VH9E029lHHyOqHWZN0xEplOWt7GZbKcYcDODGXljJl+dbPiuivqfL
         bTKw==
X-Gm-Message-State: AOAM530sDWWV0RqoFBVcQXqYdR3J5+ZzS1mDhINlo/+qAeODw5S0GOvR
        xrI9541fG+xpWlVVZICv3mBFtvjMDO/Vtvs+kBQq5w==
X-Google-Smtp-Source: ABdhPJxb7sBxKDM43T6iP1tu6DArcpsKXXzzig25USibmzC/QeMkWpl4LwfoJZyuV92oHcxUzXWi2NF5BZOIohtw5jg=
X-Received: by 2002:a25:ae13:: with SMTP id a19mr52540860ybj.327.1641407917644;
 Wed, 05 Jan 2022 10:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20220104235148.21320-1-hridya@google.com> <YdW1hPRvKYjfORvp@kroah.com>
In-Reply-To: <YdW1hPRvKYjfORvp@kroah.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Wed, 5 Jan 2022 10:38:02 -0800
Message-ID: <CA+wgaPPSO1f=c+jYWqisNy_e8hxuxcr0VtpJcWe+FnKGyC2ZKg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release path
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        john.stultz@linaro.org, surenb@google.com, kaleshsingh@google.com,
        tjmercier@google.com, keescook@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 5, 2022 at 7:13 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 04, 2022 at 03:51:48PM -0800, Hridya Valsaraju wrote:
> > Recently, we noticed an issue where a process went into direct reclaim
> > while holding the kernfs rw semaphore for sysfs in write(exclusive)
> > mode. This caused processes who were doing DMA-BUF exports and releases
> > to go into uninterruptible sleep since they needed to acquire the same
> > semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
> > blocking DMA-BUF export/release for an indeterminate amount of time
> > while another process is holding the sysfs rw semaphore in exclusive
> > mode, this patch moves the per-buffer sysfs file creation/deleteion to
> > a kthread.
> >
> > Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > ---
> >  drivers/dma-buf/dma-buf-sysfs-stats.c | 343 ++++++++++++++++++++++++--
> >  include/linux/dma-buf.h               |  46 ++++
> >  2 files changed, 366 insertions(+), 23 deletions(-)
>
> Crazy, but if this works in your testing, it looks ok to me.  Nice work.
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thank you for the review Greg :)
