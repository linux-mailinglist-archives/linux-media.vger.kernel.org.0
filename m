Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA382A010B
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 10:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgJ3JSO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 05:18:14 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36843 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725808AbgJ3JSO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 05:18:14 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YQXtknNVdWvjMYQXxkGngZ; Fri, 30 Oct 2020 10:18:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604049491; bh=eJqDFG3kNVE3ve2waqjLKvPfyty1UrKzCD+TRJYT4nQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iRgOU0pOHEx+URk147BRvhkpqT4qeRYEv9tVpLinccZrgIqG++DxtzHxBHAHXTqCR
         E/YiRx0RgkZ8TnOAErewaD8tT2cy1voY1mVOg7m774cLlyAIM92TRviGbr5IcOurny
         7DcczPjjM9l9JbNelHrHGM/JcmylC69SYh8QI6LZX9u+R8Q7VBF8U+EhaevDIJEpQz
         VXzzWrnHBq7ah9eiBYE1X18RSD0SiIRYZyJoYvRM6VfjDbPzgWljBh2zFaqNeBRzPN
         6jGrIE89L3MJt7C2P/jnUCFVG7Yiwp27Kwui4JxiKYutu/TOim6/32gGR0R9FaiXQg
         nusEhBnyPJy6A==
Subject: Re: [PATCH 0/2] destage Rockchip ISP1 driver
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        heiko@sntech.de, kernel@collabora.com,
        dafna.hirschfeld@collabora.com, zhengsq@rock-chips.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, tfiga@chromium.org, ribalda@google.com
References: <20201030055153.1981530-1-helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <822e7152-00c6-28fe-1997-f4f9b33ebce9@xs4all.nl>
Date:   Fri, 30 Oct 2020 10:18:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201030055153.1981530-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJRyz+DT4luHmHHm2mgdYQvH4KqYZq3wa36trLUyRu6kVI0niSbzKbY/nG9zbBUm/IdcJ+AUVN7H0rfFmiNn6o34bFdRg5TAPFNn9vCy2pj5oirHFCP6
 wWjVLg08GWMCBJKknv1oiXkqZ4YdwDEJFB0Ct9BkZAPpf0lQVt/Laz0Hw2nQmuSM25egCh1lb5s0xPaIr1SgiKm9vG8UQOjUXePj0KdbkgljebYxgUV2TvPM
 z8J32fmCl4VsTwT772sEhK4yEH/b8VgLy3kvWrHLK0GqaMzU8GbLeGyvyttPES0QMWL0rIJ8bejNZqPNms/OwCEYHnqA7ECRsjV4fJwOdU/HRYhlMT50bQIU
 qO0A0kS9z491O8D+epVRlVz6TZ8lgV3Rnm9z91hrLZ7ITn59GZjbZDiVPSNvGFkCkF4lgsyLk02Lr0Izh4DAFC0L5ifTHvZ7rmwLwuQiSHcUsAmiNxn3dyXS
 RNq4nMHBZYxmIB/FCLjmVZ2KG2eKc/uWpLnd9eGjoHACJjHs3aODSeqeYzps7rU4WLd8dB9QiA+wYhbrUFz6dja/NZ74NihdZhJdY1RLcP5eKiVVBV6SoLSr
 I6jjvvOg2e9Jq98OL4CGDZS4VKZRS/gF1D0yCyQ2PMlmSNM4uf5qemZi8CCQdinPsRY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/10/2020 06:51, Helen Koike wrote:
> Hello,
> 
> I think it is time to move this driver out of staging.
> 
> Thanks all who contributed, specially to Dafna, who put a lot of
> effort addressing all the items in the TODO list, fixing bugs,
> cleaning the code, addressing past comments and testing.
> 
> Please, review the driver, see if there is any other thing that should
> be addressed before this change.

I didn't see a MAINTAINERS patch!

Regards,

	Hans

