Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA7F66316A8
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiKTWAB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:00:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiKTWAA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:00:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832B42034A
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 13:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668981547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nwBWsFKvrbqfiKa4gmMjzhOepWlGG2NUw03g19n66y4=;
        b=cX02+GFZIYB22E3wjIAGrfVyTCW7tq88ssbgXpYSTLJZoNKr/4Fev4sQ8h4kzMjS8KLtzV
        5wRfOcxBWbkk/6gzCC9I1w4s9WrO5ccFzYumcbshafofsAE0YCM5jricKr/0cQC/WpkCpl
        1h9TR5QhUF8vclteK1N3TmqMxizjwEc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-89E_oO9rMHmQ-gKDO-rEJA-1; Sun, 20 Nov 2022 16:59:06 -0500
X-MC-Unique: 89E_oO9rMHmQ-gKDO-rEJA-1
Received: by mail-ed1-f70.google.com with SMTP id q13-20020a056402518d00b00462b0599644so5571515edd.20
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 13:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwBWsFKvrbqfiKa4gmMjzhOepWlGG2NUw03g19n66y4=;
        b=au4GvLKb+qtmEVpmuFRf9XHI5KKBddL1VlyVBn8qYzfBsEVidpqeToL9lwOzv98oTJ
         U7QSGMIi2bYUbS8YS7fe4z1i8jw2NWoIBSB/7xySbWNb/OZas99A3FEkcZG3hz+UCyNz
         u2CVtna1znTbwuNiWCNMXZnyT73XM8iIWufGA1xUL6CZ3yAwxiIaKbprVvDGLw0ds0QO
         7sAMC+x4UqAky4essGPFu16/vyK4xBS2LnmO/HKCrFFShjvYbG2oouPjhRb1D1m9w3rT
         jHWE6dUvpOb2/yHznZbIpnoUEbwclfhSGu83laNGVOOvo5CwECLGRyiqUTeQQL/nAEM+
         dyFg==
X-Gm-Message-State: ANoB5pk6but5IKOf9heOzgnr1CBWiqG9i8xuUfOTHQzutOT8G8Qh+gQ1
        sXP50CEu7TSxuxxyFzO8YbdCfDVCRGyYae6mMltajcYLTn6M1tg786DHjD3eds5iWPUs0821T/h
        nsggebUQ88DMoXz6z16dCSYA=
X-Received: by 2002:aa7:d844:0:b0:458:fa8f:f82c with SMTP id f4-20020aa7d844000000b00458fa8ff82cmr13659069eds.246.1668981545050;
        Sun, 20 Nov 2022 13:59:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Gar3N8Hyi6mwsbDm9bH0P/hxbZ1qv+flxwNDdbKITcrrtrpHCiR2vaR4vmS4fscJtW9bFwQ==
X-Received: by 2002:aa7:d844:0:b0:458:fa8f:f82c with SMTP id f4-20020aa7d844000000b00458fa8ff82cmr13659063eds.246.1668981544898;
        Sun, 20 Nov 2022 13:59:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id er21-20020a056402449500b00451319a43dasm4377085edb.2.2022.11.20.13.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 13:59:04 -0800 (PST)
Message-ID: <8a32c643-491c-d039-6fd2-7c86d41144b3@redhat.com>
Date:   Sun, 20 Nov 2022 22:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 06/17] media: atomisp: Also track buffers in a list
 when submitted to the ISP
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-7-hdegoede@redhat.com>
 <Y3IsUUUjonfNclcb@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3IsUUUjonfNclcb@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/14/22 12:53, Andy Shevchenko wrote:
> On Thu, Oct 20, 2022 at 09:55:22PM +0200, Hans de Goede wrote:
>> Instead of using an integer to keep count of how many buffers have
>> been handed over to the ISP (buffers_in_css) move buffers handed
>> over to the ISP to a new buffers_in_css list_head so that we can
>> easily loop over them.
>>
>> This removes the need for atomisp_flush_video_pipe() to loop over
>> all buffers and then (ab)use the state to figure out if they
>> were handed over to the ISP.
>>
>> Since the buffers are now always on a list when owned by the driver
>> this also allows the buffer_done path on flush vs normal completion
>> to be unified (both now need a list_del()) and this common code can
>> now be factored out into a new atomisp_buffer_done() helper.
>>
>> This is a preparation patch for moving the driver over to
>> the videobuf2 framework.
> 
> ...
> 
>> +int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe)
>>  {
>>  	unsigned long irqflags;
>> +	struct list_head *pos;
>> +	int buffers_in_css = 0;
>>  
>> +	spin_lock_irqsave(&pipe->irq_lock, irqflags);
>>  
>> +	list_for_each(pos, &pipe->buffers_in_css)
>> +		buffers_in_css++;
>> +
>> +	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
>> +
>> +	return buffers_in_css;
>> +}
> 
> Looking at this I come up with the
> https://lore.kernel.org/r/20221114112842.38565-1-andriy.shevchenko@linux.intel.com
> 
> But I think your stuff will be earlier in upstream, so feel free to create
> a followup later on.

That is super useful, thanks. But as you mention it is probably best to
just conver the code here to this alter. I've added this to my atomisp
TODO list.


> 
> ...
> 
>> +		vb = list_first_entry_or_null(&pipe->activeq, struct videobuf_buffer, queue);
>> +		if (vb) {
> 
> Wouldn't simply list_empty() work here? (Yes, you would need to have else
> branch under spin lock, but codewise seems better to me).

The problem with that is that the else branch does a "return -EINVAL;"
so then I would need a separate spin_unlock_irqrestore() for the else
branch and I really dislike not having my locks / unlocks cleanly
balanced 1:1.

Regards,

Hans



> 
>> +			list_move_tail(&vb->queue, &pipe->buffers_in_css);
>> +			vb->state = VIDEOBUF_ACTIVE;
>>  		}
> 
>>  		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
>>  
>> +		if (!vb)
>> +			return -EINVAL;
> 
> 

