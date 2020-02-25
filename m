Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC38F16C040
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 13:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730162AbgBYMH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 07:07:57 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53853 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726019AbgBYMH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 07:07:56 -0500
Received: from [IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2]
 ([IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6Z09jyZr8jmHT6Z0DjWpSw; Tue, 25 Feb 2020 13:07:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582632474; bh=Fa07Iai1OLOLmQy78F43ui0l1I5N4AHYY389xHDaTSM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dvXOPrJ9Ey0AHGn780q9L6mQ81ik5arScNdE3Se8f5hGPqEtt1lQ0wsgxd4w9tQEW
         bXsw2s6UprHLv1kFDEM6ZuawzS1e2MP7dd3QnxqVIFnBwZ68APOZhNMB5zZJPkdJcJ
         F3r4h7ZndI8wdPxSHlj9DphUj7205uJ0fPSv0gp3wTO9E9QTAWqxI4GdIOzr3mdkDJ
         JUpTPMVtSl/wlRIWRGf4RxnkfdgNsw0hp0gsuzi5G+EPxUW6lK1u0UdNJ9kLiiy7sq
         e15Am4u42wWHYobw87p9weK7rWnIMsUwp71Sh3Cr5ZQbalG3MNSBO67qMOXcotgVER
         GN5gKX5CIc4NA==
Subject: Re: [PATCH v2] media: rcar_drif: Use dma_request_chan() instead
 dma_request_slave_channel()
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>, mchehab@kernel.org,
        rashanmu@gmail.com, geert@linux-m68k.org
Cc:     vkoul@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200120124754.26826-1-peter.ujfalusi@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d1c3aec0-7b8f-5f78-e055-8dd87bee801b@xs4all.nl>
Date:   Tue, 25 Feb 2020 13:07:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200120124754.26826-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBKVkvtGsRTpWLDaGXfFoP6yXSIJ9CbES675rm/bNy/DkEwvj1oiTe7rAN6OTM6k2/rAcMnTmypGOHQyo1ewd5L12wwyG8V4F0nouxEf6gvOmRuTuYCJ
 DDU7dJpXF/VFB9CWTDTsGwtGMg+OJfQA7cyCda/ztDzZOpkRSK8z2mL+vgQjDokMzQzE9axN/lgfOLqv2yorKhvpR/TBhDh4zaMn5GFyTa++/RiUwoEoMoIa
 UYClDA4wIL5H+djKNajLqp+BPkh9eRQiBj3IfkIfuQr1qEs3lHW9D2U5yCHDhwH4Olaa4DQlFoFUJ8/H9l7gcNZVCXj72yi3GhZ4BiTo4mLX4Nj3u4rY1uBG
 j880l0pXXm9wIanSMXnMfe6sisCE9kgzC90r/AUCohTwIcMrJ1tkRjT6u4PPK/kmFH+40lySNWGftt3oWbwv1qOSVUuyBIbl5KTz/8vL529kg5Rsyt521H/Q
 tSBeJRBFCXmvZCF2LsIpmN/hgJ+C3oxImhLj7BZJaWTskSaCoqyUhj/THJA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Peter,

On 1/20/20 1:47 PM, Peter Ujfalusi wrote:
> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> eating up the error code.
> 
> By using dma_request_chan() directly the driver can support deferred
> probing against DMA.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Unfortunately the v1 version of this patch got merged, so can you make a
new patch against the current media_tree master to bring it up to date
with this v3?

My apologies for this.

Regards,

	Hans

> ---
> Hi,
> 
> Changes since v2:
> - Use %pe to print error name using the ch->dmach pointer
> - Set ch->dmach to NULL in case of error
> 
> Changes since v1:
> - Do not print error in case of EPROBE_DEFER
> - Added Reviewed-by from Geert
> 
> Regards,
> Peter
> 
>  drivers/media/platform/rcar_drif.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
> index 0f267a237b42..3d2451ac347d 100644
> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -275,10 +275,14 @@ static int rcar_drif_alloc_dmachannels(struct rcar_drif_sdr *sdr)
>  	for_each_rcar_drif_channel(i, &sdr->cur_ch_mask) {
>  		struct rcar_drif *ch = sdr->ch[i];
>  
> -		ch->dmach = dma_request_slave_channel(&ch->pdev->dev, "rx");
> -		if (!ch->dmach) {
> -			rdrif_err(sdr, "ch%u: dma channel req failed\n", i);
> -			ret = -ENODEV;
> +		ch->dmach = dma_request_chan(&ch->pdev->dev, "rx");
> +		if (IS_ERR(ch->dmach)) {
> +			ret = PTR_ERR(ch->dmach);
> +			if (ret != -EPROBE_DEFER)
> +				rdrif_err(sdr,
> +					  "ch%u: dma channel req failed: %pe\n",
> +					  i, ch->dmach);
> +			ch->dmach = NULL;
>  			goto dmach_error;
>  		}
>  
> 

