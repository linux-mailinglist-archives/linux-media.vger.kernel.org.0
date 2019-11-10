Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49703F6848
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 11:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbfKJKEu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 05:04:50 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:46429 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726604AbfKJKEu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 05:04:50 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Tk58iN84yQBsYTk5Ci1QjD; Sun, 10 Nov 2019 11:04:45 +0100
Subject: Re: [PATCH 1/2] media: solo6x10: Remove superfluous
 snd_dma_continuous_data()
To:     Takashi Iwai <tiwai@suse.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20191108163649.32590-1-tiwai@suse.de>
 <20191108163649.32590-2-tiwai@suse.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <84412d65-1042-4849-76bf-784fead59f4a@xs4all.nl>
Date:   Sun, 10 Nov 2019 11:04:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108163649.32590-2-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFcTTRS02cdRpKNp+6tFfy7EAX92iryEkEZdeDW2cgLpRW0Tct89ddA4wGRe5F6iMbunIBaCzkeoURGb8Je7WkGDN/ZB6ZYda1oJt9jS43QPvLvI1pk7
 lPXgTU4wd51a+IZB0iOAEAA4yqyVLrYXDK1CMW/Y7I7gYGTy7PQdmGrZagv1ibsqf68eRnSfF7kXY2qxyGanvbndpnPiD+Hm86jW3S2/7V3b0oSS+CHT2gZ4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/8/19 5:36 PM, Takashi Iwai wrote:
> The recent change (commit 08422d2c559d: "ALSA: memalloc: Allow NULL
> device for SNDRV_DMA_TYPE_CONTINOUS type") made the PCM preallocation
> helper accepting NULL as the device pointer for the default usage.
> Drop the snd_dma_continuous_data() usage that became superfluous from
> the callers.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  drivers/media/pci/solo6x10/solo6x10-g723.c | 2 +-
>  drivers/media/usb/usbtv/usbtv-audio.c      | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
> index 30c8f2ec9c3c..eaa57d835ea8 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-g723.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
> @@ -353,7 +353,7 @@ static int solo_snd_pcm_init(struct solo_dev *solo_dev)
>  
>  	snd_pcm_lib_preallocate_pages_for_all(pcm,
>  					SNDRV_DMA_TYPE_CONTINUOUS,
> -					snd_dma_continuous_data(GFP_KERNEL),
> +					NULL,
>  					G723_PERIOD_BYTES * PERIODS,
>  					G723_PERIOD_BYTES * PERIODS);
>  
> diff --git a/drivers/media/usb/usbtv/usbtv-audio.c b/drivers/media/usb/usbtv/usbtv-audio.c
> index 6f108996142d..e746c8ddfc49 100644
> --- a/drivers/media/usb/usbtv/usbtv-audio.c
> +++ b/drivers/media/usb/usbtv/usbtv-audio.c
> @@ -378,8 +378,7 @@ int usbtv_audio_init(struct usbtv *usbtv)
>  
>  	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_usbtv_pcm_ops);
>  	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
> -		snd_dma_continuous_data(GFP_KERNEL), USBTV_AUDIO_BUFFER,
> -		USBTV_AUDIO_BUFFER);
> +		NULL, USBTV_AUDIO_BUFFER, USBTV_AUDIO_BUFFER);
>  
>  	rv = snd_card_register(card);
>  	if (rv)
> 

