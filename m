Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4F426F91D
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 11:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgIRJWh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 05:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgIRJWh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 05:22:37 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF612C06174A;
        Fri, 18 Sep 2020 02:22:36 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x14so4856355wrl.12;
        Fri, 18 Sep 2020 02:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=E5BpK/F+b0P/TpJr5N6+aQWPOQQhjlTCjmTRzCMS6Mo=;
        b=FvM17U/yOj+lYSM2MMGtVTKqcHP03x6O9Ny721beV86SdYpP3UL4iOHciz+h+a6k5E
         gPCjCk1q3/Qza5wcNUu4ZPxzItptrcwhANoHXaH141Yx2NfgrNfACCJdaLwfzIguqVuy
         CqrcSrrusbVGpn985v0AcsH7cm7e46cpsgCgp+UUX2PaRBwjoWBgfWf34PeC+yDF5R3G
         YfK/rJcI6uZ/HN7ddjQ2Ow7yP1l5no+yMuytMaWJKDw6VKPQ1/WyX/G7gbdkE9S1CqRW
         Nm6Clb0B5eE+2qW6sPVjNookn6dzMXDtDiYoiw1QSnW5a7Mw2XqGLs6Oui0xagNhO/im
         wLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=E5BpK/F+b0P/TpJr5N6+aQWPOQQhjlTCjmTRzCMS6Mo=;
        b=JhJkYndRDPvkFSsSJbEIzur3aibLmTKSahjlvs0QAJlvBZZ38MIxtZ/tJp5dITRSI9
         I5IPKDLz1Lwh0EcqSMvgU+mKPTtg65ZX8cWTP3tCg2U6T9qLPEUxs/ZnqC05d+MrDupb
         p4jlgNCYfjBv29lz4SaPoIfj5oKQ8MaCx9d8af7IjjH5U25n0XMbLgwJAVE4BTX39kXI
         yok3E0sng770VFeKoHoL4v3P+gnMH1huU7ZgEI5JPnPF+DouFKxJSujVVGSYxLm5OSRx
         CkeGBa42Bf5uK32SyWBVhwiSXI2GZv+fU1GY9j95Ru+G7N/Dpp8nYa9LrZiRMgKDRTZl
         E15Q==
X-Gm-Message-State: AOAM532MP1FVsZtCxRjzvdAoeAa7h6U4hAgFJwiTS/ZFqrhavzTk5I0C
        QEdt2ApsSHonM6oYp9/kTDo=
X-Google-Smtp-Source: ABdhPJxgvFcJjoAPB8kRjGQT3yTFIvS5yt89WL+uNm47FlOSfJugm574MH/0JTTaBGycAmAPVLwa1g==
X-Received: by 2002:adf:d845:: with SMTP id k5mr34224610wrl.285.1600420955486;
        Fri, 18 Sep 2020 02:22:35 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id o129sm4066052wmb.27.2020.09.18.02.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 02:22:34 -0700 (PDT)
Subject: Re: [PATCH v2] software_node: Add support for fwnode_graph*() family
 of functions
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, kieran.bingham@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com
References: <20200915232827.3416-1-djrscally@gmail.com>
 <20200916091707.GL834@valkosipuli.retiisi.org.uk>
 <7b81d743-736d-62d1-7072-d08759a0d5d7@gmail.com>
 <20200918062237.GP834@valkosipuli.retiisi.org.uk>
 <294db5cf-4c95-d56c-0a42-60ca95393c06@gmail.com>
 <20200918073433.GR834@valkosipuli.retiisi.org.uk>
 <9cdd8073-430b-773a-6aa7-4698110a5416@gmail.com>
 <20200918075741.GS834@valkosipuli.retiisi.org.uk>
 <20200918085709.GA1630537@kuha.fi.intel.com>
 <20200918091501.GT834@valkosipuli.retiisi.org.uk>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <db617474-93eb-ccd1-0c39-c971fd96124e@gmail.com>
