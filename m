Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA4F30357F
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 06:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732438AbhAZFny (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:43:54 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60007 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726793AbhAYJrP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 04:47:15 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3yQSlSst4iWRg3yQWlfiH0; Mon, 25 Jan 2021 10:44:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611567892; bh=X9qzwXGcE2sFQf9cp/+nOjABplllfztKTXGYuSx4nLk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=naFbLfcgYqTAQotHwVkJscZTeQgHUA0kK8zkz4nWZ2gKBs4gvB1VRXJ7Vzu+ZcpcC
         0asysLiKT3V29FB0W+RWdMefPcbXZS6IKu2XjwGTqNl+3ER+eMmgp+Cz/X0k9Mr2tz
         gNwDem7DD626WEntphgTOjUpJk0yfr6VdaCc89QRZzTD0cMVXsd9Y93XxOLvFEc4lK
         nO7MyLiBqbY5iG06k2UPk+fSCZfXmlz9vVchRi2OuiF8vn4dpVEpu2UfGtdfyzOMXT
         yACLHciZOSj21+3J1WODZME+P9mEy357olEKehWWovYIQGsISetTY0BGc8qegeoUTF
         WTh56ZMxNu08g==
Subject: Re: [PATCH v2 4/4] rcar-csi2: Do not try to recover after transfer
 error
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
 <20210115002148.4079591-5-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3f40c6eb-ba13-ac99-bd08-3cea11563e9a@xs4all.nl>
Date:   Mon, 25 Jan 2021 10:44:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115002148.4079591-5-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKM35xRuy5Zdn5cQBT1Id09Ed34+wj1e0/OQj5wLDbXPYDxZi7/2Yylfd7gDPpies9oaonby6pimUVsL6JAAZchPZ+dSN0tr3NScd7Zgx7e8zOHeQDEx
 oBu+nfHdshrE0owLu+QoGPwWBSxMvdE5FmxzNSfjHebqupBEM2mzmiIJRIgpi3ErG/H3osjlnlUk+JYoG7GaNZNFez7pw2We4rO3c6Y4T9hFHvOUcl9/C7XJ
 eIT2RJ6tcjf3cdwVphV4fKpMV06TSdpq4lISqNhsOBnwqQtLbBavprZHgHnpHld1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/01/2021 01:21, Niklas Söderlund wrote:
> Instead of restarting the R-Car CSI-2 receiver if a transmission error
> is detected inform the R-Car VIN driver of the error so it can stop the
> whole pipeline and inform user-space. This is done to reflect a updated
> usage recommendation in later versions of the datasheet.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 945d2eb8723367f0..a7212ecc46572a3b 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -773,21 +773,19 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
>  
>  	rcsi2_write(priv, INTERRSTATE_REG, err_status);
>  
> -	dev_info(priv->dev, "Transfer error, restarting CSI-2 receiver\n");
> -
>  	return IRQ_WAKE_THREAD;
>  }
>  
>  static irqreturn_t rcsi2_irq_thread(int irq, void *data)
>  {
>  	struct rcar_csi2 *priv = data;
> +	struct v4l2_event event = {
> +		.type = V4L2_EVENT_EOS,
> +	};
>  
> -	mutex_lock(&priv->lock);
> -	rcsi2_stop(priv);
> -	usleep_range(1000, 2000);
> -	if (rcsi2_start(priv))
> -		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
> -	mutex_unlock(&priv->lock);
> +	dev_err(priv->dev, "Transfer error detected.\n");

You probably want to call vb2_queue_error() here. Typically once
something like this happens you have to restart everything and marking
the queue as 'error' will ensure that VIDIOC_QBUF will return an error
until the queue is reset (STREAMOFF).

It doesn't hurt to also raise the EOS event, I'm fine with that.

Regards,

	Hans

> +
> +	v4l2_subdev_notify_event(&priv->subdev, &event);
>  
>  	return IRQ_HANDLED;
>  }
> 

