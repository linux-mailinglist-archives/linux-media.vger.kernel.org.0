Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77A3A30F8
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 09:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbfH3H2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 03:28:21 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:54303 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726731AbfH3H2U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 03:28:20 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 3bKLiM2X6zaKO3bKOiQPhh; Fri, 30 Aug 2019 09:28:18 +0200
Subject: Re: [PATCH 5/8] media: cedrus: Detect first slice of a frame
To:     Jernej Skrabec <jernej.skrabec@siol.net>, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
 <20190822194500.2071-6-jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ee46d461-1be8-e803-9792-9fb9481acf16@xs4all.nl>
Date:   Fri, 30 Aug 2019 09:28:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822194500.2071-6-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAklJxN99U94VgVdrg/wZWzFtkJLsUOAcDBPdvvu7N4xnAGlcRiHNmIHd9ozKfJqnwU1xSC8qX3gGJWdJaYewvrK/js+bIxfWV/1ACz1dt1R+iYcmlxK
 foiXEWAMvXY+tghwfqmr/zsL8IqXb4dStPKOXA9jONcO2zWdfZZ9okaNghI7k6WaYzhtbthDMZYGbdq+IC0ZrxfOvZKdxH9fBEZr1Sg5h4SL+/Ci65S2vFhJ
 Tcq9qaQuXd1VsmGnVXN3dmv9a+7pxklKRl6Wckh4vSciUxUBY8AwDDVZRc32kyi4EHpuBXY5LCYD6QoSF09hNlueaMfADSknFO/vYKnbfdmrxuG0Ja6F1k5V
 bAWbtX8yMSt+k4HApzJI+bZA9wjWe6D3hOKufJffSe6OCY+vzua8DYxB267V39eAqDSc3NvGhkvuVExsCwyBI4IGgHrYVSJb3c2kCbn8W/JJG4/aLfj8M7/U
 dD6VcrzZmerQdF7fXGFWmumdbOmEnMMYkkzJVdQGnvaIhDN1HWxQZ3pfOPFZ9W0Ze4+9UkBoZWdbsgQ6vVtHasF9EsqXSey4dZ6vs9gKAXaFWX99Cl6XtFfQ
 a0cObES470eOMn8R6GyxokYst2TSMt8eCT0zkFoVlfoV1SzRj057QUhENYrjWT/IcO0ZfDQfaYV8F4F0L7ME+snr6bpviuUv6feHCsfZPdxyp4XRYwWcwk/b
 vdOI2SH8+nyNXgEreuWmqIiQjoXA5hkU
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/22/19 9:44 PM, Jernej Skrabec wrote:
> When codec supports multiple slices in one frame, VPU has to know when
> first slice of each frame is being processed, presumably to correctly
> clear/set data in auxiliary buffers.
> 
> Add first_slice field to cedrus_run structure and set it according to
> timestamps of capture and output buffers. If timestamps are different,
> it's first slice and viceversa.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h     | 1 +
>  drivers/staging/media/sunxi/cedrus/cedrus_dec.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index 2f017a651848..32cb38e541c6 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -70,6 +70,7 @@ struct cedrus_mpeg2_run {
>  struct cedrus_run {
>  	struct vb2_v4l2_buffer	*src;
>  	struct vb2_v4l2_buffer	*dst;
> +	bool first_slice;
>  
>  	union {
>  		struct cedrus_h264_run	h264;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index 56ca4c9ad01c..d7b54accfe83 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -31,6 +31,8 @@ void cedrus_device_run(void *priv)
>  
>  	run.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  	run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	run.first_slice =
> +		run.src->vb2_buf.timestamp != run.dst->vb2_buf.timestamp;

This is almost correct. To handle the corner case where no timestamp
was ever copied to run.dst->vb2_buf you need this check:

	run.first_slice = !run.dst->vb2_buf.copied_timestamp ||
		run.src->vb2_buf.timestamp != run.dst->vb2_buf.timestamp;

Regards,

	Hans

>  
>  	/* Apply request(s) controls if needed. */
>  	src_req = run.src->vb2_buf.req_obj.req;
> 

