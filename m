Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26D921B54C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 14:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgGJMnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 08:43:15 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:59691 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727861AbgGJMnO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 08:43:14 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id tsMtjnBL4JcNHtsMwjs0mu; Fri, 10 Jul 2020 14:43:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594384991; bh=xjiHPqqMJUPZ2pqWerZiG2sIn89eqFUS46+OtxjKLZY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dwpu+goHg4yFHykhQ4roBZu0kZ7p/Ly+trHU8P1P6znMd6rHnY2RsOOjFPEnG04Ec
         dBynt68OWR7kBTR0Hwtpm4TB2eNQPfN5J6ib37bsdPHiOmE4keuRDoOHfsnk2fIt0v
         TJKhJlBdqeEVSZ7bBeOEtKpRNQv+TQNWrnzoG37qNfX647asp6aUOyqMlfMNaI6Z59
         mGvfq8yoXZ59HsPc+VwXZnu5S1IeZKa3KTlTJlKyHcI3Gy/0k5MtpWNZSitbF4EUFd
         a+TPPrC7TdUyXcsqFTp7v7Vb9ory3KhxxgrUR5TObyst3F0ky7DD9xFB5wRErrsNse
         UAp9BG0TfiVFg==
Subject: Re: [PATCH 01/12] media: allegro: rework mbox handling
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de
References: <20200617114550.3235-1-m.tretter@pengutronix.de>
 <20200617114550.3235-2-m.tretter@pengutronix.de>
 <b433b4f4-71c4-6c2c-9dd4-6ed8c60a4751@xs4all.nl>
 <20200630073627.GA6843@pengutronix.de> <20200630082935.GB6843@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5dd694a6-5a98-7453-e5de-2453fa37ee9b@xs4all.nl>
