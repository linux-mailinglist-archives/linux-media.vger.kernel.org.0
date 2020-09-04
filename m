Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C645C25D7B7
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 13:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730056AbgIDLpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 07:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729897AbgIDLpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 07:45:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24321C061244;
        Fri,  4 Sep 2020 04:45:41 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 448B8540;
        Fri,  4 Sep 2020 13:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599219939;
        bh=44GjaBfTEzghMrQ7oGA8qaW8/hWoyB3FU8SLP8RkQ1c=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=qnNO069JgUnagd0tuo+PkM87G+JkKeh5+AXXcWUt5Aq0UKpYDckwREZTR80LcedvC
         L6Sds+V71Bq4aiXeWOXWi+7eIM5zQS4l/U3jmXSIVHeDoxCK/SHcs96ErrHrIurdlW
         4zZnrJI9cH3wR3XNMuUGKCoI9P6+aA02hwv9dUAI=
Subject: Re: [PATCH 14/29] media: Avoid comma separated statements
To:     Joe Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1598331148.git.joe@perches.com>
 <5f2ac0ba683d4e5d3449395721788527b8487a57.1598331149.git.joe@perches.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <f4aa26fa-78ad-9dc0-ba4e-23a3d9691630@ideasonboard.com>
Date:   Fri, 4 Sep 2020 12:45:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5f2ac0ba683d4e5d3449395721788527b8487a57.1598331149.git.joe@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/08/2020 05:56, Joe Perches wrote:
> Use semicolons and braces.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/media/i2c/msp3400-kthreads.c      | 12 ++++++++----
>  drivers/media/pci/bt8xx/bttv-cards.c      |  6 ++++--
>  drivers/media/pci/saa7134/saa7134-video.c |  7 +++++--
>  3 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/msp3400-kthreads.c b/drivers/media/i2c/msp3400-kthreads.c
> index d3b0d1c18efd..ac8752c63266 100644
> --- a/drivers/media/i2c/msp3400-kthreads.c
> +++ b/drivers/media/i2c/msp3400-kthreads.c
> @@ -549,8 +549,10 @@ int msp3400c_thread(void *data)
>  			val = msp_read_dsp(client, 0x1b);
>  			if (val > 32767)
>  				val -= 65536;
> -			if (val1 < val)
> -				val1 = val, max1 = i;
> +			if (val1 < val) {
> +				val1 = val;
> +				max1 = i;
> +			}
>  			dev_dbg_lvl(&client->dev, 1, msp_debug,
>  				"carrier1 val: %5d / %s\n", val, cd[i].name);
>  		}
> @@ -586,8 +588,10 @@ int msp3400c_thread(void *data)
>  			val = msp_read_dsp(client, 0x1b);
>  			if (val > 32767)
>  				val -= 65536;
> -			if (val2 < val)
> -				val2 = val, max2 = i;
> +			if (val2 < val) {
> +				val2 = val;
> +				max2 = i;
> +			}
>  			dev_dbg_lvl(&client->dev, 1, msp_debug,
>  				"carrier2 val: %5d / %s\n", val, cd[i].name);
>  		}
> diff --git a/drivers/media/pci/bt8xx/bttv-cards.c b/drivers/media/pci/bt8xx/bttv-cards.c
> index 16148802dabb..ca20b806e82d 100644
> --- a/drivers/media/pci/bt8xx/bttv-cards.c
> +++ b/drivers/media/pci/bt8xx/bttv-cards.c
> @@ -3934,8 +3934,10 @@ static void osprey_eeprom(struct bttv *btv, const u8 ee[256])
>  			if (checksum != ee[21])
>  				return;
>  			cardid = BTTV_BOARD_OSPREY1x0_848;
> -			for (i = 12; i < 21; i++)
> -				serial *= 10, serial += ee[i] - '0';
> +			for (i = 12; i < 21; i++) {
> +				serial *= 10;
> +				serial += ee[i] - '0';
> +			}
>  		}
>  	} else {
>  		unsigned short type;
> diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
> index a8ac94fadc14..f673cda57f30 100644
> --- a/drivers/media/pci/saa7134/saa7134-video.c
> +++ b/drivers/media/pci/saa7134/saa7134-video.c
> @@ -868,8 +868,11 @@ static int buffer_activate(struct saa7134_dev *dev,
>  		lines_uv = dev->height >> dev->fmt->vshift;
>  		base2    = base + bpl * dev->height;
>  		base3    = base2 + bpl_uv * lines_uv;
> -		if (dev->fmt->uvswap)
> -			tmp = base2, base2 = base3, base3 = tmp;
> +		if (dev->fmt->uvswap) {
> +			tmp = base2;
> +			base2 = base3;
> +			base3 = tmp;

Don't we have any swap macro helpers for this?

Anyway, that would be out of scope of this patch series.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +		}
>  		video_dbg("uv: bpl=%ld lines=%ld base2/3=%ld/%ld\n",
>  			bpl_uv,lines_uv,base2,base3);
>  		if (V4L2_FIELD_HAS_BOTH(dev->field)) {
> 

