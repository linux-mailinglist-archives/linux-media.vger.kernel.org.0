Return-Path: <linux-media+bounces-2410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CB3812E9E
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 12:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4234E2822AC
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 11:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB40C3FE53;
	Thu, 14 Dec 2023 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BYMB9cyH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A397E113;
	Thu, 14 Dec 2023 03:33:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB1342E4;
	Thu, 14 Dec 2023 12:33:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702553587;
	bh=APuMlR8+w8JQsDkmSqesPyhATVM+NrTRZXiIaIZN8As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYMB9cyHxXIdNgoB80Ww0hSgVKSNRPEWwwBxRWGZDAjHmD+tXf6608qNxfgNVlo6z
	 7LMeKAD8BO5r11/GGF7/GgCrnNJPPwkkrUU7Sj7ZpZkE95ZYSalIQCYF9awMPhCx9U
	 WhEEgI1sa0kPM7T1HkBXmvsajmeAIU3Uzm40fhus=
Date: Thu, 14 Dec 2023 13:34:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Marvin Lin <milkfafa@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ming Qian <ming.qian@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 3/9] media: videodev2.h, v4l2-ioctl: Add StarFive ISP
 meta buffer format
Message-ID: <20231214113400.GJ12450@pendragon.ideasonboard.com>
References: <20231214065027.28564-1-changhuang.liang@starfivetech.com>
 <20231214065027.28564-4-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231214065027.28564-4-changhuang.liang@starfivetech.com>

Hello Changhuang,

Thank you for the patch.

On Wed, Dec 13, 2023 at 10:50:21PM -0800, Changhuang Liang wrote:
> Add the StarFive ISP specific metadata format
> V4L2_META_FMT_STF_ISP_STAT_3A for 3A.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 33076af4dfdb..dfc031e575e9 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1445,6 +1445,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>  	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
>  	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
> +	case V4L2_META_FMT_STF_ISP_STAT_3A:	descr = "StarFive ISP 3A Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 68e7ac178cc2..0c3d19a1c8cf 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -839,6 +839,9 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>  
> +/* Vendor specific - used for StarFive JH7110 ISP camera sub-system */
> +#define V4L2_META_FMT_STF_ISP_STAT_3A	v4l2_fourcc('S', 'T', 'F', 'S') /* StarFive ISP 3A Statistics */
> +

The new format needs to be documented, in
Documentation/userspace-api/media/v4l/. See for instance the
metafmt-rkisp1.rst file in that directory.

Note that mapping the format to C structures as done by the rkisp1
driver is not mandatory, that's just one option in case the format can
be easily described that way. The important point is to precisely
document the format so that it can get used by userspace without access
to hardware documentation (as far as I understand, the ISP documentation
is not public).

>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
>  

-- 
Regards,

Laurent Pinchart

