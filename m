Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E85405FC1B1
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 10:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbiJLIPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 04:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiJLIPr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 04:15:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2465B2124C
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 01:15:45 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8CE44DB;
        Wed, 12 Oct 2022 10:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665562543;
        bh=DisRY+K6oxJr2GGWDyKlDWW8RkP1xLgHG5J2Q9b7sVM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=mixVB68RFsBiJvSjXVdul7exp172NwuCyPZ/aceyANzTWp+BBwltlMxZQ9p42zVKj
         njKS4Tk3Y+ZmZyb1ehZokBk3zKdDMlHwWuRzPwfv0hg8++Aos4EX+8JZ8DZ4utyBdP
         bVMyee0KrXvrz87SLmJgQyp+ojkvaQ1WB/go57qw=
Message-ID: <102a3843-b473-de0a-8d47-087602380f67@ideasonboard.com>
Date:   Wed, 12 Oct 2022 11:15:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v15 05/19] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-6-tomi.valkeinen@ideasonboard.com>
 <7b56d565-5358-67be-84b8-101a97f97f2b@xs4all.nl>
 <Yztb06LVmPBKf8J2@paasikivi.fi.intel.com>
 <eea402df-7468-f9fc-ed05-8581ea67f5d3@xs4all.nl>
 <YzwFhYtzh8hPoAYv@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YzwFhYtzh8hPoAYv@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 04/10/2022 13:05, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Oct 04, 2022 at 10:43:55AM +0200, Hans Verkuil wrote:
>> Hi Sakari,
>>
>> On 10/4/22 00:01, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Mon, Oct 03, 2022 at 04:26:32PM +0200, Hans Verkuil wrote:
>>>>> +#define V4L2_SUBDEV_ROUTE_FL_SOURCE		(1U << 1)
>>>>
>>>> Can we rename this to _FL_INTERNAL_SOURCE? Just 'SOURCE' is very confusing
>>>> IMHO. The name 'INTERNAL_SOURCE' makes it clear that it is generated internally,
>>>> and so does not come from an external sink-side endpoint.
>>>>
>>>> I also think that the documentation for this flag in patch 04/19 is very vague,
>>>> I'll comment on that patch as well.
>>>
>>> Having descriptive names is important but I think "SOURCE" as such is fine
>>> for the purpose. Adding "INTERNAL_" adds 9 characters to what is already a
>>> very long name, making the flag very clumsy to use in code. That's why I
>>> would prefer to keep it as-is.
>>>
>>
>> _FL_SOURCE is meaningless (at least to me): there are so many 'source' and 'sink'
>> references, that just plain 'SOURCE' doesn't help me understand what the flag
>> means. I did consider INT_SOURCE, but I thought 'INT' is too close to 'interrupt'.
>> I'm OK with that, though.
>>
>> Another alternative would be _FL_NO_SINK: that clearly conveys that 1) there is
>> no sink, and implies that 2) the source is internally generated.
>>
>> Or perhaps: _FL_SOURCE_ONLY?
> 
> This appears as the best compromise IMO. NO_SINK is shorter but conveying
> the meaning through negation is what I don't like too much.
> 

SOURCE_ONLY sounds fine to me.

  Tomi

