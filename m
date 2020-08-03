Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4D223B141
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 01:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgHCXuZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 19:50:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51996 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbgHCXuZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 19:50:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 0C3DF296F2F
Subject: Re: [PATCH v3 07/10] media: staging: rkisp1: rsz: enumerate the
 formats on the src pad according to the capture
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-8-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <71b4742a-8f47-2709-010f-b2037cfab5fd@collabora.com>
Date:   Mon, 3 Aug 2020 20:50:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723132014.4597-8-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 7/23/20 10:20 AM, Dafna Hirschfeld wrote:
> Currently the resizer outputs the same media bus format
> as the input. This is wrong since the resizer is also used
> to downscale YUV formats. This patch changes the enumeration
> of the supported formats. The supported formats on the sink pad
> should be taken from the isp entity and the supported formats on
> the source pad should be taken from the capture entity.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 41 ++++++++++++-------
>  1 file changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index 066d22096a7d..4e87c6f3f732 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -433,24 +433,35 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
>  {
>  	struct rkisp1_resizer *rsz =
>  		container_of(sd, struct rkisp1_resizer, sd);
> -	struct v4l2_subdev_pad_config dummy_cfg;
> -	u32 pad = code->pad;
>  	int ret;
>  
> -	if (rsz->id == RKISP1_SELFPATH) {
> -		if (code->index > 0)
> -			return -EINVAL;
> -		code->code = MEDIA_BUS_FMT_YUYV8_2X8;
> -		return 0;
> +	/* supported mbus codes on the sink pad are the same as isp src pad */
> +	if (code->pad == RKISP1_RSZ_PAD_SINK) {
> +		struct v4l2_subdev_pad_config dummy_cfg;
> +		u32 pad = code->pad;
> +
> +		/*
> +		 * the sp capture doesn't support bayer formats so the sp resizer
> +		 * supports only yuv422
> +		 */
> +		if (rsz->id == RKISP1_SELFPATH) {
> +			if (code->index > 0)
> +				return -EINVAL;
> +			code->code = MEDIA_BUS_FMT_YUYV8_2X8;
> +			return 0;
> +		}
> +		code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
> +		ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
> +				       &dummy_cfg, code);
> +
> +		/* restore pad */
> +		code->pad = pad;
> +	} else {
> +		/* supported mbus codes on the src are the same as in the capture */
> +		struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
> +
> +		ret = rkisp1_cap_enum_mbus_codes(cap, code);
>  	}
> -
> -	/* supported mbus codes are the same in isp video src pad */
> -	code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
> -	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
> -			       &dummy_cfg, code);
> -
> -	/* restore pad */
> -	code->pad = pad;
>  	return ret;
>  }
>  
> 

I think you can reduce indentation by doing:

	/* supported mbus codes on the src are the same as in the capture */
	if (code->pad == RKISP1_RSZ_PAD_SRC)
		return kisp1_cap_enum_mbus_codes(
			&rsz->rkisp1->capture_devs[rsz->id], code);

	// ... rest of the code for sink pad without an else statement
