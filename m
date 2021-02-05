Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24E8310B35
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 13:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhBEMkN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 07:40:13 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:36099 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232211AbhBEMhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 07:37:51 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 80LrlPGHgW4yN80Lvlf72h; Fri, 05 Feb 2021 13:36:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612528609; bh=X7AUlzMRr1DovluaYxfaTiDxq+O8eKwCa1Oxs82UaaA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TN/YBhXv7WU6z+lq9Vcphsa8oqJlNX/ApDMeLmwupESMadNKsoXPqSqVKgw45lVqV
         iCblEqNoMRpJhWw9+FzukgGyqye09wyRmgqYKsmo7KBxLUIoefeZj0gshOi/30YU7N
         tqBSWE3qaKTXYbBDQKvOoMpDNfE5o8sGqvgaqvd32Uibiwhodnxe829s4U2CCcHe6q
         V+w2sdTRJzdjAg9/k7jBp/0HHU6rLFoCjSpqCkDtCKZtXsgqnYCcO8w5hm41pscT9v
         qv/qz9gPcjKoYHgiO4Vz2xL1JE9cT5F3Pb5O0I+jeXXH39MR6Iv2Vlx2VcYv5lYjL9
         wer/nAOJTYsZw==
Subject: Re: [PATCH] media: pwc: Fix the URB buffer allocation
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        Andrew Lunn <andrew@lunn.ch>,
        Robert Foss <robert.foss@linaro.org>
References: <20210121202855.17400-1-tiwai@suse.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7afd0612-de36-60b1-6650-6f8de24a7145@xs4all.nl>
Date:   Fri, 5 Feb 2021 13:36:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121202855.17400-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNni1PzcY5QQKQ1vzLfTGSB3xjdcckM81Ko2YP7j1bDGRUy6af1amaFbaOuhPsNlUN6i59hzoIvp18hOZCYvj9OmnINLw2saXBQ7ot4EqbISqYsEayty
 GHT21BGpqg9CuehY0ZFRwpX5nPExjAVhVjgXzjh7LaNIni0xRv59HyWNMUc/YGqSY4N4Whm8GW3bwMWSWsNY4Q0nZERfJdPMHgO43HyGoIwtzEl34KxzQQ4h
 G6gDq7Zkx0tkCCLuyk9cCHx9frfqlxt3CHC+8wF/U6egYTWvB2r+TEn7HEE6h5qMyNpUBR7U8ye1CSrb0x/ZL9RhfOyXuXQzVTLyXTV91C/TrsTj03tBwUMR
 WoeqBjUDxByLblOiAVXfGzgYkY8CAQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Takashi,

Thank you for this patch, but it clashes with another patch trying to do the same thing
that has already been merged in our tree:

https://patchwork.linuxtv.org/project/linux-media/patch/20210104170007.20625-1-matwey@sai.msu.ru/

I do prefer your patch over the one already merged since it is a bit simpler, but
shouldn't the calls to dma_sync_single_for_cpu() and dma_sync_single_for_device()
in pwc-if.c also use urb->dev->bus->controller?

Also, Matwey's patch uses urb->dev->bus->sysdev instead of urb->dev->bus->controller.
How does 'sysdev' relate to 'controller'? I think 'controller' is the right device to
use, but either seems to work when I test it with my pwc webcam.

Andrew, your patch:

https://patchwork.linuxtv.org/project/linux-media/patch/20210204232851.1020416-1-andrew@lunn.ch/

is effectively identical to Takashi's, so I'll mark your patch as Obsoleted.
Just so you know :-)

Regards,

	Hans

On 21/01/2021 21:28, Takashi Iwai wrote:
> The URB buffer allocation of pwc driver involves with the
> dma_map_single(), and it needs to pass the right device.  Currently it
> passes usb_device.dev, but it's no real device that manages the DMA.
> Since the passed device has no DMA mask set up, now the pwc driver
> hits the WARN_ON_ONCE() check in dma_map_page_attrs() (that was
> introduced in 5.10), resulting in an error at URB allocations.
> Eventually this ended up with the black output.
> 
> This patch fixes the bug by passing the proper device, the bus
> controller, to make the URB allocation and map working again.
> 
> BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1181133
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/media/usb/pwc/pwc-if.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
> index 61869636ec61..d771160bb168 100644
> --- a/drivers/media/usb/pwc/pwc-if.c
> +++ b/drivers/media/usb/pwc/pwc-if.c
> @@ -461,7 +461,7 @@ static int pwc_isoc_init(struct pwc_device *pdev)
>  		urb->pipe = usb_rcvisocpipe(udev, pdev->vendpoint);
>  		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
>  		urb->transfer_buffer_length = ISO_BUFFER_SIZE;
> -		urb->transfer_buffer = pwc_alloc_urb_buffer(&udev->dev,
> +		urb->transfer_buffer = pwc_alloc_urb_buffer(udev->bus->controller,
>  							    urb->transfer_buffer_length,
>  							    &urb->transfer_dma);
>  		if (urb->transfer_buffer == NULL) {
> @@ -524,7 +524,7 @@ static void pwc_iso_free(struct pwc_device *pdev)
>  		if (urb) {
>  			PWC_DEBUG_MEMORY("Freeing URB\n");
>  			if (urb->transfer_buffer)
> -				pwc_free_urb_buffer(&urb->dev->dev,
> +				pwc_free_urb_buffer(urb->dev->bus->controller,
>  						    urb->transfer_buffer_length,
>  						    urb->transfer_buffer,
>  						    urb->transfer_dma);
> 

