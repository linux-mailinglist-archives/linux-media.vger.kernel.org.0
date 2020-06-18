Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4802A1FF923
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 18:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729548AbgFRQXV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 12:23:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37846 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgFRQXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 12:23:20 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A5A2F9;
        Thu, 18 Jun 2020 18:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592497398;
        bh=/cd/RPu/vuGMr1gt5mZp5+oG7+iJ6WX/U8t/ogBZIO8=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=EuLaR5r33jTj9RDJPNe9yDCQxR8Z5pJsFzYONOdzg7Wr/c1tiPV9F4fHejN774aGX
         gNl/Y11ebZVsi+tFOylADYqCG2snXAscCHtjurgqc1x6v8AVJh1EBXqd6qvVc1cFmn
         jk7y6luLxzWYc4H/qZEispBLVZIa9Cevv/AfM3MQ=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v5 6/9] media: adv748x: prepare/enable mclk when the audio
 is used
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
 <d9b7a7290e3d95b484a7a760484f827c3ed7651e.1585852001.git.alexander.riesen@cetitec.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <646b0f32-2f83-281a-ccc0-eb88f82eb7a3@ideasonboard.com>
Date:   Thu, 18 Jun 2020 17:23:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d9b7a7290e3d95b484a7a760484f827c3ed7651e.1585852001.git.alexander.riesen@cetitec.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On 02/04/2020 19:34, Alex Riesen wrote:
> As there is nothing else (the consumers are supposed to do that) which
> enables the clock, do it in the driver.
> 
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> --
> 
> v3: added
> ---
>  drivers/media/i2c/adv748x/adv748x-dai.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
> index c9191f8f1ca8..185f78023e91 100644
> --- a/drivers/media/i2c/adv748x/adv748x-dai.c
> +++ b/drivers/media/i2c/adv748x/adv748x-dai.c
> @@ -117,11 +117,22 @@ static int adv748x_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  
>  static int adv748x_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
>  {
> +	int ret;
>  	struct adv748x_state *state = state_of(dai);
>  
>  	if (sub->stream != SNDRV_PCM_STREAM_CAPTURE)
>  		return -EINVAL;
this looks quite bunched up so :

Newline...

> -	return set_audio_pads_state(state, 1);
> +	ret = set_audio_pads_state(state, 1);
> +	if (ret)
> +		goto fail;

With no action required to cleanup here, I would just
		return ret;
and remove the fail: label.


Newline...

> +	ret = clk_prepare_enable(mclk_of(state));
> +	if (ret)
> +		goto fail_pwdn;

newline...

> +	return 0;

newline...

Other than that:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +fail_pwdn:
> +	set_audio_pads_state(state, 0);
> +fail:
> +	return ret;
>  }
>  
>  static int adv748x_dai_hw_params(struct snd_pcm_substream *sub,
> @@ -174,6 +185,7 @@ static void adv748x_dai_shutdown(struct snd_pcm_substream *sub, struct snd_soc_d
>  {
>  	struct adv748x_state *state = state_of(dai);
>  
> +	clk_disable_unprepare(mclk_of(state));
>  	set_audio_pads_state(state, 0);
>  }
>  
> 
