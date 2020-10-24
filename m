Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8C9297D7B
	for <lists+linux-media@lfdr.de>; Sat, 24 Oct 2020 18:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761912AbgJXQdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Oct 2020 12:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759990AbgJXQdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Oct 2020 12:33:35 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2821CC0613CE;
        Sat, 24 Oct 2020 09:33:35 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g12so6390934wrp.10;
        Sat, 24 Oct 2020 09:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CBg45YaLqj05DCwpL99agm9FEnG/t1KM38XkqPzqows=;
        b=o6TlJeLGkxqCkuUcePECuQkK+uJZZJZaXudPzTifjAAWFm4c6em/phqnJEnH1+B4W9
         LFNZODu2lk5cH5wAzOiWWpmCcCTjIQlktoEU2mr1IzAiRVCrBTgWPhNg/eiPI5zIUa1O
         Mee5qSvqk6WRAH2TuRkCEix1B2V5YJEnyrz+/NMRQAagsXYhgYBsQhFXuaxfFHV+ppgW
         Dq4d9zIOxl4hk68NHa8zaiwvgdxkgJJKc7GKR7Mh4OakfW0WACz1A2zDKp2FGxPrOH8v
         SeOhZWIO2XaVygEon3zTLrAcNvtferSx9ifx/imBjlIgyi6U2SuN7KnuqqGczZfKX8Hr
         ogGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CBg45YaLqj05DCwpL99agm9FEnG/t1KM38XkqPzqows=;
        b=Pc85kMpwiA4X0LmnvnIO5Zi1RCOwiYnXAlQK0dqzoKMy9Qf3CGFw95+/vQbUB3HQKS
         Dv2YT7/oI3l3b5fb/Hk8yDFa6fn7URSQfScDFCMSbL6ROX7Th8YbSGaSAqaggb4J9cNq
         qfH+KcumcZ7nZw2kwl6G+1Q2gTS0BrFFWWKXWHo+vHOBmQNqTMd+8KP0gbo5pti2N9Xe
         wrhqhnHTmMdyo5LijnkT/GgIBIikt4JWvBlCabmXNGRdJiyex38GyrLOy5Aw0enk3cF9
         3ILsNOx4lH/q2kleV6qbcTqmS8L3eGcvGHCYcazZsMpZtFcQgfOHbRMsuUGCrt3neuw/
         UUIw==
X-Gm-Message-State: AOAM533AAeFED8HA9th1MqnFZ8FgOpG26wbqRXpxLht4U4DYVEp8TaFF
        1nEJZ4vo/1Cwx7M/kI+/Ak0=
X-Google-Smtp-Source: ABdhPJzz1FcEpDtVkCl+R+jd0TRcwl6G9MM1vxTzeK7ALAjOVFuqjm3Pl0Hs4ViTu+k5yl7CZqCvgg==
X-Received: by 2002:a5d:4141:: with SMTP id c1mr8321634wrq.113.1603557213874;
        Sat, 24 Oct 2020 09:33:33 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.56])
        by smtp.gmail.com with ESMTPSA id f6sm11106223wru.50.2020.10.24.09.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2020 09:33:33 -0700 (PDT)
Subject: Re: [RFC PATCH v3 7/9] ipu3-cio2: Check if pci_dev->dev's fwnode is a
 software_node in cio2_parse_firmware() and set FWNODE_GRAPH_DEVICE_DISABLED
 if so
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, yong.zhi@intel.com, rafael@kernel.org,
        gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-8-djrscally@gmail.com>
 <20201020091958.GC4077@smile.fi.intel.com>
 <20201020120615.GV13341@paasikivi.fi.intel.com>
 <32bbb4db-17d7-b9d1-950f-8f29d67539c3@gmail.com>
 <20201020224910.GB2703@paasikivi.fi.intel.com>
 <20201024003955.GS5979@pendragon.ideasonboard.com>
 <20201024142907.GB26150@paasikivi.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <cb717718-8d84-8213-31d1-a1b342bb78a0@gmail.com>
Date:   Sat, 24 Oct 2020 17:33:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201024142907.GB26150@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/10/2020 15:29, Sakari Ailus wrote:
> On Sat, Oct 24, 2020 at 03:39:55AM +0300, Laurent Pinchart wrote:
>> Hi Sakari
>>
>> On Wed, Oct 21, 2020 at 01:49:10AM +0300, Sakari Ailus wrote:
>>> On Tue, Oct 20, 2020 at 08:56:07PM +0100, Dan Scally wrote:
>>>> On 20/10/2020 13:06, Sakari Ailus wrote:
>>>>> On Tue, Oct 20, 2020 at 12:19:58PM +0300, Andy Shevchenko wrote:
>>>>>> On Mon, Oct 19, 2020 at 11:59:01PM +0100, Daniel Scally wrote:
>>>>>>> fwnode_graph_get_endpoint_by_id() will optionally parse enabled devices
>>>>>>> only; that status being determined through the .device_is_available() op
>>>>>>> of the device's fwnode. As software_nodes don't have that operation and
>>>>>>> adding it is meaningless, we instead need to check if the device's fwnode
>>>>>>> is a software_node and if so pass the appropriate flag to disable that
>>>>>>> check
>>>>>> Period.
>>>>>>
>>>>>> I'm wondering if actually this can be hidden in fwnode_graph_get_endpoint_by_id().
>>>>> The device availability test is actually there for a reason. Some firmware
>>>>> implementations put all the potential devices in the tables and only one
>>>>> (of some) of them are available.
>>>>>
>>>>> Could this be implemented so that if the node is a software node, then get
>>>>> its parent and then see if that is available?
>>>>>
>>>>> I guess that could be implemented in software node ops. Any opinions?
>>>> Actually when considering the cio2 device, it seems that
>>>> set_secondary_fwnode() actually overwrites the _primary_, given
>>>> fwnode_is_primary(dev->fwnode) returns false. So in at least some cases,
>>>> this wouldn't work.
>>> Ouch. I wonder when this happens --- have you checked what's the primary
>>> there? I guess it might be if it's a PCI device without the corresponding
>>> ACPI device node?
>>>
>>> I remember you had an is_available implementation that just returned true
>>> for software nodes in an early version of the set? I think it would still
>>> be a lesser bad in this case.
>> How about the following ?
> Looks good to me.
If we're agreed on this (and it's fine by me too), do you want me to
include it in the next set, or are you going to do it separately Laurent?
>> diff --git a/drivers/base/property.c b/drivers/base/property.c
>> index 81bd01ed4042..ea44ba846299 100644
>> --- a/drivers/base/property.c
>> +++ b/drivers/base/property.c
>> @@ -706,9 +706,14 @@ EXPORT_SYMBOL_GPL(fwnode_handle_put);
>>  /**
>>   * fwnode_device_is_available - check if a device is available for use
>>   * @fwnode: Pointer to the fwnode of the device.
>> + *
>> + * For fwnode node types that don't implement the .device_is_available()
>> + * operation, such as software nodes, this function returns true.
>>   */
>>  bool fwnode_device_is_available(const struct fwnode_handle *fwnode)
>>  {
>> +	if (!fwnode_has_op(fwnode, device_is_available))
>> +		return true;
>>  	return fwnode_call_bool_op(fwnode, device_is_available);
>>  }
>>  EXPORT_SYMBOL_GPL(fwnode_device_is_available);
>>
