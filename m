Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B069F637BD0
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 15:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbiKXOuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 09:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiKXOtv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 09:49:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26BF3FFAB4
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 06:49:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D0675B8283D
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 14:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7D2C433D6;
        Thu, 24 Nov 2022 14:49:42 +0000 (UTC)
Message-ID: <76449cb4-3bc1-34b6-6454-65cdda2a4fd0@xs4all.nl>
Date:   Thu, 24 Nov 2022 15:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 0/6] Add new bayer ir formats
Content-Language: en-US
To:     Marco Felsch <m.felsch@pengutronix.de>, p.zabel@pengutronix.de,
        mchehab@kernel.org, slongerbeam@gmail.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20210427120701.21809-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On 27/04/2021 14:06, Marco Felsch wrote:
> Hi all,
> 
> this adds the inital support for a new sensor format called RGB-IR
> found on sensors from OnSemi [1]. This is a new custom bayer format with
> interleaved ir pixels. For more information see the documentation
> commit.

After a lot of discussion this series went nowhere.

If you want to restart this, then please rebase and post a v2.

I'm marking this as 'Obsoleted' in patchwork.

(Doing a bit of patchwork cleanup of old series today)

Regards,

	Hans

> 
> [1] https://www.onsemi.com/products/sensors/image-sensors-processors/image-sensors/ar0237sr
> 
> Marco Felsch (6):
>   media: uapi: Add MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG media bus formats
>   media: v4l: Add definition for bayered IR formats
>   media: v4l2-ioctl.c: add V4L2_PIX_FMT_SGRGB_IGIG_GBGR_IGIG to
>     v4l_fill_fmtdesc
>   media: video-mux: add new SGRGB_IGIG_GBGR_IGIG format support
>   gpu: ipu-v3: add custom SGRGB_IGIG_GBGR_IGIG format support
>   media: imx: csi: add custom SGRGB_IGIG_GBGR_IGIG format support
> 
>  .../media/v4l/subdev-formats.rst              | 42 +++++++++++++++++++
>  drivers/gpu/ipu-v3/ipu-cpmem.c                |  2 +
>  drivers/gpu/ipu-v3/ipu-csi.c                  |  2 +
>  drivers/media/platform/video-mux.c            |  2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
>  drivers/staging/media/imx/imx-media-csi.c     |  2 +
>  drivers/staging/media/imx/imx-media-utils.c   | 12 ++++++
>  include/uapi/linux/media-bus-format.h         |  4 +-
>  include/uapi/linux/videodev2.h                |  4 ++
>  9 files changed, 71 insertions(+), 1 deletion(-)
> 

