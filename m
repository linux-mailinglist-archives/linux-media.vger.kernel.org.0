Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6071743A1
	for <lists+linux-media@lfdr.de>; Sat, 29 Feb 2020 01:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgB2AAe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 19:00:34 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45370 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgB2AAd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 19:00:33 -0500
Received: by mail-pg1-f196.google.com with SMTP id m15so2296142pgv.12
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2020 16:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9Zd9E/Fz+wwx/C8qnBIs5S4g0v+U+O7Q5IPx+0wym6w=;
        b=tR/uh4BI0OVncWsta45ipT7OGHKseeLrXQueoD8lt7bDWJPK/aEPwCeBXkywgTzlt+
         QObs75XcGATqmAQ9iQzItDIQkgrr1LNB6IPC7xsI3X6pcs9fQ0yaBTziV0wS2tfGvwz9
         F0RYtsZ1pdHHn4SRuaZSnLqV48RQ7l2lNun8LOkBIQMFU7E98V90KjUuDS/l1VWAvYTd
         A1ZH7sJTXXL+5CkuaR7R7Yof9K9HJA5o6FHUp700lbPbvzHPTFTDdyePr17UCSY9y5uG
         nrsQCIAF/f7AjD5VewbmmpXDP4bh6mcCWTpOBHItSPKEy1EAzF2Cyv82VrJ/QvDBVfoo
         OiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9Zd9E/Fz+wwx/C8qnBIs5S4g0v+U+O7Q5IPx+0wym6w=;
        b=a314GVNLkV3kfCtzSbNhrGC2JDJBAjNMNp5h1h0x2HbnI8aZtoLUSNGLGD2uHJ4Eku
         fgRbihohkZynNzlUmjW29naG1/KiP1Hq/4uerjg7csJYpBRigQs+qWZ7sabIiSr7Y3OM
         goUVzmV9c6ZnSfJ2dsyDmKSwmNXPN9YvI44zw/lqFmfrg3PDZ8ph7YlEPrDfBXbKUh3d
         Epsk6GiUsW1NHlEGssQcjjhACQrDczvf1drmBL791nseqCi/dpInYX71TGk1BPom5Pmg
         IILHduTaNwQ//n3jwL6QnItDpV9RRxAV3OTgT04j5CAS0dDB4DE8jru9/PvrkxeRdn82
         Uw8g==
X-Gm-Message-State: APjAAAXYVG9O7mnTeUmcpDJROa1r3ayT9S/2VWiMeR5+cyWXR7YUlF4Q
        LDbISZcXXTXf8DOurF9B9gM=
X-Google-Smtp-Source: APXvYqyj0O9U8VK0f7q0tEHXKIysWlSKcSgvLTFUKZl9InyzWxIZ7Vn2cFlWYiiYUwwt5trx2GRbAg==
X-Received: by 2002:a62:1682:: with SMTP id 124mr6713875pfw.107.1582934432576;
        Fri, 28 Feb 2020 16:00:32 -0800 (PST)
Received: from [172.30.88.172] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id g10sm12574977pfo.166.2020.02.28.16.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 16:00:32 -0800 (PST)
Subject: Re: [RESEND PATCH v3 02/17] media: v4l2-fwnode: Pass notifier to
 v4l2_async_register_fwnode_subdev()
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
 <20200215194136.10131-3-slongerbeam@gmail.com>
 <20200225150721.GO5379@paasikivi.fi.intel.com>
 <c9b232d6-07c9-d13d-18aa-3e1e640aadc2@gmail.com>
 <20200228222710.GA1068@mara.localdomain>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <e7da904c-c246-42e4-0f18-a53c49d9a7bd@gmail.com>
Date:   Fri, 28 Feb 2020 16:00:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228222710.GA1068@mara.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/28/20 2:27 PM, Sakari Ailus wrote:
> Hi Steve,
>
> Btw. I think probably a smaller list of recipients would be just fine on the
> next version.

Yeah, I've been using get_maintainer.pl, without all the % LOC switches 
to try and limit the distro list, but even with those switches I suspect 
it will spam too many people.

>
> On Fri, Feb 28, 2020 at 10:16:06AM -0800, Steve Longerbeam wrote:
>> Hi Sakari,
>>
>> On 2/25/20 7:07 AM, Sakari Ailus wrote:
>>> Hi Steve,
>>>
>>> On Sat, Feb 15, 2020 at 11:41:21AM -0800, Steve Longerbeam wrote:
>>>> Instead of allocating a notifier in v4l2_async_register_fwnode_subdev(),
>>>> have the caller provide one. This allows the caller to implement
>>>> notifier ops (bind, unbind).
>>>>
>>>> The caller is now responsible for first initializing its notifier with a
>>>> call to v4l2_async_notifier_init().
>>>>
>>>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>>> Instead of improving v4l2_async_register_fwnode_subdev(), could you convert
>>> the users (IMX driver in this case) to call the preferred APIs instead? As
>>> the lines below show, v4l2_async_register_fwnode_subdev() has only two
>>> users left --- the other one of which is the IMX driver. After converting
>>> these two, we could just remove this API.
>>>
>>> See e.g. drivers/media/pci/intel/ipu3/ipu3-cio2.c and
>>> drivers/media/platform/omap3isp/isp.c for examples.
>> Shouldn't v4l2_async_notifier_add_fwnode_remote_subdev() check for the
>> availability of the remote before adding it to the notifier's asd list, as
>> in:
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-async.c
>> b/drivers/media/v4l2-core/v4l2-async.c
>> index 8bde33c21ce4..b48ed68c6c6c 100644
>> --- a/drivers/media/v4l2-core/v4l2-async.c
>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>> @@ -615,7 +615,7 @@ v4l2_async_notifier_add_fwnode_remote_subdev(struct
>> v4l2_async_notifier *notif,
>>          int ret;
>>
>>          remote = fwnode_graph_get_remote_port_parent(endpoint);
>> -       if (!remote)
>> +       if (!remote || !fwnode_device_is_available(remote))
>>                  return -ENOTCONN;
>>
>>          asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
>>
>>
>> Otherwise we are back to the problem that the notifier will never complete
>> because the remote's driver is not probed.
> fwnode_graph_get_endpoint_by_id() only gives you endpoints that belong to an
> enabled device (unless requested otherwise). So the there's need to check
> the same in v4l2-fwnode.c.

Indeed it does, thanks! I was looking at 
fwnode_graph_get_remote_port_parent() which does not make the enabled 
remote device checks, but didn't notice that 
fwnode_graph_get_endpoint_by_id() does, by default.

Steve