Date:   Fri, 10 Jul 2020 14:43:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630082935.GB6843@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDw9UxbNGYMs7tZ5HjkF39fjTBnfbkiP9bDlYpt5cJcbOIa5GoPIpLYaXaXjzCFG1mUT3GqluPquTBOhPIPIvRQBqfRMFgt4SXJSkdrcvZKmNKj+S+kV
 LKaDlFVHrO+eHo1fjFmVaKD3uVCC8wPXfdSRaTypyIal12/r//pU1iywxPMd0YDU9D1R+ODpzNzjeoS7U4oa679u+MtO3DIdMLffMpoKxET8vv5qeUU5QTbY
 XnEvnd02DHORnMVKqNK2623kCzzdj3Oj+FBW34vw2IBooAam2zTP16hWc9qQmFxl
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/06/2020 10:29, Michael Tretter wrote:
> On Tue, Jun 30, 2020 at 09:36:27AM +0200, Michael Tretter wrote:
>> On Wed, Jun 24, 2020 at 04:35:09PM +0200, Hans Verkuil wrote:
>>> On 17/06/2020 13:45, Michael Tretter wrote:
>>>> Add a send/notify abstraction for the mailbox and separate the message
>>>> handling in the driver from the code to read and write message to the
>>>> mailbox.
>>>>
>>>> This untangles how mails are written into the MCU's SRAM and signaled to
>>>> the MCU from the protocol between the driver and the firmware.
>>>>
>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>>> ---
>>>>  .../staging/media/allegro-dvt/allegro-core.c  | 150 +++++++++++-------
>>>>  1 file changed, 92 insertions(+), 58 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
>>>> index 70f133a842dd..447b15cc235c 100644
>>>> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
>>>> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
>>>> @@ -105,9 +105,11 @@ struct allegro_buffer {
>>>>  	struct list_head head;
>>>>  };
>>>>  
>>>> +struct allegro_dev;
>>>>  struct allegro_channel;
>>>>  
>>>>  struct allegro_mbox {
>>>> +	struct allegro_dev *dev;
>>>>  	unsigned int head;
>>>>  	unsigned int tail;
>>>>  	unsigned int data;
>>>> @@ -134,8 +136,8 @@ struct allegro_dev {
>>>>  	struct completion init_complete;
>>>>  
>>>>  	/* The mailbox interface */
>>>> -	struct allegro_mbox mbox_command;
>>>> -	struct allegro_mbox mbox_status;
>>>> +	struct allegro_mbox *mbox_command;
>>>> +	struct allegro_mbox *mbox_status;
>>>>  
>>>>  	/*
>>>>  	 * The downstream driver limits the users to 64 users, thus I can use
>>>> @@ -583,12 +585,20 @@ static void allegro_free_buffer(struct allegro_dev *dev,
>>>>   * Mailbox interface to send messages to the MCU.
>>>>   */
>>>>  
>>>> -static int allegro_mbox_init(struct allegro_dev *dev,
>>>> -			     struct allegro_mbox *mbox,
>>>> -			     unsigned int base, size_t size)
>>>> +static void allegro_mcu_interrupt(struct allegro_dev *dev);
>>>> +static void allegro_handle_message(struct allegro_dev *dev,
>>>> +				   union mcu_msg_response *msg);
>>>> +
>>>> +static struct allegro_mbox *allegro_mbox_init(struct allegro_dev *dev,
>>>> +					      unsigned int base, size_t size)
>>>>  {
>>>> +	struct allegro_mbox *mbox;
>>>> +
>>>> +	mbox = devm_kmalloc(&dev->plat_dev->dev, sizeof(*mbox), GFP_KERNEL);
>>>>  	if (!mbox)
>>>> -		return -EINVAL;
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	mbox->dev = dev;
>>>>  
>>>>  	mbox->head = base;
>>>>  	mbox->tail = base + 0x4;
>>>> @@ -599,7 +609,7 @@ static int allegro_mbox_init(struct allegro_dev *dev,
>>>>  	regmap_write(dev->sram, mbox->head, 0);
>>>>  	regmap_write(dev->sram, mbox->tail, 0);
>>>>  
>>>> -	return 0;
>>>> +	return mbox;
>>>>  }
>>>>  
>>>>  static int allegro_mbox_write(struct allegro_dev *dev,
>>>> @@ -713,9 +723,55 @@ static ssize_t allegro_mbox_read(struct allegro_dev *dev,
>>>>  	return size;
>>>>  }
>>>>  
>>>> -static void allegro_mcu_interrupt(struct allegro_dev *dev)
>>>> +/**
>>>> + * allegro_mbox_send() - Send a message via the mailbox
>>>> + * @mbox: the mailbox which is used to send the message
>>>> + * @msg: the message to send
>>>> + */
>>>> +static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
>>>>  {
>>>> -	regmap_write(dev->regmap, AL5_MCU_INTERRUPT, BIT(0));
>>>> +	struct allegro_dev *dev = mbox->dev;
>>>> +	struct mcu_msg_header *header = msg;
>>>> +	ssize_t size = sizeof(*header) + header->length;
>>>> +	int err;
>>>> +
>>>> +	err = allegro_mbox_write(dev, mbox, msg, size);
>>>> +	if (err)
>>>> +		goto out;
>>>> +
>>>> +	allegro_mcu_interrupt(dev);
>>>> +
>>>> +out:
>>>> +	return err;
>>>> +}
>>>> +
>>>> +/**
>>>> + * allegro_mbox_notify() - Notify the mailbox about a new message
>>>> + * @mbox: The allegro_mbox to notify
>>>> + */
>>>> +static int allegro_mbox_notify(struct allegro_mbox *mbox)
>>>> +{
>>>> +	struct allegro_dev *dev = mbox->dev;
>>>> +	union mcu_msg_response *msg;
>>>> +	ssize_t size;
>>>> +	int err;
>>>
>>> Shouldn't this be 'err = 0;'?
>>>
>>> smatch gives me an error for this:
>>>
>>> media-git/drivers/staging/media/allegro-dvt/allegro-core.c:786 allegro_mbox_notify() error: uninitialized symbol 'err'.
>>
>> Yes, thank you. I just found out that I was using a really, really old version
>> of smatch. Will send a v2.
> 
> allegro_mbox_notify() should be void and not return an error code at all. It
> is called from the interrupt handler and if there is an error when reading
> from the mailbox, we cannot do anything anyway.

Can you post a v2? This series is ready to be merged except for this issue.

Regards,

	Hans
