Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FB226F8F7
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 11:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgIRJK2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 05:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgIRJK1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 05:10:27 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B371C06174A;
        Fri, 18 Sep 2020 02:10:27 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q9so4580705wmj.2;
        Fri, 18 Sep 2020 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=C9AfsNrHq4GIpwarAyi5PbFBpQ+RP4M4/w1DNoZg/Ns=;
        b=JZH8ZB30y7qezZ3HzjvUD3sEImLJ3EGcxrf1zLhLnfUbOWfTCS25E4VW9b1rOcmiNa
         yqrbsbCA+5skPUVBAqaRemVlhO0EiVru7Dl240f0Z1ASn3THOaPvSaB+s/MgO7hhjfGp
         OwX7jJWXZztIc9HHb5UY0PAF33cyGH9zlSgLdD1Nj98gq4Xdv+jdTvk85y2A0ov/h+Pn
         62gYt3q6sOyR4ERSEstZVQ70FFR4ZRbz5uMWFN1VuQb3gBzZRf5r8eWKtGW0u75kJaz7
         Tm5zLHbdNthQrSBH7RxuyoZ1tNfgjNbfuEtFpRX/GKvlprCVwknTqz2Q1W5PSZb4fVP3
         lMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=C9AfsNrHq4GIpwarAyi5PbFBpQ+RP4M4/w1DNoZg/Ns=;
        b=IKGgwAQEiozl2lCx7lD6NQKLbgJhpCfK4yFrexiD7xxWD6I1MpbHFzFzMf15j1Ijs1
         RESmnPC9ATfdxLkcfCzZ4PxPOgcsGhKB2aWZjjGgLgag2dL4RAIwHAz6nn+fGjllFP3N
         n0i4gokUjaLryBZRa18FeBn4HDAl52qesTXGuunIR8HdPaiqf0QVCfWFRfzmsgvmTydW
         zsX5cLrzzklB0kgY6rhL7DB99ztzhO/yj7WHM1aEXYXDKiSmohsBLNiXpPr4Vf+E/RVz
         2/bbowy1fw1lP4LMzWvZLFgHRC63y5ocAPEeNmSEgjHiXP1hp71y16DinLxW5jDzIAHn
         FWWg==
X-Gm-Message-State: AOAM533pcjNPyYn3+FcSdRfjcHGOYxpeLLwogxtnJZEvn+KVGQ+v+mCn
        5fTS3x3EHKxSvDa/JCjmsAeNgbUGobzUMvx5
X-Google-Smtp-Source: ABdhPJx5PVew7+go1XkdctWu1S2tCikXSHThYFekhMutunx7T8uMI0x96tcHyjD57fQuxsbHxi8PNA==
X-Received: by 2002:a1c:5a86:: with SMTP id o128mr13874416wmb.129.1600420225886;
        Fri, 18 Sep 2020 02:10:25 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id s26sm3860201wmh.44.2020.09.18.02.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 02:10:25 -0700 (PDT)
Subject: Re: [PATCH v2] software_node: Add support for fwnode_graph*() family
 of functions
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
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
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <a4040e77-dc07-51d8-1970-76900d937722@gmail.com>
Date:   Fri, 18 Sep 2020 10:10:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918085709.GA1630537@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 18/09/2020 09:57, Heikki Krogerus wrote:
> On Fri, Sep 18, 2020 at 10:57:41AM +0300, Sakari Ailus wrote:
>> On Fri, Sep 18, 2020 at 08:46:52AM +0100, Dan Scally wrote:
>>> On 18/09/2020 08:34, Sakari Ailus wrote:
>>>> On Fri, Sep 18, 2020 at 07:49:31AM +0100, Dan Scally wrote:
>>>>> Good morning
>>>>>
>>>>> On 18/09/2020 07:22, Sakari Ailus wrote:
>>>>>> I wonder if this has something to do with replacing the device's fwnode
>>>>>> in the cio2-bridge patch.
>>>>>>
>>>>>> It's the device that needs to be enabled, and it's not a software node.
>>>>>>
>>>>> I think it is because of that yes, but I don't see a way around it at
>>>>> the moment - unless there's a way to attach the software_node port and
>>>>> endpoints that cio2-bridge creates to the device's existing firmware
>>>>> instead.
>>>> I thought this was how it was meant to be used?
>>>>
>>>> The secondary field is there for this purpose. But it may be not all fwnode
>>>> interface functions operate on fwnode->secondary?
>>> Let me test it; it might just require some changes to
>>> software_node_graph_get_port_parent() to check if the parent fwnode is a
>>> secondary, and if it is to return the primary instead.
>> Ah, indeed. I forgot this part. I wonder if it'd cause issues to return the
>> primary if you've got the secondary swnode.
>>
>> Heikki, any idea?
>>
>> Code elsewhere (e.g. V4L2 fwnode framework + drivers) assume a device is
>> identified by a single fwnode, not two --- currently the swnode graph
>> function returning port parent returns the secondary so there's no match
>> with the primary fwnode.
> Sorry I don't think I understand the scenario here, but never return
> the primary node when the software node is the secondary from the
> software node API! The software node functions deal and return
> software nodes, and nothing else, just like ACPI deals with ACPI nodes
> only and DT deals with OF nodes only. We must never jump between the
> fwnode types at this level. That also means that if you want to
> describe the device graph with software nodes, then every node in the
> graph, starting from the port parents, must be a software node.
> Whether or not the node is secondary is irrelevant. But I guess this
> is not a problem here (or is it?).
>
> Considering the secondary node will unfortunately need to be done by
> the callers of fwnode API when the fwnode API can't take care of that.
>
Alright, so if we want to attach software nodes as secondaries to a
devices existing fwnode we'd need to modify things like
fwnode_graph_get_next_endpoint_by_id() [1] to consider whether the
returned node was a software_node secondary when they try to get the
device's node to run *is_available()


I did sort of wonder whether this was the right approach before, but
there's other comments [2] in the source that reassured me, for example
device_add_properties():

>  * WARNING: The callers should not use this function if it is known that there
>  * is no real firmware node associated with @dev! In that case the callers
>  * should create a software node and assign it to @dev directly.


[1]
https://elixir.bootlin.com/linux/latest/source/drivers/base/property.c#L1126

[2]
https://elixir.bootlin.com/linux/latest/source/drivers/base/property.c#L541

