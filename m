Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78CC26F74B
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 09:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgIRHqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 03:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgIRHqz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 03:46:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173DEC06174A;
        Fri, 18 Sep 2020 00:46:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o5so4560778wrn.13;
        Fri, 18 Sep 2020 00:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=yFk+JvF3q4RwCPKoNRSSxItnYyoYD/UyF/2b4GRygFU=;
        b=IOYXWBlK419Vy8CoIrD4OOAJuUXrpQ1NIEgPwHGxIT8DxIk3dgXj74mA+RLWzEwKDf
         Pzp+SlLNu9yEgI0+BuRYQAQ8Y+LYv1Jovbisw5PLloJotnpa7CfquqFbkkaZmYPN21c+
         OgPG/7tT3ITXPItNetVZOidfkXKhdehfoZb/lwW3BbfQ8EVSXb7X8UT44Mb5P7uVKvkz
         4M3BTvP0fOVbf2mSKiZFW4MihEoAfVdU3Q4b05QokOmcv6nfSVMbHAy7F5JJ4mrdToI1
         emZGopXsQagv8+tExsC9oshG/tWP/EWVr0TzxeXyxL/ab6mJOIQzdpIywSp52MqVWyqY
         wQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=yFk+JvF3q4RwCPKoNRSSxItnYyoYD/UyF/2b4GRygFU=;
        b=N/vYwPY11a0nH6c4NV6idBr4HXMOOkGrjS9dz40GFyWT8+nflQn2gAgBCrdCcBv01Z
         MI7waf4F9tfyatGOKXxogMuE3TriWQSF8KyCM7+YWRfvZXuEbH/7NpJ9e8zHRLelQY6D
         r9y0qpdKU0qCW00XmnlhHYC5PrUsokmCxMwrwE6oQIw5q/BvuCFXvFdKjm4eBIW4eTXQ
         wBMuXNOUR/nG1lbw1tEWXB+FIvWm5oznPAfpx+WknC68hemaP9h4/wWokMlZ03S5uqxR
         PTtdRQG3m7jUls2OTPHO7LaUPa8yf2iJBFH2ba0HjlKquM9M0j2C9ImlqxsW6mKzDT3N
         /7kQ==
X-Gm-Message-State: AOAM533zx9jTwrZnfEze3rtnjKRSEXfT7tjwo3yDVNEzS6S3u4FT1SfV
        znkgKcxAf7yffOBPn4GjDcw=
X-Google-Smtp-Source: ABdhPJzXPZMMHVCHdALfalKeJgwuQNkHMwr9nxhX9DPJBhuPpGPTwuC0pazs6KGtBPr6cmIeuyn4ZQ==
X-Received: by 2002:adf:aa84:: with SMTP id h4mr8412806wrc.426.1600415213716;
        Fri, 18 Sep 2020 00:46:53 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id z127sm3633541wmc.2.2020.09.18.00.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 00:46:53 -0700 (PDT)
Subject: Re: [PATCH v2] software_node: Add support for fwnode_graph*() family
 of functions
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        kieran.bingham@ideasonboard.com, jorhand@linux.microsoft.com,
        kitakar@gmail.com
References: <20200915232827.3416-1-djrscally@gmail.com>
 <20200916091707.GL834@valkosipuli.retiisi.org.uk>
 <7b81d743-736d-62d1-7072-d08759a0d5d7@gmail.com>
 <20200918062237.GP834@valkosipuli.retiisi.org.uk>
 <294db5cf-4c95-d56c-0a42-60ca95393c06@gmail.com>
 <20200918073433.GR834@valkosipuli.retiisi.org.uk>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <9cdd8073-430b-773a-6aa7-4698110a5416@gmail.com>
