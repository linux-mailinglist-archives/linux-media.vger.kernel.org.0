Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892902075C5
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 16:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389818AbgFXOfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 10:35:20 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:41445 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388652AbgFXOfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 10:35:20 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id o6UYjhmHANb6lo6Ucjtj31; Wed, 24 Jun 2020 16:35:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593009317; bh=4nj80ZoejCTzIqhI/ByN/MtrY21sILrhsLRwxpZCXRo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WTlLfHIkg1vzFn7FA8Y+Sa+1ZBjBWWfIhqTuOH5gJyx1ZCVrI7KGbV8TbgNGID8A4
         uWx33qQOvfzFa3L4TJkTeTst0MaBS+0xF18f3vRys+acKzVphH+x4Z1ithwzgBxHAk
         hxGgTzneEEVfgm4G6t9Azj5iOHqkZForKU0sXQZO8nEREV9SMHTUFYNYv4p+zCXN1l
         7PQb6uVMYq1C3EdTXByGvZm+K37xlW63c2QktRiDkeUP3fNc5xB+5ZTlIMwqTBUZVk
         uSB8o352I3s/5gyi0eu+zzr5R6uYabsgpJ5hNcpg5+tEuk+4Ot6svB/vaGmpyx36Kz
         8NKJjfkyGbx6A==
Subject: Re: [PATCH 01/12] media: allegro: rework mbox handling
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
References: <20200617114550.3235-1-m.tretter@pengutronix.de>
 <20200617114550.3235-2-m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b433b4f4-71c4-6c2c-9dd4-6ed8c60a4751@xs4all.nl>
