Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5118E4A0074
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 19:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243308AbiA1SxT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 13:53:19 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:57906 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350700AbiA1SxS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 13:53:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3AD85B826D8
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 18:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DE1C340F2;
        Fri, 28 Jan 2022 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643395995;
        bh=b/MXwDna936EGsLS8s5lxsxRBEDp1yz5kb9h+znZa4M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kKaevMXU2tK+A0+5cDAiL9u27kEzzdhnmxqt2Vf6Gc/RcrGGB5IM+MLi2lc2EICly
         7nieSaDmr8SUh1wgH2Iko+cobPUlitr1bwgLT/0OtaSKmZBcwhYjIgfcQds0U++K9n
         nNRp2NDBYZthw1XWPNVzqOz6DQVr3/WVTXvqWfxSJc3viYl9XaGtyYnthwSoe/jNcJ
         T6wvOB8T0KHIqHGUfvHk3D2+DldQxtrcX6hxw8/RVjC9NZDcjUUl5Zjb/cr0ZB1QxX
         8dC83Isscu1UpGkhSkzqcJq+GKaVoy+mkivOouYZKD65nGs1JGR+VqjLYYWa0b0FFG
         mPLCosmPgALzA==
Date:   Fri, 28 Jan 2022 19:53:12 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL v2 FOR 5.18] V4L2 patches
Message-ID: <20220128195312.092b1d3d@coco.lan>
In-Reply-To: <Ye7QMv0OBntzuC1C@valkosipuli.retiisi.eu>
References: <Ye7QMv0OBntzuC1C@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 24 Jan 2022 18:13:38 +0200
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> Here's a bunch of patches again for 5.18. Most notably there's V4L2 fwnode
> / mbus_config cleanup by Laurent, the hi847 camera sensor driver from Shawn
> Tu and the od08d10 camera sensor driver by Jimmy Su. Fixes elsewhere are
> included, too.
> 
> Since v1, a few more patches have been added and I've dropped a camss patch
> already picked by Hans.
> 
> Please pull.
> 
> 
> The following changes since commit 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c:
> 
>   media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 20:58:56 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/for-5.18-1.1-signed
> 
> for you to fetch changes up to a6876b00e5daa786a406db09f214bbbb4d1f200c:
> 
>   media: i2c: dw9714: add optional regulator support (2022-01-22 18:27:43 +0200)
> 
> ----------------------------------------------------------------
> V4L2 patches for 5.18
> 
> ----------------------------------------------------------------
> Angus Ainslie (1):
>       media: i2c: dw9714: add optional regulator support
> 
> Benjamin Gaignard (1):
>       MAINTAINERS: Update Benjamin Gaignard maintainer status
> 
> Bingbu Cao (1):
>       media: ov2740: identify module after subdev initialisation
> 
> Janusz Krzysztofik (4):
>       media: ov6650: Fix set format try processing path
>       media: ov6650: Add try support to selection API operations
>       media: ov6650: Fix crop rectangle affected by set format
>       media: ov6650: Fix missing frame interval enumeration support
> 
> Jimmy Su (1):
>       media: i2c: Add ov08d10 camera sensor driver
> 
> Laurent Pinchart (9):
>       media: pxa_camera: Drop usage of .set_mbus_config()
>       media: i2c: ov6650: Drop implementation of .set_mbus_config()
>       media: v4l2-subdev: Drop .set_mbus_config() operation
>       media: v4l2-fwnode: Move bus config structure to v4l2_mediabus.h

>       media: v4l2-mediabus: Use structures to describe bus configuration
>       media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_*_LANE flags
>       media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_CHANNEL_* flags
>       media: v4l2-mediabus: Drop V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag

(Some of?) those broke build today:
	https://builder.linuxtv.org/job/media_stage_clang/412/

Probably due to a conflict some other pull request.

So, I dropped them. Please rebase and re-submit.

Thanks!
Mauro

Thanks,
Mauro
