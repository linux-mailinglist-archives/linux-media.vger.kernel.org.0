Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247D456B79D
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 12:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238032AbiGHKrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 06:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238055AbiGHKrK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 06:47:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F322CC8B
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 03:47:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97C9256D;
        Fri,  8 Jul 2022 12:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657277226;
        bh=apQQFLqAhNgCdjSV/5OLlaOjQqcq3pRIC8Davaor2NQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H3ODUD2bzugEDAH0NAN8QhCN9G2iWOMV29MmZpZw/hu5ozsWB8BoTC+e05D9H/EBB
         PJWNTroCzxDzZb3EAIYY+/PyaY4jTaZSVMDcgm72OooGPfnSu8QG6Rl2+QM/75rHbi
         2IbBKBH+h/VM9f1oy1YVrVQgov4IMmiatVEWocM8=
Date:   Fri, 8 Jul 2022 13:46:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH 0/8] Add dynamic arrays and v4l2_ctrl_modify_dimensions
Message-ID: <YsgLEC/RRqFA/Krs@pendragon.ideasonboard.com>
References: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jun 28, 2022 at 02:05:15PM +0200, Hans Verkuil wrote:
> This series adds support for dynamic array controls and for a
> new v4l2_ctrl_modify_dimensions() function to modify the dimensions
> of an array control by the driver.
> 
> The dynamic array patches are unchanged and are already used in two
> patch series (stateless HEVC uAPI and the dw100 driver), but they are
> added here since the last 5 patches that add support for
> v4l2_ctrl_modify_dimensions() build on those.
> 
> The vivid driver is also extended with such controls to make it
> possible to test this.
> 
> Xavier, the v4l2_ctrl_modify_dimensions() are mostly identical to
> the patches I mailed you before and that you added to v6 of dw100.
> Just improved documentation and commit logs and a minor checkpatch
> fix. For a v7 of your driver, please use this series.

I've reviewed the whole series but 2/8 as I'm not familiar enough with
the control framework implementation for that one.

I think we also need a documentation update to indicate that drivers can
modify control dimensions, and that this will reset the control value.
It could be done in patch 6/8.

> Hans Verkuil (8):
>   videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
>   v4l2-ctrls: add support for dynamically allocated arrays.
>   vivid: add dynamic array test control
>   v4l2-ctrls: allocate space for arrays
>   v4l2-ctrls: alloc arrays in ctrl_ref
>   v4l2-ctrls: add v4l2_ctrl_modify_dimensions
>   v4l2-ctrls: add change flag for when dimensions change
>   vivid: add pixel_array test control
> 
>  .../media/v4l/vidioc-dqevent.rst              |   5 +
>  .../media/v4l/vidioc-queryctrl.rst            |   8 +
>  .../media/videodev2.h.rst.exceptions          |   2 +
>  drivers/media/test-drivers/vivid/vivid-core.h |   1 +
>  .../media/test-drivers/vivid/vivid-ctrls.c    |  29 +++
>  .../media/test-drivers/vivid/vivid-vid-cap.c  |   4 +
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      | 139 ++++++++++---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 188 +++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   3 +-
>  drivers/media/v4l2-core/v4l2-ctrls-request.c  |  13 +-
>  include/media/v4l2-ctrls.h                    |  90 ++++++++-
>  include/uapi/linux/videodev2.h                |   2 +
>  12 files changed, 413 insertions(+), 71 deletions(-)

-- 
Regards,

Laurent Pinchart
