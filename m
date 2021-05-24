Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441ED38E021
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 06:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhEXEYS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 00:24:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55176 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhEXEYS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 00:24:18 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AE40476;
        Mon, 24 May 2021 06:22:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621830170;
        bh=/FXr8DeutJi7txNGzj3I5+wNIFdUxICtbxNu9hVr06Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gIX3rKaDE4Bx2scngYfBF7qIojUZfGZRPZuAnkzcPtrqDr6XZzPiVIHDCsv+Gn5Qy
         hOGO3jAE/UIirso1E9BRxBbB0KBA3fzMwho4dFpvS38rIutvuw0bWc2eWxgDL21IPM
         uV+tl/tgF+ffe9ttGOK6AlqYajlIF0VkRG9M0Muw=
Date:   Mon, 24 May 2021 07:22:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     mchehab+samsung@kernel.org
Cc:     linux-media@vger.kernel.org, builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] imx7-mipi-csis driver improvements (#74349)
Message-ID: <YKsqFlgUKZHR0Q8D@pendragon.ideasonboard.com>
References: <YKReJdBSV9yIXfxt@pendragon.ideasonboard.com>
 <20210519011015.4636-1-jenkins@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210519011015.4636-1-jenkins@linuxtv.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, May 19, 2021 at 01:10:15AM +0000, Jenkins wrote:
> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YKReJdBSV9yIXfxt@pendragon.ideasonboard.com/
> Build log: https://builder.linuxtv.org/job/patchwork/107748/
> Build time: 00:23:35
> Link: https://lore.kernel.org/linux-media/YKReJdBSV9yIXfxt@pendragon.ideasonboard.com
> 
> gpg: Signature made Wed 19 May 2021 12:37:13 AM UTC
> gpg:                using RSA key CB9D6877529820CD53099B1B65F89C37BC54210D
> gpg:                issuer "laurent.pinchart@ideasonboard.com"
> gpg: Can't check signature: No public key
> 
> Summary: got 2/25 patches with issues, being 1 at build time, plus one error when buinding PDF document
> 
> Error/warnings:
> 
> patches/0001-media-imx-imx7_mipi_csis-Fix-logging-of-only-error-e.patch:
> 
>     allyesconfig: return code #0:
> 	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
> 	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
> 
>     allyesconfig: return code #0:
> 	SPARSE:../drivers/media/cec/core/cec-core.c ../include/asm-generic/bitops/find.h:90:32:  warning: shift count is negative (-192)
> 	SPARSE:../drivers/media/mc/mc-devnode.c ../include/asm-generic/bitops/find.h:90:32:  warning: shift count is negative (-192)
> 	SPARSE:../drivers/media/v4l2-core/v4l2-dev.c ../include/asm-generic/bitops/find.h:132:46:  warning: shift count is negative (-192)
> 	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:268 v4l_print_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
> 	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:292 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
> 	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:302 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
> 	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:328 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
> 	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:347 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
> 	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:352 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
> 	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:362 v4l_print_framebuffer() error: unrecognized %p extension '4', treated as normal %p
> 	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:735 v4l_print_frmsizeenum() error: unrecognized %p extension '4', treated as normal %p
> 	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:762 v4l_print_frmivalenum() error: unrecognized %p extension '4', treated as normal %p
> 	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:1424 v4l_fill_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
> 	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1929 vivid_create_instance() parse error: turning off implications after 60 seconds
> 	../drivers/media/platform/exynos4-is/media-dev.c:1287:6: warning: unused variable ‘ret’ [-Wunused-variable]
> 	../drivers/media/platform/davinci/vpif_display.c:114: warning: Function parameter or member 'nplanes' not described in 'vpif_buffer_queue_setup'
> 	../drivers/media/platform/davinci/vpif_capture.c:112: warning: Function parameter or member 'nplanes' not described in 'vpif_buffer_queue_setup'
> 	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
> 
>     allmodconfig: return code #0:
> 	../drivers/media/platform/exynos4-is/media-dev.c:1287:6: warning: unused variable ‘ret’ [-Wunused-variable]

I don't think my patch is responsible for all this :-)

> patches/0003-media-imx-imx7_mipi_csis-Update-ISP_CONFIG-macros-fo.patch:
> 
>    checkpatch.pl:
> 	$ cat patches/0003-media-imx-imx7_mipi_csis-Update-ISP_CONFIG-macros-fo.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
> 	-:28: CHECK: Prefer using the BIT macro

This is a false positive.

> Error #512 when building PDF docs

-- 
Regards,

Laurent Pinchart