Date:   Fri, 18 Sep 2020 10:22:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918091501.GT834@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 18/09/2020 10:15, Sakari Ailus wrote:
> On Fri, Sep 18, 2020 at 11:57:09AM +0300, Heikki Krogerus wrote:
>> On Fri, Sep 18, 2020 at 10:57:41AM +0300, Sakari Ailus wrote:
>>> On Fri, Sep 18, 2020 at 08:46:52AM +0100, Dan Scally wrote:
>>>> On 18/09/2020 08:34, Sakari Ailus wrote:
>>>>> On Fri, Sep 18, 2020 at 07:49:31AM +0100, Dan Scally wrote:
>>>>>> Good morning
>>>>>>
>>>>>> On 18/09/2020 07:22, Sakari Ailus wrote:
>>>>>>> Hi Dan,
>>>>>>>
>>>>>>> On Wed, Sep 16, 2020 at 02:22:10PM +0100, Dan Scally wrote:
>>>>>>>> Hi Sakari - thanks for the comments
>>>>>>>>
>>>>>>>> On 16/09/2020 10:17, Sakari Ailus wrote:
>>>>>>>>> Moi Daniel and Heikki,
>>>>>>>>>
>>>>>>>>> On Wed, Sep 16, 2020 at 12:28:27AM +0100, Daniel Scally wrote:
>>>>>>>>>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>>>>>>>>
>>>>>>>>>> This implements the remaining .graph_* callbacks in the
>>>>>>>>>> fwnode operations vector for the software nodes. That makes
>>>>>>>>>> the fwnode_graph*() functions available in the drivers also
>>>>>>>>>> when software nodes are used.
>>>>>>>>>>
>>>>>>>>>> The implementation tries to mimic the "OF graph" as much as
>>>>>>>>>> possible, but there is no support for the "reg" device
>>>>>>>>>> property. The ports will need to have the index in their
>>>>>>>>>> name which starts with "port" (for example "port0", "port1",
>>>>>>>>>> ...) and endpoints will use the index of the software node
>>>>>>>>>> that is given to them during creation. The port nodes can
>>>>>>>>>> also be grouped under a specially named "ports" subnode,
>>>>>>>>>> just like in DT, if necessary.
>>>>>>>>>>
>>>>>>>>>> The remote-endpoints are reference properties under the
>>>>>>>>>> endpoint nodes that are named "remote-endpoint". 
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>>>>>>>> Co-developed-by: Daniel Scally <djrscally@gmail.com>
>>>>>>>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>>>>>>>> ---
>>>>>>>>>> changes in v2:
>>>>>>>>>> 	- added software_node_device_is_available
>>>>>>>>>> 	- altered software_node_get_next_child to get references
>>>>>>>>>> 	- altered software_node_get_next_endpoint to release references
>>>>>>>>>> 	to ports and avoid passing invalid combinations of swnodes to
>>>>>>>>>> 	software_node_get_next_child
>>>>>>>>>> 	- altered swnode_graph_find_next_port to release port rather than
>>>>>>>>>> 	old
>>>>>>>>>> 	
>>>>>>>>>>  drivers/base/swnode.c | 129 +++++++++++++++++++++++++++++++++++++++++-
>>>>>>>>>>  1 file changed, 127 insertions(+), 2 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>>>>>>>>>> index 010828fc785b..d69034b807e3 100644
>>>>>>>>>> --- a/drivers/base/swnode.c
>>>>>>>>>> +++ b/drivers/base/swnode.c
>>>>>>>>>> @@ -363,6 +363,11 @@ static void software_node_put(struct fwnode_handle *fwnode)
>>>>>>>>>>  	kobject_put(&swnode->kobj);
>>>>>>>>>>  }
>>>>>>>>>>  
>>>>>>>>>> +static bool software_node_device_is_available(const struct fwnode_handle *fwnode)
>>>>>>>>>> +{
>>>>>>>>>> +	return is_software_node(fwnode);
>>>>>>>>> This basically tells whether the device is there. Are there software node
>>>>>>>>> based devices, i.e. do you need this?
>>>>>>>>>
>>>>>>>>> If you do really need this, then I guess this could just return true for
>>>>>>>>> now as if you somehow get here, the node is a software node anyway.
>>>>>>>> I do think its better to include it; I'm targeting using this with
>>>>>>>> ipu3-cio2; the cio2_parse_firmware() call there doesn't pass
>>>>>>>> FWNODE_GRAPH_DEVICE_DISABLED to fwnode_graph_get_endpoint_by_id() so
>>>>>>> I wonder if this has something to do with replacing the device's fwnode
>>>>>>> in the cio2-bridge patch.
>>>>>>>
>>>>>>> It's the device that needs to be enabled, and it's not a software node.
>>>>>>>
>>>>>> I think it is because of that yes, but I don't see a way around it at
>>>>>> the moment - unless there's a way to attach the software_node port and
>>>>>> endpoints that cio2-bridge creates to the device's existing firmware
>>>>>> instead.
>>>>> I thought this was how it was meant to be used?
>>>>>
>>>>> The secondary field is there for this purpose. But it may be not all fwnode
>>>>> interface functions operate on fwnode->secondary?
>>>> Let me test it; it might just require some changes to
>>>> software_node_graph_get_port_parent() to check if the parent fwnode is a
>>>> secondary, and if it is to return the primary instead.
>>> Ah, indeed. I forgot this part. I wonder if it'd cause issues to return the
>>> primary if you've got the secondary swnode.
>>>
>>> Heikki, any idea?
>>>
>>> Code elsewhere (e.g. V4L2 fwnode framework + drivers) assume a device is
>>> identified by a single fwnode, not two --- currently the swnode graph
>>> function returning port parent returns the secondary so there's no match
>>> with the primary fwnode.
>> Sorry I don't think I understand the scenario here, but never return
>> the primary node when the software node is the secondary from the
>> software node API! The software node functions deal and return
>> software nodes, and nothing else, just like ACPI deals with ACPI nodes
>> only and DT deals with OF nodes only. We must never jump between the
>> fwnode types at this level. That also means that if you want to
>> describe the device graph with software nodes, then every node in the
>> graph, starting from the port parents, must be a software node.
>> Whether or not the node is secondary is irrelevant. But I guess this
>> is not a problem here (or is it?).
> The way software nodes work (as in this patch) is not consistent with DT or
> ACPI. For instance, the parent of the port node, returned by
> software_node_graph_get_port_parent() is fwnode->secondary of the device,
> not device's fwnode.
At the moment this isn't the case; at least in the cio2-bridge, I've
been setting the device's _primary_ fwnode to the software_node that the
driver creates. Sorry to confuse things; I thought you were suggesting I
set the software node as fwnode->secondary of the device instead, and
arrange it so that when other bits of code fetch the "device node" via
software_node_get_port_parent() it returns the primary rather than the
software_node secondary, meaning we wouldn't need
software_node_device_is_available() because when something calls
fwnode_device_is_available() it would be using the existing device
firmware node instead of the software node.
> This is not expected by the users of the fwnode property API.
>
> Also, it leads to drivers only seeing the software nodes while DT and ACPI
> nodes as well as properties would be hidden.
>
>> Considering the secondary node will unfortunately need to be done by
>> the callers of fwnode API when the fwnode API can't take care of that.
> What problems would there be in returning the primary fwnode?
>
