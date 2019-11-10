Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5870F6847
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 11:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbfKJKEu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 05:04:50 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:54693 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726609AbfKJKEu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 05:04:50 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Tk5HiN87oQBsYTk5Ki1QlF; Sun, 10 Nov 2019 11:04:45 +0100
Subject: Re: [PATCH 2/2] media: tw686x: audio: Avoid non-standard macro usage
To:     Takashi Iwai <tiwai@suse.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20191108163649.32590-1-tiwai@suse.de>
 <20191108163649.32590-3-tiwai@suse.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9469e53a-f360-64fb-117e-1e0dfc7394ec@xs4all.nl>
Date:   Sun, 10 Nov 2019 11:04:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108163649.32590-3-tiwai@suse.de>
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
> Pass the device pointer from the PCI pointer directly, instead of a
> non-standard macro.  The macro didn't give any better readability.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  drivers/media/pci/tw686x/tw686x-audio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/tw686x/tw686x-audio.c b/drivers/media/pci/tw686x/tw686x-audio.c
> index 40373bd23381..7786e51d19ae 100644
> --- a/drivers/media/pci/tw686x/tw686x-audio.c
> +++ b/drivers/media/pci/tw686x/tw686x-audio.c
> @@ -300,7 +300,7 @@ static int tw686x_snd_pcm_init(struct tw686x_dev *dev)
>  
>  	snd_pcm_lib_preallocate_pages_for_all(pcm,
>  				SNDRV_DMA_TYPE_DEV,
> -				snd_dma_pci_data(dev->pci_dev),
> +				&dev->pci_dev->dev,
>  				TW686X_AUDIO_PAGE_MAX * AUDIO_DMA_SIZE_MAX,
>  				TW686X_AUDIO_PAGE_MAX * AUDIO_DMA_SIZE_MAX);
>  	return 0;
> 

