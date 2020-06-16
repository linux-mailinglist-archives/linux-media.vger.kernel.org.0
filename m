Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049001FAFEF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 14:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgFPMMy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 08:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbgFPMMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 08:12:51 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FADC08C5C4
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 05:12:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l11so20530633wru.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 05:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q6OsjkJk4pboo5l2xvILBNUm3B6366KdViVmWJQJc1w=;
        b=kdsn5tjdB6ktRJ9mmWCnOQ9CfEMUqcxAszDkUfimcaluXzI0gXdq+3lGnL2wowHLuJ
         XVwwdLvjpzcwXu8CBc8dnkftrxJ1N7+/Y46OkIHUxelWqtxbn8YE5rj6g16lNDhVb/7G
         XCprtIPsYY1SGOmOrKUjp11REFjEEO+9rO8Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Q6OsjkJk4pboo5l2xvILBNUm3B6366KdViVmWJQJc1w=;
        b=eiyv4WN9QZWoaueegZgdSjJzBZLE2Rz2+FsweT/GRZ24ANr4GY/gjXqUzl4gKiZ+em
         +P+LKdIPnyLeoTG4x5mLWctNQswGXgSPAn670hSQvSbXhE+4NPdWsuYINk4VVtiDLSiS
         kLwX2V92adhQlHEhzbSCeP94NS+7YN2cSd2KAeyHjuB0fcrXjm3FwwomT4vSGL7RJQs6
         HJXO+t1Wh2hDYf98IMPIbWhpvLuTLtE7+i6Q3QfIhx+wTCzM+C6hr1LQ+tM167z/dQg+
         Vkag2B4wcR5lzkJWxkY3wTGnczPZVUtNpT2pLvYMwGpZ6QdUamEIjKDOPhVAqZL/imaR
         MH8A==
X-Gm-Message-State: AOAM532tVeBJJfVjuR6D65ntCRD7lYHOjrDRpESRrrs/GLhZnTk7LjfO
        YO6WuEHmzfyDBQCU0YXOUqsHQg==
X-Google-Smtp-Source: ABdhPJwE/rveo96P37ip4JED1ZrNUfLnxqMG17ohOhxH9h34F9ic/IEpoM6pzw55iAcxdQcPOHNGsQ==
X-Received: by 2002:adf:a396:: with SMTP id l22mr2758118wrb.24.1592309566724;
        Tue, 16 Jun 2020 05:12:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q11sm29162628wrv.67.2020.06.16.05.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:12:46 -0700 (PDT)
Date:   Tue, 16 Jun 2020 14:12:44 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/6] remove deprecated i2c_new_device API
Message-ID: <20200616121244.GN20149@phenom.ffwll.local>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 15, 2020 at 09:58:09AM +0200, Wolfram Sang wrote:
> I want to remove the above API this cycle, and just a few patches have
> not made it into 5.8-rc1. They have been reviewed and most had been
> promised to get into linux-next, but well, things happen. So, I hope it
> is okay for everyone to collect them like this and push them via I2C for
> 5.8-rc2.

for the drm side of things:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> One minor exception is the media documentation patch which I simply have
> missed so far, but it is trivial.
> 
> And then, finally, there is the removal of the old API as the final
> patch. Phew, that's been a long ride.
> 
> I am open for comments, of course.
> 
> Happy hacking,
> 
>    Wolfram
> 
> 
> Wolfram Sang (6):
>   drm: encoder_slave: fix refcouting error for modules
>   drm: encoder_slave: use new I2C API
>   x86/platform/intel-mid: convert to use i2c_new_client_device()
>   video: backlight: tosa_lcd: convert to use i2c_new_client_device()
>   Documentation: media: convert to use i2c_new_client_device()
>   i2c: remove deprecated i2c_new_device API
> 
>  .../driver-api/media/v4l2-subdev.rst          |  2 +-
>  .../userspace-api/media/conf_nitpick.py       |  2 +-
>  arch/x86/platform/intel-mid/sfi.c             |  4 +--
>  drivers/gpu/drm/drm_encoder_slave.c           | 15 ++++-------
>  drivers/i2c/i2c-core-base.c                   | 25 -------------------
>  drivers/video/backlight/tosa_lcd.c            |  4 +--
>  include/linux/i2c.h                           |  8 +++---
>  7 files changed, 14 insertions(+), 46 deletions(-)
> 
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
