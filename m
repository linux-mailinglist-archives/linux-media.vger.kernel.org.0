Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF574280E06
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 09:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgJBH3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 03:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgJBH3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 03:29:15 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C729C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 00:29:13 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id t17so597444wmi.4
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kxd5hzhSDcN4ctz6x2RvCSqugHcxeJokIp27D5KED8k=;
        b=B1DIGQUMc7+3/rlgvop1/eqvnYSOOQfhfMAPwIaY4gzMUg50fSaVRwcJWcPOdTE9cq
         UZHoEun0TjDbYNyf+8rO+Lj27dIHSYuBVamN2t4s9zVQpPoOnBEtI88c8g43zE1a1Ioc
         mbg1nfv5J58vxx5A8tBhOLdGoWN/ghmAPjXD5kPLFSbtQxA8pIqR+C0FxcmUW/R2zDUZ
         Dw4sZ2Bylpo8YaJv5YC1MTC0uqHzPJWZDlRkKqaVzGuw0Yg+AMI7sk3uGnHMfSsd9cUw
         dw8VZxago/g4Ufq7K+NilI8xct1iV3iPAkgnWuf2yHWOrsDRVbAz+psEcYiREPun8h+B
         XXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kxd5hzhSDcN4ctz6x2RvCSqugHcxeJokIp27D5KED8k=;
        b=qb7nobCudjQIcNk0NQnqRaENXg51Qa5IA+TX0gaCvaZ38Cu+FsBIanF+gTPs4AMUmi
         zy1pDgBBREbPuxmWp+pPODuD5ldSP+rNT1JM5bNNZS32mPhJbIE9eGgD0rQiA8QP2itp
         OalV8T77VSd/bxcNv2EaDYTLc84lkFQy8KKgocIiu3b0gDCz0w4VdrsTrwH7QzBxnDXo
         szePHg+vKZDpXNqDNPS82sSyMP0Qw5x07Twq3oAdiNl5hSfIG94jshtnkqCaH2AguOLb
         AFJrHCVczNYBRFu/1qW091ivGiQHoteY3hya2oSJHG6QgFhhbwo1stcAEf//ScFsMimd
         zpdw==
X-Gm-Message-State: AOAM533rxajVOR+JWZGLAbdNaiErmpaI9t9d7L03I66uiaOyTo9MkTv1
        Oxhtf/8btVOR2qBBNhFt/RAi3D3gLHOxbQ==
X-Google-Smtp-Source: ABdhPJy9OCzhBBKjp2R5hEJN2JoMk7fUbFNjVX5zkpxDghCWcCoBQI2k5ccU3pfiArmrrxhwG6Yq6w==
X-Received: by 2002:a1c:5458:: with SMTP id p24mr1257937wmi.160.1601623752185;
        Fri, 02 Oct 2020 00:29:12 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id x17sm758230wrg.57.2020.10.02.00.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 00:29:11 -0700 (PDT)
Date:   Fri, 2 Oct 2020 09:29:09 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] zoran: fix sparse warnings
Message-ID: <20201002072909.GD15586@Red>
References: <20200928132831.1587872-1-hverkuil-cisco@xs4all.nl>
 <20200928132831.1587872-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928132831.1587872-3-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 28, 2020 at 03:28:31PM +0200, Hans Verkuil wrote:
> The output is not fully supported yet, so some ops are
> commented out. Also comment out the corresponding callbacks to prevent
> these sparse warnings:
> 
> drivers/staging/media/zoran/zoran_driver.c:656:12: warning: 'zoran_s_output' defined but not used [-Wunused-function]
>   656 | static int zoran_s_output(struct file *file, void *__fh, unsigned int output)
>       |            ^~~~~~~~~~~~~~
> drivers/staging/media/zoran/zoran_driver.c:649:12: warning: 'zoran_g_output' defined but not used [-Wunused-function]
>   649 | static int zoran_g_output(struct file *file, void *__fh, unsigned int *output)
>       |            ^~~~~~~~~~~~~~
> drivers/staging/media/zoran/zoran_driver.c:635:12: warning: 'zoran_enum_output' defined but not used [-Wunused-function]
>   635 | static int zoran_enum_output(struct file *file, void *__fh,
>       |            ^~~~~~~~~~~~~~~~~
> drivers/staging/media/zoran/zoran_driver.c:302:12: warning: 'zoran_enum_fmt_vid_overlay' defined but not used [-Wunused-function]
>   302 | static int zoran_enum_fmt_vid_overlay(struct file *file, void *__fh,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/zoran/zoran_driver.c:294:12: warning: 'zoran_enum_fmt_vid_out' defined but not used [-Wunused-function]
>   294 | static int zoran_enum_fmt_vid_out(struct file *file, void *__fh,
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---

Hello

What about using "ifdef CONFIG_ZORAN_OUTPUT" instead of "ifdef 0"
Otherwise:
Acked-by: Corentin Labbe <clabbe@baylibre.com>

Regards
