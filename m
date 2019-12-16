Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88BDD121EA7
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 23:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbfLPW5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 17:57:50 -0500
Received: from iodev.co.uk ([193.29.56.124]:39926 "EHLO iodev.co.uk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726700AbfLPW5t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 17:57:49 -0500
X-Greylist: delayed 459 seconds by postgrey-1.27 at vger.kernel.org; Mon, 16 Dec 2019 17:57:49 EST
Date:   Tue, 17 Dec 2019 00:42:04 +0100
From:   Ismael Luceno <ismael@iodev.co.uk>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH for-5.6 01/14] media: solo6x10: Use managed buffer
 allocation
Message-ID: <20191216234204.GA32004@pirotess.home>
References: <20191210135849.15607-1-tiwai@suse.de>
 <20191210135849.15607-2-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210135849.15607-2-tiwai@suse.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/Dec/2019 14:58, Takashi Iwai wrote:
> Clean up the driver with the new managed buffer allocation API.
> The hw_params and hw_free callbacks became superfluous and dropped.
> 
> Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
> Cc: Anton Sviridenko <anton@corp.bluecherry.net>
> Cc: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
> Cc: Ismael Luceno <ismael@iodev.co.uk>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/media/pci/solo6x10/solo6x10-g723.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
> index eaa57d835ea8..ca349d447610 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-g723.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
> @@ -97,17 +97,6 @@ void solo_g723_isr(struct solo_dev *solo_dev)
>  	}
>  }
>  
> -static int snd_solo_hw_params(struct snd_pcm_substream *ss,
> -			      struct snd_pcm_hw_params *hw_params)
> -{
> -	return snd_pcm_lib_malloc_pages(ss, params_buffer_bytes(hw_params));
> -}
> -
> -static int snd_solo_hw_free(struct snd_pcm_substream *ss)
> -{
> -	return snd_pcm_lib_free_pages(ss);
> -}
> -
>  static const struct snd_pcm_hardware snd_solo_pcm_hw = {
>  	.info			= (SNDRV_PCM_INFO_MMAP |
>  				   SNDRV_PCM_INFO_INTERLEAVED |
> @@ -271,8 +260,6 @@ static const struct snd_pcm_ops snd_solo_pcm_ops = {
>  	.open = snd_solo_pcm_open,
>  	.close = snd_solo_pcm_close,
>  	.ioctl = snd_pcm_lib_ioctl,
> -	.hw_params = snd_solo_hw_params,
> -	.hw_free = snd_solo_hw_free,
>  	.prepare = snd_solo_pcm_prepare,
>  	.trigger = snd_solo_pcm_trigger,
>  	.pointer = snd_solo_pcm_pointer,
> @@ -351,11 +338,11 @@ static int solo_snd_pcm_init(struct solo_dev *solo_dev)
>  	     ss; ss = ss->next, i++)
>  		sprintf(ss->name, "Camera #%d Audio", i);
>  
> -	snd_pcm_lib_preallocate_pages_for_all(pcm,
> -					SNDRV_DMA_TYPE_CONTINUOUS,
> -					NULL,
> -					G723_PERIOD_BYTES * PERIODS,
> -					G723_PERIOD_BYTES * PERIODS);
> +	snd_pcm_set_managed_buffer_all(pcm,
> +				       SNDRV_DMA_TYPE_CONTINUOUS,
> +				       NULL,
> +				       G723_PERIOD_BYTES * PERIODS,
> +				       G723_PERIOD_BYTES * PERIODS);
>  
>  	solo_dev->snd_pcm = pcm;
>  
> -- 
> 2.16.4
> 

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
