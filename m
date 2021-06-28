Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFDB93B58BB
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 07:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhF1Ft2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 01:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbhF1Ft1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 01:49:27 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F017CC061574
        for <linux-media@vger.kernel.org>; Sun, 27 Jun 2021 22:47:01 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y4so13183772pfi.9
        for <linux-media@vger.kernel.org>; Sun, 27 Jun 2021 22:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RMUZO1MZSVkGJAqSa1s4TnlYCqt3/jZnu3nahYWbu3g=;
        b=k2CIjsvyYN5k9pNsMxEGqliv8058WhO0Knhi508nW+KT12KiU5Npmu8s2abqNlifaJ
         aYX4PC3Em2m1Xme0o8nXVw1WrV++pYbEyLaHc0dnN8/o3c1ItOuo9ksyu6+kBbQcTBgG
         94XiuCgobv8u+6gAB37fvpz5H9Uaz3ttJUcDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RMUZO1MZSVkGJAqSa1s4TnlYCqt3/jZnu3nahYWbu3g=;
        b=nqFQZnw9rmn/uMQQq422MYiRxhtteYkPT4rTMdYfmeFVF4JYIN1PMlCsM3Cnhowtd/
         J8p+8cBjUHDAzLQX/mG7x8sbLza+R4gMIzK9KJThRMggYpJpBvpuXLnC6P6f8ucMCSDW
         tofFHNL6/snWuWyuQeiCPeLdWHkItrfjifRtQ5XgF8qrFqjbYh1dvE5HtH+oy9DLA9pA
         vhxqOvrSAXjAEnY3vuIXqIonMgvxtKqKTluHVV0c1GwCHohjuCmVhMGQYRr6YbcqLiy5
         Kld6QpI/qSxAPhXZcxSWE5gDzhtyYbKWeEzygIkYD5YTQp+UOjPHoNhBLDeBI06qi/5U
         +BgA==
X-Gm-Message-State: AOAM533mr9292IDR/ztEAJUHiGhkTwT0WQzOw3ZWuzjOkzlSNPgihxQl
        rd9RRMDEGaPIayZ4oZJkq0YRrQ==
X-Google-Smtp-Source: ABdhPJxNUJHxrcKn/WvX+q9OYjEK9tEppfzIrdIPVjkPLN6N75/xZ33e8l6lHWPULQKbAS7w0ATsLA==
X-Received: by 2002:a63:903:: with SMTP id 3mr21641501pgj.147.1624859221605;
        Sun, 27 Jun 2021 22:47:01 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:35c6:3ef6:5ed6:fee])
        by smtp.gmail.com with ESMTPSA id p24sm13405793pfh.17.2021.06.27.22.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 22:47:01 -0700 (PDT)
Date:   Mon, 28 Jun 2021 14:46:57 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH 0/2] rkisp1: Two small fixes
Message-ID: <YNliUasfxV3XpTKb@chromium.org>
References: <20210625082309.24944-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625082309.24944-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 25, 2021 at 11:23:07AM +0300, Dafna Hirschfeld wrote:
> Two small fixes to rkisp1
> 1. remove useless vaddr field
> 2. set the dma address of the capture buffers only once in 'buf_init' callabck
> instead of each time the buffer is queued
> 
> Dafna Hirschfeld (2):
>   media: rkisp1: remove field 'vaddr' from 'rkisp1_buffer'
>   media: rkisp1: cap: initialize dma buf address in 'buf_init' cb
> 
>  .../media/platform/rockchip/rkisp1/rkisp1-capture.c  | 12 +++++++++++-
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h   |  6 +-----
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c   |  3 +--
>  .../media/platform/rockchip/rkisp1/rkisp1-stats.c    |  6 ++----
>  4 files changed, 15 insertions(+), 12 deletions(-)

For both patches:

Reviewed-by; Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

