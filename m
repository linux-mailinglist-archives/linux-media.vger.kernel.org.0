Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70752799B9
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 15:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgIZNio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 09:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZNio (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 09:38:44 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D637C0613CE
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 06:38:44 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id m6so6977202wrn.0
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 06:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bqi9sLwWnlTy/9duL5JURMR9XZe21FNoRwVPFWE2t+k=;
        b=JXGfUbTg3B2e8oPwjamVIwYl94Gut9IlZCO6lUl5KmN01rFWzCCyjPPDA8G58DGTyq
         ECd56fYXCwMGQOiwEzK172IrZFW3VxZm7iswSwC7ik3+B/gp9i8xm4sfFXQGr0AQQKE6
         F52ymLCWePc7oiaxtBbPE9NGMvgOostgSizJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bqi9sLwWnlTy/9duL5JURMR9XZe21FNoRwVPFWE2t+k=;
        b=rdUQtWM6mLoEz9BcsrSG85LDjxag0tO96xqM61luLzNxTeJEw2hDtYDvWQFD38lPwK
         H8dr1PwhN/M4TSF7vm1mrwMHRPDQEJ/DJF99a2shxtBsLmrVFEz5FDITyo/prphlZGAH
         2m+O/KSv/tvxijEIgamyRt5SDmB6xQHUpJm9sIKBHiw0UFOK1SLT2tbVpHMzJ94Vp7CN
         fJAPM5doBELXUv2cO+Xzj0MBrVF7gOEsavenbfHhWT3geQaokHWF04EGRoRzxazpOKOj
         096wZ/GrFt98R2KFCy4hhOw0s/1uNn5iG5Jt2eJzr6PWtUO9gdWX4/v3TfZHFW2ug9te
         Oq9Q==
X-Gm-Message-State: AOAM5300X78A1gDo9jgIW9Rxf6XDiiX930L6SO+aM0ch9V8gOSAGdWte
        ylEJw24W5YWqmCyDMBoVrceRxQ==
X-Google-Smtp-Source: ABdhPJz1+RQLiIC5JVgwCHp0KvWiHdQSN5nUljkXNC7xYqzCl0UiIc97BKmrB6aZn7e6aozlP6nmRQ==
X-Received: by 2002:adf:f082:: with SMTP id n2mr9496786wro.35.1601127522900;
        Sat, 26 Sep 2020 06:38:42 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id z11sm6838306wru.88.2020.09.26.06.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:38:42 -0700 (PDT)
Date:   Sat, 26 Sep 2020 13:38:40 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v4 00/10] media: staging: rkisp1: add support to
 V4L2_CAP_IO_MC
Message-ID: <20200926133840.GF3781977@chromium.org>
References: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Sep 01, 2020 at 01:16:02PM +0200, Dafna Hirschfeld wrote:
> The patchset solves several problems in the rkisp1 driver.
> 
> 1. Currently the resizers output media code MEDIA_BUS_FMT_YUYV8_2X8 when the input is
> MEDIA_BUS_FMT_YUYV8_2X8.
> The patchset adds support to other media codes on the resizer according to
> the chroma subsampling.
> Setting the correct media code on the source pad that matches the
> chroma subsampling reflects userspace  that the resizer has downsampling
> capability and also the resizer entity does not have to check the capture entity's
> configuration to get the scaling ratio, the information of how to scale can be
> obtained from the source media code of the resizer.
> 
> 2. Add support for the V4L2_CAP_IO_MC capability on
> the mainpath and selfpath captures. This helps userspace to know the
> right configuration for streaming. This is especially helpful for the
> RGB and Grey formats that expect media bus MEDIA_BUS_FMT_YUYV8_2X8
> which is not something userspace can 'guess'. Adding a mapping of the
> required mbus code for each pixelformat also makes the link_validation
> code much simpler, it just has to check if the configuration matches the mapping.
> 
> 3. Removes unsupported packed yuv formats - this patch was already part of a pull request
> and was dropped due to merge conflicts.
> 
> 4. Remove bayer formats on the selfpath resizer since they are not
> supported on the selfpath capture.
> 
> 5. Remove support to YUV444 pixel format, I was not able to find a configuration
> that supports this format. I kept getting bad looking frames.
> I tried to add capture yuv444 formats by adding an entry:
> 
> +       {
> +               .mbus_code      = MEDIA_BUS_FMT_YUV8_1X24,
> +               .hdiv           = 1,
> +               .vdiv           = 1,
> +       }
> 
> to the list of supported formats: rkisp1_rsz_yuv_src_formats[]
> 
> full patch: http://ix.io/2vNJ
> 
> On the mainpath I get good images, but on the selfpath I get bad looking images:
> 
> https://pasteboard.co/JoWp3U4.png
> 
> https://pasteboard.co/Jp1YWLR.png
> 
> Interestingly, when changing the sp_input from default RKISP1_MI_CTRL_SP_INPUT_YUV422
> to RKISP1_MI_CTRL_SP_INPUT_YUV444, then the images that are not upscaled look good:
> 
> https://pasteboard.co/Jp22u6E.png
> 
> but with upscaling (1604x1232 -> 1920x1500) it still looks bad:
> 
> https://pasteboard.co/Jp22MBU.png
> 
> 
> 6. Fix the configuration to support Grey format - the 'write_format' field should
> be 'planar'
> 
> changes since v3:
> patch 1 - remove '----' line from commit log
> patch 5-7 - refactor code, add documentation
> patch 8 - change function name rkisp1_rsz_yuv_mbus_info and code in function rkisp1_rsz_set_src_fmt
> 
> 
> Dafna Hirschfeld (10):
>   media: staging: rkisp1: cap: change RGB24 format to XBGR32
>   media: staging: rkisp1: cap: remove unsupported formats
>   media: staging: rkisp1: cap: remove unsupported format YUV444
>   media: staging: rkisp1: don't support bayer format on selfpath resizer
>   media: staging: rkisp1: add capability V4L2_CAP_IO_MC to capture
>     devices
>   media: staging: rkisp1: add a helper function to enumerate supported
>     mbus formats on capture
>   media: staging: rkisp1: rsz: enumerate the formats on the src pad
>     according to the capture
>   media: staging: rkisp1: rsz: Add support to more YUV encoded mbus
>     codes on src pad
>   media: staging: rkisp1: cap: simplify the link validation by compering
>     the media bus code
>   media: staging: rkisp1: fix configuration for GREY pixelformat
> 
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 199 +++++++++++-------
>  drivers/staging/media/rkisp1/rkisp1-common.h  |  11 +
>  drivers/staging/media/rkisp1/rkisp1-resizer.c |  93 ++++++--
>  3 files changed, 203 insertions(+), 100 deletions(-)
> 

Except one comment for the YUV 4:2:2 format removal patch,

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