Date:   Wed, 24 Jun 2020 16:35:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200617114550.3235-2-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCVLwTh0iTL17tf5HUiv4F1+97U6uofvzJMFKObZbFazrbLlReoMZ9Ojj8Zb1BZTtHsAABb8ifjK2/WgdRe1WcGpVVEXpLE27lhwhht9MTI0y0fzpjg7
 rjlf237B/F8qlKDGoBf7b/hDqTL+Ji/vfXS3dGIP+qRwnsN2q13IzIJ2hwdWNnOCTLx46dzBUalNjwS7+DlH4O9llea9Pwxvs/hAeLTgAU/KAjK3o1sQyUFv
 L+UDA1OYFvtyTG2HTqiMEQ8Z7tnH3G3ALiumG6coINI6JJhe+jVpV8SsFQDTrN9g
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/06/2020 13:45, Michael Tretter wrote:
> Add a send/notify abstraction for the mailbox and separate the message
> handling in the driver from the code to read and write message to the
> mailbox.
> 
> This untangles how mails are written into the MCU's SRAM and signaled to
> the MCU from the protocol between the driver and the firmware.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  .../staging/media/allegro-dvt/allegro-core.c  | 150 +++++++++++-------
>  1 file changed, 92 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> index 70f133a842dd..447b15cc235c 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -105,9 +105,11 @@ struct allegro_buffer {
>  	struct list_head head;
>  };
>  
> +struct allegro_dev;
>  struct allegro_channel;
>  
>  struct allegro_mbox {
> +	struct allegro_dev *dev;
>  	unsigned int head;
>  	unsigned int tail;
>  	unsigned int data;
> @@ -134,8 +136,8 @@ struct allegro_dev {
>  	struct completion init_complete;
>  
>  	/* The mailbox interface */
> -	struct allegro_mbox mbox_command;
> -	struct allegro_mbox mbox_status;
> +	struct allegro_mbox *mbox_command;
> +	struct allegro_mbox *mbox_status;
>  
>  	/*
>  	 * The downstream driver limits the users to 64 users, thus I can use
> @@ -583,12 +585,20 @@ static void allegro_free_buffer(struct allegro_dev *dev,
>   * Mailbox interface to send messages to the MCU.
>   */
>  
> -static int allegro_mbox_init(struct allegro_dev *dev,
> -			     struct allegro_mbox *mbox,
> -			     unsigned int base, size_t size)
> +static void allegro_mcu_interrupt(struct allegro_dev *dev);
> +static void allegro_handle_message(struct allegro_dev *dev,
> +				   union mcu_msg_response *msg);
> +
> +static struct allegro_mbox *allegro_mbox_init(struct allegro_dev *dev,
> +					      unsigned int base, size_t size)
>  {
> +	struct allegro_mbox *mbox;
> +
> +	mbox = devm_kmalloc(&dev->plat_dev->dev, sizeof(*mbox), GFP_KERNEL);
>  	if (!mbox)
> -		return -EINVAL;
> +		return ERR_PTR(-ENOMEM);
> +
> +	mbox->dev = dev;
>  
>  	mbox->head = base;
>  	mbox->tail = base + 0x4;
> @@ -599,7 +609,7 @@ static int allegro_mbox_init(struct allegro_dev *dev,
>  	regmap_write(dev->sram, mbox->head, 0);
>  	regmap_write(dev->sram, mbox->tail, 0);
>  
> -	return 0;
> +	return mbox;
>  }
>  
>  static int allegro_mbox_write(struct allegro_dev *dev,
> @@ -713,9 +723,55 @@ static ssize_t allegro_mbox_read(struct allegro_dev *dev,
>  	return size;
>  }
>  
> -static void allegro_mcu_interrupt(struct allegro_dev *dev)
> +/**
> + * allegro_mbox_send() - Send a message via the mailbox
> + * @mbox: the mailbox which is used to send the message
> + * @msg: the message to send
> + */
> +static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
>  {
> -	regmap_write(dev->regmap, AL5_MCU_INTERRUPT, BIT(0));
> +	struct allegro_dev *dev = mbox->dev;
> +	struct mcu_msg_header *header = msg;
> +	ssize_t size = sizeof(*header) + header->length;
> +	int err;
> +
> +	err = allegro_mbox_write(dev, mbox, msg, size);
> +	if (err)
> +		goto out;
> +
> +	allegro_mcu_interrupt(dev);
> +
> +out:
> +	return err;
> +}
> +
> +/**
> + * allegro_mbox_notify() - Notify the mailbox about a new message
> + * @mbox: The allegro_mbox to notify
> + */
> +static int allegro_mbox_notify(struct allegro_mbox *mbox)
> +{
> +	struct allegro_dev *dev = mbox->dev;
> +	union mcu_msg_response *msg;
> +	ssize_t size;
> +	int err;

Shouldn't this be 'err = 0;'?

smatch gives me an error for this:

media-git/drivers/staging/media/allegro-dvt/allegro-core.c:786 allegro_mbox_notify() error: uninitialized symbol 'err'.

Regards,

	Hans

> +
> +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	size = allegro_mbox_read(dev, mbox, msg, sizeof(*msg));
> +	if (size < 0) {
> +		err = size;
> +		goto out;
> +	}
> +
> +	allegro_handle_message(dev, msg);
> +
> +out:
> +	kfree(msg);
> +
> +	return err;
>  }
>  
>  static void allegro_mcu_send_init(struct allegro_dev *dev,
> @@ -736,8 +792,7 @@ static void allegro_mcu_send_init(struct allegro_dev *dev,
>  	msg.l2_cache[1] = -1;
>  	msg.l2_cache[2] = -1;
>  
> -	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
> -	allegro_mcu_interrupt(dev);
> +	allegro_mbox_send(dev->mbox_command, &msg);
>  }
>  
>  static u32 v4l2_pixelformat_to_mcu_format(u32 pixelformat)
> @@ -946,8 +1001,7 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
>  
>  	fill_create_channel_param(channel, &msg.param);
>  
> -	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
> -	allegro_mcu_interrupt(dev);
> +	allegro_mbox_send(dev->mbox_command, &msg);
>  
>  	return 0;
>  }
> @@ -964,8 +1018,7 @@ static int allegro_mcu_send_destroy_channel(struct allegro_dev *dev,
>  
>  	msg.channel_id = channel->mcu_channel_id;
>  
> -	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
> -	allegro_mcu_interrupt(dev);
> +	allegro_mbox_send(dev->mbox_command, &msg);
>  
>  	return 0;
>  }
> @@ -991,8 +1044,7 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
>  	/* copied to mcu_msg_encode_frame_response */
>  	msg.stream_id = stream_id;
>  
> -	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
> -	allegro_mcu_interrupt(dev);
> +	allegro_mbox_send(dev->mbox_command, &msg);
>  
>  	return 0;
>  }
> @@ -1021,8 +1073,7 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
>  	msg.ep2 = 0x0;
>  	msg.ep2_v = to_mcu_addr(dev, msg.ep2);
>  
> -	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
> -	allegro_mcu_interrupt(dev);
> +	allegro_mbox_send(dev->mbox_command, &msg);
>  
>  	return 0;
>  }
> @@ -1084,12 +1135,8 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
>  		buffer++;
>  	}
>  
> -	err = allegro_mbox_write(dev, &dev->mbox_command, msg, size);
> -	if (err)
> -		goto out;
> -	allegro_mcu_interrupt(dev);
> +	err = allegro_mbox_send(dev->mbox_command, msg);
>  
> -out:
>  	kfree(msg);
>  	return err;
>  }
> @@ -1681,51 +1728,28 @@ allegro_handle_encode_frame(struct allegro_dev *dev,
>  	return 0;
>  }
>  
> -static int allegro_receive_message(struct allegro_dev *dev)
> +static void allegro_handle_message(struct allegro_dev *dev,
> +				   union mcu_msg_response *msg)
>  {
> -	union mcu_msg_response *msg;
> -	ssize_t size;
> -	int err = 0;
> -
> -	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> -	if (!msg)
> -		return -ENOMEM;
> -
> -	size = allegro_mbox_read(dev, &dev->mbox_status, msg, sizeof(*msg));
> -	if (size < sizeof(msg->header)) {
> -		v4l2_err(&dev->v4l2_dev,
> -			 "invalid mbox message (%zd): must be at least %zu\n",
> -			 size, sizeof(msg->header));
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
>  	switch (msg->header.type) {
>  	case MCU_MSG_TYPE_INIT:
> -		err = allegro_handle_init(dev, &msg->init);
> +		allegro_handle_init(dev, &msg->init);
>  		break;
>  	case MCU_MSG_TYPE_CREATE_CHANNEL:
> -		err = allegro_handle_create_channel(dev, &msg->create_channel);
> +		allegro_handle_create_channel(dev, &msg->create_channel);
>  		break;
>  	case MCU_MSG_TYPE_DESTROY_CHANNEL:
> -		err = allegro_handle_destroy_channel(dev,
> -						     &msg->destroy_channel);
> +		allegro_handle_destroy_channel(dev, &msg->destroy_channel);
>  		break;
>  	case MCU_MSG_TYPE_ENCODE_FRAME:
> -		err = allegro_handle_encode_frame(dev, &msg->encode_frame);
> +		allegro_handle_encode_frame(dev, &msg->encode_frame);
>  		break;
>  	default:
>  		v4l2_warn(&dev->v4l2_dev,
>  			  "%s: unknown message %s\n",
>  			  __func__, msg_type_name(msg->header.type));
> -		err = -EINVAL;
>  		break;
>  	}
> -
> -out:
> -	kfree(msg);
> -
> -	return err;
>  }
>  
>  static irqreturn_t allegro_hardirq(int irq, void *data)
> @@ -1746,7 +1770,7 @@ static irqreturn_t allegro_irq_thread(int irq, void *data)
>  {
>  	struct allegro_dev *dev = data;
>  
> -	allegro_receive_message(dev);
> +	allegro_mbox_notify(dev->mbox_status);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -1895,6 +1919,11 @@ static int allegro_mcu_reset(struct allegro_dev *dev)
>  	return allegro_mcu_wait_for_sleep(dev);
>  }
>  
> +static void allegro_mcu_interrupt(struct allegro_dev *dev)
> +{
> +	regmap_write(dev->regmap, AL5_MCU_INTERRUPT, BIT(0));
> +}
> +
>  static void allegro_destroy_channel(struct allegro_channel *channel)
>  {
>  	struct allegro_dev *dev = channel->dev;
> @@ -2887,10 +2916,15 @@ static int allegro_mcu_hw_init(struct allegro_dev *dev,
>  {
>  	int err;
>  
> -	allegro_mbox_init(dev, &dev->mbox_command,
> -			  info->mailbox_cmd, info->mailbox_size);
> -	allegro_mbox_init(dev, &dev->mbox_status,
> -			  info->mailbox_status, info->mailbox_size);
> +	dev->mbox_command = allegro_mbox_init(dev, info->mailbox_cmd,
> +					      info->mailbox_size);
> +	dev->mbox_status = allegro_mbox_init(dev, info->mailbox_status,
> +					     info->mailbox_size);
> +	if (!dev->mbox_command || !dev->mbox_status) {
> +		v4l2_err(&dev->v4l2_dev,
> +			 "failed to initialize mailboxes\n");
> +		return -EIO;
> +	}
>  
>  	allegro_mcu_enable_interrupts(dev);
>  
> 