> 
>> media-ctl -p
> http://ix.io/2Cso
> 
>> media-ctl --print-dot
> http://ix.io/2Csp
> 
>> v4l2-compliance -m0
> http://ix.io/2Csk
> 
>> v4l2-compliance -v -d /dev/video0 -s10
> http://ix.io/2Csq
> 
>> v4l2-compliance -v -d /dev/video1 -s10
> http://ix.io/2Css
> 
> This patch depends on the following series:
> 
> * media: staging: rkisp1: uapi: add "WITH Linux-syscall-note"
>   https://patchwork.linuxtv.org/project/linux-media/patch/20201020132514.26651-1-dafna.hirschfeld@collabora.com/
> 
> * [0/2] media: staging: rkisp1: Fix formats for metadata pads
>   https://patchwork.linuxtv.org/project/linux-media/cover/20200325212704.29862-1-dafna.hirschfeld@collabora.com/
> 
> * [v2,1/2] media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED media bus format.
>   [v2,2/2] media: staging: rkisp1: isp: set metadata pads to MEDIA_BUS_FMT_METADATA_FIXED
>   https://patchwork.linuxtv.org/project/linux-media/patch/20201020154522.654-1-dafna.hirschfeld@collabora.com/
> 
> * [0/6] media: staging: rkisp1: improvements
>   https://patchwork.linuxtv.org/project/linux-media/cover/20201002184222.7094-1-dafna.hirschfeld@collabora.com/
> 
> * [0/4] media: staging: rkisp1: send cleanups and checkpatch fixes
>   https://patchwork.linuxtv.org/project/linux-media/cover/20201019205956.6980-1-dafna.hirschfeld@collabora.com/
> 
> * media: staging: rkisp1: capture: set default quantization on 'set_fmt'
>   https://patchwork.linuxtv.org/project/linux-media/patch/20201026162848.18310-1-dafna.hirschfeld@collabora.com/
> 
> * media: staging: rkisp1: remove TODO item to document quantization handling
>   https://patchwork.linuxtv.org/project/linux-media/patch/20200928152809.27490-1-dafna.hirschfeld@collabora.com/
> 
> * [v2] media: staging: rkisp1: cap: refactor enable/disable stream to allow multistreaming
>   https://patchwork.linuxtv.org/project/linux-media/patch/20201019160434.877568-1-helen.koike@collabora.com/
> 
> * [v6,0/9] move Rockchip ISP bindings out of staging / add ISP DT nodes for RK3399
>   https://patchwork.linuxtv.org/project/linux-media/patch/20201020193850.1460644-2-helen.koike@collabora.com/
> 
> You can also see all of them applied in this branch:
> 
>     https://gitlab.collabora.com/koike/linux/-/tree/rockchip/isp/destage
> 
> Thanks
> Helen
> 
> Helen Koike (1):
>   media: rockchip: rkisp1: destage Rockchip ISP1 driver
> 
> Shunqian Zheng (1):
>   media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format
> 
>  .../media/v4l/pixfmt-meta-rkisp1.rst          |  2 +-
>  drivers/media/platform/Kconfig                | 18 ++++++++++++++++++
>  drivers/media/platform/Makefile               |  1 +
>  .../platform/rockchip}/rkisp1/Makefile        |  0
>  .../rockchip}/rkisp1/rkisp1-capture.c         |  0
>  .../platform/rockchip}/rkisp1/rkisp1-common.c |  0
>  .../platform/rockchip}/rkisp1/rkisp1-common.h |  2 +-
>  .../platform/rockchip}/rkisp1/rkisp1-dev.c    |  0
>  .../platform/rockchip}/rkisp1/rkisp1-isp.c    |  0
>  .../platform/rockchip}/rkisp1/rkisp1-params.c |  0
>  .../platform/rockchip}/rkisp1/rkisp1-regs.h   |  0
>  .../rockchip}/rkisp1/rkisp1-resizer.c         |  0
>  .../platform/rockchip}/rkisp1/rkisp1-stats.c  |  0
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
>  drivers/staging/media/Kconfig                 |  2 --
>  drivers/staging/media/Makefile                |  1 -
>  drivers/staging/media/rkisp1/Kconfig          | 19 -------------------
>  drivers/staging/media/rkisp1/TODO             |  6 ------
>  .../uapi/linux}/rkisp1-config.h               |  4 ----
>  include/uapi/linux/videodev2.h                |  4 ++++
>  20 files changed, 27 insertions(+), 34 deletions(-)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/Makefile (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-capture.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.h (99%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-dev.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-isp.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-params.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-regs.h (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-resizer.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-stats.c (100%)
>  delete mode 100644 drivers/staging/media/rkisp1/Kconfig
>  delete mode 100644 drivers/staging/media/rkisp1/TODO
>  rename {drivers/staging/media/rkisp1/uapi => include/uapi/linux}/rkisp1-config.h (99%)
> 

