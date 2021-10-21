Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17CC4364DA
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 16:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbhJUO74 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 10:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhJUO7z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 10:59:55 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F195C0613B9
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 07:57:39 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id dZVemlGZHqPdpdZVhmwFtb; Thu, 21 Oct 2021 16:57:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634828258; bh=gcorpW3iN0G2e02Zb95T574z8K9ZWuCM3YtNqvGSBsI=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jD2HD4LtSx9cshcuA8GBXw4Ufgxgk8UBGQX6kD4bOpamUSh+igFSgCoKEqiFjPg8F
         X7WexCTou7GFD3wJrFUclYuWhEAUixDD3c+to7e3n67reyBIwsXNBkDwFPe6x75/nb
         +9g/33eteWHoLFuoH2PoOCU3GHJycmcVcqnG04GCrG8RIM5roZ3x+i5Mwz911qNG6b
         PvGGID9liUSN/SppoaKE+xzxMP36nDRjgQVwP7ifbyBR1CHhXkYC0LIKQTPjEy9U9T
         PZ3b6L+hijHXqCE2TMkG4x4rQd8yf+B8yH9k0ibTMiC2CWWm2KvL3IJbU3/cpPeP8n
         l0eUP1D7zC9xw==
Subject: Re: [GIT PULL FOR v5.16] Add support for DMA2D of STMicroelectronics
 STM32 Soc series
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dillon Min <dillon.minfei@gmail.com>
References: <126f13fc-1d37-8bef-3411-4553864fe5be@xs4all.nl>
Message-ID: <dd8d7e0c-3f56-433d-a075-8e290ca2520a@xs4all.nl>
Date:   Thu, 21 Oct 2021 16:57:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <126f13fc-1d37-8bef-3411-4553864fe5be@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKQnS2ekSP/dNftzs9h64DHB2HpkVK6oL7WKFiX/yHOJ0tnLIfq6cETFH3ZzU6yf6fBYoQ1enf7XVGspIHz/C217qU0xq9quli+JjV6lURa4Vu+7gUoO
 LArvOWkOliTrgujJhRHkwNfMs8kBcsOmB7weyyrczs5KHQ2V6YQtXq+M8Iz9QhE/JnhR67W5P5wUVTW4eyarU2GcZ6ZF+XZPVoxS/f+EnYLrtV9Et7Xk76My
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I'll make a new PR for this without the clk patch.

Sorry Dillon, after digging a bit more into the clk series I think that this
should go to the CLK subsystem. I do not feel comfortable merging that patch
via the media subsystem because: 1) from what I can see it is part of a larger
unmerged patch series, and 2) I do not have the expertise to tell if this is
correct or not to just merge this patch.

Regards,

	Hans

On 21/10/2021 16:45, Hans Verkuil wrote:
> The following changes since commit 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8:
> 
>   media: venus: core: Add sdm660 DT compatible and resource struct (2021-10-21 14:26:19 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16k
> 
> for you to fetch changes up to b019395c863f436adb30237b50f22b027bec7351:
> 
>   media: stm32-dma2d: STM32 DMA2D driver (2021-10-21 16:14:57 +0200)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Dillon Min (8):
>       media: admin-guide: add stm32-dma2d description
>       media: dt-bindings: media: add document for STM32 DMA2d bindings
>       media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu platform
>       media: videobuf2: Fix the size printk format
>       media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting
>       media: v4l2-ctrls: Add RGB color effects control
>       clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after system enter shell
>       media: stm32-dma2d: STM32 DMA2D driver
> 
>  Documentation/admin-guide/media/platform-cardlist.rst       |   1 +
>  Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml |  71 +++++
>  Documentation/userspace-api/media/v4l/control.rst           |   9 +
>  drivers/clk/clk-stm32f4.c                                   |   4 -
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c       |   8 +-
>  drivers/media/platform/Kconfig                              |  11 +
>  drivers/media/platform/Makefile                             |   1 +
>  drivers/media/platform/stm32/Makefile                       |   2 +
>  drivers/media/platform/stm32/dma2d/dma2d-hw.c               | 143 ++++++++++
>  drivers/media/platform/stm32/dma2d/dma2d-regs.h             | 113 ++++++++
>  drivers/media/platform/stm32/dma2d/dma2d.c                  | 739 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/platform/stm32/dma2d/dma2d.h                  | 135 ++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                   |  12 +-
>  drivers/media/v4l2-core/v4l2-mem2mem.c                      |  21 ++
>  include/media/v4l2-mem2mem.h                                |   5 +
>  include/uapi/linux/v4l2-controls.h                          |   4 +-
>  16 files changed, 1268 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h
> 

