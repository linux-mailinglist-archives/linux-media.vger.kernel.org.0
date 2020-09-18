Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA01A26F650
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 08:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgIRGtf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 02:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgIRGtf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 02:49:35 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B475C06174A;
        Thu, 17 Sep 2020 23:49:34 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a9so4390441wmm.2;
        Thu, 17 Sep 2020 23:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gl31Vz0Qu3gnpjITN3ncNvLtxtgnjI7UU4LRB6PyYkU=;
        b=aKY980E8i5gpTLSWv2LQWNH26umlv6/7nlqnZttch890S1f2qUT6tXmpjezy6474ke
         XoTgNKp+BFCTHv6o8Q48P31nAoiVRbQ+wSJUHwAkuOFt3TlHT5O7ntecTOFjcmKdXal6
         haPy0kQEZRyfMqtVGuPhsiA+Je+z0nX9t+cbHAKO55LTsInO2dmsbfHjDR1GWES8B11J
         l0gfDD+ysqgQbAUnnMCnk9/5Rg7bKd4vDjYdXh51EFuM0h/wVtAc0K4YLllqGc6PieMq
         tniKan7Z3xeR5i0fjD1Ct368gegLcNpio7EietQiR/N58tCgcqkmgbaX7T2r7hXPDDu+
         9fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gl31Vz0Qu3gnpjITN3ncNvLtxtgnjI7UU4LRB6PyYkU=;
        b=NiWUxM9sbQeL6vuWU78Z3CTs6iio7QgjvwSYCCnoJTLvO9VqRVoA9K0qEjMfr3lXo7
         hwBfWoOBmjtYov0Wi8EwqRn9jEhp9wommPAFpec9Fa30uptUE59icxGI/x3B/W336O+G
         BYkr3LzXDm+ujUM1dtfmhGNGNz7brLMSVIjb4Lfj2WZrkBbbPs0evAki2ZM+rnLMiFrt
         rJ6Ul1Q5EsBWkaqZfU/8DyZUdtW8pwg4p1wEG07uzc6RLMd2PPOXeralx20VN7lWjpEB
         SN2AVgcfM9ybM5p9E6BMRtotcHe8uIQT7IMxwRKhCzyFGpAGnOWDAg5byJv7xtH44lJE
         9bEA==
X-Gm-Message-State: AOAM531WWEOdFQXJpxYJZJDTM5VhP+8gwOdl5ANz8V5xD56kTmmGEd19
        xlv98NrR8W6eW6vamqQEJ0I=
X-Google-Smtp-Source: ABdhPJw/HmMOI8wjwm8z08w6Ems+gxy3hl8qKY3butFyivlGQVbLS1uxQcIjx3riM6ZLdFZAqwYCMQ==
X-Received: by 2002:a05:600c:2155:: with SMTP id v21mr14515178wml.118.1600411773212;
        Thu, 17 Sep 2020 23:49:33 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id c4sm3280604wrp.85.2020.09.17.23.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 23:49:32 -0700 (PDT)
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
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <294db5cf-4c95-d56c-0a42-60ca95393c06@gmail.com>
Date:   Fri, 18 Sep 2020 07:49:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918062237.GP834@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good morning

On 18/09/2020 07:22, Sakari Ailus wrote:
> Hi Dan,
>
> On Wed, Sep 16, 2020 at 02:22:10PM +0100, Dan Scally wrote:
>> Hi Sakari - thanks for the comments
>>
>> On 16/09/2020 10:17, Sakari Ailus wrote:
>>> Moi Daniel and Heikki,
>>>
>>> On Wed, Sep 16, 2020 at 12:28:27AM +0100, Daniel Scally wrote:
>>>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>>
>>>> This implements the remaining .graph_* callbacks in the
>>>> fwnode operations vector for the software nodes. That makes
>>>> the fwnode_graph*() functions available in the drivers also
>>>> when software nodes are used.
>>>>
>>>> The implementation tries to mimic the "OF graph" as much as
>>>> possible, but there is no support for the "reg" device
>>>> property. The ports will need to have the index in their
>>>> name which starts with "port" (for example "port0", "port1",
>>>> ...) and endpoints will use the index of the software node
>>>> that is given to them during creation. The port nodes can
>>>> also be grouped under a specially named "ports" subnode,
>>>> just like in DT, if necessary.
>>>>
>>>> The remote-endpoints are reference properties under the
>>>> endpoint nodes that are named "remote-endpoint". 
>>>>
>>>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>> Co-developed-by: Daniel Scally <djrscally@gmail.com>
>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>> ---
>>>> changes in v2:
>>>> 	- added software_node_device_is_available
>>>> 	- altered software_node_get_next_child to get references
>>>> 	- altered software_node_get_next_endpoint to release references
>>>> 	to ports and avoid passing invalid combinations of swnodes to
>>>> 	software_node_get_next_child
>>>> 	- altered swnode_graph_find_next_port to release port rather than
>>>> 	old
>>>> 	
>>>>  drivers/base/swnode.c | 129 +++++++++++++++++++++++++++++++++++++++++-
>>>>  1 file changed, 127 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>>>> index 010828fc785b..d69034b807e3 100644
>>>> --- a/drivers/base/swnode.c
>>>> +++ b/drivers/base/swnode.c
>>>> @@ -363,6 +363,11 @@ static void software_node_put(struct fwnode_handle *fwnode)
>>>>  	kobject_put(&swnode->kobj);
>>>>  }
>>>>  
>>>> +static bool software_node_device_is_available(const struct fwnode_handle *fwnode)
>>>> +{
>>>> +	return is_software_node(fwnode);
>>> This basically tells whether the device is there. Are there software node
>>> based devices, i.e. do you need this?
>>>
>>> If you do really need this, then I guess this could just return true for
>>> now as if you somehow get here, the node is a software node anyway.
>> I do think its better to include it; I'm targeting using this with
>> ipu3-cio2; the cio2_parse_firmware() call there doesn't pass
>> FWNODE_GRAPH_DEVICE_DISABLED to fwnode_graph_get_endpoint_by_id() so
> I wonder if this has something to do with replacing the device's fwnode
> in the cio2-bridge patch.
>
> It's the device that needs to be enabled, and it's not a software node.
>
I think it is because of that yes, but I don't see a way around it at
the moment - unless there's a way to attach the software_node port and
endpoints that cio2-bridge creates to the device's existing firmware
instead.
