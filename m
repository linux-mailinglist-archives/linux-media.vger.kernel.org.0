Return-Path: <linux-media+bounces-20394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1B59B29B9
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 09:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE76E283BED
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 08:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82211DDA3B;
	Mon, 28 Oct 2024 07:57:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6F41917FA;
	Mon, 28 Oct 2024 07:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102257; cv=none; b=tV5A94/6STwpeAicyh1WbLfebJpwh44Td9+APGm4U17Z34BgD8mrmfTzIIImCEkoND2Kld/r+doiGQSoRC3B/r9gjne4BOVsoP6EA6KLs8cMiZdEL9NKPan5udcf0rfxVtyIE2KUz3Z8w1i3kYeRRiB2uHUG3hjfm8vU7F8IaWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102257; c=relaxed/simple;
	bh=/q5iLojDhXm4Z/auFDre90JZh0Xi2xIkUxpp228HJWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDWCqyV9t3sYOWAfkur4nWP6RvpJaWH+Kl9TW424fxNygmblaNT/vvkKr385+gfb7BRY7Xw5Kkk0AJxCkV4e3Qy1lbLcOp5T2Je8iOodx6cY6+J0UCLBeHE7Rzvqe7txNWQ5z8kSG/oVb3P4pqwqyUJr/NbixIcmBOVGrIlCfTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7706C4CEC3;
	Mon, 28 Oct 2024 07:57:33 +0000 (UTC)
Message-ID: <6b8004e2-57df-4760-a59d-77a712e9ca4d@xs4all.nl>
Date: Mon, 28 Oct 2024 08:57:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 0/4] Add video encoder ROI ctrls
To: Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org
Cc: yunkec@google.com, nicolas@ndufresne.ca, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241022084040.3390878-1-ming.qian@nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241022084040.3390878-1-ming.qian@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2024 10:40, Ming Qian wrote:
> Hi,
> 
> This patch set implements region of interest (ROI) ctrls for video
> encoder.
> 
> One video encoder IP may support the following two ROI configurations or
> one of them:
>     1. configure ROI as a rectangular region, and set a delta QP parameter.
>     2. configure ROI as a rectangular region, and set a priority parameter.
>     3. configure ROI as a QP map as an array. Each value represents the delta QP
> of a block in raster scan order. The block size is determined by
> the specific IP.
>     4. configure ROI as a QP map as an array. Each value represents the absolute QP
> of a block in raster scan order. The block size is determined by
> the specific IP.
> 
> To achieve this, I made the following change:
>     1. I reuse the type V4L2_CTRL_TYPE_RECT that is defined in the UVC ROI patchset
>     2. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_MODE to choose ROI configuration
>     3. Define some ctrl to configure ROI
>     4. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE to query block size
> 
> I referred the patchset "Implement UVC v1.5 ROI" (https://lwn.net/Articles/953532/)
> and pick some patches from it.

Please note that since this introduces the new TYPE_RECT and WHICH_MIN/MAX flags,
you also need to update v4l-utils.

This was done last year:

https://lore.kernel.org/linux-media/20230817072537.2837504-1-yunkec@google.com/

Can you pick this up and post a v2 for these v4l-utils changes? Note that I had some
comments at the time, so please fix those before posting v2.

Regards,

	Hans

> 
> changelog:
> 
> v3
> - Drop the type V4L2_CTRL_TYPE_REGION
> - Split the compound control into 2 ctrls
> - Define 4 ROI mode
> 
> v2
> - export symbol of v4l2_ctrl_type_op_minimum
> - export symbol of v4l2_ctrl_type_op_maximum
> 
> Hans Verkuil (1):
>   media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
> 
> Ming Qian (1):
>   media: v4l2-ctrls: Add video encoder ROI ctrls
> 
> Yunke Cao (2):
>   media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
>   media: vivid: Add an rectangle control
> 
>  .../media/v4l/ext-ctrls-codec.rst             |  95 ++++++++++
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  26 ++-
>  .../media/v4l/vidioc-queryctrl.rst            |  14 ++
>  .../media/videodev2.h.rst.exceptions          |   4 +
>  drivers/media/i2c/imx214.c                    |   4 +-
>  .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
>  .../media/test-drivers/vivid/vivid-ctrls.c    |  34 ++++
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 ++++--
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 169 +++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  46 +++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>  include/media/v4l2-ctrls.h                    |  62 ++++++-
>  include/uapi/linux/v4l2-controls.h            |  16 ++
>  include/uapi/linux/videodev2.h                |   5 +
>  14 files changed, 493 insertions(+), 49 deletions(-)
> 


