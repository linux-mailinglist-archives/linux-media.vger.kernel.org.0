Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6B7442915
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 09:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhKBIKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 04:10:33 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:36279 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229505AbhKBIKc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 04:10:32 -0400
Received: from [192.168.0.3] (ip5f5ae91d.dynamic.kabel-deutschland.de [95.90.233.29])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1236861EA191D;
        Tue,  2 Nov 2021 09:07:55 +0100 (CET)
Message-ID: <15c44f9a-20af-8059-1694-601821e17413@molgen.mpg.de>
Date:   Tue, 2 Nov 2021 09:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] media: aspeed: fix mode-detect always timeout at 2nd run
Content-Language: en-US
To:     Jammy Huang <jammy_huang@aspeedtech.com>
References: <20211102071337.5983-1-jammy_huang@aspeedtech.com>
Cc:     eajames@linux.ibm.com, mchehab@kernel.org, joel@jms.id.au,
        andrew@aj.id.au, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20211102071337.5983-1-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Jammy,


On 02.11.21 08:13, Jammy Huang wrote:
> aspeed_video_get_resolution() will try to do res-detect again if the
> timing got in last try is invalid. But it will always timeout because

The verb *time out* is spelled with a space.

> VE_SEQ_CTRL_TRIG_MODE_DET only cleared after 1st mode-detect.

is only cleared?

> 
> To fix the problem, just clear VE_SEQ_CTRL_TRIG_MODE_DET before set in

before setting it?

> aspeed_video_enable_mode_detect().
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>   drivers/media/platform/aspeed-video.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index cd2b71c81e31..b470f4b68aa0 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -611,6 +611,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
>   	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
>   			    VE_INTERRUPT_MODE_DETECT);
>   
> +	/* Disable mode detect in order to re-trigger */
> +	aspeed_video_update(video, VE_SEQ_CTRL,
> +			    VE_SEQ_CTRL_TRIG_MODE_DET, 0);
> +
>   	/* Trigger mode detect */
>   	aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
>   }
> @@ -930,10 +934,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   			return;
>   		}
>   
> -		/* Disable mode detect in order to re-trigger */
> -		aspeed_video_update(video, VE_SEQ_CTRL,
> -				    VE_SEQ_CTRL_TRIG_MODE_DET, 0);
> -
>   		aspeed_video_check_and_set_polarity(video);
>   
>   		aspeed_video_enable_mode_detect(video);
> 

Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul
