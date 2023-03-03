Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA7E6A9A2F
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 16:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjCCPHO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 10:07:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjCCPHN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 10:07:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C804015C93
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 07:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677855985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c3MaWgcIVKLeFvtE0JYQv6BpLe8NRjHzVjH/VB/gBX4=;
        b=BEX1kNANNYo1lNmZpkzYLBca5OkxneEcKcy/2SnOe6rZE+rzZ5giIzWroGnrB7OWB3A4wT
        Eekey4MPqrgL3FQxfcPn0qh/+5gvc6DzN6a7TbhLmAO4b2xYbrNyM4OKNG+wGdsPsRnGCT
        Ffrq9PBifzDiUqEPFjtLWQqchiuK6yg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-aaNAKFIjNgiyKz61bhbjQQ-1; Fri, 03 Mar 2023 10:06:22 -0500
X-MC-Unique: aaNAKFIjNgiyKz61bhbjQQ-1
Received: by mail-ed1-f71.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso4415744edb.4
        for <linux-media@vger.kernel.org>; Fri, 03 Mar 2023 07:06:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677855973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3MaWgcIVKLeFvtE0JYQv6BpLe8NRjHzVjH/VB/gBX4=;
        b=h29ZfTNx/IDyyzW1M8FuzipFLQ7P79HAfTIzGHydLQE4XaUQWLhJ1l7DcbtkDF8x8i
         G4foT1JTy0N9mK7EFA/bEsqy9TBnUvxKJqDZvaKKRkEVoNWxBoMYMLg8CD+8JcNGdwCo
         2y6QmQT+v1JRpHDI2SWfQE4fhMNtb7oIbsy3SZdTYd8b9DNwPQgdAXL3L8jPoh4VKbkA
         tFmFUGrhXruh/DaDodpShvuDSXx4HWrPglnaJZAQHBf+4LTHHrIkl+GK1oOXKCTXI0md
         IbsS4XO0LOKVNycFeyANUIHmYH7H16KCT2b3tSqY3qflDZGys5DKdd0LuhtWS68moltE
         K7hw==
X-Gm-Message-State: AO0yUKUoewrzfjt1/AYZVBJdG6Y4Rl+mD5bv/A/dhisp9ItBepXWhaNz
        KsDWN/IkMvbtKAdCXaOExtkzGo1bzsYb2w/2fCdlPWz2NWLOKeuVBhG0hkGfMrX44XeqgnqwYuT
        BZhawhmhWiBEa8kmvDhflyLLInbYd
X-Received: by 2002:a17:906:2509:b0:902:874:9c31 with SMTP id i9-20020a170906250900b0090208749c31mr5753000ejb.35.1677855973278;
        Fri, 03 Mar 2023 07:06:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/tlPC6MFqeEUvxIbEzrq33ryZC/mQYUtVUDXp3TTbDW0yfAPAjaCJSnJjZrbOCaYadACzD0A==
X-Received: by 2002:a17:906:2509:b0:902:874:9c31 with SMTP id i9-20020a170906250900b0090208749c31mr5752984ejb.35.1677855973030;
        Fri, 03 Mar 2023 07:06:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o26-20020a50c29a000000b004ac54d4da22sm1253713edf.71.2023.03.03.07.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 07:06:12 -0800 (PST)
Message-ID: <49f77774-b34b-130d-a761-9a087c1d4ea8@redhat.com>
Date:   Fri, 3 Mar 2023 16:06:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
References: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
 <20230302202219.846011-1-sakari.ailus@linux.intel.com>
 <12e3fcc5-1a54-1313-8d52-5618b87f09d1@ideasonboard.com>
 <ZAHaOY6m864mEL0e@kekkonen.localdomain>
 <311809d5-8fd1-1514-dd7c-670cfda0c5b4@ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <311809d5-8fd1-1514-dd7c-670cfda0c5b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 3/3/23 12:36, Tomi Valkeinen wrote:
> On 03/03/2023 13:30, Sakari Ailus wrote:
>> Hi Tomi,
>>
>> On Fri, Mar 03, 2023 at 10:41:27AM +0200, Tomi Valkeinen wrote:
>>> On 02/03/2023 22:22, Sakari Ailus wrote:
>>>> Link validation currently accesses invalid pointers if the link passed to it
>>>> is not between two sub-devices. This is of course a driver bug.
>>>>
>>>> Ignore the error but print a debug message, as this is how it used to work
>>>> previously.
>>>>
>>>> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
>>>> Reported-by: Hans de Goede <hdegoede@redhat.com>
>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>> ---
>>>> Hi Hans,
>>>>
>>>> Could you test this?
>>>>
>>>> The bug is of course in the ImgU driver and this reverts to the old
>>>> pre-streams behaviour. It silently fails instead of oopsing. The ImgU driver
>>>> needs to be fixed and I think we could make this return an error at the same
>>>> time. Right now I can't be sure the ImgU driver is the only one suffering
>>>> from this, but if so, it's likely to be broken anyway.
>>>
>>> Maybe it should be at least a warn? How do we catch other broken drivers
>>> otherwise?
>>
>> The purpose of this patch is just to restore the old behaviour, and merge
>> it as a fix to v6.3 (via Cc'ing stable). I agree this should be made an
>> error but I'd like that change to be present in the media tree for some
>> time first.
> 
> I meant that keep it returning 0 (no error), but instead of a debug print, use pr_warn. Or maybe pr_warn_once for now.

Switching to pr_warn_once() sounds reasonable to me.

I'll try to give this a test-run sometime next week.

Regards,

Hans

