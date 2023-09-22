Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99AD47AB27C
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 14:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbjIVNAC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 09:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjIVNAA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 09:00:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC2ACE
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 05:59:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B5FC433C8;
        Fri, 22 Sep 2023 12:59:53 +0000 (UTC)
Message-ID: <a36dabd9-fdc8-4c86-a6b4-ea6b16b51d2e@xs4all.nl>
Date:   Fri, 22 Sep 2023 14:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: string truncate warnings: increase name fields
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>
References: <20230922125837.3290073-1-hverkuil-cisco@xs4all.nl>
Content-Language: en-US, nl
In-Reply-To: <20230922125837.3290073-1-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/09/2023 14:58, Hans Verkuil wrote:
> This is a second batch of patches: the first 3 fix some more low-hanging
> fruit that I missed in the first round.
> 
> The next two patches increase two internal name fields: one
> in struct video_device and one in struct v4l2_subdev.
> 
> Generally speaking: 
>  
> sizeof(v4l2_device.name) < sizeof(v4l2_subdev.name) < sizeof(video_device.name)
> 
> With this patch series these become:
> 
> 36 < 52 < 64.
> 
> The exact sizes are a bit trial and error, I'm afraid.
> 
> Typically v4l2_subdev.name uses v4l2_device.name with some extra text,
> and the same happens for video_device.name.
> 
> The last patch removes V4L2_SUBDEV_NAME_SIZE and replaces all uses of
> it by sizeof(), which is much safer than relying on a define.
> 
> With these changes I am left with 11 warnings, 10 of which are bus_info
> related (uAPI). Especially for the platform devices this can likely
> be dropped altogether since today it is filled in by the core for
> platform devices.
> 
> Something to look at in the next round.

I forgot to mention, this series sits on top of the previous set
of patches.

The git repo is here:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=trunc1

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
> Hans Verkuil (6):
>   media: cec.h: increase input_phys buffer
>   media: renesas-ceu: keep input name simple
>   media: zoran: increase name size
>   media: v4l2-dev.h: increase struct video_device name size
>   media: v4l2-subdev.h: increase struct v4l2_subdev name size
>   media: use sizeof() instead of V4L2_SUBDEV_NAME_SIZE
> 
>  drivers/media/i2c/msp3400-driver.c                  | 2 +-
>  drivers/media/pci/zoran/zoran.h                     | 2 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c        | 4 ++--
>  drivers/media/platform/cadence/cdns-csi2tx.c        | 4 ++--
>  drivers/media/platform/renesas/rcar-isp.c           | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-csi2.c | 2 +-
>  drivers/media/platform/renesas/renesas-ceu.c        | 6 +-----
>  drivers/media/platform/ti/omap3isp/ispstat.c        | 2 +-
>  drivers/staging/media/omap4iss/iss_csi2.c           | 2 +-
>  drivers/staging/media/tegra-video/csi.c             | 4 ++--
>  drivers/staging/media/tegra-video/vip.c             | 2 +-
>  include/media/cec.h                                 | 2 +-
>  include/media/v4l2-dev.h                            | 2 +-
>  include/media/v4l2-subdev.h                         | 4 +---
>  14 files changed, 17 insertions(+), 23 deletions(-)
> 

