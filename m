Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 468127753FF
	for <lists+linux-media@lfdr.de>; Wed,  9 Aug 2023 09:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbjHIHTy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 03:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbjHIHTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 03:19:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB5D1724
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 00:19:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D2FAF62FDA
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 07:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFC1C433C7;
        Wed,  9 Aug 2023 07:19:49 +0000 (UTC)
Message-ID: <2127bd95-e918-a3b1-b09e-793eaa1bd86d@xs4all.nl>
Date:   Wed, 9 Aug 2023 09:19:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v11 00/11] media: Implement UVC v1.5 ROI
Content-Language: en-US, nl
To:     Yunke Cao <yunkec@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>
References: <20230426082923.132909-1-yunkec@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230426082923.132909-1-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/04/2023 10:29, Yunke Cao wrote:
> From: Yunke Cao <yunkec@chromium.org>
> 
> Hi,
> 
> This patch set implements UVC v1.5 region of interest using V4L2
> control API. I rebased v10 and resended.
> 
> ROI control is consisted two uvc specific controls.
> 1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> 2. An auto control with type bitmask.
> 
> V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
> 
> Tested on two different usb cameras using v4l2-compliance, v4l2-ctl
> and calling ioctls.
> 
> 1/11 adds V4L2_CTRL_TYPE_RECT.
> 2/11, 3/11, 4/11 refactors uvc_ctrl.c.
> 5/11 adds support for compound controls.
> 6/11 is a cherry-pick for Hans' implementation of
> V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
> 7/11 documents min/max for the rectangle control.
> 8/11 supports MIN/MAX in UVC.
> 9/11 implements ROI in UVC.
> 10/11 initializes ROI control to default value.
> 11/11 documents the changes.

I just looked at the core control code, and except for some minor issues
it looks good.

One thing needs to be added here, though: I want to have a patch adding
a rectangle control + min/max support to the vivid driver, similar to
the existing VIVID_CID_AREA control. This makes it possible to do regression
tests without requiring hardware that supports this.

v4l2-ctl/compliance also need to be adapted for min/max.

Regards,

	Hans

> 
> Changelog since v9:
> - Reordered patches, move MIN/MAX related patches (patch 6, 7, 8) before
>   implementing ROI control in UVC. Clamping set current ROI value based on
>   MIN/MAX values.
> - Fixed some minor issues. Changelog in patches.
> Changelog since v9:
> - Rebased onto Linus' master branch.
> - Fixed some minor issues. Changelog in patches.
> Changelog since v9:
> - Rebased onto Linus' master branch.
> - Fixed some minor issues. Changelog in patches.
> Changelog since v8:
> - Rebased onto media-stage master (v6.1-rc2).
> - Addressed Hans' comments in 8/11 v4l2-ctrls: add support for
>   V4L2_CTRL_WHICH_MIN/MAX_VAL. Including adding a new documentation patch
>   9/11.
> Changelog since v7:
> - Rebased onto media-stage master.
> - Move the factoring logic from 5/10 to 2/10 and 3/10 (new patch in v8).
> - In patch 4/10, split uvc_control_mapping.size to v4l2 and data size.
> - Move initializing ROI control from 5/10 into its own patch 7/10.
> - Address some comments. Changelogs are in patches.
> 
> Hans Verkuil (1):
>   v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
> 
> Yunke Cao (10):
>   media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
>   media: uvcvideo: add uvc_ctrl_get_boundary for getting default value
>   media: uvcvideo: introduce __uvc_ctrl_get_std()
>   media: uvcvideo: Split uvc_control_mapping.size to v4l2 and data size
>   media: uvcvideo: Add support for compound controls
>   media: v4l2: document the usage of min/max for V4L2_CTRL_TYPE_RECT
>   media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
>   media: uvcvideo: implement UVC v1.5 ROI
>   media: uvcvideo: initilaize ROI control to default value
>   media: uvcvideo: document UVC v1.5 ROI
> 
>  .../userspace-api/media/drivers/uvcvideo.rst  |  64 +-
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  15 +-
>  .../media/v4l/vidioc-queryctrl.rst            |  11 +
>  .../media/videodev2.h.rst.exceptions          |   3 +
>  drivers/media/i2c/imx214.c                    |   5 +-
>  .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
>  drivers/media/usb/uvc/uvc_ctrl.c              | 702 ++++++++++++++----
>  drivers/media/usb/uvc/uvc_v4l2.c              |  18 +-
>  drivers/media/usb/uvc/uvcvideo.h              |  24 +-
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  57 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 171 ++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>  include/media/v4l2-ctrls.h                    |  36 +-
>  include/uapi/linux/usb/video.h                |   1 +
>  include/uapi/linux/uvcvideo.h                 |  13 +
>  include/uapi/linux/v4l2-controls.h            |   9 +
>  include/uapi/linux/videodev2.h                |   4 +
>  17 files changed, 942 insertions(+), 204 deletions(-)
> 

