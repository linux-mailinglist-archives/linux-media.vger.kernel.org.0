Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C2931D9E8
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 14:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbhBQNCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 08:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbhBQNCL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 08:02:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FF0C061574;
        Wed, 17 Feb 2021 05:01:30 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5B608C4;
        Wed, 17 Feb 2021 14:01:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613566889;
        bh=jTrK5mTGlhq1kUdxGmed2yTPALsvJWCZwyi5GisaGwQ=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZDDarJPFUlZzIY971JSlYWkifdNOylqqtlodPWt4JyfU81YAT1PGY+kqdkiNYsl/8
         olPO0DQCPTIs/5qHdpFSqbPVoG+LC5rP+xIwrZjkvTuL28Xg5XbeSksbJvvwRmdju3
         eL59D2fnOTfOo4WZbRqceJIIfspLJ5CO3i3QYamo=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 03/16] media: i2c: rdacm20: Replace goto with a loop
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-4-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c95022bc-3841-4d0a-653c-6d6974e20355@ideasonboard.com>
Date:   Wed, 17 Feb 2021 13:01:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-4-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/02/2021 17:41, Jacopo Mondi wrote:
> During the camera module initialization the image sensor PID is read to
> verify it can correctly be identified. The current implementation is
> rather confused and uses a loop implemented with a label and a goto.
> 
> Replace it with a more compact for() loop.
> 
> No functional changes intended.

I think there is a functional change in here, but I almost like it.

Before, if the read was successful, it would check to see if the
OV10635_PID == OV10635_VERSION, and if not it would print that the read
was successful but a mismatch.

Now - it will retry again instead, and if at the end of the retries it
still fails then it's a failure.

This means we perhaps don't get told if the device id is not correct in
the same way, but it also means that if the VERSION was not correct
because of a read error (which I believe i've seen occur), it will retry.

Because there is a functional change you might want to update the
commit, but I still think this is a good change overall.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 4d9bac87cba8..6504ed0bd3bc 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -59,6 +59,8 @@
>   */
>  #define OV10635_PIXEL_RATE		(44000000)
>  
> +#define OV10635_PID_TIMEOUT		3
> +
>  static const struct ov10635_reg {
>  	u16	reg;
>  	u8	val;
> @@ -452,7 +454,7 @@ static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
>  
>  static int rdacm20_initialize(struct rdacm20_device *dev)
>  {
> -	unsigned int retry = 3;
> +	unsigned int i;
>  	int ret;
>  
>  	/* Verify communication with the MAX9271: ping to wakeup. */
> @@ -501,23 +503,14 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  		return ret;
>  	usleep_range(10000, 15000);
>  
> -again:
> -	ret = ov10635_read16(dev, OV10635_PID);
> -	if (ret < 0) {
> -		if (retry--)
> -			goto again;
> -
> -		dev_err(dev->dev, "OV10635 ID read failed (%d)\n",
> -			ret);
> -		return -ENXIO;
> +	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {
> +		ret = ov10635_read16(dev, OV10635_PID);
> +		if (ret == OV10635_VERSION)
> +			break;
> +		usleep_range(1000, 2000);
>  	}
> -
> -	if (ret != OV10635_VERSION) {
> -		if (retry--)
> -			goto again;
> -
> -		dev_err(dev->dev, "OV10635 ID mismatch (0x%04x)\n",
> -			ret);
> +	if (i == OV10635_PID_TIMEOUT) {
> +		dev_err(dev->dev, "OV10635 ID read failed (%d)\n", ret);
>  		return -ENXIO;
>  	}
>  
> 

