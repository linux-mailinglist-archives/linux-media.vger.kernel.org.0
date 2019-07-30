Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3687A2F3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 10:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbfG3IPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 04:15:47 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:51953 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727789AbfG3IPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 04:15:46 -0400
Received: from [IPv6:2001:983:e9a7:1:3159:f139:4aff:7185] ([IPv6:2001:983:e9a7:1:3159:f139:4aff:7185])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sNIGhAzQaqTdhsNIIhlAOr; Tue, 30 Jul 2019 10:15:41 +0200
Subject: Re: [PATCH] media input infrastructure:tw686x: Fix of
 possibleinconsistent memory deallocation and/or race condition by
 implementation of custom video_device_release function in tw686x driver
To:     Mark Balantzyan <mbalant3@gmail.com>, ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.1907291256080.16959@mbalantz-desktop>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <40d14e23-636e-ed8a-6608-99427f5b8169@xs4all.nl>
Date:   Tue, 30 Jul 2019 10:15:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907291256080.16959@mbalantz-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPqNhh2qVlJuZ2GmaH9XhGYKqumkyFarMB2ZiQRDm683SEAP533sV503AxCaD7YHeXDagHkODd+NotO33NqwPYWJ64aPeWhqhc9YpdcvoRIrwRSaE7e6
 zSGlL3E/tPmj3drXRzjZgCv6s+WNZ8M1KwhzZkrYXxATKUG4s2Sy7qbEAYUy5IklMMBVmKpoSCcp7a+3EYhD4sDodMDEubReyeJvD+31fC8shw+gdW5VyPri
 4b9H1xgYMzoxLqF2E8lTM9HT0WeWVacV/FFhO7q/3hfxnYuIE+5Wkqfk6U8qK3KrEDhhbZtVZaKaCCyGVI2rZSlhbs2fWvk3YLfgloAaBzyFhMnlaruKHVdT
 PnaBI2B5vxMzxQzf2KZcyvdkFbaZr5j628+/i0bANEe1iNVDiTw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mark,

Please, please read this first before posting patches:

https://kernelnewbies.org/FirstKernelPatch

And don't use insanely long subject lines in your email.

This patch is nonsense. As said before, you need to override the release() callback
of struct video_device with a tw686x-specific function that frees the dma memory and
calls video_device_release() at the end to free the struct video_device itself.

This release() callback is called by the V4L2 framework when the last user of the
device closes its filehandle, so that's a good point to free all the memory. Doing
it earlier (as the current code does) runs the risk that someone might still access
that memory, and you don't want that.

Regards,

	Hans

On 7/29/19 10:09 PM, Mark Balantzyan wrote:
> 
> Possible inconsistent memory deallocation and/or race conditions were detected specifically with respect to remaining open handles to the video device handled by the tw686x driver. This patch
> addresses this by implementing a revised independent instance of the video_device_release function to free the remaining resources and memory where the last open handle(s) is/were closed.
> 
> Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
> 
> ---
> 
>  drivers/media/pci/tw686x/tw686x-video.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
> index 3a06c000..29e10c85 100644
> --- a/drivers/media/pci/tw686x/tw686x-video.c
> +++ b/drivers/media/pci/tw686x/tw686x-video.c
> @@ -1151,18 +1151,25 @@ void tw686x_video_irq(struct tw686x_dev *dev, unsigned long requests,
>      }
>  }
> 
> +void video_device_release(tw686x_dev *dev) {
> +    for (int pb = 0; pb < 2; pb++) {
> +        dev->dma_ops->free(dev->video_channels,pb);
> +    }
> +    kfree(dev);
> +}
> +
>  void tw686x_video_free(struct tw686x_dev *dev)
>  {
> -    unsigned int ch, pb;
> +    unsigned int ch;
> 
>      for (ch = 0; ch < max_channels(dev); ch++) {
>          struct tw686x_video_channel *vc = &dev->video_channels[ch];
> 
>          video_unregister_device(vc->device);
> 
> -        if (dev->dma_ops->free)
> -            for (pb = 0; pb < 2; pb++)
> -                dev->dma_ops->free(vc, pb);
> +        if (dev->dma_ops->free) {
> +            video_device_release(dev);
> +        }
>      }
>  }
> 

