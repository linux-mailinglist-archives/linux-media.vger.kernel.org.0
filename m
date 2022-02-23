Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732854C150F
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 15:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241028AbiBWOEv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 09:04:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241353AbiBWOEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 09:04:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2CAB150A
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 06:04:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 70EAEB81FB3
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 14:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8122C340EB;
        Wed, 23 Feb 2022 14:04:17 +0000 (UTC)
Message-ID: <2b04a547-fb7b-5f0d-a8d3-827e02a519da@xs4all.nl>
Date:   Wed, 23 Feb 2022 15:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [GIT PULL FOR v5.18] amphion video decoder/encoder driver
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Ming Qian <ming.qian@nxp.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <10e323b5-4df7-5baf-cb09-628a4cc6864d@xs4all.nl>
In-Reply-To: <10e323b5-4df7-5baf-cb09-628a4cc6864d@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming Qian,

The Jenkins build failed since the Makefile and Kconfig are added too soon, before
all the sources are in place. Since this will break git bisect, can you post a
v18 where the addition of the Makefile and Kconfig is done in a separate patch at
the end?

I should have seen that in my review...

Regards,

	Hans

On 2/23/22 13:22, Hans Verkuil wrote:
> Ming Qian,
> 
> Thank you very much for your hard work on this!
> 
> Very nice to see this go in.
> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit 2b891d3980f6c255459d0e1c29ce2152ec7cf678:
> 
>   media: xilinx: csi2rxss: Use mipi-csi2.h (2022-02-17 10:32:26 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18r
> 
> for you to fetch changes up to ce9df78ab89f9fc79875af9fac11b4ca329c7e35:
> 
>   MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry (2022-02-23 12:54:25 +0100)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Ming Qian (11):
>       dt-bindings: media: amphion: add amphion video codec bindings
>       media: add nv12m_8l128 and nv12m_10be_8l128 video format.
>       media: amphion: add amphion vpu device driver
>       media: amphion: add vpu core driver
>       media: amphion: implement vpu core communication based on mailbox
>       media: amphion: add vpu v4l2 m2m support
>       media: amphion: add v4l2 m2m vpu encoder stateful driver
>       media: amphion: add v4l2 m2m vpu decoder stateful driver
>       media: amphion: implement windsor encoder rpc interface
>       media: amphion: implement malone decoder rpc interface
>       MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry
> 
>  Documentation/devicetree/bindings/media/amphion,vpu.yaml    |  180 +++++
>  Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst |   28 +-
>  MAINTAINERS                                                 |    9 +
>  drivers/media/platform/Kconfig                              |   19 +
>  drivers/media/platform/Makefile                             |    2 +
>  drivers/media/platform/amphion/Makefile                     |   20 +
>  drivers/media/platform/amphion/vdec.c                       | 1691 ++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/platform/amphion/venc.c                       | 1358 +++++++++++++++++++++++++++++++++++++
>  drivers/media/platform/amphion/vpu.h                        |  362 ++++++++++
>  drivers/media/platform/amphion/vpu_cmds.c                   |  433 ++++++++++++
>  drivers/media/platform/amphion/vpu_cmds.h                   |   25 +
>  drivers/media/platform/amphion/vpu_codec.h                  |   68 ++
>  drivers/media/platform/amphion/vpu_color.c                  |  183 +++++
>  drivers/media/platform/amphion/vpu_core.c                   |  871 ++++++++++++++++++++++++
>  drivers/media/platform/amphion/vpu_core.h                   |   15 +
>  drivers/media/platform/amphion/vpu_dbg.c                    |  494 ++++++++++++++
>  drivers/media/platform/amphion/vpu_defs.h                   |  187 +++++
>  drivers/media/platform/amphion/vpu_drv.c                    |  260 +++++++
>  drivers/media/platform/amphion/vpu_helpers.c                |  413 +++++++++++
>  drivers/media/platform/amphion/vpu_helpers.h                |   74 ++
>  drivers/media/platform/amphion/vpu_imx8q.c                  |  271 ++++++++
>  drivers/media/platform/amphion/vpu_imx8q.h                  |  115 ++++
>  drivers/media/platform/amphion/vpu_malone.c                 | 1625 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/platform/amphion/vpu_malone.h                 |   44 ++
>  drivers/media/platform/amphion/vpu_mbox.c                   |  118 ++++
>  drivers/media/platform/amphion/vpu_mbox.h                   |   16 +
>  drivers/media/platform/amphion/vpu_msgs.c                   |  385 +++++++++++
>  drivers/media/platform/amphion/vpu_msgs.h                   |   14 +
>  drivers/media/platform/amphion/vpu_rpc.c                    |  257 +++++++
>  drivers/media/platform/amphion/vpu_rpc.h                    |  456 +++++++++++++
>  drivers/media/platform/amphion/vpu_v4l2.c                   |  712 +++++++++++++++++++
>  drivers/media/platform/amphion/vpu_v4l2.h                   |   55 ++
>  drivers/media/platform/amphion/vpu_windsor.c                | 1169 ++++++++++++++++++++++++++++++++
>  drivers/media/platform/amphion/vpu_windsor.h                |   37 +
>  drivers/media/v4l2-core/v4l2-ioctl.c                        |    2 +
>  include/uapi/linux/videodev2.h                              |    2 +
>  36 files changed, 11967 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/amphion,vpu.yaml
>  create mode 100644 drivers/media/platform/amphion/Makefile
>  create mode 100644 drivers/media/platform/amphion/vdec.c
>  create mode 100644 drivers/media/platform/amphion/venc.c
>  create mode 100644 drivers/media/platform/amphion/vpu.h
>  create mode 100644 drivers/media/platform/amphion/vpu_cmds.c
>  create mode 100644 drivers/media/platform/amphion/vpu_cmds.h
>  create mode 100644 drivers/media/platform/amphion/vpu_codec.h
>  create mode 100644 drivers/media/platform/amphion/vpu_color.c
>  create mode 100644 drivers/media/platform/amphion/vpu_core.c
>  create mode 100644 drivers/media/platform/amphion/vpu_core.h
>  create mode 100644 drivers/media/platform/amphion/vpu_dbg.c
>  create mode 100644 drivers/media/platform/amphion/vpu_defs.h
>  create mode 100644 drivers/media/platform/amphion/vpu_drv.c
>  create mode 100644 drivers/media/platform/amphion/vpu_helpers.c
>  create mode 100644 drivers/media/platform/amphion/vpu_helpers.h
>  create mode 100644 drivers/media/platform/amphion/vpu_imx8q.c
>  create mode 100644 drivers/media/platform/amphion/vpu_imx8q.h
>  create mode 100644 drivers/media/platform/amphion/vpu_malone.c
>  create mode 100644 drivers/media/platform/amphion/vpu_malone.h
>  create mode 100644 drivers/media/platform/amphion/vpu_mbox.c
>  create mode 100644 drivers/media/platform/amphion/vpu_mbox.h
>  create mode 100644 drivers/media/platform/amphion/vpu_msgs.c
>  create mode 100644 drivers/media/platform/amphion/vpu_msgs.h
>  create mode 100644 drivers/media/platform/amphion/vpu_rpc.c
>  create mode 100644 drivers/media/platform/amphion/vpu_rpc.h
>  create mode 100644 drivers/media/platform/amphion/vpu_v4l2.c
>  create mode 100644 drivers/media/platform/amphion/vpu_v4l2.h
>  create mode 100644 drivers/media/platform/amphion/vpu_windsor.c
>  create mode 100644 drivers/media/platform/amphion/vpu_windsor.h

