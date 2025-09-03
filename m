Return-Path: <linux-media+bounces-41654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5C4B41B37
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAE3F7A7AB8
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427E629CE1;
	Wed,  3 Sep 2025 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uhstnncC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F93255E26;
	Wed,  3 Sep 2025 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756894145; cv=none; b=gcXyhota1CkqIB6qmpJhUfzTbLbwz9smMdzwIYnRU1+8a8u9cHwYeK2gAS9WNY+rnnL1GVsA2oukZSq5+QYhtaVrOVFBeZ1xkYGjm28UzXXRzNKQGT0KPCBshiU8hyEdZTohsTTEFpnrXeARyMeBgaM7zm8x6u8etYxMzZ40Sak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756894145; c=relaxed/simple;
	bh=b15YZJxrXuReVzjRVFUyB2Ek/FCTl4qh90gn61apyQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUO610zu82zAKdXoZwqkuRZz43hiyNK9rFbNv9HFq/ll3afq4to0e3BH/fQMQV/qp4GvRvN5PaszEgPvmSWsJgy6HPQgxwaBb6PeDolR/GFhZa/NZKUa9gnSg1esS3KUnaRNxlu9ptGXp+vExPBLbGchwEWZPCrpIZzIcxx6QnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uhstnncC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E57AD8CB;
	Wed,  3 Sep 2025 12:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756894073;
	bh=b15YZJxrXuReVzjRVFUyB2Ek/FCTl4qh90gn61apyQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhstnncCJT36JeMeih2EaG8+x5GwGtTxWUqV9YQHadH0jcog3sVxliHy6A9GnBrMj
	 lS9qUZSfFMVbHtC+O+DXjEWciiQBgIls0+T1PRMhmERLQpqn/2yQZWXsrOUaExfeFB
	 afxe6YJJjaWIP3z0c5Ssg7YZl4z/p+9sQ6bz+wk0=
Date: Wed, 3 Sep 2025 12:08:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
	sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Subject: Re: [PATCH v3 5/7] media: platform: amd: isp4 video node and buffers
 handling added
Message-ID: <20250903100841.GC13448@pendragon.ideasonboard.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <20250828100811.95722-5-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828100811.95722-5-Bin.Du@amd.com>

Hi Bin,

Thank you for the patch.

On Thu, Aug 28, 2025 at 06:08:09PM +0800, Bin Du wrote:
> Isp video implements v4l2 video interface and supports NV12 and YUYV. It
> manages buffers, pipeline power and state. Cherry-picked Sultan's DMA
> buffer realated fix from branch v6.16-drm-tip-isp4-for-amd on
> https://github.com/kerneltoast/kernel_x86_laptop.git
> 
> Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> ---
>  MAINTAINERS                                   |    2 +
>  drivers/media/platform/amd/isp4/Makefile      |    1 +
>  drivers/media/platform/amd/isp4/isp4.c        |   10 +
>  drivers/media/platform/amd/isp4/isp4_subdev.c |   95 +-
>  drivers/media/platform/amd/isp4/isp4_subdev.h |    2 +
>  drivers/media/platform/amd/isp4/isp4_video.c  | 1213 +++++++++++++++++
>  drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
>  7 files changed, 1406 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h

[snip]

> diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
> new file mode 100644
> index 000000000000..642faff83287
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_video.c

[snip]

> +static int isp4vid_ioctl_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +
> +	strscpy(cap->driver, ISP4VID_ISP_DRV_NAME, sizeof(cap->driver));
> +	snprintf(cap->card, sizeof(cap->card), "%s", ISP4VID_ISP_DRV_NAME);
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s", ISP4VID_ISP_DRV_NAME);

The bus_info is set by v4l_quercap, I think you can drop it here (please
double-check the result).

> +
> +	cap->capabilities |= (V4L2_CAP_STREAMING |
> +			      V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_IO_MC);

You can now drop V4L2_CAP_IO_MC (and there's no need for parentheses).

> +
> +	dev_dbg(isp_vdev->dev, "%s|capabilities=0x%X",
> +		isp_vdev->vdev.name, cap->capabilities);
> +
> +	return 0;
> +}

[snip]

-- 
Regards,

Laurent Pinchart