Date:   Fri, 18 Sep 2020 08:46:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918073433.GR834@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/09/2020 08:34, Sakari Ailus wrote:
> On Fri, Sep 18, 2020 at 07:49:31AM +0100, Dan Scally wrote:
>> Good morning
>>
>> On 18/09/2020 07:22, Sakari Ailus wrote:
>>> Hi Dan,
>>>
>>> On Wed, Sep 16, 2020 at 02:22:10PM +0100, Dan Scally wrote:
>>>> Hi Sakari - thanks for the comments
>>>>
>>>> On 16/09/2020 10:17, Sakari Ailus wrote:
>>>>> Moi Daniel and Heikki,
>>>>>
>>>>> On Wed, Sep 16, 2020 at 12:28:27AM +0100, Daniel Scally wrote:
>>>>>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>>>>
>>>>>> This implements the remaining .graph_* callbacks in the
>>>>>> fwnode operations vector for the software nodes. That makes
>>>>>> the fwnode_graph*() functions available in the drivers also
>>>>>> when software nodes are used.
>>>>>>
>>>>>> The implementation tries to mimic the "OF graph" as much as
>>>>>> possible, but there is no support for the "reg" device
>>>>>> property. The ports will need to have the index in their
>>>>>> name which starts with "port" (for example "port0", "port1",
>>>>>> ...) and endpoints will use the index of the software node
>>>>>> that is given to them during creation. The port nodes can
>>>>>> also be grouped under a specially named "ports" subnode,
>>>>>> just like in DT, if necessary.
>>>>>>
>>>>>> The remote-endpoints are reference properties under the
>>>>>> endpoint nodes that are named "remote-endpoint". 
>>>>>>
>>>>>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>>>> Co-developed-by: Daniel Scally <djrscally@gmail.com>
>>>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>>>> ---
>>>>>> changes in v2:
>>>>>> 	- added software_node_device_is_available
>>>>>> 	- altered software_node_get_next_child to get references
>>>>>> 	- altered software_node_get_next_endpoint to release references
>>>>>> 	to ports and avoid passing invalid combinations of swnodes to
>>>>>> 	software_node_get_next_child
>>>>>> 	- altered swnode_graph_find_next_port to release port rather than
>>>>>> 	old
>>>>>> 	
>>>>>>  drivers/base/swnode.c | 129 +++++++++++++++++++++++++++++++++++++++++-
>>>>>>  1 file changed, 127 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>>>>>> index 010828fc785b..d69034b807e3 100644
>>>>>> --- a/drivers/base/swnode.c
>>>>>> +++ b/drivers/base/swnode.c
>>>>>> @@ -363,6 +363,11 @@ static void software_node_put(struct fwnode_handle *fwnode)
>>>>>>  	kobject_put(&swnode->kobj);
>>>>>>  }
>>>>>>  
>>>>>> +static bool software_node_device_is_available(const struct fwnode_handle *fwnode)
>>>>>> +{
>>>>>> +	return is_software_node(fwnode);
>>>>> This basically tells whether the device is there. Are there software node
>>>>> based devices, i.e. do you need this?
>>>>>
>>>>> If you do really need this, then I guess this could just return true for
>>>>> now as if you somehow get here, the node is a software node anyway.
>>>> I do think its better to include it; I'm targeting using this with
>>>> ipu3-cio2; the cio2_parse_firmware() call there doesn't pass
>>>> FWNODE_GRAPH_DEVICE_DISABLED to fwnode_graph_get_endpoint_by_id() so
>>> I wonder if this has something to do with replacing the device's fwnode
>>> in the cio2-bridge patch.
>>>
>>> It's the device that needs to be enabled, and it's not a software node.
>>>
>> I think it is because of that yes, but I don't see a way around it at
>> the moment - unless there's a way to attach the software_node port and
>> endpoints that cio2-bridge creates to the device's existing firmware
>> instead.
> I thought this was how it was meant to be used?
>
> The secondary field is there for this purpose. But it may be not all fwnode
> interface functions operate on fwnode->secondary?
Let me test it; it might just require some changes to
software_node_graph_get_port_parent() to check if the parent fwnode is a
secondary, and if it is to return the primary instead.
