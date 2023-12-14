Return-Path: <linux-media+bounces-2412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 171FE812FD4
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 13:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8B881F226CE
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 12:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B458441770;
	Thu, 14 Dec 2023 12:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XVjx4qHg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0159811A;
	Thu, 14 Dec 2023 04:12:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC3F04A9;
	Thu, 14 Dec 2023 13:11:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702555900;
	bh=J1W791y5z9tb+RMNhkJ3fZXGR3XgxrCTNy61KkwXuPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVjx4qHgReg8Rrb3/ikXD7shwptR2xncpRS1Uz2UZ+Q/NccDWuxKgctDo6ngMEqRz
	 g2FmJHpQ17/JNSEwUcoj6oWU5jJw3nM0xsMx7U8/kgFARBAn5FTlINRVjG77mfL3s2
	 NjL3Z2CVj6Zp4p0VyyKyH2x8rkulkkbRy5TR3foE=
Date: Thu, 14 Dec 2023 14:12:33 +0200
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
Subject: Re: [PATCH v1 4/9] staging: media: starfive: camss: Replace format
 index with pad
Message-ID: <20231214121233.GB21146@pendragon.ideasonboard.com>
References: <20231214065027.28564-1-changhuang.liang@starfivetech.com>
 <20231214065027.28564-5-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231214065027.28564-5-changhuang.liang@starfivetech.com>

Hi Changhuang,

Thank you for the patch.

On Wed, Dec 13, 2023 at 10:50:22PM -0800, Changhuang Liang wrote:
> Replace format index with pad.

The code change looks good I think, but the commit message needs to
explain *why* you're changing this.

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/staging/media/starfive/camss/stf-isp.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
> index ac83f23842df..c3ae02cf6dd8 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.c
> +++ b/drivers/staging/media/starfive/camss/stf-isp.c
> @@ -11,9 +11,6 @@
>  
>  #include "stf-camss.h"
>  
> -#define SINK_FORMATS_INDEX	0
> -#define SOURCE_FORMATS_INDEX	1
> -
>  static int isp_set_selection(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_selection *sel);
> @@ -95,11 +92,7 @@ static void isp_try_format(struct stf_isp_dev *isp_dev,
>  		return;
>  	}
>  
> -	if (pad == STF_ISP_PAD_SINK)
> -		formats = &isp_dev->formats[SINK_FORMATS_INDEX];
> -	else if (pad == STF_ISP_PAD_SRC)
> -		formats = &isp_dev->formats[SOURCE_FORMATS_INDEX];
> -
> +	formats = &isp_dev->formats[pad];
>  	fmt->width = clamp_t(u32, fmt->width, STFCAMSS_FRAME_MIN_WIDTH,
>  			     STFCAMSS_FRAME_MAX_WIDTH);
>  	fmt->height = clamp_t(u32, fmt->height, STFCAMSS_FRAME_MIN_HEIGHT,
> @@ -124,7 +117,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
>  		if (code->index >= ARRAY_SIZE(isp_formats_sink))
>  			return -EINVAL;
>  
> -		formats = &isp_dev->formats[SINK_FORMATS_INDEX];
> +		formats = &isp_dev->formats[code->pad];
>  		code->code = formats->fmts[code->index].code;
>  	} else {
>  		struct v4l2_mbus_framefmt *sink_fmt;

-- 
Regards,

Laurent Pinchart

