Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03A543C594
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 10:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404577AbfFKIGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 04:06:07 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:57607 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404476AbfFKIGG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 04:06:06 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id abn6hfTa641bFabn9hCpht; Tue, 11 Jun 2019 10:06:04 +0200
Subject: Re: [RFC PATCH 2/5] media: venus: vdec: flag OUTPUT formats with
 V4L2_FMT_FLAG_DYN_RESOLUTION
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
 <20190609143820.4662-3-mjourdan@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8eb7d04c-b2c8-fc69-b1e6-4f143e3a8c26@xs4all.nl>
Date:   Tue, 11 Jun 2019 10:06:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190609143820.4662-3-mjourdan@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK16ome4j+MSr0qOOLLvh1EGVILVvkRmHC80Gj729XAXOAOEsvVhFG1pbM2UDaPGaMskXm6nrlIQx6o7C+fRDo84R8bF38Bwk7RlromUIkk+T6pgVZTF
 Y/XvFdbDsbzxEgUe80Q7+PNDL73Ym55xtoyHceQ58KEZv642um9B1fpyBhpNqaR//0tjuw89A/FKHoFFdZiidpFpjQg4qZVdWKgiCFx0pZwdKtC3amV67F7R
 xhDcMD6dzOoAW/kN2CkyHainvgyBoeC71cFoT2V+ea62FbLxQICgtz7PpQ/9B6+6Q49vwpGbQkqR5zteTpf3etKDqZWt62STiPqxNSaFSCAIHzx0PbQHOdD9
 +S84sivMPpgIdXpgt1952J1ZNDLQbS7IvmL5rUfEQuh3Mu0tOBU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/9/19 4:38 PM, Maxime Jourdan wrote:
> Tag all the coded formats where the venus vdec supports dynamic
> resolution switching.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  drivers/media/platform/qcom/venus/core.h |  1 +
>  drivers/media/platform/qcom/venus/vdec.c | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7a3feb5cee00..74eb42668627 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -55,6 +55,7 @@ struct venus_format {
>  	u32 pixfmt;
>  	unsigned int num_planes;
>  	u32 type;
> +	u32 flags;
>  };
>  
>  #define MAX_PLANES		4
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 2a47b9b8c5bc..8aabc23966b8 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -46,42 +46,52 @@ static const struct venus_format vdec_formats[] = {
>  		.pixfmt = V4L2_PIX_FMT_MPEG4,
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt = V4L2_PIX_FMT_MPEG2,
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt = V4L2_PIX_FMT_H263,
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt = V4L2_PIX_FMT_VC1_ANNEX_G,
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt = V4L2_PIX_FMT_VC1_ANNEX_L,
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt = V4L2_PIX_FMT_H264,
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt = V4L2_PIX_FMT_VP8,
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt = V4L2_PIX_FMT_VP9,
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt = V4L2_PIX_FMT_XVID,
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt = V4L2_PIX_FMT_HEVC,
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  };
>  
> @@ -360,6 +370,7 @@ static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>  		return -EINVAL;
>  
>  	f->pixelformat = fmt->pixfmt;
> +	f->flags = fmt->flags;

Ah, there is a bug in v4l_fill_fmtdesc() in v4l2-ioctl.c: at the end
fmt->flags overwritten, so the V4L2_FMT_FLAG_DYN_RESOLUTION is cleared
again. That line in v4l_fill_fmtdesc() should be |=.

Regards,

	Hans

>  
>  	return 0;
>  }
> 

