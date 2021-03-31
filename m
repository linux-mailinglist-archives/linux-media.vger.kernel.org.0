Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11F2A34FF94
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 13:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhCaLhf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 07:37:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54872 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235199AbhCaLha (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 07:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617190650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HfXUGj8GkVv1+3OoOoEguq5fQwLpeWtMPhYBt9BTwVA=;
        b=Ur2UY/LBTbCDRWy4ZxjDky/0PyRi8wvsi+PCpTCr4LYWW8v7OWbcidj5V9VY0NDalKU9vi
        kK5I0OkeWSzHgQQJrGQJQU9ej51JG2JHU6JFe9Mn152VxycqYrMnfsnNg1gBd/QxWB4Ks5
        6gDt2Svk5SRv8q3um6t1fyADsJy1vjM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-WboD_gZkO6G6Mv6i8Fep1A-1; Wed, 31 Mar 2021 07:37:28 -0400
X-MC-Unique: WboD_gZkO6G6Mv6i8Fep1A-1
Received: by mail-ej1-f69.google.com with SMTP id au15so665200ejc.8
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 04:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HfXUGj8GkVv1+3OoOoEguq5fQwLpeWtMPhYBt9BTwVA=;
        b=KKlno8dds4QeCiNUKYAne71tnjTwJgoamCwu0AO50BnTAJl4uDYLepnR9hSdy4bzHi
         LLHAh8+yncIL7zeQWImVe5zcQr6agoTVhClkeHotxnBP3vx5Era0lliOBWnNdhmrYry+
         +dmxTuAd5qQh0di+0wxUBjGdR4K/9dAz9kLKC1iV/GMwkUHY6ZKUv1EWHFnAu6C84neu
         F3zcDQ69i/wKva+vN50qrd19Mu5sapXkBAkUfCmbflmauyXABMiAX21p5RpqZXeGNCrn
         zIF7NiGsba05Z3FQqQw5cEipUxaxR5aXoSpWtHgnIPk9vJw+17EtiVDv83U+M34iQSs1
         gf0Q==
X-Gm-Message-State: AOAM533w6sMnjvjn8zeQb/ryInFzLOjh3EE/SDacUHgkjk7vnafxnPjM
        XKIIemObhM1CH0V4PfL5APrQCB/M3wBa+kB9+djzXUhtU5zfpC0xHJkBiSkJCz7SSRxSr319NfE
        t7tQP1yIvZM0CV2qEPQpOp1E=
X-Received: by 2002:a17:906:82c5:: with SMTP id a5mr3091166ejy.232.1617190646954;
        Wed, 31 Mar 2021 04:37:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqQZO+rKk56OX+cy4H70pWeZ8Dv3Ap341KRNQ+kkR5JZUAD7u9LMFGqe9dWY9n5NcFPBq9Pw==
X-Received: by 2002:a17:906:82c5:: with SMTP id a5mr3091148ejy.232.1617190646789;
        Wed, 31 Mar 2021 04:37:26 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q10sm1349145eds.67.2021.03.31.04.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 04:37:26 -0700 (PDT)
Subject: Re: [PATCH 1/1] media: uvcvideo: Support devices that report an OT as
 an entity source
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, John Nealy <jnealy3@yahoo.com>
References: <20210308103128.33173-1-hdegoede@redhat.com>
 <20210308103128.33173-2-hdegoede@redhat.com>
 <7974a22b-8b84-845e-4d2c-3650254a1a86@redhat.com>
 <YGRW7FO2n2t4wAxX@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7000176e-4819-b8f2-2152-ec1af4d4164d@redhat.com>
Date:   Wed, 31 Mar 2021 13:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YGRW7FO2n2t4wAxX@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 3/31/21 1:03 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Wed, Mar 31, 2021 at 12:38:07PM +0200, Hans de Goede wrote:
>> On 3/8/21 11:31 AM, Hans de Goede wrote:
>>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>> Some devices reference an output terminal as the source of extension
>>> units. This is incorrect, as output terminals only have an input pin,
>>> and thus can't be connected to any entity in the forward direction. The
>>> resulting topology would cause issues when registering the media
>>> controller graph. To avoid this problem, connect the extension unit to
>>> the source of the output terminal instead.
>>>
>>> While at it, and while no device has been reported to be affected by
>>> this issue, also handle forward scans where two output terminals would
>>> be connected together, and skip the terminals found through such an
>>> invalid connection.
>>>
>>> Reported-and-tested-by: John Nealy <jnealy3@yahoo.com>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Ping? This is a bug-fix which fixes a WARN triggering, causing many
>> users to see a backtrace in their kernel-logs and reporting bugs about this:
>>
>> https://bugzilla.redhat.com/buglist.cgi?quicksearch=mc-entity.c
>>
>> Currently shows 12 open bugs for this and this is not counting all the
>> ones which have already been triaged and matched as dups.
>>
>> As such it would be really good if we can get this merged and on
>> its way to 5.12-rc# as a fix for 5.12 (and to be backported to the
>> stable series).
> 
> The patch is included in "[GIT PULL FOR v5.13] Miscellaneous changes".

Ah I missed that.

> I have no personal issue with it being merged in v5.12-rc, but technically
> it's not a regression fix, is it ? I'll let Mauro decide what works best
> for him.

It is true that this is not a regression-fix but it is a bug-fix and for
a bug which users are actively hitting.

Regards,

Hans


> 
>>> ---
>>>  drivers/media/usb/uvc/uvc_driver.c | 32 ++++++++++++++++++++++++++++++
>>>  1 file changed, 32 insertions(+)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>> index 30ef2a3110f7..8df58f04dac6 100644
>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>> @@ -1716,6 +1716,31 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>>>  				return -EINVAL;
>>>  			}
>>>  
>>> +			/*
>>> +			 * Some devices reference an output terminal as the
>>> +			 * source of extension units. This is incorrect, as
>>> +			 * output terminals only have an input pin, and thus
>>> +			 * can't be connected to any entity in the forward
>>> +			 * direction. The resulting topology would cause issues
>>> +			 * when registering the media controller graph. To
>>> +			 * avoid this problem, connect the extension unit to
>>> +			 * the source of the output terminal instead.
>>> +			 */
>>> +			if (UVC_ENTITY_IS_OTERM(entity)) {
>>> +				struct uvc_entity *source;
>>> +
>>> +				source = uvc_entity_by_id(chain->dev,
>>> +							  entity->baSourceID[0]);
>>> +				if (!source) {
>>> +					uvc_dbg(chain->dev, DESCR,
>>> +						"Can't connect extension unit %u in chain\n",
>>> +						forward->id);
>>> +					break;
>>> +				}
>>> +
>>> +				forward->baSourceID[0] = source->id;
>>> +			}
>>> +
>>>  			list_add_tail(&forward->chain, &chain->entities);
>>>  			if (!found)
>>>  				uvc_dbg_cont(PROBE, " (->");
>>> @@ -1735,6 +1760,13 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>>>  				return -EINVAL;
>>>  			}
>>>  
>>> +			if (UVC_ENTITY_IS_OTERM(entity)) {
>>> +				uvc_dbg(chain->dev, DESCR,
>>> +					"Unsupported connection between output terminals %u and %u\n",
>>> +					entity->id, forward->id);
>>> +				break;
>>> +			}
>>> +
>>>  			list_add_tail(&forward->chain, &chain->entities);
>>>  			if (!found)
>>>  				uvc_dbg_cont(PROBE, " (->");
> 

